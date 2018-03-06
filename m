Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p29sm12821860wmf.3.2018.03.06.06.26.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Mar 2018 06:26:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 648FB3E0270;
	Tue,  6 Mar 2018 14:26:03 +0000 (GMT)
References: <20180303143823.27055-1-richard.henderson@linaro.org> <20180303143823.27055-5-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v4 4/5] aarch64-linux-user: Add support for EXTRA signal frame records
In-reply-to: <20180303143823.27055-5-richard.henderson@linaro.org>
Date: Tue, 06 Mar 2018 14:26:03 +0000
Message-ID: <87371dth50.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9w8WBzeXPl0q


Richard Henderson <richard.henderson@linaro.org> writes:

> The EXTRA record allows for additional space to be allocated
> beyon what is currently reserved.  Add code to emit and read
> this record type.
>
> Nothing uses extra space yet.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  linux-user/signal.c | 74 +++++++++++++++++++++++++++++++++++++++++++++--=
------
>  1 file changed, 63 insertions(+), 11 deletions(-)
>
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index f9eef3d753..c31cf0601d 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -1443,6 +1443,15 @@ struct target_fpsimd_context {
>      uint64_t vregs[32 * 2]; /* really uint128_t vregs[32] */
>  };
>
> +#define TARGET_EXTRA_MAGIC  0x45585401
> +
> +struct target_extra_context {
> +    struct target_aarch64_ctx head;
> +    uint64_t datap; /* 16-byte aligned pointer to extra space cast to __=
u64 */
> +    uint32_t size; /* size in bytes of the extra space */
> +    uint32_t reserved[3];
> +};
> +
>  struct target_rt_sigframe {
>      struct target_siginfo info;
>      struct target_ucontext uc;
> @@ -1502,6 +1511,15 @@ static void target_setup_fpsimd_record(struct targ=
et_fpsimd_context *fpsimd,
>      }
>  }
>
> +static void target_setup_extra_record(struct target_extra_context *extra,
> +                                      uint64_t datap, uint32_t extra_siz=
e)
> +{
> +    __put_user(TARGET_EXTRA_MAGIC, &extra->head.magic);
> +    __put_user(sizeof(struct target_extra_context), &extra->head.size);
> +    __put_user(datap, &extra->datap);
> +    __put_user(extra_size, &extra->size);
> +}
> +
>  static void target_setup_end_record(struct target_aarch64_ctx *end)
>  {
>      __put_user(0, &end->magic);
> @@ -1554,48 +1572,74 @@ static void target_restore_fpsimd_record(CPUARMSt=
ate *env,
>  static int target_restore_sigframe(CPUARMState *env,
>                                     struct target_rt_sigframe *sf)
>  {
> -    struct target_aarch64_ctx *ctx;
> +    struct target_aarch64_ctx *ctx, *extra =3D NULL;
>      struct target_fpsimd_context *fpsimd =3D NULL;
> +    uint64_t extra_datap =3D 0;
> +    bool used_extra =3D false;
> +    bool err =3D false;
>
>      target_restore_general_frame(env, sf);
>
>      ctx =3D (struct target_aarch64_ctx *)sf->uc.tuc_mcontext.__reserved;
>      while (ctx) {
> -        uint32_t magic, size;
> +        uint32_t magic, size, extra_size;
>
>          __get_user(magic, &ctx->magic);
>          __get_user(size, &ctx->size);
>          switch (magic) {
>          case 0:
>              if (size !=3D 0) {
> -                return 1;
> +                err =3D true;
> +                goto exit;
> +            }
> +            if (used_extra) {
> +                ctx =3D NULL;
> +            } else {
> +                ctx =3D extra;
> +                used_extra =3D true;
>              }
> -            ctx =3D NULL;
>              continue;
>
>          case TARGET_FPSIMD_MAGIC:
>              if (fpsimd || size !=3D sizeof(struct target_fpsimd_context)=
) {
> -                return 1;
> +                err =3D true;
> +                goto exit;
>              }
>              fpsimd =3D (struct target_fpsimd_context *)ctx;
>              break;
>
> +        case TARGET_EXTRA_MAGIC:
> +            if (extra || size !=3D sizeof(struct target_extra_context)) {
> +                err =3D true;
> +                goto exit;
> +            }
> +            __get_user(extra_datap,
> +                       &((struct target_extra_context *)ctx)->datap);
> +            __get_user(extra_size,
> +                       &((struct target_extra_context *)ctx)->size);
> +            extra =3D lock_user(VERIFY_READ, extra_datap, extra_size, 0);
> +            break;
> +
>          default:
>              /* Unknown record -- we certainly didn't generate it.
>               * Did we in fact get out of sync?
>               */
> -            return 1;
> +            err =3D true;
> +            goto exit;
>          }
>          ctx =3D (void *)ctx + size;
>      }
>
>      /* Require FPSIMD always.  */
> -    if (!fpsimd) {
> -        return 1;
> +    if (fpsimd) {
> +        target_restore_fpsimd_record(env, fpsimd);
> +    } else {
> +        err =3D true;
>      }
> -    target_restore_fpsimd_record(env, fpsimd);
>
> -    return 0;
> + exit:
> +    unlock_user(extra, extra_datap, 0);
> +    return err;
>  }
>
>  static abi_ulong get_sigframe(struct target_sigaction *ka, CPUARMState *=
env)
> @@ -1621,7 +1665,8 @@ static void target_setup_frame(int usig, struct tar=
get_sigaction *ka,
>                                 CPUARMState *env)
>  {
>      int size =3D offsetof(struct target_rt_sigframe, uc.tuc_mcontext.__r=
eserved);
> -    int fpsimd_ofs, end1_ofs, fr_ofs;
> +    int fpsimd_ofs, end1_ofs, fr_ofs, end2_ofs =3D 0;
> +    int extra_ofs =3D 0, extra_base =3D 0, extra_size =3D 0;
>      struct target_rt_sigframe *frame;
>      struct target_rt_frame_record *fr;
>      abi_ulong frame_addr, return_addr;
> @@ -1641,7 +1686,14 @@ static void target_setup_frame(int usig, struct ta=
rget_sigaction *ka,
>
>      target_setup_general_frame(frame, env, set);
>      target_setup_fpsimd_record((void *)frame + fpsimd_ofs, env);
> +    if (extra_ofs) {
> +        target_setup_extra_record((void *)frame + extra_ofs,
> +                                  frame_addr + extra_base, extra_size);
> +    }
>      target_setup_end_record((void *)frame + end1_ofs);
> +    if (end2_ofs) {
> +        target_setup_end_record((void *)frame + end2_ofs);
> +    }
>
>      /* Set up the stack frame for unwinding.  */
>      fr =3D (void *)frame + fr_ofs;


--
Alex Benn=C3=A9e
