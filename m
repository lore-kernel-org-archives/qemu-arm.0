Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 207sm9205025wme.17.2019.09.12.05.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 05:05:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5DF2C1FF87;
	Thu, 12 Sep 2019 13:05:16 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-13-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH 12/13] target/arm/arm-semi: Implement
 SH_EXT_STDOUT_STDERR extension
In-reply-to: <20190910144428.32597-13-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 13:05:16 +0100
Message-ID: <87a7b9zpmr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: l9JK4f4l8CE/


Peter Maydell <peter.maydell@linaro.org> writes:

> SH_EXT_STDOUT_STDERR is a v2.0 semihosting extension: the guest
> can open ":tt" with a file mode requesting append access in
> order to open stderr, in addition to the existing "open for
> read for stdin or write for stdout". Implement this and
> report it via the :semihosting-features data.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/arm-semi.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 531084b7799..0df8d4d69d6 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -476,12 +476,16 @@ static uint32_t gdb_flenfn(TaskState *ts, ARMCPU *c=
pu, GuestFD *gf)
>  #define SHFB_MAGIC_2 0x46
>  #define SHFB_MAGIC_3 0x42
>
> +/* Feature bits reportable in feature byte 0 */
> +#define SH_EXT_EXIT_EXTENDED (1 << 0)

If you swap 12/13 this could be kept with the related feature. I don't
think one implies the other right?

> +#define SH_EXT_STDOUT_STDERR (1 << 1)
> +
>  static const uint8_t featurefile_data[] =3D {
>      SHFB_MAGIC_0,
>      SHFB_MAGIC_1,
>      SHFB_MAGIC_2,
>      SHFB_MAGIC_3,
> -    0, /* Feature byte 0 */
> +    SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
>  };
>
>  static void init_featurefile_guestfd(int guestfd)
> @@ -674,7 +678,21 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>          }
>
>          if (strcmp(s, ":tt") =3D=3D 0) {
> -            int result_fileno =3D arg1 < 4 ? STDIN_FILENO : STDOUT_FILEN=
O;
> +            int result_fileno;
> +
> +            /*
> +             * We implement SH_EXT_STDOUT_STDERR, so:
> +             *  open for read =3D=3D stdin
> +             *  open for write =3D=3D stdout
> +             *  open for append =3D=3D stderr
> +             */

I love the way the spec documents field2 as an ISO C fopen() mode and
then an extension literally subverts the meaning to be something else.
Where the designers worried about adding a SYS_OPEN_TTY function to the
interface?

Anyway it meets the spec however weird it might be:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> +            if (arg1 < 4) {
> +                result_fileno =3D STDIN_FILENO;
> +            } else if (arg1 < 8) {
> +                result_fileno =3D STDOUT_FILENO;
> +            } else {
> +                result_fileno =3D STDERR_FILENO;
> +            }
>              associate_guestfd(guestfd, result_fileno);
>              unlock_user(s, arg0, 0);
>              return guestfd;


--
Alex Benn=C3=A9e
