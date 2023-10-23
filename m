Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1321051ejb;
        Mon, 23 Oct 2023 05:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPPqQhE7QPY7r7n0zpLdLzS6QuPpMaTnsyWJ9FHcVvR9H2McGonGVI9ARIPnGFa4pDWOIs
X-Received: by 2002:a05:6830:34a4:b0:6b9:a6ef:2709 with SMTP id c36-20020a05683034a400b006b9a6ef2709mr11486381otu.8.1698063806227;
        Mon, 23 Oct 2023 05:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698063806; cv=none;
        d=google.com; s=arc-20160816;
        b=hLh5JJGbssasqMxRejweFMPhf3EamFusqDVUX3fkWvehelnj0UqLZrOcE+NcPYgcCY
         xlWLmcFo/Mc1kYsl1Y3c6dMsaimdwyZi6mpPf73f4dpckqUbTbrozNmeTh17tr1ndJbK
         5HExybaIxsI8AGoTytDvgXsyla7w7p1NLRFDqsPgoLjbNfo5sawSDacsD+WqLJSCTRcQ
         CBMbCLvdApC8Uqzht2BvSJQTW/P+hfIbV48k3HFlvWIQwIOTYw7hyQoWKKuRyqCMrxeu
         VO3RpItHQprgNJsimZHb73OTVMJ0WUGUTRR1Osq6A5iCoC2f0Qaq6WaYzf9VcbyCByx+
         cbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=puFxVh/ZtdcJ4sXYQ8EaSuqCmvBIGtW72pjs81TIQ2U=;
        fh=Golw2Ah+zEhVCJQSdsZol3fNc1i7gYTinsck+6ubahE=;
        b=JttDs2ZZPIk+A7gh2ZBUpt8NbJp93xsnM/cA32WhNBzUZtf/zw6G2pq/LsntALBNAq
         KZ7h9WaIG8Pnrqqg3ebJ/P5y0sTVZZO0mJkN6OnL5eNoCYQ8ni+TvfWFN3VBYPsVqrY/
         Sd9ZArf8H/PFHr1UhO+BqdZm0Fni62LoxSroQnnL5tp56Wm+2RRtJBBZ/ilLV4l28BIh
         NZ3j0obuPzW+OKcGyv4zw3pMoZc/NhOzCGvFGHOeeaCr4X8uQjcma+YXLpWW9VBFFGJI
         V4qnVTYNxr2lk+7Pl71V0DIdPLd0JAKe1txLvSTRSkFZp+ZRRPTF2m6ZLgXdcMER4But
         /xMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="k/9YShkI";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020a0cb405000000b0065b10fcfba6si5524016qve.370.2023.10.23.05.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 05:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="k/9YShkI";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qutxS-0000hP-Lj; Mon, 23 Oct 2023 08:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qutxP-0000fn-2A
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 08:22:55 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qutxM-0006LF-Sf
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 08:22:54 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso473939166b.0
 for <qemu-devel@nongnu.org>; Mon, 23 Oct 2023 05:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698063771; x=1698668571; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=puFxVh/ZtdcJ4sXYQ8EaSuqCmvBIGtW72pjs81TIQ2U=;
 b=k/9YShkIOSRQxLk3rMvRciL/hIyRsVzLfEWe86ctZj25i+W1zXbJCfOxnE6ca9IJO/
 QAWdgeJDJrvEhui3HTGOhJtdctE3mNyrWeFLnJHRBDYBIM4VM1kr3vZEqEEyu0AK86vi
 L4DcVzEXYKiQRR5dFBbuGTt1MyRIn1nQ8Dp1p8CDKA0gnliXay/e34ALsoSvcmpDdxoi
 4kGr0NABF47kqvKQqzSsotD/pmpgPUYhT2QnjcKYdm/66pQIbuIvXeSLoMdXw38/NLXo
 kMe4kf5bhsXdrQm8slTiFRRW1vPqWi5ftYTpnVvZWOwl4Y+QBqhdgu//BS5lfrjPzl7Y
 Zk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698063771; x=1698668571;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puFxVh/ZtdcJ4sXYQ8EaSuqCmvBIGtW72pjs81TIQ2U=;
 b=liho0iu58EukWLk90fbrHD4z8REtuEowsiyoaa5AHX9jwK9IC3Ean91R0NSgr8gqSD
 eD1dbFEFIom0beSdsj2Y9lL76pg7V8gcIW1GH9H/AkAytqHITwoWtlWQjnpXg3Zq64eY
 lhswja1KICEPPZwVahzGwUP5nA+ayXvGp50t44Gyq+iFUwS0O9y7SOIH9+i2Yi+QXQmg
 Sp8g+1e9ogi+Hr4BgOVkf3F98UzwejxQhJQ3I6r3EkRsBOMgfbBN1dyQfM19SmaaQK2m
 BNDpjTqNd7L1jgbyHhPGbPcJ6rstPbfSYr1EybB49VE+aDdvasFhwMzYWQX2zFkkO5Sz
 QgLQ==
X-Gm-Message-State: AOJu0YwqHMab3PJXznCf6iVksTy7Ms5BGU5siQdD+fE8ngSsr4tZ/ptT
 Eo+9oedDV1Ue7grRXEoB/Sl1uw==
X-Received: by 2002:a17:907:980c:b0:9bd:a75a:5644 with SMTP id
 ji12-20020a170907980c00b009bda75a5644mr8085753ejc.16.1698063771041; 
 Mon, 23 Oct 2023 05:22:51 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 fx4-20020a170906b74400b009b9a1714524sm6658794ejb.12.2023.10.23.05.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 05:22:50 -0700 (PDT)
Date: Mon, 23 Oct 2023 14:22:49 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v3 01/12] hw/arm/virt-acpi-build.c: Migrate fw_cfg
 creation to common location
Message-ID: <20231023-5fcf9635262134fc5b1847cc@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-2-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-2-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Kvk2RcDlgnkY

On Thu, Oct 19, 2023 at 06:56:37PM +0530, Sunil V L wrote:
> RISC-V also needs to use the same code to create fw_cfg in DSDT. So, avoid
> code duplication by moving the code in arm and riscv to a device specific
> file.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/arm/virt-acpi-build.c       | 19 ++-----------------
>  hw/nvram/fw_cfg-acpi.c         | 17 +++++++++++++++++
>  hw/nvram/meson.build           |  1 +
>  hw/riscv/virt-acpi-build.c     | 19 ++-----------------
>  include/hw/nvram/fw_cfg_acpi.h |  9 +++++++++
>  5 files changed, 31 insertions(+), 34 deletions(-)
>  create mode 100644 hw/nvram/fw_cfg-acpi.c
>  create mode 100644 include/hw/nvram/fw_cfg_acpi.h
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6b674231c2..b8e725d953 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -35,7 +35,7 @@
>  #include "target/arm/cpu.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
> -#include "hw/nvram/fw_cfg.h"
> +#include "hw/nvram/fw_cfg_acpi.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
> @@ -94,21 +94,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>      aml_append(scope, dev);
>  }
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
>  static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
>  {
>      Aml *dev, *crs;
> @@ -864,7 +849,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      if (vmc->acpi_expose_flash) {
>          acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>      }
> -    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
> +    fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
>      acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
> diff --git a/hw/nvram/fw_cfg-acpi.c b/hw/nvram/fw_cfg-acpi.c
> new file mode 100644
> index 0000000000..4eeb81bc36
> --- /dev/null
> +++ b/hw/nvram/fw_cfg-acpi.c
> @@ -0,0 +1,17 @@

Should add an SPDX.

> +#include "hw/nvram/fw_cfg_acpi.h"
> +#include "hw/acpi/aml-build.h"
> +
> +void fw_cfg_acpi_dsdt_add(Aml *scope, const MemMapEntry *fw_cfg_memmap)
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
> diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
> index 75e415b1a0..4996c72456 100644
> --- a/hw/nvram/meson.build
> +++ b/hw/nvram/meson.build
> @@ -17,3 +17,4 @@ system_ss.add(when: 'CONFIG_XLNX_EFUSE_ZYNQMP', if_true: files(
>  system_ss.add(when: 'CONFIG_XLNX_BBRAM', if_true: files('xlnx-bbram.c'))
>  
>  specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_nvram.c'))
> +specific_ss.add(when: 'CONFIG_ACPI', if_true: files('fw_cfg-acpi.c'))
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 7331248f59..d8772c2821 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -28,6 +28,7 @@
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
> +#include "hw/nvram/fw_cfg_acpi.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/reset.h"
> @@ -97,22 +98,6 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
>      }
>  }
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
>  /* RHCT Node[N] starts at offset 56 */
>  #define RHCT_NODE_ARRAY_OFFSET 56
>  
> @@ -226,7 +211,7 @@ static void build_dsdt(GArray *table_data,
>      scope = aml_scope("\\_SB");
>      acpi_dsdt_add_cpus(scope, s);
>  
> -    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
> +    fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
>  
>      aml_append(dsdt, scope);
>  
> diff --git a/include/hw/nvram/fw_cfg_acpi.h b/include/hw/nvram/fw_cfg_acpi.h
> new file mode 100644
> index 0000000000..6e2c5f04b7
> --- /dev/null
> +++ b/include/hw/nvram/fw_cfg_acpi.h
> @@ -0,0 +1,9 @@

And an SPDX here too.

> +#ifndef FW_CFG_ACPI_H
> +#define FW_CFG_ACPI_H
> +
> +#include "qemu/osdep.h"
> +#include "exec/hwaddr.h"
> +
> +void fw_cfg_acpi_dsdt_add(Aml *scope, const MemMapEntry *fw_cfg_memmap);
> +
> +#endif
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
