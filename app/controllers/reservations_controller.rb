class ReservationsController < InheritedResources::Base
	before_action :authenticate_user!

  private

    def reservation_params
      params.require(:reservation).permit(:user_id, :forum_id, :fechaclase, :horaclase)
    end
end

