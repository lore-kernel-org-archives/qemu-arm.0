Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp398203ejb;
        Wed, 15 Feb 2023 03:10:14 -0800 (PST)
X-Google-Smtp-Source: AK7set9b8Nv77iB8lPKQqH4RrXN9hyws1nQ4c9B3L1LkUvfs0QGXVB85GHoc4c14MpkPkNRESxSl
X-Received: by 2002:a05:622a:304:b0:3ba:336a:d325 with SMTP id q4-20020a05622a030400b003ba336ad325mr2865351qtw.14.1676459413878;
        Wed, 15 Feb 2023 03:10:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676459413; cv=none;
        d=google.com; s=arc-20160816;
        b=Egrfv6RIjkfGeMbZVsiOpcC9u5AuYIl4uLHce86hF9YhzIYPSX+wvG5XUQRxtrednS
         2/HVp9ZJLz0vPVOiqK6PKDVR0C3W3aB28cvSHv67W6LVPdzaWSnYK5BqY1yqQadqM+AN
         XMyq9acM44CUAey584hmHcCEvpgKzYDkuK3D8AyEG4sQaV7E9b5DyoMPCGzcFt9ijW9K
         MnpkQfE3iWIFtB0Gwfx98OYn5Cqo3SuWuDVdobhhp33yaXI1SuQlNdX86byhSCld4VtA
         W6gho7MMXR+kuKE7oPQ5vdePHCvbp5gw7oTOo6q75AhbIWJIXCVc90BTApc0PdpAV9Ly
         LzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=RR0gPys/zFKaq7KZg+aZVBEZY1VeznCKk+BqI6JyCNU=;
        b=pxyW0z03ftP3dc9Jz8I6LMUSliiRHmPoZ5VfyCi57NPPPl8jk0Vp6tC0lExfYoUxkR
         1qlfOYXsw0fm3s/cWKLa5mAr7aMCTeDwwimW3runZebMWH9Kx0PDZKFYy0Q548yZfqiL
         AptQBNkdkJpKH/obXhWOcTzLeoCJG4bGPZx/K5LOhgONsp2A5nhbBTxFEQXZXldB0m8C
         GTetrhXHV6jKnsYpx5sHW2b+E6GpkCyDi+fyUixOiwfioYrLLZih9Gm5ikU3BOYojz/T
         MSYf/K4gaACALBejPtll45DGWkvryrTz0U76y3NZd6xe7tE4rHw2NxsJcQczwpN27ciC
         s9Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs36-20020a05620a472400b006fa696cce73si14973167qkb.497.2023.02.15.03.10.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 03:10:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFfk-0003qg-Pl; Wed, 15 Feb 2023 06:10:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSFfj-0003qH-HE
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:09:59 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSFfg-00041q-B3
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:09:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.249])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 733472B114;
 Wed, 15 Feb 2023 11:09:51 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 15 Feb
 2023 12:09:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005e4979293-5ed1-4691-b380-76b2d6df81e3,
 38A6E00C82B2D95FDD0C44CB66D888AEA19A4E6B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <32521fbd-df47-6c7d-d515-4da185e6acfa@kaod.org>
Date: Wed, 15 Feb 2023 12:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/8] hw/misc: add a toy i2c echo device
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <qemu-block@nongnu.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Klaus Jensen <k.jensen@samsung.com>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-4-clg@kaod.org>
 <e268d089-259f-07f2-6429-9eff461992f4@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e268d089-259f-07f2-6429-9eff461992f4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 2c4e1501-cf0e-43ff-8767-52e9e0df804f
X-Ovh-Tracer-Id: 13654632598264777519
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeihedgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhteegffdvieegleelvddtffehveevgedtudeujeduueekieeivdefteeileeileenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhivdgtqdgvtghhohdrtghsnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdprghrmhgsrhhusehrvgguhhgrthdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrh
 hordhorhhgpdhkrdhjvghnshgvnhesshgrmhhsuhhnghdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rx7itWBxaC0D

On 2/15/23 11:55, Philippe Mathieu-Daudé wrote:
> On 14/2/23 18:18, Cédric Le Goater wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> Add an example I2C device to demonstrate how a slave may master the bus
>> and send data asynchronously to another slave.
> 
> What a rebellion...
> 
>> The device will echo whatever it is sent to the device identified by the
>> first byte received.
>>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> [ clg: - Changed to build to use CONFIG_ASPEED_SOC since only supported
>>           on such SoCs
>>         - folded in these fixes :
>>              https://lore.kernel.org/qemu-devel/Y3yMKAhOkYGtnkOp@cormorant.local/
>> ]
>> Message-Id: <20220601210831.67259-7-its@irrelevant.dk>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/misc/i2c-echo.c  | 156 ++++++++++++++++++++++++++++++++++++++++++++
>>   hw/misc/meson.build |   2 +
>>   2 files changed, 158 insertions(+)
>>   create mode 100644 hw/misc/i2c-echo.c
> 
> 
>> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
>> index 448e14b531..3eb1bda710 100644
>> --- a/hw/misc/meson.build
>> +++ b/hw/misc/meson.build
>> @@ -129,6 +129,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
>>   softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
>> +softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('i2c-echo.c'))
> 
> s/CONFIG_ASPEED_SOC/CONFIG_I2C/ since this is a generic device.

even if only supported by the Aspeed SoC ? I am OK with both.


> 
>>   specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
>>   specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))
> 

