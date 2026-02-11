Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C74E9E2E2
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 10:58:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vq7vh-0006aU-7A; Wed, 11 Feb 2026 05:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vq7vf-0006Zs-BR
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 05:58:43 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vq7vd-0006uN-MK
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 05:58:43 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b86ed375d37so206043766b.3
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 02:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770807519; x=1771412319; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zw7ILEx6g3EB5nyzqLmaOl8B8fqNrcyqmTt/+XOFHTs=;
 b=brNFolYsNcU2Mi+dVT96T5Q7Nl2xFU/S1KoFxZYKtExw0HjKcUwulsaUG3jRTM/avE
 dIR+lWVAMJ97LcECEEEqtpNqwWJKDx23LZrm8Mm3ILwXphoflqmtDApjtw84FNL3Hij2
 mmOu2Aw6fy2GU37En7DWnt9tuVWF/tgqMhntm/xxRz7Wqvn9ThwsrhgWt3JrNB1h7QKL
 85jWwIs6PwmMg9U4ApEHQqEKtXSRJGr8jNQKG74zwBl4NzzcACgHV2u/hx5s6wMWmXGF
 AwpAKbpeZ0puNNiN+W6rE4eYJnPIx6HB1VtHfRNsWOcjvcxaLyCdJ2sSqqxZ/TClGvKx
 cUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770807519; x=1771412319;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zw7ILEx6g3EB5nyzqLmaOl8B8fqNrcyqmTt/+XOFHTs=;
 b=n9Lut9aJEpVYVhwcNqVHqsMvbvDyizFlJlExhttCo76lC/KcahsErSNijG1t2dHENY
 nKxJPLnIOYsjFCBgSEhlg2zQVw0ttMrfw/pG6wgwUWZrERpRBe7YPitx6YHo8YloaJmh
 c8IElM9RJ3+NFW7jCBM2hLy54EEmJBb+lfZdn0g4kEbI6zOBKwFiBfHsOYxX2xCcLo2P
 Z9uM4ZoL3vT+Z0Yk2fCxYBaoyxJxhxYsX7DY8J/NH/HR/JuVJIugZoyu31ak0KcocPul
 uO7Xvi4gcAijaAY7qvvk7iLlVQzWGVRxvCL1OaK1eeTNSydNYdOrGFSl9NV7MlfA08Ak
 gIDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/PZF7dxgCN2k0+t7FQ+sWbizx6UnMaSghHoqzgOY54ayux/nZPn2Dzkpq/pi6A46jvU+qwfiyQw==@nongnu.org
X-Gm-Message-State: AOJu0YySiFLl8Y43iFx3jT8rU1l6tn1wP+2PnS2brs36ivzfdw8kix/t
 R5bSmG6pAfAo6GSISuUd0X2RzoJ8uNm7rUGMzXSXCfZ5sD4LC8OhcCiZMD0y/SXSf4o=
X-Gm-Gg: AZuq6aI7M+0cLpkN+IKSCZRySgAkOfEbDp4HPoS3tRjNMcs3rq4NXlkTwVukHIiFqTw
 xwPNRa9H3IMlf4gzD9RWuqvdNTtHQxwDLNqS3zb4Hy3aom/4TcDEbE3fDU3ehQSecMdZmHAX6hD
 lOKQg9EtI3/qaHQwT4jGwTswcfdcpceKLN8ZXIgIbcp8ij2WlP5X9T0OOn5Jsz6JzvdIfDlHASI
 0P5NHgnOP3vqQWc0trrsIpFC7fz8vtPC8O3JXcJPBdnv++LNkqwN3IeQMl7oKGTyn/iUwmH/4GK
 0Twyei5YVft0dGsaIRgnGzjPwVo8RFTAyHKN9tWnk7BAnbJLq5SY1dQNmtN1aDpWsYREXq6EibF
 So8gjtvK3e1P+8IXZ/vt4Z6uvl0FF4Kl566HS84aLy34E2GuYwHY3HJ1Gzdtki9G+621TPc9lj7
 NcL9X8i5bKVJ+tFi+yNwl1+T8=
X-Received: by 2002:a17:906:f590:b0:b87:2b61:b036 with SMTP id
 a640c23a62f3a-b8edf1bfc8bmr1067555066b.18.1770807519201; 
 Wed, 11 Feb 2026 02:58:39 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8f6ebd76besm49296366b.36.2026.02.11.02.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 02:58:38 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 211675FC20;
 Wed, 11 Feb 2026 10:58:37 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org,  Phil Dennis-Jordan <phil@philjordan.eu>,  Wei
 Liu <wei.liu@kernel.org>,  Roman Bolshakov <rbolshakov@ddn.com>,  Pedro
 Barbuda <pbarbuda@microsoft.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Cameron Esfahani <dirty@apple.com>,  Zhao
 Liu <zhao1.liu@intel.com>,  Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Daniel
 P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Magnus Kulke
 <magnus.kulke@linux.microsoft.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/7] whpx: re-enable guest debug support on x86
In-Reply-To: <20260211055356.44664-2-mohamed@unpredictable.fr> (Mohamed
 Mediouni's message of "Wed, 11 Feb 2026 06:53:46 +0100")
References: <20260211055356.44664-1-mohamed@unpredictable.fr>
 <20260211055356.44664-2-mohamed@unpredictable.fr>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Wed, 11 Feb 2026 10:58:37 +0000
Message-ID: <87cy2ba6n6.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Mohamed Mediouni <mohamed@unpredictable.fr> writes:

> Fix what got broken several years ago by adding ops->supports_guest_debug
> support as an architecture-specific function.

I was going to say does this need a:

Fixes: a48e7d9e52f (gdbstub: move guest debug support check to ops)

But I can't see how whpx debug would have worked before that anyway.

>
> arm64 WHP doesn't currently provide support needed for this.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  accel/whpx/whpx-accel-ops.c | 8 ++++++++
>  include/system/whpx-all.h   | 4 ++++
>  target/arm/whpx/whpx-all.c  | 5 +++++
>  target/i386/whpx/whpx-all.c | 5 +++++
>  4 files changed, 22 insertions(+)
>
> diff --git a/accel/whpx/whpx-accel-ops.c b/accel/whpx/whpx-accel-ops.c
> index 50fadea0fd..b8f41544cb 100644
> --- a/accel/whpx/whpx-accel-ops.c
> +++ b/accel/whpx/whpx-accel-ops.c
> @@ -17,6 +17,7 @@
>=20=20
>  #include "system/whpx.h"
>  #include "system/whpx-internal.h"
> +#include "system/whpx-all.h"
>  #include "system/whpx-accel-ops.h"
>=20=20
>  static void *whpx_cpu_thread_fn(void *arg)
> @@ -81,6 +82,12 @@ static bool whpx_vcpu_thread_is_idle(CPUState *cpu)
>      return !whpx_irqchip_in_kernel();
>  }
>=20=20
> +static bool whpx_supports_guest_debug(void)
> +{
> +    return whpx_arch_supports_guest_debug();
> +}
> +
> +
>  static void whpx_accel_ops_class_init(ObjectClass *oc, const void *data)
>  {
>      AccelOpsClass *ops =3D ACCEL_OPS_CLASS(oc);
> @@ -89,6 +96,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, =
const void *data)
>      ops->kick_vcpu_thread =3D whpx_kick_vcpu_thread;
>      ops->cpu_thread_is_idle =3D whpx_vcpu_thread_is_idle;
>      ops->handle_interrupt =3D generic_handle_interrupt;
> +    ops->supports_guest_debug =3D whpx_supports_guest_debug;
>=20=20
>      ops->synchronize_post_reset =3D whpx_cpu_synchronize_post_reset;
>      ops->synchronize_post_init =3D whpx_cpu_synchronize_post_init;
> diff --git a/include/system/whpx-all.h b/include/system/whpx-all.h
> index f13cdf7f66..3db074c38c 100644
> --- a/include/system/whpx-all.h
> +++ b/include/system/whpx-all.h
> @@ -17,4 +17,8 @@ void whpx_translate_cpu_breakpoints(
>      struct whpx_breakpoints *breakpoints,
>      CPUState *cpu,
>      int cpu_breakpoint_count);
> +
> +/* called by whpx-accel-ops */
> +bool whpx_arch_supports_guest_debug(void);
> +
>  #endif
> diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
> index 36c5e30a03..8d0ca794af 100644
> --- a/target/arm/whpx/whpx-all.c
> +++ b/target/arm/whpx/whpx-all.c
> @@ -304,6 +304,11 @@ void whpx_translate_cpu_breakpoints(
>      /* Breakpoints aren=E2=80=99t supported on this platform */
>  }
>=20=20
> +bool whpx_arch_supports_guest_debug(void)=20
> +{
> +    return false;
> +}
> +
>  static void whpx_get_reg(CPUState *cpu, WHV_REGISTER_NAME reg, WHV_REGIS=
TER_VALUE* val)
>  {
>      struct whpx_state *whpx =3D &whpx_global;
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index 8210250dc3..e1f0fa5e77 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -1272,6 +1272,11 @@ void whpx_apply_breakpoints(
>      }
>  }
>=20=20
> +bool whpx_arch_supports_guest_debug(void)=20
> +{
> +    return true;
> +}
> +
>  /* Returns the address of the next instruction that is about to be execu=
ted. */
>  static vaddr whpx_vcpu_get_pc(CPUState *cpu, bool exit_context_valid)
>  {

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

