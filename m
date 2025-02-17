Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp256465njb;
        Mon, 17 Feb 2025 11:28:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwh7rh6BEm7L4Q7T/Icg9UNDnBIxa3CjXIOJDxtbEg4iCRvejj3FyeOIkO4blJPbF2a/rIOlmVFQtf+A==@linaro.org
X-Received: by 2002:a05:6a21:9999:b0:1ee:66f6:87e6 with SMTP id adf61e73a8af0-1ee8cbbba1amr19535377637.31.1739820522655;
        Mon, 17 Feb 2025 11:28:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739820522; cv=none;
        d=google.com; s=arc-20240605;
        b=ZiXfZS4EJLLHxW0uISvBU9tT43DPEToWLVRPQSRVj31nkXhCF6dfIuMb8Px3EtfuEl
         DT+rlFodo91254WwLzUHuucfBLOi2Of+fTnOxTrzkP8Hnc8z3h59r2xcZwOxlKSjsJGR
         ywKdaCGpZ9NTyNsBeXIH4gfqjazNBapOBnmK9QS/FDl2D1hLEm24MITgT/NRXoTcqRIk
         q7h9zDYwCQr3Qosg2qizLeeTXnUJypB5pgJn4d0oWvpEB6lKXAGv6nTKukhv4bk68TSQ
         cMSiaRX4mbFCWYsFzirgZ4i/0VMnDcIG+IVetYSgUh+OfqxNBrbpQVgkPxF4a+UTHooU
         VeiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VEJ/B3GBCyQg1NZ8srPFvpNFWpxr50mPaKhI69Ppxgo=;
        fh=iYlOkC5AjwAJ0mVitG32CPvQhLbmhkk1mlUR2HiWX4g=;
        b=VWOMsJYO9xOgFxdvyRJLFoflpI36ceLaNj7TsJpvYURVsfHL1wJjqvS4RGedetVCqn
         JNtr90efSrUQZ99bG0gZQSjqjb8jfcEd48M27WkLLhpT9VN10K4PL7WVrb7yU5XBKE9X
         KNznoDVK7KMZka15Hk7RlEcbPGXtw7f4LO/OUT+ofS6C8cAjVmf9UPSDJafKo9BmF+2k
         O86JTLi6W9gaYORKxd6wl5BrKsou+/tANEkSEOqCJzEv++rIOu6ekFp9T+YsacauegPf
         lJ28jn0zODOx255ZZHFsgSVU8H4itIj/8Yjl35R+5VZVomefuW83DQDWy5kI29L++Ywo
         bjBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I968RVnt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73242459d50sor9638392b3a.0.2025.02.17.11.28.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 11:28:42 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I968RVnt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739820522; x=1740425322; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VEJ/B3GBCyQg1NZ8srPFvpNFWpxr50mPaKhI69Ppxgo=;
        b=I968RVntCWaQUg87Q/yi4XdlVdV/b2h1bUy+s/UvAfW8fYjRcd83RCLiPwToXnqKDB
         xcwFZPF/VcEoovUW5EDHrvWABxrGXAPt4mZKuzAvLXv4/vS6LoHVazA17HXLEEHzsyUO
         L+wssR5VkBk6QO0wZjnUJZtX83eMZbnJmwvKQnqxErX7+ZO/npXJ1EmnIXonPBFt21gn
         8eF5xnc70BXpVRVL73nYPjAHYgwt6JRD95fen8VlZwUzcKdmFmL8PYdZH/ExXKIGzRdG
         n0pj1F3EBlgubC1o8YXGm+V8fU8z1Ic/IuCrWk6mZMqbzvHKQnPIjnRl1ZOfk5Qextqz
         rcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820522; x=1740425322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEJ/B3GBCyQg1NZ8srPFvpNFWpxr50mPaKhI69Ppxgo=;
        b=ETO8YUeA0XLTqck6aNOgqpf6qeGwWhfkKGMeGLdTNtT9L1DZzhQgmTCrPvNFvoovfz
         GvDLg8W2woeImOOHltCwRC85psa7uLvjVVYpGKl4psdl/rFDf2XaqFcFQFIGJyJOLs1G
         Xlu3f5VlxRXt2YSkORCWQo5fTgPp6CvjJ9wTIZowNSD/f/XLVyupCJyy62sEbHj9dkDy
         2EySQT4osaIC60iPeJxmufc2vnHHBMBHMGNWcojXQIhPko2J26bI7BgTnYWOkTMyB94p
         cErnHjk2o13TfHDMq21WN1cvXzDn3mJD+5Ably4vJtnM2cd8WAd1ZcI8fG07pipsqRwC
         uBSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9doqsDh9tRLO75VqE9469tcpS7ORP4trtJgXzbqWROQGuHYeSt3qch33l82mBR9ItMFTiepV6KDhD6A==@linaro.org
X-Gm-Message-State: AOJu0Yz9gSseRpV0x7UiElEa0Y6Lnvx+VZLfaZvaZNsrHaU/eUAGsZrp
	uS2XW7pdYV6rLGx07CbJ5VgqbYlQ2mPHpkeGcsXoJtz62D2SmPcPcXUS+L5xgOuxdQ==
X-Gm-Gg: ASbGncvcnOTaTK+6BKUo8GTEMpyYGlcR7zwGYTkb296FNUR/d9dIqULGL5mtUEvP26b
	GjqehScoHsAX716HHAoVl4VQmCPtVg6BHGjhg8pstssx+3umLfJsP64uA2erL1PUozvjbiKV/c7
	f3nUCojJMZAaMy+AdHEojs08BdeppEgmzxnulBe48V056b9wWyRT2gEiyWJeTnQrFt7HhNrSIW/
	BkTIFty9xe8yODdRDfCJcIxQIz9rNrDsCmUqjBreILh/khmIZj5dEMhRsTTfqoKFVSLUtsqZGUf
	xfcvTcGeA9EYqBg9naI51bzBCERR3hDjGUTiMsJjdkz5M3qYxrslOhs=
X-Google-Smtp-Source: AGHT+IFw9x3ddCLNhBbl16dPCQzotblc4ykNeeWquQsvMRT1NjsLlII2PlFLuCRaJQswwJsL3MPGMA==
X-Received: by 2002:a05:6a00:2e08:b0:730:74f8:25c1 with SMTP id d2e1a72fcca58-732618c0351mr14386201b3a.15.1739820521870;
        Mon, 17 Feb 2025 11:28:41 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242568a0dsm8436448b3a.43.2025.02.17.11.28.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 11:28:41 -0800 (PST)
Message-ID: <3cf6d45b-0d0e-4669-954f-a545f3ec1a37@linaro.org>
Date: Mon, 17 Feb 2025 11:28:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] cpus: Restrict cpu_common_post_load() code to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-17-philmd@linaro.org>
 <e52485c5-122a-4a95-928f-08fcd17cd772@linaro.org>
 <a8be34a4-c157-4a5f-99bc-50c87c1330b1@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a8be34a4-c157-4a5f-99bc-50c87c1330b1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DHOoMYq78T/5

On 2/17/25 09:19, Philippe Mathieu-Daudé wrote:
> On 26/1/25 22:16, Richard Henderson wrote:
>> On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
>>> CPU_INTERRUPT_EXIT was removed in commit 3098dba01c7
>>> ("Use a dedicated function to request exit from execution
>>> loop"), tlb_flush() and tb_flush() are related to TCG
>>> accelerator.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   cpu-target.c | 33 +++++++++++++++++++--------------
>>>   1 file changed, 19 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/cpu-target.c b/cpu-target.c
>>> index a2999e7c3c0..c05ef1ff096 100644
>>> --- a/cpu-target.c
>>> +++ b/cpu-target.c
>>> @@ -45,22 +45,27 @@
>>>   #ifndef CONFIG_USER_ONLY
>>>   static int cpu_common_post_load(void *opaque, int version_id)
>>>   {
>>> -    CPUState *cpu = opaque;
>>> +#ifdef CONFIG_TCG
>>> +    if (tcg_enabled()) {
>>
>> Why do you need both ifdef and tcg_enabled()?  I would have thought just tcg_enabled().
>>
>> Are there declarations that are (unnecessarily?) protected?
> 
> No, you are right, tcg_enabled() is sufficient, I don't remember why
> I added the #ifdef.
> 
> Could I include your R-b tag without the #ifdef lines?

Yes.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
