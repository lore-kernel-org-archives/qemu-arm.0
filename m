Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADCBD65C5A
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:56:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVswR-0006Xt-At; Wed, 17 Dec 2025 09:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vVswM-0006Wv-N4
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vVswF-0003Ir-21
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765983338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qa8IITZlaeTTXGKMqJ9D25f5iWMHIF1/vCH/gsEJuc=;
 b=RzNRyMi6IspkY3VvhlK9MmaHoumT3elmTy+o563ECceGy6iYSYN7mG94dwtfxsnN4wmQ64
 SjPyUcktGGn9xc/ZuW25OiQ/Q7M4OB32/IFIIdJlopJ5yMhfPV/OXdDhPWzKRvy4VZDq4i
 BYJQXyQES9zMc82Wl4LPyDad85mnMc0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-57SRn3ukMIeY_7uBOtdssw-1; Wed, 17 Dec 2025 09:55:36 -0500
X-MC-Unique: 57SRn3ukMIeY_7uBOtdssw-1
X-Mimecast-MFC-AGG-ID: 57SRn3ukMIeY_7uBOtdssw_1765983335
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477c49f273fso73507935e9.3
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765983335; x=1766588135;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hmf5VC+b3x+LaGkm+jOlklLFunTAIeNMxOXVsFoA2R4=;
 b=hvfBmlvAAM+5I21BQXdAUMqWNorQxKsR0NmN3WsX8/RHi0kttO7OhdZitDJi4AWn+e
 UmApdHYZSSxvTRWgidHGja0FXGH1Emo4hlyUz955gkUn+/6SAl/UqKvgdBURPwgE4hA6
 /W3tDl8c5nk5N25n19/2duPZRzlGdlsygiaSlIlRILYp2wMXseSBH2YarG0X0UtYm+/u
 XRJHk3I36GZELMGiGEFzVN4pHMlON1N3MkhJCMkC2o+nSbnxvySZIke6KoqFu+GS23ou
 63lhQluBcAMt2BL83RBpPUu6DuqLoUJEDsGer7u16W0PK72Awdgg/ieLnSTNtROYJ/uc
 rLjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEOj5bxcEpsyaYXBsRPnwuItP/LvsIr58A544+rTOAZGnm+jFCFswJgsEoZWb7itRaIAQSne4GRA==@nongnu.org
X-Gm-Message-State: AOJu0YzAt0ZkHcRGjJJD5nCcB0KlC6MiHIQX7DNT2pPsDM6wZGZlrZ3x
 5+EvfTrwGOAvZtyjFrhRt9QTkl2ir2mghAddRRiG9r/vpuHepRvZCQsNDOl3jvLTgDcbYWEAl45
 QHqGbx1pHNZY+tkl47AcW0VVvLaTMmLbz+WomSSngmh8KKhNQx5w+Aw==
X-Gm-Gg: AY/fxX5lstdu7qtbLuoGwY5StuR2rggWw1QjZ+sRefGqRKYsJb+3zRFT/QZsnEiHgrU
 RjkXhJUPx2Q9iJKARSolrj3vhqyrTKWBCOkIZlYu/RUjizBpr5byqx/8GtEY3NJ2mxxpXtY470g
 BCr0JzxdaLV3HhnXdeVaC+s7OHWHpKiraNAZLfQEfqhKIHJ+21p3zER4pLsSk7ZWNL4BafiuJM1
 GnBCW4bk7KT+jJ9WDNf2wBswE7g+jH6hwhz4SV6wPX2lL2E8YfRxzdmnwhIyGUyO1Hi7Azt6ogk
 UdhSx/VKch8MI8vdjU+u1lTtxGk5tcuMau7QQqjChDIYFUANKhC6UiYAy8zaRsPCqSLyaA==
X-Received: by 2002:a05:600c:528a:b0:47b:d949:9ba9 with SMTP id
 5b1f17b1804b1-47bd9499cf6mr51863245e9.13.1765983334936; 
 Wed, 17 Dec 2025 06:55:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCgPp3Zk8qHTNA+WDCbAp3YDWWtS6/6R+MJ8UYvQwsCNZi3scFHvl7ITonyEAWnlTi/e7hIQ==
X-Received: by 2002:a05:600c:528a:b0:47b:d949:9ba9 with SMTP id
 5b1f17b1804b1-47bd9499cf6mr51862785e9.13.1765983334482; 
 Wed, 17 Dec 2025 06:55:34 -0800 (PST)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4310ade7c4asm5149594f8f.28.2025.12.17.06.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 06:55:34 -0800 (PST)
Date: Wed, 17 Dec 2025 15:55:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas
 Huth <thuth@redhat.com>, qemu-devel@nongnu.org, devel@lists.libvirt.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Richard
 Henderson <richard.henderson@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>, Eduardo
 Habkost <eduardo@habkost.net>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Weiwei Li <liwei1518@gmail.com>, Amit Shah
 <amit@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, Yanan Wang
 <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>, Palmer Dabbelt
 <palmer@dabbelt.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Ani Sinha <anisinha@redhat.com>, Fabiano Rosas
 <farosas@suse.de>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Huacai
 Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>, Mark
 Cave-Ayland <mark.caveayland@nutanix.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Peter Krempa <pkrempa@redhat.com>, Jiri Denemark
 <jdenemar@redhat.com>
Subject: Re: [PATCH v5 16/28] hw/i386: Remove linuxboot.bin
Message-ID: <20251217155530.3353e904@imammedo>
In-Reply-To: <20251202162835.3227894-17-zhao1.liu@intel.com>
References: <20251202162835.3227894-1-zhao1.liu@intel.com>
 <20251202162835.3227894-17-zhao1.liu@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5LJfXLaBkaGWzAchit1dLKrmP9BXONWX4d0xQhajzrg_1765983335
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 LOTS_OF_MONEY=0.001, MONEY_NOHTML=0.069, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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

On Wed,  3 Dec 2025 00:28:23 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20
> All machines now use the linuxboot_dma.bin binary, so it's safe to
> remove the non-DMA version (linuxboot.bin).

after applying this patch:

git grep linuxboot.bin

    option_rom[nb_option_roms].bootindex =3D 0;                            =
       =20
    option_rom[nb_option_roms].name =3D "linuxboot.bin";                   =
       =20
    if (fw_cfg_dma_enabled(fw_cfg)) {                                      =
     =20
        option_rom[nb_option_roms].name =3D "linuxboot_dma.bin";           =
       =20
    }       =20

perhaps it should be fixed in previous patch

>=20
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Changes since v4:
>  * Update commit message: not only pc, but also microvm enables
>    DMA for FwCfgState (in microvm_memory_init).
> ---
>  hw/i386/pc.c                  |   3 +-
>  pc-bios/meson.build           |   1 -
>  pc-bios/optionrom/Makefile    |   2 +-
>  pc-bios/optionrom/linuxboot.S | 195 ----------------------------------
>  4 files changed, 2 insertions(+), 199 deletions(-)
>  delete mode 100644 pc-bios/optionrom/linuxboot.S
>=20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 9d88d4a5207a..2e315414aeaf 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -666,8 +666,7 @@ void xen_load_linux(PCMachineState *pcms)
> =20
>      x86_load_linux(x86ms, fw_cfg, PC_FW_DATA, pcmc->pvh_enabled);
>      for (i =3D 0; i < nb_option_roms; i++) {
> -        assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
> -               !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
> +        assert(!strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
>                 !strcmp(option_rom[i].name, "pvh.bin") ||
>                 !strcmp(option_rom[i].name, "multiboot_dma.bin"));
>          rom_add_option(option_rom[i].name, option_rom[i].bootindex);
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index efe45c16705d..2f470ed12942 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -63,7 +63,6 @@ blobs =3D [
>    'efi-vmxnet3.rom',
>    'qemu-nsis.bmp',
>    'multiboot_dma.bin',
> -  'linuxboot.bin',
>    'linuxboot_dma.bin',
>    'kvmvapic.bin',
>    'pvh.bin',
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 1183ef889228..e694c7aac007 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -2,7 +2,7 @@ include config.mak
>  SRC_DIR :=3D $(TOPSRC_DIR)/pc-bios/optionrom
>  VPATH =3D $(SRC_DIR)
> =20
> -all: multiboot_dma.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.=
bin
> +all: multiboot_dma.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
>  # Dummy command so that make thinks it has done something
>  =09@true
> =20
> diff --git a/pc-bios/optionrom/linuxboot.S b/pc-bios/optionrom/linuxboot.=
S
> deleted file mode 100644
> index ba821ab922da..000000000000
> --- a/pc-bios/optionrom/linuxboot.S
> +++ /dev/null
> @@ -1,195 +0,0 @@
> -/*
> - * Linux Boot Option ROM
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, see <http://www.gnu.org/licenses/>.
> - *
> - * Copyright Novell Inc, 2009
> - *   Authors: Alexander Graf <agraf@suse.de>
> - *
> - * Based on code in hw/pc.c.
> - */
> -
> -#include "optionrom.h"
> -
> -#define BOOT_ROM_PRODUCT "Linux loader"
> -
> -BOOT_ROM_START
> -
> -run_linuxboot:
> -
> -=09cli
> -=09cld
> -
> -=09jmp=09=09copy_kernel
> -boot_kernel:
> -
> -=09read_fw=09=09FW_CFG_SETUP_ADDR
> -
> -=09mov=09=09%eax, %ebx
> -=09shr=09=09$4, %ebx
> -
> -=09/* All segments contain real_addr */
> -=09mov=09=09%bx, %ds
> -=09mov=09=09%bx, %es
> -=09mov=09=09%bx, %fs
> -=09mov=09=09%bx, %gs
> -=09mov=09=09%bx, %ss
> -
> -=09/* CX =3D CS we want to jump to */
> -=09add=09=09$0x20, %bx
> -=09mov=09=09%bx, %cx
> -
> -=09/* SP =3D cmdline_addr-real_addr-16 */
> -=09read_fw=09=09FW_CFG_CMDLINE_ADDR
> -=09mov=09=09%eax, %ebx
> -=09read_fw=09=09FW_CFG_SETUP_ADDR
> -=09sub=09=09%eax, %ebx
> -=09sub=09=09$16, %ebx
> -=09mov=09=09%ebx, %esp
> -
> -=09/* Build indirect lret descriptor */
> -=09pushw=09=09%cx=09=09/* CS */
> -=09xor=09=09%ax, %ax
> -=09pushw=09=09%ax=09=09/* IP =3D 0 */
> -
> -=09/* Clear registers */
> -=09xor=09=09%eax, %eax
> -=09xor=09=09%ebx, %ebx
> -=09xor=09=09%ecx, %ecx
> -=09xor=09=09%edx, %edx
> -=09xor=09=09%edi, %edi
> -=09xor=09=09%ebp, %ebp
> -
> -=09/* Jump to Linux */
> -=09lret
> -
> -
> -copy_kernel:
> -=09/* Read info block in low memory (0x10000 or 0x90000) */
> -=09read_fw=09=09FW_CFG_SETUP_ADDR
> -=09shr=09=09$4, %eax
> -=09mov=09=09%eax, %es
> -=09xor=09=09%edi, %edi
> -=09read_fw_blob_addr32_edi(FW_CFG_SETUP)
> -
> -=09cmpw            $0x203, %es:0x206      // if protocol >=3D 0x203
> -=09jae             1f                     // have initrd_max
> -=09movl            $0x37ffffff, %es:0x22c // else assume 0x37ffffff
> -1:
> -
> -=09/* Check if using kernel-specified initrd address */
> -=09read_fw=09=09FW_CFG_INITRD_ADDR
> -=09mov=09=09%eax, %edi             // (load_kernel wants it in %edi)
> -=09read_fw=09=09FW_CFG_INITRD_SIZE     // find end of initrd
> -=09add=09=09%edi, %eax
> -=09xor=09=09%es:0x22c, %eax        // if it matches es:0x22c
> -=09and=09=09$-4096, %eax           // (apart from padding for page)
> -=09jz=09=09load_kernel            // then initrd is not at top
> -=09=09=09=09=09       // of memory
> -
> -=09/* pc.c placed the initrd at end of memory.  Compute a better
> -=09 * initrd address based on e801 data.
> -=09 */
> -=09mov=09=09$0xe801, %ax
> -=09xor=09=09%cx, %cx
> -=09xor=09=09%dx, %dx
> -=09int=09=09$0x15
> -
> -=09/* Output could be in AX/BX or CX/DX */
> -=09or=09=09%cx, %cx
> -=09jnz=09=091f
> -=09or=09=09%dx, %dx
> -=09jnz=09=091f
> -=09mov=09=09%ax, %cx
> -=09mov=09=09%bx, %dx
> -1:
> -
> -=09or=09=09%dx, %dx
> -=09jnz=09=092f
> -=09addw=09=09$1024, %cx            /* add 1 MB */
> -=09movzwl=09=09%cx, %edi
> -=09shll=09=09$10, %edi             /* convert to bytes */
> -=09jmp=09=093f
> -
> -2:
> -=09addw=09=09$16777216 >> 16, %dx  /* add 16 MB */
> -=09movzwl=09=09%dx, %edi
> -=09shll=09=09$16, %edi             /* convert to bytes */
> -
> -3:
> -=09read_fw         FW_CFG_INITRD_SIZE
> -=09subl            %eax, %edi
> -=09andl            $-4096, %edi          /* EDI =3D start of initrd */
> -=09movl=09=09%edi, %es:0x218       /* put it in the header */
> -
> -load_kernel:
> -=09/* We need to load the kernel into memory we can't access in 16 bit
> -=09   mode, so let's get into 32 bit mode, write the kernel and jump
> -=09   back again. */
> -
> -=09/* Reserve space on the stack for our GDT descriptor. */
> -=09mov             %esp, %ebp
> -=09sub             $16, %esp
> -
> -=09/* Now create the GDT descriptor */
> -=09movw=09=09$((3 * 8) - 1), -16(%bp)
> -=09mov=09=09%cs, %eax
> -=09movzwl=09=09%ax, %eax
> -=09shl=09=09$4, %eax
> -=09addl=09=09$gdt, %eax
> -=09movl=09=09%eax, -14(%bp)
> -
> -=09/* And load the GDT */
> -=09data32 lgdt=09-16(%bp)
> -=09mov=09=09%ebp, %esp
> -
> -=09/* Get us to protected mode now */
> -=09mov=09=09$1, %eax
> -=09mov=09=09%eax, %cr0
> -
> -=09/* So we can set ES to a 32-bit segment */
> -=09mov=09=09$0x10, %eax
> -=09mov=09=09%eax, %es
> -
> -=09/* We're now running in 16-bit CS, but 32-bit ES! */
> -
> -=09/* Load kernel and initrd */
> -=09read_fw_blob_addr32_edi(FW_CFG_INITRD)
> -=09read_fw_blob_addr32(FW_CFG_KERNEL)
> -=09read_fw_blob_addr32(FW_CFG_CMDLINE)
> -
> -=09/* And now jump into Linux! */
> -=09mov=09=09$0, %eax
> -=09mov=09=09%eax, %cr0
> -
> -=09/* ES =3D CS */
> -=09mov=09=09%cs, %ax
> -=09mov=09=09%ax, %es
> -
> -=09jmp=09=09boot_kernel
> -
> -/* Variables */
> -
> -.align 4, 0
> -gdt:
> -=09/* 0x00 */
> -.byte=090x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> -
> -=09/* 0x08: code segment (base=3D0, limit=3D0xfffff, type=3D32bit code e=
xec/read, DPL=3D0, 4k) */
> -.byte=090xff, 0xff, 0x00, 0x00, 0x00, 0x9a, 0xcf, 0x00
> -
> -=09/* 0x10: data segment (base=3D0, limit=3D0xfffff, type=3D32bit data r=
ead/write, DPL=3D0, 4k) */
> -.byte=090xff, 0xff, 0x00, 0x00, 0x00, 0x92, 0xcf, 0x00
> -
> -BOOT_ROM_END


