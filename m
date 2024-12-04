Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp4242071njk;
        Tue, 3 Dec 2024 22:00:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXItulOv+gnGqg2nDQUW9NQtY+u2OjjLVsWw3IFD85LL/Gbo0NjhloCVjLwg/JDrdr5eWBeH1mu6bhuKg==@linaro.org
X-Google-Smtp-Source: AGHT+IEx62stTrC92i3Ba7GeUDO71MKAQG9YuWeLslwoh7ZhaywK9RBHU7BvU3DB1bEd8sm2JaKh
X-Received: by 2002:a05:6122:a25:b0:515:5008:118d with SMTP id 71dfb90a1353d-515bf2a393bmr7063271e0c.2.1733292030077;
        Tue, 03 Dec 2024 22:00:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733292030; cv=none;
        d=google.com; s=arc-20240605;
        b=HEjTCTLKdoJJUv2zllbV7viU7Sosq9ExDDM9wB61J2EU970TpBtvrnucoUvekZU7bA
         UwF4M2pbSY4+xypV3+6P9FV49irT0Kr+qUiBZHGGDwDvz+W0wZ9HMGr/ReHL9V+i8rDt
         dJujubdu5SvMp9q9wHJqWmWIYrwn0hlOCqDJ3wocoaJnsBz9rHhJYyxDPKOBjV5w8yJl
         ph/6sF0L8OTcG1ZHJ48KlXcJVmSqaPasLNfzpxR5HOS1Jrs4a87uHmyBzD026cqmpRE8
         07CuTW8CzE8DAxGqAugx8c9u84QJdKmBNqA+9KCE+ffqNFuoJ07WsKb3kV1KDlNLD+Qa
         5QjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KWMxp72gDfDEbetPrP7duXBl1wy0ey/eTbWhr+s1CwU=;
        fh=SlYKEarRkoEX5I+v/SupacZL94SBy1LbFuJOrFpIiIU=;
        b=AWeZODKRnYBZyTifx/L2kP5QcS06PYItEIMVWAI1sOZCM2oAkU/R083QRLcxobw7+P
         2KJrzO1DCfGubr6Q4/hnw999lU5j2FSd1n2w84wDEE8abLbsMg9wz5Hx3D0Sh65c2f7o
         LSOkc9jQvaEZyvofowO4B3gXf3V/MyWXuu8w7WyBVIFxfoBRXGFaFTrE3gajBDrwVSYH
         cSh8EqTM1sohb4ZJODeJTmXxvvgG4QlG4t9tZjg+BqjG5Sn6v0sSp23cLJ05u2Ex50r2
         eR2DIEVow+VVSSfLsewQYj1mdewPP30ZY1D4Rcm49ZSOyyX3L406RfFhaywL+N89QfDS
         T1JA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7ZNAbs7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5156cbefb73si5676204e0c.53.2024.12.03.22.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 22:00:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X7ZNAbs7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIiQY-0005P0-A4; Wed, 04 Dec 2024 00:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIiQM-0005Mh-1v
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 00:59:49 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIiQJ-0004Vx-Jb
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 00:59:45 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa5b0d8bd41so815193366b.2
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 21:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733291980; x=1733896780; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KWMxp72gDfDEbetPrP7duXBl1wy0ey/eTbWhr+s1CwU=;
 b=X7ZNAbs7GqN63nxeUtxL8KMCTFzLcVC29wOl7N08pBvrsD1TOCotj2pJSZxfYBNDZy
 haDJK0F8xfa1YZ6QgYQEfj2SR1uTv8ZKht4wcKGfMlxm1jxrp1d9QIqcydA1zgsqAtnO
 xNRbTOE2Ho0q5vwgiIh1V6wF+drSMHZgcUdkrB5Zt91xrIG3QAdG/eJgqOlhRVJDaOue
 8Sky2W3aMUSvC5wkVLA0nwQvWJbo3sZk4RxW3zJE3bS8M3QGccU3hieJs2L2aujodCUF
 4PBzFsUG8fTEKNwcAB26HuE5vT6pp4q1yVlzXx5FXWhDuqgs88RsRsFOkRoWr147Y6MR
 I3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733291980; x=1733896780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KWMxp72gDfDEbetPrP7duXBl1wy0ey/eTbWhr+s1CwU=;
 b=R2IHVhQzdQuEj9rAIGOADfBAQioTe0oNWVEwG7vH4Niw+gSSJKHFy2GYX4VN8YnDFg
 9O2uniA5QnmP90lnUJIhV0pTLB78yPrWtZj13XHca7iW19nJNaAqszBWSiW5tXI4HcuI
 Qo2iJHL0Wm+K7bOaUyWzEvn183wgORJ+xSEbw8wybkd2Qvg27Rbh+/Xc6/ErgQZzikZF
 avYIh7lpyYwk1eXe2n6zg1G4AHxnYa/kXI4hULsKgq5Gx4EXm8QtLSC9ho5LDoO4YDhh
 gexo7sMjVda947v7CtkaAyuQVj7tB0Tqw+JQunIWfzed6jWfqKLU3qz3sif5hEd/jaIZ
 mp7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXbGJJway21AnGbLk9uWT4ei41RFdQXrvY/pRnrp5ZY1Wyx3jrlc68h4V34c0/iv6izIz1yU0HoQ==@nongnu.org
X-Gm-Message-State: AOJu0YzB/RMMx2ds21jjqOnxcWMchTuk4Y6GKPbTueXat36Oste3/oMq
 mkIQOdOMdivLLMxcHbypNoq7qxE3F2nPguYA9UL07oGEn0vIqdtS/DtBzpeIEdk=
X-Gm-Gg: ASbGnctURMQw704cCKmEpUVY+jDULliC84OLN1tjDIi4vqgRKF5/R8Gh6wDD8i8c1qN
 UeD2yjKnJyViF2OH/f/3RSw173b5NjZeMOV5yIzmd/1Tiy9m4oVZnlr8Zd5XczbaYyAnPI4wgub
 iX3Cai/K/gpJ94kfPgcNPQ6vMAgWxxOxl5Dy4S2LayUJqCrhJonL/Nhgl8x2/0xY1WBrDioSVWN
 bSeBRbmMSwTjTh2JziMpb92xADAyXPivgo7ZKbCGsCgoAuVkXaR6kyPkwMZqEkjdApc6xY88OJE
 /IlmlMUgtXksgR1Lwh51IMPplqv+qPM/+sc5UERO7Q==
X-Received: by 2002:a17:907:762d:b0:aa5:1d33:dc10 with SMTP id
 a640c23a62f3a-aa5f7f0b58bmr347232666b.45.1733291979772; 
 Tue, 03 Dec 2024 21:59:39 -0800 (PST)
Received: from [192.168.69.223] (sml13-h01-176-184-15-95.dsl.sta.abo.bbox.fr.
 [176.184.15.95]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997d560asm694899866b.61.2024.12.03.21.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 21:59:38 -0800 (PST)
Message-ID: <793ffece-66b6-4201-bc78-cc774d8ec35b@linaro.org>
Date: Wed, 4 Dec 2024 06:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] hw:sdhci: Introduce a new "capareg" class member
 to set the different Capability Registers.
To: Jamin Lin <jamin_lin@aspeedtech.com>, Bernhard Beschow
 <shentey@gmail.com>, Jamin Lin via <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
 <20241203021500.3986213-4-jamin_lin@aspeedtech.com>
 <94E62126-BB97-465A-9021-2FB365E677A8@gmail.com>
 <SI2PR06MB5041216ED78069F9BBE4275FFC372@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <SI2PR06MB5041216ED78069F9BBE4275FFC372@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QHrKvKo67RYl

On 4/12/24 04:14, Jamin Lin wrote:
> Hi Bernhard,
> 
>> Subject: Re: [PATCH v2 3/6] hw:sdhci: Introduce a new "capareg" class member
>> to set the different Capability Registers.
> 
>> Am 3. Dezember 2024 02:14:57 UTC schrieb Jamin Lin via
>> <qemu-devel@nongnu.org>:
>>> Currently, it set the hardcode value of capability registers to all
>>> ASPEED SOCs However, the value of capability registers should be
>>> different for all ASPEED SOCs. For example: the bit 28 of the
>>> Capability Register 1 should be 1 for 64-bits System Bus support for AST2700.
>>>
>>> Introduce a new "capareg" class member whose data type is uint_64 to
>>> set the different Capability Registers to all ASPEED SOCs.
>>>
>>> The value of Capability Register is "0x0000000001e80080" for AST2400
>>> and AST2500. The value of Capability Register is "0x0000000701f80080" for
>> AST2600.
>>>
>>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>>> ---
>>> hw/arm/aspeed_ast2400.c      |  3 +-
>>> hw/arm/aspeed_ast2600.c      |  7 ++--
>>> hw/sd/aspeed_sdhci.c         | 72
>> +++++++++++++++++++++++++++++++-----
>>> include/hw/sd/aspeed_sdhci.h | 12 +++++-
>>> 4 files changed, 78 insertions(+), 16 deletions(-)


>>> diff --git a/include/hw/sd/aspeed_sdhci.h
>>> b/include/hw/sd/aspeed_sdhci.h index 057bc5f3d1..8083797e25 100644
>>> --- a/include/hw/sd/aspeed_sdhci.h
>>> +++ b/include/hw/sd/aspeed_sdhci.h
>>> @@ -13,9 +13,11 @@
>>> #include "qom/object.h"
>>>
>>> #define TYPE_ASPEED_SDHCI "aspeed.sdhci"
>>> -OBJECT_DECLARE_SIMPLE_TYPE(AspeedSDHCIState, ASPEED_SDHCI)
>>> +#define TYPE_ASPEED_2400_SDHCI TYPE_ASPEED_SDHCI "-ast2400"
>>> +#define TYPE_ASPEED_2500_SDHCI TYPE_ASPEED_SDHCI "-ast2500"
>>> +#define TYPE_ASPEED_2600_SDHCI TYPE_ASPEED_SDHCI "-ast2600"
>>> +OBJECT_DECLARE_TYPE(AspeedSDHCIState, AspeedSDHCIClass,
>> ASPEED_SDHCI)
>>>
>>> -#define ASPEED_SDHCI_CAPABILITIES 0x01E80080
>>> #define ASPEED_SDHCI_NUM_SLOTS    2
>>> #define ASPEED_SDHCI_NUM_REGS     (ASPEED_SDHCI_REG_SIZE /
>> sizeof(uint32_t))
>>> #define ASPEED_SDHCI_REG_SIZE     0x100
>>> @@ -32,4 +34,10 @@ struct AspeedSDHCIState {
>>>      uint32_t regs[ASPEED_SDHCI_NUM_REGS];  };
>>>
>>> +struct AspeedSDHCIClass {
>>> +    SysBusDeviceClass parent_class;
>>> +
>>> +    uint64_t capareg;
>>> +};
>>
>> The struct seems not AST-specific and could be turned into a base class for all
>> SDHCI device models, no? That way one could also add further device-specific
>> constants other than capareg.
>>
> 
> Thanks for suggestion and review.
> 
> The common sdhci model(sdhci-internal.h) had this "capareg" property to make specific SDHCI model of ASPEED SOCs
> to set the different value Capability Register such as aspeed_sdhci.c
> https://github.com/qemu/qemu/blob/master/hw/sd/sdhci-internal.h#L318

DEFINE_SDHCI_COMMON_PROPERTIES() only sets default values,
you can overwrite them in your class_init().

> 
> In the previous design of aspeed_sdhci.c, it set the hardcode value of Capability Registers for all ASPEED SOCs.
> This patch set the different value of SDHCI Capability for AST2400, AST2500, AST2600 and AST2700.
> Thanks-Jamin
>> Best regards,
>> Bernhard
>>
>>> +
>>> #endif /* ASPEED_SDHCI_H */

