Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95238CD37B5
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 10:11:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMNc4-0000wT-Ij; Mon, 11 May 2026 06:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMNbd-0000mX-R6
 for qemu-arm@nongnu.org; Mon, 11 May 2026 06:11:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMNbc-0002fA-Bv
 for qemu-arm@nongnu.org; Mon, 11 May 2026 06:11:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so2541588f8f.2
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778494278; x=1779099078; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n1tCYwCA6vMalyhyBe3A80+FO3JNz0MZ1bTEpKLIZIc=;
 b=H9maiQDODjEcc8BeFYeuDkCyi2z2HE2QoFZNvG/aOMBXSOfoLYrqiyf+3jM0Bl+wMy
 w1lHYdeQU73UrceKq5ZcXj2GlscK/znTepn6m6lr4vbY2r793Sjr2ZQrREV5jwN52vWe
 haR4ci7rasHqs1q4XO5U2Dh9OuZjaWEPZvNkr282JcCqHDDFugIxPoH5CLuPnspiuJRy
 XKKlimB35wCpAUUqkQb5ZW+VQoj9OYX3R/Z0IWGka1YZVE/7tOwZF/0vFy2f0NtYJN4N
 MEIJmXqWXUueNjwU8KpQNtOeRBr1OOsMMsCuXIbxZAzENpSNyC1Tk5H+rGg4hN1m4EjB
 WeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778494278; x=1779099078;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n1tCYwCA6vMalyhyBe3A80+FO3JNz0MZ1bTEpKLIZIc=;
 b=dxMnxu4QF5MqTCXEEVYqSWOtthf9PFD1NL+cO+iIJx4IlFnhLR8qR3sS+frhYf9/eX
 mIo7JRDfKS+aOsHOs+rFtsOVUqz5B7di94BwQ5QJfAOKdI7wCVtKHb5C195Cai5waU6M
 Hya6bDQ8TrEfb8zi4Egc5vFZbzANXx9+rEQ7rSl5ohXIaGFY4t3vOtTbIHlzh0a66bIu
 oIKuyLgIzyfkryAo+Y8XQxt2rgyFjF8BNRkoGXQE+8mlyih73PW4BI+ni8KXi8FtQLBk
 RygAE3qBmWfFxBmmmivtkNF4tVnI8nwi/PLKU/9Ib4KUV2jfdZvn/ZjoU7ntjnPs4srN
 USWw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/f1eDtHybuOZWwqWG5hCfzfmB3yv2u5xO1muqEVNmLoJBy/GT1LcnqLLEliFQiAOthBOgP5/H3oQ==@nongnu.org
X-Gm-Message-State: AOJu0YzBNNk+z+xCSJLtwwx7cbCGv4jr/lk5JzF51uXuL/Io4n2l8jGy
 kEBbRvhwGSSsKesuG2sDqXkWnq1y6vF96f0kT0GR6M/I9iReRviuh8WrG1XEPNFV4Qc=
X-Gm-Gg: Acq92OE/SlO7sYOjaFGeAcL1PI4FRb14RTb+bTRyh54qzHkU2zrh/O1LmKAtLL+hNBm
 x0x3H3FOGMdvvWMT8yfOXC0QiW4NLeKG0D7OlXSNtho76IV2FLgWBhvvqRM+HcZV6SWmWZtMBjv
 I5Y5Wc5mwepJd95Flx8tG5PJFEPPy8/kOF6n8ohYYrPMuUko+BoeceXeKejXeHia3lWmIDB2I20
 9ISbUHpPPA30BtrgaQ+juFKAnM+oB/qk2P862XIf1EFQz9npI98ymHno/QdoJ+aq8VuDP8KQRVA
 7cGUO/n/AGEoVCTKuRVmv6AYO6a6v/Z7+mBxGFxv7rLDsAnO3ZP5PC6fKMSgLWlcS4uWnqJYVbV
 jnqyr5AYaeapbVYk+q72+dHfkc0XbRTvRhHzmJUxutyLhwu/GILBKsNpqHHy9fnRSjgaJG4Mt1I
 0x0O3fCqPEvL7O9vAbfSh5j5MlNraE2SDVLzn3BZ5JazzSjxn9/Q5q8bJUlKOnAngIcw==
X-Received: by 2002:a05:6000:420c:b0:43b:4136:1e6f with SMTP id
 ffacd0b85a97d-454637c817fmr19373674f8f.38.1778494278025; 
 Mon, 11 May 2026 03:11:18 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491cab9c2sm25789464f8f.31.2026.05.11.03.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 03:11:17 -0700 (PDT)
Message-ID: <5178c9a1-50b0-4864-a48e-d316b602abd9@linaro.org>
Date: Mon, 11 May 2026 12:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/arm: Remove qcom-dc-scm-v1-bmc and
 qcom-firework-bmc machines
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, pierrick.bouvier@oss.qualcomm.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, kane_chen@aspeedtech.com,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20260510165704.2935316-1-clg@redhat.com>
 <20260510165704.2935316-3-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260510165704.2935316-3-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 10/5/26 18:57, Cédric Le Goater wrote:
> The qcom-dc-scm-v1-bmc and qcom-firework-bmc machines were deprecated
> in QEMU 10.2 and are now removed in QEMU 11.1.
> 
> These Qualcomm lab servers never entered production and do not rely on
> specific device models. They can be replaced by the ast2600-evb
> machine with appropriate fmc-model and I2C device configuration via
> command line.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   docs/about/deprecated.rst              | 10 ---
>   docs/about/removed-features.rst        | 10 +++
>   docs/system/arm/aspeed.rst             |  6 +-
>   hw/arm/aspeed_ast2600_qcom-dc-scm-v1.c | 55 ----------------
>   hw/arm/aspeed_ast2600_qcom-firework.c  | 91 --------------------------
>   hw/arm/meson.build                     |  2 -
>   6 files changed, 12 insertions(+), 162 deletions(-)
>   delete mode 100644 hw/arm/aspeed_ast2600_qcom-dc-scm-v1.c
>   delete mode 100644 hw/arm/aspeed_ast2600_qcom-firework.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

