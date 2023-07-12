Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2825877eje;
        Wed, 12 Jul 2023 12:07:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEQwURWP8IjWbpCia6AZ31WiMxVAY2BeX5GH/Ruw3e+P4rhmmbD9NCDvsR2B2vpvlx92TwM
X-Received: by 2002:a05:620a:c47:b0:75e:c5f7:7a68 with SMTP id u7-20020a05620a0c4700b0075ec5f77a68mr23459353qki.22.1689188829648;
        Wed, 12 Jul 2023 12:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689188829; cv=none;
        d=google.com; s=arc-20160816;
        b=D1jlDWEzTndwaYK90gDPb7ojCavgBFgfj+FKlfZGqIIxQ474YZdKcYbN9VJ008Nodx
         gx3o3e5FByg4uNfzp5Lo9uoTHd2DoDOs98Amsy1YAarcIV58dWXCWHZXqW+5yxqCw1R7
         /TM7lFU3g4BBM0Pb5gRItU6fvc9LWa40f3Sxsn6VoyZ8ppHcbqwz+c2x/tk7F23Nn2dk
         9Ujzx7fgKx6NkMYEG91EYcfmSleaUslbMLV2//wh0LBfsRBJ1gTZyqBVRFxHsR+Utt2F
         n1bLfDtsi6gdZcaBssiFpF1rVLKuPu9g0FKEWbRB8H8j/2t/Oa23fRGhrGJxdw70NLQ1
         Mr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gxjhCOTLKfeGm6Ne+aGWKJ1TT/PjhpkHkM/7xorCfCA=;
        fh=NddmdC0H7Yvd15BYzKWOWZBS0FBdcJ9zE0BWGJ3GxJc=;
        b=NTHlPprJFmx/8+DiVPF1INR2IsrYJsVlmPvrmeT52di4Zsu5qoVL6QDPPTWgJtVSoM
         zy9lz2DxLSpAnQsCSaMOkxjSTT9pdC2GjZzTaZu1ZoZlMN8lz4M9sHTgev9sKc6xKCdB
         SvGufBNOloteoixMgNOyGmhSuSs+ERoaajRmcFZHJq5TNdXSufeZXbQ2wM1DILs6uykz
         6Nnfm5ufp7JRsPe2a5JwJGHWo/GcmINgazuCKo/pcS8rCbwc9L8XKi25iGJTyZevBWTl
         Bq5jGUlSXOnpLGECVk7OwISdxmApVeCuwIplZowPTJvmzpeDkY/lfyX38luF0jQrxOfs
         8jsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=IlpsAE1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020a05620a024800b00767dd2ffcdesi1995912qkn.149.2023.07.12.12.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 12:07:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=IlpsAE1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJfAy-00078F-EM; Wed, 12 Jul 2023 15:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJfAq-00075f-ES
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 15:06:53 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qJfAn-0007rk-Rr
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 15:06:51 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b8decf09e1so6421479a34.0
 for <qemu-arm@nongnu.org>; Wed, 12 Jul 2023 12:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689188805; x=1691780805;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gxjhCOTLKfeGm6Ne+aGWKJ1TT/PjhpkHkM/7xorCfCA=;
 b=IlpsAE1V6yvQU+ODnsNfQBjw6QmX0A/s632iwYS4uZv+YYlMOFq1jcPqYlwpGoosn+
 S74AH75D2VvLZ0qpvil11N9XxeFru1EIvdo0ea15PDLAukJ14Ou2+h7OBO3Hpxy+LbvK
 oL1IyMr4UjdfSDr+nlAz01qbz7YU2FvygXQ6OzP813eh+bsHGkyRNUkRZlAEEN/RNycT
 SCvfraYOkn/EAnO3zrcDEdbhQQFqe/po9UBfAzwz7t+XC+ZzIcGvguLq+Wsi+bVUiPt2
 7YjpF1HIHfJ18ifyLx2CigWa4Lan3Urx6UlXtXfDRUx0EX28q1YkUryJmXW8td/iiwiV
 kNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689188805; x=1691780805;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gxjhCOTLKfeGm6Ne+aGWKJ1TT/PjhpkHkM/7xorCfCA=;
 b=hQieVBHgdXu9Em+iozCAiqOVFFU7LaW91rNuXJ4rWzVyb3x8/Sz3YmdvVlUqlauP06
 SDv3lKJbB1JIIifBsW3PNg/YEg+YMPC3nxcoip10TKAbQvpzKY4wxhemsSFpghnJ2zAF
 f9Im0aomC/jwMr7Yc0SoTFB6y8ZpDJi5XTSlHbYWbPmf+KfsRZkKuO2H2f0gPDNZPSSm
 Du3qQN3y5uf98ew+APWTs1kIC6zFB6KNtaX3TAxB5EhimIEBRZqgKE1HTeotfWF1MZ1W
 Vh5xnANXtZe82mGUiZYX5LnZsmi0BnBBG2DKpdbFCx2O5rLBGsDbvhnV9N4nhAjp88r3
 zH7Q==
X-Gm-Message-State: ABy/qLYW+6Z6xlB3f1kdIP1GkCemq/SuHgRcANN2gGY/hu8YdRJ4rowC
 l19hVkAmfTcNybXStNSABW3fIQ==
X-Received: by 2002:a9d:6244:0:b0:6b9:9b0a:b9a8 with SMTP id
 i4-20020a9d6244000000b006b99b0ab9a8mr3686304otk.13.1689188805201; 
 Wed, 12 Jul 2023 12:06:45 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 z11-20020a9d65cb000000b006b75242d6c3sm2185342oth.38.2023.07.12.12.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 12:06:44 -0700 (PDT)
Message-ID: <f3c8e751-bc18-b4b8-39ba-822aa4c19f98@ventanamicro.com>
Date: Wed, 12 Jul 2023 16:06:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/10] hw/arm/virt-acpi-build.c: Move fw_cfg and virtio to
 common location
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-2-sunilvl@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230712163943.98994-2-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.11,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2dmEFUgHGNGH



On 7/12/23 13:39, Sunil V L wrote:
> The functions which add fw_cfg and virtio to DSDT are same for ARM
> and RISC-V. So, instead of duplicating in RISC-V, move them from
> hw/arm/virt-acpi-build.c to common aml-build.c.

Nice.

> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   hw/acpi/aml-build.c         | 41 ++++++++++++++++++++++++++++++++++++
>   hw/arm/virt-acpi-build.c    | 42 -------------------------------------
>   hw/riscv/virt-acpi-build.c  | 16 --------------
>   include/hw/acpi/aml-build.h |  6 ++++++
>   4 files changed, 47 insertions(+), 58 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ea331a20d1..eeb1263c8c 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2467,3 +2467,44 @@ Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source)
>   
>       return var;
>   }
> +
> +void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> +{
> +    Aml *dev = aml_device("FWCF");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> +    /* device present, functioning, decoding, not shown in UI */
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> +                                       fw_cfg_memmap->size, AML_READ_WRITE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
> +void acpi_dsdt_add_virtio(Aml *scope,
> +                          const MemMapEntry *virtio_mmio_memmap,
> +                          uint32_t mmio_irq, int num)
> +{
> +    hwaddr base = virtio_mmio_memmap->base;
> +    hwaddr size = virtio_mmio_memmap->size;
> +    int i;
> +
> +    for (i = 0; i < num; i++) {
> +        uint32_t irq = mmio_irq + i;
> +        Aml *dev = aml_device("VR%02u", i);
> +        aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
> +        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> +        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +        Aml *crs = aml_resource_template();
> +        aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
> +        aml_append(crs,
> +                   aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> +                                 AML_EXCLUSIVE, &irq, 1));
> +        aml_append(dev, aml_name_decl("_CRS", crs));
> +        aml_append(scope, dev);
> +        base += size;
> +    }
> +}
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6b674231c2..fdedb68e2b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -35,7 +35,6 @@
>   #include "target/arm/cpu.h"
>   #include "hw/acpi/acpi-defs.h"
>   #include "hw/acpi/acpi.h"
> -#include "hw/nvram/fw_cfg.h"
>   #include "hw/acpi/bios-linker-loader.h"
>   #include "hw/acpi/aml-build.h"
>   #include "hw/acpi/utils.h"
> @@ -94,21 +93,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>       aml_append(scope, dev);
>   }
>   
> -static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> -{
> -    Aml *dev = aml_device("FWCF");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> -    /* device present, functioning, decoding, not shown in UI */
> -    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> -    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -    Aml *crs = aml_resource_template();
> -    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> -                                       fw_cfg_memmap->size, AML_READ_WRITE));
> -    aml_append(dev, aml_name_decl("_CRS", crs));
> -    aml_append(scope, dev);
> -}
> -
>   static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
>   {
>       Aml *dev, *crs;
> @@ -133,32 +117,6 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
>       aml_append(scope, dev);
>   }
>   
> -static void acpi_dsdt_add_virtio(Aml *scope,
> -                                 const MemMapEntry *virtio_mmio_memmap,
> -                                 uint32_t mmio_irq, int num)
> -{
> -    hwaddr base = virtio_mmio_memmap->base;
> -    hwaddr size = virtio_mmio_memmap->size;
> -    int i;
> -
> -    for (i = 0; i < num; i++) {
> -        uint32_t irq = mmio_irq + i;
> -        Aml *dev = aml_device("VR%02u", i);
> -        aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
> -        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> -        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -        Aml *crs = aml_resource_template();
> -        aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
> -        aml_append(crs,
> -                   aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
> -                                 AML_EXCLUSIVE, &irq, 1));
> -        aml_append(dev, aml_name_decl("_CRS", crs));
> -        aml_append(scope, dev);
> -        base += size;
> -    }
> -}
> -
>   static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>                                 uint32_t irq, VirtMachineState *vms)
>   {
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 7331248f59..01843e4509 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -97,22 +97,6 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>       }
>   }
>   
> -static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> -{
> -    Aml *dev = aml_device("FWCF");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> -
> -    /* device present, functioning, decoding, not shown in UI */
> -    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> -    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -    Aml *crs = aml_resource_template();
> -    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> -                                       fw_cfg_memmap->size, AML_READ_WRITE));
> -    aml_append(dev, aml_name_decl("_CRS", crs));
> -    aml_append(scope, dev);
> -}
> -
>   /* RHCT Node[N] starts at offset 56 */
>   #define RHCT_NODE_ARRAY_OFFSET 56
>   
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index d1fb08514b..c4a8967310 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -3,6 +3,7 @@
>   
>   #include "hw/acpi/acpi-defs.h"
>   #include "hw/acpi/bios-linker-loader.h"
> +#include "hw/nvram/fw_cfg.h"
>   
>   #define ACPI_BUILD_APPNAME6 "BOCHS "
>   #define ACPI_BUILD_APPNAME8 "BXPC    "
> @@ -497,4 +498,9 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>   
>   void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>                   const char *oem_id, const char *oem_table_id);
> +
> +void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap);
> +void acpi_dsdt_add_virtio(Aml *scope, const MemMapEntry *virtio_mmio_memmap,
> +                          uint32_t mmio_irq, int num);
> +
>   #endif
