Received: by 10.28.4.212 with SMTP id 203csp2145216wme;
        Thu, 3 May 2018 10:14:11 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZozw4HsnqruDFFsV3RYqmNRZTGBGS5OoHJc0sg9LOdKfuZiFYuhygh8SYWw1WlsMRS2IHtO
X-Received: by 10.55.115.69 with SMTP id o66mr19446519qkc.22.1525367651284;
        Thu, 03 May 2018 10:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525367651; cv=none;
        d=google.com; s=arc-20160816;
        b=uNZPFNwvNvv6j7voV9IuIAZTvl+02jHaezjgThqgZDvJdW/Ha7SZMzOU89DNvZYHm9
         ohwqJj/WUtZRtGTukAPqWk22hRben4n8fzEvrSVkPE7QU6KWa4vDmn2J49B4G4QE664T
         XDJ86/DnOGrxhPpg4U0h2cD99sVXE+brDz7JDvSLPFa3tBrC2nfQGS1CBSmbI2opQJSe
         tdmp5f3cmgaL1YPgh3i8V2aIDwFIfHlelGmB+QHyoO4uux0p8/5xzVhOBCgB717xPmt+
         rV/h95x5pM+wldnTkbdrsBjaOvhttsA1uVwkoDaPesvSr/snS9rFXmFjehTzymE9l3Zn
         PR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=6h5kQFDexo7XQmOcXBOK1MBFCRRHPmoaqx2LS+cdjl8=;
        b=dqgx/5+KcPo8A1n1ZQn/QeBE1zJhKkrjgF9X7Rml/rBBsVcGSuWQpJ9E+90Oa5nAgV
         Qe1t6vOwb1xdkVXxlfGMa+bJFVwImFmjPgjKX0zWMOwS7KwXQIpnEmeoscLUMRzlTBkI
         M+klnUJ+cj2fX4qrLDwtZp3N2+Vul/h2XG4r58l602ZgFgFE13j9RHg1Qzr3zOS8bIX9
         AeojK8FclTliB+67rJyU2rkTHWl/8T+mdt+ag+HpFw0OA5JoVYHmyLWaJaltcX2nkfVD
         h/SDLr3aJ+Tjh2PDOQvagkUZ2zsm99Ft3xuqFgzDIl+DpV2UglfyXgngLGnhzeV3VcMt
         xBlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Er3FhqDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1-v6si5210217qvd.146.2018.05.03.10.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 10:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Er3FhqDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEHo2-0001YW-Rf
	for alex.bennee@linaro.org; Thu, 03 May 2018 13:14:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEHnw-0001YM-8G
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:14:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEHnt-0002ra-5M
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:14:04 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:38134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEHns-0002rF-Vo
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:14:01 -0400
Received: by mail-pf0-x242.google.com with SMTP id o76so15232949pfi.5
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6h5kQFDexo7XQmOcXBOK1MBFCRRHPmoaqx2LS+cdjl8=;
	b=Er3FhqDlKVTGEwKZmkZfi49M1Y739iFnzByr6YgvLc/wbnIhgdEYn7BijIsDiGZYBQ
	LIqfFs0HR8Ocv/cYHHwwXckf3cs/509QNXV+kihu/agKxAwB1662V7VokQ08Zffy5I6u
	kXpEKkDri9eQwmarw+1+6Jyfj7CyiqC0x7zeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6h5kQFDexo7XQmOcXBOK1MBFCRRHPmoaqx2LS+cdjl8=;
	b=VH0tg5rWGUrZlXvAPkhtyGD9S66Ur199sF8+g5j3ih4BLVaHkSTzQvva/vupV8yMAp
	N5Wx133I1ByY5TtzIJwQ2yVftCe2EF7WPCCbkUOoJbmgk581iLLF/qjnYNSnXnVvruvq
	/1+exkYuh1vbFlGH4dS7cdd+C2zM47i9QCsKuX0vyND/g9rYcZsav3XS8t8uBo3p300e
	Tjy7y05BQYGlYf6c24tOHqHNmkQXSmxwPfnGhmQpYF5ldoU4fwA3LcZdmO201+jdwD+A
	wypY0TP6dLNW3tDiW56NmdH1m9fcjuctOSHkWFrYxSkMRMBLo89YbdnRsjb3WZwgyEnY
	+dAQ==
X-Gm-Message-State: ALQs6tA4QbsQhcQ7FGYUygsDJ+WGfTHC63YMfA0rmDi1zIlUs+jZYUqk
	KLumd4bBxEurtLmciYfDO5Ei+y1W7gc=
X-Received: by 10.98.91.2 with SMTP id p2mr15697071pfb.96.1525367639514;
	Thu, 03 May 2018 10:13:59 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	x17sm25770869pfm.161.2018.05.03.10.13.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 May 2018 10:13:58 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-5-richard.henderson@linaro.org>
	<CAFEAcA-wq3kasUe8pkdUJXNJYNnLABrPgeQE4fokSLL995SFkg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1ad8ffc6-5549-99bf-940f-6734c579e354@linaro.org>
Date: Thu, 3 May 2018 10:13:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-wq3kasUe8pkdUJXNJYNnLABrPgeQE4fokSLL995SFkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-arm] [PATCH 4/9] tcg: Introduce atomic helpers for
 integer min/max
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ytzjnQgx/NfW

On 05/03/2018 06:26 AM, Peter Maydell wrote:
> On 27 April 2018 at 01:26, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Given that this atomic operation will be used by both risc-v
>> and aarch64, let's not duplicate code across the two targets.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  accel/tcg/atomic_template.h | 71 +++++++++++++++++++++++++++++++++++++++++++++
>>  accel/tcg/tcg-runtime.h     |  8 +++++
>>  tcg/tcg-op.h                | 34 ++++++++++++++++++++++
>>  tcg/tcg.h                   |  8 +++++
>>  tcg/tcg-op.c                |  8 +++++
>>  5 files changed, 129 insertions(+)
> 
>> @@ -233,6 +270,39 @@ ABI_TYPE ATOMIC_NAME(add_fetch)(CPUArchState *env, target_ulong addr,
>>          ldo = ldn;
>>      }
>>  }
>> +
>> +/* These helpers are, as a whole, full barriers.  Within the helper,
>> + * the leading barrier is explicit and the trailing barrier is within
>> + * cmpxchg primitive.
>> + */
>> +#define GEN_ATOMIC_HELPER_FN(X, FN, XDATA_TYPE, RET)                \
>> +ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
>> +                        ABI_TYPE xval EXTRA_ARGS)                   \
>> +{                                                                   \
>> +    ATOMIC_MMU_DECLS;                                               \
>> +    XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                          \
>> +    XDATA_TYPE ldo, ldn, old, new, val = xval;                      \
>> +    smp_mb();                                                       \
>> +    ldn = atomic_read__nocheck(haddr);                              \
> 
> I see you're using the __nocheck function here. How does this
> work for the 32-bit host case where you don't necessarily have
> a 64-bit atomic primitive?

It won't be compiled for the 32-bit host.  Translation will not attempt to use
this helper and will instead call exit_atomic.

> 
>> +    do {                                                            \
>> +        ldo = ldn; old = BSWAP(ldo); new = FN(old, val);            \
>> +        ldn = atomic_cmpxchg__nocheck(haddr, ldo, BSWAP(new));      \
>> +    } while (ldo != ldn);                                           \
>> +    ATOMIC_MMU_CLEANUP;                                             \
>> +    return RET;                                                     \
>> +}
> 
> I was going to suggest that you could also now use this to
> iimplement the currently-hand-coded fetch_add and add_fetch
> for the reverse-host-endian case, but those don't have a leading
> smp_mb() and this does. Do you know why those are different?

That would seem to be a bug...


r~

