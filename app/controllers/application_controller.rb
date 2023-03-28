class ApplicationController < ActionController::API


    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end



#    Authorization: Bearer "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzIn0.AOXUao_6a_LbIcwkaZU574fPqvW6mPvHhwKC7Fatuws" 

 
    def decode_token
        auth_header = request.headers["Authorization"]
        if  auth_header 
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'secret', true, algorithm: 'HS256')
            rescue
                nil
            end
        end
    end

    def authorize_user
        decode_token = decode_token()
        if decode_token
            user_id = decode_token[0][user_id]
            @user = User.find_by(id: user_id)
        end
    end

    def authorize
        render json: {message: 'You have to be logged in'}, status: :unauthorized unless authorize_user
    end


end
