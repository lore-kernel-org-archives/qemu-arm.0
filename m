Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1188956njc;
        Mon, 10 Mar 2025 07:11:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXklA4mP/M0pCpzCq6KgWNfJctmpDtefbQr9yLDH4V15/lmP4GUoCmjiS7BbY/vzMT8hiUznIdsyujUrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFNxX4hcUynqLtH47l07f0rRzfx82pN9aRrPSgWmqKV8vOqtLLkgECMT0chvbT5VVTEn7xR
X-Received: by 2002:a05:622a:134a:b0:474:fb73:698b with SMTP id d75a77b69052e-47618b37e39mr175597301cf.48.1741615866328;
        Mon, 10 Mar 2025 07:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741615866; cv=none;
        d=google.com; s=arc-20240605;
        b=Z8+79lv98OXMUYWdTx0Sc9H+QmHgiWSFeJJHusErqtLEbveGVwX8IKezeXVigVJKoH
         c0MN9mmRRThF/gDuTiKIbJsarPb142mTukBmOy2ZFF9uYBtcKqcDtca+1FaS9Jtya9ug
         y00OKoo8yitejYglEAJggXUMZbF9B8Q8lrgPEIPhm+Npukvl7ZLtuDWnx6T4W2g9BUjH
         iUZEtJAI0SZ1dIJNJw/0k9erbLabfMi8Cakb+bwBnu0qvql1pcFXNRL3z9jk3LqJut9J
         3sETiLN1Ud4PWoRmybjPjtlqZ7BmKyCr4pu11N2MsZrM4x3wUr+blc9zFUrb4DGHbUKE
         JQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=BQC6Ctdbzwd+iw22zOJN/rXU3cGuESBrdBkDkZ26bUA=;
        fh=ImVjXUmxm1K/HOh+W3367LQKrDIwn8+Oh4oP52bXSXE=;
        b=fSqe5WP0NvyIc9DTeQIk4cp6rZPn8bUS08qYT6LIL3D7gzHz3a0vG7XTNIgX5LB6FQ
         OUKdqt6cc3dEjlTOdYlZ2Td8+0CG9TAhokyapqqg3Fj5cohFZmo3EJ60AwzKp99MzkoA
         o9HnSd9qUfgcXptZWNQJGe7ucuwM4sNhHFLyD5uxWIMKtnI9W7KjCDuDTTG8kKGmP3Ox
         UWtx0VGaAe6sqyvykI9iCGuLp1mTRKX2oMuaQnaKVWKJb1LEY42mQjRAxDdDq99KmqQJ
         H76PuTXuw868ZS1769VH+x93jd42OUOsgdVYSRCFMhw2g7wENcvrSBAwQeSwfQ/zUmFS
         MXZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47675d994d7si41597621cf.49.2025.03.10.07.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 07:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trdpa-0007YO-QL; Mon, 10 Mar 2025 10:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trdpY-0007Us-HU; Mon, 10 Mar 2025 10:10:08 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1trdpW-0005KA-0Z; Mon, 10 Mar 2025 10:10:08 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 463A44E6032;
 Mon, 10 Mar 2025 15:10:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id XOEKomB5uHDl; Mon, 10 Mar 2025 15:09:58 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4327F4E6029; Mon, 10 Mar 2025 15:09:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 40CC574577C;
 Mon, 10 Mar 2025 15:09:58 +0100 (CET)
Date: Mon, 10 Mar 2025 15:09:58 +0100 (CET)
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
Subject: Re: [PATCH v5 14/14] hw/sd/sdhci: Remove unnecessary 'endianness'
 property
In-Reply-To: <20250310000620.70120-15-philmd@linaro.org>
Message-ID: <d97b9dd5-e569-636d-8ee7-b1a48c402429@eik.bme.hu>
References: <20250310000620.70120-1-philmd@linaro.org>
 <20250310000620.70120-15-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-983117665-1741615798=:72286"
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
X-TUID: frWFvJ4Xi0GJ

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-983117665-1741615798=:72286
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 10 Mar 2025, Philippe Mathieu-Daudé wrote:
> The previous commit removed the single use of instance
> setting the "endianness" property.
>
> Since classes can register their io_ops with correct
> endianness, no need to support different ones.
>
> Remove the code related to SDHCIState::endianess field.
>
> Remove the now unused SDHCIState::io_ops field, since we
> directly use the class one.
>
> Suggested-by: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/sd/sdhci-internal.h |  1 -
> include/hw/sd/sdhci.h  |  2 --
> hw/sd/sdhci.c          | 33 +++------------------------------
> 3 files changed, 3 insertions(+), 33 deletions(-)
>
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index d99a8493db2..e4da6c831d1 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -308,7 +308,6 @@ extern const VMStateDescription sdhci_vmstate;
> #define SDHC_CAPAB_REG_DEFAULT 0x057834b4
>
> #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
> -    DEFINE_PROP_UINT8("endianness", _state, endianness, DEVICE_LITTLE_ENDIAN), \
>     DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
>     DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
>     \
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index e8fced5eedc..1016a5b5b77 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -54,7 +54,6 @@ struct SDHCIState {
>     AddressSpace sysbus_dma_as;
>     AddressSpace *dma_as;
>     MemoryRegion *dma_mr;
> -    const MemoryRegionOps *io_ops;
>
>     QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
>     QEMUTimer *transfer_timer;
> @@ -105,7 +104,6 @@ struct SDHCIState {
>
>     /* Configurable properties */
>     uint32_t quirks;
> -    uint8_t endianness;
>     uint8_t sd_spec_version;
>     uint8_t uhs_mode;
> };
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 47e4bd1a610..cbb9f4ae8c0 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1391,17 +1391,6 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
> }
>
> static const MemoryRegionOps sdhci_mmio_le_ops = {
> -    .read = sdhci_read,
> -    .write = sdhci_write,
> -    .valid = {
> -        .min_access_size = 1,
> -        .max_access_size = 4,
> -        .unaligned = false
> -    },
> -    .endianness = DEVICE_LITTLE_ENDIAN,
> -};
> -
> -static const MemoryRegionOps sdhci_mmio_be_ops = {
>     .read = sdhci_read,
>     .write = sdhci_write,
>     .impl = {
> @@ -1413,7 +1402,7 @@ static const MemoryRegionOps sdhci_mmio_be_ops = {
>         .max_access_size = 4,
>         .unaligned = false
>     },
> -    .endianness = DEVICE_BIG_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> };
>
> static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
> @@ -1467,23 +1456,6 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
>     SDHCIClass *sc = s->sc;
>     const char *class_name = object_get_typename(OBJECT(s));
>
> -    s->io_ops = sc->io_ops ?: &sdhci_mmio_le_ops;
> -    switch (s->endianness) {
> -    case DEVICE_LITTLE_ENDIAN:
> -        /* s->io_ops is little endian by default */
> -        break;
> -    case DEVICE_BIG_ENDIAN:
> -        if (s->io_ops != &sdhci_mmio_le_ops) {
> -            error_setg(errp, "SD controller doesn't support big endianness");
> -            return;
> -        }
> -        s->io_ops = &sdhci_mmio_be_ops;
> -        break;
> -    default:
> -        error_setg(errp, "Incorrect endianness");
> -        return;
> -    }
> -
>     sdhci_init_readonly_registers(s, errp);
>     if (*errp) {
>         return;
> @@ -1493,7 +1465,7 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
>     s->fifo_buffer = g_malloc0(s->buf_maxsz);
>
>     assert(sc->iomem_size >= SDHC_REGISTERS_MAP_SIZE);
> -    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, class_name,
> +    memory_region_init_io(&s->iomem, OBJECT(s), sc->io_ops, s, class_name,
>                           sc->iomem_size);
> }
>
> @@ -1578,6 +1550,7 @@ void sdhci_common_class_init(ObjectClass *klass, const void *data)
>     dc->vmsd = &sdhci_vmstate;
>     device_class_set_legacy_reset(dc, sdhci_poweron_reset);
>
> +    sc->io_ops = &sdhci_mmio_le_ops;

You call common_class_init in subclass class_inits last so this would 
overwrite what subclass has set, doesn't it? I think you either have to 
change order in subclass class_init methods or not set this here.

Regards,
BALATON Zoltan

>     sc->iomem_size = SDHC_REGISTERS_MAP_SIZE;
> }
>
>
--3866299591-983117665-1741615798=:72286--
