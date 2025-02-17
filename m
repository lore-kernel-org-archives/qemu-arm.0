Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp183896njb;
        Mon, 17 Feb 2025 09:19:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNPwzGCVBJ73k054JhQH4kmtBRsqv17KvGZJ0lHnL3LlkZ3RowV5mCs0rIGoRxBf9aZQrprTjKtHKaHg==@linaro.org
X-Received: by 2002:a05:600c:4a18:b0:439:5b03:586d with SMTP id 5b1f17b1804b1-43960bd4e04mr196523255e9.8.1739812793275;
        Mon, 17 Feb 2025 09:19:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739812793; cv=none;
        d=google.com; s=arc-20240605;
        b=MfkkNt0FfJA9s2xG+UjagqjZlxNLkyWYg8jGUQsCwIPmPv7vVJe7NTeDAOdkfReztl
         8YIKJp9CCBnVFEZzH6YXSYVKsiJEczoc0fxuVzIWoL2r0tUJmAlTgGASRNbWIulQe2UF
         EJTIf2c4kbbIaeON7J73AelCI4R5k2bKm2lnq4do6RwOOEXc1YgTmos/e6k3hs1hRoJf
         zNNbCbEgO9/neVFZx0q8n5T7KzH1tHwq1mwVGF/dhuvep6fevmdfFMdxQNU0nPipMT/x
         gjr8Qbfhxq73T9A53oxAWQJDM3RXFNOlXIOXmfm0iOYFFRwtYNIWaU0QkSt/Y6MmaXeF
         0S0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iQ6iKHAl4GiTXceekAQxS3dDYx6wGvfJgfBKoYsDbfU=;
        fh=a8/iz6LfR0I0GaS71p1iNdX3f+fxeWRqZut9WDzu32A=;
        b=ivU/oqPUzh+9aJa30hWJJywVBOhk8TBrTQD23oIz+8cpRqqzWh5ngqDC2VmIF5Qfci
         qypPWFKNpYNJLXCOm5Ubba5GZvJaMvkechbbOrlnKORG4X8eBsinoGX9ecxLBTPihmRT
         JIsY5GutTIbMqrjaRVsYqYO6OdreSksA8uhwT9R0NyAojhMFEgW880ncenEDSatJoRBX
         5FvlDNjZ38ABEcaiu8Y7SKXHtaEChQp0KOgOuY1GZGbmFulU2FxHcARwPsS1BMbrcqbz
         Q4q0TbjCU9esyrrymuXBBcRaFdO5arvxc+sC5gmQXcQpOKjC7C3uK7xbZ3y7U1xbOf4R
         zfjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x48ybCB4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439804522e4sor8444475e9.1.2025.02.17.09.19.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 09:19:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x48ybCB4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739812793; x=1740417593; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ6iKHAl4GiTXceekAQxS3dDYx6wGvfJgfBKoYsDbfU=;
        b=x48ybCB41XLzqcK+1bun8juW1YF5rd5nX0gxsU7iMubM5Sl8uBEhyXHUUuTuoyf1N/
         4ofLGiL2KBdToZ8j16aGOwzperRdJXuriKYfyZjpwNhMB8XvDsqmglmKGQw4QYA3j545
         iPs2ZXTPKAkMXPHTjtqSSGxl5FQ289u4lTKfcWgYc9WXRMSWovKSumjE3mB0121EcRei
         6/E4XpokEyjyTubOl3oJQYFsnNXV5x7WB9hytzww+UH7Ab12osLNoPFIWfR4W/DH62Xn
         N8yv1w/L2C55CJWNMmvqgyOxEFZ4HYcQEKMYqjvjvkpcLqht4v+02WoCh3B2kDQgP7n6
         AVJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739812793; x=1740417593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ6iKHAl4GiTXceekAQxS3dDYx6wGvfJgfBKoYsDbfU=;
        b=wiQoFhdOboGkWjd+6KliR195kSkzbQV67KLawGLotd6iIOsEgZKfUBEVdEnCGb8qBa
         s+pmp2ekniTn1dIOxZZZp8UUFPD1m18NA+TOZpARqVRjMcVDOL9WHEJB3SkCh0rnOpkd
         VNUvoM6wzK3qlCNpaaX1lbYmt7r99Gg4HNoAi8MEhyXl0bRzTci4A7B5UjoVfXGGaBal
         mnYsBp4THzUYR8Obphak1rug+zAyK+Ag+WJGh7u/h4923NQ4RUgP8ZWXVM9fVzPDotAs
         fhkUHC8APKF084PQ5KQRV94X7WlZ9B4jNYjQ7iUN85tPWvBZomj7N2SEzjZKtgCRSEcE
         Oh8g==
X-Forwarded-Encrypted: i=1; AJvYcCWnKcLxwzAK3VcbgICjvK9sjcf83NnkAy4aSr19p/IzxRuoXDTwWTqthel/A9NmLe9y1+ImRMbU4Su59A==@linaro.org
X-Gm-Message-State: AOJu0YyluSvlWJ4fyPtjRw91+yubkBvUSET0pu5x+uBoDf2pW+CZqaV7
	E5rcRZZOsDNLNha3/s/n1a6qt0Q60WxCkEHmwDCIKzJ5fKCtCXXVyJt9s7afbU5KmQ==
X-Gm-Gg: ASbGncsYcciES3j1jGqoKXygcNzqZ5f3EFKankc+9hWuED1JJ+4QaQwvrtDe8x2x5dF
	wmLylXNTSGweN5l6Fzb2aBhji+bo9uanw8PZqtHVclPPdq/YtOsu2d8/bvRgiPgTVdRXuSdgQ0i
	dtz0atmdAuhYjV2xt/mmhz93BtqJe6qUcdEH3FJdhtMtvPidXrYkYM5NSXW7N1wMflB84w9Iy1Y
	FyXq9UoLKPKE3fSJ6lGtllKhjoISqQooZvFVapkxPDwLDhmDK3IfXCjSkh10y7/DIDSdvYcgqHt
	zWO9K67L1PKd0bN2lZLY7meu/LYN0Q==
X-Google-Smtp-Source: AGHT+IEgo1pk8uQGUSG6ebpaxNPekQ6qVjpVo6fgVMW/kIFnegEFZYxMbxaDbrxa4QtPRDs+dN9QbQ==
X-Received: by 2002:a05:600c:3396:b0:439:8439:de7e with SMTP id 5b1f17b1804b1-4398439dfdamr42175065e9.15.1739812792683;
        Mon, 17 Feb 2025 09:19:52 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.121] ([176.167.144.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b83a3sm157295295e9.33.2025.02.17.09.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 09:19:51 -0800 (PST)
Message-ID: <a8be34a4-c157-4a5f-99bc-50c87c1330b1@linaro.org>
Date: Mon, 17 Feb 2025 18:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] cpus: Restrict cpu_common_post_load() code to TCG
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-17-philmd@linaro.org>
 <e52485c5-122a-4a95-928f-08fcd17cd772@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e52485c5-122a-4a95-928f-08fcd17cd772@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ayz3ZEsyfBAz

On 26/1/25 22:16, Richard Henderson wrote:
> On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
>> CPU_INTERRUPT_EXIT was removed in commit 3098dba01c7
>> ("Use a dedicated function to request exit from execution
>> loop"), tlb_flush() and tb_flush() are related to TCG
>> accelerator.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   cpu-target.c | 33 +++++++++++++++++++--------------
>>   1 file changed, 19 insertions(+), 14 deletions(-)
>>
>> diff --git a/cpu-target.c b/cpu-target.c
>> index a2999e7c3c0..c05ef1ff096 100644
>> --- a/cpu-target.c
>> +++ b/cpu-target.c
>> @@ -45,22 +45,27 @@
>>   #ifndef CONFIG_USER_ONLY
>>   static int cpu_common_post_load(void *opaque, int version_id)
>>   {
>> -    CPUState *cpu = opaque;
>> +#ifdef CONFIG_TCG
>> +    if (tcg_enabled()) {
> 
> Why do you need both ifdef and tcg_enabled()?  I would have thought just 
> tcg_enabled().
> 
> Are there declarations that are (unnecessarily?) protected?

No, you are right, tcg_enabled() is sufficient, I don't remember why
I added the #ifdef.

Could I include your R-b tag without the #ifdef lines?
