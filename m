Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z25sm6237470wmk.0.2019.09.12.05.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 05:07:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9BDB91FF87;
	Thu, 12 Sep 2019 13:07:58 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-14-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 13/13] target/arm/arm-semi: Implement
 SH_EXT_EXIT_EXTENDED extension
In-reply-to: <20190910144428.32597-14-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 13:07:58 +0100
Message-ID: <878sqtzpi9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: VABBBII7LRWC


Peter Maydell <peter.maydell@linaro.org> writes:

> SH_EXT_EXIT_EXTENDED is a v2.0 semihosting extension: it
> indicates that the implementation supports the SYS_EXIT_EXTENDED
> function. This function allows both A64 and A32/T32 guests to
> exit with a specified exit status, unlike the older SYS_EXIT
> function which only allowed this for A64 guests. Implement
> this extension.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Aside from the ordering nit mentioned in the previous commit:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/arm-semi.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 0df8d4d69d6..3900bd4e1e6 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -66,6 +66,7 @@ typedef void TaskState;
>  #define TARGET_SYS_HEAPINFO    0x16
>  #define TARGET_SYS_EXIT        0x18
>  #define TARGET_SYS_SYNCCACHE   0x19
> +#define TARGET_SYS_EXIT_EXTENDED 0x20
>
>  /* ADP_Stopped_ApplicationExit is used for exit(0),
>   * anything else is implemented as exit(1) */
> @@ -485,7 +486,7 @@ static const uint8_t featurefile_data[] =3D {
>      SHFB_MAGIC_1,
>      SHFB_MAGIC_2,
>      SHFB_MAGIC_3,
> -    SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
> +    SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
>  };
>
>  static void init_featurefile_guestfd(int guestfd)
> @@ -1026,11 +1027,14 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              return 0;
>          }
>      case TARGET_SYS_EXIT:
> -        if (is_a64(env)) {
> +    case TARGET_SYS_EXIT_EXTENDED:
> +        if (nr =3D=3D TARGET_SYS_EXIT_EXTENDED || is_a64(env)) {
>              /*
> -             * The A64 version of this call takes a parameter block,
> +             * The A64 version of SYS_EXIT takes a parameter block,
>               * so the application-exit type can return a subcode which
>               * is the exit status code from the application.
> +             * SYS_EXIT_EXTENDED is an a new-in-v2.0 optional function
> +             * which allows A32/T32 guests to also provide a status code.
>               */
>              GET_ARG(0);
>              GET_ARG(1);
> @@ -1042,8 +1046,10 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              }
>          } else {
>              /*
> -             * ARM specifies only Stopped_ApplicationExit as normal
> -             * exit, everything else is considered an error
> +             * The A32/T32 version of SYS_EXIT specifies only
> +             * Stopped_ApplicationExit as normal exit, but does not
> +             * allow the guest to specify the exit status code.
> +             * Everything else is considered an error.
>               */
>              ret =3D (args =3D=3D ADP_Stopped_ApplicationExit) ? 0 : 1;
>          }


--
Alex Benn=C3=A9e
