function DataService() as object
    if (m._DataSingleton = invalid)
        prototype = EventDispatcher()

        prototype.LOAD_SUCCESS = "Service.LOAD_SUCCESS"
        prototype.LOAD_SERVICE_FAIL = "Service.LOAD_SERVICE_FAIL"

        prototype.requestDataHomeService = function()
            BASE_URL = "https://cdn-media.brightline.tv/recruiting/roku/testapi.json"
            requestHeaders = {}

            options = {
                location: BASE_URL,
                method: "GET",
            }
            ' Need to create a task
            request = CreateObject("roUrlTransfer")
            request.SetUrl(options.location)
            request.setRequest(options.method)

            port = CreateObject("roMessagePort")
            request.SetMessagePort(port)
            request.retainBodyOnError(true)
            request.EnableEncodings(true)

            if (request.AsyncGetToString())
                response = port.waitMessage(10000)

                response_obj = {}

                response_obj.data = response.getString()
                response_obj.code = response.getResponseCode()
                response_obj.headers = response.getResponseHeaders()

                response_obj_as_json_str = FormatJson(response_obj)

                m.dispatchEvent(m.LOAD_SUCCESS, response_obj_as_json_str)

            endif

        end function

        m._DataSingleton = prototype
    end if

    return m._DataSingleton
end function

function DestroyDataService() as void
    if (m._DataSingleton <> invalid)
        m._DataSingleton = invalid
    end if
end function