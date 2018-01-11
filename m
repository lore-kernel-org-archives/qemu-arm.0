Received: by 10.28.173.206 with SMTP id w197csp929533wme;
        Thu, 11 Jan 2018 11:41:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBovNo4khkXZEJWaZCavoY559jZjdL2onFL3HndhHHbxScMay5CkMBP2Xix6CruvhC3VROYYp
X-Received: by 10.37.211.8 with SMTP id e8mr22081573ybf.23.1515699684585;
        Thu, 11 Jan 2018 11:41:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515699684; cv=none;
        d=google.com; s=arc-20160816;
        b=sqG5E6/vyuLsV8ZEZzmloRVQKHHXOaM+6TzOdX4WoMV1FM33HCY6gIppjr8n39Lv2E
         Fe39q4h0vVp1YvugDG9L2+rY6V9l2/eXm9RJIugTxtWUZdVnEd4YkJhJTk98hkjjJ+Dh
         xYR04oNH1c1aTftmYoKqMYvAFvcB8FAYpvlIWuj6z9iZdW9w0EPUWToTXGCwHCqwM2VT
         RQknYRw9uauAhTEeVjK2aMp51+yApojNeQHvG2gCOKhbOcIrz+yQcoo34N5pGf9eol2v
         tPzUHiw+nAziBKNuLVAVUV5nW5RWbxhCpIo3NZVhSa4F6CNq7sFOxG39iVYozsNuUDaN
         Fm8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=7o6Rzl4+ph7FPLrODevW8/8H5rR7mMd75CeNLwDtBxo=;
        b=dbB0ijUeFWk/br8pG66jYd6WaXbHed/t8DAfdI8CZtnOSMxAzcRALIW66JKWOFPquh
         lCnQjjtTbxK5VkZQ2uokEDNq+BcTcMXBhvyrae+TtzAQ70oQonVYDCBXsLIROPm/ljtH
         Palo4eo5nOaGf1J6XTXFPz1d7LB/H/T9i6pQzmfbeDVwssqh0cQ2biRHyMnIbcntn7ou
         BqsqUXimqEQTBSM1qnfG7sfuvxPO+bst6szMuz1H/yK8GMw3L7f/N+PRGmcPkAnIV5yO
         gVBCZMwX+nqVh83rOSrtGPvqqj1iaoAW9cdV+s+OlvaIw0AqZQnm4FaAPAgksQSF3hMt
         MOXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AGgd0aq/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p6si3680389ybm.144.2018.01.11.11.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 11:41:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AGgd0aq/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZij6-0002yu-20
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 14:41:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiaM-00045X-IF
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 14:32:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiaJ-0006wa-Dp
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 14:32:22 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:36276)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eZiaJ-0006wA-6b
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 14:32:19 -0500
Received: by mail-pg0-x241.google.com with SMTP id j2so2864922pgv.3
	for <qemu-devel@nongnu.org>; Thu, 11 Jan 2018 11:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7o6Rzl4+ph7FPLrODevW8/8H5rR7mMd75CeNLwDtBxo=;
	b=AGgd0aq/ayiyr/B48F5oY45bjwpKqdlS4t6SyehX+phzTJxB4t0MacF6Z77GgHoAYS
	3cPgk5UNYWLZjn1WmTVvmgj3r8JPnJJKoO29MjVVH81a1s8Q5/ZVV+/pvTWF/aS4Mfs6
	cXzLPlpAwuaLFrf/qdf3n1GiI8scRFMSkkGtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7o6Rzl4+ph7FPLrODevW8/8H5rR7mMd75CeNLwDtBxo=;
	b=M+FSEay6FyKOPy20IV23hDnvycTN+OkCi5X7gF5GKOnAerVBsGBEIQGZGl/Xn2eQZ3
	bdWDDWJ2B0M8a9L9cb89H6MXnn8jh7XsZW7K/5eENmzWHv2QkQQ3VuXGdlaaAxW9FzX9
	DZ5GPRDytiG1NNKIc454+0jrEBvKJc86D5jc0lOutytEgyMCAOk99hKc9i8B55iIj1vm
	VmhD74LVBPr8eTw54DXognf9kGFAwTY75acpVFiPuF3hmdA/AR8bvSTA+kr5VqHkKIHg
	umd/XcJ8iGqjy1QVY/2jjTvCXGAi1swqf12KEVk5IkBhvGicEE8ZxVgWGNlj+JcHNKmP
	kO2A==
X-Gm-Message-State: AKwxytesXtqppWrpEmAMxA++tNyxGQqJ8I+3Rf2I3k2oqWlzZcgIsKAY
	H7DZslMJF9/u1jn19gOXvkc3ng==
X-Received: by 10.159.206.196 with SMTP id x4mr2593378plo.271.1515699138292;
	Thu, 11 Jan 2018 11:32:18 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-183-164.tukw.qwest.net.
	[97.113.183.164]) by smtp.gmail.com with ESMTPSA id
	y80sm43099267pfi.183.2018.01.11.11.32.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 11:32:17 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-10-richard.henderson@linaro.org>
	<CAFEAcA_DQwQzUS8Fce7zV=f+eo-MrFuh02fyT_OxKcPEVWh58g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8751b945-ad1b-b2a2-bb93-0769d6160aaf@linaro.org>
Date: Thu, 11 Jan 2018 11:32:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_DQwQzUS8Fce7zV=f+eo-MrFuh02fyT_OxKcPEVWh58g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-devel] [PATCH 9/9] target/arm: Add ARM_FEATURE_SVE
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 450WVFupsXqV

On 01/11/2018 10:42 AM, Peter Maydell wrote:
> On 18 December 2017 at 17:30, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Enable it for the "any" CPU used by aarch64-linux-user.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/cpu.h   | 1 +
>>  target/arm/cpu64.c | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 37b8cef2e2..652e00d957 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -1386,6 +1386,7 @@ enum arm_features {
>>      ARM_FEATURE_V8_1_SIMD, /* has ARMv8.1-SIMD */
>>      ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
>>      ARM_FEATURE_V8_FCMA, /* has complex number part of v8.3 extensions.  */
>> +    ARM_FEATURE_SVE, /* has SVE extension */
>>  };
>>
>>  static inline int arm_feature(CPUARMState *env, int feature)
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 43b42f95fd..366ab2eeee 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -229,6 +229,7 @@ static void aarch64_any_initfn(Object *obj)
>>      set_feature(&cpu->env, ARM_FEATURE_V8_1_SIMD);
>>      set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
>>      set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
>> +    set_feature(&cpu->env, ARM_FEATURE_SVE);
>>      cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
>>      cpu->dcz_blocksize = 7; /*  512 bytes */
>>  }
> 
> We shouldn't turn this on until it actually works, I think.

Yes, probably.  One of those things where you need it on early for development
but for final commit you need to sort the fragment to the end.


r~
