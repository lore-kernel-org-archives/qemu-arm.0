Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD22CCA470
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Sep 2025 17:36:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3eGj-0001pY-0E; Tue, 30 Sep 2025 13:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1v3eGe-0001mQ-Ej
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 13:36:00 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1v3eGa-0006TJ-DV
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 13:35:59 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-3307de086d8so5696417a91.2
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 10:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759253746; x=1759858546; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=TFe81CTNYwvWQneCAPLWT9qgKRHJ0lFjiIQHJPODoTo=;
 b=Fq1GIbwK+GUjQcvwroChBnFqVvRJSlg83Vwp9Z5dbzNpfegZHXF77HA2FtxqSm8FDR
 xM3rCWvRyDpG8Avu+zpSySEa8HX9FY8Tuq2drqWf8wh+oT+bVPJhsNf1pQbJWPX6dzP9
 hT4+TuhdNIybAULXulhgUgSgWhE0pDzPeq/h3YXvjn/WwB0hWzldYmj/DBNl3iZpFKrc
 kuq9LIFUL++ulRywt8bqIr5np8Wpp/mSShdPlR8WTTdHfsHxwSmpRoQ7ngs4sZm+3ZNJ
 Uiaj59og0ItZHG+8iWQSgvFgq3UsvouyXgHnPgrXd3tKofUM5QwVjV4q8pzfCXpvp+ub
 0cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759253746; x=1759858546;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TFe81CTNYwvWQneCAPLWT9qgKRHJ0lFjiIQHJPODoTo=;
 b=QvW3ONosIDBQeOX5iGTVYpp4HSGXfauFo+uNeBXauThub4r/gvWNSBr4tONE+Fg1QS
 iT9WqhBXOBBYF420g6VhcwuLYXw17J3SIfsyZb4Bbd4r4FC2i2t5jfv+yPA1EOb35ThR
 yBWEeRr5TJJKmLTGyqoPOC5hKy8kqzzF1i12m9JHc77i55sD0TIAL2XVf9CKz3XIysbg
 EZ0CZrrMk5+erzKOIuH9p+HFEFDp4aNUgJdaacnhMsgZX3RLlUQaX+QUcyL8vEyDy/Xe
 v3LIsQzRQxe7vNLlz1o17C3hYIyv7CmRPlQOVlMJoD5aCueAMoJ4sEKfWypV3Nu4NOqe
 QfEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUjmsBl3TDe/Nxb+K+Q0fGBluxcMvlJEBqTDdnxyDYNsJ+HvsOXhYSy3IN8FkiBs+e6qe3EbWh4Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz06sZ77SURGPV4FT6UJgotYLmAhqne7OOnMHiLCC5DQzPWcu5z
 QcxZiU9J2JUHYvkziE30sIhStuBndrzy7od9P2E+0CBjbZFmOlCHuns/
X-Gm-Gg: ASbGncs2pPr2+TU5npvEwAaxOs1J7AKTuiNEofproT0Eisiou6hZcT9idSSXqYn1i/k
 PhmZX1erVR6aPRGbkMm/ZbcIlWAlr/Alsi5d7vBSEggDpfCncr9i1fiEiAwf5WxavcvyjIFrPfI
 foIVWyoDziIUwc6WW1H9qAK8OHQy/I7Ao8Q7V4XRsD3aDaHEYPjVUdzN6vt+iLDLqRzmtP7z3Xs
 8Don4WdIh+wVttJgyVFzeiY1h7euICgD0xgwsCb7FeG2bFf8cQTHIOsjVNbK3qacCU/JqBMeXbg
 evsTq+vySn8CU1MKLBvtfux6PO03biin+GOgs/KqkSGcqMk2bnm8Vt/3vVr3qwDcN5MgqvjCwVp
 ZPRt/TguL6xrPMU/nnLpoCOuVQ/GlMkXW9SExu7e0ncKTLygfr1Ee08EX/+56sLjieJApBJ5Xuv
 62kjmP/8GdciIjiUzMNZp0AgSqfPNyrw==
X-Google-Smtp-Source: AGHT+IHCz8a1iEuee5xlZWTnSPShlBYEvkosMxFoVsbA6YwO2ft+RR5SRTpDENqELKVn4wxCry8kLg==
X-Received: by 2002:a17:90b:1652:b0:32a:e706:b7b6 with SMTP id
 98e67ed59e1d1-339a6e75590mr335937a91.11.1759253745770; 
 Tue, 30 Sep 2025 10:35:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339a7039781sm121848a91.26.2025.09.30.10.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 10:35:45 -0700 (PDT)
Message-ID: <f480cd3d-ee99-430a-b32f-0fa6ce549b68@roeck-us.net>
Date: Tue, 30 Sep 2025 10:35:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] aspeed: Add Supermicro X11 SPI machine type
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221025165109.1226001-1-linux@roeck-us.net>
 <dbea5c97-071e-4d7c-a022-8cd5d9cf6171@kaod.org>
 <e6ad0500-29b5-422f-a584-34d33a5e9a0a@roeck-us.net>
 <e493e89d-d161-4c5b-abf2-053034aa82b4@kaod.org>
 <69494307-46ce-41b7-b8ee-c7e0aa462566@roeck-us.net>
 <fc857b89-6b57-4200-a21a-a60d49ba000b@kaod.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <fc857b89-6b57-4200-a21a-a60d49ba000b@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=groeck7@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 9/30/25 07:54, Cédric Le Goater wrote:
> On 9/30/25 16:35, Guenter Roeck wrote:
>> On 9/30/25 04:13, Cédric Le Goater wrote:
>>> On 9/30/25 12:08, Guenter Roeck wrote:
>>>> On 9/29/25 22:55, Cédric Le Goater wrote:
>>>>> On 10/25/22 18:51, Guenter Roeck wrote:
>>>>>> supermicrox11-bmc is configured with ast2400-a1 SoC. This does not match
>>>>>> the Supermicro documentation for X11 BMCs, and it does not match the
>>>>>> devicetree file in the Linux kernel.
>>>>>>
>>>>>> As it turns out, some Supermicro X11 motherboards use AST2400 SoCs,
>>>>>> while others use AST2500.
>>>>>>
>>>>>> Introduce new machine type supermicrox11-spi-bmc with AST2500 SoC
>>>>>> to match the devicetree description in the Linux kernel. Hardware
>>>>>> configuration details for this machine type are guesswork and taken
>>>>>> from defaults as well as from the Linux kernel devicetree file.
>>>>>>
>>>>>> The new machine type was tested with aspeed-bmc-supermicro-x11spi.dts
>>>>>> from the Linux kernel and with Linux versions 6.0.3 and 6.1-rc2.
>>>>>> Linux booted successfully from initrd and from both SPI interfaces.
>>>>>> Ethernet interfaces were confirmed to be operational.
>>>>>>
>>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>>>
>>>>> Hello Guenter
>>>>>
>>>>> Would it be possible to contribute a functional test for this
>>>>> machine ?
>>>>>
>>>>> Since this machine contributes little to the Aspeed models,
>>>>> its value lies in the firmware it can run to exercise the
>>>>> models. Without functional tests, I plan to schedule the
>>>>> removal in the QEMU 10.2 cycle.
>>>>>
>>>>
>>>> I use it to test the Linux kernel. Nor worth enough to spend more time on.
>>>> Just drop it; I'll drop the respective test runs.
>>> Can the FW be downloaded ?
>>>
>>
>> I have no idea. I only test the Linux kernel (more specifically, the Linux kernel
>> drivers). 
> 
> OK. you boot with -kernel and a custom rootfs I guess. That's OK
> for a functional test too.
> 
>> I already have to work around issues with the board that because the
>> Linux kernel no longer supports the Macronix flash on that board as emulated
>> by qemu. 
> 
> Ah. I am the kernel maintainer of the spi driver. So interested
> to know more. Is that related to the fact that there are mx25l25635e
> and mx25l25635f flash devices with the same device ID but different
> SFDP tables ? One has 4B support, the other not.
> 
>> My patch to let me specify the flash model for aspeed boards in qemu
>> was rejected. 
> q
> The aspeed machines have these options :
> 
>    fmc-model=<string>     - Change the FMC Flash model
>    spi-model=<string>     - Change the SPI Flash model
> 
> Isn't that enough ?
> 
>> So I already have to carry a downstream qemu change to support it.
> 
> I don't see any change under :
> 
>     https://github.com/groeck/qemu/commits/v10.0.2-local/
> 
> May be you are mistaking with the Nuvoton boards ?
> 

Yes. Sorry, I am confused. That was for quanta-gsj and kudo-bmc where I had
the same problem with Macronix flashes.

> Upstream lacks your UHCI proposal. Unfortunately, I don't know any
> reviewers who could help us merge.
> 

I'll just carry it downstream until I am getting tired of maintaining it.

Thanks,
Guenter


