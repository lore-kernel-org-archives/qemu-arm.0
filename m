Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q15sm6691142wmb.28.2019.09.12.04.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2019 04:56:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 43FEF1FF87;
	Thu, 12 Sep 2019 12:56:05 +0100 (BST)
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-12-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 11/13] target/arm/arm-semi: Implement support
 for semihosting feature detection
In-reply-to: <20190910144428.32597-12-peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 12:56:05 +0100
Message-ID: <87blvpzq22.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3RrJMMXkHVI0


Peter Maydell <peter.maydell@linaro.org> writes:

> Version 2.0 of the semihosting specification added support for
> allowing a guest to detect whether the implementation supported
> particular features. This works by the guest opening a magic
> file ":semihosting-features", which contains a fixed set of
> data with some magic numbers followed by a sequence of bytes
> with feature flags. The file is expected to behave sensibly
> for the various semihosting calls which operate on files
> (SYS_FLEN, SYS_SEEK, etc).
>
> Implement this as another kind of guest FD using our function
> table dispatch mechanism. Initially we report no extended
> features, so we have just one feature flag byte which is zero.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

with your EACCESS suggestion:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/arm-semi.c | 107 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 106 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index f9019b00b8d..531084b7799 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -117,6 +117,7 @@ typedef enum GuestFDType {
>      GuestFDUnused =3D 0,
>      GuestFDHost =3D 1,
>      GuestFDGDB =3D 2,
> +    GuestFDFeatureFile =3D 3,
>  } GuestFDType;
>
>  /*
> @@ -125,7 +126,10 @@ typedef enum GuestFDType {
>   */
>  typedef struct GuestFD {
>      GuestFDType type;
> -    int hostfd;
> +    union {
> +        int hostfd;
> +        target_ulong featurefile_offset;
> +    };
>  } GuestFD;
>
>  static GArray *guestfd_array;
> @@ -467,6 +471,87 @@ static uint32_t gdb_flenfn(TaskState *ts, ARMCPU *cp=
u, GuestFD *gf)
>                             gf->hostfd, arm_flen_buf(cpu));
>  }
>
> +#define SHFB_MAGIC_0 0x53
> +#define SHFB_MAGIC_1 0x48
> +#define SHFB_MAGIC_2 0x46
> +#define SHFB_MAGIC_3 0x42
> +
> +static const uint8_t featurefile_data[] =3D {
> +    SHFB_MAGIC_0,
> +    SHFB_MAGIC_1,
> +    SHFB_MAGIC_2,
> +    SHFB_MAGIC_3,
> +    0, /* Feature byte 0 */
> +};
> +
> +static void init_featurefile_guestfd(int guestfd)
> +{
> +    GuestFD *gf =3D do_get_guestfd(guestfd);
> +
> +    assert(gf);
> +    gf->type =3D GuestFDFeatureFile;
> +    gf->featurefile_offset =3D 0;
> +}
> +
> +static uint32_t featurefile_closefn(TaskState *ts, ARMCPU *cpu, GuestFD =
*gf)
> +{
> +    /* Nothing to do */
> +    return 0;
> +}
> +
> +static uint32_t featurefile_writefn(TaskState *ts, ARMCPU *cpu, GuestFD =
*gf,
> +                                    target_ulong buf, uint32_t len)
> +{
> +    /* This fd can never be open for writing */
> +    errno =3D EBADF;
> +    return set_swi_errno(ts, -1);
> +}
> +
> +static uint32_t featurefile_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *=
gf,
> +                                   target_ulong buf, uint32_t len)
> +{
> +    uint32_t i;
> +#ifndef CONFIG_USER_ONLY
> +    CPUARMState *env =3D &cpu->env;
> +#endif
> +    char *s;
> +
> +    s =3D lock_user(VERIFY_WRITE, buf, len, 0);
> +    if (!s) {
> +        return len;
> +    }
> +
> +    for (i =3D 0; i < len; i++) {
> +        if (gf->featurefile_offset >=3D sizeof(featurefile_data)) {
> +            break;
> +        }
> +        s[i] =3D featurefile_data[gf->featurefile_offset];
> +        gf->featurefile_offset++;
> +    }
> +
> +    unlock_user(s, buf, len);
> +
> +    /* Return number of bytes not read */
> +    return len - i;
> +}
> +
> +static uint32_t featurefile_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD=
 *gf)
> +{
> +    return 0;
> +}
> +
> +static uint32_t featurefile_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *=
gf,
> +                                   target_ulong offset)
> +{
> +    gf->featurefile_offset =3D offset;
> +    return 0;
> +}
> +
> +static uint32_t featurefile_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *=
gf)
> +{
> +    return sizeof(featurefile_data);
> +}
> +
>  typedef struct GuestFDFunctions {
>      sys_closefn *closefn;
>      sys_writefn *writefn;
> @@ -493,6 +578,14 @@ static const GuestFDFunctions guestfd_fns[] =3D {
>          .seekfn =3D gdb_seekfn,
>          .flenfn =3D gdb_flenfn,
>      },
> +    [GuestFDFeatureFile] =3D {
> +        .closefn =3D featurefile_closefn,
> +        .writefn =3D featurefile_writefn,
> +        .readfn =3D featurefile_readfn,
> +        .isattyfn =3D featurefile_isattyfn,
> +        .seekfn =3D featurefile_seekfn,
> +        .flenfn =3D featurefile_flenfn,
> +    },
>  };
>
>  /* Read the input value from the argument block; fail the semihosting
> @@ -586,6 +679,18 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>              unlock_user(s, arg0, 0);
>              return guestfd;
>          }
> +        if (strcmp(s, ":semihosting-features") =3D=3D 0) {
> +            unlock_user(s, arg0, 0);
> +            /* We must fail opens for modes other than 0 ('r') or 1 ('rb=
') */
> +            if (arg1 !=3D 0 && arg1 !=3D 1) {
> +                dealloc_guestfd(guestfd);
> +                errno =3D EINVAL;
> +                return set_swi_errno(ts, -1);
> +            }
> +            init_featurefile_guestfd(guestfd);
> +            return guestfd;
> +        }
> +
>          if (use_gdb_syscalls()) {
>              ret =3D arm_gdb_syscall(cpu, arm_semi_cb, "open,%s,%x,1a4", =
arg0,
>                                    (int)arg2+1, gdb_open_modeflags[arg1]);


--
Alex Benn=C3=A9e
