Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp407172njb;
        Wed, 10 Jul 2024 07:42:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvQbxH+cB4RL1JIsMk9PVyi4fKCcDnatfQKV21BAar3SJpsgbQY7NP0LBho1HZP8ENOquP2OTyrDs70+qgFh4AH2WNVqRW
X-Google-Smtp-Source: AGHT+IFmz7wrsst8VRsD7e9fosOVupBL3bpb29c3krhC2OoaJxUKEwA6z3auod6y9pugObE13bLf
X-Received: by 2002:a05:6214:2a49:b0:6b5:d9ef:d55b with SMTP id 6a1803df08f44-6b61bbdff89mr73915926d6.0.1720622563653;
        Wed, 10 Jul 2024 07:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720622563; cv=none;
        d=google.com; s=arc-20160816;
        b=IB5P8FXeMvorevIjmgOKYmgjcMiIVuJcAfslSWBMmmt+oPJbVesKuisVUSLcM0SX0L
         zLPFLX2FtEOjJMQ/tD5F6RT7fvp+u272OwoJCEZafCwIRTfVzuzWxVGVwZ5Rh8I9M5+r
         MN0a/vUiHcVFvYxISUSkt1To9ABIWToK/FDNIeV3WBGkbaxHVqah+gyEkPmyFl5cT12V
         CdE3owT/cHi0T6+KQotS0oz29/wLCXPbIorfTfbDeGi+wAH6gsY61Qg3p97HfCOaU8ta
         7b6miplXaQTKQ5oED4kx0oIFTbM4atgEdUXTFlPqA2eCoJTMhaXAIVscJVOOdkzCdvBv
         ECaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0chmTPrpv/QcEAGL+GHmIW/+wnaH1ufbuQMbsep2CrU=;
        fh=luG4RHJayFJzoy/jQSocpQHUSli3ppVL//5km5KPRAA=;
        b=emmtxQbw8HBYJCzCVPRrD9m/9L4J5KlUXJfMdprEfobXAuRqUi+aZ84horagp7h3an
         j8d00f/vwXLKJoDn8XBy73cn6voxDUKjRwNCOKubLFyNxZgzAdeLLYr2f7nUxGO2626+
         RyF0Ayist3PTDm98wDzg+5bWv4sZfXj4UpY+NnIPuoCBAeHoHXE9uPTMoIDLocx2p/Lw
         EAjK5pTpPnMIGq3/Xtwwq6+Q+xE3d1OtTpeLME7RAos5+LfhDStevt3O4ldnakKnKyFf
         GpoCAUcIiklkl+qkH3WurJzYmDBRVF9xLqUiXwC21c4c2cLOA31zt07Y2C42JqVzhxi1
         jy0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yc7r0ro9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61bacc474si48525516d6.491.2024.07.10.07.42.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 07:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yc7r0ro9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRYWd-0005hz-Cv; Wed, 10 Jul 2024 10:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRYWb-0005gS-QF
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:42:29 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRYWa-0000nH-9N
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:42:29 -0400
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-380deeb250eso22764465ab.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jul 2024 07:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720622547; x=1721227347; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0chmTPrpv/QcEAGL+GHmIW/+wnaH1ufbuQMbsep2CrU=;
 b=yc7r0ro9l6+AAHt6t2TCKq2M2Y4CHze1QW2ZnC++89WRAWMeqm6NPHbqWjtD00ohAC
 Q5z4xaAm6qmmETpnn7ukj6cjCw6zR2LVUL54f54dgeqJhaFZWXXQ3vQ03s3/8y2Ck47/
 eZFQo0xMw/NvdYBKQ+MbqSCqpV0jyTU8pW8jI50iZnPw8k58p/BdjNf21BaphjknFyO0
 JAevylWg1Bpj8tBQbtKZIC0riwRxK8q7f/dCiiEQfaoJeDds9nCyY+fz3MseE4p/agVV
 sSkqNiE1qQiZjfKEVi/VolmQOUqX8NOkgSrYjWZPV41WdE/Zfosf5PBqIjiqZo023GgX
 LDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720622547; x=1721227347;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0chmTPrpv/QcEAGL+GHmIW/+wnaH1ufbuQMbsep2CrU=;
 b=wS787GvZOuAQgLFACt//u28aFdsA/aRNDfBVi/QDC+a3NXuUCvWkgVwYwYE2sqNLO1
 VPeCpet8YjUB4vMyAFfhGWY5ZpWK9hA7Sw7bUumrJE0/1qGhpr4/etD3AApXXcy/YAdb
 QLHWbZ+WatsMNPpnAnGH/UwAHdFmJOD7gfFXiipdCP9wI6vyo7rPccKmVUARI3HFtRW+
 db+5Xw54PuLDB4plTFdj8KvWo5uwZH+WYCbiKSG/kYqjnzu6MEnEoVH0Sq4q3q7TNwM6
 8E1nFFDv3kegOJ6HEgwefVA4VpjU7j64zlrCGwwJRjAmjulD59NBEQSEKntkPAIvONmX
 xHGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7+2j9DjWg12on2JRCTsITGBYRxtgX7XRlOCYNuPgxO4oYD2fcWQsxY+DrQJnrB8gHl5ZEsWDIRs6/j4qkkpoTk8jS
X-Gm-Message-State: AOJu0YwdOVdpPuqxdMzaPAQknaDMhfqVPqx/q9GjzTJAQ2V22zAjQLgI
 y56Kekg+f2xlGp+/TreULHUsuQ//ptvn0fvx9qTaNd4dNbu3+fTKCEgcPqoZq9g=
X-Received: by 2002:a05:6e02:b26:b0:382:db50:6ebd with SMTP id
 e9e14a558f8ab-38a5910a09bmr66302045ab.27.1720622546903; 
 Wed, 10 Jul 2024 07:42:26 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d680cae23sm3037812a12.78.2024.07.10.07.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 07:42:26 -0700 (PDT)
Message-ID: <92a009d9-e5bc-44f7-a1ae-31e007bc6c76@linaro.org>
Date: Wed, 10 Jul 2024 07:42:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] target/ppc: Improve helper_dcbz for user-only
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, max.chou@sifive.com
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-10-richard.henderson@linaro.org>
 <6b2f8ee5-0715-5040-403e-943a16ec170e@eik.bme.hu>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6b2f8ee5-0715-5040-403e-943a16ec170e@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: CJ2W4H0YZ1u9

On 7/10/24 05:25, BALATON Zoltan wrote:
> On Tue, 9 Jul 2024, Richard Henderson wrote:
>> Mark the reserve_addr check unlikely.  Use tlb_vaddr_to_host
>> instead of probe_write, relying on the memset itself to test
>> for page writability.  Use set/clear_helper_retaddr so that
>> we can properly unwind on segfault.
>>
>> With this, a trivial loop around guest memset will spend
>> nearly 50% of runtime within helper_dcbz and host memset.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> target/ppc/mem_helper.c | 14 ++++++++++----
>> 1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
>> index 24bae3b80c..fa4c4f9fa9 100644
>> --- a/target/ppc/mem_helper.c
>> +++ b/target/ppc/mem_helper.c
>> @@ -280,20 +280,26 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
>>     addr &= mask;
>>
>>     /* Check reservation */
>> -    if ((env->reserve_addr & mask) == addr)  {
>> +    if (unlikely((env->reserve_addr & mask) == addr))  {
>>         env->reserve_addr = (target_ulong)-1ULL;
>>     }
>>
>>     /* Try fast path translate */
>> +#ifdef CONFIG_USER_ONLY
>> +    haddr = tlb_vaddr_to_host(env, addr, MMU_DATA_STORE, mmu_idx);
>> +#else
>>     haddr = probe_write(env, addr, dcbz_size, mmu_idx, retaddr);
>> -    if (haddr) {
>> -        memset(haddr, 0, dcbz_size);
>> -    } else {
>> +    if (unlikely(!haddr)) {
>>         /* Slow path */
>>         for (int i = 0; i < dcbz_size; i += 8) {
>>             cpu_stq_mmuidx_ra(env, addr + i, 0, mmu_idx, retaddr);
>>         }
> 
> Is a return needed here to only get to memset below when haddr != NULL?

Oops, yes.


r~
