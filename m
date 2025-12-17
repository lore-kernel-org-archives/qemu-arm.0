Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C41D65C49
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:08:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsC8-00022z-80; Wed, 17 Dec 2025 09:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vVsC6-00022G-LW
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:07:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vVsC3-0007eb-Vo
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:07:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765980475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlgGQ6P8Bw0aVZ7+VFsxx5vpq7tA/M20VHPhxfDsG7I=;
 b=AcJ2LrGrp3E0Hjl+UA7YnaF3uGpfSJAtmNhXXVHNT4cgGlBDY8jfmsbi0JBO3UgAYPt0Hu
 /ux/a/lms/tASlLwzuY1yW5fRO20sn4/75q8+6aK2JoHfvQGJDuGNz9+jB0Qyq5HAu6dBH
 nOyR1fwD7A0/Ka8tClWyb7yaHjguRlw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-GD7L7_KfNFavGsk8C4JCnQ-1; Wed, 17 Dec 2025 09:07:51 -0500
X-MC-Unique: GD7L7_KfNFavGsk8C4JCnQ-1
X-Mimecast-MFC-AGG-ID: GD7L7_KfNFavGsk8C4JCnQ_1765980470
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-43100a07eb1so1732755f8f.3
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:07:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765980470; x=1766585270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aljhJcWsDJ3PFFfYqiQ4P5tji0PBbRIzCHEZWg9XRYg=;
 b=lSWKj0N6QL2CSyE1zJW+TygstSiGfLQocdgg72WgqMa80x8ynSeijAef7B49NMMAXD
 2m1NgtfGsyCGm1/cCYiSHTN9bUJuVf4EiSUlUynVU6GP2W1u/zVqQzeNPEdAKZMVMd9n
 0f0AfMpmZAYDhoQuw445sWlN6g4c6p/62vnY0nn3oSpAAzvfxNzPm7p2+mUoeUh4Dy8J
 NkKKvwdy2h0UKuKcAi6cfaonhcI6AFL81GDAco/2AV5vGTM5cPN2+ffD2ZD7ao+oi1Km
 tjyjZdlJ++blPRZh11/CgvyL2VP5UuyCnlJO9DEVAQngXT1s7yvyJ6MvymAXwhGrTkPs
 PNdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsnAQjtk1fwTIbgmgScGci/xnzU9i5V/H72O5kwfoemXMVpNcdEi++cAQTWY4uIDb3vAMB5FGa0g==@nongnu.org
X-Gm-Message-State: AOJu0YzHH2gMMs/OP6u8/SUFEkKkAVSEc8RPTtYzj8l/ehkDzJ7tFJSW
 4FEGsKlYjN8r8k7QUIywuG4THrqKlElsph547fKB6YPJTjy0LPNq/jgw+5dhECd9pdTguCdabZE
 7QtBBexG6Fb06XwnAvNxGmc2ujrZrVZdKoY03hqJ85OWfIK3BTDXa7g==
X-Gm-Gg: AY/fxX7ckNIsKw30lmenCGfY/8Uf7ll7CP1r85Rnl3IfRv98w6LqGTQ4XaX/1dTdy/C
 o1zc2DleMLd00YB0tPGLm22ljIVhhp/aqqea5xJZ8BnTegmXx9othcdeELw0WkJPYoyHj70b0N6
 K3Lif+6Ty1Edren0h9KDl59n2loKxdZL9NrbdoHxsartOCyrSS/cqx/75nn/PFS7QQ0BQwY39Sf
 428xdKlAqE3dCR8Vn0e1kqndWHUDAr6jniu6HZSxm0XgKu1NlNHqEyuquDw+sLwx9YvQNA39ShS
 iJFG1aIoZoUFsZX9zVklqdImuaOBHMBFNlwp1NMhOYsgTahM8EZrRG2aWq0KAXkR+42nlQ==
X-Received: by 2002:a05:6000:230f:b0:430:fa9a:75a with SMTP id
 ffacd0b85a97d-430fa9a0d44mr13417700f8f.62.1765980470157; 
 Wed, 17 Dec 2025 06:07:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpXoLJz1298FbluPk6Xn1ITwdOxZzapjcXfhQvPzVc4SMQoEloQ6OJ4+yK0Lg6SKLVv9uCjQ==
X-Received: by 2002:a05:6000:230f:b0:430:fa9a:75a with SMTP id
 ffacd0b85a97d-430fa9a0d44mr13417644f8f.62.1765980469532; 
 Wed, 17 Dec 2025 06:07:49 -0800 (PST)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4310adad192sm5220905f8f.14.2025.12.17.06.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 06:07:49 -0800 (PST)
Date: Wed, 17 Dec 2025 15:07:47 +0100
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
Subject: Re: [PATCH v5 14/28] hw/i386/pc: Remove multiboot.bin
Message-ID: <20251217150747.13d77fab@imammedo>
In-Reply-To: <20251202162835.3227894-15-zhao1.liu@intel.com>
References: <20251202162835.3227894-1-zhao1.liu@intel.com>
 <20251202162835.3227894-15-zhao1.liu@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7M4MWnZNkNKQ2ZKvmY344rFZatGR3eXb6LFSEEoU2s0_1765980470
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed,  3 Dec 2025 00:28:21 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> From: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20
> All PC machines now use the multiboot_dma.bin binary,
> we can remove the non-DMA version (multiboot.bin).
>=20
> This doesn't change multiboot_dma binary file.
>=20
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Changes since v4:
>  * There's a recent change for multiboot.S: commit 4c8f69b94839.
>    Rebase this patch on that.
> ---
>  hw/i386/pc.c                      |   1 -
>  pc-bios/meson.build               |   1 -
>  pc-bios/multiboot.bin             | Bin 1024 -> 0 bytes
>  pc-bios/optionrom/Makefile        |   2 +-
>  pc-bios/optionrom/multiboot.S     | 232 -----------------------------
>  pc-bios/optionrom/multiboot_dma.S | 234 +++++++++++++++++++++++++++++-
>  pc-bios/optionrom/optionrom.h     |   4 -
>  7 files changed, 233 insertions(+), 241 deletions(-)
>  delete mode 100644 pc-bios/multiboot.bin
>  delete mode 100644 pc-bios/optionrom/multiboot.S
>=20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2b8d3982c4a0..9d88d4a5207a 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -669,7 +669,6 @@ void xen_load_linux(PCMachineState *pcms)
>          assert(!strcmp(option_rom[i].name, "linuxboot.bin") ||
>                 !strcmp(option_rom[i].name, "linuxboot_dma.bin") ||
>                 !strcmp(option_rom[i].name, "pvh.bin") ||
> -               !strcmp(option_rom[i].name, "multiboot.bin") ||
>                 !strcmp(option_rom[i].name, "multiboot_dma.bin"));
>          rom_add_option(option_rom[i].name, option_rom[i].bootindex);
>      }
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 9260aaad78e8..efe45c16705d 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -62,7 +62,6 @@ blobs =3D [
>    'efi-e1000e.rom',
>    'efi-vmxnet3.rom',
>    'qemu-nsis.bmp',
> -  'multiboot.bin',
>    'multiboot_dma.bin',
>    'linuxboot.bin',
>    'linuxboot_dma.bin',
> diff --git a/pc-bios/multiboot.bin b/pc-bios/multiboot.bin
> deleted file mode 100644
> index e772713c95749bee82c20002b50ec6d05b2d4987..0000000000000000000000000=
000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>=20
> literal 1024
> zcmeHFF-Tic6utlZQ$OjD#Hxcx2u0GNQv6GySOkZR(ulaX<>%N!Y#>cWhY}nf36J7X
> zN(%*X6NHY>xcqO11dG^02a8L@B~ihln|%1*|7(haWa`)l@80w7;U4Ziyv0rZ8{K-w =20
> zX(Ib3tLZ)RgZ}w1ei{~QEqQq9q1J-iHc<Nk_t=3D0qf%XfPZVHw2DY#ujc2P|}*P%6X
> z5J{pPlX4<yP&N5pXK;s@UhB~&!E&UdqEwGZF6xQMIcu9YL#zeSRCoLGt{Nh+08t>}
> z{m%E-b32A??+@XljSYirtWObwngi<ymS1Ta*dFGMp;8@=3D_3Z52!v09{UU~`QnFsB_
> z7BiEC)uZxH%SW9kPWCicN{_iUjmk<~D^H|R%@|m9%43Woc(Pkeq%n{&8ND5Z*tPt#
> zJua+xXAQhN4K(1MMs0{u_6sp>l#NmvPZ7KC<lsLdQgMFC@A6POvMoDMgW=3DM+K;T<o
> zTkpnNq6x*`vM0CGE>t40l-CQ}*)y<y--c)(x}o&1TMzwX+ToGS@VER4zR&s70fl+( =20
> qI)9<-H_-!n#lLJmGq*^~<$US&%R-@)$`@YPx#A6#|L`9<;9UXPG71m?
>=20
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 30d07026c790..1183ef889228 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -2,7 +2,7 @@ include config.mak
>  SRC_DIR :=3D $(TOPSRC_DIR)/pc-bios/optionrom
>  VPATH =3D $(SRC_DIR)
> =20
> -all: multiboot.bin multiboot_dma.bin linuxboot.bin linuxboot_dma.bin kvm=
vapic.bin pvh.bin
> +all: multiboot_dma.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.=
bin
>  # Dummy command so that make thinks it has done something
>  =09@true
> =20
> diff --git a/pc-bios/optionrom/multiboot.S b/pc-bios/optionrom/multiboot.=
S
> deleted file mode 100644
> index c95e35c9cb62..000000000000
> --- a/pc-bios/optionrom/multiboot.S
> +++ /dev/null
> @@ -1,232 +0,0 @@
> -/*
> - * Multiboot Option ROM
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
> - */
> -
> -#include "optionrom.h"
> -
> -#define BOOT_ROM_PRODUCT "multiboot loader"
> -
> -#define MULTIBOOT_MAGIC=09=090x2badb002
> -
> -#define GS_PROT_JUMP=09=090
> -#define GS_GDT_DESC=09=096
> -
> -
> -BOOT_ROM_START
> -
> -run_multiboot:
> -
> -=09cli
> -=09cld
> -
> -=09mov=09=09%cs, %eax
> -=09shl=09=09$0x4, %eax
> -
> -=09/* set up a long jump descriptor that is PC relative */
> -
> -=09/* move stack memory to %gs */
> -=09mov=09=09%ss, %ecx
> -=09shl=09=09$0x4, %ecx
> -=09mov=09=09%esp, %ebx
> -=09add=09=09%ebx, %ecx
> -=09sub=09=09$0x20, %ecx
> -=09sub=09=09$0x30, %esp
> -=09shr=09=09$0x4, %ecx
> -=09mov=09=09%cx, %gs
> -
> -=09/* now push the indirect jump descriptor there */
> -=09mov=09=09(prot_jump), %ebx
> -=09add=09=09%eax, %ebx
> -=09movl=09=09%ebx, %gs:GS_PROT_JUMP
> -=09mov=09=09$8, %bx
> -=09movw=09=09%bx, %gs:GS_PROT_JUMP + 4
> -
> -=09/* fix the gdt descriptor to be PC relative */
> -=09movw=09=09(gdt_desc), %bx
> -=09movw=09=09%bx, %gs:GS_GDT_DESC
> -=09movl=09=09(gdt_desc+2), %ebx
> -=09add=09=09%eax, %ebx
> -=09movl=09=09%ebx, %gs:GS_GDT_DESC + 2
> -
> -=09xor=09=09%eax, %eax
> -=09mov=09=09%eax, %es
> -
> -=09/* Read the bootinfo struct into RAM */
> -=09read_fw_blob_dma(FW_CFG_INITRD)
> -
> -=09/* FS =3D bootinfo_struct */
> -=09read_fw=09=09FW_CFG_INITRD_ADDR
> -=09shr=09=09$4, %eax
> -=09mov=09=09%ax, %fs
> -
> -=09/* Account for the EBDA in the multiboot structure's e801
> -=09 * map.
> -=09 */
> -=09int=09=09$0x12
> -=09cwtl
> -=09movl=09=09%eax, %fs:4
> -
> -=09/* ES =3D mmap_addr */
> -=09mov =09=09%fs:48, %eax
> -=09shr=09=09$4, %eax
> -=09mov=09=09%ax, %es
> -
> -=09/* Initialize multiboot mmap structs using int 0x15(e820) */
> -=09xor=09=09%ebx, %ebx
> -=09/* Start storing mmap data at %es:0 */
> -=09xor=09=09%edi, %edi
> -
> -mmap_loop:
> -=09/* The multiboot entry size has offset -4, so leave some space */
> -=09add=09=09$4, %di
> -=09/* entry size (mmap struct) & max buffer size (int15) */
> -=09movl=09=09$20, %ecx
> -=09/* e820 */
> -=09movl=09=09$0x0000e820, %eax
> -=09/* 'SMAP' magic */
> -=09movl=09=09$0x534d4150, %edx
> -=09int=09=09$0x15
> -
> -mmap_check_entry:
> -=09/* Error or last entry already done? */
> -=09jb=09=09mmap_done
> -
> -mmap_store_entry:
> -=09/* store entry size */
> -=09/* old as(1) doesn't like this insn so emit the bytes instead:
> -=09movl=09=09%ecx, %es:-4(%edi)
> -=09*/
> -=09.dc.b=09=090x26,0x67,0x66,0x89,0x4f,0xfc
> -
> -=09/* %edi +=3D entry_size, store as mbs_mmap_length */
> -=09add=09=09%ecx, %edi
> -=09movw=09=09%di, %fs:0x2c
> -
> -=09/* Continuation value 0 means last entry */
> -=09test=09=09%ebx, %ebx
> -=09jnz=09=09mmap_loop
> -
> -mmap_done:
> -=09/* Calculate upper_mem field: The amount of memory between 1 MB and
> -=09   the first upper memory hole. Get it from the mmap. */
> -=09xor=09=09%di, %di
> -=09mov=09=09$0x100000, %edx
> -upper_mem_entry:
> -=09cmp=09=09%fs:0x2c, %di
> -=09je=09=09upper_mem_done
> -=09add=09=09$4, %di
> -
> -=09/* Skip if type !=3D 1 */
> -=09cmpl=09=09$1, %es:16(%di)
> -=09jne=09=09upper_mem_next
> -
> -=09/* Skip if > 4 GB */
> -=09movl=09=09%es:4(%di), %eax
> -=09test=09=09%eax, %eax
> -=09jnz=09=09upper_mem_next
> -
> -=09/* Check for contiguous extension (base <=3D %edx < base + length) */
> -=09movl=09=09%es:(%di), %eax
> -=09cmp=09=09%eax, %edx
> -=09jb=09=09upper_mem_next
> -=09addl=09=09%es:8(%di), %eax
> -=09cmp=09=09%eax, %edx
> -=09jae=09=09upper_mem_next
> -
> -=09/* If so, update %edx, and restart the search (mmap isn't ordered) */
> -=09mov=09=09%eax, %edx
> -=09xor=09=09%di, %di
> -=09jmp=09=09upper_mem_entry
> -
> -upper_mem_next:
> -=09addl=09=09%es:-4(%di), %edi
> -=09jmp=09=09upper_mem_entry
> -
> -upper_mem_done:
> -=09sub=09=09$0x100000, %edx
> -=09shr=09=09$10, %edx
> -=09mov=09=09%edx, %fs:0x8
> -
> -real_to_prot:
> -=09/* Load the GDT before going into protected mode */
> -lgdt:
> -=09data32 lgdt=09%gs:GS_GDT_DESC
> -
> -=09/* get us to protected mode now */
> -=09movl=09=09$1, %eax
> -=09movl=09=09%eax, %cr0
> -
> -=09/* the LJMP sets CS for us and gets us to 32-bit */
> -ljmp:
> -=09data32 ljmp=09*%gs:GS_PROT_JUMP
> -
> -prot_mode:
> -.code32
> -
> -=09/* initialize all other segments */
> -=09movl=09=09$0x10, %eax
> -=09movl=09=09%eax, %ss
> -=09movl=09=09%eax, %ds
> -=09movl=09=09%eax, %es
> -=09movl=09=09%eax, %fs
> -=09movl=09=09%eax, %gs
> -
> -=09/* Read the kernel and modules into RAM */
> -=09read_fw_blob_dma(FW_CFG_KERNEL)
> -
> -=09/* Jump off to the kernel */
> -=09read_fw=09=09FW_CFG_KERNEL_ENTRY
> -=09mov=09=09%eax, %ecx
> -
> -=09/* EBX contains a pointer to the bootinfo struct */
> -=09read_fw=09=09FW_CFG_INITRD_ADDR
> -=09movl=09=09%eax, %ebx
> -
> -=09/* EAX has to contain the magic */
> -=09movl=09=09$MULTIBOOT_MAGIC, %eax
> -ljmp2:
> -=09jmp=09=09*%ecx
> -
> -/* Variables */
> -.align 4, 0
> -prot_jump:=09.long prot_mode
> -=09=09.short 8
> -
> -.align 8, 0
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
> -=09/* 0x18: code segment (base=3D0, limit=3D0x0ffff, type=3D16bit code e=
xec/read/conf, DPL=3D0, 1b) */
> -.byte=090xff, 0xff, 0x00, 0x00, 0x00, 0x9e, 0x00, 0x00
> -
> -=09/* 0x20: data segment (base=3D0, limit=3D0x0ffff, type=3D16bit data r=
ead/write, DPL=3D0, 1b) */
> -.byte=090xff, 0xff, 0x00, 0x00, 0x00, 0x92, 0x00, 0x00
> -
> -gdt_desc:
> -.short=09(5 * 8) - 1
> -.long=09gdt
> -
> -BOOT_ROM_END
> diff --git a/pc-bios/optionrom/multiboot_dma.S b/pc-bios/optionrom/multib=
oot_dma.S
> index d809af3e23fc..c95e35c9cb62 100644
> --- a/pc-bios/optionrom/multiboot_dma.S
> +++ b/pc-bios/optionrom/multiboot_dma.S
> @@ -1,2 +1,232 @@
> -#define USE_FW_CFG_DMA 1
> -#include "multiboot.S"
> +/*
> + * Multiboot Option ROM
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + * Copyright Novell Inc, 2009
> + *   Authors: Alexander Graf <agraf@suse.de>
> + */
> +
> +#include "optionrom.h"
> +
> +#define BOOT_ROM_PRODUCT "multiboot loader"
> +
> +#define MULTIBOOT_MAGIC=09=090x2badb002
> +
> +#define GS_PROT_JUMP=09=090
> +#define GS_GDT_DESC=09=096
> +
> +
> +BOOT_ROM_START
> +
> +run_multiboot:
> +
> +=09cli
> +=09cld
> +
> +=09mov=09=09%cs, %eax
> +=09shl=09=09$0x4, %eax
> +
> +=09/* set up a long jump descriptor that is PC relative */
> +
> +=09/* move stack memory to %gs */
> +=09mov=09=09%ss, %ecx
> +=09shl=09=09$0x4, %ecx
> +=09mov=09=09%esp, %ebx
> +=09add=09=09%ebx, %ecx
> +=09sub=09=09$0x20, %ecx
> +=09sub=09=09$0x30, %esp
> +=09shr=09=09$0x4, %ecx
> +=09mov=09=09%cx, %gs
> +
> +=09/* now push the indirect jump descriptor there */
> +=09mov=09=09(prot_jump), %ebx
> +=09add=09=09%eax, %ebx
> +=09movl=09=09%ebx, %gs:GS_PROT_JUMP
> +=09mov=09=09$8, %bx
> +=09movw=09=09%bx, %gs:GS_PROT_JUMP + 4
> +
> +=09/* fix the gdt descriptor to be PC relative */
> +=09movw=09=09(gdt_desc), %bx
> +=09movw=09=09%bx, %gs:GS_GDT_DESC
> +=09movl=09=09(gdt_desc+2), %ebx
> +=09add=09=09%eax, %ebx
> +=09movl=09=09%ebx, %gs:GS_GDT_DESC + 2
> +
> +=09xor=09=09%eax, %eax
> +=09mov=09=09%eax, %es
> +
> +=09/* Read the bootinfo struct into RAM */
> +=09read_fw_blob_dma(FW_CFG_INITRD)
> +
> +=09/* FS =3D bootinfo_struct */
> +=09read_fw=09=09FW_CFG_INITRD_ADDR
> +=09shr=09=09$4, %eax
> +=09mov=09=09%ax, %fs
> +
> +=09/* Account for the EBDA in the multiboot structure's e801
> +=09 * map.
> +=09 */
> +=09int=09=09$0x12
> +=09cwtl
> +=09movl=09=09%eax, %fs:4
> +
> +=09/* ES =3D mmap_addr */
> +=09mov =09=09%fs:48, %eax
> +=09shr=09=09$4, %eax
> +=09mov=09=09%ax, %es
> +
> +=09/* Initialize multiboot mmap structs using int 0x15(e820) */
> +=09xor=09=09%ebx, %ebx
> +=09/* Start storing mmap data at %es:0 */
> +=09xor=09=09%edi, %edi
> +
> +mmap_loop:
> +=09/* The multiboot entry size has offset -4, so leave some space */
> +=09add=09=09$4, %di
> +=09/* entry size (mmap struct) & max buffer size (int15) */
> +=09movl=09=09$20, %ecx
> +=09/* e820 */
> +=09movl=09=09$0x0000e820, %eax
> +=09/* 'SMAP' magic */
> +=09movl=09=09$0x534d4150, %edx
> +=09int=09=09$0x15
> +
> +mmap_check_entry:
> +=09/* Error or last entry already done? */
> +=09jb=09=09mmap_done
> +
> +mmap_store_entry:
> +=09/* store entry size */
> +=09/* old as(1) doesn't like this insn so emit the bytes instead:
> +=09movl=09=09%ecx, %es:-4(%edi)
> +=09*/
> +=09.dc.b=09=090x26,0x67,0x66,0x89,0x4f,0xfc
> +
> +=09/* %edi +=3D entry_size, store as mbs_mmap_length */
> +=09add=09=09%ecx, %edi
> +=09movw=09=09%di, %fs:0x2c
> +
> +=09/* Continuation value 0 means last entry */
> +=09test=09=09%ebx, %ebx
> +=09jnz=09=09mmap_loop
> +
> +mmap_done:
> +=09/* Calculate upper_mem field: The amount of memory between 1 MB and
> +=09   the first upper memory hole. Get it from the mmap. */
> +=09xor=09=09%di, %di
> +=09mov=09=09$0x100000, %edx
> +upper_mem_entry:
> +=09cmp=09=09%fs:0x2c, %di
> +=09je=09=09upper_mem_done
> +=09add=09=09$4, %di
> +
> +=09/* Skip if type !=3D 1 */
> +=09cmpl=09=09$1, %es:16(%di)
> +=09jne=09=09upper_mem_next
> +
> +=09/* Skip if > 4 GB */
> +=09movl=09=09%es:4(%di), %eax
> +=09test=09=09%eax, %eax
> +=09jnz=09=09upper_mem_next
> +
> +=09/* Check for contiguous extension (base <=3D %edx < base + length) */
> +=09movl=09=09%es:(%di), %eax
> +=09cmp=09=09%eax, %edx
> +=09jb=09=09upper_mem_next
> +=09addl=09=09%es:8(%di), %eax
> +=09cmp=09=09%eax, %edx
> +=09jae=09=09upper_mem_next
> +
> +=09/* If so, update %edx, and restart the search (mmap isn't ordered) */
> +=09mov=09=09%eax, %edx
> +=09xor=09=09%di, %di
> +=09jmp=09=09upper_mem_entry
> +
> +upper_mem_next:
> +=09addl=09=09%es:-4(%di), %edi
> +=09jmp=09=09upper_mem_entry
> +
> +upper_mem_done:
> +=09sub=09=09$0x100000, %edx
> +=09shr=09=09$10, %edx
> +=09mov=09=09%edx, %fs:0x8
> +
> +real_to_prot:
> +=09/* Load the GDT before going into protected mode */
> +lgdt:
> +=09data32 lgdt=09%gs:GS_GDT_DESC
> +
> +=09/* get us to protected mode now */
> +=09movl=09=09$1, %eax
> +=09movl=09=09%eax, %cr0
> +
> +=09/* the LJMP sets CS for us and gets us to 32-bit */
> +ljmp:
> +=09data32 ljmp=09*%gs:GS_PROT_JUMP
> +
> +prot_mode:
> +.code32
> +
> +=09/* initialize all other segments */
> +=09movl=09=09$0x10, %eax
> +=09movl=09=09%eax, %ss
> +=09movl=09=09%eax, %ds
> +=09movl=09=09%eax, %es
> +=09movl=09=09%eax, %fs
> +=09movl=09=09%eax, %gs
> +
> +=09/* Read the kernel and modules into RAM */
> +=09read_fw_blob_dma(FW_CFG_KERNEL)
> +
> +=09/* Jump off to the kernel */
> +=09read_fw=09=09FW_CFG_KERNEL_ENTRY
> +=09mov=09=09%eax, %ecx
> +
> +=09/* EBX contains a pointer to the bootinfo struct */
> +=09read_fw=09=09FW_CFG_INITRD_ADDR
> +=09movl=09=09%eax, %ebx
> +
> +=09/* EAX has to contain the magic */
> +=09movl=09=09$MULTIBOOT_MAGIC, %eax
> +ljmp2:
> +=09jmp=09=09*%ecx
> +
> +/* Variables */
> +.align 4, 0
> +prot_jump:=09.long prot_mode
> +=09=09.short 8
> +
> +.align 8, 0
> +gdt:
> +=09/* 0x00 */
> +.byte=090x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> +
> +=09/* 0x08: code segment (base=3D0, limit=3D0xfffff, type=3D32bit code e=
xec/read, DPL=3D0, 4k) */
> +.byte=090xff, 0xff, 0x00, 0x00, 0x00, 0x9a, 0xcf, 0x00
> +
> +=09/* 0x10: data segment (base=3D0, limit=3D0xfffff, type=3D32bit data r=
ead/write, DPL=3D0, 4k) */
> +.byte=090xff, 0xff, 0x00, 0x00, 0x00, 0x92, 0xcf, 0x00
> +
> +=09/* 0x18: code segment (base=3D0, limit=3D0x0ffff, type=3D16bit code e=
xec/read/conf, DPL=3D0, 1b) */
> +.byte=090xff, 0xff, 0x00, 0x00, 0x00, 0x9e, 0x00, 0x00
> +
> +=09/* 0x20: data segment (base=3D0, limit=3D0x0ffff, type=3D16bit data r=
ead/write, DPL=3D0, 1b) */
> +.byte=090xff, 0xff, 0x00, 0x00, 0x00, 0x92, 0x00, 0x00
> +
> +gdt_desc:
> +.short=09(5 * 8) - 1
> +.long=09gdt
> +
> +BOOT_ROM_END
> diff --git a/pc-bios/optionrom/optionrom.h b/pc-bios/optionrom/optionrom.=
h
> index 7bcdf0eeb240..2e6e2493f83f 100644
> --- a/pc-bios/optionrom/optionrom.h
> +++ b/pc-bios/optionrom/optionrom.h
> @@ -117,16 +117,12 @@
>   *
>   * Clobbers: %eax, %edx, %es, %ecx, %edi and adresses %esp-20 to %esp
>   */
> -#ifdef USE_FW_CFG_DMA
>  #define read_fw_blob_dma(var)                           \
>          read_fw         var ## _SIZE;                   \
>          mov             %eax, %ecx;                     \
>          read_fw         var ## _ADDR;                   \
>          mov             %eax, %edi ;                    \
>          read_fw_dma     var ## _DATA, %ecx, %edi
> -#else
> -#define read_fw_blob_dma(var) read_fw_blob(var)
> -#endif
> =20
>  #define read_fw_blob_pre(var)                           \
>          read_fw         var ## _SIZE;                   \


