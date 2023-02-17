Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1281276ejb;
        Fri, 17 Feb 2023 00:25:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+IJ4VGfoQCHq39ftvBCddHt6+A677EuWlJq2TC2wg8skKK2NoIvfP5saXv5Uz2Fqagth2B
X-Received: by 2002:a05:6214:c8b:b0:56e:b2ad:e2ea with SMTP id r11-20020a0562140c8b00b0056eb2ade2eamr15285687qvr.27.1676622316578;
        Fri, 17 Feb 2023 00:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676622316; cv=none;
        d=google.com; s=arc-20160816;
        b=VKEKPNj7gL4zFWNwWe4/t+VfuyiPTOPk7LEWXInDn53emggzd4Yu0xQXyTYd03QUPE
         dsfhBYs39wKccr2o2+pgwZsoSt4gYlXUuOUOO+JoUehyVUyCuqUpWYGhA8y+spzkvHxR
         jSW1pk5FJfznRhXn2J2veqC1wmmEAPTSGN+u/N5qUc7GbygbiJS1KCl/81YUaiDcyqc5
         nxB75C5BAFKjrSi707fO6CNrcNrTkK9doo8b2HA/Vfvk1sdizosBSJqXXmD08JBcknQk
         XPbWoezwXLCV5/GCUCbP8XfnZ09dj8EztmLnysh2eAIiAqmfDXKgmurdt2SCdOcn8QeT
         YY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=b42FOPg0IfwVea8wBarKwqwv4ReHtToXIduZw1vmMwM=;
        b=MyCjvIsgXaky3MURe3UFUgSA7H5BYBEXHUEkHzUHFsi524D0qAnBLd6a0MeGbe/Nur
         P/y+wT2pqKkYH5RRs4vvjNSUOm7e31e3097iqPgO2kaawMYrUNw27F/TwY+zjIC+PDaJ
         MEw+2MRx/hpMFD6lxJlmCAhWDIhf+KCCdPOQIE2d/ZKgE/ngd/8iPucm7uRnofy+3gSb
         1EuDniuG5QpXBKFUPv/rkQGuoXXm/YzLnpZ0+TQO0vpLG084rFZPDdTxIYne9vikoN2Y
         rEiAzOg9ZWPbIsqqrXjnSAMdZ8qU6HP+v5+o2P34amfdukeZx04WbHtouEyJ+QwnXIuL
         SBbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020a0ce392000000b0056e8ecf84d3si2833578qvl.246.2023.02.17.00.25.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Feb 2023 00:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSw32-0006E3-4T; Fri, 17 Feb 2023 03:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSw31-0006DQ-80
 for qemu-arm@nongnu.org; Fri, 17 Feb 2023 03:24:51 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pSw2x-0004IK-SQ
 for qemu-arm@nongnu.org; Fri, 17 Feb 2023 03:24:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.28])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 87C52201EE;
 Fri, 17 Feb 2023 08:24:42 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 17 Feb
 2023 09:24:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003fed51f18-4f18-4ad5-b2f9-411ae549d632,
 D8AD3BA2C27EEBE7B4560DA8411A9B1E3CFED360) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <aab8aa7d-7c93-1ef1-ed6f-6851714e85cd@kaod.org>
Date: Fri, 17 Feb 2023 09:24:40 +0100
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
 <32521fbd-df47-6c7d-d515-4da185e6acfa@kaod.org>
 <38d7b71e-4908-6cc2-0e4f-a08d3a11cdf7@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <38d7b71e-4908-6cc2-0e4f-a08d3a11cdf7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d5d6fc00-1ef9-4c89-8a7f-a543aeb7a48b
X-Ovh-Tracer-Id: 4164140805829135151
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeikedguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfetgeffvdeigeelledvtdffheevveegtdduueejudeukeeiiedvfeetieelieelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihdvtgdqvggthhhordgtshenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrg
 hrohdrohhrghdpkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zD8K2/D5tNY9

On 2/15/23 13:26, Philippe Mathieu-Daudé wrote:
> On 15/2/23 12:09, Cédric Le Goater wrote:
>> On 2/15/23 11:55, Philippe Mathieu-Daudé wrote:
>>> On 14/2/23 18:18, Cédric Le Goater wrote:
>>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>>
>>>> Add an example I2C device to demonstrate how a slave may master the bus
>>>> and send data asynchronously to another slave.
>>>
>>> What a rebellion...
>>>
>>>> The device will echo whatever it is sent to the device identified by the
>>>> first byte received.
>>>>
>>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>>> [ clg: - Changed to build to use CONFIG_ASPEED_SOC since only supported
>>>>           on such SoCs
>>>>         - folded in these fixes :
>>>> https://lore.kernel.org/qemu-devel/Y3yMKAhOkYGtnkOp@cormorant.local/
>>>> ]
>>>> Message-Id: <20220601210831.67259-7-its@irrelevant.dk>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>   hw/misc/i2c-echo.c  | 156 ++++++++++++++++++++++++++++++++++++++++++++
>>>>   hw/misc/meson.build |   2 +
>>>>   2 files changed, 158 insertions(+)
>>>>   create mode 100644 hw/misc/i2c-echo.c
>>>
>>>
>>>> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
>>>> index 448e14b531..3eb1bda710 100644
>>>> --- a/hw/misc/meson.build
>>>> +++ b/hw/misc/meson.build
>>>> @@ -129,6 +129,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
>>>>   softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
>>>> +softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('i2c-echo.c'))
>>>
>>> s/CONFIG_ASPEED_SOC/CONFIG_I2C/ since this is a generic device.
>>
>> even if only supported by the Aspeed SoC ? I am OK with both.
> 
> Any machine exposing an i2c bus can use this device, isn't it?
> 
>    -device i2c-echo,bus=bus69,address=0x42 ...

Would you have a machine with I2C buses and image to try that on ?
Not an aspeed one obvioulsy

Thanks,

C.

