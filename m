Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3045446dye;
        Tue, 1 Jul 2025 03:12:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0iLJWWL1+m4MedTrG+g3JS63wYllCS7gMvCE8SiUtvw/4X00l4GG8oITg4rijvfRQHIAWo7YNSS+cLg==@linaro.org
X-Received: by 2002:a05:6000:4305:b0:3a4:e387:c0bb with SMTP id ffacd0b85a97d-3a90c171f65mr16980184f8f.59.1751364750623;
        Tue, 01 Jul 2025 03:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751364750; cv=none;
        d=google.com; s=arc-20240605;
        b=k0x2JZyNQcRj/PleC6cwDsCDOMLQlPh5I5UqqiFrkPFoFcaVilLxHMtTYFByU8HnGj
         FGWVhMH4a9HOopdeyyqRRNgE9gIr0WUqooxyu7l/1qBbmTTzpumod3+5naAcGAH8accx
         9CsBJ9FugCfII4dKqelS5k2v3LRvlJGhVCj3vcJfD/UiJU/EulpGAshFN7ixZ9mOb2ul
         w83PUq0SnZsVujBcCQng0fU2LPFfFxIsIIDG17JQzYhJSXRLlojr+mIfTy8OHwlpyTn7
         M5Q4S0NRGGI4NetaVc/n3+63skMwX8fW8uMNn9gUwg/uyYpy/o83eq07izI+41VI+jCg
         RnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=i48kyF48WGF1kOw5a2fFzh77wpZJNP5oYB8FFOd+ev8=;
        fh=QyF7kFXl4SbPCbk0ERh0zNfN4rjWq9XyQL7HP0Yb+i8=;
        b=cMTuaxEyyUjHbgpQAseRBnnVdRYyTIVzGB1AjEdrv0Ra4QBeKRpMDuYRq8c0am9y/L
         M07OnqkX/PwhtjqG9wbkbSVe9HSHKm7yVgN3v8pyMKR3FLykDiZKBZCuWqYWKiarKBQ2
         xBdvWJiSmWjN8Ow8ywlTsq4nG/khSPXPmP2aCZVogCeIaJO9I2KVCHmbfav2AaO2NqJX
         L0EM88e1X35c0jiTA8m0udUY78e+vWUd3YuwpwXVktnhtG9q41te0IlMcOV1Ben2bmnm
         GfIH4Hw7EbkcB9ROYOe3HnnuJADST6L9qKEhwLQPQWWYVoyxk83rHEw0MioasqFMOsf9
         TitQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abaMm3bZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45390ada73dsor29862725e9.4.2025.07.01.03.12.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 03:12:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=abaMm3bZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751364750; x=1751969550; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i48kyF48WGF1kOw5a2fFzh77wpZJNP5oYB8FFOd+ev8=;
        b=abaMm3bZa/Cckto57D3BYcJyUpV4OBALx3nSYMmILLW5EkJozvYMMb3BXXcs6VDwX5
         7Qq1VkL3AL131uMYwU+jDx9Q+pbVpAIPVXOaH9/spjK+4cIHSgw+TtgnKLCkDEM2Xh9u
         36v5ZcZXFqxWmNVj58rV53LAak1NU3GIXQM3235RTTRUk8QxehQhCi83Ls3gWedCo45i
         CuyiDwdlbr1ZOC19J7LqENrmANYCSGiKLmT1Uoi6coW6bqVi4Gamg9f/bZt+mVRqBIdN
         iodJo8lTCuj003Pcl7vsynLpdM5zZIb9/SvzAvrQBK6+PSGKmRFteJB2gmn99Z6L1Oif
         hLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364750; x=1751969550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i48kyF48WGF1kOw5a2fFzh77wpZJNP5oYB8FFOd+ev8=;
        b=fkaYElYNsuyv6ukbio/wONazaDdjZMVJZlZAYTrKpV0T8tLVRSrD/95S2Cm4sp7CcB
         SL8UEtGtVRX8k5FGxeaPPgFqAK/G4AX8vSasaqHkp0fWnnteDsjaYNJZP/ImPkvOsIIC
         4DrGFPv+XuO8SZstbQFy8drIQAw9nmI6xb5uThCf9mBtkDiGsOrU9bk8wTIuw7RwqgzL
         qW2gYDI1FQ+2/gjUZcC/5636hfKsj08HtVO3tCRuKtmYmjgEoEiyB7TivReddKd6DzlB
         VAWQVWAlhwOQkHOP7OdSdXqjZiNzs7ar6bPDLLjl+lYcAN55JL/nadvAJw3f6CB6jW2n
         Fo+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCbGi2n94vECrbC4N4hPCW04iW9FHPMqPaaw6LaQHsEY4kFmISfLTFBEUFjDhB0GyWP+raMWybTe4I0w==@linaro.org
X-Gm-Message-State: AOJu0Yx0iDcR0vzUCS1LEqDQyMXe/HlyZKy1umgOoU6C9vLylBhlG58a
	Ew4Fgvh4KRYeNcvnS837UkUyqhyCAPI/Has4+6MaZ57IuSNcAzSZchziqJapz80edAzpEg==
X-Gm-Gg: ASbGnct1kJvCx6x6ZAEmtO5CQh2Va3gog0YPelUQ6TqqEiH1CT1AzP53xzXA/Do4AW3
	GBDPsB5skSBxxb4kHlroA8dA/zXltIVAQmnBgUczwT1E8o+Be6EJQsp24HqjiUqdgGiCJk5rfv4
	9mJMYhygtRGcRWiTSQ2X/f0HZ6T3jZCA2+PEKgQXuClXCgDJx8pX4nuTuxs0/QyFvKA/lSpCpsf
	0tv9MFCroNk7GVmWHg5jF9rCFJe1HxP5/+4AIgIFd9Ysl92Kl0Y96O26CMl1dqmGshhLSg0hOCA
	1IwyaBtVN195TYDNDyraFYzI/b0k2yz2MDr9y8grkXfw3V9q0rGa+hhxqWkSyzj9w0ISNd+23iv
	Am/d0vqxWBmLcD7GQNBiS79wzsMDSNg==
X-Google-Smtp-Source: AGHT+IG3V/DgLWI7Rr9w/9AtpjvbqCpEr0yemPeswRn1wIGk+oob6kO0PmMCNon/JHwIcG/zcwIGUQ==
X-Received: by 2002:a05:600c:8219:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-4549f5db40cmr11080065e9.8.1751364749915;
        Tue, 01 Jul 2025 03:12:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.166] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad247sm197230345e9.26.2025.07.01.03.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:12:28 -0700 (PDT)
Message-ID: <1c7a557f-2ab4-465c-a84a-43dffbf4e0f4@linaro.org>
Date: Tue, 1 Jul 2025 12:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/26] target/arm/hvf: Simplify GIC
 hvf_arch_init_vcpu()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
 <20250623121845.7214-5-philmd@linaro.org>
 <CAFEAcA8+9TPps4NkRwRTZXq-nkR=zJ1SsFLnMzzNf7MioU-qsw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8+9TPps4NkRwRTZXq-nkR=zJ1SsFLnMzzNf7MioU-qsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6cfLv4NX59AT

On 1/7/25 11:39, Peter Maydell wrote:
> On Mon, 23 Jun 2025 at 13:19, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Only update the ID_AA64PFR0_EL1 register when a GIC is provided.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/hvf/hvf.c | 14 +++++++++-----
>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>> index 42258cc2d88..c1ed8b510db 100644
>> --- a/target/arm/hvf/hvf.c
>> +++ b/target/arm/hvf/hvf.c
>> @@ -1057,11 +1057,15 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>>                                 arm_cpu->mp_affinity);
>>       assert_hvf_ok(ret);
>>
>> -    ret = hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
>> -    assert_hvf_ok(ret);
>> -    pfr |= env->gicv3state ? (1 << 24) : 0;
>> -    ret = hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
>> -    assert_hvf_ok(ret);
>> +    if (env->gicv3state) {
>> +        ret = hv_vcpu_get_sys_reg(cpu->accel->fd,
>> +                                  HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
>> +        assert_hvf_ok(ret);
>> +        pfr = FIELD_DP64(pfr, ID_AA64PFR0, GIC, 1);
>> +        ret = hv_vcpu_set_sys_reg(cpu->accel->fd,
>> +                                  HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
>> +        assert_hvf_ok(ret);
>> +    }
> 
> This doesn't seem like a simplification to me...
> 
> Looking at the code, I suspect what we should really be doing
> is setting the GIC field to either 0 or 1 depending on whether
> env->gicv3state. Currently if hvf hands us an initial value with
> the GIC field set to 1 but we don't have a gicv3state we won't
> correctly clear it to 0. i.e. we should change the current
>    pfr |= env->gicv3state ? (1 << 24) : 0;
> to
>    pfr = FIELD_DP64(pfr, ID_AA64PFR0, GIC, env->gicv3state ? 1 : 0);

Good idea.
