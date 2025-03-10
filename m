Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1164301njc;
        Mon, 10 Mar 2025 06:36:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNwM55TwgXetI5UJtxgLGsv/S4g5WdjyA3vdIA5bP/fikfwAWVSfcLDiFQ8ihF6wCKtgdZZQFbpK7fSg==@linaro.org
X-Google-Smtp-Source: AGHT+IGXi5RaCPHhlVuSlE+2cUsZrxSCwuu2DCfX08LqGY72qwjKLZ1VSvOpk4SEup3epTUqweZ4
X-Received: by 2002:a05:620a:1d09:b0:7c3:d976:b84a with SMTP id af79cd13be357-7c53c836cd2mr1257237185a.5.1741613807339;
        Mon, 10 Mar 2025 06:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741613807; cv=none;
        d=google.com; s=arc-20240605;
        b=MtJQttfgnLOqx3zXQxnGq/b2ISoDy+tA5ivRlFVaQoQYqEJMFyyxszfAA2/m0zKUgN
         99CGzkzUK4o0STiUla4icbMHEGCSIDwcbPlax3M8bzV+Mqh5ePLlWYXzmgknk1y56fug
         CG644nkmNXnqj7S8Q+Dgm9fHPu5YecadQabieQMZUGm9PTHyLJ6IWtQvU5PjrGbNnvwy
         5Fnl7Z+wvULjeZvdU7Vg34mIu/yg7lTjleQatEf1F3/O/TJ12fE0yf4zoh6EyYNOM/OO
         HlV1NgNgXDRtIiRTyr22O9txdSI0GoVc7M9Uu0iMDZ+KnEBBEHmHDoN/n5iJBToGg1cM
         PX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=S74PjMHhaiYSNtqKseWBrQLw8x7R6lFNQ8Qy7pKU02Y=;
        fh=ImVjXUmxm1K/HOh+W3367LQKrDIwn8+Oh4oP52bXSXE=;
        b=iyGUqnxuGT/PArfkxxXp6AIraW01dN8If/uQeGcMucLBo2qBD9moqPsOoLGhxPD1aL
         RAfon3vn1J3X1K0AXHfU4tEsDK6xA+3RZGG8QUQJvs1WdW0R2hczUgoH5GKQbDl0a4Ss
         mkxXnYvEroA9Ut5X8lowcYT5NiybbC0DUh8AGq0C/v1y7euoueQXj8mDpkWkZw7byXnM
         M8prjPXMCzvFSlpURe1PSYi9xPyIJA5YzEXmxlZv8Q0FZuZYJ74Gd7QMpWh2MSZPhTRq
         550nI+ZzEXS83OvFEbtAEScK2DNefL1XZlJFNgbXDvSi7hbkzXjy1N19uDxqzPb480gB
         hKvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e54fa1a5si923602285a.243.2025.03.10.06.36.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 06:36:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trdIr-0001h9-1y; Mon, 10 Mar 2025 09:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trdIp-0001go-NZ; Mon, 10 Mar 2025 09:36:19 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trdIn-0007w0-1G; Mon, 10 Mar 2025 09:36:19 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7EBCD4E6032;
 Mon, 10 Mar 2025 14:36:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id 3jK-PwBdSr9O; Mon, 10 Mar 2025 14:36:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8991B4E6029; Mon, 10 Mar 2025 14:36:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8707174577C;
 Mon, 10 Mar 2025 14:36:11 +0100 (CET)
Date: Mon, 10 Mar 2025 14:36:11 +0100 (CET)
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
Subject: Re: [PATCH v5 04/14] hw/sd/sdhci: Include 'wp-inverted' property in
 quirk bitmask
In-Reply-To: <20250310000620.70120-5-philmd@linaro.org>
Message-ID: <74401f6a-c081-b521-fa3a-f4abb0e67df7@eik.bme.hu>
References: <20250310000620.70120-1-philmd@linaro.org>
 <20250310000620.70120-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1502737573-1741613771=:72286"
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wjv0TdP3w9+R

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1502737573-1741613771=:72286
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 10 Mar 2025, Philippe Mathieu-Daudé wrote:
> Import Linux's SDHCI_QUIRK_INVERTED_WRITE_PROTECT quirk definition.
>
> Replace 'wp_inverted' boolean by a bit in quirk bitmask.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> include/hw/sd/sdhci.h | 16 ++++++++++------
> hw/arm/aspeed.c       |  2 +-
> hw/sd/sdhci.c         |  6 +++---
> 3 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 096d607f4b7..d2e4f0f0050 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -30,7 +30,14 @@
> #include "hw/sd/sd.h"
> #include "qom/object.h"
>
> -/* SD/MMC host controller state */
> +/*
> + * SD/MMC host controller state
> + *
> + * QEMU interface:
> + *  + QOM property "wp-inverted-quirk" inverts the Write Protect pin
> + *    polarity (by default the polarity is active low for detecting SD
> + *    card to be protected).
> + */
> struct SDHCIState {
>     /*< private >*/
>     union {
> @@ -99,11 +106,6 @@ struct SDHCIState {
>     uint8_t endianness;
>     uint8_t sd_spec_version;
>     uint8_t uhs_mode;
> -    /*
> -     * Write Protect pin default active low for detecting SD card
> -     * to be protected. Set wp_inverted to invert the signal.
> -     */
> -    bool wp_inverted;
> };
> typedef struct SDHCIState SDHCIState;
>
> @@ -114,6 +116,8 @@ typedef struct SDHCIState SDHCIState;

Now that we have two adjust comment above here to say "These defines"

> enum {
>     /* Controller does not provide transfer-complete interrupt when not busy. */
>     SDHCI_QUIRK_NO_BUSY_IRQ                     = 14,
> +    /* Controller reports inverted write-protect state */
> +    SDHCI_QUIRK_INVERTED_WRITE_PROTECT          = 16,
> };

and I'd say keep this defines that also matches what Linux has.

> #define TYPE_PCI_SDHCI "sdhci-pci"
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 98bf071139b..daee2376d50 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -412,7 +412,7 @@ static void aspeed_machine_init(MachineState *machine)
>     if (amc->sdhci_wp_inverted) {
>         for (i = 0; i < bmc->soc->sdhci.num_slots; i++) {
>             object_property_set_bool(OBJECT(&bmc->soc->sdhci.slots[i]),
> -                                     "wp-inverted", true, &error_abort);
> +                                     "wp-inverted-quirk", true, &error_abort);

Why rename it? That would break command lines that use this.

Regards,
BALATON Zoltan

>         }
>     }
>     if (machine->kernel_filename) {
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 1dc942a0e06..19c600d5bfc 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -274,7 +274,7 @@ static void sdhci_set_readonly(DeviceState *dev, bool level)
> {
>     SDHCIState *s = (SDHCIState *)dev;
>
> -    if (s->wp_inverted) {
> +    if (s->quirks & BIT(SDHCI_QUIRK_INVERTED_WRITE_PROTECT)) {
>         level = !level;
>     }
>
> @@ -1555,12 +1555,12 @@ void sdhci_common_class_init(ObjectClass *klass, const void *data)
>
> static const Property sdhci_sysbus_properties[] = {
>     DEFINE_SDHCI_COMMON_PROPERTIES(SDHCIState),
> +    DEFINE_PROP_BIT("wp-inverted-quirk", SDHCIState, quirks,
> +                    SDHCI_QUIRK_INVERTED_WRITE_PROTECT, false),
>     DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
>                      false),
>     DEFINE_PROP_LINK("dma", SDHCIState,
>                      dma_mr, TYPE_MEMORY_REGION, MemoryRegion *),
> -    DEFINE_PROP_BOOL("wp-inverted", SDHCIState,
> -                     wp_inverted, false),
> };
>
> static void sdhci_sysbus_init(Object *obj)
>
--3866299591-1502737573-1741613771=:72286--
