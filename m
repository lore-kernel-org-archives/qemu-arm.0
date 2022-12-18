Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3039909ejb;
        Sun, 18 Dec 2022 14:23:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsXeyDYMxK+9M3B0QcbDN4aPQUlL29cUapQvWeqn75LqKhWu8+TDxSdU7XnSYSY5lchL9if
X-Received: by 2002:a05:622a:4290:b0:3a5:758d:8f5e with SMTP id cr16-20020a05622a429000b003a5758d8f5emr9107280qtb.19.1671402204239;
        Sun, 18 Dec 2022 14:23:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671402204; cv=none;
        d=google.com; s=arc-20160816;
        b=lt9VG1J5O1YYc2RyTwaKDY5TxmWEH2WExAEPELyskR+rLGOeEACO8459wZF/YRzyVR
         fhWX+pSIO9IsIvxy2JsyuL60wRRLSQU9TOvs9ElKSA/wbHU7s87+sTkU2sfR8GZh0PAR
         Q7lJl79XyLSg056vpC1x3/uZNQ+BUFFW0QEknQUD7U+J2Ewoc5Qhua70V9YlCkphri42
         WZOWoFU6Ph8u0+M/+X9kkbMEh/tBoa2BiRVrzMb5vdGTdP9ZACYUHF1yRDMgezibFNFu
         zzNzrMguirEk5poxAIrOsWh6Ya02nFsAlqGaWHfDAmpx/31r+uUAzPs1KE278RG4bfGG
         1XQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oU1vIsXfzsQ8HZcqwzN7T/MAXsE1HSu+cMUHvbTZ7TM=;
        b=RWHgAWXaC5+y2WOvMst/Xv15B/CE4oBkPGVNr5n1aZJKKQw2Z/gFXYVcMQpFV1OzX2
         Fw/MmGwmsLgk+u7sb5aqKSYSXgwkS2TJLwYjbgWuhtOJ4J/Y3jg4t1P4d5Sze9gK95fs
         hWv2faKS9VeJa/m20OXe42B0okh+TAJoLwbTOmbPIMODeJG5E7pj1HkRMU/vQagyspgu
         PMq5uVHnKfvsd+81vJoEgU51tw/JeTG4U8c3lrdYHZ33BkshW+G4Z41mpsODV2lRFO9k
         NZAXIH7taZaUXd/x2FUaP/V+s0kBrYKd63e6QNNgZZr3jsM//kl1obi1sTH2WqggaqCO
         xwcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ujBFWKn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020ac8744c000000b003a4feedd996si3392971qtr.555.2022.12.18.14.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 14:23:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ujBFWKn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p723s-0002f4-U0; Sun, 18 Dec 2022 17:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p723r-0002eC-39
 for qemu-arm@nongnu.org; Sun, 18 Dec 2022 17:23:11 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p723p-0006LU-Fn
 for qemu-arm@nongnu.org; Sun, 18 Dec 2022 17:23:10 -0500
Received: by mail-ej1-x62e.google.com with SMTP id bj12so17542108ejb.13
 for <qemu-arm@nongnu.org>; Sun, 18 Dec 2022 14:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oU1vIsXfzsQ8HZcqwzN7T/MAXsE1HSu+cMUHvbTZ7TM=;
 b=ujBFWKn7HAh7fMF4KxKCydBEEwGAgs0VK6utmSn3Oy5ZIXs9Li2xWF6tSCZA1zfi7f
 Cp7TllXkvQD/Yt2ltV/xny0K/gTf28WWWktW/3NGakGwmfQEIEos4HRbkYDmt5lyX9tG
 GyEWcCZQUC0W+Ogm2cwu8TK6p4QLP/kjAsIFRKY3qqONQ0tFdNaOS5o/7bE5+X/1WzQ6
 pcsUVJtvBi0pDKuhre1Jhp4bAHAfC7e/CVyKxFZa4DLKOBYLvd7Um0/ahon4/ipN/RxS
 TicQnYcZT34FpMccFltEbsqWEO8tfzN1tvFuOI+5gVCU0D8gMiWlxJ7YMFAQp+4mWFqH
 9OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oU1vIsXfzsQ8HZcqwzN7T/MAXsE1HSu+cMUHvbTZ7TM=;
 b=nBopjerJOeQW2rTfnRLgSwaA11crywsEXLHM2ksUhKI+Tj9W3Y1PQ30qbTmHZWW/dn
 BgEKBPFNvHq4vhgFP36SJW4R80kW2sjsKLEMmlcmDY9eeFSlPeZkDZABppwiSYVIsvxJ
 51CWLHUx2xjxHdM3yIYCkNmSv9SFV3FXbrUpVHbQZ9HIFhGTq6IdOctOQ0r0VKyqExYS
 9h/+57c/AYgdde4fPaKasFC8qG1SEJV5/MEaV/Wsmys+DSQnef9bJsCKtPBIemUhGcDb
 Yj1hOUX0oEG0uf0uAbNrWhwmT9xjn0lut5O+eBSZLPwmOn7ch864rt+TtJNK7Vr1SgsK
 rOeQ==
X-Gm-Message-State: AFqh2krFGFNcWaaQ4NLQNfJV0wn5YK+BIt33+m5AC25J+K90rAZtocm/
 KZGr9c0kfzXDXaTUZC+e+j/wNA==
X-Received: by 2002:a17:907:a705:b0:7c1:6b46:a722 with SMTP id
 vw5-20020a170907a70500b007c16b46a722mr3726665ejc.56.1671402187543; 
 Sun, 18 Dec 2022 14:23:07 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 sb25-20020a170906edd900b007ad2da5668csm3588489ejb.112.2022.12.18.14.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 14:23:07 -0800 (PST)
Message-ID: <de6f6dfd-e6e1-39fd-1c4f-d30249451cd1@linaro.org>
Date: Sun, 18 Dec 2022 23:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 4/7] hw/misc: Allwinner AXP-209 Emulation
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-5-strahinja.p.jankovic@gmail.com>
 <df665471-7426-f313-aece-75b8638e0da4@linaro.org>
 <CABtshVQNAseuzxHS7htyxEtoZDEGVG0fdf0ERdAZJgcxe=znQQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CABtshVQNAseuzxHS7htyxEtoZDEGVG0fdf0ERdAZJgcxe=znQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: Wzu3BoZjkYwt

On 18/12/22 23:12, Strahinja Jankovic wrote:
> Hi,
> 
> On Sun, Dec 18, 2022 at 11:07 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> On 18/12/22 22:19, Strahinja Jankovic wrote:
>>> This patch adds minimal support for AXP-209 PMU.
>>> Most important is chip ID since U-Boot SPL expects version 0x1. Besides
>>> the chip ID register, reset values for two more registers used by A10
>>> U-Boot SPL are covered.
>>>
>>> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>>> ---
>>>    hw/arm/Kconfig              |   1 +
>>>    hw/misc/Kconfig             |   4 +
>>>    hw/misc/allwinner-axp-209.c | 238 ++++++++++++++++++++++++++++++++++++
>>>    hw/misc/meson.build         |   1 +
>>>    hw/misc/trace-events        |   5 +
>>>    5 files changed, 249 insertions(+)
>>>    create mode 100644 hw/misc/allwinner-axp-209.c
>>
>>
>>> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
>>> index 052fb54310..3855d937fd 100644
>>> --- a/hw/misc/Kconfig
>>> +++ b/hw/misc/Kconfig
>>> @@ -180,4 +180,8 @@ config ALLWINNER_A10_CCM
>>>    config ALLWINNER_A10_DRAMC
>>>        bool
>>>
>>> +config ALLWINNER_AXP_209
>>
>> This controller is not specific to AllWinner. It can be plugged on any
>> i2c bus. Please rename it AXP209_PMU. Otherwise LGTM!
> 
> Do you mean only in Kconfig, or everywhere (file name, function names,
> etc.)? Thanks.

Keeping the file / functions names with 'allwinner' would give the false
idea this is AllWinner specific; rather confusing isn't it? Besides it
is not part of the SoC, this is an external component sitting on the
bus. So "everywhere".

Also, the "select ALLWINNER_AXP_209/AXP209_PMU" line in hw/arm/Kconfig
belongs to the next patch "hw/arm: Add AXP-209 to Cubieboard".

Regards,

Phil.
