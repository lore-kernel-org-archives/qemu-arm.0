Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2221D1D884
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 08:06:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vR4Kt-0000tr-1Y; Thu, 04 Dec 2025 03:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vR4Kr-0000qH-2N
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 03:05:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vR4Kp-00077F-CS
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 03:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764835505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GsvzHrp3267dKpQHQPIREocjJ6m/fzxV0oxrtmqzyAE=;
 b=CMLOKL+500vtAD94tZqen0eQe/xgcjD2USmNM0p4Crw0rSOkm42CCgvUyW8PJStbuAcTWX
 eUuwCNfcbj92F7nL+fF7GLxxb6aafmXI4BibFXmP0a9m4tsYgM9o1D0dj3+pyukOpd9EFk
 yb6M93VNiCg9zwH0nzg1fMDkvKK08iM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-mzkWZOs3N1aiG7Ey_Dczqg-1; Thu, 04 Dec 2025 03:05:03 -0500
X-MC-Unique: mzkWZOs3N1aiG7Ey_Dczqg-1
X-Mimecast-MFC-AGG-ID: mzkWZOs3N1aiG7Ey_Dczqg_1764835502
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42e2d5e833fso326735f8f.1
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 00:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764835502; x=1765440302;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GsvzHrp3267dKpQHQPIREocjJ6m/fzxV0oxrtmqzyAE=;
 b=dAeJLsTSiS+whpdusjLR6IEA5UzR5e+Mfg28rfN69x5N4AWY+7u7Ad0XzjuFXdqPr0
 q65TtaA1qYij/aS67X4LepGiSCtH/LpxOBmlYHJxs7iSHDjRWJmcqvvef2+MzNWCc3j7
 DtkfDD8KFqNl3UZfSLaS7nDHMJK/Uk057mms+ZsQUoLOm24Jdp7NOuYKyPDb0hI1iWSJ
 XL38UgYdyVpaOqMqb04rXRZTNPYHvxFtoCJ8FHEKzdgR7egINTqR3gdUwT/s34IPkSyo
 VWnQ1anG2K/ouIfQ+dJDmWdw18YWTTslhFJv6kJHEjxzeWz1nxeD++EUp+IyYOcJ25P1
 asYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTAguY7W8519mIqoxRIUksC/BEv3N4NZNfOxAwwbMzl8i7siCNRXs5JJRm9ZYj6h1DJgakoGGPog==@nongnu.org
X-Gm-Message-State: AOJu0YyuvsnCPy6GiMT3yMdQs4S/9o0N8mglaU5aQWwPYtt1/hcTV5Cd
 zwV8DvT64Zw1OiNnox2reAyvmL3U0NNWE+EmFxVgMSpuos8gixynhG7sXE+mbqdFzTgHYkQPOSI
 I+tmBikRLmuvFB3TJ9rXhWsFVfyZMvnx9dOnKDJMcfOFEAPzm1TW62Q==
X-Gm-Gg: ASbGncvvsbcYcm3z2TsMbSTn/EEH45ualcByrRETthdFKNZV0hI5pB3dKdLj5LTup3n
 kAKdzohm4gVx2qI1jb8AI2PvLRcMMJik+bV8A1LouF4U3Gg5MQkZBsZOcpJgF7NOx9OUeIwZ18x
 Xag/aKkC2MpeO9tHeasv5gqhowC1VlI5bCuvGYhF7NjAEbAf68YHUE/ragHSveyWYqxf0E9xvk6
 DfP51GU+yhDugraQKff9r2/OQzAroz8J97IYdMad9T9UlSSJqaZzR2fKxw2DRPD4ow1L/S22hBr
 TzQP6idIDxufj5WUPE7jvMPodMIoZUSpIYhkw+cOhWlOpL5+bJ6Ni5dsooY/Dnv93c6GYJSSv7a
 LfEBhudlRLNUIw8GfeQi+vuVU2kkZJRgUhg==
X-Received: by 2002:a05:6000:178a:b0:428:3fa7:77ed with SMTP id
 ffacd0b85a97d-42f731f6368mr5388583f8f.46.1764835502398; 
 Thu, 04 Dec 2025 00:05:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG52WnekJnM7DVVpIGAFOlz4R2qBV2ePcT/Hme6t5r94PfpF78qKNupZd+fvlm9Ur5xhjt+Qg==
X-Received: by 2002:a05:6000:178a:b0:428:3fa7:77ed with SMTP id
 ffacd0b85a97d-42f731f6368mr5388540f8f.46.1764835501782; 
 Thu, 04 Dec 2025 00:05:01 -0800 (PST)
Received: from redhat.com (IGLD-80-230-38-228.inter.net.il. [80.230.38.228])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331a4fsm1714380f8f.33.2025.12.04.00.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 00:05:01 -0800 (PST)
Date: Thu, 4 Dec 2025 03:04:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Zhao Liu <zhao1.liu@intel.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH-for-11.0 v6 00/13] hw/sparc64/sun4u: Use
 fw_cfg_init_io_nodma()
Message-ID: <20251204030433-mutt-send-email-mst@kernel.org>
References: <20251203060942.57851-1-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20251203060942.57851-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0vi7tkgaeXsUYC-zwBruAGY7gDYcGnKeVCMX9DyZb_Y_1764835502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Wed, Dec 03, 2025 at 07:09:28AM +0100, Philippe Mathieu-Daudé wrote:
> Hi Zhao,
> 
> This is my answer to this comment of yours:
> 
>  > Although other callers of fw_cfg_init_io_dma() besides x86 also pass
>  > DMA arguments to create DMA-enabled FwCfgIoState, the "dma_enabled"
>  > property of FwCfgIoState cannot yet be removed, because Sun4u and Sun4v
>  > still create DMA-disabled FwCfgIoState (bypass fw_cfg_init_io_dma()) in
>  > sun4uv_init() (hw/sparc64/sun4u.c).
>  >
>  > Maybe reusing fw_cfg_init_io_dma() for them would be a better choice, or
>  > adding fw_cfg_init_io_nodma(). However, before that, first simplify the
>  > handling of FwCfgState in x86.
>  >
>  > Considering that FwCfgIoState in x86 enables DMA by default, remove the
>  > handling for DMA-disabled cases and replace DMA checks with assertions
>  > to ensure that the default DMA-enabled setting is not broken.
> 
> My series is to apply just after this patch of your series:
> 
>   [PATCH v5 10/28] hw/mips/loongson3_virt: Prefer using fw_cfg_init_mem_nodma()
> 
> Regards,
> 
> Phil.


pc/fwcfg things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> Based-on: <20251202162835.3227894-11-zhao1.liu@intel.com>
> 
> Philippe Mathieu-Daudé (12):
>   hw/ppc/mac: Use fw_cfg_init_mem_nodma()
>   hw/sparc/sun4m: Use fw_cfg_init_mem_nodma()
>   hw/nvram/fw_cfg: Factor fw_cfg_init_mem_internal() out
>   hw/nvram/fw_cfg: Rename fw_cfg_init_mem_wide() ->
>     fw_cfg_init_mem_dma()
>   hw/nvram/fw_cfg: Propagate I/O MemoryRegion to fw_cfg_init_io_dma()
>   hw/nvram/fw_cfg: Factor fw_cfg_init_io_internal() out
>   hw/nvram/fw_cfg: Add fw_cfg_init_io_nodma() helper
>   hw/sparc64/sun4u: Use fw_cfg_init_io_nodma()
>   hw/nvram/fw_cfg: Remove fw_cfg_io_properties::dma_enabled
>   hw/i386/x86: Remove X86MachineClass::fwcfg_dma_enabled field
>   hw/i386/pc: Remove multiboot.bin
>   hw/i386: Remove linuxboot.bin
> 
> Zhao Liu (1):
>   hw/i386: Assume fw_cfg DMA is always enabled
> 
>  include/hw/i386/x86.h             |   2 -
>  include/hw/nvram/fw_cfg.h         |  11 +-
>  pc-bios/optionrom/optionrom.h     |   4 -
>  hw/arm/virt.c                     |   2 +-
>  hw/i386/fw_cfg.c                  |  19 +--
>  hw/i386/microvm.c                 |   6 +-
>  hw/i386/multiboot.c               |   7 +-
>  hw/i386/pc.c                      |   7 +-
>  hw/i386/x86-common.c              |   7 +-
>  hw/i386/x86.c                     |   2 -
>  hw/loongarch/fw_cfg.c             |   4 +-
>  hw/nvram/fw_cfg.c                 |  61 ++++----
>  hw/ppc/mac_newworld.c             |  11 +-
>  hw/ppc/mac_oldworld.c             |  11 +-
>  hw/riscv/virt.c                   |   4 +-
>  hw/sparc/sun4m.c                  |  12 +-
>  hw/sparc64/sun4u.c                |   9 +-
>  pc-bios/meson.build               |   2 -
>  pc-bios/multiboot.bin             | Bin 1024 -> 0 bytes
>  pc-bios/optionrom/Makefile        |   2 +-
>  pc-bios/optionrom/linuxboot.S     | 195 -------------------------
>  pc-bios/optionrom/multiboot.S     | 232 -----------------------------
>  pc-bios/optionrom/multiboot_dma.S | 234 +++++++++++++++++++++++++++++-
>  23 files changed, 302 insertions(+), 542 deletions(-)
>  delete mode 100644 pc-bios/multiboot.bin
>  delete mode 100644 pc-bios/optionrom/linuxboot.S
>  delete mode 100644 pc-bios/optionrom/multiboot.S
> 
> -- 
> 2.51.0
> 
> 


