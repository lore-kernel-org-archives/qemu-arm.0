Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D88CFF885A
	for <qemu-arm@archiver.kernel.org>; Mon,  4 May 2026 11:19:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wJrKe-0003rB-6F; Mon, 04 May 2026 07:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wJrKc-0003qc-Qv
 for qemu-arm@nongnu.org; Mon, 04 May 2026 07:19:22 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wJrKb-0004GC-50
 for qemu-arm@nongnu.org; Mon, 04 May 2026 07:19:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so2276855f8f.0
 for <qemu-arm@nongnu.org>; Mon, 04 May 2026 04:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777893559; x=1778498359; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UDMHwGyW7502QhopCExMsRazAqKSVL5/HQleasGK5Ms=;
 b=t6N7qwfrLaoaQGAJpwCkGHbCMMdRM3XMH8zow8HaiR71VN09//KQHJbCemKsV1POfo
 wXDjYcqkcZAYwgFWxJOLNMU/a6SgQQNBU4nA5kg9+hAAIP56yMPfMqJNPDMLsUekaxR+
 5ndCKmM0F2zU1COJxGHEU6d6i6wiXNtvBOQanuqudZgydXELI3GWrSp8C+tCRZ2675F5
 OWE1ajl7lL4jzmkaTqayC7PtLq8CEr+oAqDyfNCtfQ4R0G7lniDsyNxO7uapqSKMtPiH
 M/5T0bAGzerjNMmhuLtgMKFjUrcqv4Qco8Yx98bx9eHJroK3cyWCsujkfADsx5gBQLHI
 S0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777893559; x=1778498359;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UDMHwGyW7502QhopCExMsRazAqKSVL5/HQleasGK5Ms=;
 b=IFrAZKLWMMh4HRcSETxp0H7JgmCbVHT/24vRnlJ/kw9xUKqpP1oWp9TeQAMnx+/Hfj
 M+HCPfKqbaF7NII8aB8iSgYvB0EKfDMmmOEd0OpQ9Huwb8gCBJG76tuGpLNN+6JXlwMy
 3vdbD9iELaXX6oz5ShnoM95aYUZhPhs+s2wuI1ZAIIlwzdNk1jPNb48o+ZwHSIkL5F8R
 5U7JwWscLQd8WBYh939bsyh728Id+65Uc5Se/5ncHBVof3Chk55+d+h//Z2hO5fYE6AZ
 pJ5T9NARQIaHa8ZpzamO2EepSpvGBKlCuEe+EJRgVQrgwWiJJ+GTsfelhIOyW3Stb/KT
 Cfug==
X-Forwarded-Encrypted: i=1;
 AFNElJ8VtL4s0Quq0x3kff+Emr6LTaWOZvPal5tn7BV73wtA0KePyanSJ+Mdw7Nm/5qIw7JTa5agrADz9Q==@nongnu.org
X-Gm-Message-State: AOJu0YxchxA6Ge7FTJUdGr1mgh/G/5NDyzaalbaL12tw+Nl5WRQzkTia
 NUocQhkDNeJAqlJVFv9A3tCy4RoLsFnVV257EmhC8vxKjD3ofUh/zmC2oZhFn+K3iHk=
X-Gm-Gg: AeBDieu8yxaJ64A6tnTQNAA8pRBZ1i1/F47rzpF9PY4oK6m8cNt1GCfoxuE7b8wNfgC
 NG7Cli0ePcn1Cqfx3rTIM9TQg+MLTBlX9Q4STpp8eqVZNYuQQ88xKn5MrtfUEQFUZ8a4ia3LRrk
 7vxSaVY0mzeohCi7Wf6m+uvbHL91X7z1zzi733Ag4JgXBe57DVOdD63MqPVJRL2JfHt/79Pa6/o
 3SRNSpyqevFvLqSyDi5tI26NO0FTa+f1OBq0fmiAFiA6/zNeoUN/6xQ8JNaU1d2ITaaX5Ie7bum
 oTdjLIUko68PlaTNynQs7/qxQHQYnsguwz/kckWFLIFY4AyNa9oBNq1cTVOi0CPE0hj8P/Bjmd7
 eYSRa2iUgjWl4/YUj2kR/oqWzzgX9WZRQyZ8Up5J7j1LvE5CTXnAWyWJaoVSwIZV8gVuyr/x1zj
 HbB8Py7VTX0XftTHANw6pnXPnApnaRXJspTd1Kl9Hl5E7CTGnc0qNZ+xx6LCrbf9qKyGsHa9bjK
 YVT0k6bXf8kec0=
X-Received: by 2002:a05:6000:2103:b0:43e:ab40:28d with SMTP id
 ffacd0b85a97d-4494dc52adbmr17441943f8f.2.1777893559517; 
 Mon, 04 May 2026 04:19:19 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ea7cfd2sm23691611f8f.2.2026.05.04.04.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 04:19:18 -0700 (PDT)
Message-ID: <5346becd-5178-4a63-a049-b4fab4f5eba4@linaro.org>
Date: Mon, 4 May 2026 13:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/11] hw/arm/aspeed_ast27x0: Set EHCI
 ctrldssegment-default
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 "peterx@redhat.com" <peterx@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Zhao Liu <zhao1.liu@intel.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "farosas@suse.de" <farosas@suse.de>,
 "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20260504025342.1452605-1-jamin_lin@aspeedtech.com>
 <20260504025342.1452605-10-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260504025342.1452605-10-jamin_lin@aspeedtech.com>
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

On 4/5/26 04:53, Jamin Lin wrote:
> On AST2700 platforms, system DRAM is mapped above 4GB with a base
> address at 0x400000000.
> 
> The Linux EHCI driver programs the segment register to zero when
> 64-bit addressing is supported. As a result, descriptor addresses
> derived from the EHCI registers do not include the DRAM base
> address.
> 
> Descriptor memory is allocated through the DMA API with a 64-bit
> DMA mask, allowing descriptors to reside in DRAM above 4GB. On
> AST2700, EHCI queue heads (QH) and queue element transfer
> descriptors (qTD) are therefore placed at addresses starting from
> 0x400000000.
> 
> Set the ctrldssegment-default property to "sc->memmap[ASPEED_DEV_SDRAM] >> 32"
> so the upper 32 bits of descriptor addresses are adjusted accordingly. This
> allows the emulated EHCI controller to construct correct system
> addresses when accessing descriptors in DRAM above 4GB.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/arm/aspeed_ast27x0.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

