Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1783511lfb;
        Thu, 26 Nov 2020 13:47:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQjgmJ/HH9yePL39px0w5jcUCoX/pS31xdxebW7xzTLRstk78+jpuARocEKthEKutcE1ks
X-Received: by 2002:a25:e74c:: with SMTP id e73mr7470586ybh.308.1606427275846;
        Thu, 26 Nov 2020 13:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606427275; cv=none;
        d=google.com; s=arc-20160816;
        b=lxGnIo2Jt6dsO3v6qzhce+RUv+OyYnOz2cyfK3giMuyecCVILyr3Xpcxzi3SHcAPs3
         UGAMGhOr+h4n0TMljrRf226Bjl6UWWq/PUyjZEhSgwYQBmTesPYFgNsvAA97dm3O46gC
         J4RpnPqnvbE7pjrcI+TgL7mws7LOIr+XHUDsdFrQcG3PC3zWe3M9EVmSUc21pJ56bEHv
         IV8sEBGgzl6Hbx08NB3/RjYZAaSe3Pni1m9zW65K47cz3by7XYO8TewF+uEqYqUbx+Ub
         gk4WsBDFlwjajYnPkJPc5yJIh3hMXvIxab2X2RUOE96Ld23aC7QegncQFIBuR4yBekSC
         f83Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DttXur++On+IvHWUrI5foPQFwrfhjzniznKAB6nVKy4=;
        b=a6CJHitpw+kdMH7i9QwVgHDO9z2K5Q2kUQQvmhIGEN9kE7OQguAxNufo0Ez25A+A7b
         GO7e2sjBWEn0lixokbJvAm7RyLpJzbo1q6u3qp0LGiRcZPA5nzWRsvynbFVBj54cB9AY
         D8DK2RJVc1viQ7gvz9CPwJpsMDdaG9LMMXVE0a9nn9BB5ipK5NX8QICSzcnWezNt0dHw
         tAtRprvU9wkNG+ebQeiCAv4FFt+1zppEKHNjTqDL+7Sw66b8zkeKg+dztIF5hVQj4h4C
         Z+1UdNFowInjDJH1pIvjPN3/+rsla0Scm919nozJeFKqrp4yhZePWiWqbHJNAvrN/MGh
         Vptg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iBLH3L8O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si6053522ybl.380.2020.11.26.13.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 13:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iBLH3L8O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiP7L-00082X-9l
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 16:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiP7D-00082G-Na
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 16:47:47 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:37770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiP7C-0004s2-6A
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 16:47:47 -0500
Received: by mail-ed1-x542.google.com with SMTP id n24so1583842edb.4
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2020 13:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DttXur++On+IvHWUrI5foPQFwrfhjzniznKAB6nVKy4=;
 b=iBLH3L8OmdsivWaan/fYFxVIcih9Pztek54UAeUDwuuIQowhRxCjwLv4wa04sevVbd
 wts+qGJf99SEYpy8SKkmY4MpBMnF8VXhaYJD9RuspQzJaV9tpmyT824c0Wdd8z7NPqwh
 6N0bWJa1BMyc4g3+UinEdpnT/BvucEQcxiEPn/E51YT7BYoH2UJyK2v6V/nV6VqaALgD
 Ei4x+TukjCdy+drbvNTUg0OKy0zWi1syBkhtEdawEJE6DnNXIPNyBD3KNgIKDmCzBM0X
 kHB8O30tCQ72HYdtmiRlNUVBWKBeDYdpVhqrscyCXsM4+OAEBzjcWMD6xSR3eGBjnwVU
 rvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DttXur++On+IvHWUrI5foPQFwrfhjzniznKAB6nVKy4=;
 b=RPd2KrQmmbU9xprc/A5vIa1cYgGtlucdYVVRYqdt9nJdaK4kkY/onYURUDPcLI+xq6
 7Ef/BMI4+JVTxPWAOXAxOzulxvhQCntxCXN2BcPhJ9+qmL2UshjLJb/ZPgDDX/6TtPTX
 rD/x5LC6nm0F43ROUrkeBrRKb6bg4FHDo9Gb2llTGCN+Gg2yXpQuvycIpcC5bOAS7Swp
 0EYKMFwJ3nbRyl1ZJTV2s3xVTGdFmApgZD0wx+IpQSmdJufS79Boy0Yy1fG62eyTyzXH
 VPUVFg36veO+N23AN+2B/r4xSxM3ma5hA0YRj+7lv5OC9NMSKvs0ZoBrUnv7S5rxlcHv
 jn7A==
X-Gm-Message-State: AOAM5329ll1EU07QkI5pF2byDljNllXuNCeMYP3KSsWXhkxFiEX7SoPZ
 Pv1pXQ3Q3X93NwuzYPCbbgaGf2Sa5/G1wBL/ZhAQRA==
X-Received: by 2002:a50:fe88:: with SMTP id d8mr4389585edt.36.1606427263662;
 Thu, 26 Nov 2020 13:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-5-agraf@csgraf.de>
In-Reply-To: <20201126213600.40654-5-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 21:47:32 +0000
Message-ID: <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm: Synchronize CPU on PSCI on
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HZ4jN6JEe7+A

On Thu, 26 Nov 2020 at 21:36, Alexander Graf <agraf@csgraf.de> wrote:
>
> We are going to reuse the TCG PSCI code for HVF. This however means that we
> need to ensure that CPU register state is synchronized properly between the
> two worlds.
>
> So let's make sure that at least on the PSCI on call, the secondary core gets
> to sync its registers after reset, so that changes also propagate.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/arm-powerctl.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index b75f813b40..256f7cfdcd 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -15,6 +15,7 @@
>  #include "arm-powerctl.h"
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
> +#include "sysemu/hw_accel.h"
>
>  #ifndef DEBUG_ARM_POWERCTL
>  #define DEBUG_ARM_POWERCTL 0
> @@ -66,6 +67,8 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
>      cpu_reset(target_cpu_state);
>      target_cpu_state->halted = 0;
>
> +    cpu_synchronize_state(target_cpu_state);
> +
>      if (info->target_aa64) {
>          if ((info->target_el < 3) && arm_feature(&target_cpu->env,
>                                                   ARM_FEATURE_EL3))

This looks weird. The CPU was off, so not running anything.
Why doesn't the state we set up here get synchronized to
HVF as part of the normal enter-guest-code process that we
do when we do whatever HVF's equivalent of KVM_RUN is ?

Also, we change more bits of CPU state later in this function,
so if we do need to manually sychronize in this function this
doesn't seem like the right place...

thanks
-- PMM
