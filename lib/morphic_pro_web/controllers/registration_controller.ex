defmodule MorphicProWeb.RegistrationController do
  use MorphicProWeb, :controller
  alias PowEmailConfirmation.{Phoenix, Plug}

  def resend_confirmation_email(conn, _params) do
    case Plug.pending_email_change?(conn) do
      true ->
        send_confirmation_email(conn)

        conn
        |> put_flash(:info, "E-mail sent, please check your inbox.")
        |> redirect(to: Routes.pow_registration_path(conn, :edit))

      false ->
        conn
        |> put_flash(:info, "E-mail has already been confirmed.")
        |> redirect(to: Routes.pow_registration_path(conn, :edit))
    end
  end

  defp send_confirmation_email(conn) do
    user = Pow.Plug.current_user(conn)

    Phoenix.ControllerCallbacks.send_confirmation_email(user, conn)
  end
end
