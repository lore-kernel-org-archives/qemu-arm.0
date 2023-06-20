Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp211296ejt;
        Tue, 20 Jun 2023 04:38:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6e8Tgen4q/Q1nby/isC//dg8js+3lqacrNn/IKaFsBGaPlSTiTca89M5aBIlXLQj9DcQ1o
X-Received: by 2002:a05:622a:24a:b0:3fd:db88:b0e9 with SMTP id c10-20020a05622a024a00b003fddb88b0e9mr13963473qtx.6.1687261097018;
        Tue, 20 Jun 2023 04:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687261097; cv=none;
        d=google.com; s=arc-20160816;
        b=dNPaljva8iE+efliHCLVv0/wPe4nYossT7iEh0aCuNZCQ3xDPXdndIEtATfWaZnysJ
         A7Qe+fTuDbwFMuIeCKGTJy2M9y0BAltsuNl247d/JGyHWD0+TgBWwhQK0HOg61h1/zLg
         N3/yguivAHiitW4O9QnT/fJE11ynZD952jLRid7MwAsVKzuGqhAAr8qJQ7cKGtzzQs4I
         rqTDFUGwCH+LoKK5g3kRJiEZ3xTziwGDOsVS93kiFjWj/Z8GqV4hLtvz0qzacoC426Ml
         LaM/u5ZEf2M3N94TL9Z44954keOx/+whaolcFAEjc7Y0QLk9f0T4zwfiDs6gP+WVzxDc
         n7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NlcyhHNvDrJNX9TUNb2y+2zQmpobE3soADxRX3PU0G8=;
        b=tEsbz2bsdWSF0PfMQ5gGm0ALKUuDI2mGjOTdL7/lV5cfB+eSXE9+OTwcPqex3FYXpQ
         okCrbqkIO4ykUobSKPtZ9BCzLpOk6pN8asy6jpcoA2M1W5sPJZtkn4xvycMDjsBBXRmv
         akibgzACLjsw6ssAk9Ltab2j74+G4zt02x22TbmGWPGxmFASolWW4hMOsXSWJeB76zyx
         SCzi/YmPgezUuqyqeF8jzV/Vs0sg4+zy4RYvIpvKIaC05k16TZmxQCjSV4Iw9ZwShVRc
         ePT4xLYiGIU7NPxXHSVocJPcpikb2nHmkWsWLOoC5rAlK+joGAL/0ulK9p8aJrqc4SpC
         95AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7CfuvJ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020a05622a13d000b003ff22cb10c2si671632qtk.623.2023.06.20.04.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:38:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7CfuvJ4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBZgF-0001fc-20; Tue, 20 Jun 2023 07:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBZgD-0001ez-CN
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:37:49 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBZgB-00031k-OP
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:37:49 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-988c30a540aso248812766b.3
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 04:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687261063; x=1689853063;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NlcyhHNvDrJNX9TUNb2y+2zQmpobE3soADxRX3PU0G8=;
 b=x7CfuvJ4XnBWvC3U0UYnbGtSgl13uWMZnrMwdhWRz0o38iXJ4kjOr7EEXfkBp01CPR
 VUYZzxpGMJI+2m/rhwlIPMaxeZLa7rXTs6fRaFFoqG8LGtmmJ/SnUjb1pEGdPbiybRwG
 22g4BnJN+qBay9wwINRoKAOtASXhumnxCND4CtZm9KlGihov8Tm+ZBOqr82aNEoA4+YX
 B2/hPr68LNCtNOADjzCEehGOHa7BZ5uZRPY7HEIZ4NpZUs367j1SLbopMnB09fgiIBVt
 TNHBGz5+8GSIEy87Mze5drZ5g2kWxMlOyFruK/5sB0UkwzfPtYjq6O+OKYMZX8by4q+2
 4aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687261063; x=1689853063;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NlcyhHNvDrJNX9TUNb2y+2zQmpobE3soADxRX3PU0G8=;
 b=TE2+NyEioWtE1OhKipapvasUB792mmx971MtwEULU+pNXgVgGwzIXLuv3J/OitIGvz
 7ZXCrkih6kcrKbPYlDlEdZLuVdc6VLxyjias4z9mPB9WrcNt/yd8/cdGTdBTi9usiL3V
 oscp5YwagX/qB523QYs1XdaKvOjHLy5+CDgA6F0V7eatavPD6hn03p4SfEHz20wSsgDl
 /ZlPnJrUKbkOoL+SsnmMtEKFB5TTdGtfsxPr91EC4w00HWxqBVhlKHCxtuSuJzraXpHT
 LEIrBrsoEn1GY+yK+QM7t19yGC327AvnBtdpDVeSWLXK6wMh/w4lMqnOf24ousFVSMPT
 2Nfw==
X-Gm-Message-State: AC+VfDygWCGwjHu8r6+t8AQNt7zXPSWK8XJIAPvK6810f2eSxGsKriRa
 JjnlhjQ7Ydbiknej2/hoN6vfnA==
X-Received: by 2002:a17:907:26cb:b0:96f:e5af:ac5f with SMTP id
 bp11-20020a17090726cb00b0096fe5afac5fmr10606869ejc.47.1687261063328; 
 Tue, 20 Jun 2023 04:37:43 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a1709064a8900b00985767bb5f9sm1221958eju.70.2023.06.20.04.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 04:37:42 -0700 (PDT)
Message-ID: <5baebd7f-d023-1b8d-4638-3ddc2c5ef5e7@linaro.org>
Date: Tue, 20 Jun 2023 13:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 22/34] target/arm/tcg: Reduce 'helper-crypto.h.inc'
 inclusion
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
 <20230619155510.80991-10-philmd@linaro.org>
 <02f54fc1-0ceb-d905-85b6-81892345778f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <02f54fc1-0ceb-d905-85b6-81892345778f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: FcGH1gKRLLMc

On 20/6/23 12:38, Richard Henderson wrote:
> On 6/19/23 17:54, Philippe Mathieu-Daudé wrote:
>> +++ b/target/arm/tcg/crypto_helper.c
>> @@ -12,12 +12,17 @@
>>   #include "qemu/osdep.h"
>>   #include "cpu.h"
>> -#include "exec/helper-proto.h"
>>   #include "tcg/tcg-gvec-desc.h"
>>   #include "crypto/aes.h"
>>   #include "crypto/sm4.h"
>>   #include "vec_internal.h"
>> +#define HELPER_H "tcg/helper-crypto.h.inc"
>> +#include "exec/helper-proto.h.inc"
>> +#include "exec/helper-gen.h.inc"
>> +#include "exec/helper-info.c.inc"
>> +#undef  HELPER_H
>> +
> 
> foo_helper.c does not require helper-gen.h.inc.

Right.

> Usually we put helper-info.c.inc into one of the translate*.c files; 
> probably translate-neon.c in this case.

Yes.

