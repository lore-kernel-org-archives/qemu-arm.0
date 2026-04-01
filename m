Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516DB107639C
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 18:03:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7zuR-0002d8-Ui; Wed, 01 Apr 2026 14:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w7zuJ-0002a1-Ib
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 14:03:12 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w7zuH-0000Q5-Oq
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 14:03:11 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-486fba7ce4cso72689485e9.3
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 11:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775066588; x=1775671388; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HbEFdDvn6neWpKiDUepaoa94u++jPAa1XLU0w0qw3U0=;
 b=C2tEeDcTExAGpctRsgT91xEcI+htNBdHXf0bfVvqq3gQ4WO8dDV6cwz2Jx808mh7n+
 8bynd4/1HSfz0HjWLPDi9afL/oObf2pOuooRWMKsFTgM2EKbyl8iYXcmKFIu0YH+/Do3
 bDv5lIym/i726wt3gY/X7F4mnkeXiuVVMdbKe2W/Uj4veL8SOnNphHrMPMEjG7SZSXq0
 dAgZtHXuWfDT5T+bGbUK7WNr/DYw7nuHXY3gLMs4WNdZcgLVru3iymuzg9F0qP97ngXo
 Ipcj+XU0A3wAmTSE1re5xyIRdoeb6ilSp+4V8Pt1Pn/fvbD2ROn1NaIAp8hBVWGQDh3P
 Nlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775066588; x=1775671388;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HbEFdDvn6neWpKiDUepaoa94u++jPAa1XLU0w0qw3U0=;
 b=SpJIN1JtuQP47lBqZzziG5UMHUeLPrbskdp1UwzftUHbLjc+wx6hChWmPCrSEdMTKh
 VrgNzHV33oG4lnvdRn4sSpJnBY0a+F2LBmwV3W0pWtrg1/LWHm+1RBhVe9CZr6eRbVei
 6RWYAFykLpSK4SAKTmg4ddlu8jhq4XoqvIEfvcr3FhreHheYSJUWDWJDyIMTd/1jtjjj
 7I+CURn3aWdVYNjNVL4QdMIrbc9Op07gbUU/Y2VwcIvgxE3QxCImGBGvxFwVjCR4rm7K
 vFj4QUSsV9cIC9C6CWzTTk5RngIpWdkoi8q4cN6Bzl4DVln4wVG2a5xoWVbICTsVaYk6
 Osdg==
X-Gm-Message-State: AOJu0YwYtQU+JSrK5INo1NbhFtEF8BtwOlSHZ+an84z6xjxXcXeRu1tc
 9Qvp/oMYrjcrVGL6OGBWWgqiS2UYKSmy0pGAgpzcGAUZT7A3v2RpINGQsQaitINCdjU=
X-Gm-Gg: ATEYQzyJHy8RTCw3V60X5zN670bS//fmmxkQh5fF38r0x+fXM7zSr4Jxp10AvdmmusC
 Md17sSK8LjVmF/vlGxyDb/cs/rQpw17E2zZLH3RHAZD51rbrAU4T2FtszhUjKVnAEet/rQMGpUv
 yss756kJ/EcaUm4ANx39wHe2RJMds/1a3yC6eXrE3h1a9FL/hx37enF8KTLUoKbav2hEcIAMa9g
 6lZbECjnqRSysls5g8/lhOl/zaULsWvzLx5qFVgc+byh3XaN7TPBEe0bj2i71RK/RSDNhCRO6gI
 2vZM0Jt2zE4kQChzEMrb1WxDc/VMwPkTo294M8H9mZ+V+jgKwAlgVKDAN9QSVRtJMyHEtewqd8N
 OVLsJ/SpjuZgC5EReSLHpR1xZqdrn8zO77SMiNQ9oENCDTTplIs99xGN4pwV2haLl6gUdoPeQzV
 jww8HRH6aEZHjRLUIEUsj3ceuEYWzsgM47mwWTDOzsx4tX3puyXL0T2I8qed9ttBhu/w==
X-Received: by 2002:a05:600c:858e:b0:487:467:4276 with SMTP id
 5b1f17b1804b1-488835cd391mr61762135e9.30.1775066587603; 
 Wed, 01 Apr 2026 11:03:07 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a71f7sm1970993f8f.1.2026.04.01.11.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 11:03:07 -0700 (PDT)
Message-ID: <d3a2de5e-d2f9-4d0c-8d11-61e7d487c6e9@linaro.org>
Date: Wed, 1 Apr 2026 20:03:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] include/tcg/tcg-op: extract memory operations to
 tcg-op-mem.h
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-2-pierrick.bouvier@linaro.org>
 <75a472a5-3b7e-4fc3-864a-4d726eb0d88f@linaro.org>
In-Reply-To: <75a472a5-3b7e-4fc3-864a-4d726eb0d88f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 1/4/26 14:13, Philippe Mathieu-Daudé wrote:
> On 27/3/26 17:50, Pierrick Bouvier wrote:
>> This new header defines a new type for target virtual address,
>> independent from TCGv and is parameterized by a new define
>> TCG_ADDRESS_BITS (name was suggested by Paolo instead of
>> TARGET_ADDRESS_BITS).
>>
>> By default, tcg-op.h include set this define to TARGET_LONG_BITS, but
>> it's also possible to include only tcg-op-common.h and tcg-op-mem.h and
>> set TCG_ADDRESS_BITS manually, which is what next commits will do.
>>
>> We preserve existing MIT license when extracting this new header.
>>
>> Implemented from:
>> https://lore.kernel.org/qemu-devel/ 
>> a68321f0-3d54-4909-864c-9793cda05b2a@linaro.org/
>>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   include/tcg/tcg-op-mem.h | 126 +++++++++++++++++++++++++++++++++++++++
>>   include/tcg/tcg-op.h     | 100 +------------------------------
>>   2 files changed, 129 insertions(+), 97 deletions(-)
>>   create mode 100644 include/tcg/tcg-op-mem.h
>>
>> diff --git a/include/tcg/tcg-op-mem.h b/include/tcg/tcg-op-mem.h
>> new file mode 100644
>> index 00000000000..36931d1dd57
>> --- /dev/null
>> +++ b/include/tcg/tcg-op-mem.h
>> @@ -0,0 +1,126 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Target dependent memory related functions.
>> + *
>> + * Copyright (c) 2008 Fabrice Bellard
>> + */
>> +
>> +#ifndef TCG_TCG_OP_MEM_H
>> +#define TCG_TCG_OP_MEM_H
>> +
>> +#ifndef TCG_ADDRESS_BITS
>> +#error TCG_ADDRESS_BITS must be defined
> 
> Alternatively rename as tcg-op-mem.h.inc and check for TCG_TCG_OP_H,
> erroring "this header can't be included directly" or "can only be
> included by "tcg/tcg-op.h"?

Complementing my thougth, in "tcg/tcg-op-mem32.h":

   #define TCG_ADDRESS_BITS 32
   #include "tcg/tcg-op-mem.h.inc"

and similar in "tcg/tcg-op-mem64.h" (or "tcg/tcg-op64-mem.h").

> 
>> +#endif
>> +
>> +#if TCG_ADDRESS_BITS == 32
>> +typedef TCGv_i32 TCGv_va;
>> +#define TCG_TYPE_VA TCG_TYPE_I32
>> +#define tcgv_va_temp tcgv_i32_temp
>> +#define tcgv_va_temp_new tcg_temp_new_i32
>> +#elif TCG_ADDRESS_BITS == 64
>> +typedef TCGv_i64 TCGv_va;
>> +#define TCG_TYPE_VA TCG_TYPE_I64
>> +#define tcgv_va_temp tcgv_i64_temp
>> +#define tcgv_va_temp_new tcg_temp_new_i64
>> +#else
>> +#error
>> +#endif
>> +
> 
> ...
> 
>> +
>> +#endif /* TCG_TCG_OP_MEM_H */
>> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
>> index 7024be938e6..96a5af1a298 100644
>> --- a/include/tcg/tcg-op.h
>> +++ b/include/tcg/tcg-op.h
>> @@ -16,6 +16,9 @@
>>   #error must include QEMU headers
>>   #endif
>> +#define TCG_ADDRESS_BITS TARGET_LONG_BITS
>> +#include "tcg/tcg-op-mem.h"
>> +
>>   #if TARGET_LONG_BITS == 32
>>   # define TCG_TYPE_TL  TCG_TYPE_I32
>>   #elif TARGET_LONG_BITS == 64
>> @@ -46,103 +49,6 @@ typedef TCGv_i64 TCGv;
>>   #error Unhandled TARGET_LONG_BITS value
>>   #endif
> 
> ...


