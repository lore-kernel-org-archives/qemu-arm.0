Received: by 10.28.91.67 with SMTP id p64csp3661574wmb;
        Tue, 6 Mar 2018 04:10:04 -0800 (PST)
X-Google-Smtp-Source: AG47ELuCkMbKEzryla6JzSwmY8QoYew3pcAchL9nC+EYooz6hnanTrPiGciXgyP6kaCMmHJvR8qO
X-Received: by 2002:a25:bbc8:: with SMTP id c8-v6mr2400156ybk.5.1520338204486;
        Tue, 06 Mar 2018 04:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520338204; cv=none;
        d=google.com; s=arc-20160816;
        b=arDX64YVS03rtLz/Vfffu+lWhd5x7FvGDLQMd83PvUsQSXtJIG+yAlGVZw1tkDQ13a
         RlbqwAB2jL4wkNxqYpsTLiWw27O0YrxVisEQtA/49VGoj1CLDV2J9jP8jXCoZTFnD81S
         COQ1erWGwX833vXk7hXtc5fSkq/BGEpqO3EwWCZLtz5gX7D+7iL+QADcKK/zOOStjBzk
         uAe3ByvUxoKnsEsDQ0HvkUTUvFIIZIOiOXB6gKn9zha+w9QG9fpzE6YHRBgbH+PaxGu0
         a60m+oVsO4zYBgzGfAD+1N/cePwoV6/6tizHq/j6NrKkaZDWxHW3qiJX7AhBUTSXA/tL
         YTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+ObAHN/jpLYzcOvAqD/yAHLFIpXGdKfpOqcmTtqRs48=;
        b=OjUjpZk2K/mH/23Yqljsqm8CRjVhB30nkK5xzLAwwTmNg/fmBIjpk8Yrj1yxkE50WK
         crk+QSefvITA1je3YB7akunfykkmA/yK9XzM4GKxfmFSSYuNpeZM9H79kL/HdgBNu/pT
         tPOrlDTQl2OqKtUcAMZ4cYbdUiMSP4Z2PpnRps2reaIDKAHTLKa4B/Q7LDJccyOHMRQj
         xwDEKsspuJnMZqir8pvYLx1RzMl7xjbTCAw5upoSyaGIzeQlhecCxARnNJ6IEDDYUo4D
         sZYsMBAsNW4W1R4E5RkdbKwkwZM4vWwTET8FMJMSWmysFdPL1jhXSw/9rXVFdiU7WmC8
         xKrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B9uuV18B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w129si2532369ywd.258.2018.03.06.04.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 04:10:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B9uuV18B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etBPv-00035c-PA
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 07:10:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etBPk-00033K-FG
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:09:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1etBPi-00088M-Vx
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:09:52 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:32893)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1etBPi-00087r-PK
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:09:50 -0500
Received: by mail-ot0-x244.google.com with SMTP id y11so18127744otg.0
	for <qemu-arm@nongnu.org>; Tue, 06 Mar 2018 04:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+ObAHN/jpLYzcOvAqD/yAHLFIpXGdKfpOqcmTtqRs48=;
	b=B9uuV18BvxdIGGfGePBvS31t+BRl0noVsr9AOwBMMcE2QMWIaww760ubTXrgOppyys
	wxpaKCqv4LmJhdzTDHWqaLIjVU47YPyX8yAhJgRkIETCmP8Y9A5Q1PXgoI5j2yT6XSdc
	PQj2tPe5UVCEacDSz+P5DIAbpiIkEF9PrqwDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+ObAHN/jpLYzcOvAqD/yAHLFIpXGdKfpOqcmTtqRs48=;
	b=EZyMM/v3dDRHA6dLjtBy1uk+TvNxmD9G1gkgCDUw46bjOlkvJQnsuGe8/xTbIUVoWn
	QSzcbhHgJ+iJ9zaJCn+D+5pvbVwh6YCgElcj3d78bY/2HTHRxGdUnQjSAZ7QiJ904mEC
	T8JulDHJyHzIdAjzG0B6ttDjpqCZygUF3wtkvHlP08j3xne+STiA7KZDwmhaUyPYSKMq
	Qmer4YY8lDCdj0vNw2vaczKHUw6gfjzkMORyP5UySrmMgXOvKmtmtM305niHjL0YZanl
	Ux8bnPI+TO46VCr8cF1S8MnL5kMjxkk30n5EZ9dwffwUib0J/GT13gnV0E5DT7WAzaWr
	iCBA==
X-Gm-Message-State: AElRT7Ejg61uYX1O/DGk0OEXkqdY5E5Qc5DT1klzkjrP3obLfsisNMY2
	KTNi2QlOdlHPZ7lN5tkQ5GLXl47rktkhfx4JjhurpQ==
X-Received: by 10.157.69.152 with SMTP id x24mr12104876ote.126.1520338190015; 
	Tue, 06 Mar 2018 04:09:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 6 Mar 2018 04:09:29 -0800 (PST)
In-Reply-To: <1518893216-9983-2-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-2-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Mar 2018 12:09:29 +0000
Message-ID: <CAFEAcA8pdpA1MUAyKNyAdM9QH6_n2NBvZPYdiFKK20N9FG2z1g@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v9 01/14] hw/arm/smmu-common: smmu base
 device and datatypes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WER/zJm97eLr

On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
> The patch introduces the smmu base device and class for the ARM
> smmu. Devices for specific versions will be derived from this
> base device.
>
> We also introduce some important datatypes.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>

> + * Author: Prem Mallappa <pmallapp@broadcom.com>
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "sysemu/sysemu.h"
> +#include "exec/address-spaces.h"
> +#include "trace.h"
> +#include "exec/target_page.h"
> +#include "qom/cpu.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +
> +#include "qemu/error-report.h"
> +#include "hw/arm/smmu-common.h"
> +
> +static void smmu_base_realize(DeviceState *dev, Error **errp)
> +{
> +    SMMUState *s = ARM_SMMU(dev);
> +
> +    s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
> +    s->iotlb = g_hash_table_new_full(NULL, NULL, NULL, g_free);

Shouldn't we also invoke the parent_realize ?

> +}
> +
> +static void smmu_base_reset(DeviceState *dev)
> +{
> +    SMMUState *s = ARM_SMMU(dev);
> +
> +    g_hash_table_remove_all(s->configs);
> +    g_hash_table_remove_all(s->iotlb);
> +}
> +
> +static Property smmu_dev_properties[] = {
> +    DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
> +    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus, "PCI", PCIBus *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void smmu_base_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    SMMUBaseClass *sbc = ARM_SMMU_CLASS(klass);
> +
> +    dc->props = smmu_dev_properties;
> +    sbc->parent_realize = dc->realize;
> +    dc->realize = smmu_base_realize;

There's a device_class_set_parent_realize() in the tree now that
we should probably use instead of these 2 lines:
       device_class_set_parent_realize(dc, smmu_base_realize,
                                       &sbc->parent_realize);

> +    dc->reset = smmu_base_reset;
> +}
> +
> +static const TypeInfo smmu_base_info = {
> +    .name          = TYPE_ARM_SMMU,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(SMMUState),
> +    .class_data    = NULL,
> +    .class_size    = sizeof(SMMUBaseClass),
> +    .class_init    = smmu_base_class_init,
> +    .abstract      = true,
> +};
> +
> +static void smmu_base_register_types(void)
> +{
> +    type_register_static(&smmu_base_info);
> +}
> +
> +type_init(smmu_base_register_types)
> +
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> new file mode 100644
> index 0000000..8a9d931
> --- /dev/null
> +++ b/include/hw/arm/smmu-common.h
> @@ -0,0 +1,124 @@
> +/*
> + * ARM SMMU Support
> + *
> + * Copyright (C) 2015-2016 Broadcom Corporation
> + * Copyright (c) 2017 Red Hat, Inc.
> + * Written by Prem Mallappa, Eric Auger
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef HW_ARM_SMMU_COMMON_H
> +#define HW_ARM_SMMU_COMMON_H
> +
> +#include <hw/sysbus.h>

QEMU headers should be included using "", not <>.

> +#include "hw/pci/pci.h"
> +
> +#define SMMU_PCI_BUS_MAX      256
> +#define SMMU_PCI_DEVFN_MAX    256
> +
> +#define SMMU_MAX_VA_BITS      48
> +
> +/*
> + * Page table walk error types
> + */
> +typedef enum {
> +    SMMU_PTW_ERR_NONE,
> +    SMMU_PTW_ERR_WALK_EABT,   /* Translation walk external abort */
> +    SMMU_PTW_ERR_TRANSLATION, /* Translation fault */
> +    SMMU_PTW_ERR_ADDR_SIZE,   /* Address Size fault */
> +    SMMU_PTW_ERR_ACCESS,      /* Access fault */
> +    SMMU_PTW_ERR_PERMISSION,  /* Permission fault */
> +} SMMUPTWEventType;
> +
> +typedef struct SMMUPTWEventInfo {
> +    SMMUPTWEventType type;
> +    dma_addr_t addr; /* fetched address that induced an abort, if any */
> +} SMMUPTWEventInfo;
> +
> +typedef struct SMMUTransTableInfo {
> +    bool disabled;             /* is the translation table disabled? */
> +    uint64_t ttb;              /* TT base address */
> +    uint8_t tsz;               /* input range, ie. 2^(64 -tsz)*/
> +    uint8_t granule_sz;        /* granule page shift */
> +    uint8_t initial_level;     /* initial lookup level */
> +} SMMUTransTableInfo;
> +
> +/*
> + * Generic structure populated by derived SMMU devices
> + * after decoding the configuration information and used as
> + * input to the page table walk
> + */
> +typedef struct SMMUTransCfg {
> +    int      stage;            /* translation stage */
> +    bool     aa64;             /* arch64 or aarch32 translation table */
> +    bool     disabled;         /* smmu is disabled */
> +    bool     bypassed;         /* translation is bypassed */
> +    bool     aborted;          /* translation is aborted */
> +    uint64_t ttb;              /* TT base address */
> +    uint8_t oas;               /* output address width */
> +    uint8_t  tbi;              /* Top Byte Ignore */
> +    uint16_t asid;
> +    SMMUTransTableInfo tt[2];

Can you be consistent about either lining up the field names or not doing so,
please? (I would suggest going for 'not'.)

> +} SMMUTransCfg;

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
