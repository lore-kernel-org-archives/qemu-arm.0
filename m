Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4122860lfg;
        Thu, 27 Feb 2020 00:10:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqyABz4Mj7svQTr/oRlC2XlxLRSlUBMUBjeZL5OSaAQAnG7FT3k/DXqZA8McjkiHvxKXMSy0
X-Received: by 2002:ac8:4505:: with SMTP id q5mr3537842qtn.84.1582791026518;
        Thu, 27 Feb 2020 00:10:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582791026; cv=none;
        d=google.com; s=arc-20160816;
        b=dPyAnEM69I2eD46Lz8mp5HlBTYeNIQsKyTOTL7c2ediH2CW+XTo2W0AYVJSNM/yuo/
         qtY75KfsO67KEeIt3LRwRKu8ImoG4VcDjqemj/ilqC6h92NV8uqMqeIMvhN0m13KzsND
         zB1CNR1NAhndGw16TA3+KB7Dvi9tnGnFT5/hA4YRYuJRrsNatojK3AFDmxXBLLMQq+EW
         14u6YL3RPyfbWxTvPrZoAzWt45cZuLIwyvBqxzOdXWhgCf1z1W4uV8+6piyjluWOz5np
         zcmZNo6xoNKtkG56qEEwVFfJ036Cuf4MRt/AHJBhSUD9KX5gFFatdP87QMs5ta7xzItg
         yLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=P+lYBU7AmH61KU1rs7LYvWjP5Bph1Xkkh6OBOly9kJo=;
        b=fHPe0YCrUPWPxqKjixSCiKc9WYsxWVAjoVZtFDCJS+ktPGcuPyAteNPQXVSWFb5xfS
         ywx8g9JGpJ+CE/xAbmNxt+05DDspeJNp/wG+4jCFvW5Jyfra6aoPiVGUzGoJESDbdhgO
         xl7cNrYhV0n4LEveHA5GSBqMrEMyByL8AH5WPSC8800q/c4BVxtpnwZ4sFZbWm64QJRo
         K6vO/qzdfgQpvbh3RNTbnThzb9H7YDuWzWY+q4f2QHjz1U8TOV9N2l3HtAiTHidr74X7
         QMrweTPlZXl81BYKSeDv+EjKe3lXb3Ld71OBaDSQC/siCI4j02NGTjsUffa2IKWPVr3N
         9hZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QP2Wo8Cq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j28si994031qtl.85.2020.02.27.00.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 00:10:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QP2Wo8Cq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7EFV-0006Ew-UY
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 03:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37496)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j7EFN-0006C2-BI
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:10:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j7EFL-0003Vo-VM
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:10:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39554
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j7EFL-0003V9-RB
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:10:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582791015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+lYBU7AmH61KU1rs7LYvWjP5Bph1Xkkh6OBOly9kJo=;
 b=QP2Wo8CqxPeJcBynNFCdKNXDsDX29zmXZmOqlUtXq5iyTEVmyM5K6KdzYeQU4sDD76Noq0
 tlcwKJun1h7rNZYF3Erl/d0IGzzayRgoocpa2yVZVllqKaGNnitb+WcEUwscGjQso6eX9v
 GvGhnJxOrtDEfaJauICVrItP9+lG4pI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-ixJPtdZTMs6g0Hvy-awftg-1; Thu, 27 Feb 2020 03:10:13 -0500
X-MC-Unique: ixJPtdZTMs6g0Hvy-awftg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C00A800053;
 Thu, 27 Feb 2020 08:10:12 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 68BED19C58;
 Thu, 27 Feb 2020 08:10:05 +0000 (UTC)
Subject: Re: [PATCH v4 06/10] hw/arm/virt: vTPM support
To: eric.auger.pro@gmail.com, stefanb@linux.ibm.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226205942.11424-1-eric.auger@redhat.com>
 <20200226205942.11424-7-eric.auger@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <33188de8-944c-47d7-8c90-364d1dee08b6@redhat.com>
Date: Thu, 27 Feb 2020 09:10:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200226205942.11424-7-eric.auger@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jHgtlS2ZJF36

Hi Peter,

On 2/26/20 9:59 PM, Eric Auger wrote:
> Let the TPM TIS SYSBUS device be dynamically instantiable
> in ARM virt.  A device tree node is dynamically created
> (TPM via MMIO).
> 
> The TPM Physical Presence interface (PPI) is not supported.
> 
> To run with the swtmp TPM emulator, the qemu command line must
> be augmented with:
> 
>         -chardev socket,id=chrtpm,path=swtpm-sock \
>         -tpmdev emulator,id=tpm0,chardev=chrtpm \
>         -device tpm-tis-device,tpmdev=tpm0 \
> 
> swtpm/libtpms command line example:
> 
> swtpm socket --tpm2 -t -d --tpmstate dir=/tmp/tpm \
> --ctrl type=unixio,path=swtpm-sock
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Tested-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

When you can find free cycles, please can you check you have nothing
against that patch. The rest of the series looks OK from Stefan's and
Ard's point of view.

Thanks

Eric
> 
> ---
> 
> v2 -> v3:
> - use qemu_fdt_setprop_string()
> ---
>  hw/arm/Kconfig      |  1 +
>  hw/arm/sysbus-fdt.c | 33 +++++++++++++++++++++++++++++++++
>  hw/arm/virt.c       |  7 +++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 3d86691ae0..b6f03f7f53 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -5,6 +5,7 @@ config ARM_VIRT
>      imply VFIO_AMD_XGBE
>      imply VFIO_PLATFORM
>      imply VFIO_XGMAC
> +    imply TPM_TIS_SYSBUS
>      select A15MPCORE
>      select ACPI
>      select ARM_SMMUV3
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index 022fc97ecd..f603787b65 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -30,6 +30,7 @@
>  #include "hw/arm/sysbus-fdt.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/device_tree.h"
> +#include "sysemu/tpm.h"
>  #include "hw/platform-bus.h"
>  #include "hw/vfio/vfio-platform.h"
>  #include "hw/vfio/vfio-calxeda-xgmac.h"
> @@ -434,6 +435,37 @@ static bool vfio_platform_match(SysBusDevice *sbdev,
>  #define VFIO_PLATFORM_BINDING(compat, add_fn) \
>      {TYPE_VFIO_PLATFORM, (compat), (add_fn), vfio_platform_match}
>  
> +/*
> + * add_tpm_tis_fdt_node: Create a DT node for TPM TIS
> + *
> + * See kernel documentation:
> + * Documentation/devicetree/bindings/security/tpm/tpm_tis_mmio.txt
> + * Optional interrupt for command completion is not exposed
> + */
> +static int add_tpm_tis_fdt_node(SysBusDevice *sbdev, void *opaque)
> +{
> +    PlatformBusFDTData *data = opaque;
> +    PlatformBusDevice *pbus = data->pbus;
> +    void *fdt = data->fdt;
> +    const char *parent_node = data->pbus_node_name;
> +    char *nodename;
> +    uint32_t reg_attr[2];
> +    uint64_t mmio_base;
> +
> +    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    nodename = g_strdup_printf("%s/tpm_tis@%" PRIx64, parent_node, mmio_base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "tcg,tpm-tis-mmio");
> +
> +    reg_attr[0] = cpu_to_be32(mmio_base);
> +    reg_attr[1] = cpu_to_be32(0x5000);
> +    qemu_fdt_setprop(fdt, nodename, "reg", reg_attr, 2 * sizeof(uint32_t));
> +
> +    g_free(nodename);
> +    return 0;
> +}
> +
>  #endif /* CONFIG_LINUX */
>  
>  static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
> @@ -455,6 +487,7 @@ static const BindingEntry bindings[] = {
>      TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node),
>      TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
>      VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
> +    TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
>  #endif
>      TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
>      TYPE_BINDING("", NULL), /* last element */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f788fe27d6..4b967e39d1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -47,6 +47,7 @@
>  #include "sysemu/numa.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/tpm.h"
>  #include "sysemu/kvm.h"
>  #include "hw/loader.h"
>  #include "exec/address-spaces.h"
> @@ -2041,6 +2042,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
>      mc->block_default_type = IF_VIRTIO;
>      mc->no_cdrom = 1;
>      mc->pci_allow_0_address = true;
> @@ -2153,6 +2155,11 @@ type_init(machvirt_machine_init);
>  
>  static void virt_machine_5_0_options(MachineClass *mc)
>  {
> +    static GlobalProperty compat[] = {
> +        { TYPE_TPM_TIS_SYSBUS, "ppi", "false" },
> +    };
> +
> +    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
>  }
>  DEFINE_VIRT_MACHINE_AS_LATEST(5, 0)
>  
> 

