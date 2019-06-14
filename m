Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1414134wrg;
        Fri, 14 Jun 2019 14:46:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxI4y4ZL89GsdAWLxHHvaLlxun7zrTZEk6l8ByRKUp7ekRBryytftQ/kDea7HkJPpK8fOvK
X-Received: by 2002:a0c:b012:: with SMTP id k18mr10336090qvc.74.1560548763354;
        Fri, 14 Jun 2019 14:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560548763; cv=none;
        d=google.com; s=arc-20160816;
        b=R/GCVfZ54pX6nMo6vjt+MewM7vQcISZ8RLfzWzrSan/ZDROEGCYAS+67vrZLAz69Mh
         g3vCMAuP3BE7JNRQaOW91bxcUB1vZQ+Al6IAEASDl5If/pygcpmH6VMok6tuguSJGryF
         zaoO6nyCbWYuYVx4ziocgZZTM14uKKtB/iSSxnzdhGXbmL1GlBbdnkxVtLjLRdLYCxra
         JEiMtdn3DeqqTM3uzsfPxEDo/7H4VaV5i+no6ae9JDyv9OMfqkrxL49NSLxZCVqXJfez
         FqUZtyzPuIPwr0H48zvH/3iGQzFBHmO3uRGQON6DSlWw8mX6tiOml+pf5q2DPF1siP/+
         Qm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ThzpBAVx5EEvdVUYsfYMRxq9rB+36Nya6f3VN3f26ig=;
        b=o/GdIQNQ0HKiJfC+UjLUnhtCpdRp31ovPUU7wI+9ecPI4c1QhfZ2xyx30IH8PoBWOM
         NTlQgyfN0WZDtOe8Nu/fSlRwWwC9VXLU2C1yrfEsPtzJSf1Hi6J2HulzQ09mwTTkIF/9
         fpiX/17bZ3q1mRddsYF1ThHMd3riCIIr7tcsS4S2E+qhi05VYZZ+Jei8JOwigNXmuAbV
         G2F/RCQi302HMFRjjJ47F2NCJAsRinve3wqf1AY5I6/8WdWewSkgWRH2FfRvNKHqjr39
         bvG4JLKFBimpUvxhvirZYq+IKPTFaE5t2ow7bmsD2KgeTyhdD4qxc1c4BUPoQMRNZLcz
         pb2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=go3lzCxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si2286453qva.47.2019.06.14.14.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 14:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=go3lzCxJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbu1K-00016L-S2
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 17:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45845)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbu0y-00014I-PK
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 17:45:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbu0w-0004A5-Le
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 17:45:40 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33819)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbu0q-0003z9-GE
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 17:45:36 -0400
Received: by mail-pl1-x644.google.com with SMTP id i2so1523043plt.1
 for <qemu-arm@nongnu.org>; Fri, 14 Jun 2019 14:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ThzpBAVx5EEvdVUYsfYMRxq9rB+36Nya6f3VN3f26ig=;
 b=go3lzCxJZpNJXUsoLsm82LmKeVffmAiN6wX5+qbvKPJ2TwAzEwmv2k0bE/oqgWyhhA
 Ap9+XS3nXOZTYxlZ1QL0npPO0xhBxbA1AUg80n2YjTJWBggLv+IPfCG6AUYRy7Dqc1Gw
 XHIDLBtuRM6BX2VB6TyYKcCdAAvq5XRpyHFQGWrVZLYnQzr/bu4cMNzwJ8VDCpP9mLSe
 /2bIGtC9SsHQEHX8PVc/zeAmKH3P+Fbaj2kmGCQfTCjZqQNBwKJAGw19voGSyZ2vzwxg
 bR1ZxDNUNTGgx4s+dPZum72TEaZlTJkwjz/TyppN8NPRc8kprk1dcgJFIBeunZdwkPef
 BUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ThzpBAVx5EEvdVUYsfYMRxq9rB+36Nya6f3VN3f26ig=;
 b=UjIpDVmtNWaU/v+HOaO6O1COYxWVKHrKhMWBYyyZ2pd+NG7f8usrkZOIhDGVPqCKhh
 e/z2ZPBXcTdKGxWXLFjKULtX+5DhGmFqoDAeMZ3X+KFzlpe4o4eG6WfnXlrZNhTNUm7g
 pMpAHKsoKIkVIzIyZp66HQJVUXPZY4XhqKIqww43XHKOFrvURFrgwto664cuBDLRB7Ko
 +djEwS0p35xU5u/ymnyn+X6nKcoO0WZBXc9aVyDcdnsl7gS6ofTegh9oa7iyYssmjvb2
 vrlK8A6R/lJQe0Zy5k1dld0D5UypgS+3w2PLdwnrO9Rf/fom6LhpTQ5UgcBwWqbiAjc+
 0xFw==
X-Gm-Message-State: APjAAAU5uWCRY+Cd6XAAUxZOzx2gcrWkC5xHlXEIw6flg82T196KUtRW
 /S8YryuyH/nX1dDriKE53VlIqQ==
X-Received: by 2002:a17:902:6903:: with SMTP id
 j3mr20259253plk.247.1560548724361; 
 Fri, 14 Jun 2019 14:45:24 -0700 (PDT)
Received: from [10.1.2.220] (50-247-96-158-static.hfc.comcastbusiness.net.
 [50.247.96.158])
 by smtp.gmail.com with ESMTPSA id x8sm4139973pfa.46.2019.06.14.14.45.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 14:45:23 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190614104457.24703-1-peter.maydell@linaro.org>
 <20190614104457.24703-3-peter.maydell@linaro.org>
 <ab0b9cf8-98d2-1901-a8f7-259d6426f833@linaro.org>
 <CAFEAcA8CkvThgBXrSJw=O4BWBBDi0yXcF1T8fgytB53AshExXQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fa026ac6-905d-a9d0-3759-81d0e7182348@linaro.org>
Date: Fri, 14 Jun 2019 14:45:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8CkvThgBXrSJw=O4BWBBDi0yXcF1T8fgytB53AshExXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Only implement doubles if
 the FPU supports them
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
X-TUID: EOyqx2NNpmq3

On 6/14/19 10:52 AM, Peter Maydell wrote:
> On Fri, 14 Jun 2019 at 18:21, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 6/14/19 3:44 AM, Peter Maydell wrote:
>>> @@ -173,6 +173,11 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
>>>          ((a->vm | a->vn | a->vd) & 0x10)) {
>>>          return false;
>>>      }
>>> +
>>> +    if (dp && !dc_isar_feature(aa32_fpdp, s)) {
>>> +        return false;
>>> +    }
>>
>> Would it be cleaner to define something like
>>
>> static bool vfp_dp_enabled(DisasContext *s, int regmask)
>> {
>>     if (!dc_isar_feature(aa32_fpdp, s)) {
>>         /* All double-precision disabled.  */
>>         return false;
>>     }
>>     if (!dc_isar_feature(aa32_fp_d32, s) && (regmask & 0x10)) {
>>         /* D16-D31 do not exist.  */
>>         return false;
>>     }
>>     return true;
>> }
>>
>> Then use
>>
>>     if (dp && !vfp_dp_enabled(s, a->vm | a->vn | a->vd))
>>
>> ?
> 
> It would be less code, but I don't think the "are we using
> a register than doesn't exist" and the "do we have dp support"
> checks are really related, and splitting the "OR the register
> numbers together" from the "test the top bit" makes that
> part look rather less clear I think.

Fair enough.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
