Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp290059ejb;
        Wed, 7 Jun 2023 07:16:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5zVdGpTKRsx56NKQBMN1GpPiTb3iXG3WTvxtzf3Kc7RceMjNFvd8aDdIRc6vjUDp3nscvk
X-Received: by 2002:a05:620a:4689:b0:75d:50bb:b176 with SMTP id bq9-20020a05620a468900b0075d50bbb176mr2537653qkb.11.1686147402034;
        Wed, 07 Jun 2023 07:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686147402; cv=none;
        d=google.com; s=arc-20160816;
        b=B+NFmf3cq3UgsqRw7H5WipWdAbw0ysrvpDxWhiVASH1ayPfSJPIEUaCz1ESY/EwseC
         dn3CHFAmKUdW8k/8F2iJPBPbxEI6vY9bx1FIxL3k0gceUnfCeJklt8GvVcHpp7ytmXYe
         6/OpZB7OZM9vNlTk21SuQCkDxFRhbkOfPBAIPJBeK3InIuyqQzpzMuSaztDQVTZ6YxXz
         QMudAgp4JfOK/iVqts3x8Kkn4FVKClgSRL0gmJRTMcRxe50pXLpkBZ5L7Yq7+tOLuO8y
         Ewv5TVQZmZ8g7b4RKzCtQfGccjR1qpR0WD+vmhLFqfuY+KqgzGn2iVS59uwmwh3N1U5o
         lebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Rtu7plXMXBtky8CIn+YkwIjOBVu+XmSdwtmhSG7ckvU=;
        b=zlP2nXQO51U3wVbxMmGpvMpewmdJm7IDuncLAuFTxd0ogenSQxhSTs83BzJEG9FegN
         79u+hSIeekT/WppIBwp79mBnkllKfoW13n7frrRVrkuRCcD7+UsL+XU3n2LwfuJyhufV
         c05c0onfoxZI/iwn10riUB1MQCFPr/Zgij2KxcA2BJX657eW6Em7wIOzv4wqGlZqHzee
         TrefCWJKckzCCr7O49/5MeiftsOj8kpGlksoga9Z4N7pgKosPzbjDydOERH/6NteAeyw
         kPLjyGlEa1ExRQFMtt9Dclx8TOn4Xdq+nAbZLAktFzipWWIAzoRVEuzqX/z7MVV3KHW9
         1ldg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16-20020a05620a159000b00757845e9ce7si5940745qkk.361.2023.06.07.07.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 07:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6txM-0001iR-3i; Wed, 07 Jun 2023 10:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6txG-0001fv-CZ; Wed, 07 Jun 2023 10:16:07 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6txE-0002yj-O1; Wed, 07 Jun 2023 10:16:06 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QbqBm4Mjbz4x4R;
 Thu,  8 Jun 2023 00:16:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbqBj6JJMz4x4K;
 Thu,  8 Jun 2023 00:15:57 +1000 (AEST)
Message-ID: <7f37de5f-d31d-b51c-340d-a04ae99230f0@kaod.org>
Date: Wed, 7 Jun 2023 16:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <62e69c35-4869-8cc3-5983-9f83ff649da9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5JAy=B3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.091, SPF_HELO_PASS=-0.001,
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
X-TUID: IoHAdurSFMMw

On 6/7/23 10:28, Philippe Mathieu-Daudé wrote:
> On 7/6/23 10:06, Joel Stanley wrote:
>> On Wed, 7 Jun 2023 at 04:40, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> Boards will use this new property to identify the device CS line and
>>> wire the SPI controllers accordingly.
>>
>> "addr" and not "cs" or even "chip-select"?
> 
> "chip-select" is a good suggestion!

I thought of using "cs" initially as it makes more sense for SPI
controllers, I do agree. But then, I tried to be consistent with
what QEMU is proposing today : "bus" and "addr".

This can be changed.

Thanks,

C.

> 
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>
>>>
>>> Cc: Alistair Francis <alistair@alistair23.me>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   include/hw/ssi/ssi.h | 3 +++
>>>   hw/ssi/ssi.c         | 7 +++++++
>>>   2 files changed, 10 insertions(+)
> 

