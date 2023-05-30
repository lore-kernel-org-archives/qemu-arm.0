Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2127490ejb;
        Tue, 30 May 2023 05:13:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5L4bPExkkaS4aG++e321xTGPCOXiXbqXkEJ3OHqdD7+/3s3mTjGsySyVvqqvx9lFmDTKJ8
X-Received: by 2002:ac8:7fc6:0:b0:3f4:427:dbb8 with SMTP id b6-20020ac87fc6000000b003f40427dbb8mr1592671qtk.2.1685448780982;
        Tue, 30 May 2023 05:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685448780; cv=none;
        d=google.com; s=arc-20160816;
        b=wun/gF5/mHcbOJknw/p8u2dXH+Qn/dlkYX/eY9csIll9cEF+oCEqwMPH5I6oH9SGle
         FJvG052tmCewmALyX9katALJ+SerQx/kAWlpEiKbPYJ5o2/o6w4tALJRtYDeknWdmate
         EJ5xNT0ZURyEllInzNBrj27HapClIOICMYcY8M0yn13NADwWAefkAw0MSzu6ApeMgWpK
         a/6W4iGmESwcxbqkcnqvY4MWxjs14MYFaWQUXnJBI6GkEcbfbhTFun1w8MLixdWK6go3
         ltbPOAcPs1IgBQAE5YDgpLVuC5joeN0qB2l4Do0mAwy3iUH8rh6QfNcjmrlX4fUmuuBa
         7s9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4/jlGgEm87FBCNta8BpLpBgKVYdmiXVpuZ1sVcQLpME=;
        b=aTswte1NqT8uYzDzA3VQrEItkeH40jrLaJrCY4kIICj5z2KodTqs0Ws29soLKtO7Gd
         FFFh/gDFyI6XPBe9ALZ8CdPBd3NO9SI7ndf3VULCIr7fyl4CCHZ66LFTgsIycufi+t3n
         gIviMMnHNu91hA9fmH/mlEE+mm/Ssoall9RrbyIZ6KbKWFut2lIROiJkLAjWiWSogiZK
         yYvsV2/C5pdf7gt+pFYuDYcOrycnLumzRt6L/hqOVDFMICG+QZ3P9f6v316fbP4AYJ2X
         NX+jj6VKcGRtO5oxSf3rm0XHQ8JKWI1TN2ZkzJZzxRblZN5JKvcSQiTvf12VEqa1yHWh
         soRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G8lgqMs9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15-20020ac87f0f000000b003f6a8c3198csi6609192qtk.200.2023.05.30.05.13.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:13:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G8lgqMs9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3yDR-0002lN-Eu; Tue, 30 May 2023 08:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3yDP-0002jq-0F
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:12:39 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3yDN-0005Qc-DN
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:12:38 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-510f525e06cso7660434a12.2
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685448755; x=1688040755;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4/jlGgEm87FBCNta8BpLpBgKVYdmiXVpuZ1sVcQLpME=;
 b=G8lgqMs9U9mfL7gudoEK0wFpXRtmwRi4x/3PHypZ6g2gxJpVzb2duyDFjGPZ0r4Yw6
 B1Vxe47RrS/OU6nZ/uGYmRHhXF8KzIEbAwzucnUIHyTrYQxpKF4K8nX3E6t6TuVYzPg/
 Mn1xkrgzcwbBy4+Q5WJYkLbJs8fe0jrGreoIcb5KkJgXnPO8x3MFDPB8GAuSXGTENWGh
 tQYlrMBDX1HqaxP7niCkn/ZDglsqlbU5LjOvtWQ7+e/rXJXrkQ2b5u1xmmxlm+Kw/w/O
 bUBIQO57J3uUH0eIORYh/DzFnabGCzYlwaHqEh2mKmFI6dleCS4+BPLdRcfR1myMUizT
 KFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685448755; x=1688040755;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4/jlGgEm87FBCNta8BpLpBgKVYdmiXVpuZ1sVcQLpME=;
 b=MonnzhxsjCgc2Stdof0m8bZpSb00ZTQ8j4VQc4APsvv+e5Z2hHl0WlzmCE9c8JinDb
 neyMnExzISOeNcOLTpAQVDk1Nc5a76Ruci3rNNlqB4G4UcBfyKvsiY3/uXXPFbBaEQnC
 FhwYD8iEs2l31QgHKQhCJilkLEsgbM1GqiRzWhKuPpyCRP4+l9egp22fcZspmbDH7wUw
 esIrvXV7rKdEENA1gna96wP00fFqZO7gCGaxFkHNHwAw7isMnNJ3a+V6FCovUNpox7hS
 LlnOBFg9sdmBuXJJXnQv6AcW8X7DcIWMiyqyJ2JgGw8ak/+463A7wuoispVP54uz4dpy
 Q0Tw==
X-Gm-Message-State: AC+VfDwtyPmQRLHwPbSXHBurYYW8Rprm/gMP6Mlco5HnhX9gsQzhfh0S
 GRyb9iC7nkPm3+hkhnQmYrAt+IY0lQeYGKfllH1aRA==
X-Received: by 2002:aa7:c3c8:0:b0:506:82b7:10c3 with SMTP id
 l8-20020aa7c3c8000000b0050682b710c3mr1305507edr.41.1685448755581; Tue, 30 May
 2023 05:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230524191438.172019-1-sergey.kambalin@auriga.com>
In-Reply-To: <20230524191438.172019-1-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 13:12:24 +0100
Message-ID: <CAFEAcA_PH8yAT28s3p7_0rqK9NodJ6gTXxv63J+98XoMQ_nJTg@mail.gmail.com>
Subject: Re: [PATCH] Prepare bcm properties for videocore 4
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: PuruwuyyQjZG

On Wed, 24 May 2023 at 20:15, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Hello!
> Sorry for a quite a big patch, but most of the changes are the same type.
> Most of the patch is about a definition of new constants/structs and replacing
> magic numbers with those constants.
>
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---


> @@ -51,48 +98,48 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>          /* @(value + 8) : Request/response indicator */
>          resplen = 0;
>          switch (tag) {
> -        case 0x00000000: /* End tag */
> +        case RPI_FWREQ_PROPERTY_END: /* End tag */
>              break;
> -        case 0x00000001: /* Get firmware revision */
> +        case RPI_FWREQ_GET_FIRMWARE_REVISION: /* Get firmware revision */
>              stl_le_phys(&s->dma_as, value + 12, 346337);
>              resplen = 4;
>              break;
> -        case 0x00010001: /* Get board model */
> +        case RPI_FWREQ_GET_BOARD_MODEL: /* Get board model */
>              qemu_log_mask(LOG_UNIMP,
>                            "bcm2835_property: 0x%08x get board model NYI\n",
>                            tag);
>              resplen = 4;
>              break;
> -        case 0x00010002: /* Get board revision */
> +        case RPI_FWREQ_GET_BOARD_REVISION: /* Get board revision */

So mostly this is just updating hardcoded constants to
symbolic constants, which is great.

> -        case 0x00038002: /* Set clock rate */
> -        case 0x00038004: /* Set max clock rate */
> -        case 0x00038007: /* Set min clock rate */
> +        case RPI_FWREQ_GET_CLOCKS: /* Get clocks */
> +            /* TODO: add more clock IDs if needed */
> +            stl_le_phys(&s->dma_as, value + 12, 0);
> +            stl_le_phys(&s->dma_as, value + 16, RPI_FIRMWARE_ARM_CLK_ID);
> +            resplen = 8;
> +            break;

But this is adding a new implementation of a new property...

> +
> +        case RPI_FWREQ_SET_CLOCK_RATE: /* Set clock rate */
> +        case RPI_FWREQ_SET_MAX_CLOCK_RATE: /* Set max clock rate */
> +        case RPI_FWREQ_SET_MIN_CLOCK_RATE: /* Set min clock rate */
>              qemu_log_mask(LOG_UNIMP,
>                            "bcm2835_property: 0x%08x set clock rate NYI\n",
>                            tag);

> @@ -295,6 +357,144 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>                                      resplen);
>              break;
>
> +        case RPI_FWREQ_GET_THROTTLED: /* Get throttled */
> +            stl_le_phys(&s->dma_as, value + 12, 0);
> +            resplen = 4;
> +            break;

...and this and the other bits further down in this part of
the patch are new properties too.

New features should be in separate patches from refactoring cleanup,
please.

By the way: when you split up patches you don't need to send them
just one at a time -- you can send a patchset of multiple related
patches.

thanks
-- PMM
