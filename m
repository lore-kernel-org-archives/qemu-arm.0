Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D712F606A31C
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Nov 2026 10:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=c5nkFt7G
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQjTm-0000gX-UR; Tue, 10 Nov 2026 05:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xQjTk-0000gE-K2
 for qemu-arm@nongnu.org; Tue, 10 Nov 2026 05:53:29 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xQjTg-0003DU-1U
 for qemu-arm@nongnu.org; Tue, 10 Nov 2026 05:53:26 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso19871975e9.1
 for <qemu-arm@nongnu.org>; Tue, 10 Nov 2026 02:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794308001; x=1794912801; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8Y1IlFq7fRUVF2JkEAcJt3bDKGdTONj3lqslpY7wHNw=;
 b=c5nkFt7GKrz+r2kohfo89o0BtCp0hPhk7hZKxJk+6eyRxAei4wuc/3MWRKu/hymbM0
 r+rprzmBQr/keVF7IbDLgdD19V1N2zXiyAFFKPgYGj/ImsenMvHYTobJFeytuqkpV3wA
 u1nAV3j8UE99UQiuR+ftxMjY6Vy4l3pFRInHNfweVOb3Qof9d/0Jnf1WRBV6Blt2HrDa
 a24061uvqh2MBkKZJTjffR6RoYyCuQMciwimWIReCGzYsYkhajdvf3DBLfrPKjeFD5bI
 fH3Po+TSXX0PN3Neav7WeMK1isPiW8zcDpThBaytHdZyVenSzV3jitj2sABUPUFD6b+6
 2dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794308001; x=1794912801;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8Y1IlFq7fRUVF2JkEAcJt3bDKGdTONj3lqslpY7wHNw=;
 b=y/P9hpDG7yMUuGSCOEx4M1qLVlRYZIVZbiFidH4N0mfwOzurymcocUMHO5IoIDPn0n
 VKRUdLQxrTt1CfGAe+rz3jwqAbW2sWac8chweQMmt0QSUMvwifmIfzT/eEfE8lLnMzTR
 FIwBR2nSFohNnxyWpzcYUTw8ykw5ApaTvUvaERUR5np6+r9k5+4yGzuc1dnIjJLSWrTH
 nqW9m57QnQCKosYU4aAYZY0FD9ml0uGzL0hRwFJ51oygofQM1mIwd3A4wF7SZ5TNijkA
 XF+gFfpV5Zmu6hKL1//Na3jbl0IMah0xhsxt3MIgoMjBSSx9Lp9G4zeWMVQSImLwCXwq
 /QuA==
X-Forwarded-Encrypted: i=1;
 AL+hErEP6I/oShXjtBerwNaI4py4z6zRDNwdQgvwL8QYtEbfpXSWp0DKnOory/rF74o4Sah21u/1WttBOQ==@nongnu.org
X-Gm-Message-State: APuU4Z/TUU8Yz1jXUh+R0BoTyxrSWaZZ5pnbTgfZqayv7qPhojEzeQpg
 Nz7LWRMFVIvGZ03vvqv5z6REwaF61xJE1exyD5hPbBQXzCvAGXuOccOQ6bD7R0DOYbA=
X-Gm-Gg: AYBFou0hHW81GI77ou9gdeh2JCTH8Zw6V7IP1+18kfeXpITUuYfYhwvsNBR7R/PQnAH
 KFq88vJxe/cldWd8sM+ZbJ02A14EnOFtUnyvVez+oBqIMKSEN25jUrF32N575zuPT6j2StPW/1P
 dxZTCvPn6PKwpU7jI+QC+CrzyxFGSgJXndEGmlYVmFFAKXSRC0EAWi9GNOiazzPlfqSRaz6hxpR
 fQDzaDr8scGGhKZAY/Uo5qMlTJd4tgqSTVrsXS1lUq+BUfF9+KfIf1sCO4kY4NdoSKO0m1nW+R+
 N9jfonDKbBbRqVF20qH/oSb/U8INNR20GX5FTTFHsaQL7pNYXfg9b4fsdfLNGCFg+oWzQzz4wBL
 xor6ya0XFyoaFhVqyLLsUKRc7rEy39YHMUpuR74Q1e/3a+RQtS91TFfgAK6OIkMBzlFwRdDuMPl
 5KHPQ5797luqlq5dMDuwoM3buAbONpvuNt3x/0PPuLlJAdfdgV7ZaiyyiswLYv5kEzv04GHqlrV
 vUGriy0Bg4oHX+sBtv/DzDB1gx1G3oHexw7oCJkwwrgpg7G9h0CCkIT6y6ZsKff7SwfSUkqUIq+
 rBM3VFkXZgK+RfVzjYaugjMw3xLe
X-Received: by 2002:a05:600c:8b84:b0:4a7:6bc7:f778 with SMTP id
 5b1f17b1804b1-4ba02355aa5mr38172915e9.30.1794308000617; 
 Tue, 10 Nov 2026 02:53:20 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba01d9df5csm67811945e9.0.2026.11.10.02.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 02:53:19 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7FCF35F7E1;
 Tue, 10 Nov 2026 10:53:18 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org,  Ashish Anand <ashish.a6@samsung.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm: Kick the other vCPUs on SEV under TCG
 round-robin
In-Reply-To: <20261109142319.73878-1-philmd@oss.qualcomm.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 9 Nov 2026 15:23:19
 +0100")
References: <20261109142319.73878-1-philmd@oss.qualcomm.com>
User-Agent: mu4e 1.14.5-pre1; emacs 30.1
Date: Tue, 10 Nov 2026 10:53:18 +0000
Message-ID: <875wy5c601.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com> writes:

> In round-robin (single-thread) TCG, all vCPUs share one
> host thread, so qemu_cpu_is_self() is true for every vCPU.

This makes me think we should check other cases of qemu_cpu_is_self. For
example:

  void icount_handle_interrupt(CPUState *cpu, int mask)
  {
      int old_mask =3D cpu->interrupt_request;

      tcg_handle_interrupt(cpu, mask);
      if (qemu_cpu_is_self(cpu) &&
          !cpu->neg.can_do_io
          && (mask & ~old_mask) !=3D 0) {
          cpu_abort(cpu, "Raised interrupt while not in I/O function");
      }
  }

Besides current_cpu does change even in rr so why I we testing against
thread rather than CPUState?

>
> The SEV helper used it to skip the kick of the issuing vCPU,
> and so skipped it for every other vCPU too: a vCPU sleeping
> in WFE is only woken when the RR kick timer fires.
>
> Compare against the issuing vCPU instead.
>
> Fixes: d238858bff60 ("target/arm: Implement WFE, SEV and SEVONPEND")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  target/arm/tcg/op_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
> index 6a673e5ae6e8..173dd0e5151a 100644
> --- a/target/arm/tcg/op_helper.c
> +++ b/target/arm/tcg/op_helper.c
> @@ -470,11 +470,11 @@ void HELPER(wfit)(CPUARMState *env, uint32_t rd)
>=20=20
>  void HELPER(sev)(CPUARMState *env)
>  {
> -    CPUState *cs =3D env_cpu(env);
> +    CPUState *self =3D env_cpu(env), *cs;
>      CPU_FOREACH(cs) {
>          ARMCPU *target_cpu =3D ARM_CPU(cs);
>          target_cpu->env.event_register =3D true;
> -        if (!qemu_cpu_is_self(cs)) {
> +        if (cs !=3D self) {
>              qemu_cpu_kick(cs);
>          }
>      }

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

