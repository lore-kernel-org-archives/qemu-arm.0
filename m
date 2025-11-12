Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64A2CCFA1A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 11:38:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJ99o-0007xB-Og; Wed, 12 Nov 2025 06:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ99d-0007tL-TP
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:36:53 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ99a-0005Ms-SM
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:36:49 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42b3377aaf2so407979f8f.2
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 03:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762947404; x=1763552204; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PuGEPMinRsSyf4OT/Ys7EFDIRyoLAeqt1kZN6UzuH14=;
 b=Nx2kTKLeVJ7COdsNqSon1Rc/32e0ia9uvbbC9C2vTPdKhIR38j87gnMmivWsEo5kSJ
 8USZ6kLPDVtH+5GFyOw86qoicEyvdAFyY7bBJDfwy/PbSTzGB6vvCIOu+z+jUk8AQ1mu
 v57CP56Mu7g5P1J5UhDA09MkVGpbs1s2Yv2MCQdyi2lEOPPYq+j0NVcO8GkamlEnWjNy
 3DYh9a7elAEULkD48sRYFglK+QUrK+3ZpVqpDJ9dMdgpJhIqxa9W5QCv7nRx5HNjAOdv
 SSrtCx4/gn/gTRo/TOhVUdEv2qe5jNZ5Z1mIoSTYa0T/4OfKFBg7RQerHdJ3bvT+VXSW
 biEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762947404; x=1763552204;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PuGEPMinRsSyf4OT/Ys7EFDIRyoLAeqt1kZN6UzuH14=;
 b=Gbx//wZ4rDS2U1g01fSworcj6yge1aFaH4H8QXvBNyWCtefhCkS5QgbWUXqUpvDD+0
 ICpIlzTDYExy4WeWl0/RuRtjx90MX1mSvZ/an1/AbNwjbr+3OmyFkumTH9J8i3QE1Vvy
 nEzwZ1Y2hWkRTAtG+8ufMEP+eTZ3tMJK39we/2dCsZE4AbpcVuxaK/YBk7gETAGNU5At
 O0ROwVC4lnu8RGNXAixmqnMLW/Y3bB6ftM1LTr6oBOEpNxEsfza7jvAnJHE5yrHfwLNg
 1PrQlOKxVCfyFhxtgW8hNytSpb+PXWs2MxBSCOntKBu1Bo7/FzSdwWCwwLjmjgNSPPuY
 +8IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPvy/MoCtGSbWTyAdK/4ZGFYDLK/9XvX2PJRaqyyWOWof13dTqZrFcQ4T2cQf9L8oQuJEpWvJROQ==@nongnu.org
X-Gm-Message-State: AOJu0YxUMRRiFlJfvEpZNImlVjflkm62JRrQOEy93odaCfr04iNPiAB1
 yOPgzDZJ2oPfQT3503sY1wr7bkDXeH9ceXH7H/W30ZmxH82+kz8Bry+MtjPeC9o7jp0=
X-Gm-Gg: ASbGncsg5R3Gm2tic1xEDaPSBCXsWaHu2pu1yBmQhjgpulFz/naXc37REEcI0rgvVqO
 fbOGID28yMS8zNYyDXyDFD8FNupI2eyTtLDD3f3TtNUIMhYmVqztN0P7bWrDQXcYSByFEh8UB1F
 l8X7+DugqdGOY7wsFMWtLfWoGB/Y8qQyHjcqlz+AQ8usg2LNUe882MXZJy/St7YW5Ko6twfeaQS
 yyV6QKUhCTIw5diTktHP09GvEWwQFL5D7MO+xwNX6Wl2Urqk10olVbtmil6MpKjnnT0BzHlZC+g
 KiRrkfivyNCylx9obGAQhAYMiWYpJ6b1Cl1Rj6EzF9Xrtmd5PXMAPax89CnA3jE3y06J2xq8MHg
 ccpo9zReA+8Ll9E9bZTePGePwCs7lEw/V24mNahMzNIu+9vVABa0zrFMphPBBvMb6zYfzLrhJNE
 AG3Fzh/FwbnjXYQay+/ww8G39skyjkR87XJWRiV3q4wVo=
X-Google-Smtp-Source: AGHT+IGywUWY9ZzcscGVB2M4Ev8AaZQT8Lvp4W8LnHNx9cHUSJ+Lf2fBIbBFij/2ttFKNT4meBeKSw==
X-Received: by 2002:a05:6000:2892:b0:429:c774:dc08 with SMTP id
 ffacd0b85a97d-42b4bdd3e92mr2634479f8f.53.1762947404524; 
 Wed, 12 Nov 2025 03:36:44 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac677ab75sm32506552f8f.35.2025.11.12.03.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 03:36:44 -0800 (PST)
Message-ID: <f2c596fe-292c-4b82-a332-1087c1c61732@linaro.org>
Date: Wed, 12 Nov 2025 12:36:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/15] hw/misc: Add Beckhoff CCAT device
Content-Language: en-US
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20251111102836.212535-1-corvin.koehne@gmail.com>
 <20251111102836.212535-12-corvin.koehne@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251111102836.212535-12-corvin.koehne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 11/11/25 11:28, Corvin Köhne wrote:
> From: YannickV <Y.Vossen@beckhoff.com>
> 
> This adds the Beckhoff Communication Controller (CCAT). The information
> block, EEPROM interface and DMA controller are currently  implemented.
> 
> The EEPROM provides production information for Beckhoff Devices.
> An EEPORM binary must therefor be handed over. It should be aligned to
> a power of two. If no EEPROM binary is handed over an empty EEPROM of
> size 4096 is initialized.
> 
> This device is needed for the Beckhoff CX7200 board emulation.
> 
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> ---
>   hw/misc/Kconfig         |   3 +
>   hw/misc/beckhoff_ccat.c | 338 ++++++++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build     |   1 +
>   3 files changed, 342 insertions(+)
>   create mode 100644 hw/misc/beckhoff_ccat.c


> +#define TYPE_BECKHOFF_CCAT "beckhoff-ccat"
> +OBJECT_DECLARE_SIMPLE_TYPE(BeckhoffCcat, BECKHOFF_CCAT)
> +
> +#define MAX_NUM_SLOTS 32
> +#define CCAT_FUNCTION_BLOCK_SIZE 16
> +
> +#define CCAT_EEPROM_OFFSET 0x100
> +#define CCAT_DMA_OFFSET 0x8000
> +
> +#define CCAT_MEM_SIZE 0xFFFF

Likely

   #define CCAT_MEM_SIZE (64 * KiB)

> +#define CCAT_DMA_SIZE 0x800
> +#define CCAT_EEPROM_SIZE 0x20
> +
> +#define EEPROM_MEMORY_SIZE 0x1000


