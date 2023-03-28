class ApplicationController < ActionController::API


    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end



#    Authorization: Bearer "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzIn0.AOXUao_6a_LbIcwkaZU574fPqvW6mPvHhwKC7Fatuws" 
 
    def decode_token
        auth_header = request_headers["Authorization"]
        if
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'secret', true, algorithm: 'HS256')
            rescue
                nil
            end
        end
    end
end
