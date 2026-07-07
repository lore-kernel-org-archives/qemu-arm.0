Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CF6C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:45:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh2Mv-0000BQ-MS; Tue, 07 Jul 2026 05:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1wh2Mp-0000Aq-AA
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:45:28 -0400
Received: from smtpout4.mo538.mail-out.ovh.net ([51.210.91.33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1wh2Mm-0001k9-TX
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:45:27 -0400
Received: from director5.derp.mail-out.ovh.net
 (director5.derp.mail-out.ovh.net [57.128.106.70])
 by mo538.mail-out.ovh.net (Postfix) with ESMTPS id 4gvbtk5cLxz5xLP;
 Tue,  7 Jul 2026 09:45:18 +0000 (UTC)
Received: from director5.derp.mail-out.ovh.net
 (director5.derp.mail-out.ovh.net. [127.0.0.1])
 by director5.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <alexander.hansen@9elements.com>; Tue,  7 Jul 2026 09:45:18 +0000 (UTC)
Received: from mta3.priv.ovhmail-u2.ea.mail.ovh.net (unknown [10.109.249.175])
 by director5.derp.mail-out.ovh.net (Postfix) with ESMTPS id
 4gvbtk2g1sz7tHJ; Tue,  7 Jul 2026 09:45:18 +0000 (UTC)
Received: from kaod.org (unknown [10.1.6.3])
 (Authenticated sender: clg@kaod.org)
 by mta3.priv.ovhmail-u2.ea.mail.ovh.net (Postfix) with ESMTPSA id 5910A12E3D64;
 Tue,  7 Jul 2026 09:45:16 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005b175fd4d-4e5d-4216-a678-15cf679225e2,
 7260B8E4F09D2588E97168B383347FBEBF8FD1E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c3f00d2f-9ae1-4a11-9418-fb8f9d31aaa8@kaod.org>
Date: Tue, 7 Jul 2026 11:45:15 +0200
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
x-ovh-tracer-id: 14604610644839148589
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFzbzFi5ByJiQax2voEFUExPHNIOjbGtgfqHQqqwV5zEzixoN2V+Ecqg9L+2+Ha2bHONqpNvFOFWwGAxv4X5Mst4wzTgkDAFZYHvnBDhDAjNI4WNDThTT1dHmEsNmJez6xmFW59o7r74Glj3ZKRQhj58lLfL1gspIlGgsLjNWDvjMPsSC88vwWiIVdZ40Ga7jqsnbfsE5v0aqEr5H0Dhkujgb6hfDKBykQfQUHCBDIBAj3EL8S5/iZRFVvSGoWCoG1W7VPgjVVlbOVqYovallbNiTvCDytQ8KXMcC9epe7sfzHgPI9PzJJO+Fm/VVYVkJk5ikKXOZmRRlRSgU/YZvVIMEGI9g8oKarWxaUp4B2hh5RCDArWmsJQL7O8bVHzUz4Twx9h4U2XfCyCr1AKSdAYN0oElo7h2sqIQMZKm7/Fr6tN2JSk2b+YhoukHXuIYdz+l0jCj9PECgAFWe9B9pcR0uNBE10HM3RpJ4wnvN45OrUZeHzfcdmj4kGzNrV9bvcmV9YxJCdHhIHqweaTm2BFL7l7D9OUKlBQWgrmqJVxwjQU/HKFdaX2OIkTGFiWe7q9fZDsFVMGux+K+Y5JOrUcGPomrwcMFNTR3qB1GxkQKseERvMn1HsuHJvzPcjFupfu5FyL1GvtPsVXAQApOQVjCsHpjEtmDH6x+IZpV/VNMw
DKIM-Signature: a=rsa-sha256; bh=Z+ufVyMM+dMuC3TVgr8wdipMG4QbyP88P7QNVK/Imog=; 
 c=relaxed/relaxed; d=kaod.org; h=From; s=ovhmo393970-selector1;
 t=1783417521; v=1;
 b=tgAhgEWIXn8UFIQjGU7Kyp6pFvZpLb1Dt2z8fAmyJ5hk8NAGHFtKtu4PS04t1ch2uyG8uulM
 ol1onnr2k51rHVKMbDqCWUpucI+U4Ks1f09XaWVlr2kpnULOo3Fk9UFdE2/cbrbw0VOK12iY1TN
 HrLtlB184NMP4bBJgKHfYZEng4U6sRQvmMVJDe1HnAJk2QrrdyB79gU21+W691hFI/o+FlWGBn1
 1npJialHBfMP4nVuFQKaub3ANR8ui05lFoin/4Bkp2V8QaoCYI+Eu5HYs8RgedAySldxS7KMI97
 zY4iJJknEapo+hs3ifyTrQ+MK4+Udt2RnKn69kUucK9BQ==
Received-SPF: pass client-ip=51.210.91.33; envelope-from=clg@kaod.org;
 helo=smtpout4.mo538.mail-out.ovh.net
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

Hello,

On 7/7/26 11:15, Emmanuel Blot wrote:
> hw/sensor: Add new device emulation for TI ADC128D818
> 
> This is a 12-bit, 8-channel ADC I2C device, which is used on several
> OpenBMC platforms.


I think this would be a good addition for QEMU. I can merge the
series in the Aspeed queue if someone could please review and ack
the unit test  ?

Thanks,

C.
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


