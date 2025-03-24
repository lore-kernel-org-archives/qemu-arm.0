Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2080642njc;
        Mon, 24 Mar 2025 09:45:22 -0700 (PDT)
X-Received: by 2002:a05:6000:1561:b0:390:fe13:e0ba with SMTP id ffacd0b85a97d-3997f9092bcmr12917364f8f.27.1742834721883;
        Mon, 24 Mar 2025 09:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742834721; cv=none;
        d=google.com; s=arc-20240605;
        b=gkDVtKrjMzv6JXikcylEtxCOIAGdWNi/mHGkRGlwTaRJ10ztvkzQ4KLrPTIgdALek2
         gAa6rvGUV8fmGke5N/32SNJjweRpA8bEcc3lYuLQzVMAF3kM8lkbMKNqIcC2LPdS2ig0
         0bAVBgeXElb9SL/fCxbxpvlkDZS86TGTL0f4dDaTfGGceVgH0gjkbz2cNg+8CZryVmKY
         svqV58AcQwichpRzb2VEJPtV8jujCbOlps1+rQ59BXAOiC3yEGPhIC5coWh1xyiWRoi1
         tneS9Ih4WX631TE3XDytFCxcfg/fRi1wGNoK4hGo15npinOTGZmMz16kv1N4ie8t2C9Y
         XyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Bp8xeRYI2Mvm4SOedu+lA0vJWJYO0zux85Nk6Gw5TQM=;
        fh=guoHuVftAUdepLYPKBIRGirBuprjhK96IFFUf52AiIM=;
        b=dt6KRbyyngLl8k7LTffGAbtKIpvTYIc7mzuyeg9Q7ts4dSwL9NIjRnq7e1NFsFZPIa
         CZpPonzM3gVTPFZTE18F9fiT8+pMSIox69IplDZSaGlLSy6WpcpJeU46MEXwm2qlBpt1
         bpT3vbXQ700UiT2FbaaolFI06VgMMmmWPKPiPS6BYHpbV54/njo3LCm3eJ6a4fHkEehE
         CQ8CTNtujhpQW/kz1d6+Gqh3Nuu9K5MVJdNdXn/VizolTYeElZ0IzmLxl8xyRwjXA3lL
         ibrZHRq0y0Y+WCgzcnysju3WIk3UHK0oF4n4BY569f4fEZWi1hwQWlVcSZL9mcg+4zFa
         lIPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uPBl0YIk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3997f9870e6sor2286347f8f.2.2025.03.24.09.45.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 09:45:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uPBl0YIk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742834721; x=1743439521; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bp8xeRYI2Mvm4SOedu+lA0vJWJYO0zux85Nk6Gw5TQM=;
        b=uPBl0YIkk5nIiPgTQyxua/5jhn96+gyIcyfpDMYiPsLTpJIwzGrHqLuuHfO5Q99EmC
         lA9aeogCZDTvGy6Z/0wiYMngppxMgRWjoMjwmqvS7LirZia/FSe6NLTzDZ9yI8ZcKNbD
         Cn9T3pKU6YrHeI3oBKPR+9mI1j5S/dvdlayncNEcSG1ipvc5zc+9MZ391N4L7vhdesyi
         kmEVPX0Bujk8Q46O0LfCdZ3GGroQonlTZg/3S1g5xEmeSbqRauk0ctaAj78knOrolWjg
         AGihTUUK7gMaBkwc7Ej2iLPepo5vJr7RLZM/EOsnl3OI2Q9K0q4Dw5zk4Ddj66onhWNC
         U8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834721; x=1743439521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bp8xeRYI2Mvm4SOedu+lA0vJWJYO0zux85Nk6Gw5TQM=;
        b=lTAG4stuRT3EigbsM6Jpe4OTcFJWbJx7GBBu13XrPo62cufo/JtHZ0LT3F3gGC+BJn
         COqRjo78NmMzLVS7lBq8L0CCiEei25zL9aynnjGvUBS+o1pPdN1WphM9dZqGmtKmu1jQ
         pcu1ECU6cK0x8qytz4+BGDMOqPj3x8S0SajvmMdIlKzkYDFMzJFp7eS0UHpv/vFsy8dV
         cK92kDfn+wrn5CYAb0ISf5Cmol1lfOdQb1OtUc7cw5aATisd7sEpX0goDgLFKOkxSIF5
         XeSPJ69ybBDgRKF2JnI+Shf+A820+k+Dh0QS8x1Khbd6aXQRI4ksfuFUovQi8BzMwfms
         mUSA==
X-Gm-Message-State: AOJu0YxcjeIeUuu1CWoOI/2lX1EXvT2SCi5s4W5Zv5Zzg60/04HOiGCy
	67EFzN0lkJZ6gSIr75ymKdmFq//NbGGreVUnYV2zadC2HipEOGsUH+4e+SG//VuaX+QsB6sKBWH
	7D8E=
X-Gm-Gg: ASbGncsrLlL6TZ0PVZgURIz8VpAVpo8If3SORbGjdo5QP9v2jcj1MpObt7dCEfiV/hN
	bd5n/OnRWG2IYjHUwJn7IcLqJG3gXGvBziryeSoR7zwtP6NzHB0xwkqpHKjZuFTxzOWqpJ9iVKc
	vYhk6OQq32bmf8Ur31nLagbpQ1xYq0NjJ40Cz+5lTAiAJiswY4iSfgcw31Nq0yG912Gr4dmGpZP
	5OhMcql5zGfvqd05jOgF0Y/WncueRLv+JoqmYT7WKuUWpT1RosO2cxn1xO7BFo8VQk4nh9EMVzq
	5i/LyNXdIROrh03wtA8v8OPcAT33u/jeJ0UGIuHRxaPIyCbel4seOLIg5lfrt+YOXsaJeWpJETl
	pIjV0JBnHA7cdAzqNv+rD1KpBd3HM
X-Google-Smtp-Source: AGHT+IHwqTdblpPgrJemQaN3hNrCK+s4VCxRmwdQY+W3hj6KH2ZvxklHrIMWUdQqXYIhG4/OVvepsg==
X-Received: by 2002:a05:6000:188e:b0:390:f55b:ba94 with SMTP id ffacd0b85a97d-3997f8faeb0mr12844092f8f.13.1742834720858;
        Mon, 24 Mar 2025 09:45:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm124251195e9.35.2025.03.24.09.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 09:45:20 -0700 (PDT)
Message-ID: <519034fa-3336-4317-ad20-2c4574488e0c@linaro.org>
Date: Mon, 24 Mar 2025 17:45:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] target/microblaze: convert gdbstub to new helper
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-11-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250324102142.67022-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7sMr5n8NAyCC

On 24/3/25 11:21, Alex Bennée wrote:
> This is a pretty simple conversion given a single set of registers and
> an existing helper to probe endianess.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - use mb_cpu_is_big_endian
>    - use explicit MO_32 size
>    - handle differing size of env->ear between user/system
> ---
>   target/microblaze/gdbstub.c | 49 +++++++++++++++++--------------------
>   1 file changed, 22 insertions(+), 27 deletions(-)


> @@ -50,62 +50,57 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>   {
>       MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
>       CPUMBState *env = &cpu->env;
> -    uint32_t val;
> +    MemOp mo = mb_cpu_is_big_endian(cs) ? MO_BE : MO_LE;
> +    uint32_t msr;
>   
>       switch (n) {
>       case 1 ... 31:
> -        val = env->regs[n];
> -        break;
> +        return gdb_get_reg32_value(mo | MO_32, mem_buf, &env->regs[n]);
>       case GDB_PC:
> -        val = env->pc;
> -        break;
> +        return gdb_get_reg32_value(mo | MO_32, mem_buf, &env->pc);
>       case GDB_MSR:
> -        val = mb_cpu_read_msr(env);
> -        break;
> +        msr = mb_cpu_read_msr(env);
> +        return gdb_get_reg32_value(mo | MO_32, mem_buf, &msr);
>       case GDB_EAR:
> -        val = env->ear;
> -        break;
> +#if TARGET_LONG_BITS == 64

Not necessary if basing on top of:
https://lore.kernel.org/qemu-devel/20250212220155.1147144-5-richard.henderson@linaro.org/

> +        return gdb_get_reg64_value(mo | MO_64, mem_buf, &env->ear);
> +#else
> +        return gdb_get_reg32_value(mo | MO_32, mem_buf, &env->ear);
> +#endif
