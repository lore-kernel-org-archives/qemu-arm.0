Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp265775lfk;
        Thu, 21 Apr 2022 04:12:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqt0ynJCSuPGQRmzpAARZHDqhCY6zPGTV8hddLcF3VZc6wYZ034zFXVaSd7JBcRgXn+YHW
X-Received: by 2002:ac8:7f8d:0:b0:2f3:3fea:5033 with SMTP id z13-20020ac87f8d000000b002f33fea5033mr5316613qtj.226.1650539523582;
        Thu, 21 Apr 2022 04:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650539523; cv=none;
        d=google.com; s=arc-20160816;
        b=FDjbprenrw+cqRULabe07QnkVXSjRKzDead7mXsbFTAv82BoJqlWpRrMiHiMj1uL1m
         ludXTQyenYKwIucmUHiA9CPa/70vbHEi3QdnmmIRmiwer2IU5hR42ym6e0yXvBlMctlZ
         ftcRndJS6P3frDUagKrcRESNaqVavbQBsg4XKHSly4gHac+L+IU6FLTYQ+32Zo2rUMME
         hyLRknxYPEMfhkRbZE9LAKjyqjHrHKm7pQg85pAgMJrKbw/fVyDuLC9PrLpd6Br8k0ld
         EFkG0jd2X9RyY+HHQ7oNHQWBfWquo/Au0M3kvG+TZqv4UmEpR1EbVk6Z2mJotkNWDtUO
         yiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6hIdhswsfcl65vmDp9ezeh89wHPSBVwDl2kytfmBQPU=;
        b=vDeH2ioy7Sj32M5eOfiEES5N+akJ4Mgz1bTphcgmNa42di5BFwFYvf/Cb6bhaKy7/c
         cx6lssq0yCr3DdyYF94TOdh2t6Q45CLTxBdfsJ23TNCxEbTeyWAPqWV7hG8/u1pKPB/G
         PhPoynNJq9limv2FyLoAHfMaZxywXUV8Uo7geiUEUd6e5tJ52V/Jhj1f8PcP07ZHF/tk
         R3OBP5Y8bBSR2GjomErUBCICmhEfxoGavUzAoLCTLQcrrG+PsOANR1TR7lJpWTdjgI51
         Ztu6NMLg7ACqvbHQ02K3bWZCLH0puDJEzhx5K2ah9rBssXxvMOa5Bhjcdck/wCDblsGR
         uplA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pc3xanMj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a05620a2a0900b0069ebb84bb2asi1389434qkp.501.2022.04.21.04.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 04:12:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pc3xanMj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhUjD-000228-3l
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 07:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUYP-0001N6-SY
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 07:00:53 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:33307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUYK-0007sJ-Ou
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 07:00:53 -0400
Received: by mail-yb1-xb34.google.com with SMTP id j2so8118734ybu.0
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 04:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6hIdhswsfcl65vmDp9ezeh89wHPSBVwDl2kytfmBQPU=;
 b=Pc3xanMjpZzljSTieaCVGCvs7h08nKpUXF/XATLBgXBeuIFKjXA/g6FXZxzFGenPPp
 R2YyaCX2olaRL68RRGltIBgreXkhphnKGnmGRhgorYPIimW27yD7jtmY/JW0n3G2aKxU
 aQyOhl1GAUY3bf6A8Izett9KlfNa22SG3qVYto00S6QpV4YsRh6kRG6xWPjuYIQASWcg
 0wmadze5j6EjO5I3kehSEYnGVAfaMOH8bHl7ypyNodyunELCVTSnkggsyTOr23VjQ8K1
 nM5cq+ifO1nVD4Baq3IzeXzakfGoeRpFp3D4lYHu4ueoxFwvauvXvZOxGq6E9ev5owWu
 o26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6hIdhswsfcl65vmDp9ezeh89wHPSBVwDl2kytfmBQPU=;
 b=mztcptL4dbRkhPY0dWA5ynpt/Wccs2VpHXbSOdIwZIJxCWbsmY7zjfjGk7QkB3gWmx
 vkJU2g2ev7PHTpdNhm+pJxG6zd06Vc1wvLxlTKunAaOkHX6o/beXpXgbhmc7dk0SL0By
 PsPDGs7EGgF4mPo/qr6dWLOlAEA2fVJhyDiGgFL8rNRqjwXSI/LiwT+2eCgqB1Giwygv
 ZnyS/f8koOJ1sEPUGt/MFaG9lBvdySqjTCylfsRpPAgmtOWqYbh21p2OU1+Ge80HgPZR
 0tfjNDiDiuNMg9I1f3mIA5KRKVMcKUrrf71RsemRyNSC2TlhQHsmSUsBxZ5RGhrBzu2V
 6Jxw==
X-Gm-Message-State: AOAM533tRB5SH7F6Jz3zaSQrgq/kzaZGCCHVVZrNw5YNKDbQWlz1D9/b
 sEhGZiLaaoewKbTvt7+xrG30TA9PFMASiv42+XwaVQ==
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr385235ybs.85.1650538847566; Thu, 21 Apr
 2022 04:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-7-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-7-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 12:00:36 +0100
Message-ID: <CAFEAcA9TG60w87c0SpLA85g4ogCYTX0gi=ihNQaRQkpaoh1MYw@mail.gmail.com>
Subject: Re: [PATCH for-7.1 06/11] hw/intc: Add a property to allow GIC to
 reset into non secure mode
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lRDfcs1exP2p

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> This property allows certain boards like NPCM8xx to boot the kernel
> directly into non-secure mode. This is necessary since we do not
> support secure boot features for NPCM8xx now.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  hw/intc/arm_gic_common.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index 7b44d5625b..7ddc5cfbd0 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -358,6 +358,8 @@ static Property arm_gic_common_properties[] = {
>      /* True if the GIC should implement the virtualization extensions */
>      DEFINE_PROP_BOOL("has-virtualization-extensions", GICState, virt_extn, 0),
>      DEFINE_PROP_UINT32("num-priority-bits", GICState, n_prio_bits, 8),
> +    /* True if we want to directly booting a kernel into NonSecure */
> +    DEFINE_PROP_BOOL("irq-reset-nonsecure", GICState, irq_reset_nonsecure, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };

This isn't how this is supposed to work. Non-firmware (ie Linux
kernel boots) that have to emulate firmware init arrange to get
the irq_reset_nonsecure flag set because the GIC implements the
TYPE_ARM_LINUX_BOOT_IF and the boot.c code calls the callback
for every device that implements that interface. For firmware
boots, the firmware has to set up the GIC the way it wants.

thanks
-- PMM
