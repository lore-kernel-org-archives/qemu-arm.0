Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DE1D1F9B4
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 10:48:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vR6sc-0001Fg-1X; Thu, 04 Dec 2025 05:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vR6sZ-0001FB-G6
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 05:48:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vR6sX-0001h7-C8
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 05:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764845284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6tyOEvsFspYZUcwzU3OxMzTAdn6bK0XXoV7A7MYDuhA=;
 b=eWQQt2G7meuwnEpLCOEPk1P/iYWJM7V8VWTIR9NZlRt/a8oMLSdRBy50PjO7yNLm6RfoSK
 fuF0mxMogoTRY9SIg0YpfJi1n4zo1mEwRkDaM4TapZ5yRpleWkJnW63jYtE13RxF7vz45+
 5A14IR/ThXUVsCDd25s6o3FsCEqpxSU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-D8b52qUwPe6l_r-Olt2lFA-1; Thu, 04 Dec 2025 05:48:02 -0500
X-MC-Unique: D8b52qUwPe6l_r-Olt2lFA-1
X-Mimecast-MFC-AGG-ID: D8b52qUwPe6l_r-Olt2lFA_1764845282
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-42b352355a1so899959f8f.1
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 02:48:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764845281; x=1765450081;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6tyOEvsFspYZUcwzU3OxMzTAdn6bK0XXoV7A7MYDuhA=;
 b=shqPyPw349nuydUajOczZUZTcCzCrbCM+wg2lpmhvxrHJxQEkTungpE3q2TlMrB+su
 1buCbGjvx27tX135EZLI7cZUl51xV2rgS4YfT+lyZwyqB9W5Qy7gocIHJQ6CYqSxFkkA
 Vz1/bwdlJwuOfWgBouPO/Umf/D3ttlivfC5IxD1CdWRgAV4eo+/l0Z7Doo6yud8Ggzi6
 kJK2bRT7AgoVbws70TlD7OpBdbf9qVPJpyWF6o+Aylh1+nFZhvsPdnoMHdAp2g9YXt8/
 4ppUn+tU0u5V3BuTbIXlHMiaKniRdgT8pxueEeEebUjoMkHqiR7L8Chgkwk2prEqeAx9
 Iw2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCwvnIXj7lKySBNZL2BUC/w2HmUI6OQtu0VauMwTkRFJS2Nh6oQPXo3UoUW9bC7G3ehaQR2B6RXQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz5O97JOEGvyibX5JTfDj1JA1jSZaoBPNFMqmY/rbi6lA6lmraI
 VgEeYe+Vp4fyQW9tlS3juTbK4ZT6+Jsbupjrwd7c1Kq5AMgCFZtLDstIz6pwBsiZZehKCF4eHnQ
 yAsaUUWPgaPdPutzqtpkwv0gqT7BwBVMuSnmuGwPRKu7fi9rA5MsAOg==
X-Gm-Gg: ASbGnctg3/l+qhH3RGZDax6zXRSvdgkNPfRHjTyl3RLgWzRnxPhpe38GBWGCypaze5P
 wEIjALotgoqbNbRyX+NFWGRFeuIP8xxw2h9KEoPwN9UVNpbHpI9/7RcgU2l8HXGDRRsvq9E8Uds
 ZHm9KiCaIRjjgjoXWkhpibrlKRhFm8WDaDHsP5PAg5fj5tkTwApG+9cAqesmoHT09BhQMQlGsOC
 Z6RpO6vatkHizSO/UjAiCYFPr6jKATl5fxjTf6UHIMHy4vC2mbyHf5mtt0VV92WaWshuES39do7
 F9VV7fPqAO2+wY5mcWFh3aJTWz50Kp6eKzZJwYJppU55SkK2SzhsEoqlSDspaTfqKeeJIVE7gEp
 qWMSg068=
X-Received: by 2002:a5d:6e44:0:b0:429:cf03:8b2e with SMTP id
 ffacd0b85a97d-42f78772783mr2273552f8f.13.1764845281570; 
 Thu, 04 Dec 2025 02:48:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBlracykKAM3aejXY4qvHj47MAxRdbLufgi1l/+BWPYhzvD4ixzbIrL5MxQ3iUYqFQ6UUvmQ==
X-Received: by 2002:a5d:6e44:0:b0:429:cf03:8b2e with SMTP id
 ffacd0b85a97d-42f78772783mr2273527f8f.13.1764845281137; 
 Thu, 04 Dec 2025 02:48:01 -0800 (PST)
Received: from [192.168.0.5] ([47.64.112.197])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222478sm2487603f8f.20.2025.12.04.02.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 02:48:00 -0800 (PST)
Message-ID: <abb5a2c3-3c42-4f7b-95e8-2e0b29fe5685@redhat.com>
Date: Thu, 4 Dec 2025 11:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] hw/arm: add Beckhoff CX7200 board
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>,
 qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Corvin_K=C3=B6hne?=
 <c.koehne@beckhoff.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251204093502.50582-1-corvin.koehne@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qVtdTefiA_pmTZhkn8zy64iVYZDJK5uawGocDrG0Khc_1764845282
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 04/12/2025 10.34, Corvin Köhne wrote:
> From: Corvin Köhne <c.koehne@beckhoff.com>
> 
> Hi,
> 
> Beckhoff has build a board, called CX7200, based on the Xilinx Zynq A9
> platform. This commit series adds the Beckhoff CX7200 as new board variant to
> QEMU.
> 
> The emulation is able to successfully boot an CX7200 image. The image includes
> some self tests executed on every boot. Only the cache self test fails due to
> QEMU emulating the cache as always being coherent. The self tests include f.e.:
> 
> * Network
> * Flash
> * CCAT DMA + EEPROM [1]
> * TwinCAT (Beckhoff's automation control software [2])
> 
> [1] https://github.com/beckhoff/ccat
> [2] https://www.beckhoff.com/en-us/products/automation/
> 
> YannickV (15):
>    hw/timer: Make frequency configurable
>    hw/timer: Make PERIPHCLK divider configurable
>    hw/dma/zynq-devcfg: Handle bitstream loading via DMA to 0xffffffff
>    hw/arm/zynq-devcfg: Prevent unintended unlock during initialization
>    hw/dma/zynq: Ensure PCFG_DONE bit remains set to indicate PL is in
>      user mode
>    hw/dma/zynq-devcfg: Simulate dummy PL reset
>    hw/dma/zynq-devcfg: Indicate power-up status of PL
>    hw/misc: Add dummy ZYNQ DDR controller
>    hw/misc/zynq_slcr: Add logic for DCI configuration
>    hw/misc: Add Beckhoff CCAT device
>    hw/block/m25p80: Add HAS_SR_TB flag for is25lp016d
>    hw/arm/xilinx_zynq: Split xilinx_zynq into header and implementation
>      files
>    hw/arm/xilinx_zynq: Add flash-type property
>    hw/arm: Add new machine based on xilinx-zynq-a9 for Beckhoff CX7200
>    docs/system/arm: Add support for Beckhoff CX7200
> 
>   docs/system/arm/beckhoff-cx7200.rst |  57 ++++
>   docs/system/target-arm.rst          |   1 +
>   hw/arm/Kconfig                      |   7 +
>   hw/arm/beckhoff_CX7200.c            | 104 +++++++
>   hw/arm/meson.build                  |   1 +
>   hw/arm/xilinx_zynq.c                |  54 ++--
>   hw/block/m25p80.c                   |   3 +-
>   hw/dma/xlnx-zynq-devcfg.c           |  27 +-
>   hw/misc/Kconfig                     |   6 +
>   hw/misc/beckhoff_ccat.c             | 339 +++++++++++++++++++++++
>   hw/misc/meson.build                 |   2 +
>   hw/misc/xlnx-zynq-ddrc.c            | 413 ++++++++++++++++++++++++++++
>   hw/misc/zynq_slcr.c                 |  31 +++
>   hw/timer/a9gtimer.c                 |  26 +-
>   hw/timer/arm_mptimer.c              |  32 ++-
>   include/hw/arm/xilinx_zynq.h        |  37 +++
>   include/hw/misc/xlnx-zynq-ddrc.h    | 148 ++++++++++
>   include/hw/timer/a9gtimer.h         |   2 +
>   include/hw/timer/arm_mptimer.h      |   4 +

  Hi!

Looking at the list of changed files, I think this series misses an update 
to MAINTAINERS to add the new board there. Could you please add such a patch?

Also, are there any binaries for this board publically available somewhere 
on the internet? If so, please also add a functional test for this board to 
tests/functional/ - thanks!

  Thomas


