Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp712697ejb;
        Sun, 21 May 2023 08:01:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61YHyI4MkfZEmhOJsoFGOSpqVOzGUrVQ9pRfcPgDPwI17iz2zpu6gcZMi+S/hsiogl5NVs
X-Received: by 2002:a05:6102:2f4:b0:437:e5d1:a0e0 with SMTP id j20-20020a05610202f400b00437e5d1a0e0mr1824772vsj.19.1684681277498;
        Sun, 21 May 2023 08:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684681277; cv=none;
        d=google.com; s=arc-20160816;
        b=BbMY2Fj/B1GkxH09oQ6ukkPdjP/6lGJ5AH3M420pWKCvZ0HWFqFYr/FovoBWjk8FZf
         Wu7KtYIFgzKuWgSS4nFQz5ZfK4NUn2PaSV2XQNs+5KMLhF1BImmMegoxn+V1MNwe8nf+
         qW0RDO8zaZHDFjkTyPpCpPvI737idfgjn1M1QwVrFD993OhRAi02e/XzUuUbRp/aprt2
         16qar3aGwrGQ0TSb1h2/t7E5fjqhhO1rex2FfAlo3vfPvQtCF8bTY81QtfR4bxBif/Lu
         mehP2zimUUkngUpbb0dObI/FOzfWfOHqgAPy8xsnEcC1F+CvqQds/3klf3rihzNJyCDb
         4ggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yHSn/Esv6cszlwmmwaTaf9CKHsOKsa2WOrnGwYQfYrc=;
        b=XiRZ6kuyc8iTklstWgJaAOvZODSBN/s20JQzqPq4rMQc8tHy8P0LwWwX5YDEzxgazD
         4B/U8ZC7UjyiA7JBYFbTiQnkTy5Rg5/433S7N69S7beJDZNGw7qdZUQaMKAnnhdCrvao
         S34YGjvQzL6sa+uU/yXee2vUBRicfFJxMFEFcX1cYqxWyVgzWpG2clG5YN2wjIMiKCxr
         GMtzKWCukaakJxfFr/kME+9LfRIpCRDDA8kTPK4zIxgDOWdn31PPab6TBnPaU2Iamf/v
         Ia3qAyOTRizBdyWjBf99V62Gc/ZpgaNWAFUQdnyHNaO5SSE/2h3AHJYxSS9YmWX/0e0J
         Jd6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNkUeErr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7-20020a67ae07000000b004364c93eb7bsi369540vse.751.2023.05.21.08.01.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 08:01:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UNkUeErr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0kYL-0002Pv-0i; Sun, 21 May 2023 11:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0kYJ-0002Jl-Ad
 for qemu-arm@nongnu.org; Sun, 21 May 2023 11:00:55 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0kYH-0005y5-Nc
 for qemu-arm@nongnu.org; Sun, 21 May 2023 11:00:55 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-64d2e8a842cso1958367b3a.3
 for <qemu-arm@nongnu.org>; Sun, 21 May 2023 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684681252; x=1687273252;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yHSn/Esv6cszlwmmwaTaf9CKHsOKsa2WOrnGwYQfYrc=;
 b=UNkUeErrMfHpMSMAips/GO9r1O7YXmUwgiVmd6QniZmBa0UqDIvpJWsrEMLxp660vi
 ZdvCOzKScZTuIMupPJNdRwSdUlyWwpOZ147l3OsRdBUIgB5PJxPdI8Fy3bw6c9e+5Lpc
 gjVdFa21cxFHbZypsGZSLIEdmLnn4CQwf2kR1p8tiG/F0qxB9bn2boew5jP8VYI4QX/j
 lE1mcqgm0qdvmijon3JA+8PXANmLJVQJysYw17gfJ5fsgPGT3+pxxiTFLhPZYjOGOIDJ
 PChRv9VvBB8+N7EDgjO+xJL9pVd5qooJB2wZMCWBn6rwf4OOenqO6rx/2mfnDBy2BrdE
 6ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684681252; x=1687273252;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHSn/Esv6cszlwmmwaTaf9CKHsOKsa2WOrnGwYQfYrc=;
 b=P2R5BhZoEQCeoIspOkVzRS48HBM1yvN8BSuGixE+uh4WX104CfjK2oiYC/QANuaFqh
 a5S5wZ58WLTPLT2prZNs+AZQPj4jRLQVUCDrwm1Qec/Eaamjr2GFhgxOuZo7QYHopt3H
 UMszsjhfl3JOebX1HJ2CfgsnsaQblzMTxKvtnjKy0KXrQ1Qh0D3V3/SFtOclyu1GsLpq
 yMi2BiOMldh4vXIYWRMbrUaXxO9MTQ1dRizSke6VgCVqSMuyPh3jerhhiXkrokvVWJFk
 P56Vrfep8WLn4HiBGgrfCOfPP6wkdvWfL/nd4+h0IMeiUEik0s9VsaOSVCE22n6SCfxZ
 EgEQ==
X-Gm-Message-State: AC+VfDxBlX937CPgxk4YaA0voDEJfwo2KSTso/VrgF7nRFtQFo4Q6Xwf
 j5NOPhL+D2dsMN8oFj3mQn1vG7CPm8D646VG48A=
X-Received: by 2002:a05:6a00:2d1c:b0:64d:7225:cfff with SMTP id
 fa28-20020a056a002d1c00b0064d7225cfffmr190769pfb.8.1684681251386; 
 Sun, 21 May 2023 08:00:51 -0700 (PDT)
Received: from [10.40.30.162] ([66.172.120.86])
 by smtp.gmail.com with ESMTPSA id
 c24-20020aa78c18000000b0064b0326494asm886861pfd.150.2023.05.21.08.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 08:00:50 -0700 (PDT)
Message-ID: <015fb09b-6f34-dec4-d241-8fc5c9a44d7e@linaro.org>
Date: Sun, 21 May 2023 08:00:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 16/27] accel/tcg: Unify cpu_{ld,st}*_{be,le}_mmu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-17-richard.henderson@linaro.org>
 <8d6e67d7-52c0-aa60-76cb-bf70d586cf7a@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8d6e67d7-52c0-aa60-76cb-bf70d586cf7a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-TUID: r9u4HLQrIpJp

On 5/21/23 04:15, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 20/5/23 18:26, Richard Henderson wrote:
>> With the current structure of cputlb.c, there is no difference
>> between the little-endian and big-endian entry points, aside
>> from the assert.  Unify the pairs of functions.
>>
>> The only use of the functions with explicit endianness was in
>> target/sparc64, and that was only to satisfy the assert.
> 
> I'm having hard time to follow all the handling of the various
> ASI definitions from target/sparc/asi.h. ...
> 
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/cpu_ldst.h     |  58 ++-----
>>   accel/tcg/cputlb.c          | 122 +++-----------
>>   accel/tcg/user-exec.c       | 322 ++++++++++--------------------------
>>   target/arm/tcg/m_helper.c   |   4 +-
>>   target/sparc/ldst_helper.c  |  18 +-
>>   accel/tcg/ldst_common.c.inc |  24 +--
>>   6 files changed, 137 insertions(+), 411 deletions(-)
> 
> 
>> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
>> index 7972d56a72..981a47d8bb 100644
>> --- a/target/sparc/ldst_helper.c
>> +++ b/target/sparc/ldst_helper.c
>> @@ -1334,25 +1334,13 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
> 
> 
> Shouldn't we propagate the ASI endianness?

Already done in translate, get_asi():

         /* The little-endian asis all have bit 3 set.  */
         if (asi & 8) {
             memop ^= MO_BSWAP;
         }


r~
