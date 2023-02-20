Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2662880ejb;
        Mon, 20 Feb 2023 14:15:59 -0800 (PST)
X-Google-Smtp-Source: AK7set9Zx1jNmSZCtpT2NYm0zsWb2Z7TOYgedqPeey0gtaPynFxw46l0zf8cbuQiEzjUxpA1tk83
X-Received: by 2002:a05:622a:1348:b0:3b8:2dac:b5e1 with SMTP id w8-20020a05622a134800b003b82dacb5e1mr2479482qtk.37.1676931359802;
        Mon, 20 Feb 2023 14:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676931359; cv=none;
        d=google.com; s=arc-20160816;
        b=iwMqj8LyF7Nuh7baAqiJyh1KBuYh/SWSbONMkjRw25WDDkdJB2lGqH5gBDzRsf9tLQ
         A/8cElUJZCi85o+J7FAg3unrLymY74zBDzQ3I/4/Z3ysaBca0SZCTwYJnKNY4SrVg4aG
         8BX5au1T+c8UN1QSx+3Pb23SQChGEi8947ApwfRu8B8fmt/oU/EA6v59iqpDCE3+sYFn
         TAvNJMuNw7QJQnt7nN/fHb8vwI2aglRwS0v+DKpBNIMb3lpvAzLzXT9xTAmibXJSfWeW
         BFXVt8IZg9Vww76WP7OhYRjHptZ92VoTx4kLIKXCUvisxZZUjiD9TGPVtZnKqw45rS9w
         lVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oGYK1kEwDOGBP0QTQgXqiJT/6f3zfaM5MoyEKoSQgpE=;
        b=j3tRPyqa/LSbNmzeZ96I08Bo7QTOyf8j+5XjOH8K9ZTbX628Kt1SQyfDsGLSyUoQDa
         HW3crUQMfeg3bYLkeW3K8FwWiwreYrCr+okqwugfUyhpiqYlhlG0E7s9S9Gd1KYfatUT
         JbBK+hLJFBDTNxz0ioWbUC8dEQd4PlccoptCJLqzHq38qDhVCowHZKwKUL1XClrlaFQu
         lq1t0V3JHAKp6v3FI9HhSTZw6FXqhADX8XZP0fdSrln7PNJ4I+Yj3joJPamNkJJty95q
         hfF1vmZkVJsM7uAnGv6bGln1/L9b1PSFz3R5852Y/Kox24VzNXtG1snnbVzCDi+l5+p7
         X4zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMIehveH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s37-20020a05622a1aa500b003b9b4028d7csi10865492qtc.403.2023.02.20.14.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 14:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMIehveH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUERj-0003O9-9F; Mon, 20 Feb 2023 17:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUERZ-0003Io-Pm
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 17:15:39 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUERW-0004kq-9f
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 17:15:33 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 v3-20020a17090a6b0300b002341a2656e5so2655368pjj.1
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 14:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oGYK1kEwDOGBP0QTQgXqiJT/6f3zfaM5MoyEKoSQgpE=;
 b=WMIehveHFbOsyYv3HOlMy44chuCYQC/TmnoQZa7w8g9CLchxn94Iw5WI3j5m8ETHC8
 VGV890bHGn/dsIXZGbKmQC+36xXQHt+0TxA+TWlPXcktH8KB7buUKuM9Sgovyze5RDgy
 6DPyl6VQbgUcPS8R+i1ky06H/hwexcolrcNt/JeiU8E9misoQT8BkjIkVwq9vDI9C/tA
 FNyougrbDcEJ9uDIDlRJnY1lvm8OXT/y1BAJLlT8nR6oEJzIYoOBkGlznRb6bjqaE46i
 Rf5UcsogePpcyOLKulIc0qsdjhGChAT2AjLPqAulCBR0tejZ1Mz2B/NijFzi4d+Fj/N6
 emsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oGYK1kEwDOGBP0QTQgXqiJT/6f3zfaM5MoyEKoSQgpE=;
 b=Wen1YAp4/DimdfuUBZYyO0L7Ld4Y7lIux2+Zo86TKdtNxLyX4qce0hZ+nozsdrxr0R
 G/Cq/oZ6zeqAt5W7dDnpznUOltHv4M+DDpynEEapOcNPKPP3CJnzRmUUG6C+H77KLi3Y
 UAxsmmNjh0PeClY/1ZZ5FC+fnEcs4iP7Tfd29WK+5jkiArfPV0Xpuk9DDP0ZfMlfQ01Q
 /Icmo9r7DIXPrOrAtNTI3rfTTKDf52oqx0ibOXP+HmkjgylnqdMq5UVtB+apEXUPGjAu
 Rr5sTeyWndRX0XmhiWpCWVD23AkF4KAGRedrDupooZzrMed/2iAdfyCtdx5uapzPIcMI
 TBxg==
X-Gm-Message-State: AO0yUKVYeNOLRIy/oI57ibt5utQfz7zkffIzH4S/oLSkob2fzf1omgKX
 +gaACZ43UHALz3lMSO8QwPhyYQ==
X-Received: by 2002:a05:6a20:1587:b0:be:9478:55ba with SMTP id
 h7-20020a056a20158700b000be947855bamr3919606pzj.60.1676931328359; 
 Mon, 20 Feb 2023 14:15:28 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 bk3-20020a17090b080300b00230b572e90csm666359pjb.35.2023.02.20.14.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 14:15:27 -0800 (PST)
Message-ID: <38422576-703c-7955-2f55-b9c8de922902@linaro.org>
Date: Mon, 20 Feb 2023 12:15:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 17/22] target/arm: Use get_phys_addr_with_struct for stage2
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-18-richard.henderson@linaro.org>
 <CAFEAcA9-ufibbm_Fp0spGK+iQKLgGcJfED=+c__q37mQFwAWxw@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9-ufibbm_Fp0spGK+iQKLgGcJfED=+c__q37mQFwAWxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Em/p4z6mo5L+

On 2/10/23 03:28, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This fixes a bug in which we failed to initialize
>> the result attributes properly after the memset.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/ptw.c | 13 +------------
>>   1 file changed, 1 insertion(+), 12 deletions(-)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index eaa47f6b62..3205339957 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -32,12 +32,6 @@ typedef struct S1Translate {
>>       void *out_host;
>>   } S1Translate;
>>
>> -static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>> -                               uint64_t address,
>> -                               MMUAccessType access_type,
>> -                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
>> -    __attribute__((nonnull));
> 
> The definition of the function doesn't have the __attribute__,
> so if we drop this forward declaration we need to move the attribute.

Eh.  It was useful as an intermediary during one of the ptw reorgs, but now that we've 
eliminated the use case in which NULL had been passed, it can go away.  I assume you'd 
prefer that as a separate patch?

>> @@ -2854,12 +2848,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>>       cacheattrs1 = result->cacheattrs;
>>       memset(result, 0, sizeof(*result));
>>
>> -    if (arm_feature(env, ARM_FEATURE_PMSA)) {
>> -        ret = get_phys_addr_pmsav8(env, ipa, access_type,
>> -                                   ptw->in_mmu_idx, s2walk_secure, result, fi);
>> -    } else {
>> -        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
>> -    }
>> +    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
>>       fi->s2addr = ipa;
>>
>>       /* Combine the S1 and S2 perms.  */
> 
> Does this do the right thing for PMSAv8 ? The code in get_phys_addr_twostage
> sets up various things in ptw based on s2walk_secure, which (per previous
> patch) is not really well defined for PMSA.

As far as I can tell, yes, since as you say current PMSAv8 is all NonSecure.


r~

