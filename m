Received: by 10.28.71.27 with SMTP id u27csp390605wma;
        Thu, 25 Jan 2018 23:24:55 -0800 (PST)
X-Google-Smtp-Source: AH8x224e6oZOFbnR/eW1CmLK2fF/E+whM4e36GOCEprjAtaJyc5Homh75+172ur69t10SHAQQcpl
X-Received: by 10.37.175.203 with SMTP id d11mr10382908ybj.501.1516951495174;
        Thu, 25 Jan 2018 23:24:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516951495; cv=none;
        d=google.com; s=arc-20160816;
        b=OYiPDjiPQOGsx5Cv0rTa0lzLTGS9/lYuyRSEWgcoi2aV7FSv9lHaiIA4zdWbcystai
         BE/UZcu8dnVWDnIo0/twy53fMv/gSBWbI8EbMa7FZpsO1d+Bv1pS9il6AroMLvLIfSCv
         9TC+QJTSCZ+zOJQaC3LmnkpetG7NnauxhepGVpbRmLWpOIw8ozf7oycGglWqHxuossQ9
         hTabP9vldXmCAj0LW+4PLyhwrwPPTOVB5OvvRbVJqrsIYb8l4i4rXOYQQxKgES96elVD
         yQ/afvs/uKC7lj1f2OeqPChzPTWpTfYonY7wFyRAkAB0OJFsPu+7A+rPP+NqPnQnzFdD
         UKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=bIHyeom5xYxxlfwHZu9eoxFxdEdjglAOst4scIhv+bI=;
        b=vJnSUi2wmcABXD0ijjruEd5gxtKewHTjqsUPn+aiNSIwzvMoVrSs+gtZ602oVmFpSZ
         fBPPSw+wlZO+6NwNk1rzg4MELNr295FAv5BqAJkaBJwmUtXNiI7CtgAwur4QvcnaNRG3
         2H0WJoCzQkpsFQ7d9hl82/5ddpxq9F4oimg2hg4p5VPGDBpo/otj/8acv1u2UhTVNhYK
         XcDGiKIWMtBwzkRJYGVGbaeTV/EvmzYFbUcWRuUdHnCr3qm4qMwOVC9udoB719x+Ym77
         aQjUi8Q0a9+UTP//6fvnwGKI45H31m6f3fErE7CG3AniV+ctrZMVBqcAmbHC8ijvgw1K
         N6vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aYIyZHnG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n186si777076ywf.531.2018.01.25.23.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Jan 2018 23:24:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aYIyZHnG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeyNa-0005ub-MH
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 02:24:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eeyMZ-0004zm-Um
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 02:23:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eeyMW-0008JD-QO
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 02:23:51 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:33816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eeyMW-0008IY-LL
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 02:23:48 -0500
Received: by mail-pf0-x244.google.com with SMTP id e76so7732845pfk.1
	for <qemu-devel@nongnu.org>; Thu, 25 Jan 2018 23:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=bIHyeom5xYxxlfwHZu9eoxFxdEdjglAOst4scIhv+bI=;
	b=aYIyZHnGxXkLuVsobe5oS4zqZRuUKGogRg7uhqAlmSJspWRixgfWAr6mJ0OBcM4vLw
	dI9j3AFr1IHNpVbi7n5unoLKuSjZv4mwP50zmGw1cnXjf9IzP9LpPUKNss5B/2ZVzp+w
	1G4QbD3sR2gtEqoI29lRXd/MmmHKhu1ji8cwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bIHyeom5xYxxlfwHZu9eoxFxdEdjglAOst4scIhv+bI=;
	b=eIGxr+9+3jfesMymPaJ2diC7FCIjBy7sV22XuHosVeZLfL1AhKkWFbuJJEpXpN+Jm3
	E56UpnUnq9+77jw/ZSu0sm+OkTSc/VCenXCGKj2Yt5N9M2nJdCaIRHDF1CZKodRQ2gCL
	vm/NRFG0Wbq/2g1gKi9+WZfYrCaiXbHxSaoaSLWbrb55DwpwEeDepeFMVMykptNKXPH4
	VvOr9QxYs55aYqTVZJc7n01zbeC5GbiHJfhV6JPkcHXULjueiV6X9+THZuxOabCIdLQX
	PgAJNSTH+mY0ZOvwbwEsnXjRV+Z6kgLoPUBD1KsB9rzopBQKSIEpaelbsSf471E2fzOq
	XqYw==
X-Gm-Message-State: AKwxytd36v241mrSTz06h4VkN60Cfpw5vzjiA9kDch7VV1q85NrT3Eso
	uLPJtRfov07nFHoCgmey4yrgXw==
X-Received: by 10.101.85.195 with SMTP id k3mr15076827pgs.191.1516951109438;
	Thu, 25 Jan 2018 23:18:29 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	t1sm20582904pfj.21.2018.01.25.23.18.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jan 2018 23:18:28 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-7-richard.henderson@linaro.org>
	<CAFEAcA9XeA6Osy90-NH6rzPH5o7DdPvAwz9iHWxVOORy9KRU0w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80dfd9f6-e104-918e-9a31-bd22e9990f4f@linaro.org>
Date: Thu, 25 Jan 2018 23:18:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9XeA6Osy90-NH6rzPH5o7DdPvAwz9iHWxVOORy9KRU0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-devel] [PATCH v2 06/11] target/arm: Decode aa32 armv8.1
 two reg and a scalar
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OXg4Ztb/lR5Q

On 01/15/2018 09:47 AM, Peter Maydell wrote:
> On 18 December 2017 at 17:24, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate.c | 38 +++++++++++++++++++++++++++++++++++---
>>  1 file changed, 35 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index a9587ae242..1a0b0eaced 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -6973,11 +6973,43 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>>                          }
>>                          neon_store_reg64(cpu_V0, rd + pass);
>>                      }
>> +                    break;
>> +                case 14: /* VQRDMLAH scalar */
>> +                case 15: /* VQRDMLSH scalar */
>> +                    if (!arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
>> +                        return 1;
>> +                    }
>> +                    if (u && ((rd | rn) & 1)) {
>> +                        return 1;
>> +                    }
> 
> The pseudocode also has UNDEF if Q==1 && Vm<0> == 1 ....

Not for the indexed version, encoding A2.

> 
>> +                    tmp2 = neon_get_scalar(size, rm);
>> +                    for (pass = 0; pass < (u ? 4 : 2); pass++) {
>> +                        void (*fn)(TCGv_i32, TCGv_env, TCGv_i32,
>> +                                   TCGv_i32, TCGv_i32);
> 
> Can we define a typedef for this, please ?

What would you name it?


r~
