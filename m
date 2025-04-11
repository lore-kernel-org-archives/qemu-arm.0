Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp452677njc;
        Fri, 11 Apr 2025 06:44:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYgusPI13f2CAUXHjLXkhChK6JVQnVmY0sDlRxRGKj3ctxVgGj+4LHXGQbqZH9EuSAmwSWgbHtFN0Vxw==@linaro.org
X-Received: by 2002:a05:600c:6d17:b0:43b:cb12:ba6d with SMTP id 5b1f17b1804b1-43f3c78596emr16544525e9.3.1744379043220;
        Fri, 11 Apr 2025 06:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744379043; cv=none;
        d=google.com; s=arc-20240605;
        b=HDaW9S2kgF3UmwE0jRStrs4o6pnGNubcCoUUNIjfwGmiexR9/W+24wNGmSc/DTXncY
         +H8AvJf0GKL9gld3EFOCiInf5CkvD1EXx3KI0Lq4IB65qtvuv6X28aX8T6rQ3SvMgk5e
         SMTiCpjXr6bov2ohDWxMIFDdfGa1RYC+CKJcqAWoP6uiKj/e5sDf2NF3HAXM8vHasEDX
         r5Ci5VaohetxoUBLnfrOYxk9GB7SZLFQB3+DJhJqgmwVahm1rOLA0PEamFOmWmp9qIIp
         I09x7reKuH+EKPTgCKUwbWbgzSZMUQBU3WFD/REfsm/yZExRIu/0/58ZyAHuNJfxSeQf
         LJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7iRmonuEGTUhV8/bGZ8Qo3KPpwAcDNcdn86dEjX4NIk=;
        fh=NZ5+fD4o8h4uAbmKIRUgTuozDyGZdfB+dJFCyJKKyrQ=;
        b=Rga6jElyVICMZKmL0MBj7ZhyQEmvqfmQyRYlTrvehwNb0tLzUpDdPG562OxkBeNQ4C
         dw8ZucMXyAg9gjMAbG7eI6SgZsYIhtTGrwn7VZl1m2M6W+NXd8gtrvzFEqTLTM3gmwuF
         KFcAb8g1t/ZovJ+4SfnWnDDnJ55ep5ApAYTfnAdoL1/LYtjKRdX09upZf2UuYIUdQ/+r
         gC+2fUsh3g4je9i3lF38DpsAobItYfK84BFQauSAEOzc0AyGavPGdXzGbQ4aWhANgCfq
         QPEeSwGCuLF4udvFBKk42cQHH3Bfphx6SreCnIjjBOZeX7j1LPa27KV695BEY03un+3H
         UXTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GDQmMFUy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f2338f21dsor23164065e9.1.2025.04.11.06.44.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Apr 2025 06:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GDQmMFUy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744379043; x=1744983843; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iRmonuEGTUhV8/bGZ8Qo3KPpwAcDNcdn86dEjX4NIk=;
        b=GDQmMFUyi1Mdnxhs3nluAcjVcbkcL54123zCvhxGSearhwO+7RIZx9jgiioramQ//P
         cS1J7NTmCsIsJcbIOR6itLAu30ixs3F27P8g0+/yCmDoCYUjl4HJJPYAty0KgOe5oiFh
         J5zps9tRUtl+AL6EGkF6GklmEGksoX/HR0mZQxt/m8mApw8ZUwML7RPxFdH0DLEwylNf
         RsPWmfVUeFIbJsMjA047+JoR8JEgAJCBVtE7HDi+yKy1LQQyWcAluNjfTIroCIZST8io
         skPBI0H3W/cR6eFCSWaBtXHoMby73pkz2ysdC4Qe4EbCrUTzdSIk8TQgdKInNSFokvab
         kAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744379043; x=1744983843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iRmonuEGTUhV8/bGZ8Qo3KPpwAcDNcdn86dEjX4NIk=;
        b=qMHt12L/4c6G15LPFwjusSbRg4zqRF0nAhZ1h9/BYLg+J1VXxF2yTsbkw2aca7s5h9
         HYTyie9OzQX0e5Yjzioa0r61+c4vtIg/ieaTQv+OW2yODVz3f7kesh17hOYlS1Dycqcn
         3Kt1mr6zVhrlq9N6wTGAunQeiLUp4MrMjqpxESjXr6UxDbiom9Wqolnuqs7p1apD43I4
         GFsWM3cAoeHOzDhPrf+aWGnQSgOBYRm1xmtrh86lQVHGE8A8IaV7tU66MW2fV/q2bQ8j
         ODqR9MMtktf6AHehRU6lwJ7WF2KgtL2mIKD2rE3L/iCZAtlYsu4gBxJYZQkM1ZmQIDpK
         3+bA==
X-Forwarded-Encrypted: i=1; AJvYcCWhn3gnEHl4ycD29us0Trd080/l+24/OOIfL4Cs/DgewYgeU9t+yX+iedJGIDUe67lka5I49ptFoNcxMQ==@linaro.org
X-Gm-Message-State: AOJu0Yxg9tWkIQ1Cxf4RHl3X6t9npKcyBfwmXlH40UCBPfjZTll6UFN4
	/HTcoevE4Am+l/BsP4iXlf/maAlK2CHn4I6TnYt079GnjBULkddjF6WaCd3OREdVsg==
X-Gm-Gg: ASbGnct6OEwKTqsT0pz0GJOi5H4iR+tG7QzKvU/16m4JNPw8DdMBrqX5qMk2pCRHaYF
	urEq8xJuDsX7KdiCIJY8Rf8p9YgpiI7XHdPabudqBiCsqJKmLJ1h0to9CTUZ3JE6wrbLfgCFero
	P6bPK1ZgO+sGe/7XSTXkU9h4jDilfPifaKOtNCEVGIgoddqJEOybioKihgKhypocK8Lt78UsNwf
	MsF5A1nmLiWsSnWF1fIEvrG2XfU4upEBw/viTWlz3I2lyZEwzBtp6/4YpBVF7oKjUubEQhMzM90
	H0+dif1ubxwpoAkadTie4zqLratD0MsAmhEZReYnLu+edQx/bxfxb56DODe0VulcXISd9cD0apF
	I7Er7YEeJSFk0ig==
X-Google-Smtp-Source: AGHT+IFj/1ceJeohV+InU/4YA2J+yHDiWMSCg/+Ncbx37AgIArjFXc0h4jayyS0jv0c/IhYKT2JxsQ==
X-Received: by 2002:a05:600c:5026:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-43f3a9aee21mr27969505e9.30.1744379042697;
        Fri, 11 Apr 2025 06:44:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9797aasm2087507f8f.56.2025.04.11.06.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 06:44:02 -0700 (PDT)
Message-ID: <cea136fd-50a1-42be-98c6-e9550e85c1ed@linaro.org>
Date: Fri, 11 Apr 2025 15:44:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] target/arm/ptw: extract arm_mmu_idx_to_security_space
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org,
 qemu-arm@nongnu.org, Yannis Bolliger <yannis.bolliger@protonmail.com>
References: <20250410210022.809905-1-pierrick.bouvier@linaro.org>
 <20250410210022.809905-2-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250410210022.809905-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OYsdRQpGQrQo

On 10/4/25 23:00, Pierrick Bouvier wrote:
> We'll reuse this function later.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/ptw.c | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 8d4e9e07a94..5e196cfa955 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -3550,13 +3550,9 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
>                                  memop, result, fi);
>   }
>   
> -bool get_phys_addr(CPUARMState *env, vaddr address,
> -                   MMUAccessType access_type, MemOp memop, ARMMMUIdx mmu_idx,
> -                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
> +static ARMSecuritySpace arm_mmu_idx_to_security_space
> +(CPUARMState *env, ARMMMUIdx mmu_idx)

Style is:

static ARMSecuritySpace arm_mmu_idx_to_security_space(CPUARMState *env,
                                                       ARMMMUIdx mmu_idx)

or:

static ARMSecuritySpace
arm_mmu_idx_to_security_space(CPUARMState *env, ARMMMUIdx mmu_idx)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
