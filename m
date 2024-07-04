Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp3852020dlb;
        Thu, 4 Jul 2024 14:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1QGdfTQkjW6zK+L48RNrF0XUIvp+Kaao4KHTNXdbty4Oo3H/Q98eZBoWHxlTufAYok/+I5Drsg/yD6DH9QyOkTt0RcuHa
X-Google-Smtp-Source: AGHT+IHH/z5VnWb4kZXSf6ATCCf6uItq0VeZ3z5j+3C6QLkO4Iu1663wxtGUIQO0eoiwrecKFpxP
X-Received: by 2002:a25:d386:0:b0:e02:bc84:3c6e with SMTP id 3f1490d57ef6-e03c19788a7mr2980217276.35.1720129748070;
        Thu, 04 Jul 2024 14:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720129748; cv=none;
        d=google.com; s=arc-20160816;
        b=cGZ1NIR/KVRW5nn2yUFCOGXlWvP0lrhIgIYHCEqhsNY9+np7lnURjTnrsyN0ySE3sv
         UtYSQQ+BgxGETMGaTBCwZbylVIWdgqo7tE1DOFiWviyQiwZRK1DoeQLuBXzKclmX3yWd
         gIqIl1ccHlILEVtWtywX75K3T/WHMlR6xlOrjkjVWYhoUbIzN4HJHNh98XaVXUPcVRIM
         vN8L2fH9oGoqI5v3G1ya2r6RS4aUCN3tU+Khq33Zc2VccliflSxHCDP7DsBCN6kQ3pG+
         XW36scg43tJMpH4rSwGHfsiyBneZh5n/N3RLWsMHDErK/r2AN2tGe4mxLKUzb4mayyNS
         qRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UXdXNrzXHs1jAxaiZC3oyN3h2LVQFfAai4/0LTZpJeQ=;
        fh=OaMoISsQ7A2KyAwf7TECXIWfdGbs3TU/1Sc/cYgGmew=;
        b=w9Qs6xP5B1sNQUPERGtyQLj7XW7lNPFr7HIPo6RXCx0F9FlkC1404yajWds+FTcBgO
         r6rBovQj+R3p0mfhZx/Pzz2ICoSiC6T4W4z+ZWP+GtmEXC/3RKiIoei9zrFoOBTn46C2
         42PvfloP0eDfLDi0nywajBmaIK/QUC3p9A368Z0Z2QE2pZtRouZ61HlOR9Xedl3pw0OA
         iLnt5vXP63alIFBW6sT1lkK2CZwY+hVLogB+rqKx46/9v0xaFa45knmy+M2s1dv1px/S
         /8egzI46iI05SAUU1wfYys5A6dF45J0kNMaPCMta7UqqcbVYuN2kTMnjzZRGA+adfEMf
         f+Ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D6is066q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d692865fdsi1544688285a.161.2024.07.04.14.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 14:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D6is066q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPUJf-000211-Bo; Thu, 04 Jul 2024 17:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sPUJe-00020M-6X
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 17:48:34 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sPUJO-0006Tz-UE
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 17:48:33 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1fb222a8eaeso7726885ad.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2024 14:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720129697; x=1720734497; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UXdXNrzXHs1jAxaiZC3oyN3h2LVQFfAai4/0LTZpJeQ=;
 b=D6is066qetXFxoKcaIbRy4egePaY4+F3y2l6wrJrgUY7kss71Z7GFiHbEyNJglHjaY
 TFPuJdC7gPS1z1mDxdWjAp1yCUWhJ7lNLUV3kWgVrJOENnd4tdAMIb4VjvtB5MkO80xG
 FPPxviny3Wl268TS7GEvNs99DO1N5vi963cGrceeLmMKy0P/n8+IGpiM4vNDQMLYLARX
 j7uAjM05YTr2Du06FEUBcgzxBOQ52pYBS5bDxUhHcs5CrOjWhcmiaNrVVddvEjSiByoU
 +AjljVfwNrCV8Hm6/BBPz/Eq3vimLK7FxNssP9CwmIY+JE4kKqL7Z0tUu4ZfDCdTRTeh
 NjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720129697; x=1720734497;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UXdXNrzXHs1jAxaiZC3oyN3h2LVQFfAai4/0LTZpJeQ=;
 b=uEwB9Tb7NigEJPCpWl/1EI4VA/e8WAicwKPpa04a8pD5spv2FoRj9UUYi+EXXUf+Yk
 9M3kkZjwchztkLoITMybpj/8YK2VfxHitne/AmMwkHJRjzTDNMOkwlPdkQ+68+iydM/v
 GxAOniJCjZcK4iQvKpxH1gMnMchNRptRQEh46nzQi3Sytl1PulsIlDGjkjfWfOiBX+g0
 O9MHfrcaoZ7rWhPKQ50pku2lrWcnH2HMAY+T+Fks458VNXh2Go8QYE/iUhIUw3fOrs3n
 7SNY4Bynuehg18/s12Z4XLcnQ55NcomvPGXK6DwD0jBDCTxSfGC553ZCyYWVtKCfraYW
 Hckg==
X-Gm-Message-State: AOJu0Yzf2+h2RpbBg2yrIJHZ6+IM6lb8Pj+LHAhoAzYpWwjP9JQuQvWS
 n/+muqmHk3YUsx0dKz9xNlLRKNq3mGip6CK8vKanxHWILWYSK3TzWuUcqOUeQdM=
X-Received: by 2002:a17:903:110e:b0:1fb:167e:fb15 with SMTP id
 d9443c01a7336-1fb33f218fbmr21733495ad.64.1720129696792; 
 Thu, 04 Jul 2024 14:48:16 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fb2eb50710sm22600315ad.201.2024.07.04.14.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 14:48:16 -0700 (PDT)
Message-ID: <426dbf1d-cfa8-4fd4-b857-8b8a283dd55e@linaro.org>
Date: Thu, 4 Jul 2024 14:48:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/arm: Fix unwind from dc zva and FEAT_MOPS
From: Richard Henderson <richard.henderson@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, david@redhat.com,
 balaton@eik.bme.hu
References: <20240702234155.2106399-1-richard.henderson@linaro.org>
 <13b19a4859e25274d05663bc0ca05621c56af985.camel@linux.ibm.com>
 <9fe81eeb-473a-4ffb-ad6f-f93e40283e8a@linaro.org>
Content-Language: en-US
In-Reply-To: <9fe81eeb-473a-4ffb-ad6f-f93e40283e8a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: cZUuDBC9iDJh

On 7/4/24 08:18, Richard Henderson wrote:
> On 7/4/24 07:50, Ilya Leoshkevich wrote:
>> On Tue, 2024-07-02 at 16:41 -0700, Richard Henderson wrote:
>>> While looking into Zoltan's attempt to speed up ppc64 DCBZ
>>> (data cache block set to zero), I wondered what AArch64 was
>>> doing differently.  It turned out that Arm is the only user
>>> of tlb_vaddr_to_host.
>>>
>>> None of the code sequences in use between AArch64, Power64 and S390X
>>> are 100% safe, with race conditions vs mmap et al, however, AArch64
>>> is the only one that will fail this single threaded test case.  Use
>>> of these new functions fixes the race condition as well, though I
>>> have not yet touched the other guests.
>>>
>>> I thought about exposing accel/tcg/user-retaddr.h for direct use
>>> from the targets, but perhaps these wrappers are cleaner.  RFC?
>>>
>>>
>>> r~
>>>
>>>
>>> Richard Henderson (2):
>>>    accel/tcg: Introduce memset_ra, memmove_ra
>>>    target/arm: Use memset_ra, memmove_ra in helper-a64.c
>>>
>>>   include/exec/cpu_ldst.h            | 40 ++++++++++++++++
>>>   accel/tcg/user-exec.c              | 22 +++++++++
>>>   target/arm/tcg/helper-a64.c        | 10 ++--
>>>   tests/tcg/multiarch/memset-fault.c | 77
>>> ++++++++++++++++++++++++++++++
>>>   4 files changed, 144 insertions(+), 5 deletions(-)
>>>   create mode 100644 tests/tcg/multiarch/memset-fault.c
>>
>> This sounds good to me.
>>
>> I haven't debugged it, but I wonder why doesn't s390x fail here.
>> For XC with src == dst, it does access_memset() -> do_access_memset()
>> -> memset() without setting the RA. And I don't think that anything
>> around it sets the RA either.
> 
> s390x uses probe_access_flags, which verifies the page is mapped and writable, and raises 
> the exception when it isn't.  In contrast, for user-only, tlb_vaddr_to_host *only* 
> performs the guest -> host address mapping, i.e. (addr + guest_base).

I should clarify: probe_access_flags verifies that the page is mapped *at that moment*, 
but does not take the mmap_lock.  So the race is that the page can be unmapped by another 
thread after probe_access_flags and before the memset completes.


r~

