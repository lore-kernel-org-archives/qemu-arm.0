Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2283167ejb;
        Wed, 21 Feb 2024 17:49:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPTH81zz7yy949SKtaq5TGPxBsyma+sKVaj12p5mEjwoLISDFsWnmMdGJiB4/mbRx2Mat3mvZNchvlto3DFu8dfTEakys5
X-Google-Smtp-Source: AGHT+IH9bN9six8H5YnSsyZIdsk9ZpmaVrqHoszdbk9gRWhRhfKpgoS81qiw6gtK9qKTZGBTyY1n
X-Received: by 2002:a0c:9792:0:b0:68f:b9b8:6a87 with SMTP id l18-20020a0c9792000000b0068fb9b86a87mr544713qvd.12.1708566563318;
        Wed, 21 Feb 2024 17:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708566563; cv=none;
        d=google.com; s=arc-20160816;
        b=05+QKal6E6UWOa1JTo/LWKuCo1vCTEQbB9vwJSnffmRXzohO+otY0uNsmUcUPvASEp
         FoPbyo+cBzYTIluOGcVOtdrkZ4QxpTCClt/zSzaj7SFZKjjh41X/K2CzpDNKw9kvtWMq
         kAn/lRjDyYlR5xfb2E6hqttEiziQRY4hqnK3yyCXKX1xX2fVFFEqSvUBX3uemSnHIMAn
         nLITEmwueUTeAJjQYs5e8gyVPBkJOB5en+mEDitGhkE5EcxCOTGg7o6c5oxJazrQAfHx
         s5TEn56UpSNreBZ0tZwWjwdRmDfoto/vNk1PGEvJFZDB1/Y3c6APptbYEL6Ys2C6YhId
         w6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id;
        bh=tMXM7tPgVC4IHB5cVYof0JrdxcqlYCL1fMAUIwkOfxA=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=F4db2LmjKSpFvPhrQlMwUNj/TooPqxAojv2eioy9JFI++HNRQq6kCMZHWPOaDtxb2/
         CVW3L6IlI7qzsyXhLHVkRt5nYwLJQh9K38OT17ix8khCSsfjzwlIR+b9NyXyQwrgdkrA
         Wxi1o3D0w0UoCYBWLuG1ncHeRG3LttFR1dQeKx+spWvM/RGbTaHuXh8cvFp2KLO7/sF9
         vJS7IK+nNz3+BJTsMM7gRuJNL5kMYkCOxIOoNYIMs5tzCt22ZOLG9B7/eoyB8m12db7p
         id69c60utiV1ob4MSINI1xns+vWlkkruXIq2KIfd5bNObZ39w+sEL/plPm/7E2VmoI+k
         JWKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a05621420c200b0068eeeabaa8fsi13287004qve.144.2024.02.21.17.49.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 17:49:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcyCz-0001Kp-Pn; Wed, 21 Feb 2024 20:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcyCy-0001KF-S9; Wed, 21 Feb 2024 20:49:08 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcyCu-0005mv-Q6; Wed, 21 Feb 2024 20:49:08 -0500
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TgGHC53ZBzNlp4;
 Thu, 22 Feb 2024 09:47:35 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 6A5D418007D;
 Thu, 22 Feb 2024 09:48:59 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 09:48:58 +0800
Message-ID: <7e42f863-0079-18bd-94b5-83f3f40191a5@huawei.com>
Date: Thu, 22 Feb 2024 09:48:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v2 03/22] target/arm: Add PSTATE.ALLINT
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-4-ruanjinjie@huawei.com>
 <5f25d9cf-3ca0-4adb-860e-71a8fac3b504@linaro.org>
Content-Language: en-US
In-Reply-To: <5f25d9cf-3ca0-4adb-860e-71a8fac3b504@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BJ9iPH+H9n6F



On 2024/2/22 2:50, Richard Henderson wrote:
> On 2/21/24 03:08, Jinjie Ruan via wrote:
>> The ALLINT bit in PSTATE is used to mask all IRQ or FIQ interrupts.
>>
>> Place this in its own field within ENV, as that will
>> make it easier to reset from within TCG generated code.
>>
>> With the change to pstate_read/write, exception entry
>> and return are automatically handled.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>   target/arm/cpu.c | 3 +++
>>   target/arm/cpu.h | 9 +++++++--
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 5fa86bc8d5..5e5978c302 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1104,6 +1104,9 @@ static void aarch64_cpu_dump_state(CPUState *cs,
>> FILE *f, int flags)
>>       if (cpu_isar_feature(aa64_bti, cpu)) {
>>           qemu_fprintf(f, "  BTYPE=%d", (psr & PSTATE_BTYPE) >> 10);
>>       }
>> +    if (cpu_isar_feature(aa64_nmi, cpu)) {
>> +        qemu_fprintf(f, "  ALLINT=%d", (psr & PSTATE_ALLINT) >> 13);
>> +    }
> 
> This is one bit -- !!(psr & ALLINT) is better
> 
> We don't individually print DAIF either; why is this bit more special?

That makes sense, it should be removed.

> 
>> @@ -224,6 +224,7 @@ typedef struct CPUArchState {
>>        *    semantics as for AArch32, as described in the comments on
>> each field)
>>        *  nRW (also known as M[4]) is kept, inverted, in env->aarch64
>>        *  DAIF (exception masks) are kept in env->daif
>> +     *  ALLINT (all IRQ or FIQ interrupts masks) are kept in env->allint
>>        *  BTYPE is kept in env->btype
>>        *  SM and ZA are kept in env->svcr
>>        *  all other bits are stored in their correct places in
>> env->pstate
>> @@ -261,6 +262,7 @@ typedef struct CPUArchState {
>>       uint32_t btype;  /* BTI branch type.  spsr[11:10].  */
>>       uint64_t daif; /* exception masks, in the bits they are in
>> PSTATE */
>>       uint64_t svcr; /* PSTATE.{SM,ZA} in the bits they are in SVCR */
>> +    uint64_t allint; /* All IRQ or FIQ interrupt mask, in the bit in
>> PSTATE */
> 
> Why is this split out from env->pstate?
> 
> The allint bit matches the documentation for SPSR_EL1, which is how
> env->pstate is documented.  The other exclusions have some performance
> imperative which I don't see for allint.

It seems to me that allint is a bit like daif, so it is reasonable to
maintain it separately in ENV as what daif do it.

> 
> 
> r~
