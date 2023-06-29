Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp420643ejy;
        Thu, 29 Jun 2023 09:08:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6dgI4lMSWDTboGLpdeCKvlCP3wmz9NBfKBIWqIaYIqI7Kjp/hahY1oYYtOrQYlch4BVmaY
X-Received: by 2002:a05:622a:60d:b0:3f9:c8a1:36cc with SMTP id z13-20020a05622a060d00b003f9c8a136ccmr46608452qta.4.1688054935463;
        Thu, 29 Jun 2023 09:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688054935; cv=none;
        d=google.com; s=arc-20160816;
        b=iz8Okc//pp7QpUyksUoLTpMtJAfOvPHytH8+/HyfAhunBWQGCwNJ+5PE8nXVRBBAoX
         ra8pTvw/TOiy5PvAyIVUCATkUfpkbahEbmSZh0tgeXvkO+e4Wxe0ebolyrPLKn9sy7x9
         nNCTUT4UI1nUikiIEygn6ANnNZCcTCvV6kwk6A4BN28fTbaGGgXyNqTX2qqFGpRZWPBu
         dAsgUtoybW9n8o9e9eBFaPgPC7VP1LExUwOqilZ1zgG9N7csgk7uvG1mJkCOFLwDsOxa
         hCiw5VdeHv2gi+itT1TVQn6W9wHdJ4t8XWK5zOICb1JXbMH6MT/+1o06k6au0mn/cusv
         pbkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=QyBKhInwTvjbQwc5POrTPIk+oLzwZToRgXrt6il3t7c=;
        fh=5ikBJ7oxd/2qQzHmOtx4HTcEV10nP6/o/J5FcLZnQ0Y=;
        b=kF1Azo6o7jxzgoI2Yu3bt/02qSHjVxd6SR9Y1nZYKkWv8npdt1U90i8a4H82U1VLCa
         ziy+Os8ZF9vcybYt2nqE/4k6xbvImX8WZyObK4LvsS1tYC23yae4mkd9MbtXaot3/GgW
         glVD5nC0Ad7FpKuQ1WLjxwLnUJJSyt750TFdPrLab9uUt60LM4qTP/4uBmOxK61aHuVs
         t5axjdqycL6qOT0VSGy/mLJlAF56Vm1Dx2CIaGXr2Hl0DDt6W0nRy8uWZkqt45zOMYBe
         L2l3u5EF8KLK9NdQdcRo1ZGs/yGNNK8MiGJavYz9gE4ai/RC/oTpJEngah+Rai84aZZM
         vpsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16-20020a05622a03d000b003f6e171c80bsi6150750qtx.648.2023.06.29.09.08.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jun 2023 09:08:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qEuCS-0004hm-GX; Thu, 29 Jun 2023 12:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=1kQ5=CR=kaod.org=clg@ozlabs.org>)
 id 1qEuCL-0004eP-FF; Thu, 29 Jun 2023 12:08:46 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=1kQ5=CR=kaod.org=clg@ozlabs.org>)
 id 1qEuCJ-0004Hm-RN; Thu, 29 Jun 2023 12:08:45 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QsNfd36NRz4wp1;
 Fri, 30 Jun 2023 02:08:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QsNfb18pgz4wbP;
 Fri, 30 Jun 2023 02:08:38 +1000 (AEST)
Message-ID: <79dbf02d-3ab0-26bf-9635-b233a5e0787d@kaod.org>
Date: Thu, 29 Jun 2023 18:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 04/12] hw/ssi: Add an "addr" property to SSIPeripheral
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20230607043943.1837186-1-clg@kaod.org>
 <20230607043943.1837186-5-clg@kaod.org>
 <CACPK8XencE5MMgYdQ5H6iV_rTHaynv-UJYHZy=y-DaCXYBWWXg@mail.gmail.com>
 <62e69c35-4869-8cc3-5983-9f83ff649da9@linaro.org>
 <7f37de5f-d31d-b51c-340d-a04ae99230f0@kaod.org>
 <744350d6-f9f3-e8a3-51cd-5f998ee1b366@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <744350d6-f9f3-e8a3-51cd-5f998ee1b366@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=1kQ5=CR=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.093, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: SMhRBfn3dDyN

On 6/29/23 12:56, Philippe Mathieu-Daudé wrote:
> On 7/6/23 16:15, Cédric Le Goater wrote:
>> On 6/7/23 10:28, Philippe Mathieu-Daudé wrote:
>>> On 7/6/23 10:06, Joel Stanley wrote:
>>>> On Wed, 7 Jun 2023 at 04:40, Cédric Le Goater <clg@kaod.org> wrote:
>>>>>
>>>>> Boards will use this new property to identify the device CS line and
>>>>> wire the SPI controllers accordingly.
>>>>
>>>> "addr" and not "cs" or even "chip-select"?
>>>
>>> "chip-select" is a good suggestion!
>>
>> I thought of using "cs" initially as it makes more sense for SPI
>> controllers, I do agree. But then, I tried to be consistent with
>> what QEMU is proposing today : "bus" and "addr".
> 
> We should use a description that stays close with the terms used
> by the hardware we model. In that case "cs" seems more appropriate.

OK. I can change the property to "cs".

Thanks,

C.

