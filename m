Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1641337njj;
        Sat, 3 May 2025 14:54:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdhllRMM8byXj8zCjuOklbpYIjbFcF1cLTVs6gXTXMoJvTOgNRILneWfkfnGhbbTyxu1WJYnNXvWIgjA==@linaro.org
X-Received: by 2002:a17:903:3baf:b0:224:1579:5e8e with SMTP id d9443c01a7336-22e102b846bmr114892575ad.1.1746309287118;
        Sat, 03 May 2025 14:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746309287; cv=none;
        d=google.com; s=arc-20240605;
        b=XEFJODVozADENi9g62hZx4r1A7csqr/wccsWTt/Hd8rVkvKS9+MrbPMsgdiukesa5F
         NgpvEAOdXXg0KYn3kQjXSwhYrd9e7acSJcyPqQA7jbn1R5cpdvnsSfwPNFEYkzqXDrBZ
         n9r7HIF6eSdiumZl0j1ehf/JcF1Oeb3viS+t3hOjoixaThKXMJeeN5nC+hyQMZVZMOXu
         QYWfAbZDyJns07gcLFjfQO41jvOama3KETWBqduxr7Bye5V3NYdQeYOzrNzqgM7t9s58
         BJJ4OHWKzTFh+q7KuFzXExKm3q+hYJmDvjKVElDqOukxeCFEUM1gxphhurlc6XwmNIJ7
         82gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8egesxN17cqZ0dc6fp9Kc2LxbU+ZhDHFMjM3QWxIJTo=;
        fh=XY2P2g5XOKldlpy0U7EYh1hVz8etsw/F4F0tiEeDo0M=;
        b=UA49neESQxSl6Y2WwoJOoR60TF68IwB6LbTXMGHWXiTWa0BwAwJ9+ggSXr+r0TtquV
         g5BirmdhTD7vnjyABK8eCFXWMrWBIxAuDMTN+XQ2rgcmqDnDfsrsIfZqb6Z/1vGjmn9F
         kZTd6NLICwSc3PD0EavsHQVY/BJE5MD8jqB8ZsqDp82dd/5lT6dk/iHhHNnqnEYWQgGf
         Kv5B4tUZI5aX5gc0NsE78KQKJjmbCyaMGDfU0mvlcnXRAW647jPS3LAsYAWISZ6/JolI
         CH9tHOztKFYub0cWNPUUqWx2DV4GuQwEPwgyjbpmej46qJOwrHldznR8aa1wYhoJDHg/
         sX4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zeOsIE4k;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc7e606sor33135675ad.12.2025.05.03.14.54.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 14:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zeOsIE4k;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746309286; x=1746914086; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8egesxN17cqZ0dc6fp9Kc2LxbU+ZhDHFMjM3QWxIJTo=;
        b=zeOsIE4ke8du3LcOphlcFlvCXxkRrik4g/VhnhJuhkUKTkLkFwECDjNWTrzVHqRzrg
         XNpwaJxQNcAe+udJrEj95clgOPUz9B8c/ByBlp94oSmhuEHx4fewJ218edr00exqAH63
         jBliqiiwWI3P+WsnBJLidkWPVizv5u8iDJREpa5ZT/oeJ00r+ojOXPXuhbkEjso6UT8N
         JlI/ZbbX1cM/8i3g5uuKMfeZE3lGznmPxOQpebUMdrcPxqMJFMGc1gjPDdBWJLw1BpaV
         CaEm0hCvk6CADAhPUGq0xf2gx7yQGc0oe9qhkOOEaeSSjt+xnRSNOpRruTy+9H89LWp2
         ke4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746309286; x=1746914086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8egesxN17cqZ0dc6fp9Kc2LxbU+ZhDHFMjM3QWxIJTo=;
        b=GkC8xbCvVIS1/DvXsggkyRpbVS6YT15/QJDIRnjzZVKOkTmhf0kNnW+Ug1uKfIDw4E
         Rb9hl/08uDd7w3uK6cAEDGTQSxRTrDqYVx66k6nm0cFTj12h29040dfxAaPBqvmIhjgs
         8FA3CB/Y9WxvHyyL5aVEbDdJly7RU6VC0PD2U/NSES6AM89Y4+7cA4co7JVIPf4Z13CU
         8eW6DNhz3zSN7FzN0CdnxjrDsTWk2zEMWFT9c8o8M0ZN1BlzFJqqcXcSBh1ysDHZS8EM
         DbUtPsXNHwKNFqCIoSwLhotVIVOFox+xJn3p09ickuUOllJfFIDcaWRFrSx+ZjNF42ux
         hNTw==
X-Forwarded-Encrypted: i=1; AJvYcCXnENAEjsVtvq6o3btbpGPoAUxC54RO0YIkYHvtHxnmzUBjlfcfsZWMjiTlgqewpfsABUf5VH3If3N1PQ==@linaro.org
X-Gm-Message-State: AOJu0YyeV0ZZ7tap0L2NPX0SPh/T+FirlNd/gFk9lWMaNAi2hsSi1Q1a
	v5/VcpAhKPfyEi4IVZzjmUMcz13cMwtC6usFHUZirb+ML+q7YLtDRvJxyuYJSlyQmg==
X-Gm-Gg: ASbGncsb/mRR8FarAtIhmXJTVASHn26J/ddEmE8bhSGTAXrZLDIupeIR17Xjru5SqOD
	ne1enqEjnSTDbCsltAK1dzJ/eKw/oFGVXzb9it1tEm9kEq9HjFHmSyE/AzTNPCfOgBYFSp+4ui4
	p6l+b9c6kEJo/Orwq6/vf0cpeOn4LOnoh7YqpVyrRCo5r32ieYnXpTN4wBSPUitj6WQFNcjBLf6
	4OyV7sxAyTS3PO6qAn6BMh0zxeHu3PUJL40jTbyLGKppzgOvZTyB9xdmcP2TwtBQFEUQtIoRmLg
	QfJuOedTMs4ho0FW2lOPG7tedR53T/48eRmiH6UPtM751lmKm/rnYw==
X-Google-Smtp-Source: AGHT+IHqUyTV2oPY7FFs0inwI6ot7R54RcFhDq+LlJmRZ42OcG4Hr0D1+iatFhY+CtsMiQhL5RHdqg==
X-Received: by 2002:a17:902:f70e:b0:226:3781:379d with SMTP id d9443c01a7336-22e10353e7cmr118719275ad.33.1746309286678;
        Sat, 03 May 2025 14:54:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fc49sm28331845ad.134.2025.05.03.14.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 14:54:46 -0700 (PDT)
Message-ID: <561ee7fc-a288-4fae-93ef-086af8857fd5@linaro.org>
Date: Sat, 3 May 2025 14:54:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/33] target/arm/helper: use i64 for
 exception_pc_alignment
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-14-pierrick.bouvier@linaro.org>
 <1844146d-18cd-42c7-a095-6d1b64ad6293@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <1844146d-18cd-42c7-a095-6d1b64ad6293@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 5NyDk5fGnSCW

On 5/1/25 9:30 AM, Richard Henderson wrote:
> On 4/30/25 23:23, Pierrick Bouvier wrote:
>> --- a/target/arm/helper.h
>> +++ b/target/arm/helper.h
>> @@ -49,7 +49,7 @@ DEF_HELPER_3(exception_with_syndrome, noreturn, env, i32, i32)
>>    DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
>>    DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
>>    DEF_HELPER_2(exception_swstep, noreturn, env, i32)
>> -DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
>> +DEF_HELPER_2(exception_pc_alignment, noreturn, env, i64)
>>    DEF_HELPER_1(setend, void, env)
>>    DEF_HELPER_2(wfi, void, env, i32)
>>    DEF_HELPER_1(wfe, void, env)
>> diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
>> index 8841f039bc6..943b8438fc7 100644
>> --- a/target/arm/tcg/tlb_helper.c
>> +++ b/target/arm/tcg/tlb_helper.c
>> @@ -277,7 +277,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>>        arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
>>    }
>>    
>> -void helper_exception_pc_alignment(CPUARMState *env, target_ulong pc)
>> +void helper_exception_pc_alignment(CPUARMState *env, uint64_t pc)
>>    {
>>        ARMMMUFaultInfo fi = { .type = ARMFault_Alignment };
>>        int target_el = exception_target_el(env);
> 
> I think for this and the next patch, it would be worth extending
> include/exec/helper-head.h.inc and include/tcg/ to allow vaddr.
>

Ok, I'll add it.

> 
> r~
