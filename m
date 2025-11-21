Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57ECCFA47B
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Nov 2025 07:48:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vMLs5-0004q8-OC; Fri, 21 Nov 2025 02:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vMLs3-0004nK-9M
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 02:47:55 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vMLs1-0006gD-7X
 for qemu-arm@nongnu.org; Fri, 21 Nov 2025 02:47:54 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-640a503fbe8so2888774a12.1
 for <qemu-arm@nongnu.org>; Thu, 20 Nov 2025 23:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763711271; x=1764316071; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2QHlCaGfSMKRdwqtRWgbF8anpHq+SdRcUndJ2C6EJpk=;
 b=BqZYDOG+V98VDuuHDbcJI6zfCOCbsXrxDUqp1m7dbh5J5X+6Mo2xtl19xv3s+lG2EM
 qZNPWzK6BCmoyWdmeHtR7q47lF39bUR/fHPybxroYr4EChWoETHJh2eCSL4PVXXVrRiK
 dJrciQeSyZ2SYw144uyA5kd3nnW3Q92tIB76aXdTirOoRolUHGARh8x+NJQt4XoACJ8/
 I9c9qVXG06nNPzJ87jtvLg9zxGzDl22UIQJaZN3yBdBL28A5QJEN9AdwamxNz70aZ+1u
 XYu1C3vSJWiSLgQS5K8nq7TaEI3fPwUvP5yaPVs/IuTEV8CGuDG3OlMhN3PKS0+Yhqn9
 0PWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763711271; x=1764316071;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2QHlCaGfSMKRdwqtRWgbF8anpHq+SdRcUndJ2C6EJpk=;
 b=aq16BdZO80S4Orh34/yf30IKAzu2uFaDmzYfmrV2HfRYUqEidbo9pLTp4Zu3VMCith
 whgrLqYutl2JAlunb4ib4yy1sqdLhA4+qgQuwO/MPDgoup5Blm6Jmpt5DDKYwMeRWST3
 R/NtHKjZrfywEGHUwiaC0O1yzzrrMNSj5CezEs+6ltc2bH8RWZ84MLlpneGVVopwUSUK
 HAzBa5KcH4yc0/SjrMz8Q+2MyLC7RuUSQOEXE4AwOgYLwI9NERgVLbt6ObSzUn65qI0L
 EVSjit67AXMLyrQrZNldreHDemHGJaHWngIt1uDTSHBka1+w8ZKeEuVHvYUK7jO48Aat
 WZ1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxHaPoQIF9SJITVr/3eaUXk6O5JrHYjIccD5OK1oOJcqynAD2oWSPaG6qy4i4Lr2T/Cuo4kvCC3w==@nongnu.org
X-Gm-Message-State: AOJu0YysTaphqhDkKIciqQvBCSnvO7t0n25FWICGDesWDf1q5or5Iic5
 EWGVXlA4MFkdrfVgpcVdNnM54Zx0Jogpyz7QIU5FvPv3PtHRhoaFCNAyoH762VhQGLmbjfzNBq8
 uIZl9gb3kJA==
X-Gm-Gg: ASbGncv/YPremdg7WAhY1QD9yVwLykgxrseKvDNeIV08dGu+HxqAElqe4VnZN1yCY74
 ptCLoVB9oNC7Akfk0EKkXuTheA8WtzyySsj72D6UY0gdqfw3cxCrTFqdRnpcrmLMlwrjqKukzyd
 rHI/X4UxOorvrEfp32h57cJkmYy+RFsxvQJmTYplM7DGMhwsMll4CNB+fc5s4ydB+a1YPe/hse6
 yA4/bk69xzsHnxvBLmDp6a1W8ZbEUsYgCdDVJDpZxJoQxe6F/foV6+kgJ/qtDx3okMigDYZNd8V
 SZ9xfyUrV+zeqnZqu86NZgw9kJ0y5ZpFK9sSHx8a5WnsPMQr3MuhHLTFZsLNvbVYf8/CNGPe7UV
 3U7GJeBPSGxc1BNz6V5m/Cmg5prV0XGYPjjVKNnIvl7JoBEFKJihsOXVSDIDKml/yvBxh/0E1Xj
 Ljzdh7w9wKuZDjA2G7qTx7kBEFtJ1zxlB17f786sVpSJ8HpYuW/IYN/Q==
X-Google-Smtp-Source: AGHT+IHbIcyPgqBOGCDqMzARZWb0patayV39xvk+WMlc/IycWV9IUh/g4u/yzx5vG2abqsAAp1p1aw==
X-Received: by 2002:a05:600c:354f:b0:477:641a:1402 with SMTP id
 5b1f17b1804b1-477c016e74bmr11772745e9.4.1763708788613; 
 Thu, 20 Nov 2025 23:06:28 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a9739964sm82685845e9.1.2025.11.20.23.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 23:06:28 -0800 (PST)
Message-ID: <f5892baf-cb8d-4026-9c1c-c8761889729a@linaro.org>
Date: Fri, 21 Nov 2025 08:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] hw/pci-host/aspeed_pcie: Update ASPEED PCIe Root
 Port capabilities and enable MSI to support hotplug
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, nabihestefan@google.com
References: <20251121050108.3407445-1-jamin_lin@aspeedtech.com>
 <20251121050108.3407445-2-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121050108.3407445-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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

On 21/11/25 06:01, Jamin Lin via wrote:
> This patch updates the ASPEED PCIe Root Port capability layout and interrupt
> handling to match the hardware-defined capability structure as documented in
> the PCI Express Controller (PCIE) chapter of the ASPEED SoC datasheet.
> 
> The following capability offsets and fields are now aligned with the actual
> hardware implementation (validated using EVB config-space dumps via
> 'lspci -s <bdf> -vvv'):
> 
> - Added MSI capability at offset 0x50 and enabled 1-vector MSI support
> - Added PCI Express Capability structure at offset 0x80
> - Added Secondary Subsystem Vendor ID (SSVID) at offset 0xC0
> - Added AER capability at offset 0x100
> - Implemented aer_vector() callback and MSI init/uninit hooks
> - Updated Root Port SSID to 0x1150 to reflect the platform default
> 
> Enabling MSI is required for proper PCIe Hotplug event signaling. This change
> improves correctness and ensures QEMU Root Port behavior matches the behavior
> of ASPEED hardware and downstream kernel expectations.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/pci-host/aspeed_pcie.c | 40 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


