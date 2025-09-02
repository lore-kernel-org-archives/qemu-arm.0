Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6814CA0FFE
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 09:54:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utNiJ-0002sW-JF; Tue, 02 Sep 2025 05:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1utNiI-0002rm-Ct
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 05:54:06 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1utNiE-00046P-CI
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 05:54:04 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e96e3094fd9so4538093276.1
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 02:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756806839; x=1757411639; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S2DLNfb3hwUzbT+Qfwm51/d38ALsr8Q5J9G5EBFuW5s=;
 b=NNd8vE5hg9f+BAq7U/Lith+kd+HM7K32tz+OmK7VLLRsQLzYJl/2XHPpcEvbSkRV7j
 2KHwuqLurchwpfuHCco7dsvv5uPVBeCCW2+LOIh2d+JHVDr0qER1/GpfFtaqMa7j+foX
 21idyDfi+chtFQbekSLd7oa30lc6+/yzdCidBsFqoifr3alxJzP/dbmg3uChHth4meWi
 /SJbr/eMac+Rhy6WYDW6jirK14IGBZuHT08e231NfvHcIIy2jQHEWiMNw2eKcBuRli1j
 6c3PcnCJoRfzbGFXBBswptz5SqqqsYPG4wjKhCZngJfCyAcpTgk7U5d/k7u5e9gql5Vi
 eVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756806839; x=1757411639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S2DLNfb3hwUzbT+Qfwm51/d38ALsr8Q5J9G5EBFuW5s=;
 b=s5e06cufkVp8xbzfxDhZuYzXdaokPsrA9Yc8yAoMW7KNelFBT7H36OLTOmxJTKbd7y
 NwFgjwqLH9C3L0R9LR3kSxTcS5F5osCNAq7f6ixZmux1/Y/vbshwWgxdXBO5EscjvKan
 WOSJOvEzGwam4g0lWqkEES1GdnfQd1H/7sFqDSPDnsqvckZD32Z6DQldAK8sgQbO0fEW
 dHA5pHikKDUyKW87qSY4CVLM/tovX3Ti1N1h7upjPRpzY0D1x2D3hKgqXgkY1qT2H4qP
 vt1GUcO0z3P895eimFN4vy9uBw0TExSxinwszjkXUSzqFRcG6vfhQ28tl270gj5QH/9D
 WDgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkftFqUEQzEU/sEwSdMl1wQNu0fwZJFK8GvqlbFj1mFwhonp2vMk0/tS3KUCTyBO2Szbtihj7U7w==@nongnu.org
X-Gm-Message-State: AOJu0YxdnSUXUCG/EZ/bQuwpXX8SS6jZppXIdXCRz+Te0ty0i8QK9Z8a
 o29koFDc4o1YWniBRy92k1LBBPWhpRQlTXwbb53D9tISQj9TnswXGPr/5hJ9HoATmeKajIxRjWw
 63fX8SprW/2XWDvUvUO/zLknpqDneznAQn6OeFNPrK4dRrCg98AQI
X-Gm-Gg: ASbGnct8s7xDF/ybrWZsGBP2AlP9AaoJ3DiPKXHcdEGZfRatYC7lW92oAPrG9euVT1o
 MZii0ytAOhOvg370k/ZpdD88btA+NhgT6RwWDZhqgNbhf7TKOOXl0/cI/DqSguhTzmsLZCm1Thj
 Klgs04RR/wHO9LVo2ZOigdT6SmYyOBNLqs0NTSeQ4eAnIheaX1CNVIrWYz0M7h8jXZu2dDfF3jL
 +EZbROL
X-Google-Smtp-Source: AGHT+IEq0OMs00G8PE9o7PzzTQr5VvEooHkGACYRPRPgj7VBG/g9X75NfrCKCBwBvRulpF+C0tOzsfLOGoxTNCBCyaY=
X-Received: by 2002:a05:690c:a0aa:20b0:722:7a7f:5358 with SMTP id
 00721157ae682-7227a7f6daamr97651567b3.4.1756806839336; Tue, 02 Sep 2025
 02:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250820211932.27302-1-shentey@gmail.com>
 <20250820211932.27302-7-shentey@gmail.com>
In-Reply-To: <20250820211932.27302-7-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Sep 2025 10:53:48 +0100
X-Gm-Features: Ac12FXz09qSSJ5uxJBmoGYE4yxTscF7subjkPLUIDVy-ToppFSpxBX8E1CsVzG4
Message-ID: <CAFEAcA_g08weBggnyCqLNPhOxKrZ3baVoGUyUqpZaEgSUN086A@mail.gmail.com>
Subject: Re: [PATCH 06/10] hw/pci-host/designware: Fix I/O range
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 qemu-arm@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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

On Wed, 20 Aug 2025 at 22:19, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Fix the size of the I/O space to be 64KiB, as defined by the PCI
> specification. This fixes illegal memory access by guests in the
> imx8mp-evk machine such that the FSL_IMX8MP_PCIE1_MEM unimplemented
> region can be omitted there.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/pci-host/designware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 7342207eb3..1e29b7e6be 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -684,7 +684,7 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
>                            "pcie.reg", 4 * 1024);
>      sysbus_init_mmio(sbd, &s->mmio);
>
> -    memory_region_init(&s->pci.io, OBJECT(s), "pcie-pio", 16);
> +    memory_region_init(&s->pci.io, OBJECT(s), "pcie-pio", UINT16_MAX);

This isn't 64K, it's 1 byte less than 64K. You want
64 * KiB   or something similar.

(The memory APIs have a special case for "size 2^64" where
you can pass it UINT64_MAX, but any sizes below that you
pass in the actual size: the special case is just so we
can use a uint64_t type for the argument without losing
the ability to specify a size that covers the full 64-bit
address space.)

>      memory_region_init(&s->pci.memory, OBJECT(s),
>                         "pcie-bus-memory",
>                         UINT64_MAX);

(We seem to have a similar bug in xilinx-pcie.c.)

-- PMM

