Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp470138njj;
        Thu, 1 May 2025 14:14:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPa8RWBrHeSenjUqvNZXVK6jOuig/YlQlcsVBKjyYJuhlaQp7ozNDkI3OX1+wpZ94CkJ3PtSiDa4nA1g==@linaro.org
X-Received: by 2002:a17:902:d4c6:b0:223:f408:c3dc with SMTP id d9443c01a7336-22e10311444mr7183285ad.9.1746134061331;
        Thu, 01 May 2025 14:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746134061; cv=none;
        d=google.com; s=arc-20240605;
        b=F2W3opYUy4O1twC33rPmAWEzcqg9vgmWDP9HKAmXu7w3L0hTf6JTxABdOXEaPQ6mB/
         NIjtg8/5/6VaecvrJWpL+FxevcsIcs6mTeyzyr3lQllM6VONbb8oR6ouNBeBddJBZDcZ
         b+HDD7N8/7P+GrkZZtcWlwEiTo6Sk+HCx2T1BgLzXzriHFuJ0y1yF+DxubqPgDLuXNzc
         RXCdhuLByOfPQCZ1VvGuhaIk7lJiT0PAKTJ7sWgl/iNdEuci/eIXblbagMG+SavmC7bR
         Y/do6dkLGEUkn5uhsKXbuApn3ZiI7hpQaGuWYhaQ3ouVtcXJKtR5CrDw4ItVs1Pfh8fd
         9dPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IjAzNRLbOrsoMtq/EPdzdknnHjpmqyE7LPvsWSwmdj8=;
        fh=yWD8C0ADWJPOtekxUAnbthGfiv2RAgVSmQmwaEYSaOM=;
        b=P4ozKcRd9f2dwHdFTZoygfo2s2kSBhlUcY627anT0M0cP9mMjdzpbM7cHApKy5dpOv
         ZeODWGe/mgY8Bn4FgxH2HtqInaN00Wr++i31dL48GBbkclMeydCrDcxpkv5bfpGmZwgR
         oE1HkF7O41Jrem7zVT5fFSmwetQ0UysHOkKudFuAeszAOV0IzwQXahpAvv8dOMAEDHZu
         FR3/rX60hdihvN6q7rMfxRJbxchzcUotYAs9W/cOakhTa2+a2tA6KeGXevJq8Ynr3Nnm
         dDiFpwAs9/uAc6db9S+QMWnsDIdNJGVrGE9IK8JVKrgNFQbzWcXG/gL71/fixsjX4nHE
         DR8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XWoRIN/R";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb19364sor12838725ad.4.2025.05.01.14.14.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 14:14:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XWoRIN/R";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746134061; x=1746738861; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjAzNRLbOrsoMtq/EPdzdknnHjpmqyE7LPvsWSwmdj8=;
        b=XWoRIN/Rjp9rlix9qGrH5kOSZhoIyWAWOkNTkOZ3SbmxJ7Y/MuZpER0/pE3N7dIpYj
         2HjGZXPjktVNJ8zsb0MKLHYqRiH09OpJIi2Ylsp4nPlyE4EN9vVNneadEgB1/8pBnhSS
         iA/iNrkQPrwSvH+r5fSL/a2h1iPY62briDs/+e55NFOMvIdMMCTlhuNtCqA6Fz/9fmo2
         RVwJg0rxhw4G6J5acp+7AnAJoxFGDMSOOofLcIyuFv50oaLBCL7iYuKAkc2Lip8AS0Ne
         wBrTMcD217RT7w981iPd3AgnHQ9pLYgzxO5LHZrRJZ+DyRe+AJsNcgD7dcwAbfK8K8IL
         gBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746134061; x=1746738861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjAzNRLbOrsoMtq/EPdzdknnHjpmqyE7LPvsWSwmdj8=;
        b=HpAC1lVpCKAk5yOSbuKDEsLjoxdBTsoh5fhp9GmwE1uA7goJsHOMzme/iS9slOFTwA
         +DpoKyZPzsanJ0At1ydFB+Io6IwBCUZTPUQ+mOOJsuqT3uvQMUaHfUM1EDk1CC2cWlX2
         B3vT+MjUa+oyEVPNV8qB1VJxnj3mWAxHuhKgT5Ky1D9EVZoOO/a4inKon7+8NFg44zeO
         N02wbWKKHxrdC3VVFxkVQQcEJ9FeYx7JITUU94vlYkBCi5kr3+bgW2oLuIlytWVazT8I
         0GkCUnEOPMWWQC3wjHi+y86jTji9xaUkVANWyll+6mdPy3zfcLxSeNy0aj8FZRaNtHoH
         4Fzg==
X-Forwarded-Encrypted: i=1; AJvYcCWKpOsEGK0BrSSKF+c+9R7PjHVs6Buwqieo/MjhysgpoDWZ4YWXYJAsf+76rL+QczSOddnz+YutjdBS4A==@linaro.org
X-Gm-Message-State: AOJu0YytgBeVYAPfm9v89Bg9ex9d2ajhmPyaXHDR+h3psJmbhyQLKUUo
	BzfS3WKTFKRRXYtBYXiu5qIq70mWWKi8a6tXbOSTQt2vIB61UVFhoFwaYGsW67g1cA==
X-Gm-Gg: ASbGncskPZltO6609bQfeU7EFoCNiHneD36JFPciCoV6fn6EF89WGvY51Htt1FiYm/A
	/jvwuiS0pq3Bmo0aHzPeEaKLJ4UV4zzTW6mtIw+pr+jhNFs/n3KlQ30d7v5S7OcBj7d0cEzE2lu
	wNA6MEdrXnr4ku/PXQgGMZ137nDefUd5uYFiP437XRL4eJM6u0QUw38jVL+SK6CPTlMStI8Ryj9
	U5zHyZbm+xD47DNBSE5abgbwydXdYKBSlOfGDxqDD0wxRzdznesy88YNijVx+HttLw42k8UEVxc
	2xZiiJ7xmq+1dt4MytlM0nrMQSbavw839RFkLOEOdT3YeEj5f8kl0jPjVIrcyNwLWlu8jiGTMq5
	LNmKxBlY=
X-Google-Smtp-Source: AGHT+IHrnRruNGSrJshHmWNz0Xu2ccGJ1f+1U8k2VE3mc5qFlXIZViS2LGp1pbaM8OTkQ1Dqx2jCgg==
X-Received: by 2002:a17:903:2f91:b0:223:90ec:80f0 with SMTP id d9443c01a7336-22e10344ebamr9025215ad.22.1746134060854;
        Thu, 01 May 2025 14:14:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1091702asm819235ad.206.2025.05.01.14.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 14:14:20 -0700 (PDT)
Message-ID: <757f10a3-712b-44a0-9914-5b221e185a20@linaro.org>
Date: Thu, 1 May 2025 14:14:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/33] target/arm/ptw: replace target_ulong with
 uint64_t
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-30-pierrick.bouvier@linaro.org>
 <21d32a4f-8954-4a36-ba0d-6cb7a50f242d@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <21d32a4f-8954-4a36-ba0d-6cb7a50f242d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GQv6f8okaHwZ

On 5/1/25 12:35, Philippe Mathieu-Daudé wrote:
> On 1/5/25 08:23, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   target/arm/ptw.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index d0a53d0987f..424d1b54275 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -1660,7 +1660,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>>       uint64_t ttbr;
>>       hwaddr descaddr, indexmask, indexmask_grainsize;
>>       uint32_t tableattrs;
>> -    target_ulong page_size;
>> +    uint64_t page_size;
> 
> Alternatively size_t.

No, this is not related to the size of any host-side object.

Bear in mind this particular page_size is used for the sizes of the intermediate page 
table levels.  So, at the very top level of the page table walk this will be quite large.



r~
