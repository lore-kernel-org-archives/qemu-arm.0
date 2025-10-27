Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71787CCF9E5
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 19:16:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDSha-0002ti-IY; Mon, 27 Oct 2025 15:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDShW-0002nh-9I
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 15:16:19 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDShL-000572-2g
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 15:16:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-426fd62bfeaso2463337f8f.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761592562; x=1762197362; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CoYRlUHvu4bfKY1MKCPfA+vI0KIfDiQsFZOWKDfq3r8=;
 b=mmYJQhATiiflW0JuAsLHBotCVIzggonhU5DUtn36i5p9/2p5OyIgvu3aQyC9uqmBX6
 sKugOYyOr70XF39laK55QUwI3SNs/Ec1D3FG+9rJaQWHR7yHtbHgGoFfz6DK0xzldGxV
 FacwZUJS1IeprZNSY5wjErn1hUSMdTs4CBk76maiheyqlG+W0lMSRnwnc6D7gjxmYW1P
 uQGwn9DjlPC7pZa875bBIKgUtPj4PstHAQoru4xV++ilK1Lbplo5QF1AaEmZ2MexFRG0
 iEOYS9gUn2FeBeytjYjygTKqxCSmodHltXKe+PFUiOz9sakXWt2Prk6E9aFXE/YfyVIP
 aRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761592562; x=1762197362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CoYRlUHvu4bfKY1MKCPfA+vI0KIfDiQsFZOWKDfq3r8=;
 b=kUjlk+5eFC3ltPlUiVIKvCfSoyeY6PBqajtUEJ13y3mjC1L3O3JQ/MFA6mE/Enb+ZF
 /ftD4FnVEidpDpi3ReQz6ckkjEZEgY2GkwihxHhVrb2HNT0Fw7ICf1abpWxn2PgK05Hm
 /i3y6ElrBdhCsx6VCqj6a5nZ5caZCruuwuDclFd0yrJqAWrN96h+p6BKkaGVOqCsnXGb
 mNdZo5CGXYRZVrT7Sb0P0G6F/D0IDE8aOC64bt74PkwUnHC6Ur+SS+cQihybJeW2171k
 PvW9qUR5ngTz2spkzoobvKHf38bo/oTx176cw53tsrRZCdH09XZxLoX0ISfAqfADxKNH
 aiZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdcWBQ4axB+qcDq2kCfSDzsdOxyQhY8BaS2Z9JFTHBS36RztAfdt8YkfnJfQzKrmrX85Gmdt1mNw==@nongnu.org
X-Gm-Message-State: AOJu0YwtpEOLVYdqTDm0Jw05ZIpW6G0K5/TshVbX7+xFBo8fCbQgCHzO
 izhtE+U/nE2g1+sS/1EDsBMe5MBSJBWiMiI2TS6WLzxz/bV6QOpgvO0CahO5kOjVo/0=
X-Gm-Gg: ASbGncukDdusCR5+CzpygTLbPgIyCKPMo77h+lM8j3DUzVSfLskk85sJuY7GgTye+b6
 OMfNogA6sftDXNDKZiY+4seHeTxqNTbZoUVZgTMAQCA9NyqjQm0S9jF6T69MSdcVIIiieJA24Yo
 WxvHRnDTanhV8oqoAhOBQZX4ceQOjOwOEAb8dpYg7ryuFQmOELEV0OQIMMu6wMi20QiLPpdpvmz
 W+06XPcWExv5ApRovwGXF246kyWZU/5Z5I9RbuMIP5QF1/p+EKGqdNNYAaAzz5ETQ29FE853ofi
 JzpkPb1JVRsBFL8D+qC2usjhbE0eC7UGpxS86/Gz+bSkFRA8xfWZHWwfsnAU0C5HspuFL0+HInf
 NCruoYUzlS/03OHSZ8G28dQbCyOcOl15ZX3+81qD7xvNSCUQU77Uob2mubxLwKwMxU3gFEOWFpF
 RakULYFH2Loh+vkHyuwkPiePWWXTVWYS5WqHw/mRIqUEY=
X-Google-Smtp-Source: AGHT+IHBSEpEozHAFTJdTfk/a3fUIM2hb08ESeGXxhxbKeH6+EF0pf/ollVaJVxzwnqub14NZNiUAg==
X-Received: by 2002:a05:6000:2282:b0:3fa:5925:4b11 with SMTP id
 ffacd0b85a97d-429a7e83671mr817298f8f.42.1761592561617; 
 Mon, 27 Oct 2025 12:16:01 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de4a1sm15780056f8f.37.2025.10.27.12.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 12:16:00 -0700 (PDT)
Message-ID: <a3d4a6b5-2ce4-4df3-8d29-62999ad71b74@linaro.org>
Date: Mon, 27 Oct 2025 20:15:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remove redundant typedef when use
 OBJECT_DECLARE_SIMPLE_TYPE
Content-Language: en-US
To: Nguyen Dinh Phi <phind.uet@gmail.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>, Alberto Garcia <berto@igalia.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Aditya Gupta <adityag@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fam Zheng <fam@euphon.net>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20251023063429.1400398-1-phind.uet@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251023063429.1400398-1-phind.uet@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 23/10/25 08:34, Nguyen Dinh Phi wrote:
> When OBJECT_DECLARE_SIMPLE_TYPE is used, it automatically provides
> the typedef, so we don’t have to define it ourselves.
> 
> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> ---
>   backends/cryptodev-lkcf.c               | 1 -
>   hw/char/ipoctal232.c                    | 9 ++++-----
>   hw/char/xen_console.c                   | 1 -
>   hw/dma/pl330.c                          | 6 ++----
>   hw/net/fsl_etsec/etsec.h                | 1 -
>   hw/net/xen_nic.c                        | 2 --
>   hw/pci-host/bonito.c                    | 7 +++----
>   hw/ppc/pef.c                            | 1 -
>   hw/usb/dev-mtp.c                        | 7 +++----
>   hw/usb/dev-uas.c                        | 7 +++----
>   include/hw/char/serial.h                | 1 -
>   include/hw/input/lasips2.h              | 6 ++----
>   include/hw/misc/auxbus.h                | 7 +++----
>   include/hw/misc/bcm2835_mphi.h          | 7 ++-----
>   include/hw/misc/npcm7xx_pwm.h           | 7 ++-----
>   include/hw/pci-host/pnv_phb3.h          | 6 ++----
>   include/hw/pci-host/pnv_phb4.h          | 8 ++++----
>   include/hw/ppc/mac_dbdma.h              | 7 +++----
>   include/hw/riscv/iommu.h                | 3 ---
>   include/hw/scsi/scsi.h                  | 7 +++----
>   include/hw/vfio/vfio-container-legacy.h | 5 ++---
>   include/hw/virtio/virtio-serial.h       | 5 ++---
>   include/net/can_emu.h                   | 7 +++----
>   23 files changed, 43 insertions(+), 75 deletions(-)

Patch queued, thanks!

