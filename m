Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3833141lfp;
        Mon, 10 Feb 2020 05:21:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqy2/KHLWDnt8SDhSNdiW0kLDTApwvlhBbO1wOYwMU6PlkqJegl6uETWWCHfC5Lp3XS2mK84
X-Received: by 2002:ad4:45ad:: with SMTP id y13mr9816044qvu.31.1581340895505;
        Mon, 10 Feb 2020 05:21:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581340895; cv=none;
        d=google.com; s=arc-20160816;
        b=h0J2ASQoQLvnu+0zIceYgb0MlhxlyfKvg019kPskU1yup1y7DOeePx0LqqnJZ4hy98
         5WWjax6rERgbHOSyBDZF1TrQzRi2gHKnLNHXIP1adO1LnXwFfuBJ0uwlptrUCtz9h77g
         E6xCeLfq/Hi4ZW/PZ0Hh+hFvcH5t9AXpoB5htqqTHGQQZPs92HvItQXmOIwSwYxxLktR
         xyiXap1YanMLV5sf3JtD0Mpiqh7PAXmwuMIbXyx0xuzjZSzHAL31nYmLyOgfy4ZvfskI
         9j+dSAQqwyOfSyTdUak5nAmyA/Am5PDqWT/TV3XPLW0ir/YLKIaygDoetykLRJwTmzcA
         Vpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+8OW1EFn61CO27BhjMM/IS2SeGaQnZzx15yEHVpS3l8=;
        b=uV8qnFYqR1H5ai2dBnGtkZKifLscpXgONdd++9HJx7YE9+G+sxqyDgbGyDajQs2Zq9
         aDAdRRKH1/jqhxiXEAn2ID/qqwHCkQIERQd0PAJEHTeSr/KnIb5JyWn+gRc+4ephOW6/
         stBwq4yebc0BwsI1LKG161PpXAM5luZKlDlYHSTcQ0p0U3sgJVpMxgYnVrQwrhydqYZq
         nwzK3SrTXdwqSTrTuv4XdWVxIboC5TuZI9p+2BcehWhTcTh5Q6Kf/KFyafBtNZlfSz9W
         y1FZJ+TffVeX287RsbgAGSDAYKhEdiiHOmT4z3Vn/TRbmVB5rUtUVB2P1J4UYmb13XhE
         +plQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YPCqj7Pf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z23si23483qto.69.2020.02.10.05.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 05:21:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YPCqj7Pf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j190I-0000x8-VK
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 08:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j190A-0000ul-BW
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:21:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1905-0001Wf-1P
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:21:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54290
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1904-0001W9-Bw
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581340879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+8OW1EFn61CO27BhjMM/IS2SeGaQnZzx15yEHVpS3l8=;
 b=YPCqj7Pf3FHYZ8+a0W9ZsmcEWJkBz9e0YNkEfYe5sVrOoG2s3mKhjqc7aTOVaYzF48ECM2
 FwW8S+apz7iZVAoQ/XY6ricVXwkGQzPNhsFFCY7zu1Lznqov1B0TIqhL6E9iAuJ/Xbe1F5
 83fRHABidqaAMeonUKOJDFBPGXeFnXc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-Qlm_xT_UNNCLZX2gMkC9WQ-1; Mon, 10 Feb 2020 08:21:15 -0500
Received: by mail-wr1-f69.google.com with SMTP id l1so5019156wrt.4
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2020 05:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+8OW1EFn61CO27BhjMM/IS2SeGaQnZzx15yEHVpS3l8=;
 b=W1JBCizA38MY8Vjm3n00OZ37BPPyKMAPkaRSbyWtOuXPdAL6QxNoyT5yZJU3IFelRM
 hW4YYeei3pB8NzxVffzfVFlThab8bFlMUp3OIStrgL0Pdyvz4Rr7vNGqGtRBevrhUuW1
 aqdqb+JFNNsQcY0tFGZtV52S5TYjSM43o02vQNaynF1HzUks39b/HpqfNGhxlzdu+8cx
 uy2ETV7XgjdTtBpVFKtM/4kQt7mRHJNzLPps1v3sbGn8a0ElzEDLFj/yIdeksfo3bOS0
 +RDjicdXN+lr3l0ycOD8M9XVPug13+ST+mHZTNcfUWUtON1a4EC8dToD3nYw3SzmD+4V
 w7eg==
X-Gm-Message-State: APjAAAUxlYbdSEqMrVGku/NDQB6LYR+LKO7xjlOsuYPitXj7BW+ujE03
 zo25L+co7BWiS3G1l6C0ShZ+RxEFvdDoOyDy7ZZe4aHGb2zv/xpk29767nAhk6InFa5vbDmq3HD
 thKzamt/2Ya7S
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr2110495wrk.53.1581340874652; 
 Mon, 10 Feb 2020 05:21:14 -0800 (PST)
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr2110469wrk.53.1581340874315; 
 Mon, 10 Feb 2020 05:21:14 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id c9sm542442wme.41.2020.02.10.05.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 05:21:13 -0800 (PST)
Subject: Re: [RFC 2/2] hw/arm/virt: vTPM support
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 stefanb@linux.ibm.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org
References: <20200210131523.27540-1-eric.auger@redhat.com>
 <20200210131523.27540-3-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3085a956-8a2e-4f0a-35a9-68878274d852@redhat.com>
Date: Mon, 10 Feb 2020 14:21:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210131523.27540-3-eric.auger@redhat.com>
Content-Language: en-US
X-MC-Unique: Qlm_xT_UNNCLZX2gMkC9WQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hlMlIr5OGWuC

On 2/10/20 2:15 PM, Eric Auger wrote:
> Let the TPM TIS device be dynamically instantiable in ARM virt.
> A device tree node is dynamically created (TPM via MMIO).
> 
> The TPM Physical Presence interface (PPI) is not supported.
> 
> To run with the swtmp TPM emulator, the qemu command line must
> be augmented with:
> 
>          -chardev socket,id=chrtpm,path=swtpm-sock \
>          -tpmdev emulator,id=tpm0,chardev=chrtpm \
>          -device tpm-tis,tpmdev=tpm0 \
> 
> swtpm/libtpms command line example:
> 
> swtpm socket --tpm2 -t -d --tpmstate dir=/tmp/tpm \
> --ctrl type=unixio,path=swtpm-sock
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/arm/Kconfig      |  1 +
>   hw/arm/sysbus-fdt.c | 36 ++++++++++++++++++++++++++++++++++++
>   hw/arm/virt.c       |  7 +++++++
>   3 files changed, 44 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 3d86691ae0..ce0852f148 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -5,6 +5,7 @@ config ARM_VIRT
>       imply VFIO_AMD_XGBE
>       imply VFIO_PLATFORM
>       imply VFIO_XGMAC
> +    imply TPM_TIS
>       select A15MPCORE
>       select ACPI
>       select ARM_SMMUV3
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index 022fc97ecd..d723fad6ba 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -30,6 +30,7 @@
>   #include "hw/arm/sysbus-fdt.h"
>   #include "qemu/error-report.h"
>   #include "sysemu/device_tree.h"
> +#include "sysemu/tpm.h"
>   #include "hw/platform-bus.h"
>   #include "hw/vfio/vfio-platform.h"
>   #include "hw/vfio/vfio-calxeda-xgmac.h"
> @@ -434,6 +435,40 @@ static bool vfio_platform_match(SysBusDevice *sbdev,
>   #define VFIO_PLATFORM_BINDING(compat, add_fn) \
>       {TYPE_VFIO_PLATFORM, (compat), (add_fn), vfio_platform_match}
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
> +    int compat_str_len;
> +    char *nodename;
> +    uint32_t reg_attr[2];
> +    uint64_t mmio_base;
> +
> +    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    nodename = g_strdup_printf("%s/tpm_tis@%" PRIx64, parent_node, mmio_base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +
> +    compat_str_len = strlen("tcg,tpm-tis-mmio") + 1;
> +    qemu_fdt_setprop(fdt, nodename, "compatible", "tcg,tpm-tis-mmio",
> +                     compat_str_len);
> +
> +    reg_attr[0] = cpu_to_be32(mmio_base);
> +    reg_attr[1] = cpu_to_be32(0x5000);
> +    qemu_fdt_setprop(fdt, nodename, "reg", reg_attr, 2 * sizeof(uint32_t));
> +
> +    g_free(nodename);
> +    return 0;
> +}

I don't know well the policy with virt and fdt_node, but this patch LGTM.

> +
>   #endif /* CONFIG_LINUX */
>   
>   static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
> @@ -455,6 +490,7 @@ static const BindingEntry bindings[] = {
>       TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node),
>       TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
>       VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
> +    TYPE_BINDING(TYPE_TPM_TIS, add_tpm_tis_fdt_node),
>   #endif
>       TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
>       TYPE_BINDING("", NULL), /* last element */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f788fe27d6..1bb34dfa0b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -47,6 +47,7 @@
>   #include "sysemu/numa.h"
>   #include "sysemu/runstate.h"
>   #include "sysemu/sysemu.h"
> +#include "sysemu/tpm.h"
>   #include "sysemu/kvm.h"
>   #include "hw/loader.h"
>   #include "exec/address-spaces.h"
> @@ -2041,6 +2042,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS);
>       mc->block_default_type = IF_VIRTIO;
>       mc->no_cdrom = 1;
>       mc->pci_allow_0_address = true;
> @@ -2153,6 +2155,11 @@ type_init(machvirt_machine_init);
>   
>   static void virt_machine_5_0_options(MachineClass *mc)
>   {
> +    static GlobalProperty compat[] = {
> +        { TYPE_TPM_TIS, "ppi", "false" },
> +    };
> +
> +    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
>   }
>   DEFINE_VIRT_MACHINE_AS_LATEST(5, 0)
>   
> 

