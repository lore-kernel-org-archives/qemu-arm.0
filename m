Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4098838lfm;
        Mon, 24 May 2021 20:33:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytohc4KLSCVUTkZkXRS3bpqzv8Cj8eFZ9kTzEqTKPioxVOO+Z6XNbRCrv3ezHdHx35tosf
X-Received: by 2002:a5b:4cf:: with SMTP id u15mr41506138ybp.118.1621913639082;
        Mon, 24 May 2021 20:33:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621913639; cv=none;
        d=google.com; s=arc-20160816;
        b=utIZnu4NPurjCWouBiAFiulMONY1598ZPqD/K4OlHDq/1vK6k2J0QXzTxHrmgFT7d/
         9Ty0pP3bu+UDsuLpJf8hnSSX7AeDLRL+61/PW2eeQnCEgLmm7HSOHRjoooE3qexoNSPr
         p4aMWVAwmnPt//WAAm1jE98CtNdYL9EEhA1/+QGqPRLTBhijihDFR1olQLhLfDPQ/T52
         FDoL/3FusPxSnNBZotqagD72Q0cJKive+j1PRLv/Dmw1QuUg5CTnSNyxHVG9RhLUqmlS
         d8axyk7QBmQipgFRUgK136KE7/AUjb+KCnd/BP265XbZachUIYWHr9K4vqYKSuQjwQ7K
         ZgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=BRyK8JXAIjSpxD7wSdm/ZF3k1fYzWV8vj2N0FQRMDGY=;
        b=lhlN+adlJVscu/t+nkGd4kmov8MCZdtMPFjxhWPmqXP5Ts7+1DfRfEIdCPqN7cpidk
         Xfy/JB/3F2iq/aM2X++iSNHAevauPT9nnfiCpL/XzB/TKnreRtUHccTowGMj92OiJbFs
         hRdPwwS554a39SndKxaTwxHg22+bhdijKRBY4mgqXPQ2BzE8TP3E9MLVb3+QZ27N5MiL
         xZGXEdhJtaG8KW3Q+aUfzwKUVqlneAw/ZhhrzIi7bNoirUYFv2m5F9h7hBvB+15bdQci
         iHA1lZVjUeFEYvaefY0GZziwidUKxD5eYljw1ElWRSwgJeUHlH904N4K9h6oCw5jM/Mq
         8MAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SoXxoj9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i73si4728242ybg.441.2021.05.24.20.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 20:33:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SoXxoj9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llNpO-0000Wl-GI
	for alex.bennee@linaro.org; Mon, 24 May 2021 23:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llNp1-0000VL-FZ
 for qemu-arm@nongnu.org; Mon, 24 May 2021 23:33:35 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:35407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llNoy-0005m6-5J
 for qemu-arm@nongnu.org; Mon, 24 May 2021 23:33:35 -0400
Received: by mail-pl1-x62c.google.com with SMTP id t21so15671425plo.2
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 20:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BRyK8JXAIjSpxD7wSdm/ZF3k1fYzWV8vj2N0FQRMDGY=;
 b=SoXxoj9qWmaAxjpUxkezSArgqRzQU8Csc2YG5935tAJriY+L/oP6+2lDRIegCC5/VZ
 8Qi3cZPzRjd4uIqNBtCcEwqdzkdUc0Ip7RaJEHhWmmVj4l4/J5JKO6tlfxZkbPpOzbB+
 uDoG9MZ3Ugu/a2JHDM1HeEm/z96jmqUx1pIHZCyiK8om6nLx6IBM9hLSIURY75Fb3QqS
 8ccAXUfPtrgK7fl4nYieAnkfmy42JvExz6bvoCAcnOQ9Hm7x3u7HEOUC9J9fwhrOrFTm
 nyDKpGGLKA+/W/EeNc1sRiZo6iq2+q7aag1LfYYKmEmf65Oi/AVuwFOx0Pniv3CtsZ+r
 NYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BRyK8JXAIjSpxD7wSdm/ZF3k1fYzWV8vj2N0FQRMDGY=;
 b=FSeXidZbPTL/fX+ArApvU9puO1B6wVASJysmimxFFaitKjdLIRChymkDeeQO7Qp0e5
 5pWXNuYnlVPCmryIM2yaFfDFmH5AHUIvIMq2wloE0rqp4pQeUvV8qRPpJddzLfqS3RAs
 IhsJnHiNBmJemcq4VT/Plt0HtGAtoaAizYlxTSOkRqrx1zWcEJsLIh5/vcrW+SZImYtq
 AD1a0JoJJkt3QtOzneFbGBIKBu8Yx9j1mtAxtPRyEa7KVYoL8eOUqiNQ/CQGO+QhAznu
 vwqS73dmFBbTyxTX8yg7qmukBhSb43vDYs+Ol1tul2bM0VyGG6XZ1jkPUWYtDtkFlsAE
 puLg==
X-Gm-Message-State: AOAM530K8x2J1e+JIbrZbn1NamnmeTHw5oc/NgmErHQros8CzODWJ6Rs
 FvU9VoFCf69yP4V05pFLvshcvg==
X-Received: by 2002:a17:903:20ca:b029:f8:c1d3:74a0 with SMTP id
 i10-20020a17090320cab02900f8c1d374a0mr13143720plb.10.1621913610599; 
 Mon, 24 May 2021 20:33:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j20sm10170645pfj.40.2021.05.24.20.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:33:30 -0700 (PDT)
Subject: Re: [PATCH] target/arm: don't clobber ID_AA64ISAR1 pointer auth
From: Richard Henderson <richard.henderson@linaro.org>
To: Jamie Iles <jamie@nuviainc.com>, qemu-arm@nongnu.org
References: <20210524084306.1666265-1-jamie@nuviainc.com>
 <4e65bfd0-545f-4b38-c043-65c2e90e0e5e@linaro.org>
Message-ID: <c1bf2744-0448-51c4-551a-779f00af5a2e@linaro.org>
Date: Mon, 24 May 2021 20:33:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4e65bfd0-545f-4b38-c043-65c2e90e0e5e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, leif@nuviainc.com,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b4iFLw8Ai5Y3

On 5/24/21 8:29 PM, Richard Henderson wrote:
> On 5/24/21 1:43 AM, Jamie Iles wrote:
>> The pointer auth properties are added to the max CPU type but the
>> finalization happens for all CPUs.  It makes sense to be able to disable
>> pointer authentication for the max CPU type, but for future CPUs that
>> implement pointer authentication and have bits set in ID_AA64ISAR1,
>> don't clobber them unless there is a property registered that can
>> disable them.
>>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Jamie Iles <jamie@nuviainc.com>
>> ---
>>   target/arm/cpu64.c | 33 +++++++++++++++++++++------------
>>   1 file changed, 21 insertions(+), 12 deletions(-)
>>
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index f0a9e968c9c1..81c9e494acb6 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -575,26 +575,31 @@ void aarch64_add_sve_properties(Object *obj)
>>   void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
>>   {
>> -    int arch_val = 0, impdef_val = 0;
>> +    int apa = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, APA);
>> +    int gpa = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, GPA);
>> +    int api = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, API);
>> +    int gpi = FIELD_EX64(cpu->isar.id_aa64isar1, ID_AA64ISAR1, GPI);
>>       uint64_t t;
>> +    if (object_property_find(OBJECT(cpu), "pauth-impdef")) {
>> +        api = gpi = cpu->prop_pauth_impdef;
>> +    }
>> +
>> +    if (object_property_find(OBJECT(cpu), "pauth")) {
>> +        apa = gpa = cpu->prop_pauth;
>> +    }
> 
> This seems overly complex.  If the pauth property doesn't exist, can you just 
> early exit from the function?  And surely the pauth-impdef properly would exist 
> if and only if pauth does.

Alternately, the bug is that the pauth properties have not been registered for 
the new cpu.  Given the performance overhead of the QARMA cipher under TCG, it 
will always make sense to be able to disable it.


r~
