Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1075859wrp;
        Thu, 14 Feb 2019 06:59:25 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbC3PuKBzebDsME/gbkhfNK/XJYVnnmqt6Nk0ZusLAK0YKt3Hd0C9YIWFQIG71gBrTLM+6p
X-Received: by 2002:a81:4e0e:: with SMTP id c14mr3495198ywb.503.1550156365566;
        Thu, 14 Feb 2019 06:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550156365; cv=none;
        d=google.com; s=arc-20160816;
        b=0YkoVFFlkYa7walOCKdBKgIT1KJqkMQRciC8j1PA4vqq8VZNQOhJcT78Zh18bA/tMB
         2M5GbwJAaT3g07pRl8SzhARprLLlap3U42Abh5FFLxVyMZNfUvEaEoFmO1XZe4GF5nRu
         DnoW1f59sQKjktS2gQfAe0auuSTPA3rBJvHcei03l7vE/ROzJ4dGbMWEnHlk52c291+S
         ezrovyRX02Q5wMDxV711wb0sLTX5mvSLYe1ZXu+l5zUcdLF/B5L/Yw+Dj0ARdZKOGWhV
         tG40n9kiMqqlzxorpcLDLOgUdmIIEZ1mxfX/rkayZm+TKnWS63wlv3AnP0pAbJrDnwrN
         yl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=divhy0n6pLMY9os92Bfo4KYNUBTMSuJDLbmIOSsAy8k=;
        b=xa6pny+X5+6bhx926WsdrsLhNaJneS4GvKbOgC+aGkxaN1ZfdGp9e2KhgJkb57RE50
         spU4RA6SxAd0o48lLrWdtbqXZ4TIewAavhBWervg38qRFwAjUqXIJp9mPFR6SnnMfgfb
         OuAqebGWlWEAc1d6EQBn8nNUnNOXl1gkCIPfuc0xxB0Wz1TZQsv3alUFjQ10kSvocTpx
         TASRg757V+xD7GfdYAw+0oRIRZJAZb9sq54o5IkdinG6mk5aQK6JuVdtGAoymGQ8m3ox
         SvSZ0p+Zwc/nSrhWLagI0QlYPyriL7htr4TTah5ymhAFJCCcteiU3LGSwT7PmDAIqsNb
         vQ8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iYYO6Ua1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n185si1513289ywe.430.2019.02.14.06.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 06:59:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iYYO6Ua1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49811 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guIU1-0007rG-0D
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 09:59:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1guIRc-0006Th-Hj
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 09:56:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1guIRL-0006TX-2K
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 09:56:46 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40462)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1guIRC-0006Hm-Fj
	for qemu-devel@nongnu.org; Thu, 14 Feb 2019 09:56:32 -0500
Received: by mail-pf1-x444.google.com with SMTP id h1so3217106pfo.7
	for <qemu-devel@nongnu.org>; Thu, 14 Feb 2019 06:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=divhy0n6pLMY9os92Bfo4KYNUBTMSuJDLbmIOSsAy8k=;
	b=iYYO6Ua1XfXoV6Ocn8vLnwHdL/TT1FuRI7L/avBenhP3bJP99fNH9KGMZeo90eK6K8
	nK7VxEeVL1ECNoEjjnr3KfAUUPgBNi5wvawSHxmW2Kl/HvswwHuuw4PDEJwnO4QWw9xk
	aczI/8t3kiGWuPutLND/4uO83CwkbywXUneqWEsjV0z6VRJkW5RoRaG36E9fnFz7UliA
	/oUMAi7+NBQP1csq+Ed2CuCXgMrbJpimT2aiHgvAWkXyYTNOIqlxRC2NJVUy5UG6rCm5
	O+ZUzNbCyoOYU1OegjNSO85bCKv6I35TeUPhZmHEr6d6lmaO1Jo1YtcDdwZurmpsSiAf
	XyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=divhy0n6pLMY9os92Bfo4KYNUBTMSuJDLbmIOSsAy8k=;
	b=RgpkA7pn+gdomCqbXidNotHqZejPjqLdx8sU+YeOkblwXaUpQ9TC3FWsawwe/LQ7yS
	wGG0X6NBqJqo3uhEUHtI/it6QF1zD+eBNBFZIBd7m+exa8lrwyMVUj2F2bJq4KPv2V4U
	+1gKyF2HU36sLRqIKiRsWAtdnwNHoAgjw1Hr50vhP/I9w4fkdvPkRDRyUwKH0gnMOod5
	uXfZriIDlLwOlAOvzaO2Rfcnu6YCcBTjsHeYY2U09FlbaF1ZpW7vjKU/U3TINXS/HxoR
	hovCIZX2k9c2wvya9NBOt4JO5wI2rav8WqZQZTU3MyYVggKHIHcGDjeeyjKrr/LTCDho
	8Wvw==
X-Gm-Message-State: AHQUAubmBCM0ymZfNSNnNDciRnzfc2cD8KdZYt0BMGfedbC3m89AAN2J
	iGB9+on213pjgaEMzybpIehZGw==
X-Received: by 2002:aa7:8c8c:: with SMTP id p12mr4670778pfd.0.1550156184770;
	Thu, 14 Feb 2019 06:56:24 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	d129sm3912960pfc.31.2019.02.14.06.56.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 06:56:24 -0800 (PST)
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <20190214034345.24722-1-richard.henderson@linaro.org>
	<20190214034345.24722-2-richard.henderson@linaro.org>
	<CABoDooPZMc8OD7h59B_9Q+Jv+B7cXbJFEqmZPawZJ7b1_Bdp5A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d6cfe7e8-0d5a-00f7-c2ff-5db201d19df7@linaro.org>
Date: Thu, 14 Feb 2019 06:56:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CABoDooPZMc8OD7h59B_9Q+Jv+B7cXbJFEqmZPawZJ7b1_Bdp5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-devel] [PATCH 1/4] target/arm: Add helpers for FMLAL and
 FMLSL
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ve6Auhb741Tf

On 2/14/19 1:16 AM, Laurent Desnogues wrote:
> Hello,
> 
> On Thu, Feb 14, 2019 at 5:00 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Note that float16_to_float32 rightly squashes SNaN to QNaN.
>> But of course pickNaNMulAdd, for ARM, selects SNaNs first.
>> So we have to preserve SNaN long enough for the correct NaN
>> to be selected.  Thus float16_to_float32_by_bits.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/helper.h     |   9 +++
>>  target/arm/vec_helper.c | 154 ++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 163 insertions(+)
>>
>> diff --git a/target/arm/helper.h b/target/arm/helper.h
>> index 53a38188c6..0302e13604 100644
>> --- a/target/arm/helper.h
>> +++ b/target/arm/helper.h
>> @@ -653,6 +653,15 @@ DEF_HELPER_FLAGS_6(gvec_fmla_idx_s, TCG_CALL_NO_RWG,
>>  DEF_HELPER_FLAGS_6(gvec_fmla_idx_d, TCG_CALL_NO_RWG,
>>                     void, ptr, ptr, ptr, ptr, ptr, i32)
>>
>> +DEF_HELPER_FLAGS_5(gvec_fmlal_h, TCG_CALL_NO_RWG,
>> +                   void, ptr, ptr, ptr, ptr, i32)
>> +DEF_HELPER_FLAGS_5(gvec_fmlsl_h, TCG_CALL_NO_RWG,
>> +                   void, ptr, ptr, ptr, ptr, i32)
>> +DEF_HELPER_FLAGS_5(gvec_fmlal_idx_h, TCG_CALL_NO_RWG,
>> +                   void, ptr, ptr, ptr, ptr, i32)
>> +DEF_HELPER_FLAGS_5(gvec_fmlsl_idx_h, TCG_CALL_NO_RWG,
>> +                   void, ptr, ptr, ptr, ptr, i32)
>> +
>>  #ifdef TARGET_AARCH64
>>  #include "helper-a64.h"
>>  #include "helper-sve.h"
>> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
>> index 37f338732e..0c3b3de961 100644
>> --- a/target/arm/vec_helper.c
>> +++ b/target/arm/vec_helper.c
>> @@ -766,3 +766,157 @@ DO_FMLA_IDX(gvec_fmla_idx_s, float32, H4)
>>  DO_FMLA_IDX(gvec_fmla_idx_d, float64, )
>>
>>  #undef DO_FMLA_IDX
>> +
>> +/*
>> + * Convert float16 to float32, raising no exceptions and
>> + * preserving exceptional values, including SNaN.
>> + * This is effectively an unpack+repack operation.
>> + */
>> +static float32 float16_to_float32_by_bits(uint32_t f16)
>> +{
>> +    const int f16_bias = 15;
>> +    const int f32_bias = 127;
>> +    uint32_t sign = extract32(f16, 15, 1);
>> +    uint32_t exp = extract32(f16, 10, 5);
>> +    uint32_t frac = extract32(f16, 0, 10);
>> +
>> +    if (exp == 0x1f) {
>> +        /* Inf or NaN */
>> +        exp = 0xff;
>> +    } else if (exp == 0) {
>> +        /* Zero or denormal.  */
>> +        if (frac != 0) {
>> +            /*
>> +             * Denormal; these are all normal float32.
>> +             * Shift the fraction so that the msb is at bit 11,
>> +             * then remove bit 11 as the implicit bit of the
>> +             * normalized float32.  Note that we still go through
>> +             * the shift for normal numbers below, to put the
>> +             * float32 fraction at the right place.
>> +             */
>> +            int shift = clz32(frac) - 21;
>> +            frac = (frac << shift) & 0x3ff;
>> +            exp = f32_bias - f16_bias - shift + 1;
> 
> If FZ16 is set, this should flush to zero.

Ho, hum, yes it should.

> This means you will have to use both fp_status (for the muladd) and
> fp_status_f16 (for this function) and so you should pass cpu_env to
> the helpers rather than the fp_status.

It's not quite as simple as that, because aa32 mode would pass
standard_fp_status.  I'll figure something out...


r~
