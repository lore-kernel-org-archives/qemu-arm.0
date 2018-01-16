Received: by 10.28.173.206 with SMTP id w197csp3504465wme;
        Mon, 15 Jan 2018 20:33:06 -0800 (PST)
X-Google-Smtp-Source: ACJfBotIIstXrHOAAu2VlWZ/dfd6fmx5K9Um5Smz5teg7nbGMDWzVHsTMjeAeAbqmApgYHwIweow
X-Received: by 10.37.39.71 with SMTP id n68mr35558114ybn.128.1516077186036;
        Mon, 15 Jan 2018 20:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516077186; cv=none;
        d=google.com; s=arc-20160816;
        b=LMYUFD/1999SRvuOjoKKm56R5jmPE9ARaRT/PoLbi5LofckarpzYKOcZTQuoRVtaHt
         Q7ZT+P3X7uMTnRF66CoFslkFk8eEff87PT1UnI3nlSqgGpze382C/ebVZRU7HhkcSUi9
         7DHN2J+cHEJeo+pOr872XNLcjWEGeLVOHs7MJaWU+MHI/vOuiYN35ZMV6WLIk0NFRcgc
         fIKa4tfFfpWaZ9PIOuI7985FQY4PTjvSb0DuWlZcRgD0znO2m7LQyOavO0pFl0n7kuyK
         hQq0SZ4aZ5vo8DmAUIrFGOLKRhki4p3VSi0v1IJRziOQkmskm1wDQB5/Ca7gmShQgV07
         lJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=BuJi7O0GngkjBFv+VUdzJ2LHYm8qVyWdkhLmGqLjkn0=;
        b=j5afF2gmjY7b4yV+RQCggI/K/nxqLdA1EBnz3W99jq3ZecXHSD5V4gI7uF5VWFW+44
         AIh5juRlAW5GdhLcHqiwmOujIgk6AXNF4LwO6uEsbRGChtNAOmGq9MTUuwboyhWCAK1K
         3oK/oBQFs89osu+L1GjPxSidYWl9e4Ye+X2Ndl7J1acbMdu6I5rC0XYSOAkVi3njfyXn
         Zj4UKqMAwjR61wRVDaygq1CoK1b4nDIIakskiYXeZw+2vlzu8vPVlwAgVlpssLLtpakY
         n3oMNtz3Qin0E3NevWVvPIzhe9uRdEpGt2tyEBE1oGSe3CWKP4ZOTrVmrSqvFXhyuZKQ
         EqyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tVH7aoD4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v130si306708yba.602.2018.01.15.20.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 20:33:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tVH7aoD4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebIvp-000245-H7
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 23:33:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebIvY-00023h-9T
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 23:32:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebIvV-00075a-46
	for qemu-devel@nongnu.org; Mon, 15 Jan 2018 23:32:48 -0500
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:42246)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebIvU-00075J-Uj; Mon, 15 Jan 2018 23:32:45 -0500
Received: by mail-qt0-x234.google.com with SMTP id c2so16765511qtn.9;
	Mon, 15 Jan 2018 20:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BuJi7O0GngkjBFv+VUdzJ2LHYm8qVyWdkhLmGqLjkn0=;
	b=tVH7aoD4CksMkIqRr4cv29xl0VGwrRjFI4fo6/Pl3DOJVMmDntpF41TwF32m2pZlC8
	KyoeBKNtFPHX/oV8fQllkdDAoSd71XKY9CIbqQOALndoW+3pMiOAFcRY6tpmo2RRl0lb
	jerxjiFbGF3p8d7l6rlq9hP4+K9GFsjVelrEEZE/o/pIBCbdrdoUGuSq+UIsWJSHZDn1
	77UM2NduajuNQu2naNpAl+y7QAqFNfrIHvDpwV+99VoVC79WnTtT35s6wAlGVloPkLqe
	s/AfEHEuo2m6Vavqh4r9QkMu4z1JXFM3NjYrLLpp/g7udwkLU8sYUQ9C4ItK1iok6Ycp
	CV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=BuJi7O0GngkjBFv+VUdzJ2LHYm8qVyWdkhLmGqLjkn0=;
	b=mftA0pLI9uuIXnlfGxA8qcRDMdclKvkJ2XrdpN98ONBThEjOtmVTdOODwlaKYkEzGz
	A5vgBnkyGE0rWw7fzGFuo9w/tCaOz3yHJ+x6rQcg3ruO5v3zzG5/KSvlkc3/ZTv8fGDE
	jltleSk9cEy1lpRlzcV2xrolzr/h7oZyBrDDBmk3rDXxtV8CZ+2bLonJbFXpCbxNYQ8Y
	kpzUWqmn40BJWIHHtd5k9Dnf1tecEWlW4OrFvBdTxfKCBA3hfAe0znw0vvNskZPaP+hi
	yvqf+q3Qrkd1WC4jtLiv/lSUqMuQkuBzzE/MAslfJsPdG01iBwyu+1qL4k+aBrIDW4X2
	JPkA==
X-Gm-Message-State: AKwxyteWSMIFBRDRLP3L8qRdPDbUXNY2L5yczLR3vS3vTQ+ErIWSH1jy
	xhS+AK/vqjwPyN7RAbVI+Ho=
X-Received: by 10.200.81.154 with SMTP id c26mr25064956qtn.129.1516077164126; 
	Mon, 15 Jan 2018 20:32:44 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id k2sm780487qkf.35.2018.01.15.20.32.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 20:32:43 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-12-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b085a18b-84f4-6695-f664-c146ece47eee@amsat.org>
Date: Tue, 16 Jan 2018 01:32:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180116013709.13830-12-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: Re: [Qemu-devel] [PATCH v4 11/14] ARM: Add basic code to emulate
 A7MPCore DAP block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PetGwophuiih

Hi Andrey,

On 01/15/2018 10:37 PM, Andrey Smirnov wrote:
> Add minimal code to emulate A7MPCore DAP block needed to boot Linux
> guest.

I was not aware the DAP is accessed by upstream Linux...

You sure this isn't rather part of some bootloader built-in self-test?

> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/arm/Makefile.objs       |   2 +-
>  hw/arm/coresight.c         | 120 +++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/coresight.h |  24 +++++++++
>  3 files changed, 145 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/coresight.c
>  create mode 100644 include/hw/arm/coresight.h
> 
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 2794e086d6..692216e0cf 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -1,4 +1,4 @@
> -obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o
> +obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o coresight.o
>  obj-$(CONFIG_DIGIC) += digic_boards.o
>  obj-y += integratorcp.o mainstone.o musicpal.o nseries.o
>  obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
> diff --git a/hw/arm/coresight.c b/hw/arm/coresight.c
> new file mode 100644
> index 0000000000..d0a8c1b005
> --- /dev/null
> +++ b/hw/arm/coresight.c
> @@ -0,0 +1,120 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * CoreSight block emulation code
> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/arm/coresight.h"
> +#include "qemu/log.h"
> +
> +static uint64_t coresight_read(void *opaque, hwaddr offset,
> +                               unsigned size)
> +{
> +    return 0;
> +}
> +
> +static void coresight_write(void *opaque, hwaddr offset,
> +                            uint64_t value, unsigned size)
> +{
> +}

I assume you had to add this to bypass the memory_transaction_failures
check.

> +
> +static const struct MemoryRegionOps coresight_ops = {
> +    .read = coresight_read,
> +    .write = coresight_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        /*
> +         * Our device would not work correctly if the guest was doing
> +         * unaligned access. This might not be a limitation on the real
> +         * device but in practice there is no reason for a guest to access
> +         * this device unaligned.
> +         */
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +        .unaligned = false,
> +    },
> +};
> +
> +static void a7mpcore_dap_init(Object *obj)
> +{
> +    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
> +    A7MPCoreDAPState *s = A7MPCORE_DAP(obj);
> +
> +    memory_region_init(&s->container, obj, "a7mpcore-dap-container", 0x100000);

You can just use add this in fsl_imx7_realize():

  create_unimplemented_device("a7mpcore-dap-container",
                              FSL_IMX7_A7MPCORE_DAP_ADDR,
                              0x100000);

to register a background region for the DAP (see "hw/misc/unimp.h")

as a bonus, running with "-d unimp" you can trace the DAP access.

So this model and those files are not necessary.

> +    sysbus_init_mmio(sd, &s->container);
> +
> +    memory_region_init_io(&s->ca7_atb_funnel,
> +                          obj,
> +                          &coresight_ops,
> +                          s,
> +                          TYPE_A7MPCORE_DAP ".ca7-atb-funnel",
> +                          0x1000);
> +    memory_region_add_subregion(&s->container, 0x41000, &s->ca7_atb_funnel);
> +
> +    memory_region_init_io(&s->cpu0_etm,
> +                          obj,
> +                          &coresight_ops,
> +                          s,
> +                          TYPE_A7MPCORE_DAP ".cpu0-etm",
> +                          0x1000);
> +    memory_region_add_subregion(&s->container, 0x7C000, &s->cpu0_etm);
> +
> +    memory_region_init_io(&s->atb_funnel,
> +                          obj,
> +                          &coresight_ops,
> +                          s,
> +                          TYPE_A7MPCORE_DAP ".atb-funnel",
> +                          0x1000);
> +    memory_region_add_subregion(&s->container, 0x83000, &s->atb_funnel);
> +
> +    memory_region_init_io(&s->tmc_etb,
> +                          obj,
> +                          &coresight_ops,
> +                          s,
> +                          TYPE_A7MPCORE_DAP ".tmc-etb",
> +                          0x1000);
> +    memory_region_add_subregion(&s->container, 0x84000, &s->tmc_etb);
> +
> +    memory_region_init_io(&s->tmc_etr,
> +                          obj,
> +                          &coresight_ops,
> +                          s,
> +                          TYPE_A7MPCORE_DAP ".tmc-etr",
> +                          0x1000);
> +    memory_region_add_subregion(&s->container, 0x86000, &s->tmc_etr);
> +
> +    memory_region_init_io(&s->tpiu,
> +                          obj,
> +                          &coresight_ops,
> +                          s,
> +                          TYPE_A7MPCORE_DAP ".tpiu",
> +                          0x1000);
> +    memory_region_add_subregion(&s->container, 0x87000, &s->tpiu);
> +}
> +
> +static void a7mpcore_dap_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "A7MPCore DAP Module";
> +}
> +
> +static const TypeInfo a7mpcore_dap_info = {
> +    .name          = TYPE_A7MPCORE_DAP,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(A7MPCoreDAPState),
> +    .instance_init = a7mpcore_dap_init,
> +    .class_init    = a7mpcore_dap_class_init,
> +};
> +
> +static void coresight_register_type(void)
> +{
> +    type_register_static(&a7mpcore_dap_info);
> +}
> +type_init(coresight_register_type)
> diff --git a/include/hw/arm/coresight.h b/include/hw/arm/coresight.h
> new file mode 100644
> index 0000000000..d1480e825b
> --- /dev/null
> +++ b/include/hw/arm/coresight.h
> @@ -0,0 +1,24 @@
> +#ifndef CORESIGHT_H
> +#define CORESIGHT_H
> +
> +#include "hw/sysbus.h"
> +
> +typedef struct A7MPCoreDAPState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion container;
> +
> +    MemoryRegion ca7_atb_funnel;
> +    MemoryRegion cpu0_etm;
> +    MemoryRegion atb_funnel;
> +    MemoryRegion tmc_etb;
> +    MemoryRegion tmc_etr;
> +    MemoryRegion tpiu;
> +
> +} A7MPCoreDAPState;
> +
> +#define TYPE_A7MPCORE_DAP "a7mpcore-dap"
> +#define A7MPCORE_DAP(obj) OBJECT_CHECK(A7MPCoreDAPState, (obj), TYPE_A7MPCORE_DAP)
> +
> +#endif /* CORESIGHT_H */
> 
