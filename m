Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1161341njc;
        Mon, 10 Mar 2025 06:33:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZFfJ10fgzS5ZSRP4RrbkAkD3XILmL7prDrap4LGWcpqDFjv05MxwdSM+kHFQKLzfDBqpHSql2Bg17Vw==@linaro.org
X-Google-Smtp-Source: AGHT+IFfXA1fYdHm6rcFwReKkOuCcZJh7SH8WRe7/byacwTDS1MM5nKmyGFHcdapKRIn5lyD4L3F
X-Received: by 2002:a05:6102:291e:b0:4c1:9738:820d with SMTP id ada2fe7eead31-4c30a55e430mr6497851137.6.1741613588098;
        Mon, 10 Mar 2025 06:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741613588; cv=none;
        d=google.com; s=arc-20240605;
        b=bPrAb+35GeDuCYuHxWSGdzNaVGJI7QUNYf9jnWsT0YyyVGoZpu/bYPvQu225RTxy5Y
         c5T2cHG+CoCzAigrDRlXrC5MElA7OHQHi9GIm+u8GJgzNwRIzQwxpMiTk8SCOusNU+Qi
         PB/VFmFBu3m9bwYeLmQeCgNCJDDYSLm8Gyrgun9xQL38VCZPxbuRVqOAxrV4vXr5IZ5d
         ardyXvzqL03sF+tHy9SCT0J3E1gkhSRUbxanGY0gpaJE8poQNehOf4nbykycip23iQ1X
         dI1LJKr0f3w2ncRlrBp3a9qRjpkwlrSmu1hk6vZiwLglUwbdGiN5p9hmmzhj61MK5zv8
         tLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=mi6DeWX6UN7nndsxyOXzb6IzKVkc/FQaDfc+uWigx5I=;
        fh=ImVjXUmxm1K/HOh+W3367LQKrDIwn8+Oh4oP52bXSXE=;
        b=dFo8EErdbkWn6GPLp51vizxUwMiy29STGqKz9qyvI1IoqQlFh2OryxA+HXau0rWBFO
         Em11ss7uJgHalLuAxc247SHkfT7x3Ffu1d0px97PSK6fsG65+Z7RwEtjk7P5/3U/plag
         294/yOf4ORZTusXbt6+ohS6Sj8mxYWugQUBamtPPS8bFy2qcJKC0f4/t4gDQjr6mYLh+
         awn17J5xeXzgQ4qb32O7Ppm70GCnUYqPfZc3CcJrvGASDhrbfwec9yZw0eACLn90dalv
         XuJ9GKzlQvA6h2OsFx37VC6hgZ5ArqTOibnTg5/641sWnYwmNZqfYQIm/9vOnygSnswQ
         1U/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c2fbc78a8dsi2151505137.341.2025.03.10.06.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 06:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trdEH-0005Ee-EA; Mon, 10 Mar 2025 09:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trdEC-0005EE-Sf; Mon, 10 Mar 2025 09:31:32 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trdEA-0007LS-O6; Mon, 10 Mar 2025 09:31:32 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3270C4E6030;
 Mon, 10 Mar 2025 14:31:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id KYwbHkbacqMQ; Mon, 10 Mar 2025 14:31:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 416A24E602E; Mon, 10 Mar 2025 14:31:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3F35D74577C;
 Mon, 10 Mar 2025 14:31:23 +0100 (CET)
Date: Mon, 10 Mar 2025 14:31:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>, 
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-block@nongnu.org, 
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH v5 03/14] hw/sd/sdhci: Redefine SDHCI_QUIRK_NO_BUSY_IRQ
 bitmask as bit
In-Reply-To: <20250310000620.70120-4-philmd@linaro.org>
Message-ID: <e9dc5c0f-50ad-e066-a3b0-1d58e8f68062@eik.bme.hu>
References: <20250310000620.70120-1-philmd@linaro.org>
 <20250310000620.70120-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-935087992-1741613483=:72286"
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UhtXNj9DgSAA

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-935087992-1741613483=:72286
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 10 Mar 2025, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> include/hw/sd/sdhci.h | 8 ++++----
> hw/sd/sdhci.c         | 4 ++--
> 2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 48247e9a20f..096d607f4b7 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -108,13 +108,13 @@ struct SDHCIState {
> typedef struct SDHCIState SDHCIState;
>
> /*
> - * Controller does not provide transfer-complete interrupt when not
> - * busy.
> - *
>  * NOTE: This definition is taken out of Linux kernel and so the
>  * original bit number is preserved
>  */
> -#define SDHCI_QUIRK_NO_BUSY_IRQ    BIT(14)
> +enum {
> +    /* Controller does not provide transfer-complete interrupt when not busy. */
> +    SDHCI_QUIRK_NO_BUSY_IRQ                     = 14,
> +};

I think this is better as a define, then you don't have to remember to add 
BIT() on usage and prevent this churn. I'd say drop this patch and adjust 
the comment in next patch but if you're attached to it I don't mind that 
much.

Regards,
BALATON Zoltan

> #define TYPE_PCI_SDHCI "sdhci-pci"
> DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 149b748cbee..1dc942a0e06 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -366,7 +366,7 @@ static void sdhci_send_command(SDHCIState *s)
>             }
>         }
>
> -        if (!(s->quirks & SDHCI_QUIRK_NO_BUSY_IRQ) &&
> +        if (!(s->quirks & BIT(SDHCI_QUIRK_NO_BUSY_IRQ)) &&
>             (s->norintstsen & SDHC_NISEN_TRSCMP) &&
>             (s->cmdreg & SDHC_CMD_RESPONSE) == SDHC_CMD_RSP_WITH_BUSY) {
>             s->norintsts |= SDHC_NIS_TRSCMP;
> @@ -1886,7 +1886,7 @@ static void imx_usdhc_init(Object *obj)
>     SDHCIState *s = SYSBUS_SDHCI(obj);
>
>     s->io_ops = &usdhc_mmio_ops;
> -    s->quirks = SDHCI_QUIRK_NO_BUSY_IRQ;
> +    s->quirks = BIT(SDHCI_QUIRK_NO_BUSY_IRQ);
> }
>
> /* --- qdev Samsung s3c --- */
>
--3866299591-935087992-1741613483=:72286--
