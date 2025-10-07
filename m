Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C45DCCA476
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 13:12:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v67UU-0006wq-0l; Tue, 07 Oct 2025 09:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1v67US-0006w2-Dj
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 09:12:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1v67UE-0002XM-Ry
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 09:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759842726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XlaXJ+9IXOJ/jK+m5vTCfGHWuwuUqatOTwrroHpPze0=;
 b=AXt4x38RzT+0TrEGysVMTh3L54eFo3UQV4MdWe+NYShAKej2tomjkGBsP+KiTiss51CMuX
 Z6X3SwAJLYT9DEwt7x5Mx0jGIsLEznhT4n8woa0EQf5KL5ujFxpK9rz3ziZiyzfXG4aoCy
 1j9ffwdCqqACaPIAFJyunibkR97+VVI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-789XIv04PJ-xvxCgDT84mw-1; Tue, 07 Oct 2025 09:12:05 -0400
X-MC-Unique: 789XIv04PJ-xvxCgDT84mw-1
X-Mimecast-MFC-AGG-ID: 789XIv04PJ-xvxCgDT84mw_1759842724
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-401dbafbcfaso3815693f8f.1
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 06:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759842724; x=1760447524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XlaXJ+9IXOJ/jK+m5vTCfGHWuwuUqatOTwrroHpPze0=;
 b=c4BWwASnPm4wgJCDOiKy9Qzygt3DslT2IYh2aALZqhwxQ7xieZGf64Vnz9Mgrz/eb6
 B9P+cHJXPF1PLBkJsgi89MyxGFXULr9zLQEWaAK4fVqvPoWfbFx5kRMEi3/wizFbDrnb
 IpvvoV0JfO5n7wI76tgmq7Eq2pncJifgNX1Mhp029zz/QCUtfyemn1a+Hsf/mVt+dwl8
 535XsEHzUIDLN8dCfmHOAQn4I1Ey8kVa34w7+K8zbPHwjOYCDQvoQLuBlvX1b5Rb7FeF
 THhMmh8itB0E9lPamfVuTGLmQu8te0fKEKu+2N0Ji1NkS8MjWetd+QgJkmPfM0xPfe0M
 VPlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW02m59ORJdRIK9XlQoDyuGVoh7VYKFP9kd/vpexHogx5giGvaQrAlub2ibMjix+94fgk5EYDf7Iw==@nongnu.org
X-Gm-Message-State: AOJu0YzdEuF+FWkdtrr6krla2lwh3RvRb8EWF15q+yDBAyucOENgW036
 oCbrkeehIUidMx2MghZr5o7MraahYzJpdtVVJqhcKMBbf7eITNO1oY6Jvpj6l6F7zFL0PjpmfvL
 IfSwKxUVtQ2kBLOUDRovtsCz1USrb2Srm41LaNSr4FLuQHdd2H9N73w==
X-Gm-Gg: ASbGncv8knoVKAyVvg/HfG3AUm3Kmm7my7EHgUa/GWJDo3qPL1MQyncycw+A879AKw6
 gmlfGB9h5b4HENUxcecJ0Z8WYIxYsj8Cl9zV2FUGmlC0qkuLb4wKe3Jiiy7k2J6Thqgrj8LXvfJ
 iQbnA5DpgTmRwmWYfX/4rESoF/ot0Het9Mk4zeu19jWd+xXCExQuYuaj+2vQaPh8PojGqqKQY3x
 YPaf5NLfKp6YaCRdoAp/haTSfRmWYvIBg3pOtOTaW3FIEZOKZL+eZTQ7IwYFWEO2doDCZ7ldj+p
 lNdQfYJ9y1e2WNGzm6Rxl94iXfem4KbvDV3W
X-Received: by 2002:a5d:588d:0:b0:410:3a4f:1298 with SMTP id
 ffacd0b85a97d-4256714d018mr11824140f8f.15.1759842724382; 
 Tue, 07 Oct 2025 06:12:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT7tdOb3f7jG19ZBDrImwLtnWHUbAeRUbWk2BcC92rUoxdRTRiqP6oot8pZjHCQhcH7rexKA==
X-Received: by 2002:a5d:588d:0:b0:410:3a4f:1298 with SMTP id
 ffacd0b85a97d-4256714d018mr11824111f8f.15.1759842723902; 
 Tue, 07 Oct 2025 06:12:03 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6b40sm25522990f8f.2.2025.10.07.06.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 06:12:03 -0700 (PDT)
Date: Tue, 7 Oct 2025 15:11:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Alexander Gryanko <xpahos@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/arm: add pvpanic mmio device for arm
Message-ID: <20251007151157.5a601c3e@fedora>
In-Reply-To: <CC5A0011-CD14-40F9-8023-8BF5F989BCCF@gmail.com>
References: <CC5A0011-CD14-40F9-8023-8BF5F989BCCF@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L44Z6KNAVBvGap7O5amYy0L-oURUMY86UE4ICBnH76c_1759842724
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.422,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 4 Oct 2025 23:19:09 +0300
Alexander Gryanko <xpahos@gmail.com> wrote:

> Currently, pvpanic is available in three device types: ISA,
> MMIO, and PCI. For early stages of system initialisation
> before PCI enumeration, only ISA and MMIO are suitable.
> ISA is specific to the x86 platform; only MMIO devices
> can be used for ARM. It is not possible to specify a
> device as on the x86 platform (-device pvpanic); the

perhaps ARM folsk know better, don't we have some
user create-able sysbus devices? Can it be implemented
as such, so we would avoid creating built-in device?

> only possible way is to add an MMIO device to the dtb,
> which can be implemented by manually adding new functions
> to the QEMU code, as was done in the VMApple implementation.
> 
> Signed-off-by: Alexander Gryanko <xpahos@gmail.com>
> ---
> hw/arm/virt.c         | 25 +++++++++++++++++++++++++
> include/hw/arm/virt.h |  1 +
> 2 files changed, 26 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 02209fadcf..1059584b67 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -39,6 +39,7 @@
> #include "hw/arm/virt.h"
> #include "hw/block/flash.h"
> #include "hw/display/ramfb.h"
> +#include "hw/misc/pvpanic.h"
> #include "net/net.h"
> #include "system/device_tree.h"
> #include "system/numa.h"
> @@ -182,6 +183,7 @@ static const MemMapEntry base_memmap[] = {
>     [VIRT_UART0] =              { 0x09000000, 0x00001000 },
>     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
>     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
> +    [VIRT_PVPANIC] =            { 0x09021000, 0x00000002 },
>     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>     [VIRT_UART1] =              { 0x09040000, 0x00001000 },
>     [VIRT_SMMU] =               { 0x09050000, SMMU_IO_LEN },
> @@ -276,6 +278,27 @@ static bool ns_el2_virt_timer_present(void)
>         arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu);
> }
> 
> +static void create_pvpanic(VirtMachineState *vms)
> +{
> +    char *nodename;
> +    MachineState *ms = MACHINE(vms);
> +    DeviceState *dev = qdev_new(TYPE_PVPANIC_MMIO_DEVICE);
> +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> +
> +    hwaddr base = vms->memmap[VIRT_PVPANIC].base;
> +    hwaddr size = vms->memmap[VIRT_PVPANIC].size;
> +
> +    sysbus_realize_and_unref(s, &error_fatal);
> +    sysbus_mmio_map(s, 0, base);
> +
> +    nodename = g_strdup_printf("/pvpanic@%" PRIx64, base);
> +    qemu_fdt_add_subnode(ms->fdt, nodename);
> +    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
> +                            "qemu,pvpanic-mmio");
> +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +}
> +
> static void create_fdt(VirtMachineState *vms)
> {
>     MachineState *ms = MACHINE(vms);
> @@ -2498,6 +2521,8 @@ static void machvirt_init(MachineState *machine)
>     create_pcie(vms);
>     create_cxl_host_reg_region(vms);
> 
> +    create_pvpanic(vms);

given that virt is versioned machine type,
we probably need a compat knob to disable it's creation on old machine types

> +
>     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>         vms->acpi_dev = create_acpi_ged(vms);
>     } else {
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index ea2cff05b0..39bf07c9c1 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -81,6 +81,7 @@ enum {
>     VIRT_NVDIMM_ACPI,
>     VIRT_PVTIME,
>     VIRT_ACPI_PCIHP,
> +    VIRT_PVPANIC,
>     VIRT_LOWMEMMAP_LAST,
> };
> 
> 
> ---
> base-commit: bd6aa0d1e59d71218c3eee055bc8d222c6e1a628
> change-id: 20251004-arm-pvpanic-84a7d7b67d8d
> 
> Best regards,


