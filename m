Received: by 2002:a05:7022:12b:b0:6b:57c3:147a with SMTP id 43csp101156dlk;
        Wed, 6 Sep 2023 21:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc9Kn7VqVKQupwq3e7kjE+DmB3mmj18vpZHRKfCZgthFDOKkrDg2Fe6ipKMA1jQar/h33R
X-Received: by 2002:a05:622a:198c:b0:410:ab6d:54da with SMTP id u12-20020a05622a198c00b00410ab6d54damr24227656qtc.16.1694062357227;
        Wed, 06 Sep 2023 21:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694062357; cv=none;
        d=google.com; s=arc-20160816;
        b=vvq5EhoDqxpg5EhdWxQqkoSXw/cMPLzoI2oNsxRhhInU63xwdegn2SHDsHzPI++a+b
         0eI5DCrKULDcdZ9hFkIbQM4a+F/6/v67Ta2lftJTsg2tzfRFSfN+jC/EnJQLUXRMz0DM
         GdjdjGXi43e3yNRWOYQyLPzOl2tP4s7qGl3Hws7xGgoHrVpkD9BhhalBJaSNYkcajyNa
         CicnW7016cBbPE6wVxwDg871dR8wqVplMm2ZkJfzCvd51WW8OIucZk/QQriqwS8/X4ov
         fC5nSN1vKQkJGjiku7Kv7jXnArwaUwdHlSv45L6mkVVKBFe4V9WmaYMg20Aoe5jrr3vq
         XmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fkhYe6xW7dribpJqdVVxLg+UNNL+53kjlIuItC3qp4o=;
        fh=ozCzqmWEvo8XRa9DYBQKLbZKVm81dsprfoOFyfnZLqk=;
        b=Cb8V+colNOAVtUDCrQz5SQOvqw3z7V+ESysdOhuH/p97PVb7/bGH3MEXI55iTu9cQD
         ldr9KMWvlw54RrOONrM2XUjZXc1ekDHAs1NgUb9Ugu9xhNTGg5Jx/hFiydUDNapTs31U
         ajsXbfTVbkNGiGSzNNQdxrjQL1Ry02Q5OiUQkerEa2+ueTvCnzwAHdQl0Ck03X88UevQ
         L741z0HD2APTJCxvtHkkFRHbObX/o4JLrIEgFSs5uG5TR2/10L77KdawoJi6/CuDoDnn
         No6K8GW+21V+zz/nujF2twNbu+dwfsuCtUSHJEVIDfPArOtZnEDDFelc5o/4GxJNvpRo
         0AuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=QqUe0Yqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05622a04c600b00403b0036414si10540078qtx.807.2023.09.06.21.52.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 21:52:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=QqUe0Yqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qe70J-0008QC-Mh; Thu, 07 Sep 2023 00:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe70E-0008Pl-Bf; Thu, 07 Sep 2023 00:52:27 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe70B-0000DF-KH; Thu, 07 Sep 2023 00:52:26 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-76d846a4b85so183896241.1; 
 Wed, 06 Sep 2023 21:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694062341; x=1694667141; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fkhYe6xW7dribpJqdVVxLg+UNNL+53kjlIuItC3qp4o=;
 b=QqUe0YqrSV+MHfhttU1Ck2bhnFk72HqnQ8QJS05Q2a3S85DedOHNx24M5q3EvywtcW
 t5var5aRew7McrHlESzQsss2DB4rqocZIDL9rz4GxPwrUKgWhLL+fJJKHCv17cuArQP1
 3e9FVRMeDj4+Qp0UHfrvqZSR/2hbl9bG//3tdyjVvFhnwBSJfuUoD/vscOBNgBlq9fjA
 j4Qo+8dctnHxz8CR6DwIYA9nPqwXfGF+r16s0HTE/p2GHbn39Q7MjIYPkq1YveY+hIg0
 +CRSpD6ePpirv9PqS3GHegtmj1yulrhPMkrcBAT7dKAK5ZaA6lyqx/Z+21u37fjGsK3E
 j0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694062341; x=1694667141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fkhYe6xW7dribpJqdVVxLg+UNNL+53kjlIuItC3qp4o=;
 b=Cp2X7Xx15y9EE2i6kVU5OMdBOrATn5TUkYVSALSgzPcmiuGlJYWtHvL28aHkl5vMmt
 E35LWRHFJUP0pvPtdIwUGjnIh8spiylFJpl+W7yslWlqrFQL+AsMBR3wpZ7+oh9VZTMX
 kSdXI/Z6OZO5wL2mz+by10PF/d0jLaLzdLTYUGk9LxMqRQp6/EQ+p1jxT8LHTvL9MIf8
 5Qf30tBePEnJdBOz2WeQuHx/CwA2uJ2+mLlxt2hEPNFRtM42cqYQvICgmHF354oi9dBp
 GkCkA9NSDgopCEBWv4ulSjnSs7/u8BGUzkQMmrntaCPI7LH7yAS0zSwnlnX+5R0VUdzR
 mkAw==
X-Gm-Message-State: AOJu0YyJKHBiIOoZWlhB6e/ik6M22kpCkcbE0G01huLQ6rBgE5oAbuEN
 vHjInSUi4f7SocUi3eFaWJ1mkY3E7BqUq+iue5A=
X-Received: by 2002:a05:6102:156:b0:44e:d6c3:51d6 with SMTP id
 a22-20020a056102015600b0044ed6c351d6mr4676251vsr.14.1694062341638; Wed, 06
 Sep 2023 21:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
 <20230824142942.3983650-3-sunilvl@ventanamicro.com>
In-Reply-To: <20230824142942.3983650-3-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 14:51:54 +1000
Message-ID: <CAKmqyKNqLCvtB2hdqhsigBnoDbG4c=rjP3+6t7j5F9G2j1WAeg@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] hw/arm/virt-acpi-build.c: Migrate virtio
 creation to common location
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 1ayRCSsh5gjP

On Fri, Aug 25, 2023 at 12:31=E2=80=AFAM Sunil V L <sunilvl@ventanamicro.co=
m> wrote:
>
> RISC-V also needs to create the virtio in DSDT in the same way as ARM. So=
,
> instead of duplicating the code, move this function to the device specifi=
c
> file which is common across architectures.
>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/virt-acpi-build.c        | 29 ++---------------------------
>  hw/virtio/meson.build           |  1 +
>  hw/virtio/virtio-acpi.c         | 28 ++++++++++++++++++++++++++++
>  include/hw/virtio/virtio-acpi.h | 11 +++++++++++
>  4 files changed, 42 insertions(+), 27 deletions(-)
>  create mode 100644 hw/virtio/virtio-acpi.c
>  create mode 100644 include/hw/virtio/virtio-acpi.h
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b8e725d953..69733f6663 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -58,6 +58,7 @@
>  #include "migration/vmstate.h"
>  #include "hw/acpi/ghes.h"
>  #include "hw/acpi/viot.h"
> +#include "hw/virtio/virtio-acpi.h"
>
>  #define ARM_SPI_BASE 32
>
> @@ -118,32 +119,6 @@ static void acpi_dsdt_add_flash(Aml *scope, const Me=
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
> @@ -850,7 +825,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
>          acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
>      }
>      fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
> -    acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> +    virtio_acpi_dsdt_add(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANS=
PORTS);
>      acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, v=
ms);
>      if (vms->acpi_dev) {
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 13e7c6c272..3ae1242bcf 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -75,3 +75,4 @@ system_ss.add(when: 'CONFIG_ALL', if_true: files('virti=
o-stub.c'))
>  system_ss.add(files('virtio-hmp-cmds.c'))
>
>  specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: specific_virtio_ss)
> +system_ss.add(when: 'CONFIG_ACPI', if_true: files('virtio-acpi.c'))
> diff --git a/hw/virtio/virtio-acpi.c b/hw/virtio/virtio-acpi.c
> new file mode 100644
> index 0000000000..977499defd
> --- /dev/null
> +++ b/hw/virtio/virtio-acpi.c
> @@ -0,0 +1,28 @@
> +#include "hw/virtio/virtio-acpi.h"
> +#include "hw/acpi/aml-build.h"
> +
> +void virtio_acpi_dsdt_add(Aml *scope,
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
> diff --git a/include/hw/virtio/virtio-acpi.h b/include/hw/virtio/virtio-a=
cpi.h
> new file mode 100644
> index 0000000000..b8687b1b42
> --- /dev/null
> +++ b/include/hw/virtio/virtio-acpi.h
> @@ -0,0 +1,11 @@
> +#ifndef VIRTIO_ACPI_H
> +#define VIRTIO_ACPI_H
> +
> +#include "qemu/osdep.h"
> +#include "exec/hwaddr.h"
> +
> +void virtio_acpi_dsdt_add(Aml *scope, const MemMapEntry *virtio_mmio_mem=
map,
> +                          uint32_t mmio_irq, int num);
> +
> +#endif
> +
> --
> 2.39.2
>
>
