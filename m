Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2447443ejb;
        Tue, 30 May 2023 14:16:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qKUccw+kVbplihElljWH5a6Bf41W8W+0TvNO0G70t7wdQBXEPIGdJNkQvqLFQ9c8TSxCj
X-Received: by 2002:a05:622a:188e:b0:3f6:aff0:6df2 with SMTP id v14-20020a05622a188e00b003f6aff06df2mr4238998qtc.31.1685481390802;
        Tue, 30 May 2023 14:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685481390; cv=none;
        d=google.com; s=arc-20160816;
        b=hr+jsmtZbxz/MA3rv1j4c2gYbXvn1qmpnvL8Dyid4xHBXcZmV0QjwguBant66HDp2U
         mBILVQBnCl+On85ISuqhWMspj3MfbmYDhuMSjilexjW44PEddgQc37AVZEKVF7ChEAJ6
         tlOK20lFHGX/XnXixiYpgeU4Kc9P9iT3vDQoxwMNGbf3yFTagXjSVFrjXUu7362SFkIR
         QIEEckwKnPwz+aCIPKmMZWjV1o89m1UDtKRA9gp7FYVqRxPu1EmDn0KTTlkLePo5AQYC
         X7uzS6PF4bjs0hvu/eB1lyqU+HdJuacsDj0f3i9ex1Voxb1HRg+xszMapQT7CtxGBbhX
         BHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MvyHidfsbl/GVmFg/rFVhIoYM+nG4iidyd3VfxTk9Qo=;
        b=sHTq0urp51V3Ol/lxynDa47d3cVhokXPJmXElsboJan4nTP5KbLtUqYUmGr9jTJtkx
         XQiyKvwAjpTvrCCu+Aw6zdKG/93+RB3F5NrB7k8476csXeMX5EaiFkcAL/UIpEl85LEd
         8UuZq6vZtVhrc4pDrlXhgkW2C/z6CWl7GWs8kUMDH+wejFm4jSyfYUM1pXar8ToWBKQO
         NC7uyPCq0L/A9gdh5EBV+f7P9YbNXTRFRNc2a4VDwwaL0T1Xb8llmZBSe/5jL+69ekdE
         Jg8YUCvHb/GUia2cydgEL7UuLOwy+003jOPhMkwVKpyhn/GYjbNYKzMvb4Xr+uONa8AP
         /Xug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LfhsvcAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020ac87f0c000000b003f521882b88si7338256qtk.444.2023.05.30.14.16.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 14:16:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LfhsvcAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q46hG-000602-Si; Tue, 30 May 2023 17:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46hE-0005zc-Hr
 for qemu-arm@nongnu.org; Tue, 30 May 2023 17:16:00 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46h9-0004iU-Lc
 for qemu-arm@nongnu.org; Tue, 30 May 2023 17:16:00 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f60b3f32b4so35664775e9.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 14:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685481354; x=1688073354;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MvyHidfsbl/GVmFg/rFVhIoYM+nG4iidyd3VfxTk9Qo=;
 b=LfhsvcAlTb562y9MJH+UHVnvhlBsFQIdP8qrikved/cbQgXaJ6kIZyr4VQPFFr/52L
 cNtj3mrcUpgj52nuuvz0svHyJMo0EUvM/2mlzzGS9hGkpOn0HOspOBx6nlfJcnA7CuGD
 VqWLIvSrRFwmxTMXKghQx21L89gWyZFe1ddWCTvj9EKW5vE5qpFhnFV5kbZX3ELJmHMR
 XKvOAvlGaIoXEHUdbB4Ct+o399+flDqE5u54GNQeidcPeelZbyTt4/WSBg5cMU6OrQt3
 iEAJ1bf3OaOHQPNU8gxdakULfjTtBY96alxvBydVie2wnkjP1NbsI23toDhVZV0UNZyk
 5ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685481354; x=1688073354;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MvyHidfsbl/GVmFg/rFVhIoYM+nG4iidyd3VfxTk9Qo=;
 b=UNtkTxGAaeIRpA5ojDcuS8TmPaCh81I8OopkVfdM7NYns8M7BKyI09yIQNQKEwPTps
 Wrt8YtepPAxHLmnxCqnrRnnk7US8HepgXGBDibCA7mtxhOgil+iTAaIthRyLQ6iXlTFp
 1hbEjBK8OJs5gCXQIMsBdHuQiI0flxbQ5OtzTEJ0a1q6bBMza6MyhiK6OxxvliN18dDh
 tRcaDxpzA7/d4CwIun9pzy0OiBj6x4GKZrjh+nRM81sgetXo52DM95YmjkYJOkP4YtYo
 enAS9eOEhhlTAQHkfIg7nMAk2wE0JAZqsjdPgrR/oyycJ49Bf5Y/KWyqjfdAJuNx/WUo
 SkhA==
X-Gm-Message-State: AC+VfDzgb1nAlOspLM7QuGFmwqQA6AvaFuJlY9kMRJWFvu/4ABzLC3ZE
 H3eXSkKlSBlItm5qjVF1ZU4GPg==
X-Received: by 2002:a05:600c:2252:b0:3f6:8af:414 with SMTP id
 a18-20020a05600c225200b003f608af0414mr2596893wmm.30.1685481354073; 
 Tue, 30 May 2023 14:15:54 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a7bc4d2000000b003f427687ba7sm18323817wmk.41.2023.05.30.14.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 14:15:53 -0700 (PDT)
Message-ID: <0d11b78e-56f7-553a-3e85-0edef9b649ac@linaro.org>
Date: Tue, 30 May 2023 23:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 05/12] hw/ssi: Introduce a ssi_get_cs() helper
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-6-clg@kaod.org>
 <40c8647d-201e-3ceb-97ca-ec98bdc84e88@linaro.org>
In-Reply-To: <40c8647d-201e-3ceb-97ca-ec98bdc84e88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: JAJyLNjqW+Cz

On 30/5/23 22:34, Philippe Mathieu-Daudé wrote:
> On 8/5/23 09:58, Cédric Le Goater wrote:
>> Simple routine to retrieve a DeviceState object on a SPI bus using its
>> address/cs. It will be useful for the board to wire the CS lines.
>>
>> Cc: Alistair Francis <alistair@alistair23.me>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/ssi/ssi.h |  2 ++
>>   hw/ssi/ssi.c         | 15 +++++++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
>> index ffd3a34ba4..c7beabdb09 100644
>> --- a/include/hw/ssi/ssi.h
>> +++ b/include/hw/ssi/ssi.h
>> @@ -112,4 +112,6 @@ SSIBus *ssi_create_bus(DeviceState *parent, const 
>> char *name);
>>   uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
>> +DeviceState *ssi_get_cs(SSIBus *bus, int addr);

Also, this helper should (preferably) return a SSIPeripheral type.

> Previous patch use uint32_t. uint8_t is probably enough,
> otherwise 'unsigned'? Otherwise
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

