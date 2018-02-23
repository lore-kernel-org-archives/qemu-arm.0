Received: by 10.28.71.27 with SMTP id u27csp1065164wma;
        Fri, 23 Feb 2018 13:16:15 -0800 (PST)
X-Google-Smtp-Source: AH8x226fx+OBwsoJnbBPWMyBehmA8KOz2FtgJYhkCezk5i33htdYWb/S4l3S7kxzLbN25n1Am5N9
X-Received: by 10.129.102.66 with SMTP id a63mr2081287ywc.374.1519420575377;
        Fri, 23 Feb 2018 13:16:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519420575; cv=none;
        d=google.com; s=arc-20160816;
        b=o4xjZ/HNUrL2azk1XFXVYKvDyUNMXyZuBgLR2kuTE4aSEYqZjP/RTJ9FULKGrq1mCg
         IlzHNjMaOJApsMMrHgSmWGqXbnkEuiR5XnsCpHaxcLHZYO4tL9shqrlm04AD0D/WaxtH
         /iM/RBxWE6P2C72Pk7tMg/KDysdVYyO3crSHNgX6eh5qJyiUXq4v+HiV59pK/5iXCwF5
         TmiRzFkXxZNvlOpiYdwBEoMLIwgn7pXoj+3rcu4AhJ6c97ZL0Q2LSr1/V264DsIrmGNl
         fSG3GnNO5Tunc8yIxeidBoYc5ZkPN8ZuF9gK/z1Lf0DeJBQgLAEJsGnl81uQtIJ3yklX
         0vsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=UZ5rAodYkwsw1HYtqT1YUDZySdfPhw7YHcvvCQwlgV8=;
        b=x+WIU5MjLsQmMQiID+8nQbDYR3P7G1W4RDs4EpB+TmxDQ5gglQwnZRjrU3yFRjVaic
         rHhoBlF7y7jBFyGDs0mk1CfNU5bAwtRzt7uzpEvow1kYYFH+xu5WoEGRuqO7fbmztKm9
         5st9WiJQGqQRx+VSZQdcCCeYpwIuR9idb6utMiHZZhB8TNUdKZf6YPN/YJPygNMszp+W
         bRQkOcUmNi6vsd28gTLGdnh5jyBdRRDZELDisB6tW1VTPVaf2ClL+MgiXDxnGqcr9Co8
         Vl3CWG3ztgr4dHzFsQ572KNbjCFl9Bmwm4IfVdUmgbcq3hnZ7j2h338lhu2pVggD0ibC
         b5Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ONj6FmD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w7si424994ywf.235.2018.02.23.13.16.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 13:16:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ONj6FmD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epKhS-0007WD-Rk
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 16:16:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epKhM-0007Vt-3y
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 16:16:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epKhH-0004wA-Fd
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 16:16:08 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:35319)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epKhH-0004vP-9q
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 16:16:03 -0500
Received: by mail-pl0-x244.google.com with SMTP id bb3so5593645plb.2
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 13:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UZ5rAodYkwsw1HYtqT1YUDZySdfPhw7YHcvvCQwlgV8=;
	b=ONj6FmD0rplxFsafS8w+YDGtTG1pqYcq2XgJesBAC8L+aGMlS5g8QiYkFlJEskJxLV
	IgJm6LYipLzApiQM+dz7Eve/wSnyGlHZPZLbon3IPiqusTwf0R/iMdgEtcA7FzJD4BiN
	SFaOWhRLVMyhvgQK2H5e3HJ7nUw7FsqXqhl1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UZ5rAodYkwsw1HYtqT1YUDZySdfPhw7YHcvvCQwlgV8=;
	b=lMzIgc73lXqnQip+wsK9AtTtFitwU3yhR6HEZ6Srvwq9cqLr0fGohluPPX4Ba/k5l4
	EfheXkyoMMSBNEXTlSMz5MdwH5v6VPlEsPJqy97UDWtYSw3cye0ovQ8ppeK3rcUrimoV
	mtkr3vVm+fuaUWnpta7SRd+dqRmhcLWPRq4xw/UNBxuGHs/qm9RDx3SwYRAzTIa/6dVO
	SZrpvbdU8P6mlkYfFOTA9PdcI4rCsqg/q40Y9eQJ3Rhag/Vc1l8xtJUWiJkMlkoy7J9s
	NdAmCGYkc7VF/SBjjfWuhQMmKQnVhKYz42LnNzvTZfbOrXDjbbRvtNYHUmUrMr3xnGxk
	/PGw==
X-Gm-Message-State: APf1xPBfpuAuFSRL6Jqa/D8RVhJA/6vZZ7+ijvimaEFaBpVoqIv5diQR
	9sqpVyS6nl+VZMxE5xCBkqNbrWtOgTs=
X-Received: by 2002:a17:902:a607:: with SMTP id
	u7-v6mr2838654plq.367.1519420561889; 
	Fri, 23 Feb 2018 13:16:01 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	h75sm6694130pfh.28.2018.02.23.13.16.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 13:16:00 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-44-richard.henderson@linaro.org>
	<CAFEAcA_VMcqarGdf1nN9=yXn-ybsvHYMzYS6EF0UUDdECJ02_g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ca46b9e2-54ad-8547-e869-8c3c238cdaad@linaro.org>
Date: Fri, 23 Feb 2018 13:15:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_VMcqarGdf1nN9=yXn-ybsvHYMzYS6EF0UUDdECJ02_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 43/67] target/arm: Implement
 SVE Floating Point Arithmetic - Unpredicated Group
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
X-TUID: Cxx1ueE82n4M

On 02/23/2018 09:25 AM, Peter Maydell wrote:
> On 17 February 2018 at 18:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/helper-sve.h    | 14 +++++++
>>  target/arm/helper.h        | 19 ++++++++++
>>  target/arm/translate-sve.c | 41 ++++++++++++++++++++
>>  target/arm/vec_helper.c    | 94 ++++++++++++++++++++++++++++++++++++++++++++++
>>  target/arm/Makefile.objs   |  2 +-
>>  target/arm/sve.decode      | 10 +++++
>>  6 files changed, 179 insertions(+), 1 deletion(-)
>>  create mode 100644 target/arm/vec_helper.c
>>
> 
>> +/* Floating-point trigonometric starting value.
>> + * See the ARM ARM pseudocode function FPTrigSMul.
>> + */
>> +static float16 float16_ftsmul(float16 op1, uint16_t op2, float_status *stat)
>> +{
>> +    float16 result = float16_mul(op1, op1, stat);
>> +    if (!float16_is_any_nan(result)) {
>> +        result = float16_set_sign(result, op2 & 1);
>> +    }
>> +    return result;
>> +}
>> +
>> +static float32 float32_ftsmul(float32 op1, uint32_t op2, float_status *stat)
>> +{
>> +    float32 result = float32_mul(op1, op1, stat);
>> +    if (!float32_is_any_nan(result)) {
>> +        result = float32_set_sign(result, op2 & 1);
>> +    }
>> +    return result;
>> +}
>> +
>> +static float64 float64_ftsmul(float64 op1, uint64_t op2, float_status *stat)
>> +{
>> +    float64 result = float64_mul(op1, op1, stat);
>> +    if (!float64_is_any_nan(result)) {
>> +        result = float64_set_sign(result, op2 & 1);
>> +    }
>> +    return result;
>> +}
>> +
>> +#define DO_3OP(NAME, FUNC, TYPE) \
>> +void HELPER(NAME)(void *vd, void *vn, void *vm, void *stat, uint32_t desc) \
>> +{                                                                          \
>> +    intptr_t i, oprsz = simd_oprsz(desc);                                  \
>> +    TYPE *d = vd, *n = vn, *m = vm;                                        \
>> +    for (i = 0; i < oprsz / sizeof(TYPE); i++) {                           \
>> +        d[i] = FUNC(n[i], m[i], stat);                                     \
>> +    }                                                                      \
>> +}
>> +
>> +DO_3OP(gvec_fadd_h, float16_add, float16)
>> +DO_3OP(gvec_fadd_s, float32_add, float32)
>> +DO_3OP(gvec_fadd_d, float64_add, float64)
>> +
>> +DO_3OP(gvec_fsub_h, float16_sub, float16)
>> +DO_3OP(gvec_fsub_s, float32_sub, float32)
>> +DO_3OP(gvec_fsub_d, float64_sub, float64)
>> +
>> +DO_3OP(gvec_fmul_h, float16_mul, float16)
>> +DO_3OP(gvec_fmul_s, float32_mul, float32)
>> +DO_3OP(gvec_fmul_d, float64_mul, float64)
>> +
>> +DO_3OP(gvec_ftsmul_h, float16_ftsmul, float16)
>> +DO_3OP(gvec_ftsmul_s, float32_ftsmul, float32)
>> +DO_3OP(gvec_ftsmul_d, float64_ftsmul, float64)
>> +
>> +#ifdef TARGET_AARCH64
> 
> This seems a bit odd given SVE is AArch64-only anyway...

Ah right.

The thing to notice here is that the helpers have been placed such that the
helpers can be shared with AA32 and AA64 AdvSIMD.  One call to one of these
would replace the 2-8 calls that we currently generate for such an operation.

I thought it better to plan ahead for that cleanup as opposed to moving them later.

Here you see where AA64 differs from AA32 (and in particular where the scalar
operation is also conditionalized).


r~
