Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1523477ejb;
        Sun, 23 Jul 2023 16:41:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEr24NGwwl6r2ooB9aloH0id1Ys1jWxdKhzeqflvUsVZVsfMqPVzRGGKjg6c5fpZz+/63FN
X-Received: by 2002:a05:620a:45a1:b0:767:596f:a9fb with SMTP id bp33-20020a05620a45a100b00767596fa9fbmr8415810qkb.15.1690155711030;
        Sun, 23 Jul 2023 16:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690155711; cv=none;
        d=google.com; s=arc-20160816;
        b=zZ1vx/cqbzDJ2iuAsciclqNuME9ZH3ySSOw3hcg3r0bAc5UqH+94kljlwaSSJD2fiy
         ylvlhBe86vDNJyzORFYuSfZllwrR5TRFTmk/poh+gTc2xmavFBHIIxaPiCs3Gm/6jA1U
         u22qbBW1vkc+q/51PH7fvZH9Cx2Nf1+58avx5vUK116wYDVnngl7FOTGUMVgYqdEwU+Q
         6iiWrhEYXQ5UnQBnrOTDu1g6SG3sC5mQUP374poGwG5cqc4zTKUST5KdhGw6nsQIk3jj
         /iuCgqO+2D9L7IOLo27Rltkwu0KjsqBfSUCIg53xNU6ga+kbVtwTYFFNajHj9FJt32UY
         jTnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2UXbCSiqPu9W6ZtO3z7yqITNJDYYwNIU0Bv/hiM65ew=;
        fh=t5P2QJgybaxZDuabJN4+EN00g1FWdT3a2w30ZXlVs9U=;
        b=Mh4gQbjRWdHyLCIQeVkgkeVpxpDUWelURMQN0bdBmTUqC+xiMDg9sVbsTefpWOfmc3
         7zNk1fyLQ/0jfI7VwArFZ4MNnu7IkNdBajiRAiDu8DBF1iJhpofbVNmb7L51KKNS2+i+
         C6pCpseLXsi8YvY7iwGTVIekt6s1W36ux49GIEPC1HPmkb6VT9Xav11gNrRTxR6QNAE/
         WkexlF8zs8qlG1l7ZybK2rV6v5jLSGw9V0CMwx0ZVtNGS4S1EtdGQMww886fn/b01+at
         BAFLzAsX5LEzaqVx0XsH2XgZIu0Foc2bO/lbWTnLlAyrr5qQcTPZVQFJQzi6bNKike5a
         NdYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="IhRw/3J/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05620a440300b007673e688d91si4440109qkp.237.2023.07.23.16.41.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jul 2023 16:41:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="IhRw/3J/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNihg-000339-Us; Sun, 23 Jul 2023 19:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNiha-00030o-Fq; Sun, 23 Jul 2023 19:41:27 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNihY-0000Y2-6v; Sun, 23 Jul 2023 19:41:25 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-799761430c2so911340241.2; 
 Sun, 23 Jul 2023 16:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690155682; x=1690760482;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2UXbCSiqPu9W6ZtO3z7yqITNJDYYwNIU0Bv/hiM65ew=;
 b=IhRw/3J/32TNtl5mLCoW8o9LqyVVcRXIGK5dWevR8quCWAbzIzopZ4XiAK8ClKqtay
 kvwbDz7RfMpDcKtI/I2shMsy8tYWfJwjCXh9iT5Y6qbe2CPvQebMgKC4fp9muDe4qC/p
 7GK7UcNSBEy0/RtODzQBgunIGK4tMcKGQAzxQOipac+qfZnQ8mWbQ03vKKM5IovzmVNe
 N/sFKR0iD4Dj+YpznpMg7tRp1GfQkUpTlZ+Rt/2KQbTQvolWPlRFOgy+hJeU/DOVYTrR
 PXK541B5LsvYKbLNz5IdMysOf4khjeSzeDcaUPfui/VuIS7LU4zp+78MxQVaA2TXXAqG
 kt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690155682; x=1690760482;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2UXbCSiqPu9W6ZtO3z7yqITNJDYYwNIU0Bv/hiM65ew=;
 b=DNLP5BNt1ge4Oiz+DBXsJ7rHFIrVYinCQ7HBOexpqOZNZKQX5m13AoXm0QCzxIGijt
 yk/rvXRQL4rpvAPUF1vwwY7snylqHf9SJinaQgpfyNioAF1yksro4iTU2BzE3kvJJ9nn
 roTBjkVb4il/DgWYLtG5yS2A4bkg+VqKvF4Wg9uhzF470aQ+UwlhALYa5keiLOWqM/zZ
 hJg963vAm4v21LWjJbUWZ8jb1NTuM9XczmFPN4F9B798s9XioL5OceYGVeG+MDHCGwog
 DjGyFrTrp4dcAOuP/s/uZVXmib6MspXEKxX8JFZN3OFnS+exjjje6xIRbsOHpwpII6WJ
 UXjA==
X-Gm-Message-State: ABy/qLaGVzULaGP9fB/eeM0iwIRJLhj2Oi2jLTt2YZYie72xMmMRBdQt
 btU8kOS8wo9peWomFOU9EIq8HLGEPqQBYsLPVYU=
X-Received: by 2002:a1f:60cf:0:b0:471:5427:39a5 with SMTP id
 u198-20020a1f60cf000000b00471542739a5mr3509379vkb.10.1690155682279; Sun, 23
 Jul 2023 16:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
 <20230712163943.98994-2-sunilvl@ventanamicro.com>
In-Reply-To: <20230712163943.98994-2-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 09:40:56 +1000
Message-ID: <CAKmqyKOiZhQz=vKnw0JcMJaMLsVfTWpKAJ5-F0=hKcUfOwEdgg@mail.gmail.com>
Subject: Re: [PATCH 01/10] hw/arm/virt-acpi-build.c: Move fw_cfg and virtio to
 common location
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: t6IqJXaDVY9S

On Thu, Jul 13, 2023 at 2:41=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> The functions which add fw_cfg and virtio to DSDT are same for ARM
> and RISC-V. So, instead of duplicating in RISC-V, move them from
> hw/arm/virt-acpi-build.c to common aml-build.c.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/acpi/aml-build.c         | 41 ++++++++++++++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c    | 42 -------------------------------------
>  hw/riscv/virt-acpi-build.c  | 16 --------------
>  include/hw/acpi/aml-build.h |  6 ++++++
>  4 files changed, 47 insertions(+), 58 deletions(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index ea331a20d1..eeb1263c8c 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2467,3 +2467,44 @@ Aml *aml_i2c_serial_bus_device(uint16_t address, c=
onst char *resource_source)
>
>      return var;
>  }
> +
> +void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
> +{
> +    Aml *dev =3D aml_device("FWCF");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> +    /* device present, functioning, decoding, not shown in UI */
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +    Aml *crs =3D aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> +                                       fw_cfg_memmap->size, AML_READ_WRI=
TE));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
> +void acpi_dsdt_add_virtio(Aml *scope,
> +                          const MemMapEntry *virtio_mmio_memmap,
> +                          uint32_t mmio_irq, int num)
> +{
> +    hwaddr base =3D virtio_mmio_memmap->base;
> +    hwaddr size =3D virtio_mmio_memmap->size;
> +    int i;
> +
> +    for (i =3D 0; i < num; i++) {
> +        uint32_t irq =3D mmio_irq + i;
> +        Aml *dev =3D aml_device("VR%02u", i);
> +        aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
> +        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> +        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +        Aml *crs =3D aml_resource_template();
> +        aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
> +        aml_append(crs,
> +                   aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIG=
H,
> +                                 AML_EXCLUSIVE, &irq, 1));
> +        aml_append(dev, aml_name_decl("_CRS", crs));
> +        aml_append(scope, dev);
> +        base +=3D size;
> +    }
> +}
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6b674231c2..fdedb68e2b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -35,7 +35,6 @@
>  #include "target/arm/cpu.h"
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/acpi.h"
> -#include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
> @@ -94,21 +93,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMa=
pEntry *uart_memmap,
>      aml_append(scope, dev);
>  }
>
> -static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_m=
emmap)
> -{
> -    Aml *dev =3D aml_device("FWCF");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> -    /* device present, functioning, decoding, not shown in UI */
> -    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> -    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -    Aml *crs =3D aml_resource_template();
> -    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> -                                       fw_cfg_memmap->size, AML_READ_WRI=
TE));
> -    aml_append(dev, aml_name_decl("_CRS", crs));
> -    aml_append(scope, dev);
> -}
> -
>  static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_mem=
map)
>  {
>      Aml *dev, *crs;
> @@ -133,32 +117,6 @@ static void acpi_dsdt_add_flash(Aml *scope, const Me=
mMapEntry *flash_memmap)
>      aml_append(scope, dev);
>  }
>
> -static void acpi_dsdt_add_virtio(Aml *scope,
> -                                 const MemMapEntry *virtio_mmio_memmap,
> -                                 uint32_t mmio_irq, int num)
> -{
> -    hwaddr base =3D virtio_mmio_memmap->base;
> -    hwaddr size =3D virtio_mmio_memmap->size;
> -    int i;
> -
> -    for (i =3D 0; i < num; i++) {
> -        uint32_t irq =3D mmio_irq + i;
> -        Aml *dev =3D aml_device("VR%02u", i);
> -        aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
> -        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> -        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -        Aml *crs =3D aml_resource_template();
> -        aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
> -        aml_append(crs,
> -                   aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIG=
H,
> -                                 AML_EXCLUSIVE, &irq, 1));
> -        aml_append(dev, aml_name_decl("_CRS", crs));
> -        aml_append(scope, dev);
> -        base +=3D size;
> -    }
> -}
> -
>  static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>                                uint32_t irq, VirtMachineState *vms)
>  {
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 7331248f59..01843e4509 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -97,22 +97,6 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtSt=
ate *s)
>      }
>  }
>
> -static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_m=
emmap)
> -{
> -    Aml *dev =3D aml_device("FWCF");
> -    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
> -
> -    /* device present, functioning, decoding, not shown in UI */
> -    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> -    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> -
> -    Aml *crs =3D aml_resource_template();
> -    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
> -                                       fw_cfg_memmap->size, AML_READ_WRI=
TE));
> -    aml_append(dev, aml_name_decl("_CRS", crs));
> -    aml_append(scope, dev);
> -}
> -
>  /* RHCT Node[N] starts at offset 56 */
>  #define RHCT_NODE_ARRAY_OFFSET 56
>
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index d1fb08514b..c4a8967310 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -3,6 +3,7 @@
>
>  #include "hw/acpi/acpi-defs.h"
>  #include "hw/acpi/bios-linker-loader.h"
> +#include "hw/nvram/fw_cfg.h"
>
>  #define ACPI_BUILD_APPNAME6 "BOCHS "
>  #define ACPI_BUILD_APPNAME8 "BXPC    "
> @@ -497,4 +498,9 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, cons=
t AcpiFadtData *f,
>
>  void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>                  const char *oem_id, const char *oem_table_id);
> +
> +void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap);
> +void acpi_dsdt_add_virtio(Aml *scope, const MemMapEntry *virtio_mmio_mem=
map,
> +                          uint32_t mmio_irq, int num);
> +
>  #endif
> --
> 2.39.2
>
>
