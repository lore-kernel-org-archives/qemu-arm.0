Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp24823lfc;
        Thu, 21 Oct 2021 00:31:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvV4wqE6Ibz+77/ySOVLMV3eDwEWnONkHwEM++VfDsLQKet5HB7vLo6nnATKAEnGtkR6Em
X-Received: by 2002:a9d:7182:: with SMTP id o2mr3426758otj.53.1634801495965;
        Thu, 21 Oct 2021 00:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634801495; cv=none;
        d=google.com; s=arc-20160816;
        b=TUp/HCNMCoXgQLb/eIkeX6Q69DUFzhrNaTxgZHRj5U2GcL3f/zIdCXpD23WLFbSFZF
         V9kmVPVQ0RWUIrKcercEXyr0cVbOned35HwFZPK0ORMr4vNeUghqxshLh+06j6DDUCGl
         2LxIhumB5DZGIshugjFxwoDhM9d2bhkz3jqm2ILEtEjAXfJnmu1AyCXRcKvK7xnBQ/G0
         gyTSpKClanOsL4Dy7PdlbJn7x32kJ9WT+obinoKFuioVTtl6ud8+TPqzadOrUOKcr+DM
         cElKxomGFEIACjMNXTbvxBjZi3wzEpd8J9NxIS5kmAG0dEu7W4WEy1HmGDNggTQLcoMq
         UKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=YRY5XEXZTWvVdIjJYXnd+kC3pmEThU5+44T1DMzipz4=;
        b=vxZi45cLZ1KWJA67L1+a+hI4oZVOnHETUdxPtdX1SrlnLIxOfnPVXd8ReXexaNaJwT
         fePAXlHQ1PQnnKsweF6JfWQVU0+zuBOXJ8i+UdeDNQA+yTaxKqpxptQjMNi+0gen6CPQ
         tDARc/eeTSM9txp0LgV2qL//tmWf6iszt4D1Zca73zdQESLxxeSfK/pDkURWmiOCwh5+
         Hj/uzb2EX6AWsSCP3zNonUsM50gnfvTI945yGRAHZ/iPTxwPxhEnmq0kV26zfkcTtzjR
         rbzzPay25c+3AmhIQ2EfstViqr3foF5x3gjoGSX05kfSLjGqUvP+hvkoqOa/oJdPxfRR
         1GjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZccaDXXk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si2484134otc.165.2021.10.21.00.31.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 00:31:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZccaDXXk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdSY3-00078O-71
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 03:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mdSTf-0001kr-Oj; Thu, 21 Oct 2021 03:27:03 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:43953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mdSTd-0004iO-FC; Thu, 21 Oct 2021 03:27:03 -0400
Received: by mail-lf1-x132.google.com with SMTP id bq11so1217695lfb.10;
 Thu, 21 Oct 2021 00:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=YRY5XEXZTWvVdIjJYXnd+kC3pmEThU5+44T1DMzipz4=;
 b=ZccaDXXkbZTsO9qajjBGGOuDp7KaWlnwliPhrX62+FTrPjsHRCR1m6RbLOjNKkwHxV
 HjuAKrqsnZDDrQ58hZvHQ55XiQTQQBy2ho1b99d8P973suwqxFOjpuhXO8B87CxChSVQ
 BQ+FBCkUtjy8k9sR1yAEEWjjsM0nvxJ1TdUeW6a/BqgmHbEttVfxhRgK509buftOchZO
 9Nem2F6w2BKzo3SLX6hXS6X7uOsMReiJIc6GRL3J+D88P+HDtTdVEbDUk1/A8FMZyvn8
 AfBzpISrhruFS7U2185ZnHF5TcmHi9iMFpunfQEFSUONkK4wUwdsJWaEFwJsYLfB36nz
 6kMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=YRY5XEXZTWvVdIjJYXnd+kC3pmEThU5+44T1DMzipz4=;
 b=rwGGZawyMebHdak1gOL8FT98u88FvUmMmZnvdWp7ceevd94SGpOdxaczeF6Vt1c5of
 0vXGW3+7Bt/4pUZFvVEUpRzqKsJlbLURV6rfBG60kodHKoU+BHVVv1vRWsCja5/F4+6Q
 y/iEM/mCGe/i/B55KMiOhL6worHMl6zHFFc/mfr8GpZe1w8lcRUbPk8LFpCvWc53iftb
 Xe300Ya5hxYPUPGsY3pePHh0TM1dma147lTO/G8/Qm5VjytFOZ6RF7BKS1PBrUzb6TJk
 MJhvTRVz+gmdVCe9y81t8dvbjwMG8nvu/lt3hoSEIVeg3hULG3+Yzf6eYmy5o3S20Zth
 ATRg==
X-Gm-Message-State: AOAM5322tvr6kHE0riLFBu1wIMMnzpbwxKsGOVmt0hS5Qthm8L3MUsZQ
 f6bvqX9Faef/7uWcRSpARpqnTsuG46BQVA==
X-Received: by 2002:a05:6512:3089:: with SMTP id
 z9mr3826853lfd.690.1634801219673; 
 Thu, 21 Oct 2021 00:26:59 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 k18sm453305ljk.26.2021.10.21.00.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 00:26:59 -0700 (PDT)
Date: Thu, 21 Oct 2021 09:26:57 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 4/5] aspeed/smc: Use a container for the flash mmio
 address space
Message-ID: <20211021072657.GI23846@fralle-msi>
References: <20211018132609.160008-1-clg@kaod.org>
 <20211018132609.160008-5-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211018132609.160008-5-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YnEoZBCp2/si

On [2021 Oct 18] Mon 15:26:08, Cédric Le Goater wrote:
> Because AddressSpaces must not be sysbus-mapped, commit e9c568dbc225
> ("hw/arm/aspeed: Do not sysbus-map mmio flash region directly, use
> alias") introduced an alias for the flash mmio region.
> 
> Using a container is cleaner.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  include/hw/ssi/aspeed_smc.h |  2 +-
>  hw/ssi/aspeed_smc.c         | 11 +++++++----
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index ad3c80f2d809..61d23ec1f13e 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -52,8 +52,8 @@ struct AspeedSMCState {
>      SysBusDevice parent_obj;
>  
>      MemoryRegion mmio;
> +    MemoryRegion mmio_flash_container;
>      MemoryRegion mmio_flash;
> -    MemoryRegion mmio_flash_alias;
>  
>      qemu_irq irq;
>  
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 1770985230b0..d4f03881ddf5 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -1218,14 +1218,17 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>       * window in which the flash modules are mapped. The size and
>       * address depends on the SoC model and controller type.
>       */
> +    memory_region_init(&s->mmio_flash_container, OBJECT(s),
> +                       TYPE_ASPEED_SMC ".container",
> +                       asc->flash_window_size);
> +    sysbus_init_mmio(sbd, &s->mmio_flash_container);
> +
>      memory_region_init_io(&s->mmio_flash, OBJECT(s),
>                            &aspeed_smc_flash_default_ops, s,
>                            TYPE_ASPEED_SMC ".flash",
>                            asc->flash_window_size);
> -    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s),
> -                             TYPE_ASPEED_SMC ".flash",
> -                             &s->mmio_flash, 0, asc->flash_window_size);
> -    sysbus_init_mmio(sbd, &s->mmio_flash_alias);
> +    memory_region_add_subregion(&s->mmio_flash_container, 0x0,
> +                                &s->mmio_flash);
>  
>      /*
>       * Let's create a sub memory region for each possible peripheral. All
> -- 
> 2.31.1
> 
> 
