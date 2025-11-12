Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6C0CCF9F8
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 11:46:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJ9JC-0002ws-HX; Wed, 12 Nov 2025 06:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ9Fv-0001g8-1R
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:43:23 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ9Ft-0006KC-8v
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:43:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42b312a089fso534449f8f.2
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 03:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762947794; x=1763552594; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oWt08JfmC5I/RW9AlFNFSUsZ57Ypm4q+BxEH35MpBec=;
 b=HlZwrFcY5/HqqjUQxPC6UzBkE1JoebY+6+Lin2i6yQr1CEa8n97xFzbAJFzQ7eHI0k
 XdW6r5DjGlfnlQIZSs7Ht2dpiHvZ3aUyKT8/yXpXxlyhyhYjWtkgFAJ65rJ90Vcul1C2
 KvXs/ilTSklYWBo3z8xqgvZMX9AKVnGRmn153BsKbrFoXvYQIBE4SOy0pmO+oaencXG3
 tB/wtmRgXx55HGDrX4wjQN1k7Q1z8BlWFCuijYQwXZNvKAfFgSsUa8VlpG/R4ulvBY4s
 zDWfKW2abKhFSkloSjwf5NlBLGiaxQEnpleGXRqF5UjrkLVQoRAIwTCWUMxoHmM2D4Ag
 ueRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762947794; x=1763552594;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oWt08JfmC5I/RW9AlFNFSUsZ57Ypm4q+BxEH35MpBec=;
 b=h7MCRFxM37OrNu+pygfY9VTiCGhnW/zBnZUVeDQmH0YnccM0NmPEcRiuuri29VAv7D
 sZphM+cnZk0nrlzAk+Tyy6QlRjoPjpRa2TOVrSjB87L/aEkiSVyuSsOm+Pf/OjRt0Yro
 SPC4mgN/0nL6NSR7MtQDsMAFFNQnzyOeTqMYShHeu5qMxYRKe+xhlZQaHfhS0fofvamW
 nH7VckATnxofCdhFubw5/Tz1E0kgxgnyt/5L0jGtzyUArD3T9GfSSShrtJEtmRfA47jM
 FdKPveuANXCvoiPfQgaNbr/mDgaMYM0HDhSLXmRa22sSD6nnbztLzXWQ3/oPeD7drOI8
 UEYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzY3EQIwpUMI33hiYbmkL9kd1w+rAJpegiQm7z15fel4Fr01XgggtIgNbnc/9VZZ/dyZetyMJsug==@nongnu.org
X-Gm-Message-State: AOJu0Yz1aw9XzGZn2iGN5j7cI8rik7lZ8GmJhfkFIbNPIfjIx/9mqL+u
 rN6Ol9oQfQ2Tz2DxyK0l2enbD/immQvQsbLIGaqEigefUEJ7MCpNqIO51AwbzUiHeZg=
X-Gm-Gg: ASbGncsn+bgKAmO1nnCr4Ix0baIMuY4BlFqftEtfXRMw8ScrKCheVSh47eJv301hl2x
 7uLRvTTqffjWOFpylPDTyRqmYuS0PdRvfauaJO5WwOIdUlTu/pdRVkK4G4IHsqQKxT7v+OHCls+
 YXTpz2ymdEneqklwW1y/3NVAR6aoUbSPnHaPKsxAfND/Euty8PpphEMqyj9MLGoO+Vmn5Jz6jBb
 c9sPJCGuiAg6hD6b5YmBqVuyryACPYPnUcxcJkrOhdgqI1lhOKGEJP4NSEicu/kLu/CihQqsfGp
 k018qtlSDWyEWqCRf1CkeDXV1dZfRAY43SV+jSlFmDZAMqV5nm8E8nZ7nWgLsPOpYNjGvz6zXPR
 dltXVHICf09qSD+MozGjcFoMmfl/jvcDVKhijcMkc7pfSnMwxfDaGZnbFjRavSmCTUnf6mOdfXs
 gZ2b5BFlLqV3YQ3chqat0wSOf59cCtzQA+r4tMYKUBqAY=
X-Google-Smtp-Source: AGHT+IHZtKBQ+vYyvg8Fd2aXKpmHtHipyc8Ym8h2Du7RgBbIHEGZoQmAG0GW3SHtZOlSAOoTnUhlDg==
X-Received: by 2002:a05:6000:1849:b0:42b:3806:2ba0 with SMTP id
 ffacd0b85a97d-42b4bb89b8amr2103888f8f.2.1762947794430; 
 Wed, 12 Nov 2025 03:43:14 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b314dae4bsm23976837f8f.34.2025.11.12.03.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 03:43:13 -0800 (PST)
Message-ID: <b189d246-74b2-4382-b0b9-8121caf713a5@linaro.org>
Date: Wed, 12 Nov 2025 12:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] hw/arm: Add new machine based on xilinx-zynq-a9
 for Beckhoff CX7200
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
 <20251111102836.212535-14-corvin.koehne@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251111102836.212535-14-corvin.koehne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Hi Yannick, Corvin,

On 11/11/25 11:28, Corvin Köhne wrote:
> From: YannickV <Y.Vossen@beckhoff.com>
> 
> This commit introduces a new machine, derived from xilinx-zynq-a9.
> While retaining the foundational architecture, unnecessary peripherals
> have been removed and the remaining peripherals have been adapted to
> match the CX7200's hardware layout and behavior.
> 
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> ---
>   hw/arm/Kconfig           |  18 ++
>   hw/arm/beckhoff_CX7200.c | 443 +++++++++++++++++++++++++++++++++++++++
>   hw/arm/meson.build       |   1 +
>   3 files changed, 462 insertions(+)
>   create mode 100644 hw/arm/beckhoff_CX7200.c


> +static void beckhoff_cx7200_init(MachineState *machine)
> +{
> +    CX7200MachineState *cx7200_machine = CX7200_MACHINE(machine);

[...]

> +    n = beckhoff_cx7200_init_spi_flashes(0xE0006000, pic[58 - IRQ_OFFSET],
> +                                         false, 0);
> +    n = beckhoff_cx7200_init_spi_flashes(0xE0007000, pic[81 - IRQ_OFFSET],
> +                                         false, n);
> +    n = beckhoff_cx7200_init_spi_flashes(0xE000D000, pic[51 - IRQ_OFFSET],
> +                                         true, n);

[...]

> +    beckhoff_cx7200_binfo.ram_size = machine->ram_size;
> +    beckhoff_cx7200_binfo.board_id = 0xd32;
> +    beckhoff_cx7200_binfo.loader_start = 0;
> +    beckhoff_cx7200_binfo.board_setup_addr = BOARD_SETUP_ADDR;
> +    beckhoff_cx7200_binfo.write_board_setup = beckhoff_cx7200_write_board_setup;
> +
> +    arm_load_kernel(cx7200_machine->cpu[0], machine, &beckhoff_cx7200_binfo);
> +}
> +
> +static void beckhoff_cx7200_machine_class_init(ObjectClass *oc, void *data)
> +{

> +    mc->desc = "Beckhoff IPC based on the Xilinx Zynq Platform Baseboard";


> +    prop = object_class_property_add_str(oc, "boot-mode", NULL,
> +                                         beckhoff_cx7200_set_boot_mode);
> +    object_class_property_set_description(oc, "boot-mode",
> +                                          "Supported boot modes:"
> +                                          " jtag qspi sd nor");
> +    object_property_set_default_str(prop, "qspi");
> +}
> +
> +static const TypeInfo beckhoff_cx7200_machine_type = {
> +    .name = TYPE_CX7200_MACHINE,

A lot of code is duplicated from hw/arm/xilinx_zynq.c; this does not
sounds right. Can't you have your machine inherit from TYPE_ZYNQ_MACHINE
and expand it in a .instance_init() handler?

If this isn't possible, then we need to refactor hw/arm/xilinx_zynq.c:
- extract TYPE_ZYNQ_SOC from TYPE_ZYNQ_MACHINE
- have TYPE_CX7200_MACHINE use TYPE_ZYNQ_SOC

> +    .parent = TYPE_MACHINE,
> +    .class_init = beckhoff_cx7200_machine_class_init,
> +    .instance_size = sizeof(CX7200MachineState),
> +};
Regards,

Phil.

