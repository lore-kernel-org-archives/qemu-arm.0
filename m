Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o16sm12460132wmi.38.2018.03.06.06.16.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Mar 2018 06:16:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 7692E3E0270;
	Tue,  6 Mar 2018 14:16:22 +0000 (GMT)
References: <20180303143823.27055-1-richard.henderson@linaro.org> <20180303143823.27055-4-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v4 3/5] aarch64-linux-user: Remove struct target_aux_context
In-reply-to: <20180303143823.27055-4-richard.henderson@linaro.org>
Date: Tue, 06 Mar 2018 14:16:22 +0000
Message-ID: <874lltthl5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Zx9kVK2JqeA/


Richard Henderson <richard.henderson@linaro.org> writes:

> This changes the qemu signal frame layout to be more like the kernel's,
> in that the various records are dynamically allocated rather than fixed
> in place by a structure.
>
> For now, all of the allocation is out of uc.tuc_mcontext.__reserved,
> so the allocation is actually trivial.  That will change with SVE support.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  linux-user/signal.c | 89 ++++++++++++++++++++++++++++++++++++-----------=
------
>  1 file changed, 61 insertions(+), 28 deletions(-)
>
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 25c9743aed..f9eef3d753 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -1443,20 +1443,12 @@ struct target_fpsimd_context {
>      uint64_t vregs[32 * 2]; /* really uint128_t vregs[32] */
>  };
>
> -/*
> - * Auxiliary context saved in the sigcontext.__reserved array. Not expor=
ted to
> - * user space as it will change with the addition of new context. User s=
pace
> - * should check the magic/size information.
> - */
> -struct target_aux_context {
> -    struct target_fpsimd_context fpsimd;
> -    /* additional context to be added before "end" */
> -    struct target_aarch64_ctx end;
> -};
> -
>  struct target_rt_sigframe {
>      struct target_siginfo info;
>      struct target_ucontext uc;
> +};
> +
> +struct target_rt_frame_record {
>      uint64_t fp;
>      uint64_t lr;
>      uint32_t tramp[2];
> @@ -1562,20 +1554,47 @@ static void target_restore_fpsimd_record(CPUARMSt=
ate *env,
>  static int target_restore_sigframe(CPUARMState *env,
>                                     struct target_rt_sigframe *sf)
>  {
> -    struct target_aux_context *aux
> -        =3D (struct target_aux_context *)sf->uc.tuc_mcontext.__reserved;
> -    uint32_t magic, size;
> +    struct target_aarch64_ctx *ctx;
> +    struct target_fpsimd_context *fpsimd =3D NULL;
>
>      target_restore_general_frame(env, sf);
>
> -    __get_user(magic, &aux->fpsimd.head.magic);
> -    __get_user(size, &aux->fpsimd.head.size);
> -    if (magic =3D=3D TARGET_FPSIMD_MAGIC
> -        && size =3D=3D sizeof(struct target_fpsimd_context)) {
> -        target_restore_fpsimd_record(env, &aux->fpsimd);
> -    } else {
> +    ctx =3D (struct target_aarch64_ctx *)sf->uc.tuc_mcontext.__reserved;
> +    while (ctx) {
> +        uint32_t magic, size;
> +
> +        __get_user(magic, &ctx->magic);
> +        __get_user(size, &ctx->size);
> +        switch (magic) {
> +        case 0:
> +            if (size !=3D 0) {
> +                return 1;
> +            }
> +            ctx =3D NULL;
> +            continue;
> +
> +        case TARGET_FPSIMD_MAGIC:
> +            if (fpsimd || size !=3D sizeof(struct target_fpsimd_context)=
) {
> +                return 1;
> +            }
> +            fpsimd =3D (struct target_fpsimd_context *)ctx;
> +            break;
> +
> +        default:
> +            /* Unknown record -- we certainly didn't generate it.
> +             * Did we in fact get out of sync?
> +             */
> +            return 1;
> +        }
> +        ctx =3D (void *)ctx + size;
> +    }
> +
> +    /* Require FPSIMD always.  */
> +    if (!fpsimd) {
>          return 1;
>      }
> +    target_restore_fpsimd_record(env, fpsimd);
> +
>      return 0;
>  }
>
> @@ -1601,20 +1620,33 @@ static void target_setup_frame(int usig, struct t=
arget_sigaction *ka,
>                                 target_siginfo_t *info, target_sigset_t *=
set,
>                                 CPUARMState *env)
>  {
> +    int size =3D offsetof(struct target_rt_sigframe, uc.tuc_mcontext.__r=
eserved);
> +    int fpsimd_ofs, end1_ofs, fr_ofs;
>      struct target_rt_sigframe *frame;
> -    struct target_aux_context *aux;
> +    struct target_rt_frame_record *fr;
>      abi_ulong frame_addr, return_addr;
>
> +    fpsimd_ofs =3D size;
> +    size +=3D sizeof(struct target_fpsimd_context);
> +    end1_ofs =3D size;
> +    size +=3D sizeof(struct target_aarch64_ctx);
> +    fr_ofs =3D size;
> +    size +=3D sizeof(struct target_rt_frame_record);
> +
>      frame_addr =3D get_sigframe(ka, env);
>      trace_user_setup_frame(env, frame_addr);
>      if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
>          goto give_sigsegv;
>      }
> -    aux =3D (struct target_aux_context *)frame->uc.tuc_mcontext.__reserv=
ed;
>
>      target_setup_general_frame(frame, env, set);
> -    target_setup_fpsimd_record(&aux->fpsimd, env);
> -    target_setup_end_record(&aux->end);
> +    target_setup_fpsimd_record((void *)frame + fpsimd_ofs, env);
> +    target_setup_end_record((void *)frame + end1_ofs);
> +
> +    /* Set up the stack frame for unwinding.  */
> +    fr =3D (void *)frame + fr_ofs;
> +    __put_user(env->xregs[29], &fr->fp);
> +    __put_user(env->xregs[30], &fr->lr);
>
>      if (ka->sa_flags & TARGET_SA_RESTORER) {
>          return_addr =3D ka->sa_restorer;
> @@ -1624,13 +1656,14 @@ static void target_setup_frame(int usig, struct t=
arget_sigaction *ka,
>           * Since these are instructions they need to be put as little-en=
dian
>           * regardless of target default or current CPU endianness.
>           */
> -        __put_user_e(0xd2801168, &frame->tramp[0], le);
> -        __put_user_e(0xd4000001, &frame->tramp[1], le);
> -        return_addr =3D frame_addr + offsetof(struct target_rt_sigframe,=
 tramp);
> +        __put_user_e(0xd2801168, &fr->tramp[0], le);
> +        __put_user_e(0xd4000001, &fr->tramp[1], le);
> +        return_addr =3D frame_addr + fr_ofs
> +            + offsetof(struct target_rt_frame_record, tramp);
>      }
>      env->xregs[0] =3D usig;
>      env->xregs[31] =3D frame_addr;
> -    env->xregs[29] =3D env->xregs[31] + offsetof(struct target_rt_sigfra=
me, fp);
> +    env->xregs[29] =3D frame_addr + fr_ofs;
>      env->pc =3D ka->_sa_handler;
>      env->xregs[30] =3D return_addr;
>      if (info) {


--
Alex Benn=C3=A9e
