Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp677728njb;
        Thu, 4 Jul 2024 08:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPqlaWQ98L9o9jUASNJstmZ47zVbIjVQtafPBFLTcE2Z2EAll7gmjqy4IB5XBKYcBh4KKzRoD/BQdv9pvvOIpsj8eQmtUf
X-Google-Smtp-Source: AGHT+IFgZVg/sPfPeCm1RNkjU9Ml9yptvFzLSn/4wwWsoDRH3TTkKbgyi4QGcu85C8ARur0JGxR6
X-Received: by 2002:a05:622a:5b8d:b0:446:59fc:ea66 with SMTP id d75a77b69052e-447cbf895dbmr24721121cf.55.1720106328458;
        Thu, 04 Jul 2024 08:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720106328; cv=none;
        d=google.com; s=arc-20160816;
        b=lN76vNoVKBxCHXGkpwOyjvjtZ7nRatDs5Cz6lj6/o4Tfsj2vZg11Du4ktek/RrItTN
         zgA4cWuRWU5FlxXyM/2pfx4Jj/yXvpsztVTgWQZLSB/8j8CAcyezg+aAwIpItqjCPBCj
         imv1v0gxSt/GViNUH2K1I/CuvnVK6tAFf2weeIMxR4EZ1rIxw2zwRjhu/T1StU6FAA1G
         XyddE7XoVshwU010eU/CAfGEvwfsfh4rQ85oHRyQUH2/bG8p8Cba3MF70Ddeh5Jqogt9
         BtTbK+Tvd2kWYWCCI4MZz1oE4CCe7pC+IrmDcNhf0qQDbaYU999vekDfoevMNrZTCm9w
         E+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wLCzWgyAAzzMDQGCfRV1PTCC5bLFjvKFeRuUldkJYLA=;
        fh=OaMoISsQ7A2KyAwf7TECXIWfdGbs3TU/1Sc/cYgGmew=;
        b=tXdWCQS6h8lZzcbzrwSzCYPWRaJP6deh5Js786Y7gQ7UmRQS2BvTJaMgDtGev1MrDo
         +XehQj9/NcExsflkiIH/MCsnqKLmXlP4cqg2qUn8VWTQ9zHcxu3Ijp6kum+C0saHlzIf
         m97Yn2PBQ9GbSvRB5k/nJr20XKICv4yJL/sGsQllsaytG7cTz8vyfePhAKpMyWzq71K3
         Th6hzbn9mdiYsOPedCkGW3VveKXOaoYxo/ATuZauZfCrHJKjIeOy+VU5Iw/URt5yPgFt
         IbVMQk2KFj0+bRnWXGzoBqTuFPbKfRj2hwE2bkb1oPVTpRshmBokqKmxnEzsi6V7I3Qe
         0zvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ozdLVAfO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447c28f46c3si31382181cf.236.2024.07.04.08.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 08:18:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ozdLVAfO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPOEE-0002Iv-Rf; Thu, 04 Jul 2024 11:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sPOEB-0002HX-V0
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 11:18:31 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sPOEA-0006RG-AH
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 11:18:31 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1fb222a8eaeso5607015ad.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2024 08:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720106308; x=1720711108; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wLCzWgyAAzzMDQGCfRV1PTCC5bLFjvKFeRuUldkJYLA=;
 b=ozdLVAfO2j9o07EtLDXywvCmP61dsr6SMuyJiU1FFaDSouzdZ7ihW8TVjdTjoydf/x
 9RLjGHu8qMcQASJ1Ch4HYHtKSSKMdbYl/2RncmfctRScCGEiTsB0HOozB/7lS0wlUA0u
 9ntFz1hRUnL5OvIvsey8ytLsm0yPqsmRHKlq6CLyW9PgbsRuRwIJ54i9JpUzJnOAJkEg
 9FFwGUEFPVXVXD6oGTTOltFdHj7Y1qsLovugKezWuSchcv9Qk8w6nhXRW1ZhmWxSlM3y
 0OHgrIlmeVeLPGcPCD6SW51ezjwXOENyc+dF54ShiL8qJSCk5F8O1V1K9DVrTrgB/ZMx
 DtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720106308; x=1720711108;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wLCzWgyAAzzMDQGCfRV1PTCC5bLFjvKFeRuUldkJYLA=;
 b=Vv39AehlPmqgfy3DHvf8uQ2olcoTs1ubkXtmQ4flTysaJA+h7gDIDJXBHdVIlBfne1
 Dj5sqVqikRfHAvz+GMDwFCzIjwOmQzkptOBi6cN3d6UquEhtSuXcD+eVmftvEVjXtZxQ
 MbjBbG6uMBwUs/N7n0OcwaEdoOT2E7sy+QCIyBAM0rdK5urobe+w64K8+DMopeJsvm00
 S+8W3az+GIv5yMeGGIKk0WdD71R+66uIHk5NpZmINFbcFk3b5q58wzp8on9ogNWaK95/
 pnptj2DwqeWX8QgZn+g/24ZUwFKDAyzdUZ+YqBDRRrMNwpgRHDju33qX7pL/CwKFMDJQ
 p4sw==
X-Gm-Message-State: AOJu0Yzs16HW+ihWfT+46s3+Jfpy+isdX8lfK7aADpXVS5GydxCZl74q
 Djk2ctDXnHGaZsP2rCVxIqwL7CSr8P36Pd6t8DTe1o4aVd6Roiop+PtjHPhb6AM=
X-Received: by 2002:a17:902:ec92:b0:1fa:8f64:8b0d with SMTP id
 d9443c01a7336-1fb33df55f9mr16234285ad.4.1720106308380; 
 Thu, 04 Jul 2024 08:18:28 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb17d8093esm34799395ad.3.2024.07.04.08.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 08:18:27 -0700 (PDT)
Message-ID: <9fe81eeb-473a-4ffb-ad6f-f93e40283e8a@linaro.org>
Date: Thu, 4 Jul 2024 08:18:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Fix unwind from dc zva and FEAT_MOPS
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, david@redhat.com,
 balaton@eik.bme.hu
References: <20240702234155.2106399-1-richard.henderson@linaro.org>
 <13b19a4859e25274d05663bc0ca05621c56af985.camel@linux.ibm.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <13b19a4859e25274d05663bc0ca05621c56af985.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: VXwMXWu2g8TK

On 7/4/24 07:50, Ilya Leoshkevich wrote:
> On Tue, 2024-07-02 at 16:41 -0700, Richard Henderson wrote:
>> While looking into Zoltan's attempt to speed up ppc64 DCBZ
>> (data cache block set to zero), I wondered what AArch64 was
>> doing differently.  It turned out that Arm is the only user
>> of tlb_vaddr_to_host.
>>
>> None of the code sequences in use between AArch64, Power64 and S390X
>> are 100% safe, with race conditions vs mmap et al, however, AArch64
>> is the only one that will fail this single threaded test case.  Use
>> of these new functions fixes the race condition as well, though I
>> have not yet touched the other guests.
>>
>> I thought about exposing accel/tcg/user-retaddr.h for direct use
>> from the targets, but perhaps these wrappers are cleaner.  RFC?
>>
>>
>> r~
>>
>>
>> Richard Henderson (2):
>>    accel/tcg: Introduce memset_ra, memmove_ra
>>    target/arm: Use memset_ra, memmove_ra in helper-a64.c
>>
>>   include/exec/cpu_ldst.h            | 40 ++++++++++++++++
>>   accel/tcg/user-exec.c              | 22 +++++++++
>>   target/arm/tcg/helper-a64.c        | 10 ++--
>>   tests/tcg/multiarch/memset-fault.c | 77
>> ++++++++++++++++++++++++++++++
>>   4 files changed, 144 insertions(+), 5 deletions(-)
>>   create mode 100644 tests/tcg/multiarch/memset-fault.c
> 
> This sounds good to me.
> 
> I haven't debugged it, but I wonder why doesn't s390x fail here.
> For XC with src == dst, it does access_memset() -> do_access_memset()
> -> memset() without setting the RA. And I don't think that anything
> around it sets the RA either.

s390x uses probe_access_flags, which verifies the page is mapped and writable, and raises 
the exception when it isn't.  In contrast, for user-only, tlb_vaddr_to_host *only* 
performs the guest -> host address mapping, i.e. (addr + guest_base).


r~
