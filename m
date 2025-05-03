Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1632194njj;
        Sat, 3 May 2025 14:18:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7hS6AAmNExzvWSxCTfjmfbadz9muEQUnNlqZH5tR2RZ/9WdkHtPjUanA553LBRI/+D2yD9oQitCu9hw==@linaro.org
X-Received: by 2002:a17:902:d584:b0:220:c143:90a0 with SMTP id d9443c01a7336-22e1ea39b8fmr43871095ad.24.1746307119980;
        Sat, 03 May 2025 14:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746307119; cv=none;
        d=google.com; s=arc-20240605;
        b=EsQUTVvvBz4Ivkmhj/W+sk94mqTozKMPvX3t+fUCzbsAANZLCilrwP8lxasOkGrST6
         EFKyVKhZKU4EjRsHBFjF0oiGI68BCsB1GkQ0TWDKBqaRoqFiYI1g3ic8XPNY3bSwspVq
         aB1I24a3qtS4VB5FIS+N/czkmP1woupJVdLJhMCqb268/bU5tbJnWP7tC6Eb4aoC7h6y
         gHqSbwWGHU3WI+dfaE1Gc3WdNEAK1mhoFy01DKJdDbm9cmK5dsl0flgDv2FbI71/PCph
         KK4zhmUgg5vLgYOE7lLq3ZRlEIa+xDRBmrzaqlkGzhgB/l/3oULa4rM2PnzzB3U0JAk3
         oZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=45ezGvBYBHyKW+GUcBxuGvzarphaJYBNYk9QW0DXKLU=;
        fh=kWkNQme9E1sO5vLj8M6oUs32ldQlLUs5LPXNPpZPBMU=;
        b=fL2y2BPyvMEiaSbLH31XlMfwyelpb3HcHaV4RVOoxzbjaLxqz8UNkliiQyE2pCvJkb
         g3jHfyYJ4mZSAxbMFrAlwl4Ecc6M/j+qBiHnPVClX6tzF91ttRQthZlR2hkPxHEljgmI
         55gzsRjnqTSKggeIfi63xzKwMWqSeYaPbYn293Vw8jBdpf/psWIwAIR+7aE3DvEbstNC
         RoAkrzcXpTZV7LU38u1JrgS+eeaQbZeBSM/UqRrAkvvatIl3fP1TyPwGoFeR5GTQlqNB
         qVbHidH83OXjRC14xfrmjhtzA5acE5M9ZGpQEF4ENN96w+Q7MK4TGzR1b+bZQs+0QNt3
         JA2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dIt4WrC6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1a3ecsor46640135ad.4.2025.05.03.14.18.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 14:18:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dIt4WrC6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746307119; x=1746911919; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45ezGvBYBHyKW+GUcBxuGvzarphaJYBNYk9QW0DXKLU=;
        b=dIt4WrC6dEMXGw5EzMJSRNHctESgsHBY3VwFhknqqfABSuVwfpJzPSGzq0mvHs7tZk
         ySdTKtnIHQpwQdHUT2ICJdVxePP47j2JoWIDVfsSfxq9RCj9CGk2j6Q8esSMRgmlSvnh
         BxvUm7n4qLSbhJ/DWQgQztGZj5Bz27IQ07qtMs5yiE1o++lnPLc9Fx2YzFmbpz1h3tLc
         P+0jep4bXZoHHL7Fa+cTPIiy8Pg5vO+3isjNhR/53HHkGSO6rjjwGxyFxblNe/IKFrv5
         z70RwDrNt8QOn8aXsQshLjTIl00K+/kUX7Y8gtaeh+GHowyDuCqBmXtWz5bQcGbpsQmn
         iz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746307119; x=1746911919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45ezGvBYBHyKW+GUcBxuGvzarphaJYBNYk9QW0DXKLU=;
        b=rEO4tWwU9Pg/npYJS4fd1FTIrFL/x7fqxJcw0DTH0V4H76jzTjCKKjDpbbXXYj8lOe
         zT2Z4UW6pqWQ5H9t/mliTpDv55YibiqSlZwwhTQ4oYH0qWVYVbdaORcPUmATIMTsNN/X
         GBsLsJ7i5Qg+NaNpat1375lrDoQHxsSBfNeARy9ht48d3SfJrtFPrTz+U/1rCND8ObmN
         hjYqrFnlG6r/Ip9CG8zkpwd6bhkO9QY0fAU9MhARijKxTBq/wULyWdgAQbXjAD35EZoB
         NziRfTmeHozT3JNUJLXMbKeOBY+8DmPKrYZf8L2hF4qgj5wL1eaYc1GExoRQVs3DJDks
         h78w==
X-Forwarded-Encrypted: i=1; AJvYcCVJE4DgFDLaQMCFXT52uMnicNjUOD2wLhGWEraF85tuIPfMTvxs/4rirWFpae0lc6MWXlQ2VuvzKTfTyQ==@linaro.org
X-Gm-Message-State: AOJu0Yxz32yCrMIN/2v7AsKerhZh+h0P4I7pL5EyzD3TtZ1rImOF5/CE
	s/s5yqK5kn3YfgvJXavCVGnmgbTNRaSNwS8yzlD6dRhdf+kdNXU0z7Z3WLvE3+vTOA==
X-Gm-Gg: ASbGncvPjxg1884No/XsLWn8cexLiyQ0RRn2wEx4BpIeV4ni7H5QB/cxFk66DqO9ysS
	djEVZk1bmRdNk8hKnB57seRB2WtDS1+/Sh/9MFluHDlemtJSHOKBmCS0P71NK3LLcL6MZO/kb9G
	+eNpV06fF0l4ILfyLelguHJecFLInFuwztGnZ2Ic+2Q15sCgbt6Y1zPC5ve4cC+d+A4USqII9/T
	9PN48W5JZFGtAVl8tQxUt3Mrlp9kpMJ53zRLDOuxl/UGRiY+MMs2cwiKph3UuE0GALU3RJQkpzy
	Ef6dwTZx+qD6JvZHCzN91lmCy9G0jI7oTX+xhWDvZS7Fulg16Ir+cg==
X-Google-Smtp-Source: AGHT+IH3UsnAzBT5enZnNLGLoJsukEKh1TbN9yI/pnjynITTwoYoYrOIa5hc3zCcGSfsIbx5/+ChYg==
X-Received: by 2002:a17:903:190:b0:224:1ef:1e00 with SMTP id d9443c01a7336-22e1e8f8833mr32193285ad.19.1746307119511;
        Sat, 03 May 2025 14:18:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eb21dsm28272865ad.40.2025.05.03.14.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 14:18:39 -0700 (PDT)
Message-ID: <21893e4f-700e-4a9f-b877-98a863a47c02@linaro.org>
Date: Sat, 3 May 2025 14:18:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/33] target/arm/cpu: remove TARGET_AARCH64 around
 aarch64_cpu_dump_state common
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-10-pierrick.bouvier@linaro.org>
 <24662e56-d6cf-4c17-b792-e4d1ece6e241@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <24662e56-d6cf-4c17-b792-e4d1ece6e241@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NijpyO6IUKhP

On 5/1/25 12:06 PM, Philippe Mathieu-Daudé wrote:
> Missing the "Why?". Answer, because it is guarded by is_a64().
> 

We are guaranteed it was not used because the whole definition is under 
TARGET_AARCH64 (and not only the code inside the function).
If it was called before, out of this target, it would have triggered a 
g_assert_not_reached().

As well, yes, it's guarded by is_a64(env).
I'll update description with this.

> Should we assert on is_a64() on entry?
> 

I don't think so, from the reason above 'If it was called before'.

> On 1/5/25 08:23, Pierrick Bouvier wrote:
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/cpu.c | 11 -----------
>>    1 file changed, 11 deletions(-)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 37b11e8866f..00ae2778058 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1183,8 +1183,6 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
>>    #endif
>>    }
>>    
>> -#ifdef TARGET_AARCH64
>> -
>>    static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>    {
>>        ARMCPU *cpu = ARM_CPU(cs);
>> @@ -1342,15 +1340,6 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>        }
>>    }
>>    
>> -#else
>> -
>> -static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>> -{
>> -    g_assert_not_reached();
>> -}
>> -
>> -#endif
>> -
>>    static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>    {
>>        ARMCPU *cpu = ARM_CPU(cs);
> 
