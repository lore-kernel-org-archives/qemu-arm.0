Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp592006njc;
        Mon, 24 Jun 2024 23:06:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcwgMi+hrIB5vqBzAUHsTlHvs8PkEls62Y6Pb9a+XvHwhE6kQxz53Qcog+MaVklgvcpRQl2NkwcRBdZ7fAtAoECRwtNurE
X-Google-Smtp-Source: AGHT+IF/rZ3fgH5B3XY/3lZ2DlRIQetHID1T3HeggT85faf8cUInJ81DQGz3Qd0AR1QI/E7mtcKj
X-Received: by 2002:a05:6214:528b:b0:6b5:101c:6473 with SMTP id 6a1803df08f44-6b531fce5d2mr127317006d6.2.1719295577066;
        Mon, 24 Jun 2024 23:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719295577; cv=none;
        d=google.com; s=arc-20160816;
        b=jSERLUN7JdqI8MzKzKF1zwHS/hvmGimM1YcAkI/0QHYVi3pJfcT9D50Cx071OBu/dJ
         ziZDN84u6EX6coWLmfrW7JIBmQjP3ytV152gYJbQpQt7Gd/zHbtJo+mbquQWi5uHUQRv
         Nb8nWbDL0dkO32yTiRDb4mm8KV2a/5bojMbDRq2+foH8YO60gAoTdPIH70NNlkwCQ2uh
         JZbRFRM90qhQ4Be7gX0WpkyYjDd0KtCCNVhsCFMpqL2GFU3EcBWlzW2i1WIkk3nZGhsU
         Nm8guXXrk2qJ1c9PntLm+9WBb1nHKggcN81Aw3wzoyJVUGjQZOGS0soTCy1tVEj6cdpT
         FenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=sz93c/0zhkdcVc9YpbLReT1QydpJhTfhYK/sNofkaEw=;
        fh=RV5QpqWW7tCQ1dEg4H+Gj5YCFBFQ0SC9zM+6DvlpjQA=;
        b=cmInUUM0v2AZk4eX/mj7UQ/f9e9uDrLglSIsMPwk0L5g7kyR9B3pJsOmamH50uffeK
         cZWEYarHok1GfhmvBRK/R/qd5ciC25oOujkK9FnMg+9iRF7NqbK1S3wcTN1gqjVtSafs
         vt376VL0PyVXCpc55kq4qnzY1KWXxVHg9JZ3Ne+/NejsTfzejbQq1pFAhD1dUe+0l8DP
         6CkdyXV7NY1h8+EMSJ6yRxUaEsIiGVj7dsNVMLAsYxeZyhjG6+3xiFaQDdaCQxHpCFRz
         iWBMKGIVwWMfHm2LCYx75DcMBwu3L7yv4yIrseOQQaXqDC38ZNPibiJ6MTIexW1rjYCr
         cOXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b53eb39c24si61883896d6.367.2024.06.24.23.06.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 23:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLzJW-0004U8-BG; Tue, 25 Jun 2024 02:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=+2S4=N3=kaod.org=clg@ozlabs.org>)
 id 1sLzJU-0004Tg-6j; Tue, 25 Jun 2024 02:05:56 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=+2S4=N3=kaod.org=clg@ozlabs.org>)
 id 1sLzJR-0004m6-Kn; Tue, 25 Jun 2024 02:05:55 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4W7Z7w1X15z4wcJ;
 Tue, 25 Jun 2024 16:05:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W7Z7r4J9rz4wbr;
 Tue, 25 Jun 2024 16:05:44 +1000 (AEST)
Message-ID: <ff45f5c5-5586-4c21-bf86-ad82eb2c5f0d@kaod.org>
Date: Tue, 25 Jun 2024 08:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] aspeed/soc: fix coverity issue
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
 <20240619093508.2528537-2-jamin_lin@aspeedtech.com>
 <CAFEAcA8tTHusKOR7JhyU+wwA3JJWq1o5wVaNXugw2S9SjAsESw@mail.gmail.com>
 <b013bd79-c206-446e-b482-91eeb926c70a@kaod.org>
 <SI2PR06MB50412C68BF0AD9B4ED91B75FFCD52@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB50412C68BF0AD9B4ED91B75FFCD52@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=+2S4=N3=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qGjLXWGF/O6u

Hello

On 6/25/24 3:55 AM, Jamin Lin wrote:
> Hi Cedric,
>> -----Original Message-----
>> From: Cédric Le Goater <clg@kaod.org>
>> Sent: Monday, June 24, 2024 9:58 PM
>> To: Peter Maydell <peter.maydell@linaro.org>; Jamin Lin
>> <jamin_lin@aspeedtech.com>
>> Cc: Steven Lee <steven_lee@aspeedtech.com>; Troy Lee
>> <leetroy@gmail.com>; Andrew Jeffery <andrew@codeconstruct.com.au>; Joel
>> Stanley <joel@jms.id.au>; open list:ASPEED BMCs <qemu-arm@nongnu.org>;
>> open list:All patches CC here <qemu-devel@nongnu.org>; Troy Lee
>> <troy_lee@aspeedtech.com>; Yunlin Tang <yunlin.tang@aspeedtech.com>
>> Subject: Re: [PATCH v1 1/2] aspeed/soc: fix coverity issue
>>
>> On 6/24/24 2:18 PM, Peter Maydell wrote:
>>> On Wed, 19 Jun 2024 at 10:35, Jamin Lin <jamin_lin@aspeedtech.com>
>> wrote:
>>>>
>>>> Fix coverity defect: DIVIDE_BY_ZERO.
>>>>
>>>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>>>> ---
>>>>    hw/arm/aspeed_ast27x0.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c index
>>>> b6876b4862..d14a46df6f 100644
>>>> --- a/hw/arm/aspeed_ast27x0.c
>>>> +++ b/hw/arm/aspeed_ast27x0.c
>>>> @@ -211,6 +211,12 @@ static void aspeed_ram_capacity_write(void
>> *opaque, hwaddr addr, uint64_t data,
>>>>        ram_size = object_property_get_uint(OBJECT(&s->sdmc),
>> "ram-size",
>>>>                                            &error_abort);
>>>>
>>>> +    if (!ram_size) {
>>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>>> +                      "%s: ram_size is zero",  __func__);
>>>> +        return;
>>>> +    }
>>>> +
>>>
>>> Isn't this a QEMU bug rather than a guest error? The RAM size
>>> presumably should never be zero unless the board set the ram-size
>>> property on the SDMC incorrectly. So the SDMC device should check (and
>>> return an error from its realize
>>> method) that the ram-size property is valid,
>>
>> That's the case in aspeed_sdmc_set_ram_size() which is called from the
>> aspeed machine init routine when the ram size is set.
>>
>> Setting the machine ram size to zero on the command line doesn't report an
>> error though and the size is the default.
>>
>>> and then here we can just assert(ram_size != 0).
>>
>> Yes.
>>
>> Jamin, could you please send a v2 with the commit logs update I proposed ?
>> See the patches on my aspeed-9.1 branch.
> I resend v2 patch with your commit log, https://www.mail-archive.com/qemu-devel@nongnu.org/msg1050302.html

We'll need a v3 with the assert. No hurries. We still have some time
before the soft freeze.

Thanks,

C.




> Do we need to drop this patch, https://www.mail-archive.com/qemu-devel@nongnu.org/msg1050301.html?
> 
> Thanks-Jamin
>>
>> Thanks,
>>
>> C.

