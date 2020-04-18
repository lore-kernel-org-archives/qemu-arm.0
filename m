Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1217692lfm;
        Fri, 17 Apr 2020 19:19:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ6BBRtXPSB0QTIGUEpVC5CpMgOlwmfLMr5pRDAKoHw6JWADYTeuaYgHe8Yd6ex26UzGVSo
X-Received: by 2002:ac8:1bb8:: with SMTP id z53mr6288424qtj.132.1587176344288;
        Fri, 17 Apr 2020 19:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587176344; cv=none;
        d=google.com; s=arc-20160816;
        b=0k7bDuAT0oo8u80fGgydyZGHnJyJMjQkJuJgVzbOmQpNVfbheXJCKYLdzyL/YLsPN/
         yO6f+USIc3Rutj14DBs9JtHQMppQJN/5Dc5G+iE69Rx+EXXhplvcfZo57LGHXIpbEnD/
         EW06pIevYHIqlmc3uRbUSMlFjat1SyxZxa8Y/WUAB+mrdR+8cs1T1+LSalaJPKuXx/Fd
         y4FraItVc4cJVIq2cmyqXEEcFUTwRjDjPLuYzkUWeSla2AIy51UfzyZCeTqZBbll4AFl
         YdHFKfcCqS9SMTz7KpVvxDDBK3L8DTDXojlyFZdugPZYmi13z+lZHU6Ows02kJqvMRtS
         /OoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DjHYcRx/8/y1DUrBE3XsgoGoKuDrCdYcMnFElMjZXdI=;
        b=z0vNA40g/O07il0M/3STPTHIPbsjm1/radpSPsHPEsq5y4yo+EgU3zyN0SwV8WznRd
         Bj9/kTUYYMSoygLFl0pWx3s0QIRqRjXF4GQiPYfWxHO9rU8FVN0C8oZPuL0JMKEnsv0u
         J4UWdztCL4hdp1ygHVHxFKH9fzqUS7sQehK3PjcEi8bCvqlct3JHinx1+Jg2QasmttQI
         ELEKPBn4M+9h3ba+QBP3BI5px62y9ZyT1trdfgvHuTFxLY+9pY8x3J/lq4ockha3jI4n
         80y8CaQWXjgliYs9Y1Qe0qL0hi3x0+d71jCG5c6DMOeADml+c8E7yJjjvIu/n9eHuU+W
         XQyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hD41htx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c206si8693457qkb.32.2020.04.17.19.19.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 19:19:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hD41htx+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPd4O-0005fl-Q1
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 22:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55055)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPd1w-0004hO-Nx
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 22:16:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPd1u-0005SX-HV
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 22:16:27 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45056)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPd1u-0005DR-Bc
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 22:16:26 -0400
Received: by mail-pl1-x644.google.com with SMTP id t4so1631649plq.12
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 19:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DjHYcRx/8/y1DUrBE3XsgoGoKuDrCdYcMnFElMjZXdI=;
 b=hD41htx+CMcgnX0W/Z6lDY27cWBJXRVowPxPNx/BLicmYQ+poPxwuw2TmO+PKyzknZ
 6Cm8S9rv5VnWtP0iD7wc5YZkHkPqOx9/B9rZZpi6VZnI5A/eCu1kbKkeiMCQnZzBw7G2
 LlQBTk6RrncM0tX1V0sK/9WOae/Ki6pRr3kNMLtbmZEaXcMZ/t48MUrZ3TVVa6cTFphN
 xr5Jc0MjpvPO45NKVF7SmSo86/DzZVCZiKx/okDbzMgaBvsvECNCudR8tqxK+r+nwce6
 qbTs/6RMfyWJoIlCKdwrxZkQAzwIAUg6mPvMEjfHM0DDuG1GWHMjGA+yvayVCrY/B8wm
 vq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DjHYcRx/8/y1DUrBE3XsgoGoKuDrCdYcMnFElMjZXdI=;
 b=W97sYTFYiXIuCYuXk+/5RpyTOxGmNi/Pg1CIaIh85vz7q6GMY284ETaSkYKDr0UVnh
 el0SltVFcicQudphqVOWY892m4ruCKuFWBC1NiTeUDxs5PYrWnE8ZS4X/HQeR3vJl5SR
 OLGTiLslRco1Qp3tgcBoHjkuTiS2AsnG1i8HBem3juHGwKdiUqWaAxXmX5W8V1oO+Do6
 3mJSw6DWyTf51SuBSJFHI1MjcygMELGyHa9h5i7Mz6V9VMtTBdEzACDQuadarYrL1TtK
 gMQ5aAKGWbRbBd0dyt+iRcyxFLUuKFwJU/LK/R2bd7O57F79oElEqg/6mpWRwgAq2P1h
 mz5w==
X-Gm-Message-State: AGi0PuaRkHy1AGRYmCn3YjznfEJZbFF3T4b9M4UzWBs2z4m7oY9p1BYg
 kvf1MrF85j3Y5a02TiLOH7BO4QFITSM=
X-Received: by 2002:a17:90a:5584:: with SMTP id
 c4mr8046632pji.51.1587176183078; 
 Fri, 17 Apr 2020 19:16:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id ml24sm6475441pjb.48.2020.04.17.19.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 19:16:22 -0700 (PDT)
Subject: Re: [PATCH 04/16] target/arm: Use cpu_*_data_ra for sve_ldst_tlb_fn
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-5-richard.henderson@linaro.org>
 <CAFEAcA9D9cpx5vxtuaeVonFJ0NNKjMOB6viPuE0+ppGiqZSMFw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f2082f56-8c4b-a075-09c6-06dcd6dced15@linaro.org>
Date: Fri, 17 Apr 2020 19:16:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9D9cpx5vxtuaeVonFJ0NNKjMOB6viPuE0+ppGiqZSMFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
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
X-TUID: 3sQRoyX/VisL

On 4/16/20 5:19 AM, Peter Maydell wrote:
> On Wed, 11 Mar 2020 at 06:44, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Use the "normal" memory access functions, rather than the
>> softmmu internal helper functions directly.
>>
>> Since fb901c905dc3, cpu_mem_index is now a simple extract
>> from env->hflags and not a large computation.  Which means
>> that it's now more work to pass around this value than it
>> is to recompute it.
>>
>> This only adjusts the primitives, and does not clean up
>> all of the uses within sve_helper.c.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/sve_helper.c | 241 ++++++++++++++++++----------------------
>>  1 file changed, 107 insertions(+), 134 deletions(-)
> 
>> +#ifdef TARGET_WORDS_BIGENDIAN
>> +# define be_bswap16(x)  ((uint16_t)(x))
>> +# define be_bswap32(x)  ((uint32_t)(x))
>> +# define be_bswap64(x)  ((uint64_t)(x))
>> +# define le_bswap16(x)  bswap16(x)
>> +# define le_bswap32(x)  bswap32(x)
>> +# define le_bswap64(x)  bswap64(x)
>> +#else
>> +# define be_bswap16(x)  bswap16(x)
>> +# define be_bswap32(x)  bswap32(x)
>> +# define be_bswap64(x)  bswap64(x)
>> +# define le_bswap16(x)  ((uint16_t)(x))
>> +# define le_bswap32(x)  ((uint32_t)(x))
>> +# define le_bswap64(x)  ((uint64_t)(x))
>> +#endif
> 
> Am I confused, or are these just reimplementing
> cpu_to_be16()/cpu_to_le16()/le16_to_cpu()/be16_to_cpu() etc from bswap.h ?

Those depend on HOST_WORDS_BIGENDIAN, this is TARGET_WORDS_BIGENDIAN.

> (It seems a pity to have to lose the memory subsystem handling
> endianness for us.)

It is.  I have added a patch to improve the memory subsystem.


r~
