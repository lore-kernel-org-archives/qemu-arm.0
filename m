Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp558385lfa;
        Wed, 2 Jun 2021 12:02:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXKSSTQje8QKZJoUf6KEqNgttT8128GdQn1Z+QXc5wyqUiC2vZQqjqxy5kppKCQyYpRsZW
X-Received: by 2002:aa7:da8e:: with SMTP id q14mr40666013eds.13.1622660542527;
        Wed, 02 Jun 2021 12:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622660542; cv=none;
        d=google.com; s=arc-20160816;
        b=lEKyPBnVjVpNlI1UWxsBGBF0DCJZviBbkNo1gsd6y5pYG/d3/RN0Sxuq/imPsPZ8Fm
         Lyoj8uxxMasqjXVipXv5gjwP0yRITsyjy2kPKWuAK8CBYMJXj+VcP1mPaXMfXZqeWs0G
         Vdw50XI8draq75dfJs9sOYd/kSuNpb0pZDCQNzrVgJA9qne0mSepZUB0mwBvudrkJOw8
         StfebQVbF3tg4kBQ+mlbAzuhuuQ1D3kBXSobhIIr6kWWVpE761WF1b8Cm9viuHTLwbkR
         7DFybDqS2vtkg/5QzoaJIrneG9rnd9Tx9+RfQsF3K8hxS3je3GTpjPRLcf21U7OuV5r0
         vQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZwSU2E/6RpKKcXsFr2QAetwN4V6PJytQI5uom63pQ0o=;
        b=Vx0X6sRIuVsmBmPACVqiOk8CYRPJcHnsaMArs5v+XFPb7AOszRZl3YV8T9ZUXWkYC1
         bGRHrDZciCJ4y7LaJ1AESLOK+OxlGTuUQ0fagtGpxrO2fV6nnkTk4Iz5aJOi7stJ5rHp
         2c0HbTgVOmPr9ZhqEAohB/R9F6VDsNOjAuug7+yQ5rDc3CzUM0jt1VygHF7aMW+ZDCwE
         dxHJQvAXY0DHhHBrtqgG2up1lXeV742ASFWJjnGVqQNcv6HzlXeJldyr9iEQIo6+eb0f
         pA7NyIRnsGcePGyku6yuk/DShBlg1UtCUR8eebZ6LHL2KcaDFEmcMFoEsUnQ/5tv5RgH
         ysAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lm3uARgM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22si459738ejm.605.2021.06.02.12.02.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jun 2021 12:02:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lm3uARgM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loW8D-0002E7-FT
	for alex.bennee@linaro.org; Wed, 02 Jun 2021 15:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loW83-00029L-8R
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 15:02:11 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:47024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loW7z-0003os-T1
 for qemu-arm@nongnu.org; Wed, 02 Jun 2021 15:02:11 -0400
Received: by mail-pg1-x52b.google.com with SMTP id n12so3017384pgs.13
 for <qemu-arm@nongnu.org>; Wed, 02 Jun 2021 12:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZwSU2E/6RpKKcXsFr2QAetwN4V6PJytQI5uom63pQ0o=;
 b=lm3uARgMotfALoc8MUIajMC/OoH3fflOxleX6ydNCuuWmVfAhb1q/74xZqsQpkVdBc
 mVNH/YNqt3FiX1QMfuUOTD/NlESn9T7fjYK5rlXwSnbCeOkrYGkN10C78tpEBiz1QB/a
 w2bwgJ9JtL40n+3OmG0DxokJ0ddokNV2Emd5oY3kbOkIBZYp+abprlE4Ye69qXkn9i6a
 i0qw3JeitTCEE7SIrB21SWT84wtN4yCbnQnz+u1OVnRpO1Xk+gqOv89otgywNGfreExe
 tpk0EpSNwLtWUzEHItyHLAhfdOGmuhKMrOXNegAUmDZjGMhPMcerUyKBPMXAOloI7G+q
 ec2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZwSU2E/6RpKKcXsFr2QAetwN4V6PJytQI5uom63pQ0o=;
 b=qOi4FJPi39rj0X2yi8EMxc1MAWhznvzK7+8sV59GjWA2a8SGZTmrKJCJJ+Gmrnp3wb
 jS790dknCL4kyTTMYFLM+hK7R2AJqf7hlHXomkYjJ+lisaBjpRRNZBiBcfwag+tfcacz
 f4SHq3kaEEOJSkLvowwFMbiBCHBt8AZparK35dP8n+RoI5OJuA4C8B+ReBcMd1A8tlj1
 TP+2WdfAM94M0bL2TWi+YJdicvWF8S2N/UfYqRSt0/nN5c3sdaAJvxgRLKEHdjUfBlPK
 1QXfGD73p0+uElUuOpfaNv7anzd0bS2aVg/mN8gwsERwlFtYt/RVXOuEtmz2TgwdARwK
 DUag==
X-Gm-Message-State: AOAM532wxdDmMQc/b+7o8ynAgxaDhTh07An8aZGdaNjxT+mxFJogvFDZ
 ssGxWin+7vuLl4Oil/puYoNFSA==
X-Received: by 2002:a63:164f:: with SMTP id 15mr35539723pgw.175.1622660525883; 
 Wed, 02 Jun 2021 12:02:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id x9sm462787pgp.5.2021.06.02.12.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 12:02:05 -0700 (PDT)
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
To: Peter Maydell <peter.maydell@linaro.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
Date: Wed, 2 Jun 2021 12:02:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BMasMGIkutej

On 6/1/21 8:21 AM, Peter Maydell wrote:
>>> I'm thinking of implementing A64FX HPC extension in qemu.
>>> A64FX [1] is a CPU developed by Fujitsu that implements armv8+SVE.
>>>
>>> [1]
>>> https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Microarchitecture
>>> _Manual_en_1.4.pdf
>>>
>>> A64FX is a CPU developed for HPC (High Performance Computing), and HPC
>>> extensions [2] are implemented to improve the performance of user programs.
>>>
>>> [2]
>>> https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Specification_HP
>>> C_Extension_v1_EN.pdf
>>>
>>> The details of each function are described in [2], and the HPC extensions
>>> include
>>> 1) Tag address override
>>> 2) Sector cache
>>> 3) Hardware barrier
>>> 4) Hardware prefetch assist
>>> are implemented.

Thanks for the pointers.  It looks to me that it'll be easy to implement these 
in qemu.  We'll need to implement the registers, so that the OS can read back 
the values, but we do not need to actually do anything with them.

>>> 1) Is target/arm/helper.c enough to implement the register (ARMCPRegInfo
>>> structure) of HPC extension function of A64FX?

Yes.

>>> 2) Is it OK to specify the option to set the HPC extension of A64FX as follows,
>>> for example?
>>>
>>> -M virt -cpu max,a64fx-hpc-sec=on (*sector cache function) -M virt -cpu
>>> max,a64fx-hpc-hwpf=on (*hardware prefetvh assist function) -M virt -cpu
>>> max,a64fx-hpc-hwb=on (*hardware barrier function)
>>>
>>> It is also possible to implement something like -cpu a64fx, but since we don't
>>> know if we can implement it immediately, we assume that we will use the -cpu
>>> max option first.

My first thought is that -cpu max can simply enable the extensions, without 
extra flags.  The max cpu has all of the features that we can enable, and as I 
see it this is just one more.

I would like to add -cpu a64fx at some point.  But as you say, that need not 
happen right away.

>>> Since there is no example of A64FX function implemented in QEMU, we would
>>> appreciate your comments before we post a patch.

We endeavor to enable features by the architectural id registers when possible. 
  Thus the cpu_isar_feature() checks in helper.c.

The microarchitectural document provided does not list all of the system 
register reset values for the A64FX, and I would be surprised if there were an 
architectural id register that specified a non-standard extension like this. 
Thus I would expect to add ARM_FEATURE_A64FX with which to enable these 
extensions in helper.c.

I can certainly help you with this.


r~
