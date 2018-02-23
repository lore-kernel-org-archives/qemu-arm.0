Received: by 10.28.71.27 with SMTP id u27csp1046979wma;
        Fri, 23 Feb 2018 12:57:22 -0800 (PST)
X-Google-Smtp-Source: AG47ELtvdSECSbivRrvs0zVHwZhDnvwPNPE8h6UUBWA2fBDbUF+e3Y2+iyZrP6FVXpYTMenGqo9a
X-Received: by 2002:a25:5406:: with SMTP id i6-v6mr2152107ybb.92.1519419442609;
        Fri, 23 Feb 2018 12:57:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519419442; cv=none;
        d=google.com; s=arc-20160816;
        b=l6VDHVemcatEdVa+snYcsR8kRDACOmfVQ9YuKLzAKfLjv8tZ4iaaaG0mUXN5eUZQCa
         yj+1DDxgvj0QR8n7YVlravOx4hZ3ncQRXKcKi8vXB6Lw1U05Mv7UAbabc/kVqHDBc89q
         SXQAVu+6MYCi4LqCY5ia9dkIfvJ4ztVlidaUx3Sp2kzTFxof/jVg7GiUNOU+RAvPwa0Y
         FeY/tFLYGcxREbZCjTMI18rHm7ZfRGpdWTJp5UkcxFovKrfw6S7NiLNNytErwg8YpE1O
         nIJGkMGWaaWoCT4wVUTZQcbKRxAbdw85BiKpg2nGIk8DIA2PpeeRiYlZfVRAMnty9g1r
         mAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=PwkuQOOgakDsje1svKIj6n52iW7Up9kv7JZNqGCYfsk=;
        b=SgmIk0dqOfNbW//77KDxaiHTEm6c5xlvCYHYG1hsiu3/utZNLMhoy56Uli9ARs100I
         dBDsqbEC0AFk9WEHV16taO1WGJj1aaLEUwQWK1QBJArOnEoQssGD1+Wyq3W6Zk5wpzHD
         ak36kcJutQ3OQkGdzl71DYHjC8zx9JNKLE0jD9peirKqibq6ONEujVCSe2eNlvbVY9ea
         rNgj69wH+dei5aLyrEiNJ5VhtPyBdPdZoZM61SeTYqlWIbEU9DfCocRTs0T7mb7JlIPx
         Y3s+CEhS9aINMM3C6lsFoqG5TbMfwyOw51on6omrgjFHRvTP1MKkocES3zOncpZz04Xh
         YIeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=egD9ACKR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k188si551630ywc.497.2018.02.23.12.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 12:57:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=egD9ACKR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epKPC-0001sT-39
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 15:57:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epKP2-0001s9-PN
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:57:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epKP0-0006Nd-8M
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:57:12 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:33397)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epKP0-0006N9-2W
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:57:10 -0500
Received: by mail-pl0-x243.google.com with SMTP id c11-v6so2150209plo.0
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 12:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PwkuQOOgakDsje1svKIj6n52iW7Up9kv7JZNqGCYfsk=;
	b=egD9ACKRRlCoLCWfgXr0GZHZ7AwF7eqYJdZl9EFEN+eF67R6tMo+pV1wCQ3/ICCu4M
	z9HP5SEz4rN3kYC5QTZOaApEHz7+JLVrJSwkIqVg6FCcytXoWCri5+gG57tSTAMWqhao
	NDb6LAmZ/PicFySqbExlvT/nQaQLyFmi0lTxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PwkuQOOgakDsje1svKIj6n52iW7Up9kv7JZNqGCYfsk=;
	b=jEYIAea7yOCyL7HZXAFyxtRGbFcC6YXTWMEwmpYEv/UVLCYZqihIp6/ydiiPjph6ii
	N2X+P3QWI7S9bPGF2sHcYSwKojTjvRBqbfz3EwM88qfDdmmOu40bVwpy4jPCWaVxwfPW
	fpHTKV+KORG2gdIdYLB9yyxRYWMM+LpFYJw3m3Qv41dT2Op9rEfUnGO+ovP/d6qQnozk
	4MZ4qC45ToTdOn3ofoWBGzBsyTrGmEztyrsj5iUsezLT73V182XgsZ1Af2t0CJCDfRJz
	wnowFUj4Gwy66RvdGn0zlfT4Cdd2nMCjZnZ1r4ol7RuWwkkJNstnbLHaenzd4DhVMqOi
	ayDw==
X-Gm-Message-State: APf1xPCRFWxaxKu0WqprOxq78YznCy60QW/wXL4UcV7RcgHt4ptdiXDS
	C8fee2qfeNV5SiDOpdBA9vCZyD1zSBk=
X-Received: by 2002:a17:902:a50d:: with SMTP id
	s13-v6mr2879305plq.191.1519419428269; 
	Fri, 23 Feb 2018 12:57:08 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id j7sm5896433pfh.39.2018.02.23.12.57.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 12:57:07 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-37-richard.henderson@linaro.org>
	<CAFEAcA8mvCXMEBv+dLwVfQcdEeyaqSfK9EX1HzQOKfQi8+Tk2g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b1ac6b7-096f-0e20-2d35-18f095efc56f@linaro.org>
Date: Fri, 23 Feb 2018 12:57:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8mvCXMEBv+dLwVfQcdEeyaqSfK9EX1HzQOKfQi8+Tk2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 36/67] target/arm: Implement
 SVE Integer Compare - Vectors Group
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
X-TUID: B3w7grBVBECV

On 02/23/2018 08:29 AM, Peter Maydell wrote:
> On 17 February 2018 at 18:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
>> index 86cd792cdf..ae433861f8 100644
>> --- a/target/arm/sve_helper.c
>> +++ b/target/arm/sve_helper.c
>> @@ -46,14 +46,14 @@
>>   *
>>   * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
>>   * and bit 0 set if C is set.
>> - *
>> - * This is an iterative function, called for each Pd and Pg word
>> - * moving forward.
>>   */
>>
>>  /* For no G bits set, NZCV = C.  */
>>  #define PREDTEST_INIT  1
>>
>> +/* This is an iterative function, called for each Pd and Pg word
>> + * moving forward.
>> + */
> 
> Why move this comment?

Meant to fold this to the first.  But moving so that I can separately document...

>> +/* This is an iterative function, called for each Pd and Pg word
>> + * moving backward.
>> + */
>> +static uint32_t iter_predtest_bwd(uint64_t d, uint64_t g, uint32_t flags)

... this.

>> +    do {                                                                     \
>> +        uint64_t out = 0, pg;                                                \
>> +        do {                                                                 \
>> +            i -= sizeof(TYPE), out <<= sizeof(TYPE);                         \
>> +            TYPE nn = *(TYPE *)(vn + H(i));                                  \
>> +            TYPE mm = *(TYPE *)(vm + H(i));                                  \
>> +            out |= nn OP mm;                                                 \
>> +        } while (i & 63);                                                    \
>> +        pg = *(uint64_t *)(vg + (i >> 3)) & MASK;                            \
>> +        out &= pg;                                                           \
>> +        *(uint64_t *)(vd + (i >> 3)) = out;                                  \
>> +        flags = iter_predtest_bwd(out, pg, flags);                           \
>> +    } while (i > 0);                                                         \
>> +    return flags;                                                            \
>> +}
> 
> Why do we iterate backwards through the vector? As far as I can
> see the pseudocode iterates forwards, and I don't think it
> makes a difference to the result which way we go.

You're right, it does not make a difference to the result which way we iterate.

Of the several different ways I've written loops over predicates, this is my
favorite.  It has several points in its favor:

  1) Operate on full uint64_t predicate units instead
     of uint8_t or uint16_t sub-units.  This means

     1a) No big-endian adjustment required,
     1b) Fewer memory loads.

  2) No separate loop tail; it is shared with the main loop body.

  3) A sub-point specific to predicate output, but the main loop
     gets to run un-predicated.  Here the governing predicate is
     applied at the end: out &= pg.


r~
