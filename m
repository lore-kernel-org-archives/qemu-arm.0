Received: by 10.28.71.27 with SMTP id u27csp1010611wma;
        Fri, 23 Feb 2018 12:15:26 -0800 (PST)
X-Google-Smtp-Source: AH8x225BMbBmTynU6EYuw4ML15CjZCnLUZtZ6ttQhtepre7shWliCbO24mQK238ThvVDoWpYPSIz
X-Received: by 10.13.219.22 with SMTP id d22mr1985654ywe.315.1519416926696;
        Fri, 23 Feb 2018 12:15:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519416926; cv=none;
        d=google.com; s=arc-20160816;
        b=bXB8a2KSfmkzsZST7H6PZHYnO7+oCs7a8hAKCa1qtd+PrPRm6s3UcRZsdm44O0tJm3
         8Hz8U5jV33QHYdIkT07YSehBGPCqay+pjpEPONJWcM5yf8LAhWqOeEmnBTX7K45kl27p
         JBZmm/P8tJtUu1LgTrunLr/O/xcZvcASI5cxMJ6AeyC78w5Wryevp7iULp5AwQ/jWLrY
         cDR1c/i2fxsiZIaXrCF+zAHMjetNoFGmHLXXUWm/mQEQ5q3qrK7WjcMTLPWJGOLCufOR
         4OEkbA9Qt1VfmI05dGCh4p7E8dU19oPs73wbykcq3QOCxKd6uHW6vYM9IZkagEgqWqrd
         uE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=wcxEQGByajxzcWMmtzRmi/ua2V2aC8LsZ7GakwVJmbU=;
        b=qmokicTvuqfRY0pGuSbgfB/Nj4CmQgKsmkvwWWPnlj8yBngdNuoMLxti29xxVAzPUp
         IRdB+PO16VUcmZmks6GtxkC/p2fL5DsC+P46usuRB1nmSh0xw0wJcdi1fzz4EQitrpQe
         FKf3Jp28+2dYlTeSjMWM40xdMwl37zbcvRimkSgvDW3Fqvg6JxXQSrDG3VHddzhjFNsP
         CI9zuSCKidQsJ9e89ZrgrCXEKRIyLBzFy5MJoyelwgZbST7fgRl1n3ZaN8hUorZ6TXYe
         8c0GpMBtTpMjWSzLDHZkz1ZAwiGc7Fffc5FvLg2y3zFYxyGRJbI+XQkCNTz1OwBtOXea
         s3ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MGiXZbMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r7-v6si541765ybg.449.2018.02.23.12.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 12:15:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MGiXZbMq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epJkc-0000hg-3c
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 15:15:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epJkS-0000eO-7V
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:15:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epJkO-0003DP-Cj
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:15:16 -0500
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:37960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epJkO-0003D3-6D
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 15:15:12 -0500
Received: by mail-pf0-x236.google.com with SMTP id d26so3957325pfn.5
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 12:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wcxEQGByajxzcWMmtzRmi/ua2V2aC8LsZ7GakwVJmbU=;
	b=MGiXZbMqrdBMSHzITlhxNPHUPGcOvoNElrgfuN7n5DrSkJ68Z8MqBAklCYkFQbGqtt
	nT0ItJhxsx42Tzp3EtyBScNLCTL7TrJ/dTGYJEPKUizx/NNHpNHtlC61sePE2hHdu2bJ
	WvDHZndZmErfJLCkvJ5EuEFHwgys46vPd6YvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wcxEQGByajxzcWMmtzRmi/ua2V2aC8LsZ7GakwVJmbU=;
	b=EGaC6cvKh1QsaBROXN/8QeovQ0ShKQIG32Y/QB83YkIuSAgx1Ui3W+VCBPCMA66Mmk
	50kqWGX+8C8YkwrELhRcpWirtyiH34q2yntdcyobTGTpFAYi96HqoVlRY6X/+GbmnpC+
	pBQ5xdgjCG/6nipSqtciAfF/G0iCogTOFGD4DVfwNar3Oh3c8VRbaJIMi/SyU1VNxYRz
	cnW4tWNHxlhuY1+zsoxNHt0cvSN4XqTfZ6vNNwbtvLa9cHtDYyEriysfDfXVo8tVMBhp
	pE6G0PuoHJ3h36tipVQGr9Aq0bdf2Poj8Qti7JvC5aUcebw50QlCoPCmOPCD6F32Z/p5
	SsHA==
X-Gm-Message-State: APf1xPC+fpkzfB/E7oeuRNcVEMizy6OI46f11NfyT+swoC+FmZGW35aJ
	A0mqR6L/gG94mLmkD5YVXMtwSapOydU=
X-Received: by 10.98.64.73 with SMTP id n70mr2913761pfa.142.1519416910645;
	Fri, 23 Feb 2018 12:15:10 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	a22sm6046045pff.119.2018.02.23.12.15.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 12:15:09 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-32-richard.henderson@linaro.org>
	<CAFEAcA9kSgYNVQ6L6b94Gnz2ZnD4RKfeBqJintfgVqW47zq-qA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f3c76f2-fef8-2d23-a334-0e10bd01edf5@linaro.org>
Date: Fri, 23 Feb 2018 12:15:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9kSgYNVQ6L6b94Gnz2ZnD4RKfeBqJintfgVqW47zq-qA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::236
Subject: Re: [Qemu-arm] [PATCH v2 31/67] target/arm: Implement SVE
 conditionally broadcast/extract element
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
X-TUID: 0Mx7YKJIi3Hd

On 02/23/2018 07:44 AM, Peter Maydell wrote:
>> +/* Similar to the ARM LastActiveElement pseudocode function, except the
>> +   result is multiplied by the element size.  This includes the not found
>> +   indication; e.g. not found for esz=3 is -8.  */
>> +int32_t HELPER(sve_last_active_element)(void *vg, uint32_t pred_desc)
>> +{
>> +    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
>> +    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
> 
> pred_desc is obviously an encoding of some stuff, so the comment would
> be a good place to mention what it is.

Yeah, and I've also just noticed I'm not totally consistent about it.
I probably want to re-think how some of this is done.


>> +/* Compute CLAST for a scalar.  */
>> +static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
>> +                            bool before, TCGv_i64 reg_val)
>> +{
>> +    TCGv_i32 last = tcg_temp_new_i32();
>> +    TCGv_i64 ele, cmp, zero;
>> +
>> +    find_last_active(s, last, esz, pg);
>> +
>> +    /* Extend the original value of last prior to incrementing.  */
>> +    cmp = tcg_temp_new_i64();
>> +    tcg_gen_ext_i32_i64(cmp, last);
>> +
>> +    if (!before) {
>> +        incr_last_active(s, last, esz);
>> +    }
>> +
>> +    /* The conceit here is that while last < 0 indicates not found, after
>> +       adjusting for cpu_env->vfp.zregs[rm], it is still a valid address
>> +       from which we can load garbage.  We then discard the garbage with
>> +       a conditional move.  */
> 
> That's a bit ugly. Can we at least do a compile time assert that the
> worst case (which I guess is offset of zregs[0] minus largest-element-size)
> is still positive ? That way if for some reason we reshuffle fields
> in CPUARMState we'll notice if it's going to fall off the beginning
> of the struct.

I suppose so.  Though as commented above find_last_active, the minimal value is
-8.  I feel fairly confident that zregs[0] will never be shuffled to the
absolute start of the structure.


r~
