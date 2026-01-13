Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF12D2F345
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 16:39:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfhQ0-0002kj-5P; Tue, 13 Jan 2026 11:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfhPc-0002Tz-9B
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 11:38:35 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfhPW-0001dr-NA
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 11:38:29 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-78fb6c7874cso85085407b3.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jan 2026 08:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768322304; x=1768927104; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BAWObkOEc0iAoS3YYnimXyZaVGOXoHowNE71d0UoW3g=;
 b=VLhYBRDys8hrNnvEHsddiaesQi4rEnIPxKjUOuoISxvR5JPt8wd0U7mZHlGkqyCwE9
 4PaW10jR6E8HOsm8EEZjpbu7j2ykJBLz8/wHw43AgZrl+yzcQVc8et0GK3Z+07hjXzXO
 lHYTfDIwx2n4fPAIJpp57NEU8jNp5auQztwpG4JmH5w+k86jA449RoW7v58zRQTtF1Re
 nDXjn/gd9BrhKvQQugqdm/DqTPuvghWZSDJLWndYNr38FyQKd5fGDaXOFzwgdRcKZCzC
 j49eFZQ7OXpAI/7c2pij0oJzSV1SF8sDZxSyY1Tj071o14P7yyB4Yj1JAh9g1agyB0Wy
 PxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768322304; x=1768927104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BAWObkOEc0iAoS3YYnimXyZaVGOXoHowNE71d0UoW3g=;
 b=pMYjZZiOwKLJ3VS5D+aPqrAt29hT0vy3feyUN05MehHHMqo4T2yXFkiqWuY7W0T9Wm
 S/Cgo6kK4UAlsn47d+/GOOjaCS3DMtcTpOOiGgTE0f03Q3th5yRJu0N70r2xsdVsbHrF
 JFDMyWozBQt0aK91Zk7nlH1rk794HFvKiySdANtgt+6AdyLjCS3r340XaX81F9I8/Jed
 VQKGq3BlheiooLJpqqyfXGdS4BWGXcyva8z/MlkbR6aZ7TPOyKV29rnMl5MyihMfyWBS
 FEEMjmHJJDXWRn58/rCEa2jtRQ3zxK9T6CJ+rqT9zzBEzkRkv+20iAUPkdPC4HxoXuEQ
 8sxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSOu9iwJL5g7te9F5dgb85xNmVoGlTmjUm29EN7almYxB3oOcFoIqQWk1cboeLJ9kh7srm+EfMfA==@nongnu.org
X-Gm-Message-State: AOJu0Yzjz29sO49Xe8z1g4vhMbMa7EDav3QDGxhTHZG8Wck7tn3ChEbI
 98AJBttQWE01cIkA2kl0FpflgBorKSYFpyvumsBpGbe5jXZKWM2gRY/kedU4q+NaqN6+RV2NSUR
 XdBt9ZtBTg4SPb/ay8tbeWuVtXMXwiL8GxKPoEhrBVA==
X-Gm-Gg: AY/fxX4soQsRh1u0r6ztFE43PufacNuv5/KbuikG2fybpjPBhNdsN7obmMkiDuyKNkb
 wHtQlTEkp2+lpxaqHzoUHVu5bVQKGYjJi3Gi+LgB8FdYCN1BlwlgVgDcccI5T68478wA8ha1Xdd
 1Mpfr5MJoJ/nByZd+ico8KyYzoj/O/npC2c8S7Q0wz5NalJ4ojSw5Qx74H4luN8I+FhyHICned7
 IKMUp/JZym1MEXWcqETA2oHejpHlrx3PzXf0VySOfhqCfDv4jnCp2/+5hU9EDhM0SLtu7gwnf2L
 D4wFBtIIcZjoBBbKknmV3XQ=
X-Google-Smtp-Source: AGHT+IHR5XoIYHIoMwy7aBtXlC81gC2hC1MqeASvttMYvNl8vm200/grEiMAOqjALSLVFM81QhW6fY98ok50GhqwLFU=
X-Received: by 2002:a05:690e:1509:b0:63f:bb53:fe2f with SMTP id
 956f58d0204a3-64716b3aa82mr17815096d50.3.1768322304422; Tue, 13 Jan 2026
 08:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <20260108143423.1378674-5-alex.bennee@linaro.org>
In-Reply-To: <20260108143423.1378674-5-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jan 2026 16:38:13 +0000
X-Gm-Features: AZwV_QgiYuHeD4gBnjUGMurGitHFJs9Dycn_rfX_zwekImuGMVUiaQFFfqfpTnY
Message-ID: <CAFEAcA_Y_fTBo_0qg4Lm+7WrMdEown=-RrHHjcsKKE6WRX3eRw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/12] hw/m68k: register a mcf5208evb_cpu_reset handler
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Thu, 8 Jan 2026 at 14:34, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> It looks like allowing a -kernel to override any firmware setting is
> intentional.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/m68k/mcf5208.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> index c6d1c5fae9f..5680d516a23 100644
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -27,6 +27,7 @@
>  #include "qemu/timer.h"
>  #include "hw/core/ptimer.h"
>  #include "system/system.h"
> +#include "system/reset.h"
>  #include "system/qtest.h"
>  #include "net/net.h"
>  #include "hw/core/boards.h"
> @@ -274,6 +275,20 @@ static void mcf_fec_init(MemoryRegion *sysmem, hwadd=
r base, qemu_irq *irqs)
>      memory_region_add_subregion(sysmem, base, sysbus_mmio_get_region(s, =
0));
>  }
>
> +static void mcf5208evb_cpu_reset(void *opaque)
> +{
> +    M68kCPU *cpu =3D opaque;
> +    CPUM68KState *env =3D &cpu->env;
> +    CPUState *cs =3D CPU(cpu);
> +
> +    cpu_reset(cs);
> +    /* Initialize CPU registers.  */
> +    env->vbr =3D 0;
> +    /* TODO: Configure BARs.  */
> +    env->aregs[7] =3D ldl_phys(cs->as, 0);
> +    env->pc =3D env->reset_pc;
> +}

It looks from my quick skim of the m68k manual like
"on reset, initial PC is read from offset 4, initial
SP is read from offset 0" is part of the architected
CPU reset, not board-specific. Maybe we should model
that inside the CPU reset method? Compare M-profile
Arm, which does basically the same thing in
arm_cpu_reset_hold().

(I really need to look again at whether we can move
that to the reset_exit phase now and drop the awkward
"maybe we need to look at a rom blob" special casing.)

-- PMM

