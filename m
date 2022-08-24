Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2326784ejc;
        Wed, 24 Aug 2022 12:42:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6PV95G+b/vx27OD64hfSDk6CjFOu67PjgeLNBqS6xj+YGWAYPzyWJcMPo/2HK7tJlm36UF
X-Received: by 2002:a05:622a:18a3:b0:343:5a0b:4884 with SMTP id v35-20020a05622a18a300b003435a0b4884mr823088qtc.396.1661370135755;
        Wed, 24 Aug 2022 12:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661370135; cv=none;
        d=google.com; s=arc-20160816;
        b=xbsHpIOMafs9gj+H+UahSYvpRou9ERRFh9kuaYoyin/dPtaaLdsBMMzzwMQhRTJSg1
         e/1O6bwze+sEV3eFma3Ru+1DM9O6tMxIOHLkc0fp4tF+kswoXaRAE19j5b/y9eu199fT
         GV+r3EmKho/cXFGsNEMc5pl3+x5R6zp3CGy/Gm4nJMNoFVihQE0gGw15rS0rsOU/B9yQ
         cxFOiTCk6izpf0X1PKwk6HH2ZUjs6Y7Xvcg0WNck5Mu7GZwSgAgpf1VP/3UXDC7lBc6t
         llUqKqapaJrvEmHDingTbdMxLtSFvsbiTUrfRWRdUrDwK3MqrHSJdVWN7XbUB5IVUdb7
         M3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2twwo6cjgLTfhoY+vSQysuT7wCW6t7DDp9CdcmsPlSo=;
        b=EFedawDqSWSR3skU50em70NIEVpjb3S9YNEvWbaqGb8+YnpZT1gNEoBju8U8znVxRb
         LiDpdC1NXtXobkEQjpMUSVm04V59nqjsX3chUo8RJfw8HNIqFam6z5nWXmMT1AHLZPCo
         AaJwTRR3WmTzyrMgbewvwMlWah52ZcKC2/tMod7t4ryYbp19IGFOQCqV4BNqACGaL8JG
         GNzLVul0PG8PwuuMyQpGj0iWYVJ9UfWF1/Ke4BbJIs7FYKSXQc3Mfm5U5hzYq6MgJy0Z
         2azrSToM2ZL/XO3Yz1XTe3+Fms3Ci5zDQZbfKkzH+JYbxHRoqnb+uALTC4xfHUnKydOi
         JUVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MqTaidW4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh11-20020a05621429cb00b0047356ab5ce6si8147050qvb.544.2022.08.24.12.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 12:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MqTaidW4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQwGV-0001Hu-97
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 15:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwFg-0001Gv-UL
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:41:24 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:37376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwFP-0007b6-7K
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 15:41:21 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-33db4e5ab43so5708187b3.4
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=2twwo6cjgLTfhoY+vSQysuT7wCW6t7DDp9CdcmsPlSo=;
 b=MqTaidW40oaE66WFNJD6evaj7s5t1xReBX0cf1JiDQwuJRV9KwrssTqy91J32f864A
 SZTDyNADnj/0pbVFEOOtg3DE4W3POKS+d/xnhGhoiUqvjL169gkqaalESgv5oyhGMjs9
 TDCt6QoVsZ3GBcODjbZOrISjqi6uRO5/RoViemArJHoz2gWp8eSA/xLZ1hieD05oVTEV
 xgJqQNuffwGJYfew4Eb1wlPEH1nHaJY8Jh9Q83f8h70TbysxiPI/2V56QBWt2e6t9tBp
 BrhCOc0n/VWoq3C3uQY+gcJ/tGLkAp8ebr7+Uux3Oq4WU1sBwyij/fL34L+8Jtula+Yn
 Agjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=2twwo6cjgLTfhoY+vSQysuT7wCW6t7DDp9CdcmsPlSo=;
 b=UDiaChgIQisfnaLBtCGZsmWhuk4Kp+A1QPZnQqVjzHN1+h3zUjKy9XYRQV9RFCf3t8
 6A+mstnxuuelZAaIcPS2NzQTuQWxXAZpXk3EmI6QhEPxoEbCTR4kWXPq97TqMpeYaBSl
 ahbzXfBEPk3u+69KEFNaRGfMsRBknMZzxNgzuA2BycKyzjQiRfppWZjD1kqP2W69PYA5
 TCukQQ6pgMbZoaJILzz9xPXvyX62YQQoUyIyCrj8TJuOojInLKDx5eTW36YjzmDT6IYg
 BXlhp5HPchcwePvmafHn+PO+LaJWg95ONUBqaY5vos1pSsNbH3yuI6T0FGOfQ6ZEVmc0
 dxbw==
X-Gm-Message-State: ACgBeo1XAZW49SzN2nAYysgDOLPpf9euFP+1Vn1bxPvarvX1F9ErFxvW
 EPUAa4gBvILs8pHcWoHiqvTxsUgq8MLb3j/zU8kcEQ==
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr767872ywf.455.1661370063684; Wed, 24 Aug
 2022 12:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-6-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-6-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:40:21 +0100
Message-ID: <CAFEAcA8jCLX8kyZHV4JW+QmKUeH2hL3Rq+q4gsvM1LXioBozYw@mail.gmail.com>
Subject: Re: [PATCH 05/10] hw/arm/virt: Fix devicetree warning about the timer
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hiuOyuXsh+m7

On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The compatible property of the Arm timer should contain either
> "arm,armv7-timer" or "arm,armv8-timer", not both.
>
>   timer: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['arm,armv8-timer', 'arm,armv7-timer'] is too long
>   From schema: linux/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ca5d213895..5935f32a44 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -344,7 +344,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
>
>      armcpu = ARM_CPU(qemu_get_cpu(0));
>      if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
> -        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
> +        const char compat[] = "arm,armv8-timer";
>          qemu_fdt_setprop(ms->fdt, "/timer", "compatible",
>                           compat, sizeof(compat));
>      } else {

Are we really sure there are no existing guests out there that are
looking for this device under "armv7-timer" ?

This used to be valid DT before Linux kernel commit 4d2bb3e65035954,
which changed from "should at least contain one of" to requiring
exactly one-of, and that was only in 2018.

thanks
-- PMM
