Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1017070ejb;
        Sun, 21 May 2023 23:40:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5aytROjvCFUAZGPsInyeinjUUBleqkY1eZhXJj5VzHbblNWomNBd0YMC88oZNavAVr2sC4
X-Received: by 2002:a05:622a:1213:b0:3f2:a58:7a7a with SMTP id y19-20020a05622a121300b003f20a587a7amr16609076qtx.58.1684737602926;
        Sun, 21 May 2023 23:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684737602; cv=none;
        d=google.com; s=arc-20160816;
        b=aFnOD3+TIOkUjTqaEwcykXG0pDFAoym0dJx7xwe8uWNjzg5n3ylcNa5fwMBqqoYbhH
         vc2eMmc9ZUDc0fV73HrcVF5F8wLq0GXj4Ir2eR1HPo0dQwLV6Ncc9HHMKnSXBCk4hjpq
         PrB/5Mqp9kORLkb5S2jZ3V01VDidMVEaHTYSkMBf2h2zUqwvQzOSHUSQt2o4yUz7pEDE
         Ra4e8XGnT/RUBprflDU8m74P0pSbEXgJmFOb40ffgBMilydD94zNMgIge0/eY+7VMpv6
         pn4WLu0CC1UwGRaSSNBwFPTqt75DhEduHamzd6xeUgtQWZsL9s06Ft3Rn3I30TxTnoxT
         5V5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ziJGrcpZMFVJf/Djn7qKg2eNeHrS7yl4PYZwZSIWiJU=;
        b=oXT59GBT1UHtlYGE1PxhDIWY1lqihqXbfrJoagqRHkel9y9BWdcqGDE/KrBNM7puF3
         dH66xiqBoDR2R5WCOX132j60ewdN+MGJjpHTo6xQpRbd3FsocaC2yDdV9sdevq+sHZrj
         eUqsyn07HyG/r0twRUzHixMvLRXorRlz1xCP5ksytnfTJvu2yM+AzCHpvcNs586CVyu1
         Bo7MdR8FApcA3QgyXWBHa/7Uf40w2L/vIqmdJyBD9QP+s9NGSGvB6br6R8g6KX+TxA8a
         /845evFhQe4ClqJIIB9l0SqCVxUjcV+cT30EQhPihaquRyHTnRDTdoQmXeUh0P2UYZKR
         Pmwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwDP2Jdb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020a05622a064800b003f0a603ac5dsi3326741qtb.153.2023.05.21.23.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 23:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwDP2Jdb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0zCz-0000fV-HW; Mon, 22 May 2023 02:39:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0zCx-0000dX-Ah
 for qemu-arm@nongnu.org; Mon, 22 May 2023 02:39:51 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0zCu-0007r0-MQ
 for qemu-arm@nongnu.org; Mon, 22 May 2023 02:39:51 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f4271185daso55876145e9.2
 for <qemu-arm@nongnu.org>; Sun, 21 May 2023 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684737587; x=1687329587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ziJGrcpZMFVJf/Djn7qKg2eNeHrS7yl4PYZwZSIWiJU=;
 b=HwDP2Jdb5+HHRmfBShsKl6HELCNBQ53W42jh8657QViYUHvrOZJbQnZg+i5mv+OTVj
 Y6MSNjZDjESOQP2QAONORE1D9EBC8bXGMYzn418hO2TBgULGP4uInvHVY7fqyoQ7Hkxh
 1z74H1TuydPhbX5ApKJpWm+bF2VQH0IFmFpfRjfVj+VikOvBwsV2h521R1+L96xK7wid
 +keaUZmyGgOB2R3Nrsz4olv9qgZIUgRyUiEp1TWeAfkP7Pie5yFJYYUSM4ejjxGvcPjv
 c88VfLYQ4vBM5ScsKJfweDl6ntIaUIKugKfLfJQ9a45Mdzo/2XO3wBwq8uOXwyJRYmNP
 w8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684737587; x=1687329587;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ziJGrcpZMFVJf/Djn7qKg2eNeHrS7yl4PYZwZSIWiJU=;
 b=PJCMlLEOyuPXFIX29vLHp7HW8dSR7FVYLhpWC0oD78nmhzDgLs8dEVzd25ePY24XTE
 leXZeldmXmqhNds//A3g2aB+gEWv5pwvJ4r6RLsZOJy/kVtKUmgh4KGyeuXcJMeiSJ/C
 Zz2EM7V7mTDmLV9aW0EerHJjafIMeDrtTJfXcnZQf0YV0hU30skS8zgPg6ltKCFrzKYY
 fxfMdkd+uQx8HNryXlseJ2Gu+ayaBf+o2pUcyV5kula60LmYOPJ1hOXhmHhiRjyKicwM
 cj9NBPKExmPz9JcSdymMNwyid5RYfrj0E6VK4C9wDb7jsoeM0muahCaGYuyigb5vliCH
 2DTQ==
X-Gm-Message-State: AC+VfDyO5nuI5y4PhE/qIZCyaIIVtLaAQPhQYrfxCqtdILUm28tvNTrz
 s2BiRvdp+HAOnZR7p/FNCWsSUw==
X-Received: by 2002:a7b:c8ce:0:b0:3f6:15f:e401 with SMTP id
 f14-20020a7bc8ce000000b003f6015fe401mr2745309wml.37.1684737586898; 
 Sun, 21 May 2023 23:39:46 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.153.164])
 by smtp.gmail.com with ESMTPSA id
 m39-20020a05600c3b2700b003f07ef4e3e0sm26340707wms.0.2023.05.21.23.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 23:39:46 -0700 (PDT)
Message-ID: <5a8ef696-5833-5a6d-7b60-e946f0bdcdb7@linaro.org>
Date: Mon, 22 May 2023 08:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 16/27] accel/tcg: Unify cpu_{ld,st}*_{be,le}_mmu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-17-richard.henderson@linaro.org>
 <8d6e67d7-52c0-aa60-76cb-bf70d586cf7a@linaro.org>
 <015fb09b-6f34-dec4-d241-8fc5c9a44d7e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <015fb09b-6f34-dec4-d241-8fc5c9a44d7e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: BFH259Yeed2t

On 21/5/23 17:00, Richard Henderson wrote:
> On 5/21/23 04:15, Philippe Mathieu-Daudé wrote:
>> Hi Richard,
>>
>> On 20/5/23 18:26, Richard Henderson wrote:
>>> With the current structure of cputlb.c, there is no difference
>>> between the little-endian and big-endian entry points, aside
>>> from the assert.  Unify the pairs of functions.
>>>
>>> The only use of the functions with explicit endianness was in
>>> target/sparc64, and that was only to satisfy the assert.
>>
>> I'm having hard time to follow all the handling of the various
>> ASI definitions from target/sparc/asi.h. ...
>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   include/exec/cpu_ldst.h     |  58 ++-----
>>>   accel/tcg/cputlb.c          | 122 +++-----------
>>>   accel/tcg/user-exec.c       | 322 ++++++++++--------------------------
>>>   target/arm/tcg/m_helper.c   |   4 +-
>>>   target/sparc/ldst_helper.c  |  18 +-
>>>   accel/tcg/ldst_common.c.inc |  24 +--
>>>   6 files changed, 137 insertions(+), 411 deletions(-)
>>
>>
>>> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
>>> index 7972d56a72..981a47d8bb 100644
>>> --- a/target/sparc/ldst_helper.c
>>> +++ b/target/sparc/ldst_helper.c
>>> @@ -1334,25 +1334,13 @@ uint64_t helper_ld_asi(CPUSPARCState *env, 
>>> target_ulong addr,
>>
>>
>> Shouldn't we propagate the ASI endianness?
> 
> Already done in translate, get_asi():
> 
>          /* The little-endian asis all have bit 3 set.  */
>          if (asi & 8) {
>              memop ^= MO_BSWAP;
>          }

Just in front of my eyes 🤦‍♂️ So:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Maybe amend the commit description "The ASI endianness is
already taken care of in get_asi() ..."?


While looking at get_asi(), ASI_FL16_* cases overwrite
'memop', possibly discarding MO_ALIGN bit. Maybe this can't
happen.
