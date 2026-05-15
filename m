Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F34CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:23:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtS7-0004Fs-R3; Fri, 15 May 2026 10:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtRt-0004DV-NV
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:23:34 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtRr-0008Gw-IP
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:23:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so80752005e9.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855010; cv=none;
 d=google.com; s=arc-20240605;
 b=g0YcqdpzApMyI12mGMyry/2cDtu7IxQna4/6evRIo91ICjZB12semITiW6IoARsRw3
 bdP9TlsWKVXufpcnyNx7JMC7iq+uMDhX5GdRZGvO6clcQSXM2nrY5QTfxm2j+cM6DBU2
 GcZYwWevvyYa102Ozd4axyoVE9x3ReMs+bsu5PC6I6EUiID5aeKfeoMF7WAJimIDK4kZ
 qqASfNH7YFiO6dSJC39xRVxJZFKqZHaAUrG7L4bZ8MHraDzG6Uo5/xSx733ow5a2d00F
 Gi55g4AFkVYVaVc8pI2GZgG7fFVnVt9bU8ToK8RwcNNjuViD5Z1FmrakYicOECZu8WS9
 MGIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=pS6+hIU7k2tWi+tHU0YDo8T8AoOJIkTgkEACRJxPM3g=;
 fh=xGEKFP8MTRs7jmqprweWayqx7/iVVu2RAiI5wMJs4gM=;
 b=S/wp9kb7HAP0qIV81ZIb+dUVQduRT2gdgMn1QxEyIuGe5tYT155zpoZuD2JmUAsijI
 2CQpux6VS58f/6XyFaeHLrtuc3iPES2NbMeD0ZwT6VhPmFOEhC+T9kXccztxOlt2BxfG
 AE38IPESRe/9YMsRaAIJlHxnuDFvNKbiYY/Qwl5cv35onBANkY+LLvYmMwegZqFwughb
 AccXCHevzPKNek4ZEE8sePkFPz3vXB0CrKJf9OZnoh8aBEWKRXTQRhSGb/aZNZjy9IwI
 t+AhOwkso6MH46pdeTEFhWROJ06zER1q7izVySATkfiLz95h/1QSz47tfdDDTnmVcpNN
 AZVg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855010; x=1779459810; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pS6+hIU7k2tWi+tHU0YDo8T8AoOJIkTgkEACRJxPM3g=;
 b=ITdKyJIbMBcZV/JLpFX/5ZOVwv4fhqCH5zpm3AGZcYqxHbZFwcSvPXveNhHHUgfwJZ
 cWWVI8NZjWQ9nh+yfA/KRlCi+JRWd7Ba+I3rA3rb/xSksLt08arilrwCNMm3ihh0JaDJ
 F7BvDusszhT/WsKWOFoKctLJ5jFc5sK/Y2UPcXGh08eUPCl8SrXgXuF4oqQ+y5O+6KBb
 WDvdSq4yOIdD2pjaH1MhmgD/GsRgK5Pvr/PyiCGLEV5MK3pNutoJpcMY6qR5w2FvBxU1
 VEBZqvvDWjA8cE83oM3S5yh2CLF84dlNgtkdLn2h+W2oqosNd+74wgV++vsBuHMEUAoR
 SrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855010; x=1779459810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pS6+hIU7k2tWi+tHU0YDo8T8AoOJIkTgkEACRJxPM3g=;
 b=D4R+Zxcjh2s0kRtwsaifbgH5ZdugMhth969PCzLBzb1lUBrnb4z3LUGIcfBM/oZkJQ
 sD4gR7LusrcT6JKAuR+hOtUfFV4doM8/bdKrXsFHsXrXTCu3UO5ErVR/0N8B9mnt6Tjt
 F01vuEtXAelqg2DDayKyfZ/CGQfjocZFJIjgk4r+VFnQJE0e39stE2lnzakn6wyB9TRL
 mbEC1nXnQZ0ay60a+ahiThKdT2Pc6kIjrU+xul+wU2kswfpvqyD6o/rhSsMtev7uEsCQ
 HJ3SOVOsrdKK0uRjXxYfJw8/ilXSn9BucDzyvXe7MWzA4gepeG1PRwxtaAfdKG2h8HbC
 z1VA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9gYMAxWONVV7MaV791BzwgqnstrhnootZO1AcxgSyouY+rIZTtMmfdRXuZsspM+ZmiNt4Zb+cJfA==@nongnu.org
X-Gm-Message-State: AOJu0YypKXH0MjD7ZWD4VyU+qTIdYT1jd1odOSu81/mMhcb7HmzJKslF
 zpNeYt0uHBxDkf3UhZ587/Lpnf5pJrAX6Q+NCvOr+aNOLmCvO2jFQ7X7rh6JNmjse/91tLdnp7d
 AsSK9Qdh9q9/sE8lvmlZsjJEswE48oIwsmiUobyC3SA==
X-Gm-Gg: Acq92OHoAQyDJyOGIfqjSGGGaTX6gImof1XhehwZKM+uXAvBNh9Bl0OEGhyPwdm+S6/
 ucCbJy3le7SUG/OrHDL93gqp01yOQH06eRUIYaPsrJ+JzpnjBcE9VaDkgh8V52SLpycaN6HAM8i
 dyZSZqGLP/GhYNoP2yxw2zKVC1pZKRqKKgtc3nSUvGo3+kgepDOLV5T6r/AsdUQtSxJWftifs/x
 KJFb6AsPjvJ0Et46UWaCeNyfmCTiAOyOxe8gYms6LsTk04pcJz8hEzHW3iNa+0qlvgl3Kw20uzP
 bCQA036kQImEerumjpIglo4YN3lrqswJulUawTWJmyxAV47Ihg==
X-Received: by 2002:a05:600c:1389:b0:48f:de4e:882b with SMTP id
 5b1f17b1804b1-48fe60e524dmr57072865e9.6.1778855009122; Fri, 15 May 2026
 07:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-11-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-11-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:23:02 +0300
X-Gm-Features: AVHnY4KIvkL0_0vfP15IKf7_TLPd1zEFm2dUQHg-ZrUWyiN0LpAFGxbdNQQFHMY
Message-ID: <CAAjaMXYJr7Xg+0xSVNaxkG+5ykzJCL=uNwpmeN=GYbbGd34ZjQ@mail.gmail.com>
Subject: Re: [PATCH v6 10/20] target/arm: Restrict IDAU interface to TCG
 namespace
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x334.google.com
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

On Fri, May 15, 2026 at 5:11=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Emphasis the IDAU interface is restricted to TCG by

Emphasis?

> moving the header under target/arm/tcg/. Move the
> definition to cpu-v7m.c which also contains v7/v8
> hardware (NVIC), keeping only CPU types in cpu32.c.
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  include/hw/arm/armv7m.h     |  2 +-
>  include/hw/misc/tz-msc.h    |  2 +-
>  target/arm/{ =3D> tcg}/idau.h |  4 ++--
>  hw/arm/armv7m.c             |  2 +-
>  target/arm/cpu.c            |  2 +-
>  target/arm/ptw.c            |  2 +-
>  target/arm/tcg/cpu-v7m.c    | 11 +++++++++++
>  target/arm/tcg/cpu32.c      |  8 --------
>  8 files changed, 18 insertions(+), 15 deletions(-)
>  rename target/arm/{ =3D> tcg}/idau.h (97%)
>
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index 98ad08db036..70555962bb9 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -13,7 +13,7 @@
>  #include "hw/core/sysbus.h"
>  #include "hw/intc/armv7m_nvic.h"
>  #include "hw/misc/armv7m_ras.h"
> -#include "target/arm/idau.h"
> +#include "target/arm/tcg/idau.h"
>  #include "qom/object.h"
>  #include "hw/core/clock.h"
>
> diff --git a/include/hw/misc/tz-msc.h b/include/hw/misc/tz-msc.h
> index 07112d8caa3..6cf4c6b09eb 100644
> --- a/include/hw/misc/tz-msc.h
> +++ b/include/hw/misc/tz-msc.h
> @@ -51,7 +51,7 @@
>  #define TZ_MSC_H
>
>  #include "hw/core/sysbus.h"
> -#include "target/arm/idau.h"
> +#include "target/arm/tcg/idau.h"
>  #include "qom/object.h"
>
>  #define TYPE_TZ_MSC "tz-msc"
> diff --git a/target/arm/idau.h b/target/arm/tcg/idau.h
> similarity index 97%
> rename from target/arm/idau.h
> rename to target/arm/tcg/idau.h
> index 0ef5251971d..e5736ad848d 100644
> --- a/target/arm/idau.h
> +++ b/target/arm/tcg/idau.h
> @@ -25,8 +25,8 @@
>   * connected to the CPU using a link property.
>   */
>
> -#ifndef TARGET_ARM_IDAU_H
> -#define TARGET_ARM_IDAU_H
> +#ifndef TARGET_ARM_TCG_IDAU_H
> +#define TARGET_ARM_TCG_IDAU_H
>
>  #include "qom/object.h"
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index a29eab6c915..68a1cbd6316 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -20,7 +20,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qemu/log.h"
> -#include "target/arm/idau.h"
> +#include "target/arm/tcg/idau.h"
>  #include "target/arm/cpu.h"
>  #include "target/arm/cpu-features.h"
>  #include "target/arm/cpu-qom.h"
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 31e0a12a986..76f5909e902 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -24,7 +24,6 @@
>  #include "qemu/log.h"
>  #include "exec/page-vary.h"
>  #include "system/whpx.h"
> -#include "target/arm/idau.h"
>  #include "qemu/module.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> @@ -42,6 +41,7 @@
>  #include "hw/intc/arm_gicv5_stream.h"
>  #ifdef CONFIG_TCG
>  #include "hw/intc/armv7m_nvic.h"
> +#include "target/arm/tcg/idau.h"
>  #endif /* CONFIG_TCG */
>  #endif /* !CONFIG_USER_ONLY */
>  #include "system/tcg.h"
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 8706dd59dd6..a4842a4b62b 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -17,7 +17,7 @@
>  #include "cpu.h"
>  #include "internals.h"
>  #include "cpu-features.h"
> -#include "idau.h"
> +#include "target/arm/tcg/idau.h"
>
>  typedef struct S1Translate {
>      /*
> diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
> index dc249ce1f14..02abd831e6a 100644
> --- a/target/arm/tcg/cpu-v7m.c
> +++ b/target/arm/tcg/cpu-v7m.c
> @@ -11,6 +11,7 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "accel/tcg/cpu-ops.h"
> +#include "target/arm/tcg/idau.h"
>  #include "internals.h"
>
>  #if !defined(CONFIG_USER_ONLY)
> @@ -40,6 +41,16 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, i=
nt interrupt_request)
>      return ret;
>  }
>
> +static const TypeInfo arm_v8m_types[] =3D {
> +    {
> +        .name =3D TYPE_IDAU_INTERFACE,
> +        .parent =3D TYPE_INTERFACE,
> +        .class_size =3D sizeof(IDAUInterfaceClass),
> +    }
> +};
> +
> +DEFINE_TYPES(arm_v8m_types)
> +
>  #endif /* !CONFIG_USER_ONLY */
>
>  static void cortex_m0_initfn(Object *obj)
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> index 2127d456ad6..73d21c6cf7d 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32.c
> @@ -12,7 +12,6 @@
>  #include "cpu.h"
>  #include "accel/tcg/cpu-ops.h"
>  #include "internals.h"
> -#include "target/arm/idau.h"
>  #if !defined(CONFIG_USER_ONLY)
>  #include "hw/core/boards.h"
>  #endif
> @@ -899,17 +898,10 @@ static const ARMCPUInfo arm_tcg_cpus[] =3D {
>  #endif
>  };
>
> -static const TypeInfo idau_interface_type_info =3D {
> -    .name =3D TYPE_IDAU_INTERFACE,
> -    .parent =3D TYPE_INTERFACE,
> -    .class_size =3D sizeof(IDAUInterfaceClass),
> -};
> -
>  static void arm_tcg_cpu_register_types(void)
>  {
>      size_t i;
>
> -    type_register_static(&idau_interface_type_info);
>      for (i =3D 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
>          arm_cpu_register(&arm_tcg_cpus[i]);
>      }
> --
> 2.53.0
>

