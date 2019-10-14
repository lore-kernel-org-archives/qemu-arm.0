Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4814497wrm;
        Mon, 14 Oct 2019 12:15:06 -0700 (PDT)
X-Received: by 2002:a17:902:22b:: with SMTP id 40mr79036plc.176.1571080505976;
        Mon, 14 Oct 2019 12:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571080505; cv=none;
        d=google.com; s=arc-20160816;
        b=B+N5wUBtXYz6vGSmwDmEOLM1KglkPKZK/wIRFx/KI/9+L6nIw8yKXNcymqXWtvHab7
         RpV+tnXhgxspq1aVITvMCPTRY+A46q+5pKegbnRt4ZtnJw/2Q1G2HaDMDaOHq3mqbk3i
         Dwbm7KTYP9rJAJ3c4qAkm4LUu7bR9k1IvrfhhKKoavBIKhwZ9ZOK9yUBEq9stzibIJMk
         hb0tDmARUx/wkYECnr/AthpTIdKfcihJpJ0NMD48r4JT1GGKzTZbwLWtQLqfPTzSEExS
         r3YRdkLoaV0DGSSp54F+YwYPI0pQudiQy5qW02B7EfB3rpCQyu2HZjrSw6iORCdIN0jv
         dAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=e93wkwG0HkPCKwmBCpkvboT2RX+XxELhxVuTIwX89fE=;
        b=FY8V8Orrvt9GA06D82QjUILBC8FApxOKV/at1opWziszQNkwCGWj8D0kPBIXA7TiZQ
         ATDJmj9jGj/J38tn6eA4zQLNCoo2w773OYFJeRNTx5G8PfTa8u6Y/gdazMK6zT2Ctg3d
         cgnmZutjfkytGykKe8X9L86TYoBv5bl2BMRvfDPVxDJeB+N3geoKQV+p0ACt8KhPJ16B
         iWqovMXVnm4Pc9hojP0b2ii1inpZu02TI4mEDx+5PYQMgqSwLqIiRvwfnskxt58hzsNL
         cEqMVxPZovS8oE/kB7D0U0ZsNiEzbqsLd7/4ZPb6x6jla+A2MCEBNLUfnMAAOssGyXKr
         MiOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ipMxbr77;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s198sor3965191pgc.20.2019.10.14.12.15.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Oct 2019 12:15:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ipMxbr77;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e93wkwG0HkPCKwmBCpkvboT2RX+XxELhxVuTIwX89fE=;
        b=ipMxbr77UHJDHLXy2/ZqWR0VIOI3+L+t+WrpfGR4Jel1pivi7afMuZCdSHM2SlBg2F
         gwWdI502lZ7kFCKJfksMn7WSisazDmpBrWgXbNb+L/EW/oT4bbv8fAlH4rigBfnWFgju
         7yrYyKLPiYI0YNucblC/z2KN99r9suT9XJuC5g3n3x138Su+6q4FkBd4+7sde07I/H9L
         EYV5Njo2YzAoWleEiff4vueaCpFKPqIEpPWH/d7BrHMDsw+nNgqNFWLeHw4X06NFJ/8N
         aDzRqicPdC+a16PVmJYAARFEW64wRWdacjKoWOHXwNxBgVT8P5tX6cHOwot+4mGmV2vK
         VqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e93wkwG0HkPCKwmBCpkvboT2RX+XxELhxVuTIwX89fE=;
        b=WVDIk34MU+Oo6LuB0Kd1MvaaeN734G1RE9GhtlB7S5N3fVaPiY74D3jehvhWfQz1II
         t6WyZBCMg4jQztTf9Bs/HdkeUHpe/84V6m26ypvGjyahlYrzBYumMT9n1Hqy/EQ4rLsj
         YpRzp1e8ZFUIoh3xZo7EyIpMINc8UVPoRyryRG92Akuu9bsFfRL9+AstR2g1d2g7q+bZ
         641cgUWzHo7V1tkXQwpepVU/Y1DUk9WmDaCHq5A+1vYw3pCum9yUQVhc5yF/JzdUUM9u
         SVF841z+XKLq1T4s4YK+yMaefQ0k3ZETWid2ILl6UclG7HvINMKaZEuVG7q8udPnfQIq
         FRBA==
X-Gm-Message-State: APjAAAXvVojtY50bYeECUqkQbOKaUdyjvP9NM64uNiNyGStnRzHFWTgM
	ePo9BBNM5NPRGVg0SZ/bLb9SMA0O
X-Google-Smtp-Source: APXvYqygZJydYDmTMun8JMuX9GYEqcz2fjHLLuzygYA1CANWOV3veLqdNokKHvZB9EImAaWBoE+N/g==
X-Received: by 2002:a65:434c:: with SMTP id k12mr35412626pgq.141.1571080505338;
        Mon, 14 Oct 2019 12:15:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id d19sm16638408pjz.5.2019.10.14.12.15.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 12:15:04 -0700 (PDT)
Subject: Re: [PATCH v6 18/20] target/arm: Rebuild hflags at CPSR writes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-19-richard.henderson@linaro.org>
 <875zkrm9gg.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1aa62e90-6915-c0e6-7a8e-22308ee48f0d@linaro.org>
Date: Mon, 14 Oct 2019 12:15:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <875zkrm9gg.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 1vh4vwDuLQqA

On 10/14/19 12:08 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Continue setting, but not relying upon, env->hflags.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/op_helper.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
>> index ccc2cecb46..b529d6c1bf 100644
>> --- a/target/arm/op_helper.c
>> +++ b/target/arm/op_helper.c
>> @@ -224,6 +224,7 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x, uint32_t shift)
>>  void HELPER(setend)(CPUARMState *env)
>>  {
>>      env->uncached_cpsr ^= CPSR_E;
>> +    arm_rebuild_hflags(env);
>>  }
>>
>>  /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
>> @@ -387,6 +388,8 @@ uint32_t HELPER(cpsr_read)(CPUARMState *env)
>>  void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
>>  {
>>      cpsr_write(env, val, mask, CPSRWriteByInstr);
>> +    /* TODO: Not all cpsr bits are relevant to hflags.  */
> 
> Do you mean by this we could check which bits changed and avoid a
> re-compute if we wanted to? Is it likely to be anything other than the
> SS_ACTIVE bit?

Yes.  Well, there's also NZCV.  But neither case happens particularly often, so
it's probably not worth worrying about.


r~
