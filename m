Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp815928lfm;
        Fri, 1 May 2020 08:52:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypINUp2YChvpgvkCNWJhFls8PzQhf4SnuuIWl1sYXT6FYLrtJe39Y5ABWsq/evcMLLwJdLbd
X-Received: by 2002:ac8:728b:: with SMTP id v11mr4447919qto.108.1588348368960;
        Fri, 01 May 2020 08:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588348368; cv=none;
        d=google.com; s=arc-20160816;
        b=GIlFkWf1DItu3TJKkTeh9klUIM8uRfW+RaRmkDmgX/MWWMxtnp/23/iv1foSY016wl
         yf5OuaYcLFpzzQxSEJbzuBoJiwlD+p5ajKKPEeVH3v7CXOobb/5kXEPm7jC3CBVpRM4K
         RpbbyYeXnhsJ9QU/X5xwjpi3lOtxilqwK9ZYBk3kt/gucD/nrw3osbGuHBmeSWyjDFdm
         JqStRtTvdSwNeCi2LMNtTGxnAqsA0RtKH6jHbvimWcIGrHwO5GdQOsgMqQ9sdd9ezXdk
         Vfs3+raMoAQwmD+7mIinVBpgJ1y6RcW10oME6jruGAmijsxj3uP/kCQCEeugUftPMZ82
         VHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AThqTKuVg6PLJY6jc0hWagWCxDuONRhIR0VFAaLXWfo=;
        b=pLUHO9qo5cSBIHtudNEDVyw/h8galsZNC6b0zNoOUqfcgHcgowFxQZ5gErecBYA4eo
         wCLjPosk+1tKOap1JJdFJ8XoaoZj1J3+caNSa0QaWDaWPO96gayFeFxyvdvPlAFicCWJ
         DPugs6LngmpNbZqzW0ygv9FTk0ZDcrg1wuWZU2pS5+LYwitQ3nUiddKaLerHn+MjDW9S
         dp/QfX5TAFQQ1fOzXQa3oUIyc5bT35aIRRAbOou2cNw5h4Oio7511cAU9UzFq5HC4cpV
         JxKdBTozW1QJ/Hvd+wAOJH85fzQ47XWo2tc6iVHpZi3FGt1n1edGWKJmBqTd+cXW9C9y
         5z1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XOQOPH0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p21si1827845qkp.33.2020.05.01.08.52.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 May 2020 08:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XOQOPH0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUXy4-0007g0-BA
	for alex.bennee@linaro.org; Fri, 01 May 2020 11:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUXwb-0005iZ-82
 for qemu-arm@nongnu.org; Fri, 01 May 2020 11:51:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUXvq-00065Z-VF
 for qemu-arm@nongnu.org; Fri, 01 May 2020 11:51:16 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUXvq-00064N-G9
 for qemu-arm@nongnu.org; Fri, 01 May 2020 11:50:30 -0400
Received: by mail-pl1-x644.google.com with SMTP id d24so3770494pll.8
 for <qemu-arm@nongnu.org>; Fri, 01 May 2020 08:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AThqTKuVg6PLJY6jc0hWagWCxDuONRhIR0VFAaLXWfo=;
 b=XOQOPH0ZqoldYyydnCix2XzzkN/7uaH0hotSak471Kji+ub7A05dcgb9sRymAt1EPI
 PqTR7YbfoUlZBqz1F4qCsEBNm3tPr1UXFri+kCOlKrc3RhxeEDtXPORGvVvt7wDzt8IK
 /oc1kNcSdx/+3GU5Fb3GpuOC9WMmhEl1hadlZgNXv/swpiU+c+0FdenuWwMrmJh2uG+o
 /oYu2/H5DB1SihID0G0v+OxTRm2kUwrJ99KWNXNsEKSn25m7CCLzvm6AIJkbM/AAC22o
 +IDdSOFmSIzD1KT6CmZVUldNDfTLi+rxgKfkg2jNWJvi1Zg9LxRXH7bLYcIg+zwCtz6E
 1aZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AThqTKuVg6PLJY6jc0hWagWCxDuONRhIR0VFAaLXWfo=;
 b=TyN82xIxig+kLNYA727pAwDMuEtMtfFGkBmpOkGZsmGVaM1FQSQqziquC09LC7dK+b
 X814XTowqPfDmPwPUYAauEBNtTIOLGMTDKRxu6DG0tJHdGIue64GxXjYnXk6u8faDSyJ
 CG5DUAdXUjYFrGcZ/O9t+EqMiy/0WhieYIJbi/d0VK9DzIpBTWKaeU37anigh6FWh6/E
 UdsSIalDA5OTztr0f8ym/yQJgI+e5vzhT9mas/qB7ioARtIv3w/bB9qqmEuw+MTgdCPx
 pJTeFHm2lbhuBTicbOOo30HPn7D7eZNQrG2GbiV+x4M4aM9qIEqgsqEC92PXWsFl0Sbe
 yUaQ==
X-Gm-Message-State: AGi0PuYcpHmReYaJdvXAr59ViSPh5UX6qpoBcVRgUqYnjY0Cdr0Znk+2
 tRrb3OrfZI6VJgYlsjukFS6zMQ==
X-Received: by 2002:a17:90a:cc9:: with SMTP id 9mr283126pjt.16.1588348228499; 
 Fri, 01 May 2020 08:50:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 13sm2577420pfv.95.2020.05.01.08.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 08:50:27 -0700 (PDT)
Subject: Re: [PATCH 23/36] target/arm: Convert Neon 64-bit element 3-reg-same
 insns
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-24-peter.maydell@linaro.org>
 <366a2e79-d963-bfdc-fcc6-2a63026fa1db@linaro.org>
 <CAFEAcA8M6M7CYg0AsTVbmfX88jzW9MZvRFihQ9cGDJNHhXV+Pw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2050ff9f-1338-2b6e-230f-e07c72ece3e5@linaro.org>
Date: Fri, 1 May 2020 08:50:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8M6M7CYg0AsTVbmfX88jzW9MZvRFihQ9cGDJNHhXV+Pw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fWuOwbd+gFRH

On 5/1/20 8:36 AM, Peter Maydell wrote:
> On Thu, 30 Apr 2020 at 21:54, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> You can morph this into the gvec interface like so:
>>
>> #define DO_3SAME_64(INSN, FUNC) \
>>     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,
>>                                 uint32_t rn_ofs, uint32_t rm_ofs,
>>                                 uint32_t oprsz, uint32_t maxsz)
>>     {
>>         static const GVecGen3 op = { .fni8 = FUNC };
>>         tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs,
>>                        oprsz, maxsz, &op);
>>     }
>>     DO_3SAME(INSN, gen_##INSN##_3s)
>>
>> The .fni8 function tells gvec that we have a helper that processes the
>> operation in 8 byte chunks.  It will handle the pass loop for you.
>>
>> There's also a .fni4 member, for those neon helpers that operate on 4-byte
>> quantities, fwiw.
> 
> Is there a version of this that works on functions that need
> to be passed the cpu_env, or do I have to create a trampoline
> function that just calls the real helper function passing it
> the extra argument ?

A trampoline is required.

The original intention of the hook is to expand some inline tcg ops.  That it
can be used to call a helper is a happy accident.  For a helper that needs env,
ideally we would use tcg_gen_gvec_ptr and handle the vector with one call.


r~
