Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2564199lfq;
        Mon, 11 Jan 2021 02:31:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxph4VZ6Dxn5JLsZqkZ8RBF4wNyH6iRescJWdwToduVv0jLk/nKULwi/N9akMPfDfo5Tx8
X-Received: by 2002:a25:11c2:: with SMTP id 185mr17568326ybr.74.1610361111666;
        Mon, 11 Jan 2021 02:31:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610361111; cv=none;
        d=google.com; s=arc-20160816;
        b=UPg2P8yhu9IBLeBCyzJPEQzlqqCDVZlgCB4HedZCPuAlU1CMpZsS3FUrsrZ7ne9ISh
         /5KvS1TfVDsJJZvjRl95K5mP7cpP308/5Ifit3/QFLaVvKCv9nDe8e7+Y/pvcuixeue+
         Ct0V2w++hbeZcoXLtousgH/lGmgcAVLGyJR8heLzAp9IHT5JxiuH//YeQdfU31Pdcdf1
         ubz0Qsh3vzxlVNgW5imt53Tszd12jKjnUx4DysRk2//7pec+QuzEaikAzdaZHTVqdy1I
         QoRA7q/kf9mGjEQU4R7MP31JnXsYfFkbSJwbfGZQCAv+Ly/F5zVdvfvP9nEg0fNfilyV
         +SHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKeTIQ6k7Ajw6Y8Kt8KUnyrc9f8sIz2BFeY2ErOSnbw=;
        b=PsOYyfWgaKVW8R6H5Q15JxorDm8x3xPDzJPCW87H/YHyEKtA3gEalpRD4W1EZxKH3i
         x72wbHA/xhhr6ABZvzVyEUNt4qLJJBiwVzeT1k8YhUaATULNZlWxag1x1ux5VDXg721s
         AvQL6UIW7Lo5aWDrKG9JWx262lZtz25zeab81dcsthamN2LQ0/QEEyMwCeWx6VuLNcu0
         93x99jxfyvyN/SVa3vL6q3W9cVjbx2QQnHFQAQ7NjyxcaBJ8CLpV7O7p1/NVV0/5e1zK
         OImebXOgiU5JsLpgIty513eQkAW9S0475TJL0lRLznzXZZ3HWxlhXSgrCfIHBe9orrlP
         6QkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QEXyS5nd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si19216549ybm.261.2021.01.11.02.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 02:31:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QEXyS5nd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyuUI-00077O-Uk
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 05:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kyuU1-00075s-Pb; Mon, 11 Jan 2021 05:31:33 -0500
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:45571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kyuTz-0004Cb-P5; Mon, 11 Jan 2021 05:31:33 -0500
Received: by mail-il1-x130.google.com with SMTP id y13so9857146ilm.12;
 Mon, 11 Jan 2021 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aKeTIQ6k7Ajw6Y8Kt8KUnyrc9f8sIz2BFeY2ErOSnbw=;
 b=QEXyS5ndrsIZ1MDUjrVZ+lKqCrV6p9HMN9wKt0Wlp0cqMZl/TOYh3NwC4iotGE3FVt
 lwaHqa/MYV5yeFmWk3ru3KNydmHGMSlLJOdtziFMwvnVSnHP4toiJhw1iZyYP7DP/Twf
 o2iF/4IK1m+zDX25nP31wCXkHm7M++wYMTRpmtUos6XabuSI+ubwGcgsX0yDvIsPNowI
 ffhuhZG5BBsLaCOZEeN2U4RM3Cw7Y5Yl/BqjoOZEgnRsCh2wmwWANyJeOn1oHW7YwPBt
 61cJ5oO3tLZbkTldkUVW706Pxe6UN0w522Sf7EkI0GJqG6O13zVKzD2QPs6ToVkLYXJ2
 NQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aKeTIQ6k7Ajw6Y8Kt8KUnyrc9f8sIz2BFeY2ErOSnbw=;
 b=nHIw2XoBeWMRXlCsu9PUgJyIW4tpqj45c/737Us693MPuxcyQ1qPZIOdAKc9HdSRJQ
 leb7UkhsilReMM0yQxdSklY6e/zswNvaqsYk3Ub1XrQGcI43VCWgbnDXptMYKPf0iryH
 lUjLJodqHzpz2V83bY4Xg6ORGD9HpJ8c5jPJsWQPZeRBHRxPeO6eyNktCFd3WQmVzMiZ
 +qbBr+f4VuilmP7Fpm13Q5KXqXSY2lmgNMtsEvSHMZJfFGG/Z+iUyUnVkR3+xeFp0dlg
 upL9x2WHV9KefTT6dCmKWvyJ/tpVomUjw5HUJQ3zddNQpFhtwRf59Wj9g9WVCUhiUhNV
 YsUQ==
X-Gm-Message-State: AOAM5306Eq95MoTPQYiNrZJIpt1gPnR/9pv42OxIlPIbus/2UNwa4/8e
 tfEvSfCuFMdm4VQoZxN+O79LgVm3dk9cMyAX/WD1dkXWaV4=
X-Received: by 2002:a92:c052:: with SMTP id o18mr14598479ilf.245.1610361090342; 
 Mon, 11 Jan 2021 02:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20210108185154.8108-1-leif@nuviainc.com>
 <20210108185154.8108-4-leif@nuviainc.com>
In-Reply-To: <20210108185154.8108-4-leif@nuviainc.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 11 Jan 2021 11:31:42 +0100
Message-ID: <CABoDooP_z68nwT6bi_xsZ156040tiP1qD1W=GOVAjg2D5Xg1pw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/arm: make ARMCPU.ctr 64-bit
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0KeRFbPXtVhF

On Fri, Jan 8, 2021 at 7:51 PM Leif Lindholm <leif@nuviainc.com> wrote:
>
> When FEAT_MTE is implemented, the AArch64 view of CTR_EL0 adds the
> TminLine field in bits [37:32].
> Extend the ctr field to be able to hold this context.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index fadd1a47df..063228de2a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -931,7 +931,7 @@ struct ARMCPU {
>      uint64_t midr;
>      uint32_t revidr;
>      uint32_t reset_fpsid;
> -    uint32_t ctr;
> +    uint64_t ctr;
>      uint32_t reset_sctlr;
>      uint64_t pmceid0;
>      uint64_t pmceid1;
> --
> 2.20.1
>
