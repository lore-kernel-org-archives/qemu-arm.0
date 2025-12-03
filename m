Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1959D116F3
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 07:02:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQgrq-0002JF-KL; Wed, 03 Dec 2025 02:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQgrb-0002G8-Ox
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 02:01:27 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQgrY-0001mW-Qk
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 02:01:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47795f6f5c0so38264355e9.1
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 23:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764745277; x=1765350077; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dIPPQJIkimIrAN/OqDJfIr0BzioIBa9UlO2MKnJW2u0=;
 b=CcRYshNFqnZvFQaChXK27K6LmswI8VnjgdqfXL+t3EeOD8wfKF+W4ux/R81sR5qwLL
 pKK9SmkZ+NfURYukLs5I0uzLdNQZYFN+v3Y7Wq1KGrdHZulrXEZib7NiGugXDBm+SBw2
 nuUJZe5XTrYcpU8CTTlKorh2p7VbBOpAj0Tj3Ohb1LbQVRvSNJ6/EkcPf2Sl+Zb2iR1I
 w5J2lvItY7Gl5cQB/e90C8yBuu9fJ6HEJX59bGNpoPDpGtzlOBWduwm2x98JXfgzmGZD
 VZQMzGpbkoxgeMbHpyx/WRu9XoOT9Gr1BmdwOZyZlkk/0RQZTwiJC42Fo60HBSh9PWwL
 0azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764745277; x=1765350077;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dIPPQJIkimIrAN/OqDJfIr0BzioIBa9UlO2MKnJW2u0=;
 b=Y8iqxKZIAo6gp1Y3Sakp/39Ap82f0UrfpcIn+QvmR7QlPAt9SLwj6GOGpqpo9ZheDB
 +rXvKBvHOWqykGY13vGeFcJFx2uYoJjphpCNTCX0pViClEFU0PTiNm7Hk1fR9ZowVR3/
 VQ4hHMwDVpkNY1ZR6I8D4/MwzhaL/CKEIO661PCa6s4Tagvle4vglMGSpKPQqbv2Dhjg
 QUG+pCAOYVu1WZ9oNL3g4Y67fWsrK2bizKA34rmwmkkSbSvInXdbjGad3+ZXUG+Rdsho
 KYSy3cP4WRzdi04Hlotxfe29WVPPqAFzGhi/fstlKDnLjK9zTWKTG8pBN2fiH6V+gHkO
 h/ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDjrkA5DPv65Zv0BsHvbKH89cIYTF6H+K9do5YoqqmUTkg3+wiq5g75iW755iKk7bXqn8cQNYakA==@nongnu.org
X-Gm-Message-State: AOJu0YyLTGuI1OyjRRKAEMd/u15EhyxW6glU205l0TmhyRChD+kPQsw4
 ZiEFqLi8kS0Ln/9To0/aUXknEsLbVOMrB57DzhT/GYeQC9d1EcniT2I6ccZ1W5c53tkbkSO/5f+
 tG365ZmE=
X-Gm-Gg: ASbGncsm8b94SU4WBVMDcm6BiqTWDIIrV8M3nF9NrhIv9bF0C0xyDeIjDME/sR9h6Ho
 z/5b1Ej/vlyYUT6po5sV59NFBmzTvIdrY8LZvSThVZFmODQh+8D7jjnibYvY6Fvw37q/ZXfQO0S
 pHWlBQs0BEOgd71xP5rkk3eiTQLUgyfcLEUSSdLtalzmZNSsXlExumIXLXF7k52xuLGcm2vxxiq
 SKOJ/J3BVbDWUGqQY9Ihj7qI23j0DUUFYRKpQ1EMUBrFkErL5KuQLJHCL6JsUAelDC9kz9p2o+l
 4MBngIiEBQOQwO6YPG3MnpGQEs0sIhtjjrYJSaNJhga2nwQC5ESX8sF3AF33n3ZHJKp9/4r8uLt
 9rg4/0y/FJozdEDGm1GbkWAyUFk1F1mi9McyoIug5Nd1gEbxFIFgSonWmz536ys43Bb+Fc16EbL
 8gVOSAbKzmCsw++YyhE/Ss0jCy8L1ElcodbiJw4s4nAy94QOCNH8tBYA==
X-Google-Smtp-Source: AGHT+IGG0ZbmprKWSOG88beLIL3qTc9McUoQae5GvpteHCpgqkA6R9gh6l5DCSqW5PcehVkuqjXlAg==
X-Received: by 2002:a05:600c:1390:b0:477:a3f9:fda5 with SMTP id
 5b1f17b1804b1-4792aef1a50mr8425815e9.9.1764745277390; 
 Tue, 02 Dec 2025 23:01:17 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a3e4sm37758920f8f.25.2025.12.02.23.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 23:01:16 -0800 (PST)
Message-ID: <2c2fbaf0-75e4-4e12-a932-7444c8143f02@linaro.org>
Date: Wed, 3 Dec 2025 08:01:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.0 v6 00/13] hw/sparc64/sun4u: Use
 fw_cfg_init_io_nodma()
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20251203060942.57851-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251203060942.57851-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

New (unreviewed) patches: 1, 2, 5-8

On 3/12/25 07:09, Philippe Mathieu-Daudé wrote:
> Hi Zhao,
> 
> This is my answer to this comment of yours:
> 
>   > Although other callers of fw_cfg_init_io_dma() besides x86 also pass
>   > DMA arguments to create DMA-enabled FwCfgIoState, the "dma_enabled"
>   > property of FwCfgIoState cannot yet be removed, because Sun4u and Sun4v
>   > still create DMA-disabled FwCfgIoState (bypass fw_cfg_init_io_dma()) in
>   > sun4uv_init() (hw/sparc64/sun4u.c).
>   >
>   > Maybe reusing fw_cfg_init_io_dma() for them would be a better choice, or
>   > adding fw_cfg_init_io_nodma(). However, before that, first simplify the
>   > handling of FwCfgState in x86.
>   >
>   > Considering that FwCfgIoState in x86 enables DMA by default, remove the
>   > handling for DMA-disabled cases and replace DMA checks with assertions
>   > to ensure that the default DMA-enabled setting is not broken.
> 
> My series is to apply just after this patch of your series:
> 
>    [PATCH v5 10/28] hw/mips/loongson3_virt: Prefer using fw_cfg_init_mem_nodma()
> 
> Regards,
> 
> Phil.
> 
> Based-on: <20251202162835.3227894-11-zhao1.liu@intel.com>
> 
> Philippe Mathieu-Daudé (12):
>    hw/ppc/mac: Use fw_cfg_init_mem_nodma()
>    hw/sparc/sun4m: Use fw_cfg_init_mem_nodma()
>    hw/nvram/fw_cfg: Factor fw_cfg_init_mem_internal() out
>    hw/nvram/fw_cfg: Rename fw_cfg_init_mem_wide() ->
>      fw_cfg_init_mem_dma()
>    hw/nvram/fw_cfg: Propagate I/O MemoryRegion to fw_cfg_init_io_dma()
>    hw/nvram/fw_cfg: Factor fw_cfg_init_io_internal() out
>    hw/nvram/fw_cfg: Add fw_cfg_init_io_nodma() helper
>    hw/sparc64/sun4u: Use fw_cfg_init_io_nodma()
>    hw/nvram/fw_cfg: Remove fw_cfg_io_properties::dma_enabled
>    hw/i386/x86: Remove X86MachineClass::fwcfg_dma_enabled field
>    hw/i386/pc: Remove multiboot.bin
>    hw/i386: Remove linuxboot.bin


