Received: by 10.223.150.237 with SMTP id u100csp3356423wrb;
        Tue, 14 Nov 2017 00:44:08 -0800 (PST)
X-Received: by 10.80.189.205 with SMTP id z13mr16352045edh.184.1510649048214;
        Tue, 14 Nov 2017 00:44:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510649048; cv=none;
        d=google.com; s=arc-20160816;
        b=cC90WkIjcHXWvCit7u3lXtmIR9xe2/12xOpdBRpVIXvWKWI4k2kwprpNeVFaZ76Zs5
         W8lzCFHWPGc3CUUrBIWyw4WAkltWFYODHSIKjBABG7MN1xnTmDr5qN5zCcGcDH7QhPil
         t0O6Sj5HcZk20YP7YT5ffD3pwM8LgT++VJdp8gq1Vm3Nvqf0Q+mI3dLYopSKKYITAdi1
         gv+4CfQGWD5nyTmx4uunuNDY8zjCoplzU13GpiDWSRFNy3LYbi+k79060Fy7FTrqWo4n
         sgvNBJbp0JzX4bLK8BQfDJmJ4slfdPKFHBKVy8NDP9bhR7Fs0k0c797fTLBnZjFi7WE4
         e/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=KRiI5ThVwl8rGIlI0rOxmghOWsaPa1ukSeJlwzsnYfI=;
        b=J15dVRlxhrwFT2rM76gQyiQz4NVzJbJsJBCFHU3q2Pr/ENZPiwnpa67HBzEkZVE/7+
         j1KI4kopIbltZkuHcdmQYpqJFOf8Gi1kDmBy1IU9oOo2ZUw0g+a8OzOxLtEhFAYMdCVX
         H4RAO4YdURlplpoy1IwOlOozg10SQw+2gtYpNWF/Rx+1DzAxOHvJcbqBJkGAefneiJL4
         rUCEGVpaYBMheQOC8yssOwQ4BlXp/QlQk2QtLeNKhmm2gv/caR1m3CcKXBF2VlM6H5Mg
         no49ESemOp5HwArMRkWiyxjgC/006cCH9rc6+GvcfrZJk3oWbT/wCMScwcyUNyhEm/bL
         Ayew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UL7yTtI1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b17sor10244634edj.10.2017.11.14.00.44.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2017 00:44:08 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UL7yTtI1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KRiI5ThVwl8rGIlI0rOxmghOWsaPa1ukSeJlwzsnYfI=;
        b=UL7yTtI1NzfZ5XMDVA6kNElNhx4DkVB1DHsibBp9RUXZSXZMCqcDTKqN1WFiwHhikO
         u7fvwtXqOM9dwNjyJxjninn1ie2DZuWPUxtL/S0wy4LO04l86qDQV5XWIomw4HNgkm95
         42YTpCkoJ4K4gUlP35GrP4qBnAu1g3SAUsR4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KRiI5ThVwl8rGIlI0rOxmghOWsaPa1ukSeJlwzsnYfI=;
        b=hTkemi8FVdQTm1NuJ9Luc9llSzZzqFju4szCnFTSWRlyEC5IA28m6Amf2yE0BsyImw
         HgBh2PJRf07VlnaKWrX0wJ+8nPnvG4rrYJ3uhXbJllrGtHF+iZ1xuvcNCv1QZmbL3oKf
         fKbTF9PimV+EkfLKY+n0gmMcMFvd1FKXM5Fxo8ID3yTwTwafg298ttxTCI3A9a5E6H/4
         xUdD6lyqaVHkp9W3St81BWprz/akuOLrxlAuqd1IJIfTSTzOpEI9Lc2uzd3zaQN5LjQT
         zhbZcmd6Ex9opHwz7liQwivgK6htTFEj91g2hVvoMHuI/19C2SkF3LRDx3oQj5okvaq8
         qSjw==
X-Gm-Message-State: AJaThX72GJOfHeCB6bkHEWZOAB2ztQNH74ohF45mqd4cfger8m76/d06
	vX8Gtc0cy0s8DxUU3eINIhhpCQ3RBqr/Aw==
X-Google-Smtp-Source: AGs4zMavw4cQy6qtuUeEMbMhy1BzYaqLHgl16M0IGsMEe+1QNKruz8xbCyEr6SloQVeUe9q/0Bv0fA==
X-Received: by 10.80.173.20 with SMTP id y20mr16395584edc.23.1510649047790;
        Tue, 14 Nov 2017 00:44:07 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (176.red-213-99-135.dynamicip.rima-tde.net. [213.99.135.176])
        by smtp.gmail.com with ESMTPSA id x38sm14830926edd.94.2017.11.14.00.44.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Nov 2017 00:44:06 -0800 (PST)
Subject: Re: [Qemu-arm] [PATCH v1 03/12] target/arm: Decode aa64 armv8.1
 scalar three same extra
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171004184325.24157-1-richard.henderson@linaro.org>
 <20171004184325.24157-4-richard.henderson@linaro.org>
 <87wp2u9m5k.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13dec407-103d-ead5-94f4-b35cd8b3d83a@linaro.org>
Date: Tue, 14 Nov 2017 09:44:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <87wp2u9m5k.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Ize2DnlCNyYq

On 11/13/2017 05:30 PM, Alex Bennée wrote:
>>  DEF_HELPER_3(neon_qdmulh_s16, i32, env, i32, i32)
>>  DEF_HELPER_3(neon_qrdmulh_s16, i32, env, i32, i32)
>> +DEF_HELPER_4(neon_qrdmlah_s16, i32, env, i32, i32, i32)
>> +DEF_HELPER_4(neon_qrdmlsh_s16, i32, env, i32, i32, i32)
>>  DEF_HELPER_3(neon_qdmulh_s32, i32, env, i32, i32)
>>  DEF_HELPER_3(neon_qrdmulh_s32, i32, env, i32, i32)
>> +DEF_HELPER_4(neon_qrdmlah_s32, i32, env, s32, s32, s32)
>> +DEF_HELPER_4(neon_qrdmlsh_s32, i32, env, s32, s32, s32)
> 
> Hmm are these really NEON or should they be advsimd_qrdm....?

Same thing.  It seemed nicer to keep the naming consistent.
Probably when we rewrite for SVE we will rename them all...

>> +    switch (opcode) {
>> +    case 0x0: /* SQRDMLAH (vector) */
>> +    case 0x1: /* SQRDMLSH (vector) */
>> +        if (size != 1 && size != 2) {
>> +            unallocated_encoding(s);
>> +            return;
>> +        }
>> +        feature = ARM_FEATURE_V8_1_SIMD;
>> +        break;
>> +    default:
>> +        unallocated_encoding(s);
>> +        return;
>> +    }
>> +
>> +    if (!arm_dc_feature(s, feature)) {
>> +        unallocated_encoding(s);
>> +        return;
>> +    }
> 
> I guess this is because we are expecting additional features to be added
> to the encoding space...

Yes.

>> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
>> index 847fb52ee0..c2d32988f9 100644
>> --- a/target/arm/Makefile.objs
>> +++ b/target/arm/Makefile.objs
>> @@ -5,7 +5,7 @@ obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
>>  obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
>>  obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
>>  obj-y += translate.o op_helper.o helper.o cpu.o
>> -obj-y += neon_helper.o iwmmxt_helper.o
>> +obj-y += neon_helper.o iwmmxt_helper.o advsimd_helper.o
> 
> Given this is AArch64 only it makes me wonder if we should be using helper-a64.h?

It isn't aarch64 only.  The aarch32 part is patch 6.


r~
