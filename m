Received: by 10.223.172.38 with SMTP id v35csp7084429wrc;
        Tue, 12 Sep 2017 06:52:48 -0700 (PDT)
X-Received: by 10.84.238.207 with SMTP id l15mr17107772pln.194.1505224367998;
        Tue, 12 Sep 2017 06:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505224367; cv=none;
        d=google.com; s=arc-20160816;
        b=mAJ5blLHXFEMqG2754V8fzvllHui8H4ztlvU8OXy9J+wbP62hwAqlkgHKInFyMOYKm
         1z33nxdQhHEgL4XOmpf6sdgzjoWVMhHz9ylRMgrgSBCnQVZeKRI+77T6Ae+uVXZjmhp8
         Lz4Yy5m+mfdAeZ6/iR3lqS6dkG91oqRdmpw5ODPzqVmSMNnUcjXvqtfrMRBeBuw15mIe
         uLi5MFsMRgDOgL1eL40HfHRGJ+8HBaelXwNWhx5MeVZGYUZjlWnmjDHeV4x2ARPxgIyW
         HuTMvprtvnYaJkqANV4Sq05veZ/mgm6h17o2pZvTS23KgJYsm3O6P1rrQ9PBHAYhJRvo
         WjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=yuLD1zmfLhQscZvSYOpkgfeRNnZ1KsPsAqK3c66gr/w=;
        b=b4E1NmlTYbOZQNddi2p/Nc1eGdCHNA0vyqpZ0RA857Y013dMUF1cHDNAtiMwwOY8us
         0GRNk2BZQj2dOB+CaHx5oIwJ2JQJBFnh+FHddUbtAK823bLXMJhaZdFV0u/pF85SOY3p
         fm8rjnAUIpk4k/1dgpT0qQPw2kqnK3aV2A6ZShfLU0bYahBpsVshEA4MeSLsCMRLOCdR
         vzlCVir2ZLr3CutEbG7yOH3/asBNzXdxSbHgWYRxJsqGIWs56DJxuZjlug9Z70SEx7j9
         kD5Djivf0U0r+d1muQMDlldYaO3BMOzfKJmtSS4tQrjCQFK8CH9qItYQzsNrPXz93UYV
         tQlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G16mP1aQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p3sor5901509pld.78.2017.09.12.06.52.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Sep 2017 06:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G16mP1aQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yuLD1zmfLhQscZvSYOpkgfeRNnZ1KsPsAqK3c66gr/w=;
        b=G16mP1aQqKpnZynkDBILcCtIqlm4DBrzOsPmdv85C9WssKIrGtYBNYAwV6/n+FOzW0
         1cJmEpg3j1eKfBTyj2srd/hsBUvbqqaigS6D883JgXkI96ljoTnadD882Fg5WPYHRuGk
         OucXoucRVSiKBzU8lX141XhDXPrPH0yJfvJ+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yuLD1zmfLhQscZvSYOpkgfeRNnZ1KsPsAqK3c66gr/w=;
        b=I18BuWGAFlPb3pf0qXgUQ9kV5GYU8Mj2R7k2nx329WzXOpe+bCIMSWy3NNhmoX0W25
         8qrNLL2JhnOgXF2Q4NgFR6GpeuCTf7A+i28q1X9uQlpRKiimH6PbzLT3dh0cmMsQu7yD
         syHjpMKcjlmcwMdrI7OMmfHUU1xsK0i89U20Do27wZxGgCX8NTgVe0guAcUqcN1bDBTY
         GokYPAd1o4HPg7t9RJRgc6S2p6pdMKKRO27wwvMx8qf1w0X/o9wT9twrVpHtBW1EkVLM
         UQ5oko0Xb0jPA2z+MBrIie0DmI+tXcv+5JhhYoWH81AZLJmubFNZUGBon/sbh2tcxplg
         wa5Q==
X-Gm-Message-State: AHPjjUishZRugcUqzUYndnhP9K7feDTzrxo2t5Ooq3Gi7vClzqIg5oIK
	JJ0fC5uid+x+70c5R58=
X-Google-Smtp-Source: ADKCNb7Prwu+TMRvj4OI6roGipPmwrJ5gkaK5fx073BxDK0EVs/0tDBd82u3Rsf3XqgfywQ+n+K47w==
X-Received: by 10.84.216.71 with SMTP id f7mr17329355plj.201.1505224367485;
        Tue, 12 Sep 2017 06:52:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net. [97.126.103.167])
        by smtp.gmail.com with ESMTPSA id r16sm21623494pfk.178.2017.09.12.06.52.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Sep 2017 06:52:46 -0700 (PDT)
Subject: Re: [PATCH 8/8] tcg/i386: Add vector operations
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <20170817230114.3655-9-richard.henderson@linaro.org>
 <87377xijkt.fsf@linaro.org> <871snhibdr.fsf@linaro.org>
 <889b3e05-64f6-8eb6-0c22-87b09b86b7b8@linaro.org> <877ex5bo31.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <54b956b7-0fbc-a71e-2dd3-38f77abd4aa5@linaro.org>
Date: Tue, 12 Sep 2017 06:52:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <877ex5bo31.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: b9NgRWlHt/Gf

On 09/11/2017 02:07 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 09/08/2017 06:10 AM, Alex Bennée wrote:
>>> Also this commit breaks RISU:
>>>
>>>  qemu-aarch64 build/aarch64-linux-gnu/risu
>>>     testcases.aarch64/insn_ANDSi_RES8_ANDS_RES_ANDv_ASRV__INC.risu.bin \
>>>     -t testcases.aarch64/insn_ANDSi_RES8_ANDS_RES_ANDv_ASRV__INC.risu.bin.trace
>>>
>>> Gives:
>>>
>>> mismatch detail (master : apprentice):
>>>   V29   : 000000000000000005388083c1444242 vs 00000000000000002a000e0416a30018
>>>
>>> The insn is:
>>>
>>>   37c:       6f56a29d        umull2  v29.4s, v20.8h, v6.h[1]
>>>
>>> Which is odd because I didn't think we'd touched that.
>>
>> Indeed we didn't.  Still, I'll check it out next week.
> 
> OK it would help if I had objdumped the right file:
> 
>      36c:       0e781fdd        bic     v29.8b, v30.8b, v24.8b
>      370:       00005af0        .inst   0x00005af0 ; undefined

Thanks.  The sse pandn operand order is ... surprising.
Even though I know that I still managed to get it wrong.
Fixed for v2.


r~
