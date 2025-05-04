Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1992638njj;
        Sun, 4 May 2025 09:22:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrPWgXkdPTP50IxtCdzaPk5uqioKzHteCS8xHREOCvNdrJIJ3wBnbmFWLOxn7sjV+GV35f4+O8GiQWeA==@linaro.org
X-Received: by 2002:a17:903:238b:b0:210:f706:dc4b with SMTP id d9443c01a7336-22e18b7a6abmr89832575ad.13.1746375726341;
        Sun, 04 May 2025 09:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746375726; cv=none;
        d=google.com; s=arc-20240605;
        b=cEXjmJZ9mZngduqBOc1bAhnrOxnqUw2LvQFnyYObf6dvHN6skemkphqXlwPQSb0eXl
         6jHyBI5BVkrpFjpaMw47jl1OXOp9JnUbrLdiIt8TpS48im/5iXp3GKLINivyP0r6ypvo
         G/P3wRuSWxR+otqZ6ACOvpcj42y5H3mZvNEVJ7l1uRYzdPIAKH68jimicv9H/7zphid1
         mX4l6TXNFoiZtuPdZXLJJAXt1A43ExtQ9RdYUDJiWCEVyaOQPxxgAAeDZe28CdgU53IF
         /hBlH9cZSMj2OlZhiIGFNtprlykyfxBZT8CHnjWHQa2t9yMnM4Zo/n4AdPCiV2n4kawn
         AoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ndDhIW14pK8IkolQgEpyEOmdYP4fJJ6SOj1tajl/8JQ=;
        fh=gKJdh7XBX6QRs1ahSuDG56GjQIJPesG3mezxCIvUzeY=;
        b=gaNf6tJu1idNEGqbsld8gVT17y5TlbARDV3etRxWJEOTZEj2fYZWqok9Ud5aHXwQcA
         G386DRwjHvX0dihhnsvvH1RWb41XDkDgR337zU3Ab11F+lfR+I1nvuFXeSOt1OMf9Zpr
         fk9TdCX6hbYUF21fEwCkWozZGwqssc45XSD7Eo2uJCZ+Bpk4DXTXjWhHc6SXJ5+l4GaL
         xPBToQZAPmTdy06OBI8dH1+JWrRW2eZKa9TdhNV6qMFckl0BLCOfsvFyGdpXmFAPyNTp
         NmU2bSWS+H4CrnDvnXG5wkovTXzkkzYAQaR7+HJ+7pftlUm2TwnQYqo2onLgJeJFyqUm
         DpZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYDUqE5U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef183d9sor5456962b3a.4.2025.05.04.09.22.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 09:22:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYDUqE5U;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746375726; x=1746980526; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndDhIW14pK8IkolQgEpyEOmdYP4fJJ6SOj1tajl/8JQ=;
        b=IYDUqE5UyNX/SxTAosCvhQi2emfTsfv1ElzFeW5TZqpuJegrlwSsri5HU782KvB86n
         b7XElgKm6U2yMRHURNUjjx1xa9FziuT+PAEi6Y1oTmqsko+A/L4jGmXGKEek6ySE4S+1
         4I0b1S5ALfGP/pSrL9xiuIH0e31oMLtOVINt62QzPR27AtRUJkZTqOf9cYeUQFU8hK45
         ffeyqjv+motaXkIS/3DrCUTZ7yNiImptPwmoHqCe07aPMk67bG+XQdVzbnNsLSuOWS+i
         GVjLHh36tYjnFmW07bGwxecd1HjW5rWI0U3j92RFWAwpzFxwn1mIHVyZJ4C/zJMsA8Od
         plfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375726; x=1746980526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndDhIW14pK8IkolQgEpyEOmdYP4fJJ6SOj1tajl/8JQ=;
        b=lrCmNELLT+yLFndSGMA+5VRpqKhOMknfJIPKcIf59bbmuENS/PD5Nm3Rl/D6MNk5bx
         Y4iPg9cHe+msk6aAUDimNF8B6ORRVnLSdlcvs61hUxaRoJJ3z317g6aIW6sYZV3lT/1O
         muJRaOOfLSS8G3eo8MvdI8DVXRV9rBI0U6oxUHiaI2/e0DXtPEFtAvEzB9HCNGQ9ox8B
         ABMLOj4Bp4Cn9y5b236VvWyhI2U58k6P5PDT0D5CkfdRrgc7lLD8JZi39it3RIq1QXNI
         klWTw1mpdG5TNPw3A/U67t7hDfB+YFT9j9RTQjsg7RHREW6L0zkIdCR1ObfrAdTc9Pna
         le8g==
X-Forwarded-Encrypted: i=1; AJvYcCUweY8Y1qHbNLCktZreSmgApGFu3/wcXEYLCaDZdlhbiWm6fvH9CLbz+z5bLG9muZhtxGd+XV8thRlHyw==@linaro.org
X-Gm-Message-State: AOJu0YypnEdhmTzFftyi4j9aLR3n3hKMUJYeUdp+IrGIOa/hE9mZ/diy
	FKN9KsN9ZlfZ9kyAvqD7lOgePlA13V/tNAsPW5oYlzf6NI0+dNxMfusUTNfVA1tsSA==
X-Gm-Gg: ASbGnct6fjLVrtigUg+F5T62bbabaSV5Ymbru9Lxeq1XMiHvx9AT6ZFtOZqvW58io7n
	thIghJOpIMHhB7O8W0WuM+oyDOkld46QQdGpBRiVr661kRkO5u4fhD8fBXax7u0X129J+Ttp6og
	muvbf+9mD/IS0bcGmvlt1UDWd5xbV258TmU1JwmomecgO0ugAFZ6931tEVNWElUEEhrMuyr+I14
	6Xc5JzY0ZkMToYwvGmJjVDPbh2Szm3ZkTwMRTmJq/bO/iELUDszCkiSuHHWiODoCQJ4pGAI0Li4
	WD9+pS3dP7fhBJnINrQGgDTpCklLTzLKM6rQjPQ/fEwYN/c9sGcud5Uhp3fO3yz/+QAzecFNQ/t
	jycNTK54=
X-Google-Smtp-Source: AGHT+IHVJPSMpIDvkRNVyiQSjsJkxQ58q8D2M+vHLwC2ekg+35/hzKUAXwGeniC9hDYK89dJmepvyQ==
X-Received: by 2002:a05:6a00:4409:b0:73b:71a9:a5ad with SMTP id d2e1a72fcca58-740673faa0bmr8590456b3a.16.1746375725859;
        Sun, 04 May 2025 09:22:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021090sm5039609b3a.116.2025.05.04.09.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 09:22:05 -0700 (PDT)
Message-ID: <2d9560be-1120-42f9-85db-69b8407c49b8@linaro.org>
Date: Sun, 4 May 2025 09:22:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 38/40] target/arm/machine: move cpu_post_load kvm bits
 to kvm_arm_cpu_post_load function
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-39-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250504052914.3525365-39-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5BZUKtGPW5EJ

On 5/3/25 22:29, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/kvm_arm.h |  4 +++-
>   target/arm/kvm.c     | 13 ++++++++++++-
>   target/arm/machine.c |  8 +-------
>   3 files changed, 16 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index d156c790b66..00fc82db711 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -83,8 +83,10 @@ void kvm_arm_cpu_pre_save(ARMCPU *cpu);
>    * @cpu: ARMCPU
>    *
>    * Called from cpu_post_load() to update KVM CPU state from the cpreg list.
> + *
> + * Returns: true on success, or false if write_list_to_kvmstate failed.
>    */
> -void kvm_arm_cpu_post_load(ARMCPU *cpu);
> +bool kvm_arm_cpu_post_load(ARMCPU *cpu);
>   
>   /**
>    * kvm_arm_reset_vcpu:
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 8f68aa10298..8132f2345c5 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -977,13 +977,24 @@ void kvm_arm_cpu_pre_save(ARMCPU *cpu)
>       }
>   }
>   
> -void kvm_arm_cpu_post_load(ARMCPU *cpu)
> +bool kvm_arm_cpu_post_load(ARMCPU *cpu)
>   {
> +    if (!write_list_to_kvmstate(cpu, KVM_PUT_FULL_STATE)) {
> +        return false;
> +    }
> +    /* Note that it's OK for the TCG side not to know about
> +     * every register in the list; KVM is authoritative if
> +     * we're using it.
> +     */
> +    write_list_to_cpustate(cpu);
> +
>       /* KVM virtual time adjustment */
>       if (cpu->kvm_adjvtime) {
>           cpu->kvm_vtime = *kvm_arm_get_cpreg_ptr(cpu, KVM_REG_ARM_TIMER_CNT);
>           cpu->kvm_vtime_dirty = true;
>       }
> +
> +    return true;
>   }
>   
>   void kvm_arm_reset_vcpu(ARMCPU *cpu)
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 868246a98c0..e442d485241 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -976,15 +976,9 @@ static int cpu_post_load(void *opaque, int version_id)
>       }
>   
>       if (kvm_enabled()) {
> -        if (!write_list_to_kvmstate(cpu, KVM_PUT_FULL_STATE)) {
> +        if (!kvm_arm_cpu_post_load(cpu)) {
>               return -1;
>           }
> -        /* Note that it's OK for the TCG side not to know about
> -         * every register in the list; KVM is authoritative if
> -         * we're using it.
> -         */
> -        write_list_to_cpustate(cpu);
> -        kvm_arm_cpu_post_load(cpu);
>       } else {
>           if (!write_list_to_cpustate(cpu)) {
>               return -1;
