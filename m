Received: by 10.28.71.27 with SMTP id u27csp993749wma;
        Fri, 23 Feb 2018 11:59:38 -0800 (PST)
X-Google-Smtp-Source: AG47ELsp13po3AxyBOYqsaPX1msXji5w6jOw32cf04lOAY2M2w3H6LNVSSEZzk2Cy7wcgYfxRKdi
X-Received: by 2002:a25:1f84:: with SMTP id f126-v6mr2054251ybf.498.1519415977931;
        Fri, 23 Feb 2018 11:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519415977; cv=none;
        d=google.com; s=arc-20160816;
        b=yXtG1M6WXhon0WgWNUXIW5ShysyULnn4xbcZqaJWJdN9gmso6+RfgtcJDPTdBQqnIz
         +4V1mhFBasG9QADxvqivmy8EyUlAGaf3F4H8CuNeekNd7Sjkyst5oP5sdfGpWfA8Gcpa
         0DtX1uWDlAiPrB6XGAU6LRIaaXVNrjSqZK+hraQzsSI9PDC1lpMqMJ09B3IP6Hj7y6Wj
         RxYGfcU7drVi+mZZoBTXGM1tjbel2XKiZyxjaODKUIwEbOdgdpEOBp/mz3g+aj4bwm9I
         bWruIyif80G4AAki2XdrCvWg3limp8o6ubFAehtZGbB5yXGDrb+NgpTmMwQQYEsMpp6I
         WwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=104R9EvGQjF5y15Uw10dZstsXP5Z8q80W2g7YMdyYl0=;
        b=pPZZUPaEnkHFyYhJG3szfRX76V+UXkj2mScrhcgL4qK4p7Q5RiPsJXYCbe2gFYkT4Z
         x8XYirt2lRRQD5GueG6eNq8IkSOI5cRCyce7fMoq2H/FfSHvUG3bknmzZTYT/H/Hh0fB
         UbLOISCQOyHW9elWvP+C54Fs+JhS4NQcVNWHe+RHNAk7dBd4HHcQ8+G/1CSfn7qI/nro
         9qWupMDUUuwTsBrduqOzhtr1ZheiiNUMGXABpEEGD8YVZi54hze6m/jGuhTCG4zkceMD
         uZapPYY8kAQNmzqyQ4ayKWa7ZWcEBApJfHeBgbwznffa0jC+4Xf1pHUS10sKfLVOoT5f
         XQXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iFNrcTKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q81si529751ywc.354.2018.02.23.11.59.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 11:59:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iFNrcTKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epJVJ-0004LM-Cy
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 14:59:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epJV5-0004Ii-LC
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 14:59:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epJV0-0006ou-NS
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 14:59:23 -0500
Received: from mail-pg0-x233.google.com ([2607:f8b0:400e:c05::233]:35302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epJV0-0006mh-IN
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 14:59:18 -0500
Received: by mail-pg0-x233.google.com with SMTP id l131so3752667pga.2
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 11:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=104R9EvGQjF5y15Uw10dZstsXP5Z8q80W2g7YMdyYl0=;
	b=iFNrcTKrIbboofwPHYT5oFpDrMQSylB4QjJdxD8ymYmao+zT1lZvY4y8VfbA/fra0G
	JnXHobMnTGU0Z0G6eXK23f9M4knrV9cEZ4m1BnVVwEytrmzXQ8ggJdg+4CipNZAJqmth
	Vd5Esg9ad8K8R2GSSk3zsaV56IvHrBxCHtcz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=104R9EvGQjF5y15Uw10dZstsXP5Z8q80W2g7YMdyYl0=;
	b=WMKsJ3gNcOqNap9FYk1WsGlayEYjfhn/ShqGk6iVf9RCtlJ0nzRBKyzvoAEpvpzSjo
	qxrHcs0d4J9kuvmN25l93ao29DeswDGAQ00WmR+GN7CE1Tid/Z5bxqhZY3+uPsbxD6Ob
	edmefPfs4ihVGS00jX+F3I9QJ0paztRnE8MT6JRanwoFGkphwUcuR4MZmG4pAz2ZtkDZ
	52sRFoI1s1lqECRHQ3+DvTnICCXYQ2qhicz0a3DoTe0NxYk/lBW+ILJMO7xxDLmkWdUk
	JmRf54dakiLJ/AkBjb1PG0/h5nfV9BGcIbY6zkHfmFOA1bBxeJWAYrlPSfKPxHmOoWIc
	IIwg==
X-Gm-Message-State: APf1xPDgRAeHstE34QmI6LOEbEk5g87SjZl2uCZbtMlmTDj5hCl4H/D9
	vz/LWJrl/gg0WnELmkdeLcMg/OVmIoY=
X-Received: by 10.98.101.195 with SMTP id z186mr2807067pfb.47.1519415956938;
	Fri, 23 Feb 2018 11:59:16 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	s26sm5754503pfm.93.2018.02.23.11.59.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 11:59:15 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-29-richard.henderson@linaro.org>
	<CAFEAcA8BnNkgHNQd2xK8BrYzhtG4_fee3rWTKXqVxRNEf5FJNA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b67bcb61-6f0a-b565-2e56-2ab7c26d7b10@linaro.org>
Date: Fri, 23 Feb 2018 11:59:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8BnNkgHNQd2xK8BrYzhtG4_fee3rWTKXqVxRNEf5FJNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 28/67] target/arm: Implement
 SVE Permute - Predicates Group
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
X-TUID: 1ZIwvyGxeQes

On 02/23/2018 07:15 AM, Peter Maydell wrote:
>> +static const uint64_t expand_bit_data[5][2] = {
>> +    { 0x1111111111111111ull, 0x2222222222222222ull },
>> +    { 0x0303030303030303ull, 0x0c0c0c0c0c0c0c0cull },
>> +    { 0x000f000f000f000full, 0x00f000f000f000f0ull },
>> +    { 0x000000ff000000ffull, 0x0000ff000000ff00ull },
>> +    { 0x000000000000ffffull, 0x00000000ffff0000ull }
>> +};
>> +
>> +/* Expand units of 2**N bits to units of 2**(N+1) bits,
>> +   with the higher bits zero.  */
> 
> In bitops.h we call this operation "half shuffle" (where
> it is specifically working on units of 1 bit size), and
> the inverse "half unshuffle". Worth mentioning that (or
> using similar terminology) ?

I hadn't noticed this helper.  I'll at least mention.

FWIW, the half_un/shuffle operation is what you get with N=0, which corresponds
to a byte predicate interleave.  We need the intermediate steps for half,
single, and double predicate interleaves.

>> +static uint64_t expand_bits(uint64_t x, int n)
>> +{
>> +    int i, sh;
> 
> Worth asserting that n is within the range we expect it to be ?
> (what range is that? 0 to 4?)

N goes from 0-3; I goes from 0-4.  N will have been controlled by decode, so
I'm not sure it's worth an assert.  Even if I did add one, I wouldn't want it
here, at the center of a loop kernel.

>> +        d[0] = nn + (mm << (1 << esz));
> 
> Is this actually doing an addition, or is it just an odd
> way of writing a bitwise OR when neither of the two
> inputs have 1 in the same bit position?

It could be an OR.  Here I'm hoping that the compiler will use a shift-add
instruction.  Which it wouldn't necessarily be able to prove by itself if I did
write it with an OR.

>> +        d[0] = extract64(l + (h << (4 * oprsz)), 0, 8 * oprsz);
> 
> This looks like it's using addition for logical OR again ?

Yes.  Although this time I admit it'll never produce an LEA.

>> +        /* For VL which is not a power of 2, the results from M do not
>> +           align nicely with the uint64_t for D.  Put the aligned results
>> +           from M into TMP_M and then copy it into place afterward.  */
> 
> How much risu testing did you do of funny vector lengths ?

As much as I can with the unlicensed Foundation Platform: all lengths from 1-4.

Which, unfortunately does leave a few multi-word predicate paths untested, but
many of the routines loop identically within this length and beyond.


>> +static const uint64_t even_bit_esz_masks[4] = {
>> +    0x5555555555555555ull,
>> +    0x3333333333333333ull,
>> +    0x0f0f0f0f0f0f0f0full,
>> +    0x00ff00ff00ff00ffull
>> +};
> 
> Comment describing the purpose of these numbers would be useful.

Ack.


r~
