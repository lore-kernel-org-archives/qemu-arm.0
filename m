Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp71082wrq;
        Tue, 12 Jun 2018 18:28:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL9BeNBLmd/IZynvutA0mVN1cFJoEd35pH6kCTFVGDhKKh1AlBT26PNLBdUhYcR6P0QCGvQ
X-Received: by 2002:a37:7d1:: with SMTP id 200-v6mr2750783qkh.393.1528853280029;
        Tue, 12 Jun 2018 18:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528853280; cv=none;
        d=google.com; s=arc-20160816;
        b=Mip5XMf07/rA6yTGTaV4bGr8otpWdEH1XvraaZzbC1DbX4iYkS7lvlehZEo+Zecc75
         WOVqMJKiZdu73gHH68HBei493KTF8kXzVIChJtD4InRcJHE12yT3QcIn2eyfUcNLXyHP
         rWPWsntJVdl/8ca7AA1g/4n5UMSvvALBBGPNQtyQUzqFaBMmGNv4Ur78y16i3g8BHUlM
         A6oF2X0AXc+BKi6JFT8/kV8r8YOtJ8Q5vq1of0uCd/ahTG+896f3t0hZI122k7ukJnbf
         Px5ZqijRb0WQ/uDGk1kbTlwlxZJx7yOQ6rWr7RVvsrFSmaxIt5opOqVzBMBPG4Bnq7eZ
         yD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=/F449yIoklMIo931Svk6ahhW45yN8W3tClzmGqk3nC8=;
        b=R1K7546JYEUT6+M4YARWppemW8UCHAgJrfuyszGEk0kQXjy2FQLkCHfUFo1bhDtevF
         Gc8GLtzUXpRXAo3/4pCvvH9Xnz7rXSYDx6w1oqjuILxMGliHGfBoqQPQIYjw4UI3WH8j
         IkHIWhGRnvegqUsy4NtnLDg7+cY2yNPEu112cYpcuXX0uU2+q1bJf80jfagb0XJBA7oL
         JpU0IM81XJCJK7TYaA9J6mxVi3nEvHKjuRb0Iv3SkYD6bNCWU8pbP84m+dfFQoeYl115
         lwrWDCWFfcoBj/xVaEQUZK4mMkCFMRten4fp/IcKdJiq6i+x8pt/28rkfYNSGZfQRLTL
         fvTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=doQ7ZHdp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v30-v6si455013qtg.316.2018.06.12.18.27.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 18:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=doQ7ZHdp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59205 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSuZr-00060F-IS
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 21:27:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSuZg-0005zm-Et
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 21:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fSuZb-0005Lr-Kj
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 21:27:48 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:35378)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fSuZb-0005LW-FQ
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 21:27:43 -0400
Received: by mail-pg0-x241.google.com with SMTP id 15-v6so431162pge.2
	for <qemu-arm@nongnu.org>; Tue, 12 Jun 2018 18:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/F449yIoklMIo931Svk6ahhW45yN8W3tClzmGqk3nC8=;
	b=doQ7ZHdppoGHW/RxkecYIw+blPKJklJhgKl3pSpNLDc4OG5sLZq71On4jbeGKFg3kD
	T1xWFBo0ASPcnLRtmNKbCCcPnUd/k+1/QtlH/h+RVkSLaMDdMTqEsJcr5j68klwdfgwN
	o7ntzum8DK4gtlMMX2S1gwMrNbneA9dAFIJb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/F449yIoklMIo931Svk6ahhW45yN8W3tClzmGqk3nC8=;
	b=dFG215eI/QYrFJWFe2Lesz8fSJwPsIdtliGU/pAvKezKAMtHLpjOY/OG3Qcd0D+ez4
	WTdI9y2EDuMFEhr+6r2cPAfSRqX4gv61WY0pjpkINylCN/r4jMDAYbynMIDzx0po0mqu
	kgQ9yxPzSo6d7dsm4WuqiA8XQHIGH5hpuIWvQWmiiOYXwpEPEvA2K1VPITOJYSurKbPY
	rGc2PN3vpAiNESEeFQXg+LxLN/1XWzGpBxB19yf9JUYgR4T5D0lzcXPg23eQESoZ2MFV
	CIkn7KfXx5KtlJdlULc1QMHilFGks+kQ2FdBn8w6nXW1ORMV8zHxUJa/7RpsLYHfpyS5
	a5qA==
X-Gm-Message-State: APt69E1BduCPHfkjjoqa0H93WBLdOvoD7QLRrt/9keuNsxyoQsCwR0c5
	a/x21fupcOmYaxN2lPS+tvMws0MDx0E=
X-Received: by 2002:a62:fe19:: with SMTP id
	z25-v6mr2688552pfh.167.1528853262112; 
	Tue, 12 Jun 2018 18:27:42 -0700 (PDT)
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com.
	[173.198.77.219]) by smtp.gmail.com with ESMTPSA id
	r2-v6sm1860795pfa.49.2018.06.12.18.27.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 18:27:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-16-richard.henderson@linaro.org>
	<CAFEAcA-weWiOLsrucjWMUjAh3tgS02RgBChpZOiOgd3HZK+imw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fef082f7-e297-61d8-8850-6d33e93b976f@linaro.org>
Date: Tue, 12 Jun 2018 15:27:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-weWiOLsrucjWMUjAh3tgS02RgBChpZOiOgd3HZK+imw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [PATCH v3b 15/18] target/arm: Implement SVE Integer
 Compare - Scalars Group
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
X-TUID: pBW17n4uDO5n

On 06/05/2018 08:02 AM, Peter Maydell wrote:
>> +    if (count & 63) {
>> +        d->p[i] = ~(-1ull << (count & 63)) & esz_mask;
> 
> Is this d->p[i] = MAKE_64BIT_MASK(0, count & 63) & esz_mask; ?

Fixed.


>> +    tcg_gen_setcond_i64(cond, cmp, rn, rm);
>> +    tcg_gen_extrl_i64_i32(cpu_NF, cmp);
>> +    tcg_temp_free_i64(cmp);
>> +
>> +    /* VF = !NF & !CF.  */
>> +    tcg_gen_xori_i32(cpu_VF, cpu_NF, 1);
>> +    tcg_gen_andc_i32(cpu_VF, cpu_VF, cpu_CF);
>> +
>> +    /* Both NF and VF actually look at bit 31.  */
>> +    tcg_gen_neg_i32(cpu_NF, cpu_NF);
>> +    tcg_gen_neg_i32(cpu_VF, cpu_VF);
> 
> Microoptimization, but I think you can save an instruction here
> using
>        /* VF = !NF & !CF == !(NF || CF); we know NF and CF are
>         * both 0 or 1, so the result of the logical NOT has
>         * VF bit 31 set or clear as required.
>         */
>        tcg_gen_or_i32(cpu_VF, cpu_NF, cpu_CF);
>        tcg_gen_not_i32(cpu_VF, cpu_VF);

No, ~({0,1} | {0,1}) -> {-1,-2}.


>> +    /* For the helper, compress the different conditions into a computation
>> +     * of how many iterations for which the condition is true.
>> +     *
>> +     * This is slightly complicated by 0 <= UINT64_MAX, which is nominally
>> +     * 2**64 iterations, overflowing to 0.  Of course, predicate registers
>> +     * aren't that large, so any value >= predicate size is sufficient.
>> +     */
> 
> The comment says that 0 <= UINT64_MAX is a special case,
> but I don't understand how the code accounts for it ?
> 
>> +    tcg_gen_sub_i64(t0, op1, op0);
>> +
>> +    /* t0 = MIN(op1 - op0, vsz).  */
>> +    if (a->eq) {
>> +        /* Equality means one more iteration.  */
>> +        tcg_gen_movi_i64(t1, vsz - 1);
>> +        tcg_gen_movcond_i64(TCG_COND_LTU, t0, t0, t1, t0, t1);

By bounding the input, here, to the vector size.  This reduces the (2**64-1)+1
case, which we can't represent, to a vsz+1 case, which we can.  This produces
the same result for this instruction.

This does point out that I should be using the new tcg_gen_umin_i64 helper
instead of open-coding with movcond.


r~
