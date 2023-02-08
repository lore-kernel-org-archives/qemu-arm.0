Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp56414ejb;
        Wed, 8 Feb 2023 14:12:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+UIWKoI+EZtSuculnq9nr3+No9XYJ3DGNoQ7aFWi9i50z4SEbuQTD+IA3psdD/QndsVx8A
X-Received: by 2002:a05:6214:5182:b0:56b:f09e:9ab0 with SMTP id kl2-20020a056214518200b0056bf09e9ab0mr14647193qvb.5.1675894369618;
        Wed, 08 Feb 2023 14:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675894369; cv=none;
        d=google.com; s=arc-20160816;
        b=nHIV7vnwu5EfGcROil4RHQLbcsS8OTfxkYtW4znlz5WnYZb2FRzWH6FHIs7tZWz3+t
         YwcfjMtYHYisW+vKApGPNRB46zRibYXLupzOemCbpPcYn+o7//VOS73RmYL5Mt73rXgk
         KTLZ7ZSyl6ONnIHwDj1bwfwAa9d3mQe+BFvyfbHwJ3jGjcLVt7dRhxi0rxVhLLANXxQk
         +W3F2VErM08ijVRpBgldHH6wTMhnqqPKw5TIZ5IOPvYvjeNA8ZmFxtRlpyubfh7SvCI5
         pOlJCG34NLlraAGsgb6cuhUsD8WnwfsehTTrjWCOgGAtomNCGqETla3GSWF2RzfQk1DG
         Oupw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Thg6NsAa+vLoCBcZWqKcsEEmibUGod4lNBOFPoV26G8=;
        b=ESUbcHvRLwXSvFvEyPjiq/iGGFLYjSh0iaSFB8nYdDSokWPr74eyvpVzWVU9s1LxRz
         TrxFmsCuTxAhfAs/wDqeDVF8F8hutNiniEReIYHqh9mBswWvRCD0KGd9Xlafv91/cCUL
         82YB9uiaGP5v7hjqmwC5MiBv6a5csNMvqeI/6qJLIHlHa+hHrIhnc9JgzHicLOAf14ZI
         k4lnIEeRgrsWZILzoq1CKpx4EAKBxnJjWFEM408H61CFlfghkrRsKS+/beLgjoGcTFh9
         M94NPiOwwldG7/ap2xQsQEryj1Tqu6j9O6+b0kio+w+fVMlSLt2mcUa1QWJWfQCZK5Tx
         GA/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zgAB2lxO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9-20020a0c9709000000b0056bf9633d57si7783733qvd.7.2023.02.08.14.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 14:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zgAB2lxO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPsgE-0006WT-Oh; Wed, 08 Feb 2023 17:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPsgD-0006WB-Tu
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:12:41 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPsgC-0002RW-1T
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:12:41 -0500
Received: by mail-pl1-x62a.google.com with SMTP id m2so662068plg.4
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Thg6NsAa+vLoCBcZWqKcsEEmibUGod4lNBOFPoV26G8=;
 b=zgAB2lxO6ZSVcZAKjCE/ReYs8rEIQWSHF0dYtGdPNesDkvlXcMI58R1Tp03d4Wtokx
 xmyPQSVa63ZxSWX7O/hyrHsW9wLOy5EucSw0cDEaEgxFtvdnFLmR089h9Ub5xXsjK2eJ
 pdrDLDB5tJYNS3jo/VSe7vfTiYWeL49SQ6tssYf5NJl9yXqS51PpyWEaHuWZ4KgMEEU/
 nm1OK36nDzTbAIl65ZHmERqcc2Mu6Cwe037zCmo2UOhyfmuTPV5wJxH0b/tqdv+jm5cu
 B3VgHWJ3fn4ySq+qbUphFIOpu3XTVyjWh1TRSLqOMcvK/NIHORTb2bCC3rLDrV5pYxgS
 0COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Thg6NsAa+vLoCBcZWqKcsEEmibUGod4lNBOFPoV26G8=;
 b=YdGW5UUt31BlXjfdToFM0kry95BsMdeXCUxTFzBhWzcupPL/ltXMMpKAMejiDM206j
 8axr2UgwolwqO6afNElW20kHjcszp9/XsThrKh8xu5CxKckFue/hfLVgcg94K0lAIQjO
 BFarnr0cRTPbdieG4b+i6aoAHWOr/CAKHCXHtFyM+IAf1CxQBh6p4nF2JbqNvmtvtR9H
 9FJXD9OsY62qvx1leEwstklXYD4mhj2JinYjdP179p4oyTZrCMyOebKtBNKVuBYB0DZ5
 1D6oAjzufzeGLLM0E/S89Es7AWewL/1jzVR2ww4e0tbW88bhC77NJrh8Dh6WJxWVdJWP
 MKKQ==
X-Gm-Message-State: AO0yUKWGYTeZSK0IXzYqPmsoAx7VKp26SM8UC5UVRI5YRoOLJaMsK/ig
 HxAipWXt2rC2zKb/3DJGF8q2AQ==
X-Received: by 2002:a17:902:f24d:b0:199:554c:116c with SMTP id
 j13-20020a170902f24d00b00199554c116cmr1094569plc.0.1675894358395; 
 Wed, 08 Feb 2023 14:12:38 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 y5-20020a170902d64500b001783f964fe3sm11542675plh.113.2023.02.08.14.12.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 14:12:37 -0800 (PST)
Message-ID: <7968820c-a518-b62c-487b-a4153f32aef7@linaro.org>
Date: Wed, 8 Feb 2023 12:12:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 08/22] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-9-richard.henderson@linaro.org>
 <CAFEAcA_2G4V6tPe-gNtstFOM4TDsCnHwFHAESdQwkKvDx3t1yg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_2G4V6tPe-gNtstFOM4TDsCnHwFHAESdQwkKvDx3t1yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ca6enLnXSrs9

On 2/7/23 05:05, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We will need 2 bits to represent ARMSecurityState.
>>
>> Do not attempt to replace or widen secure, even though it
>> logically overlaps the new field -- there are uses within
>> e.g. hw/block/pflash_cfi01.c, which don't know anything
>> specific about ARM.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/memattrs.h | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
>> index 9fb98bc1ef..d04170aa27 100644
>> --- a/include/exec/memattrs.h
>> +++ b/include/exec/memattrs.h
>> @@ -29,10 +29,17 @@ typedef struct MemTxAttrs {
>>        * "didn't specify" if necessary.
>>        */
>>       unsigned int unspecified:1;
>> -    /* ARM/AMBA: TrustZone Secure access
>> +    /*
>> +     * ARM/AMBA: TrustZone Secure access
>>        * x86: System Management Mode access
>>        */
>>       unsigned int secure:1;
>> +    /*
>> +     * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
>> +     * easier to have both fields to assist code that does not understand
>> +     * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
>> +     */
>> +    unsigned int space:2;
>>       /* Memory access is usermode (unprivileged) */
>>       unsigned int user:1;
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I guess we aren't so tight on bits in this struct as to
> warrant keeping the extra RME info in a single bit (which
> should in theory be possible).

Indeed not.  And the 3 target_* bits at the end are unused after recent changes.


r~
