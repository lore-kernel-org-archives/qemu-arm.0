Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E47C44507
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 10:57:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkgG8-0006a0-Ey; Fri, 17 Jul 2026 06:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1wkgG7-0006Zm-2l
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 06:57:35 -0400
Received: from smtpout5.mo537.mail-out.ovh.net ([51.210.91.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1wkgG3-0004RA-HE
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 06:57:34 -0400
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net [152.228.215.222])
 by mo537.mail-out.ovh.net (Postfix) with ESMTPS id 4h1n1L0g62z3ywX;
 Fri, 17 Jul 2026 10:57:26 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net. [127.0.0.1])
 by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <alexander.hansen@9elements.com>; Fri, 17 Jul 2026 10:57:25 +0000 (UTC)
Received: from mta10.priv.ovhmail-u2.ea.mail.ovh.net (unknown [10.110.164.145])
 by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4h1n1K6P87z5vMp;
 Fri, 17 Jul 2026 10:57:25 +0000 (UTC)
Received: from kaod.org (unknown [10.1.6.1])
 (Authenticated sender: clg@kaod.org)
 by mta10.priv.ovhmail-u2.ea.mail.ovh.net (Postfix) with ESMTPSA id
 B46C71923DA4; Fri, 17 Jul 2026 10:57:23 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003c0cade5c-236c-4960-a565-a251d5e1f6cb,
 D28FE153D5A3AE5C5EC95691E5B856C14C2CAAE9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b8db49dc-696b-422e-8d9e-f6bc4f4d614e@kaod.org>
Date: Fri, 17 Jul 2026 12:57:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/9] Add new device emulation for TI ADC128D818
To: Emmanuel Blot <emmanuel.blot@free.fr>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alexander Hansen <alexander.hansen@9elements.com>,
 William de Abreu Pinho <williampinho@meta.com>,
 Emmanuel Blot <eblot@meta.com>, qemu-arm@nongnu.org
References: <20260707091609.97759-1-emmanuel.blot@free.fr>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20260707091609.97759-1-emmanuel.blot@free.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 762515713785441325
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGpboyhB/2PA8rxZx6J7+egC8VlJ+zZB8tINdbMGnBHFidWGMz3uCOQbcWtf50gLsVyYcjJRhb9TX22GaGDiO1ULs211VokzFT0FrOPckACto2gkjg1BD7ocPfTQWJ8v28zKzVWHnc5Y/ddqk57u3cHrcAw/UExNTZTJWHOQRCurcOInQXv+zg7rjvUGWaVGwuqlvr6h8yf4twTcv8W6Pa2ZxK5CaigHsqsQ84lhOy58pIYa7vGp4j/J1lS+zRLo3v/V0uJ2RThfM3O2T7EEO/YtEzd/ajDPCmnPQNWXZ2RvMtwlJzJwO7qZrEBvpu862x6XjghYJSWA1j5UFWhSwihJXja96QIT7TnyVVRQEKmNq2+m0xSWdV2O/bSYfvje9uNnFEY3ymA4y10pzMzSBrzV28svS3ZNPgdkx0fxt+VNdvjNrSeGXkMgSnmrQi3zWcUtWhQvj4XM1g6muF+87XhQutUo/vWMM2xWqfhkU1vO2lGd5q/OjdMFE8iy813AZ6eICczbA+Al1BaX1ID6Axl8qGfZLXKsEaz5U4FJTRG4PgHqbbq0fh2FQeVroHu2RPsHPQ2lIbVvxEEKHue7own/hAyYbuT7PfFrKKn8/NhmkB/ICJvqxEj9rBqu+9ZPiVe5hR8kdriNsgDP/UszK8BFlBl6/WWavo7E8B3VzkdGQ
DKIM-Signature: a=rsa-sha256; bh=yY2Xz/fp4lS6NU8easFgrBKM8rObd8jIEEfNk1zBCE8=; 
 c=relaxed/relaxed; d=kaod.org; h=From; s=ovhmo393970-selector1;
 t=1784285847; v=1;
 b=n7VH8hTJaOycZo6/YC9ME+xse6j9NKxwDZ+cz9kDLo3NLZTf5AvGntiBu7qwNW9jQ6nhQLto
 xEYIyEQYL2HHRwgad7MUbzzLu/mlqgmhLCMJalXYhPudjHu6OgEQ88gExyAxKhoxq2bDPWoF94I
 BNP7uJiO/5cvhTRHT4DYvnmDg/uYuON9H6maoT83cywSwyyNviAk10Js47YZo/38y4wEq6JoX8q
 alSDETbAjmPDDsA4dbRZYOSlZsqEJwK4k0trUxlnQcZsKVKCydR/3PHIGof6udAyvKT62Y6mWjn
 94InHy30AyN+rbxXcLFE+AaKLhoFghg0vWmEhatCwvbNQ==
Received-SPF: pass client-ip=51.210.91.24; envelope-from=clg@kaod.org;
 helo=smtpout5.mo537.mail-out.ovh.net
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

On 7/7/26 11:15, Emmanuel Blot wrote:
> hw/sensor: Add new device emulation for TI ADC128D818
> 
> This is a 12-bit, 8-channel ADC I2C device, which is used on several
> OpenBMC platforms.
> 
> QOM properties can be used to change input ADC values and external VREF at
> run time.
> 
> Add it to AST2600-based Anacapa machine, along with some functional tests
> that use QOM properties to inject voltage values into analog inputs.
> 
> Datasheet: https://www.ti.com/lit/gpn/ADC128D818
> 
> To: qemu-devel@nongnu.org
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@mailo.com>
> Cc: Fabiano Rosas <farosas@suse.de>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Cc: Troy Lee <leetroy@gmail.com>
> Cc: Jamin Lin <jamin_lin@aspeedtech.com>
> Cc: Kane Chen <kane_chen@aspeedtech.com>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Alexander Hansen <alexander.hansen@9elements.com>
> Cc: William de Abreu Pinho <williampinho@meta.com>
> Cc: Emmanuel Blot <eblot@meta.com>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
> 
> ---
> Changes in v6:
> - Update wait_adc128d818_value in tests/functional/arm/test_aspeed_anacapa.py
>    to reduce timeout and max number of retries to read from adc128d818
> - Replace UTF08 EM DASH characters with ASCII ones in tests/functional/arm/test_aspeed_anacapa.py
> - Link to v5: https://lore.kernel.org/qemu-devel/20260701-i2c-adc128d818-anacapa-v5-0-fe8292d86b38@free.fr
> 
> Changes in v5:
> - Change author/committer/signed-off-by address to circumvent SMTP issues
> - Link to v4: https://lore.kernel.org/qemu-devel/20260701-i2c-adc128d818-anacapa-v4-0-89d6a2febb26@meta.com
> 
> Changes in v4:
> - Better follow QEMU coding style (lowercase hex number, signed integer
> constants, parent object variable name in Device)
> - Split adc128d818 test large commit into smaller ones
> - Link to v3: https://lore.kernel.org/qemu-devel/20260627-i2c-adc128d818-anacapa-v3-0-cfb94270a980@meta.com
> 
> Changes in v3:
> - Update anacapa test image with proper DTB
> - Make I2C device in i2c_slave_create_simple a child of the I2C bus
> - Simplify tests/functional/arm/test_aspeed_anacapa.py
> - Use g_test_message rather than fprintf
> - Keep review trailers
> - Link to v2: https://lore.kernel.org/qemu-devel/20260617-i2c-adc128d818-anacapa-v2-0-fd38764f0465@meta.com
> 
> Changes in v2:
> - Remove clang-format useless comment sections
> - Link to v1: https://lore.kernel.org/qemu-devel/20260612-i2c-adc128d818-anacapa-v1-0-9e4640cd164b@meta.com
> 
> 
> Emmanuel Blot (9):
>    hw/sensor: adc128d818: add 12-bit 8-channel ADC device
>    tests/qtest: adc128d818: add test harness and register access
>    tests/qtest: adc128d818: test voltage and temperature conversion
>    tests/qtest: adc128d818: test limit interrupts
>    tests/qtest: adc128d818: test operating modes and power control
>    hw/i2c: parent slaves created with i2c_slave_create_simple
>    hw/arm/aspeed: anacapa: use ASCII in comments
>    hw/arm: anacapa: add ADC128D818 devices
>    test/functional: anacapa: test ADC128D818
> 
>   hw/arm/Kconfig                              |   1 +
>   hw/arm/aspeed_ast2600_anacapa.c             |  27 +-
>   hw/i2c/core.c                               |   3 +
>   hw/sensor/Kconfig                           |   4 +
>   hw/sensor/adc128d818.c                      | 696 ++++++++++++++++
>   hw/sensor/meson.build                       |   1 +
>   hw/sensor/trace-events                      |   8 +
>   include/hw/i2c/i2c.h                        |   7 +-
>   include/hw/sensor/adc128d818.h              |  14 +
>   tests/functional/arm/test_aspeed_anacapa.py |  68 +-
>   tests/qtest/adc128d818-test.c               | 856 ++++++++++++++++++++
>   tests/qtest/meson.build                     |   1 +
>   12 files changed, 1671 insertions(+), 15 deletions(-)
>   create mode 100644 hw/sensor/adc128d818.c
>   create mode 100644 include/hw/sensor/adc128d818.h
>   create mode 100644 tests/qtest/adc128d818-test.c
> 

Applied 1-5,7 to

     https://github.com/legoater/qemu aspeed-next

Thanks,

C.


