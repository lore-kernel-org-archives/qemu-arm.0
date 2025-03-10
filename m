Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1166166njc;
        Mon, 10 Mar 2025 06:39:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrKq6BBlbZ3Zkr8SGWzk7HDHh1oUUcQqQH6R79iVRyx3kq7xv1kCKe0SJvDSenjDEEkSRr1udc0RNeFg==@linaro.org
X-Google-Smtp-Source: AGHT+IEekKUaLwdPSkqDh9+RJydxuEmTCm1qmpZbcHmC8+hRcwhO/RMR50KNrobOVDq43WuwlHNn
X-Received: by 2002:a05:620a:660a:b0:7c5:48bc:8c89 with SMTP id af79cd13be357-7c548bc8ecfmr1013395285a.27.1741613990917;
        Mon, 10 Mar 2025 06:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741613990; cv=none;
        d=google.com; s=arc-20240605;
        b=LA0Ebqz+wnq250MEd2Mb13duZMF/DCHX4uMjm0lxxeQ6sxnAczVCtXYYHhE8wtv33M
         UOsRGu+xqb/qh4SziHUA3OH7M4EDaktOGaD1I2l9kqdnmQNhNLWD//QbpY9p/10ICCzM
         zqA0vkISqipKHE0yQ2fO/xQlduUuFfUCJpCR6i858cfxbIEtKNo9FCk/W/mCRvfLp897
         wMXupPNY4gzSaMN6xWrNQQZnViJHVjRlH029/VbrKKnDuFZwkMWdXtkPS4opzX1A8ro1
         ZhP7QurUEcDxtEXIxwUMVNxygLc9PAVMxRAynqibFukFckuJpJH4gRY8bqkifQZb+QMD
         g/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=Swp0oeieA4ui+Nr6CbSn7NMQ3IcXdtuJlbv2y9Sxt1w=;
        fh=ImVjXUmxm1K/HOh+W3367LQKrDIwn8+Oh4oP52bXSXE=;
        b=aktn7t23vk6rZSDKYzFQ8aq4dYp3bEBRMqQ5eV2zFVe5+MhtJjG2JVHlNVDGVZkpeH
         0E69iu3HD5tWxZxB0LFzqCk+FfLopL31Ytwl9Sy4FQi2xTUmXusk++h4Zca4xVRzwQqV
         TE80oa5umrTahKIzrJ87tghkOhcS2h6bAc2OxzUH2K9dYu5mEce6tbuQoNLHuAOFpxj5
         lzYnN3XJIawngohn7ElB/OQHxxD9GdXGgha8eKdzwU7kPnpFuC9dZLJh8SO4Rzice38K
         DwolTVfljH/j2gpdXLdjB6rRnddxyYqA0Af3opyhEQiL6dw8LSUk7cZYPR4zKAjy/C2V
         l37A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47677433b07si39033811cf.586.2025.03.10.06.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 06:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trdLy-00057t-DD; Mon, 10 Mar 2025 09:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trdLu-0004za-6q; Mon, 10 Mar 2025 09:39:30 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trdLs-0008CZ-7v; Mon, 10 Mar 2025 09:39:29 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0517E4E6030;
 Mon, 10 Mar 2025 14:39:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id 97p4AlsmDV-y; Mon, 10 Mar 2025 14:39:22 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0D5944E6029; Mon, 10 Mar 2025 14:39:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0A87F74577C;
 Mon, 10 Mar 2025 14:39:22 +0100 (CET)
Date: Mon, 10 Mar 2025 14:39:22 +0100 (CET)
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
Subject: Re: [PATCH v5 05/14] hw/sd/sdhci: Include 'pending-insert-quirk'
 property in quirk bitmask
In-Reply-To: <20250310000620.70120-6-philmd@linaro.org>
Message-ID: <6eefe61e-d663-16cb-3cbb-8450f7ddfdd9@eik.bme.hu>
References: <20250310000620.70120-1-philmd@linaro.org>
 <20250310000620.70120-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1284192835-1741613962=:72286"
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
X-TUID: LxlNnj7or+ME

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1284192835-1741613962=:72286
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 10 Mar 2025, Philippe Mathieu-Daudé wrote:
> Import Linux's SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET quirk definition.
>
> Replace 'pending_insert_quirk' boolean (originally introduce in commit
> 0a7ac9f9e72 "sdhci: quirk property for card insert interrupt status
> on Raspberry Pi") by a bit in quirk bitmask.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> include/hw/sd/sdhci.h | 5 ++++-
> hw/sd/sdhci.c         | 8 ++++----
> 2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index d2e4f0f0050..2e6e719df7b 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -34,6 +34,8 @@
>  * SD/MMC host controller state
>  *
>  * QEMU interface:
> + *  + QOM property "pending-insert-quirk" re-enables pending "card inserted"
> + *    IRQ after reset (used by the Raspberry Pi controllers).
>  *  + QOM property "wp-inverted-quirk" inverts the Write Protect pin
>  *    polarity (by default the polarity is active low for detecting SD
>  *    card to be protected).
> @@ -101,7 +103,6 @@ struct SDHCIState {
>     /* RO Host Controller Version Register always reads as 0x2401 */
>
>     /* Configurable properties */
> -    bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
>     uint32_t quirks;
>     uint8_t endianness;
>     uint8_t sd_spec_version;
> @@ -118,6 +119,8 @@ enum {
>     SDHCI_QUIRK_NO_BUSY_IRQ                     = 14,
>     /* Controller reports inverted write-protect state */
>     SDHCI_QUIRK_INVERTED_WRITE_PROTECT          = 16,
> +    /* Controller losing signal/interrupt enable states after reset */
> +    SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET        = 19,
> };
>
> #define TYPE_PCI_SDHCI "sdhci-pci"
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 19c600d5bfc..d1b1b187874 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -320,7 +320,7 @@ static void sdhci_poweron_reset(DeviceState *dev)
>
>     sdhci_reset(s);
>
> -    if (s->pending_insert_quirk) {
> +    if (s->quirks & BIT(SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET)) {
>         s->pending_insert_state = true;
>     }
> }
> @@ -1307,7 +1307,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>          * appears when first enabled after power on
>          */
>         if ((s->norintstsen & SDHC_NISEN_INSERT) && s->pending_insert_state) {
> -            assert(s->pending_insert_quirk);
> +            assert(s->quirks & BIT(SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET));
>             s->norintsts |= SDHC_NIS_INSERT;
>             s->pending_insert_state = false;
>         }
> @@ -1557,8 +1557,8 @@ static const Property sdhci_sysbus_properties[] = {
>     DEFINE_SDHCI_COMMON_PROPERTIES(SDHCIState),
>     DEFINE_PROP_BIT("wp-inverted-quirk", SDHCIState, quirks,
>                     SDHCI_QUIRK_INVERTED_WRITE_PROTECT, false),
> -    DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
> -                     false),
> +    DEFINE_PROP_BIT("pending-insert-quirk", SDHCIState, quirks,
> +                    SDHCI_QUIRK_RESTORE_IRQS_AFTER_RESET, false),

Now I see why you need bit defines instead of mask value. Other comments 
about renaming and adjusting comment still apply. I'm not sure if adding 
and enum for bit numbers and keeping the defines for the QUIRK to avoid 
mistake of forgetting BIT at usage might be better. Otherwise this looks 
good.

Regards,
BALATON Zoltan

>     DEFINE_PROP_LINK("dma", SDHCIState,
>                      dma_mr, TYPE_MEMORY_REGION, MemoryRegion *),
> };
>
--3866299591-1284192835-1741613962=:72286--
