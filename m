Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1264302lfm;
        Fri, 17 Apr 2020 20:27:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ2JntrpDpzT1M5a1PAGE4WVwMj7eIkumH+JjeWyAETeK03ibkU39HIJLSYHQqSwF8jShJO
X-Received: by 2002:a37:4c4d:: with SMTP id z74mr6403459qka.53.1587180453675;
        Fri, 17 Apr 2020 20:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587180453; cv=none;
        d=google.com; s=arc-20160816;
        b=LrnVwc+UtiN4QJQ6dvqn5c8kWYJ+payuQIwPVW96C2gCEZWqshsImvbhBT6Eud3lef
         5nEVNaU5RCq21AKXUtbd6Dg5NWUmc0lgitUSrGx/YYiwav1IDmo/jI4sA0ZaTqUegYeP
         80W6sLFaNPcqcztPh4Ofpp3Xuc967jaTuvz+VznV3wR3I/sBPVXkygPIrxt7m7xUWIiQ
         LVZBjyKPXTBVEI7/+FyQP9tS8nzQFZ9B0UHqfAYg+2e3xlH1DQA0aH/nwll4uZckqbfQ
         BrYU4yqvtZb9w8YujyejR0PlhIOci53bGpiVLmlOwSO3xfx86NeqAgX001hthXQXuaCc
         pcmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4S5+MAzGOSfi/hcjNLQ8N1bIo2gE5EagUU9lnTXma3U=;
        b=PH6OtlMfRr/4XWHF9V7QLb0aaxw8v1YcuN6lxJe7eXMBC+4FXLVGKWcVivvms41Rek
         EIUy169GYTH6RUlxOi7vBD0ET+Vt2LKQhIuWf37hVyvznjsh7y/4D2X3ttqhMCpuQIeZ
         phnFN6E6EG4GF94/Xev8eAP+I5CQ0zJERNIpVpHS5NkCIfcbUJakdcJWxNGSP6NlVyzt
         dFTM/fPMKU8vY957B0YUf1PczY1a5kKV9n0Q8KQ7C+5S7fHZ4zVOkELk2OAwyVHbWEOZ
         5nxfvbLo0SR2werlQHB1Aulum18HmDh8BHiD6LuFqLuLg8Jlzkh2mu4sQYMIPGLxPI89
         gRxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KTMPEP8U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si1946661qkl.358.2020.04.17.20.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 20:27:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KTMPEP8U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPe8j-0006Q7-3O
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 23:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPe7q-0006O5-28
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:26:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPe7o-0004bO-3C
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:26:37 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37267)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPe7m-0004VJ-2I
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:26:35 -0400
Received: by mail-pl1-x641.google.com with SMTP id y22so1697850pll.4
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 20:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4S5+MAzGOSfi/hcjNLQ8N1bIo2gE5EagUU9lnTXma3U=;
 b=KTMPEP8UruJWUkWgHeehierjPMZYwZs7QKLStALLUGGhV1VmGJOZyiAyDRYVTkfFWE
 ObfaKvK99rUX0t+pDYUms5vclJhuL7tfOEc5WwhQ41Lh1Svm1Ui0XINQ2JiVeYJRwXLi
 qo6M17lkHM7xRqXEPZp7D9NBbT8UzNpQv7jyZvDqI8jIYPmfmWEB4Bpxjv0xleN030s9
 Fd5IMEhz68TkoEmyTZUx1TUigPKA4W8MXdfBfJPPDG4ngkOzyMZnbcI0o5itRNU1R/RK
 /o7PPmE5sSSkrgZbcL46mT5vz6Wb3nhLHuK1oWM9oI4K9fPsqdfq0+n8LZYiI9pBv3+8
 PRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4S5+MAzGOSfi/hcjNLQ8N1bIo2gE5EagUU9lnTXma3U=;
 b=DscDxX2kfQs0AITH2AsGPb/2qA+b2+TAONQsXGT3UWEOiHyw9kB3cDCkH2ldJ1DtsI
 jo8+x5Hgvr6ope0kCbsQN6+xYE+VKbLtH61YcBS5pjjlpwXcoFpSoqPabMwUVj1yttaa
 PN9FEAr1ovl5Q+0I6KP639dLb8yDMw/igozRiGSYDZKluu6XHMgL7CTNMaJBcmL0ceti
 EDo3Xamq9msvWVRG+9p/xh/gnU2PdGNLsEaoDVt7kiekD3bd3LGbbARrSGSGCT/Tk7mb
 3xAt1qtQzm5y9hJ+BwG9XgRc7JZSxuNiQLFEu7y0OaiMph77BUCByaq5NcxTGgWDNuAc
 gClQ==
X-Gm-Message-State: AGi0PuY+CRc513fvdqt8NrrCzY1tyH7Vua7oALsVBdrYrAvFaeHRF8Do
 sfFWwlDn5tmPmzrdvhIHDfyu7RwSKWg=
X-Received: by 2002:a17:90a:1503:: with SMTP id
 l3mr7798799pja.87.1587180387229; 
 Fri, 17 Apr 2020 20:26:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id x25sm18788027pfm.203.2020.04.17.20.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 20:26:26 -0700 (PDT)
Subject: Re: [PATCH 10/16] target/arm: Use SVEContLdSt for multi-register
 contiguous loads
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-11-richard.henderson@linaro.org>
 <CAFEAcA91-jPRjasTfPiGaNPwiF0Mye-vUU1p8YG8tWyU4yC8fQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9be891e-b5b3-c075-5c07-01fd913d3438@linaro.org>
Date: Fri, 17 Apr 2020 20:26:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA91-jPRjasTfPiGaNPwiF0Mye-vUU1p8YG8tWyU4yC8fQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-TUID: aojtV4kvNtSD

On 4/16/20 6:35 AM, Peter Maydell wrote:
> On Wed, 11 Mar 2020 at 06:44, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/sve_helper.c | 223 ++++++++++++++--------------------------
>>  1 file changed, 79 insertions(+), 144 deletions(-)
> 
> 
>>  #define DO_LDN_1(N) \
>> -void QEMU_FLATTEN HELPER(sve_ld##N##bb_r) \
>> -    (CPUARMState *env, void *vg, target_ulong addr, uint32_t desc)  \
>> -{                                                                   \
>> -    sve_ld##N##_r(env, vg, addr, desc, 1, GETPC(), sve_ld1bb_tlb);  \
>> +void HELPER(sve_ld##N##bb_r)(CPUARMState *env, void *vg,        \
>> +                             target_ulong addr, uint32_t desc)  \
>> +{                                                               \
>> +    sve_ldN_r(env, vg, addr, desc, GETPC(), MO_8, MO_8, N,      \
>> +              sve_ld1bb_host, sve_ld1bb_tlb);                   \
>>  }
> 
> Deliberately losing the QEMU_FLATTEN here?

Yes, the main helper is now marked QEMU_ALWAYS_INLINE, and there are further
subroutines -- like sve_check_watchpoints -- that we do not necessarily want to
inline.


r~
