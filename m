Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1E2C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 17:10:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx6Gu-0001bK-TV; Thu, 20 Aug 2026 13:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wx6Gt-0001Xu-OT
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 13:09:43 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1wx6Gr-0001ir-Ng
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 13:09:43 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-836c91bd782so2275667b3.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787245780; cv=none;
 d=google.com; s=arc-20260327;
 b=jHHjCDZgzJGzuba9+4X7yxx6Cn+XTeMgvaWzlG6Io+ma0N82ZvsHY6r/jh3Ij0W9bF
 a/mVupPQgazetLQ6l8Rtd3zDUPsR1lCwCDr1JkTqZoNwekeuLMmGS5ygFfVuQAu78gTw
 LdOt0V7UaRrFdQPKMefMkEWQxzfUhDwSTqOMdSyloA4nDBL6kl4AL/vWavw/2yxs2ErL
 5fWswmzV8Et2uskGMkhwWXUgo2xvxNOyXpfdawL9RoaTMRXSPR3kr0cLD8K1FGS1X5V4
 MEu/esm1iYUCJbr7bp1QqIl6eKo78caJNCYctR/bRbVY3maOYjWzACgJOisk3o0Q0yEA
 1h4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wLVNGp1TrXL/BejdX3jNwBZK07UE4WlYLsz9cGAtoNc=;
 fh=qq+YAgCRBW/yMSN06txEoRbAc7mN/Obswql4nXuM1QM=;
 b=fknUb4nVjmT0NahwYSTkrrdcNTBcjSyZ97SGLoSL4CqZr447nviU4YGOAOlTUci0pz
 ht2tF7V9htNtX6Ub1ES80vr0idZD3cuFjfDoAuoo00RIXNZyHbP3epYfdznkDdHKBWNw
 JvY4itYA14orndh5puiSy1qWv/aVKzgMYxhVppeS167IhKsEV8balrBY0hMpXytX6JjQ
 3bd145+emB0gMuT/ManoFoXRWhFJrHvsKebagQDb3RPU6k+nToFj2UjkZrVsGq+lCM4l
 rpoNC+bPI3zhszNA0WfXzQdmOdgecaBdNK1r6Bmzrly17CeJFE3RfjIio014zGOCZ7xg
 P0RA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787245780; x=1787850580; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wLVNGp1TrXL/BejdX3jNwBZK07UE4WlYLsz9cGAtoNc=;
 b=bc/kJXJN9pwFPFxyFni0XE8ZCUqm4KII8nkLaiUuRutQrm+hh1tPQDVmUvx7g0oERN
 kUknfz4ZqI0e2bnzU7h96sK7bwF7+haJ2JjQ62FZaisJQSXcP/OMFnMpiGTuwEHukY8p
 MsNOhSE0OWNzMa71r++XSDxFD/bswWuRxYywS5shxooJKMROLMubQjkMg8vTtTd9ubTh
 I8talFsB4IRHpvmGJ4ICfWpBmRGGCWv8hwUs7ej9yn2hUAc81PKU0HsCi739rhzWjIKf
 YkgW2Eqg1T6ekKr1POubEHhZQh7eBgMZQUkv6ilwmjsMaLCcLzSKMtKk1x/bHiJszHpu
 DRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787245780; x=1787850580;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wLVNGp1TrXL/BejdX3jNwBZK07UE4WlYLsz9cGAtoNc=;
 b=HU5fcAHoSb+kSWIWanhU6XzCfD9BJIh5Ri1wYOy/NhF5TOmn+0yc4w7wpQ1CoCfk+9
 4SIRDlXn9eY5sJbLdTQJxU+SBnQWmp/LWEjpnB08OtZUWrhD9+D+kANwMhfjrH6DmIeM
 rFowS/JeEHT/S6a9C57GqznFL/Q7wgQUF3MAwlJjLxsuAyrV3U6qHBhN5hrX7WKDeDVR
 Yc3oqwef7egxC8vPwsF6vliD3+8y+S3Wx1denDeqpRjrtBsqoRjTBe+6LA5i2Q1EzCtP
 esXHV8OErYzcc5Ekw4PfzKKXzvfn0gbA4abTTCwPedS3jzkOyHVE9Btd/tqLoY/WcwrU
 KmKA==
X-Forwarded-Encrypted: i=1;
 AHgh+RookiWS9RvBwkVwKogk25iiwaPUQNk5PsKlfBml0Hwbp5ha6/kHNOytTNwWokuPOyU/4w9tv/fRtw==@nongnu.org
X-Gm-Message-State: AFuF++kRJTpMUXknz4k0+v2FWUjEoG9NmjX6YpD7zMVhTaUc4Ezwd9mj
 BP3W8JFeZl8fQg1bWDSGnBjNsrmCgmpsnTizgqZfUWzq8da5GLaE+LHlqYeXWU0hrFr22mMdiJl
 uLcr9nKN6Oyxqb+Z7lz6Ar32+82gjqLo=
X-Gm-Gg: AR+sD12tNVWxv7tEjn29nQ/KA4cZ/yYsDhHff2p/ai3VeGKvAua15sJkInKMLElrtuq
 DSvW6TTN7C1ju7RtSBzuQw/109cJhXLqSYphNAgl908f6TzU+/mLB3jJZYDA8APD+ImNClYVawI
 pJ+Fho0Cbog8QEBuScgQ5lKhsr0Du91xzOlXhvKGgeU8IMfwv2jWux/boU97srkfGH1h8Fpl1jN
 tSjOr7xk6vJ4A+AHrDrHPmC4e3ycgavVSarUVxJOBiS6m6CnowQ+Svud6RqkXZMHre3t52+vpXU
 vwJMWvB4QVB9HKliEM6M8FLle0DoJ4hv0Ok92EnS1Octb4D0+m72E+Ua2NK/SMHyvxNtgt0n1R5
 t
X-Received: by 2002:a05:690c:e3c2:b0:847:8ef9:fa2e with SMTP id
 00721157ae682-8478f093dc5mr27474467b3.10.1787245780046; Thu, 20 Aug 2026
 10:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-10-philmd@oss.qualcomm.com>
 <0b70e3cc-e14f-4737-b265-c7d12898169a@linaro.org>
 <854739cc-1275-4324-aaea-576f0a504172@oss.qualcomm.com>
 <fb2425af-9f89-4413-a31e-1f22fd42d869@oss.qualcomm.com>
In-Reply-To: <fb2425af-9f89-4413-a31e-1f22fd42d869@oss.qualcomm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 20 Aug 2026 21:09:23 +0400
X-Gm-Features: AcwNN1W9ltniWMbSgs1PGJ3frjaMCXMbmdQyqmJcJk98cxS_OW0FuKRKMguRMSE
Message-ID: <CAJ+F1CKqhB-7MPHQZ6_8NbA7Mq9eUmkDD3rn7-dgTVJErYcshg@mail.gmail.com>
Subject: Re: [RFC PATCH 09/13] cpus: Add const-qualified CPU environment
 accessors
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Aug 20, 2026 at 8:52=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 2026-08-20 18:24, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 2026-08-20 17:21, Richard Henderson wrote:
> >> On 8/20/26 03:47, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> Introduce const-qualified variants of cpu_env() and
> >>> env_archcpu(), to safely access CPU architecture
> >>> state when it should not be modified.
> >>>
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> >>> ---
> >>>   include/exec/cpu-common.h | 11 +++++++++++
> >>>   include/hw/core/cpu.h     |  6 ++++++
> >>>   2 files changed, 17 insertions(+)
> >>>
> >>> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> >>> index 6594f7fa1be..f3a3799f451 100644
> >>> --- a/include/exec/cpu-common.h
> >>> +++ b/include/exec/cpu-common.h
> >>> @@ -79,6 +79,17 @@ static inline bool cpu_loop_exit_requested(const
> >>> CPUState *cpu)
> >>>   }
> >>>   #endif /* CONFIG_TCG */
> >>> +/**
> >>> + * env_archcpu_const(env)
> >>> + * @env: The architecture environment (const).
> >>> + *
> >>> + * Return the const ArchCPU associated with the environment.
> >>> + */
> >>> +static inline const ArchCPU *env_archcpu_const(const CPUArchState *e=
nv)
> >>> +{
> >>> +    return (const void *)env - sizeof(CPUState);
> >>> +}
> >>> +
> >>>   /**
> >>>    * env_archcpu(env)
> >>>    * @env: The architecture environment
> >>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> >>> index 81af7b9ee1a..59f777f3f15 100644
> >>> --- a/include/hw/core/cpu.h
> >>> +++ b/include/hw/core/cpu.h
> >>> @@ -594,6 +594,12 @@ struct CPUState {
> >>>   QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=3D
> >>>                     sizeof(CPUState) - sizeof(CPUNegativeOffsetState)=
);
> >>> +static inline const CPUArchState *cpu_env_const(const CPUState *cpu)
> >>> +{
> >>> +    /* We validate that CPUArchState follows CPUState in cpu-
> >>> target.c */
> >>> +    return (const CPUArchState *)(cpu + 1);
> >>> +}
> >>> +
> >>>   static inline CPUArchState *cpu_env(CPUState *cpu)
> >>>   {
> >>>       /* We validate that CPUArchState follows CPUState in cpu-
> >>> target.c */
> >>
> >> I wonder if we can use _Generic to make this automatic, rather than
> >> have to choose between two different function names.
> > Eh clever :) This seems to work:
> >
> >    #define env_archcpu_(p) _Generic(*(p), \
> >                                CPUArchState: (void *)p, \
> >                                const CPUArchState: (const void *)p)
>
> Actually simpler and even well readable:
>
> -- >8 --
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 6594f7fa1b..d67d008236 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -85,21 +85,11 @@ static inline bool cpu_loop_exit_requested(const
> CPUState *cpu)
>    *
>    * Return the ArchCPU associated with the environment.
>    */
> -static inline ArchCPU *env_archcpu(CPUArchState *env)
> -{
> -    return (void *)env - sizeof(CPUState);
> -}
> -
> -/**
> - * env_cpu_const(env)
> - * @env: The architecture environment
> - *
> - * Return the CPUState associated with the environment.
> - */
> -static inline const CPUState *env_cpu_const(const CPUArchState *env)
> -{
> -    return (void *)env - sizeof(CPUState);
> -}
> +#define env_archcpu(env) _Generic(*(env), \
> +            CPUArchState: \
> +                (ArchCPU *)((void *)env - sizeof(CPUState)), \
> +            const CPUArchState: \
> +                (const ArchCPU *)((const void *)env - sizeof(CPUState)))
>
>   /**
>    * env_cpu(env)
> @@ -107,9 +97,10 @@ static inline const CPUState *env_cpu_const(const
> CPUArchState *env)
>    *
>    * Return the CPUState associated with the environment.
>    */
> -static inline CPUState *env_cpu(CPUArchState *env)
> -{
> -    return (CPUState *)env_cpu_const(env);
> -}
> +#define env_cpu(env) _Generic(*(env), \
> +            CPUArchState: \
> +                (CPUState *)((void *)env - sizeof(CPUState)), \
> +            const CPUArchState: \
> +                (const CPUState *)((const void *)env - sizeof(CPUState))=
)
>
>   #endif /* CPU_COMMON_H */
> ---
>

lgtm too
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



--=20
Marc-Andr=C3=A9 Lureau

