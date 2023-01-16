Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1300980ejc;
        Mon, 16 Jan 2023 03:14:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtnxvmK+jPwQFXNRy2PR1r8S2nEo40CfUu1v3SLlC5oRNRD0E0ez4zyl/EXdkeIJ0J4Hqgb
X-Received: by 2002:a05:622a:c:b0:3ab:b78b:c3cf with SMTP id x12-20020a05622a000c00b003abb78bc3cfmr94425737qtw.60.1673867673814;
        Mon, 16 Jan 2023 03:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673867673; cv=none;
        d=google.com; s=arc-20160816;
        b=FekPZzMo5modvEaSx9nQrrxboiqN47pfhzcw+ladPjDsww3lg+hrGzUCaPBbYA6Ujc
         jvoSDS4vrr8kVdSm9K0oJ7ER+VBOW6uGNpLGsEkcNWO5EPFMz0KwAujycoDGBCFuEODb
         Y1IUG6eh2etd0ak2fQYWDxTpk9wLuySe1RkTvvxZ9WC0rd8qpeEjoz1JdmQlH73qpkq5
         TdAiHIyiaj5RJsqg8ZFwWAE4fw1HbOq68+NvNv7H3a0DHAKOkteo7ppkMS1JWm5j9zuW
         /tDKqyneT530jLs+oGXtmvsHXsLursgTKWlZ7iJ2Rh5NCrVbb2joxeFxHPl/HM4NdDNs
         rf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=3knOhES4LtnEojHuN1IhiwKuJRdIEd0XmoOBonfIyxI=;
        b=PmTIi3X3p5BfAeWnzhGfOx+kHQ0aVIuaRF+PiAWg+2g93Lbib4z9QsC1ZZ4hVuNp8W
         caJIJxwGe6meLDHBvNyMWc5j2zIz9OiEWnrPznGU79zhJbgcsfLkywVTEg9aVBo+gMXb
         lPLoLj4R7ZBXMUQbOcPbRkl47a2viXZPxnEhSg9P37Cf+1pv9W/OxVYg6dqTa8q6391D
         clS2v3tKjG59AdDWVFWid0Uo2Kzy37fx7ovLaj7XM3tbM5js2d5A8hyB/HPfH9gLUNk4
         2swFiH3lSW3asdTttZ2cVpEzI+fHozfTFPtYB4G7izlLv7mApdbAdLtGj3IvquhzmH6X
         rnow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05620a0bcd00b007050429a603si18091485qki.47.2023.01.16.03.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 03:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHNRS-0004hI-VG; Mon, 16 Jan 2023 06:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pHNRR-0004gJ-39; Mon, 16 Jan 2023 06:14:17 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pHNRO-0005R7-Bj; Mon, 16 Jan 2023 06:14:16 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 83277217A7;
 Mon, 16 Jan 2023 11:13:36 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 16 Jan
 2023 12:13:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001c9009280-f149-47d5-a70c-ddaa69851e32,
 9562F276D9C9043C19838F7BDA7B87DE9C964FD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3413fbee-f200-2b4b-4132-1bac82d1fdbd@kaod.org>
Date: Mon, 16 Jan 2023 12:13:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/6] hw/nvram/eeprom_at24c: Add header w/ init helper
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <patrick@stwcx.xyz>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <hskinnemoen@google.com>, <kfting@nuvoton.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-2-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230114170151.87833-2-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f584dca1-1c10-41bb-9a1c-26291dd66cd6
X-Ovh-Tracer-Id: 3557843709873654575
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtgedgvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrsehpjhgurdguvghvpdhprghtrhhitghksehsthiftgigrdighiiipdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhhshhkihhnnhgvmhhovghnsehgohhoghhlvgdrtghomhdpkhhfthhinhhgsehnuhhvohhtohhnrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmoh
 ehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vw3f73mApQYz

On 1/14/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Please add some short commit log explaining how the helper could be useful.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/nvram/eeprom_at24c.c         | 10 ++++++++++
>   include/hw/nvram/eeprom_at24c.h | 10 ++++++++++
>   2 files changed, 20 insertions(+)
>   create mode 100644 include/hw/nvram/eeprom_at24c.h
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 2d4d8b952f38..0c27eae2b354 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -12,6 +12,7 @@
>   #include "qapi/error.h"
>   #include "qemu/module.h"
>   #include "hw/i2c/i2c.h"
> +#include "hw/nvram/eeprom_at24c.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/qdev-properties-system.h"
>   #include "sysemu/block-backend.h"
> @@ -128,6 +129,15 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
>       return 0;
>   }
>   
> +void at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", address);
> +    DeviceState *dev = DEVICE(i2c_dev);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> +}
> +
>   static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>   {
>       EEPROMState *ee = AT24C_EE(dev);
> diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> new file mode 100644
> index 000000000000..9d9cf212757c
> --- /dev/null
> +++ b/include/hw/nvram/eeprom_at24c.h
> @@ -0,0 +1,10 @@
> +/* Copyright (c) Meta Platforms, Inc. and affiliates. */
> +
> +#ifndef EEPROM_AT24C_H
> +#define EEPROM_AT24C_H
> +
> +#include "hw/i2c/i2c.h"
> +
> +void at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
> +
> +#endif

