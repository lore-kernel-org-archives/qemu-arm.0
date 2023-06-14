Received: by 2002:a05:7022:1189:b0:66:6ee3:fed6 with SMTP id ov9csp395944dlb;
        Wed, 14 Jun 2023 05:51:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7zYvu417TgF/rJkI0cg7sYED8AWgpLjv3Y5rZAVPMcCwhUrL5pYEaRCsq4aqJHEq46Tf+X
X-Received: by 2002:a37:5c1:0:b0:75e:4477:eb0 with SMTP id 184-20020a3705c1000000b0075e44770eb0mr14671350qkf.46.1686747074070;
        Wed, 14 Jun 2023 05:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686747074; cv=none;
        d=google.com; s=arc-20160816;
        b=qA1FCIGqEGNDsu8RHVjwpYuv6PFUEgQ3h03heLKmfRewJeKR76G7GVq/z39TYt9oVs
         NX7N53Yf0wjlY8lsD4SCWlokSsUcNFtwkVrnaeoAOXa1bfHeGWpAKGlgeDN+Dg+n3eEw
         gHh9yc2XvnEtO2h+izGaAgEREwOv84GF8GZNOIDr3iyFI+kyLU6rp5zlIbBu/29YjNsF
         Jx7UFRaYfIX9KHJ4MMQtufVqkMeMHmET0ojtjPiATzmCeo+q9HpPSa50QcrLuDE6DxQh
         XAq7zxMu1Zh5tOYsFLapkkrFqa4WG2qsG3qqejAESrvh+uWGPH4WWfYh/27B0/H8WLaq
         RLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bXSMApsqR9nj6eluBiAWfFP4Ryk6/8mLT2/aayiv1qI=;
        b=nFR4fbadf+7jfyLKrHefKohg/Qfhojwa4Pwrh/OPbweoPgU6EjErR70tFMNFyjB9go
         XL4b5n55HfO5BacV3apR2ErxrcV0eGz0h0MT9RWt+2vUjv8Q8ig6T1dB2UcES78j3J4U
         f7OTokb2IQ4oo4FrLrVZiWPAXQRzxVnJWfXQ/FsEWrt+dS6UsKnDhwlJq4sMQJSw6mco
         /wArGbcfwwid/sDwSQvlpGLIBYdaO7NKLvunoXYKBxcScSgAHOjXecwPCkPTBtdMd4B5
         KBRc0bCR3ct52c9Pr9JGymRg7Ke/Kdta9F32Y8TFvrTepGzFFe2chbPgtMTCQRkn1e/D
         NpyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bvRLT0xw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os1-20020a05620a810100b0075c8054a3ebsi8520730qkn.378.2023.06.14.05.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 05:51:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bvRLT0xw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9Pxp-00076d-Ts; Wed, 14 Jun 2023 08:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q9PxX-0006zK-1t
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 08:50:48 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q9PxR-00053n-Sl
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 08:50:43 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-518793ef6ebso2678106a12.1
 for <qemu-arm@nongnu.org>; Wed, 14 Jun 2023 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686747029; x=1689339029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bXSMApsqR9nj6eluBiAWfFP4Ryk6/8mLT2/aayiv1qI=;
 b=bvRLT0xwqYSWqrD1/t/ouc8sw6cpDLYnE39GPbvmwZepbpEP87gPXWuv3zZXKh1m6U
 Wvm7SKryVJvR1msEjsZ9P4Qrl2nrp7TrTb+QYHuSYp8znWqJArW86Em2taynLCf0vyJS
 CxK0HSpdgWJL/yiDQX6Hksf4esxO/ZbvY3V5aefchW9Dyh9KKKseskSW5cR3VogcTCNo
 dvl92OF2ky0yiWbkienYV6byXvrZ++mhFAkSZJM7W/sLKfiKIDAuDM/tinQKd5d4wHgC
 uWkPIM5EjM0sZ7XHCkjRDR+FLVunASHHkb9S9Z+Ta8l2Y7fPsyy4IohM4i0AfeNnTjLP
 /Ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686747029; x=1689339029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bXSMApsqR9nj6eluBiAWfFP4Ryk6/8mLT2/aayiv1qI=;
 b=LX00mujFuUx1Fe/UAhbqGyeitXzXqPDmDUnSxTuNpRLfRS83DPku0JI1hjDbWs0jKv
 /qkPDlJp17IJfLJpPZ7o8CBY5V3v28pCDOZ1Wxfp8DCKry3FadEcrPZKDt4cVqNXBJP/
 TRMSOMehktFPSoMYmrGgKeNi6Zdm8O18nGgcG5Hjk0/Xg98BoJLcKJc8VI9Xs3eAcpYH
 o7WWyJVpV7bgi7Wpax/ETwtPqunxujIlH3/Etf8zeFcZbltuUCNnx7E2Z5vIUR3J0nN8
 P+cPD9JXVmH/Pr+brGhFvqaV3ISPQXt5RSuDEAhpYZSbiRSbiGAhf1o8AAQiOItJTXph
 dLAw==
X-Gm-Message-State: AC+VfDxHUi0ZzEhxRQ4DfykM672Cil8Wg5ssuHqbX+B59kS8Z4cgKpjR
 xHO6yhtFnzroGu60Rl1OYbvHpQ==
X-Received: by 2002:aa7:ca52:0:b0:514:a0e9:3deb with SMTP id
 j18-20020aa7ca52000000b00514a0e93debmr9512536edt.23.1686747028732; 
 Wed, 14 Jun 2023 05:50:28 -0700 (PDT)
Received: from [10.14.201.118] ([213.175.39.66])
 by smtp.gmail.com with ESMTPSA id
 t18-20020aa7d4d2000000b0051873c201a0sm2168871edr.26.2023.06.14.05.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 05:50:28 -0700 (PDT)
Message-ID: <3f50cb09-1460-522c-dedc-02b1b99ce9a9@linaro.org>
Date: Wed, 14 Jun 2023 14:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v2 24/26] target/arm/tcg: Inline 'exec/helper-proto.h'
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230611085846.21415-1-philmd@linaro.org>
 <20230611085846.21415-25-philmd@linaro.org>
 <d4fddb7c-b0a1-6a52-b15d-e86f025c72ee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d4fddb7c-b0a1-6a52-b15d-e86f025c72ee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: S/xoQaq3l7HD

On 14/6/23 07:03, Richard Henderson wrote:
> On 6/11/23 10:58, Philippe Mathieu-Daudé wrote:
>> +++ b/target/arm/tcg/vec_helper.c
>> @@ -19,12 +19,15 @@
>>   #include "qemu/osdep.h"
>>   #include "cpu.h"
>> -#include "exec/helper-proto.h"
>>   #include "tcg/tcg-gvec-desc.h"
>>   #include "fpu/softfloat.h"
>>   #include "qemu/int128.h"
>>   #include "vec_internal.h"
>> +#define HELPER_H "helper.h"
>> +#include "exec/helper-proto.h.inc"
>> +#undef  HELPER_H
>> +
>>   #define HELPER_H "tcg/helper-vfp.h.inc"
>>   #include "exec/helper-proto.h.inc"
>>   #undef  HELPER_H
>> diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
>> index cbd78cc810..51f8e92ff7 100644
>> --- a/target/arm/vfp_helper.c
>> +++ b/target/arm/vfp_helper.c
>> @@ -19,7 +19,6 @@
>>   #include "qemu/osdep.h"
>>   #include "cpu.h"
>> -#include "exec/helper-proto.h"
>>   #include "internals.h"
>>   #ifdef CONFIG_TCG
>>   #include "qemu/log.h"
>> @@ -32,6 +31,10 @@
>>   #ifdef CONFIG_TCG
>> +#define HELPER_H "helper.h"
>> +#include "exec/helper-proto.h.inc"
>> +#undef  HELPER_H
>> +
>>   #define HELPER_H "tcg/helper-vfp.h.inc"
>>   #include "exec/helper-proto.h.inc"
>>   #undef  HELPER_H
> 
> Are these really required, or are you simply replacing what you removed?

We get:

../../target/arm/tcg/vec_helper.c:268:6: error: no previous prototype 
for function 'helper_gvec_qrdmlah_s16' [-Werror,-Wmissing-prototypes]
../../target/arm/tcg/vec_helper.c:293:6: error: no previous prototype 
for function 'helper_gvec_qrdmlsh_s16' [-Werror,-Wmissing-prototypes]
...

../../target/arm/vfp_helper.c:511:10: error: no previous prototype for 
function 'helper_set_rmode' [-Werror,-Wmissing-prototypes]
../../target/arm/vfp_helper.c:1127:10: error: no previous prototype for 
function 'helper_fjcvtzs' [-Werror,-Wmissing-prototypes]
...

../../target/arm/tcg/m_helper.c:581:9: error: call to undeclared 
function 'helper_exception_internal'; ISO C99 and later do not support 
implicit function declarations [-Wimplicit-function-declaration]

../../target/arm/tcg/helper-a64.c:831:9: error: call to undeclared 
function 'helper_rebuild_hflags_a32'; ISO C99 and later do not support 
implicit function declarations [-Wimplicit-function-declaration]

../../target/arm/tcg/psci.c:174:9: error: call to undeclared function 
'helper_wfi'; ISO C99 and later do not support implicit function 
declarations [-Wimplicit-function-declaration]

../../target/arm/tcg/tlb_helper.c:168:6: error: no previous prototype 
for function 'helper_exception_pc_alignment' [-Werror,-Wmissing-prototypes]

../../target/arm/tcg/crypto_helper.c:73:12: error: function cannot 
return function type 'void (void *, void *, void *, uint32_t)' (aka 
'void (void *, void *, void *, unsigned int)')
void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)

Do we need more tcg/helper-foo.h.inc?
- gvec / simd / crypto
- exception / wfi
