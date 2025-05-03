Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1654919njj;
        Sat, 3 May 2025 15:38:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgTL9b1BwXHcURwcz8jr1eHrxaxIZf8PoGtkfLBE1YGiF+bL0tDUHNyxO7jWuegYdguVL2DA5ufcymRg==@linaro.org
X-Received: by 2002:a17:903:2405:b0:215:4a4e:9262 with SMTP id d9443c01a7336-22e102b84cbmr111002975ad.8.1746311937523;
        Sat, 03 May 2025 15:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746311937; cv=none;
        d=google.com; s=arc-20240605;
        b=QnZRBHENE65dHjwkTgjyD26nrJBJjp9OPj/gwEztYvu4+hFguRgDlQwp3kNANBKNTB
         70LUZlEISrlK1zUnolW3CiIczVVzeIsNSNK46uFSrYbWLMl0ytO6Eoh/6O/e74ytSoOI
         4p+GYr9Gfa6YVMYO9/Tzkv7NE3/a0PQxR9CJEY8mVnxNVmZzBWxdz4y+Y6mXOlrmsG0g
         CUJ7m3JYrNzwDHzvr+dl/qCRXLPdNOMBe0JRVzRM7hdhj88KspgAw6TpAoa2VjvEImGh
         /5dtVnUYi8ApSz1BtVxSFTh9q40sXvkWBAlFBNc01H110T3Re+5mYqEKRx3Uv1IJryLM
         s96w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TzZ6/rd4q6aCbwYQPJ+KXhulQgHBRP5Hhq/AeRCnMhA=;
        fh=Tb7W3CComdVCtF0EnqYDzCW+ugWu5FNrMWTb981+WuQ=;
        b=GYuHHdPu61qDLBC4Z+wJ0MJvBj+zEYsQfj9xUZeVrIYNyvt4d+b7vCLwY47UsZQYr/
         TjxSyXmcPg8OGpz5hrSom7PTc+UcXXFGtDlDvWWUQh6T0RT3mxIzu4i9qiwuy5+77FsS
         Tdt74+2pCH4E3rusRbHZlF9Tuj9pl01L04qolqdxvujRqfH5WCwF9ne79gbDBh11iywh
         2AYYpvlV9LkQUhTDbDHqttRDy4bqSzco6jmgG0XSnMG5BXHMQfFhVgtkr1BVLH/AjsC5
         K2I36DPcGq3oLsiEXmaTu5mExC5iojn/Nq3s7sO5zNk4DYReicKDhfvatYY+tLSowZsT
         M/VQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCeP2oeI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb2363esor32447235ad.8.2025.05.03.15.38.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 15:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCeP2oeI;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746311937; x=1746916737; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TzZ6/rd4q6aCbwYQPJ+KXhulQgHBRP5Hhq/AeRCnMhA=;
        b=vCeP2oeIWIX3LA3XhJixl0Z9ZqI48MwdDd7MWwedKGjiwPKhOzYLotp6Ki/hIHcFIZ
         h+P4PM7jimk/z9OiDZYe8n2p10ylf2wX4c8AjwuRFmu/7ctsY3aiBS2/sl9UAkXo9StX
         43ApcSOkjXNMjxZzBMdwrYQfhyA9YMR5og+EhoszjHUPLjV1tXZQr4l5JFuJqEPMd+UB
         eC3QIR1j9GxGEnzf5a2vzQO+gsjqokt/prutWt7nL8627zRlPOTqqbcFrqkkFJaA6Yle
         iSDraQ/g9xwnl5WORpLcCpFjvPt78PxyQxu5hPMg9kFqhXbIcoG09Qoksd2J/87JMBnw
         tbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746311937; x=1746916737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TzZ6/rd4q6aCbwYQPJ+KXhulQgHBRP5Hhq/AeRCnMhA=;
        b=qiRvxNv5iiqqfHhy52A4eh1ohRgQwdqCbN0dc81YaQkqQGo3v0ej7D6pOvRnlaFApK
         kF8EiimB6TNoERkyiB7S1TZywUlH5YdBy+RDScD/9oS9O8PMmdYDKz+c/xVI2YWmiU4q
         gebd3q8+Y59Sf8Crn2BhmGpP3CoBCVesVj6DmWwXzlsdVo3cZ2ZqwQgw+b8XS7zi7vHE
         LJ/6bszfLhfmVayJA2tWRbjTYumP+CQcbS4pokk5DKJNb1AcQtec6uMiR54P2VXpevQX
         OZ0xRNpBvpDtGzhH/W4PT2k2ZTOJ0K/3+BdqypQOilOWLYvlOofJtx/DeLrwsfBX/06h
         HdJA==
X-Forwarded-Encrypted: i=1; AJvYcCV7RsHBptk5uG2m9pKQ7UdXlq/HWW/+Z3v+DRfzIxeoN2tUAwW4mA4Cp6NNyu+t/eEETwh4I/ddYMnaeQ==@linaro.org
X-Gm-Message-State: AOJu0Yyssa1UvLoPKfbLlg1wL0QYaJOX6yj2mlNEgT4Rr1t4FtI2CMLy
	JD0ehMANzfD5l9Uwp3nFj8zb8IhveYBGk1h3w0V8fb/ZT6E7rA6Fz6zImm3KzQBpBA==
X-Gm-Gg: ASbGnctCRI5m0RTno/HG7ZBTQSiHMfjb9MP+cS5n3m857a1qHSCJjqXOECUf+Rb44yF
	U+PEGpOrEHhWNm1dZNwxMyHUfoTjHT4pgsGA/r7wInTMVBp4cnQy0/CQtOUAyw51p5K384p+wAT
	gKw4/l7uCpft09e4aO2K53An+54otYHortdXJnLD1Tce7mpP6Nff03IUxcCrfToLZtNFO6lQtJv
	GPUyaytVey+O2CfxIFRvb8f6ODalAQ/Xd5T7P+mUhdf8w3RxvlcJdIQbK6etEFIoxeQsDgj8flt
	s3IdKY/ot813J/5rCimxzt/oke8bnUlXjs++lFSrs8hBAG1uuo2icA==
X-Google-Smtp-Source: AGHT+IGbvuzrDbhbsKgBrbhL/DT5H2efQa2r3sIZ0UPYi0CpGdc8SJZM4M9idFIWtsGgO9FOv6TJ6Q==
X-Received: by 2002:a17:903:1c3:b0:223:7006:4db2 with SMTP id d9443c01a7336-22e1031fc0emr143723965ad.31.1746311937096;
        Sat, 03 May 2025 15:38:57 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7aea7sm3875921b3a.8.2025.05.03.15.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 15:38:56 -0700 (PDT)
Message-ID: <ab094518-f0a3-4b2f-8c13-ec77b4b2e9e2@linaro.org>
Date: Sat, 3 May 2025 15:38:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 30/33] target/arm/ptw: remove TARGET_AARCH64 from
 arm_casq_ptw
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-31-pierrick.bouvier@linaro.org>
 <a6fdb501-438e-4591-b166-87c8dbd14887@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <a6fdb501-438e-4591-b166-87c8dbd14887@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: zL2tS00nQR1D

On 5/1/25 9:24 AM, Richard Henderson wrote:
> On 4/30/25 23:23, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/ptw.c | 13 ++++++++-----
>>    1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index 424d1b54275..f428c9b9267 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -737,7 +737,14 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
>>                                 uint64_t new_val, S1Translate *ptw,
>>                                 ARMMMUFaultInfo *fi)
>>    {
>> -#if defined(TARGET_AARCH64) && defined(CONFIG_TCG)
>> +#ifndef CONFIG_TCG
>> +    /* non-TCG guests only use debug-mode. */
>> +    g_assert_not_reached();
>> +#endif
>> +
>> +    /* AArch32 does not have FEAT_HADFS */
>> +    g_assert(arm_feature(env, ARM_FEATURE_AARCH64));
>> +
> 
> I don't think we need an assert here.
> 
> The ifdef for aarch64 also protects the qatomic_cmpxchg__nocheck below, because aarch64
> guest can only be built with a 64-bit host.
> 
> Are we still able to build qemu-system-arm on a 32-bit host with these changes?  It may be
> tricky to check, because the two easiest 32-bit hosts (i686, armv7) also happen to have a
> 64-bit cmpxchg.  I think "make docker-test-build@debian-mipsel-cross" will be the right test.
>

Good catch.
I was indeed building only with i686. I'll add mipsel instead.

/usr/lib/gcc-cross/mipsel-linux-gnu/12/../../../../mipsel-linux-gnu/bin/ld:
libtarget_system_arm.a.p/target_arm_ptw.c.o: undefined reference to
symbol '__atomic_compare_exchange_8@@LIBATOMIC_1.0'

> If that fails, I think you could s/TARGET_AARCH64/CONFIG_ATOMIC64/ here.
> 

I'll revert this change and simply do this replace, adding a comment as 
well.

> 
> r~
