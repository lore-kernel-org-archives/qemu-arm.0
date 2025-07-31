Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16477C87FCC
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 09:44:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhPpB-0006zy-9O; Thu, 31 Jul 2025 05:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uhPow-0006vQ-RF
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 05:43:31 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uhPot-0007Uy-6l
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 05:43:30 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5ebbso1154344a12.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753955003; x=1754559803; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4r7fBFFAPU9+wgELKiCRDK98ek8n9EolaUtuGGgJ4ro=;
 b=RqvtP7g+/6GhOMv9jrOxajmXxJMtQ0KdjkilPgwdciyOrzpMYFSoDUtyf/N5eKvKW4
 RYnQjJavK0yBZ0Aww1/2msB1T0x21/R5Skiteb9Gaepg2OFVF1ZBH1SNccjOrj05PiEq
 fN2gvKLvYuFhIw+862rxxsgCJaChdbdBChfshXJckhiatRM8kBgukFr7TOe3mzUwmQ4K
 7Yn82PcuDlEgf0xsq6P6/gSxeXAf9NtP0L6hzSj1bXpnilV8N3nw7F0Tudy+85DopvqU
 JaGyS4xSHOEDO4tbb1+up0bds01GRG8cw87zii/DXshyrML9+AbKU7fcs4JerLPxxIsU
 Dtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753955003; x=1754559803;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4r7fBFFAPU9+wgELKiCRDK98ek8n9EolaUtuGGgJ4ro=;
 b=lmiUiVg5P4Cas6Bf7FLgLVjhfaDVdx49dG7778MpiTx+awLf+VYNFoqq6I2e8syAgS
 px98/+OkGlxik2E026EGPxwkZdzMC3XiGDu1vdChsLPnFAQm8m4EhV3jFSKzgzFknUB5
 1d/wub/Lbi8R4SnfWjQnNQYS9p+XUs/7Edaw+bGaCAVgdFnqQsd8YIbkYwJ8kdTc5JDq
 wTqODV2XxBc4w7rRsefx/ki0y5UQ9r8Eu5e+J78sD8vX7N9qircm//j0ipex75yjSENF
 A2uJ1qi+qNAPsVu88CTHCUtL5rEUxGP+kcw/Q1f2d8ImcWTpF+tck+4Cm6O8JR6hjXSe
 llJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk74Px0iPXfE+fhsJtb7o5Wc0E7Qf9sDhvL94ouCgyBnb8RSoLQorOgvXGXEoBcidMqeg5NphoMQ==@nongnu.org
X-Gm-Message-State: AOJu0YzAWi4tGIr0tUX1q/13OnGBNDhLKxi+CWhQUNe1Jq2z73R9BAVV
 c0Aovp2RHQshHqxAJhg3xZW3FsT3Foku2COMeKHPBnsSWqtKV25Ku9jimPbiAeqNiuhxB3Z/N4F
 cVPdRw9IVVYmcNL7JmRvLx+jQddoTLy/IqLY/jyLyAw==
X-Gm-Gg: ASbGncu75JEfUbVpJCWVCHl8cq4Q6+QqX7VmdbwL7v0wWcyPbVvSxsJTDTYbKfXaAWT
 wkeLva25Di9rsA3EzG+45A8Z4uSPU/EPK9xSi/bK2ZiZ/jRWTlBK+m+yk1PXR+esYD3oWZXGnDW
 8wCsatK/7V56fgq69HohcLg3AsWKCkFf0C6CzKG9PCaiCZxjgR/BZhhJB8lc+kfE2BMDQgpu0H2
 EMSsO0=
X-Google-Smtp-Source: AGHT+IEgf+HwWChWGy4rx5iobOY9vlML/LyDS5ZDMfSpC0go6I9FV45FHht6IxxojCJRsmXJvY6BiTzF3GMpoOH4R/k=
X-Received: by 2002:a05:6402:1c88:b0:615:25e7:9783 with SMTP id
 4fb4d7f45d1cf-61586f02e9bmr4782301a12.12.1753955003364; Thu, 31 Jul 2025
 02:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250730-nvdimm_arm64_virt-v1-1-f843596ab995@linaro.org>
 <6dcd45eb-8189-4492-ba05-d36c743ee7b2@linaro.org>
In-Reply-To: <6dcd45eb-8189-4492-ba05-d36c743ee7b2@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 31 Jul 2025 12:42:57 +0300
X-Gm-Features: Ac12FXx4bZO9LT801ipr2gelYd6ONHsxS1bMrlpK7EOkbBvhihF-Kfsg8-UusKs
Message-ID: <CAAjaMXbp+m30ryQweqsxEV2cKcsgoNT9qkGQpzATgL25mdR-gQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add static NVDIMMs in device tree
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, 
 Gustavo Romero <gustavo.romero@linaro.org>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Jul 31, 2025 at 11:38=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Manos,
>
> On 30/7/25 14:21, Manos Pitsidianakis wrote:
> > NVDIMM is used for fast rootfs with EROFS, for example by kata
> > containers. To allow booting with static NVDIMM memory, add them to the
> > device tree in arm virt machine.
> >
> > This allows users to boot directly with nvdimm memory devices without
> > having to rely on ACPI and hotplug.
> >
> > Verified to work with command invocation:
> >
> > ./qemu-system-aarch64 \
> >    -M virt,nvdimm=3Don \
> >    -cpu cortex-a57 \
> >    -m 4G,slots=3D2,maxmem=3D8G \
> >    -object memory-backend-file,id=3Dmem1,share=3Don,mem-path=3D/tmp/nvd=
imm,size=3D4G,readonly=3Doff \
> >    -device nvdimm,id=3Dnvdimm1,memdev=3Dmem1,unarmed=3Doff \
> >    -drive file=3D./debian-12-nocloud-arm64-commited.qcow2,format=3Dqcow=
2 \
> >    -kernel ./vmlinuz-6.1.0-13-arm64 \
> >    -append "root=3D/dev/vda1 console=3DttyAMA0,115200 acpi=3Doff"
> >    -initrd ./initrd.img-6.1.0-13-arm64 \
> >    -nographic \
> >    -serial mon:stdio
>

Hi Philippe,

> Should we add a functional test covering this non-ACPI case?

Sure, if the patch makes sense to people who know more about how
hotplug works (I don't know much) and can be merged in the first
place. If it does, I can add a subtest in e.g.
tests/functional/test_aarch64_virt.py as a separate patch.

>
> >
> > Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> > ---
> >   hw/arm/boot.c | 39 +++++++++++++++++++++++++++++++++++++++
> >   hw/arm/virt.c |  8 +++++---
> >   2 files changed, 44 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index d391cd01bb1b92ff213e69b84e5a69413b36c4f8..a0c1bcdf946ca98bb5da63f=
1a518018eb578dd81 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -25,6 +25,7 @@
> >   #include "hw/boards.h"
> >   #include "system/reset.h"
> >   #include "hw/loader.h"
> > +#include "hw/mem/memory-device.h"
> >   #include "elf.h"
> >   #include "system/device_tree.h"
> >   #include "qemu/config-file.h"
> > @@ -515,6 +516,26 @@ static void fdt_add_psci_node(void *fdt, ARMCPU *a=
rmcpu)
> >       qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
> >   }
> >
> > +static int fdt_add_pmem_node(void *fdt, uint32_t acells, uint32_t scel=
ls,
> > +                             int64_t mem_base, int64_t size, int64_t n=
ode)
> > +{
> > +    int ret;
> > +
> > +    g_autofree char *nodename =3D g_strdup_printf("/pmem@%" PRIx64, me=
m_base);
> > +
> > +    qemu_fdt_add_subnode(fdt, nodename);
> > +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "pmem-region"=
);
> > +    ret =3D qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells,
> > +                                       mem_base, scells, size);
> > +    /* only set the NUMA ID if it is specified */
> > +    if (!ret && node >=3D 0) {
> > +        ret =3D qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id",
> > +                                    node);
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> >   int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
> >                    hwaddr addr_limit, AddressSpace *as, MachineState *m=
s,
> >                    ARMCPU *cpu)
> > @@ -525,6 +546,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot=
_info *binfo,
> >       unsigned int i;
> >       hwaddr mem_base, mem_len;
> >       char **node_path;
> > +    g_autofree MemoryDeviceInfoList *md_list =3D NULL;
> >       Error *err =3D NULL;
> >
> >       if (binfo->dtb_filename) {
> > @@ -628,6 +650,23 @@ int arm_load_dtb(hwaddr addr, const struct arm_boo=
t_info *binfo,
> >           }
> >       }
> >
> > +    md_list =3D qmp_memory_device_list();
> > +    for (MemoryDeviceInfoList *m =3D md_list; m !=3D NULL; m =3D m->ne=
xt) {
> > +        MemoryDeviceInfo *mi =3D m->value;
> > +
> > +        if (mi->type =3D=3D MEMORY_DEVICE_INFO_KIND_NVDIMM) {
> > +            PCDIMMDeviceInfo *di =3D mi->u.nvdimm.data;
> > +
> > +            rc =3D fdt_add_pmem_node(fdt, acells, scells,
> > +                                   di->addr, di->size, di->node);
> > +            if (rc < 0) {
> > +                fprintf(stderr, "couldn't add NVDIMM /pmem@%"PRIx64" n=
ode\n",
> > +                        di->addr);
> > +                goto fail;
> > +            }
> > +        }
> > +    }
> > +
> >       rc =3D fdt_path_offset(fdt, "/chosen");
> >       if (rc < 0) {
> >           qemu_fdt_add_subnode(fdt, "/chosen");
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index ef6be3660f5fb38da84235c32dc2d13a5c61889c..910f5bb5f66ee217a9140f9=
128804a5b9f69b5b6 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2917,7 +2917,7 @@ static void virt_memory_pre_plug(HotplugHandler *=
hotplug_dev, DeviceState *dev,
> >       const MachineState *ms =3D MACHINE(hotplug_dev);
> >       const bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NV=
DIMM);
> >
> > -    if (!vms->acpi_dev) {
> > +    if (!vms->acpi_dev && !(is_nvdimm && !dev->hotplugged)) {
> >           error_setg(errp,
> >                      "memory hotplug is not enabled: missing acpi-ged d=
evice");
> >           return;
> > @@ -2949,8 +2949,10 @@ static void virt_memory_plug(HotplugHandler *hot=
plug_dev,
> >           nvdimm_plug(ms->nvdimms_state);
> >       }
> >
> > -    hotplug_handler_plug(HOTPLUG_HANDLER(vms->acpi_dev),
> > -                         dev, &error_abort);
> > +    if (vms->acpi_dev) {
> > +        hotplug_handler_plug(HOTPLUG_HANDLER(vms->acpi_dev),
> > +                             dev, &error_abort);
> > +    }
> >   }
> >
> >   static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_d=
ev,
> >
> > ---
> > base-commit: 9b80226ece693197af8a981b424391b68b5bc38e
> > change-id: 20250730-nvdimm_arm64_virt-931a764bbe0c
> >
> > --
> > =CE=B3=CE=B1=E1=BF=96=CE=B1 =CF=80=CF=85=CF=81=CE=AF =CE=BC=CE=B9=CF=87=
=CE=B8=CE=AE=CF=84=CF=89
> >
> >
>

