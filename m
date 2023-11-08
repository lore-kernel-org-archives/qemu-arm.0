Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp902944ejv;
        Wed, 8 Nov 2023 02:40:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3EBch47odcQG3m7zlb3chFCv0f1fSu1yCBpFz4df+2PLxT/WExLWEbKJj4ofrVCy/tB88
X-Received: by 2002:a05:622a:1a18:b0:41e:a8ab:3c73 with SMTP id f24-20020a05622a1a1800b0041ea8ab3c73mr1263966qtb.41.1699440020985;
        Wed, 08 Nov 2023 02:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699440020; cv=none;
        d=google.com; s=arc-20160816;
        b=PFOvpYpVQlxvx0CW5Ip3andIC4StcByUPpxZje1U8hdh4qhzCjAYuvb3aFeS98YxFo
         CV10NybhUMa4z+jb1dIzSu5ylNq56eyvgoryqRNhTCCYYgRxBOzIt+8T6pCI2ud8hjY5
         9BvDk1HWaKv41re6Nvqu44BpSlcMK/jQnfwZvyn3Zyh9z1a84LCJOqozgcpRA6/Qb+r5
         mSuFhlonWNjhsj3o2l0r1z8rlyM/dIKD/rE8glHUTO2uSgD0pP2QLisABSq+vnDiRU48
         1Euh6f+TNYYd9pxgPQcojxSb4TcMSk6tyLPgUVQicQT11/ItfnkexEE5GXN0erByGS0z
         pB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7HzxvFFNmO6K1hTFtt7SUREj348gqTywo0NeLEtHUDE=;
        fh=vnd1vIkkm/ZVf/LZKTEH+S7sMlq9REM5FyG16cnWYBU=;
        b=erhhLF6Vr7yuZMP0nkj8ezjkhOciIZatKg4QsXiup0JsFIoNNC6ZofMFx/C3P5Z/f3
         z39Wk6GAP+YqGCYx2h6a6MAqvn7+PKdL0o69gLpW/dL7lHe8WB6s+ET2K+5ZHA9U+/1v
         KQT6/YxIv3Eq/AgsNkC9nQoDo8LE/vyzESFlA+OEjL9Zt1XJSL4xtoSCdySlTB1J5c5b
         yVMDVAQkNp0f6HPaxHdWLaNcdIEszGJbuGPEJC5ML1/VxKsUdFPKEdKpR9zA4sej0Mn6
         5joA2uGA3UH49ToCEkvL4ufAQfcRp6pjKvTI9rjadvwpcjurUgxOwSTL09K1T4WzFebm
         jmkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FwQEa7Gx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3-20020a05622a028300b0041812c64671si1083455qtw.487.2023.11.08.02.40.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Nov 2023 02:40:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FwQEa7Gx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0fyY-0001C4-2o; Wed, 08 Nov 2023 05:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0fyW-0001BR-Vl
 for qemu-arm@nongnu.org; Wed, 08 Nov 2023 05:39:57 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0fyT-0001Sl-GK
 for qemu-arm@nongnu.org; Wed, 08 Nov 2023 05:39:56 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52bd9ddb741so11336335a12.0
 for <qemu-arm@nongnu.org>; Wed, 08 Nov 2023 02:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699439992; x=1700044792; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7HzxvFFNmO6K1hTFtt7SUREj348gqTywo0NeLEtHUDE=;
 b=FwQEa7Gxn8jPnj3FzchFkFAL6K8+NVimGIr0upWrWTv3zNdkdqPxyzL7ARFhHn/XzL
 9/CmTMrAPAvffu3uRMp6nSNJLLXgrAgs1BfbjdjzSPDBt7UU+Cwt1IOuOvM9HOPfOCQB
 dEgYk/jhlvg3vs/z8ciDfNHuL3+mmyV04TvLzpbif0H/+WgLmm0PNwCYOJue3Wf0aXls
 8ZZxX2wUGkSbc7viWHlIeZ2jAhoMOCsERLG9RiKw6jw6EKwV7C1LXJELN8+dJEmxe/bR
 BS3myBhXKy0JRqnrSJVZ39m+YIvU1nFB/XryNrLxVLyG8OEze2geaAYgva6/ZTnD+xFE
 nOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699439992; x=1700044792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7HzxvFFNmO6K1hTFtt7SUREj348gqTywo0NeLEtHUDE=;
 b=rTmCz+Bca7G3vIDW5nlgKxOcQeyUv6OGy3alpZxEe1elymFFPzEqZUFP0yTYDiJHZG
 +ShQs4W2Vv0jRvBWuMwc+stthi4UVX9R2x3qh/GggxqpH9bf/37AhxMnX4n1l7CGcwoA
 22NxP8Q0Vrb5PwsL9qqzmRr/NQiHJe3S3uxxQTULBRw6yEJcljm4MTmpU4eOe16Zscvy
 0s89Scmd7E0TJ/DcG+f2sxDjZslG5Vx8TUaUwwmpU8fvAsQD5oXZAuORrpLkxplA0eM8
 jkhAGNGkBZwNWlwNYDb/WKwcIbR1Z4GBC2Gcqn0xIk6Nep6T3VJoMg9C21+9mwooyjKA
 NtUw==
X-Gm-Message-State: AOJu0Yzov2pSEwP8jBcGXKQZfMZol4qTJiZ3SAYCWOvxSbmGzl3Fgq9H
 3rtsQUW4d2kgKEtbCcpWa531Ig==
X-Received: by 2002:a50:8a8f:0:b0:543:595a:8280 with SMTP id
 j15-20020a508a8f000000b00543595a8280mr1064739edj.37.1699439991707; 
 Wed, 08 Nov 2023 02:39:51 -0800 (PST)
Received: from [192.168.69.115] ([176.187.199.60])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a50a45c000000b0053f10da1105sm6666119edb.87.2023.11.08.02.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 02:39:51 -0800 (PST)
Message-ID: <1a89ee9c-bd1c-4a04-8163-38307156351f@linaro.org>
Date: Wed, 8 Nov 2023 11:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hw/sd: Declare CPU QOM types using DEFINE_TYPES()
 macro
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster
 <armbru@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng
 <bin.meng@windriver.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-block@nongnu.org
References: <20231031080603.86889-1-philmd@linaro.org>
 <20231031080603.86889-2-philmd@linaro.org>
 <b06b0685-9407-4350-a8e6-edd0a9411c4e@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <b06b0685-9407-4350-a8e6-edd0a9411c4e@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 0/+7/JJUSRCH

On 31/10/23 09:31, Cédric Le Goater wrote:
> On 10/31/23 09:06, Philippe Mathieu-Daudé wrote:
>> When multiple QOM types are registered in the same file,
>> it is simpler to use the the DEFINE_TYPES() macro. In
>> particular because type array declared with such macro
>> are easier to review.
>>
>> Mechanical transformation using the following comby script:
>>
>>    [pattern-x1]
>>    match='''
>>    static const TypeInfo :[i1~.*_info] = {
>>        :[body]
>>    };
>>    static void :[rt1~.*_register_type.](void)
>>    {
>>        type_register_static(&:[i2~.*_info]);
>>    }
>>    type_init(:[rt2~.*_register_type.])
>>    '''
>>    rewrite='''
>>    static const TypeInfo :[i1][] = {
>>        {
>>        :[body]
>>        },
>>    };
>>
>>    DEFINE_TYPES(:[i1])
>>    '''
>>    rule='where :[i1] == :[i2], :[rt1] == :[rt2]'
>>
>>    [pattern-x2]
>>    match='''
>>    static const TypeInfo :[i1a~.*_info] = {
>>        :[body1]
>>    };
>>    ...
>>    static const TypeInfo :[i2a~.*_info] = {
>>        :[body2]
>>    };
>>    static void :[rt1~.*_register_type.](void)
>>    {
>>        type_register_static(&:[i1b~.*_info]);
>>        type_register_static(&:[i2b~.*_info]);
>>    }
>>    type_init(:[rt2~.*_register_type.])
>>    '''
>>    rewrite='''
>>    static const TypeInfo :[i1a][] = {
>>        {
>>        :[body1]
>>        },
>>        {
>>        :[body2]
>>        },
>>    };
>>
>>    DEFINE_TYPES(:[i1a])
>>    '''
>>    rule='''
>>    where
>>    :[i1a] == :[i1b],
>>    :[i2a] == :[i2b],
>>    :[rt1] == :[rt2]
>>    '''
>>
>> and re-indented manually.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> I checked the aspeed part.
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>

In the absence of other reviews, I'm queueing this patch via my cpu/misc 
tree, thanks!

>> ---
>>   hw/sd/aspeed_sdhci.c   | 19 ++++++++-----------
>>   hw/sd/bcm2835_sdhost.c | 33 ++++++++++++++-------------------
>>   hw/sd/cadence_sdhci.c  | 21 +++++++++------------
>>   hw/sd/core.c           | 19 ++++++++-----------
>>   hw/sd/npcm7xx_sdhci.c  | 21 +++++++++------------
>>   hw/sd/pl181.c          | 35 +++++++++++++++--------------------
>>   hw/sd/pxa2xx_mmci.c    | 35 +++++++++++++++--------------------
>>   hw/sd/sd.c             | 37 ++++++++++++++++---------------------
>>   hw/sd/sdhci-pci.c      | 25 +++++++++++--------------
>>   hw/sd/ssi-sd.c         | 19 ++++++++-----------
>>   10 files changed, 113 insertions(+), 151 deletions(-)

