Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp325000ejx;
        Thu, 1 Dec 2022 03:56:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5g2MYV2fu4R4bjcN2MBtrEUz+EuUZ+UmAQqMFTi07hhqke9QM5/HM9LsWrzwjIGdjdzSrP
X-Received: by 2002:ac8:4453:0:b0:3a5:4fd3:865f with SMTP id m19-20020ac84453000000b003a54fd3865fmr46052229qtn.307.1669895765100;
        Thu, 01 Dec 2022 03:56:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669895765; cv=none;
        d=google.com; s=arc-20160816;
        b=uPkk0xyBvUzZmRUErbCQtT47+XFx3TNAdcg3Zic01FojOwrNL7E77XjIlxv9gqZDVy
         zeMxdzj1n3z9OpiVUjiLWTKAW9RXl48uIVOrZej5BVWsyiDJabT3+svZwgBIws2HhhjM
         BuusfBo12GEcIMUdkrYBZKb4bHrGY2T/azC72YdSuuq1r9WiiidRPZQGSe773QYvCgZx
         5QZyeSdFzGMiVTpNzSFV+N7eSVc5ypDanj2s13bCARor6p5gkcp9PHgmoSI9lWdasfpk
         eeRaJi4FbHQZAQwUR4SpHPkeMMaG/hOZ6nsGCakbczUPlTvJSh6gr+Y9HMkKNowbWdIF
         Obgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LKrUTnLnwJSult3Ncd1PzInTpGmNei4vgWYYKW6U+Nk=;
        b=LbmD13oHH5qffw12OaJj1hNcGyuoX5eFBLQrMMf0uljjf+Pq1j43RG14dSvY09Hl25
         WNrLjTbbQUNWEGr8vYyIwaNc/3Z1phRnz/VFMPuEqQPR99jCOpvxwLDoOfP2d10VxwGl
         +PgSWhLcwgXWmhgLr8KUoYa1UeadV/WUE6jYUfUEEbkyA3scFAOruM1Oa9Q9bgR33B4H
         nRBR/0rxmN3mgZdSnlp798Z2l+yvr+C/Y9+ooUNf0m+wYPykaB0g1cQbMVWcooEKcyXY
         9UyY7yXa7S2aqa1Ca8j81b9L6/NzuIszSe7nmhhUd2o9EnZ8kdElgFIRRl8b3NUXTfy5
         zIUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kxk0j80b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l29-20020a37f91d000000b006edbffbf44fsi2104638qkj.369.2022.12.01.03.56.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 03:56:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kxk0j80b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0iA9-0007fG-M4; Thu, 01 Dec 2022 06:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0iA8-0007ed-Mu
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 06:55:32 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0iA3-0006MG-1t
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 06:55:32 -0500
Received: by mail-pl1-x629.google.com with SMTP id g10so1402517plo.11
 for <qemu-arm@nongnu.org>; Thu, 01 Dec 2022 03:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LKrUTnLnwJSult3Ncd1PzInTpGmNei4vgWYYKW6U+Nk=;
 b=Kxk0j80bsBfNsjQ0+qtkw4MwctlTRI+ahTwZbMp7dXWT5RRkaEcCmZacjqajNGAhz7
 fB/vfYxDUZQ7LyD+x3K7TrNS7rAFxAE38GygTd1bHQk1plYLKnoQ3IjkR8tHtJ55ID7V
 Xa1nc8em4+060kBsTdBWBtIRYWbTkVCa6Tz21IjKwcdmvYnsWspfGTewQmJeka8GE5Du
 4NkXKhAb8U/fkjv+TO2O4A9z0d7pYCf76t4XynAxVv+VnvJfMH2516uQbjXynKFaiz8o
 eb4oKfVvCxBbU6BguFsNpdrpKTX/cv9xBAAgXnlHlMUPLGRfbosfGrPZQUYGNFtgXyn8
 KNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LKrUTnLnwJSult3Ncd1PzInTpGmNei4vgWYYKW6U+Nk=;
 b=uD5jxJd2eII0fwNHeHMI4nrRRefmV+OdDWMkJan5ouKxWOK7UsR75aYa0Oov/p51l8
 cXIMy+Cyb+5V1IQDovjyFdecFPkn9gXimNeUWe02Kb4qbeqayAo/SrYj8iJzuCeSFuM5
 vfzHVBs39l+7eRgDJLugQaB5EJLB5Jlg0RHRGuD5T4C+QH4Z1LL430VthZ58HfcCZRGi
 Jpa+DNYZbbq6uSRHM0p+wS9X38eBUdigpxnasAuAZmL7mIt8JLyb+h3IsLUxvOrmc8Ke
 IevGQEz1QghOiG0NMwvt8XvlYxBS96ohx3T9P2d3FWIlzxGEsf7CHcup15d+M2UuWari
 GScQ==
X-Gm-Message-State: ANoB5plIxoIMI1il1/6DZLHgNvWv+uPI0ROC4Vj8AZanQEAfhHw0ykWO
 +Ky40Sn21IuwccdWf4BG/vTaI/2tZCCMmojQJx3wDw==
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr4269541plt.60.1669895725617; Thu, 01 Dec
 2022 03:55:25 -0800 (PST)
MIME-Version: 1.0
References: <20221130111559.52150-1-thuth@redhat.com>
In-Reply-To: <20221130111559.52150-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Dec 2022 11:55:14 +0000
Message-ID: <CAFEAcA-hneP0SLUTW=_maTztra9gYnKgPeXevDcVu3jZZnDObA@mail.gmail.com>
Subject: Re: [PATCH for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9GPAhaV7nR15

On Wed, 30 Nov 2022 at 11:16, Thomas Huth <thuth@redhat.com> wrote:
>
> By removing #include "kvm-consts.h" from arm-powerctl.h (seems not to
> be required there) and adjusting the header includes in some files, we
> can move them from specific_ss into softmmu_ss, so that they only need
> to be compiled once and not for qemu-system-arm and qemu-system-aarch64
> individually.

> --- a/target/arm/arm-powerctl.h
> +++ b/target/arm/arm-powerctl.h
> @@ -11,8 +11,6 @@
>  #ifndef QEMU_ARM_POWERCTL_H
>  #define QEMU_ARM_POWERCTL_H
>
> -#include "kvm-consts.h"
> -
>  #define QEMU_ARM_POWERCTL_RET_SUCCESS QEMU_PSCI_RET_SUCCESS
>  #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
>  #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON

kvm-consts.h is where QEMU_PSCI_RET_SUCCESS etc are defined.
So while the #include isn't strictly needed for compilation to work
because arm-powerctl.h only creates the #define and doesn't use it,
it does mean that any source file that uses the QEMU_ARM_POWERCTL_*
now needs to include kvm-consts.h somehow itself. (Usually this is
going to happen implicitly via target/arm/cpu.h, I think.)

I guess this is worth living with for the benefit of not
compiling things twice. It could probably be untangled a little
by e.g. moving the PSCI constants into their own header rather
than defining them in kvm-consts.h, but I'm not sure if it's
worth the effort right now.

> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 95268eddc0..9ca6bf1d17 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -84,8 +84,8 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
>  ))
>  softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
>  softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
> -specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
> -specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
> +softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
> +softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
>  specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-crl.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
>    'xlnx-versal-xramc.c',
> @@ -126,8 +126,8 @@ softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
>
>  specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
>
> -specific_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))
> -specific_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))
> +softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))

This file could now be listed in the
"softmmu_ss.add(when: 'CONFIG_IMX', if_true: files(...)" list earlier in
the file.

> +softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))

This line could be moved up to next to the other CONFIG_IOTKIT_* lines.

>  specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))

thanks
-- PMM
