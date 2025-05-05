Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2667727njj;
        Mon, 5 May 2025 12:21:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2ghYrOBdqiblf9mC+kWv4+poQ2DDMeLpVrE/fJPGWK7bpeXCNhmR/TI+E9iEOsQMqgiGVB+IMfH3OnQ==@linaro.org
X-Received: by 2002:a17:903:f8b:b0:223:5379:5e4e with SMTP id d9443c01a7336-22e328a0876mr10509305ad.10.1746472886897;
        Mon, 05 May 2025 12:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746472886; cv=none;
        d=google.com; s=arc-20240605;
        b=JndXmW12Kj6hZHFtDcCQMQZHenkvN18h/IFOgVWZlZLNFerTlzL/6iLv+O5LuUx4lZ
         lZSz7txctcGM3CqsKhTGsAXYmgXJ2qeexU13R8vln6nR9rkv0y9f7IYqKvnZotYjpoDN
         ZwX7enapbJ5rsizTsiDFweak3ENWHDSQFpyiW5f9QdIwOcN8dmRtrxvamec04pAikLkY
         eNEmrVm6WVBSFsgpdpTGAn+vzYi1neORr+y79V9ZJhZDwUwarTMN5QmD5db0JJReneVe
         /Hu81KAwZA/84YNIt43GZ+0Lo1Njk4TO4YhmZTg8eiG+RxwYzB/gkkKycSGbxeISiPpb
         7mRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rKUeGEJlprcUuMRYQLCNcs8/KtlUslt/cF30WTx3Smg=;
        fh=ZD4IhVcAP0uup/xs/nwEEU22067o4VIqIJ8d1BK9qc0=;
        b=INPqIM+N8Xge8lqmSGP7U9cM9IK0mUNPmaLyt7pa33saI7fjLtM0wdcZ/3G8j+lGbm
         8m2IMDrbt1O3Pok6DQOJnourTo3nFm1slO/BHg1PfMi/TdXG+ZplYeC95L0ozeS9le9+
         j/mlNhJPDOG+B+AXL2zpoHM0PXtJuwSkvyqdwcGwggrrgEKntHQCtiEGIKlBeOjUImNa
         k1UU8AiaHP+0FAc/DDznzbLUFZPeqwLQ07UFfrGOWxKEFIWEOV9l0hfUXBHGdelMq/0z
         VjHQgVAw4yLWQi96uZSZK+wODIH0Zl/TtdJawAOdDzRfur9k0tph9EYF9kCb2qOKlKBI
         BJDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WuV7ULWF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb29167sor68883575ad.7.2025.05.05.12.21.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 12:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WuV7ULWF;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746472886; x=1747077686; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKUeGEJlprcUuMRYQLCNcs8/KtlUslt/cF30WTx3Smg=;
        b=WuV7ULWFd4C/cnl+dGCnPUANpreTV6BfdiIG1fGdfNT4DskEjlkOhQPljbNjyP/E1h
         kImWXGLaFuAD1ge5Y5ow4j3fHaDY/Egk9Nl8V0al9qH1L/JdCkA9437R5Xhfc/tnDaX9
         DLYrJPErmAMfcMpJdmVBURDwcYVLQpeqC2zuz0FXNMuS88Tj6yBgZYS+hG32jMVUefVT
         EHhjMFxtMwaNQGnKObji7jWhr8BJGnldQlI6aD96CCb0PIT+XhkYddqPbU6InjuTic6e
         L+3qhFht7G6lOjqzmHIYmPBzr4FqsSOTTEMspRuTtk2fhp89OOvci/+kM6N7mVFvyL9f
         pjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472886; x=1747077686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKUeGEJlprcUuMRYQLCNcs8/KtlUslt/cF30WTx3Smg=;
        b=s8zEvEaAHTRzF8aSNSk2AKIHJDA7aK4lzJQ5RPJ/PKitTCY7hp6sH1FzSR+6OnOQcI
         dsr+HKQG9LpTjj+KJeODptMX1RfNL3ry9/7LTZ5FRG/rCw9qg8Rt8mRik4P+q3uHHtMa
         cVNXba5YTSQZB6H7Kry2p9iscB6OpPa4TwiXjmZFdaMuShHq4NpBD/jEeBPH+hKnrdTN
         FWCc3BrJ6zWArRoiq/+TizHPOt8TkSLPqyuH48vk4b98Zz6nt13QMmDphtOHDm1fre85
         d99p/rw8FmwDs1of73FGncCpXIYkfBRMCmPyY1iFvmmkN81i9hEIIrntB+vqiqdDwfDr
         H83A==
X-Forwarded-Encrypted: i=1; AJvYcCWf19hHtb/JnycotZ0tll3iIRUwJEJI86b4K3bydtuWPu25od97zZHmGsW7enIIj4kGf/53Tk5Uw1h5fQ==@linaro.org
X-Gm-Message-State: AOJu0YydZBuMEhCEmhAEchPpIFFYcnHlafg5vDwEwufoioovbuvfheUk
	9pYRK2UBVfYflTszD8mM4WabXrXZCaXsXhlW6ERXwTQYINfZBlczxgR2y6O+pkOpxA==
X-Gm-Gg: ASbGncv5dufmfpryL28Fbl/arO3lHWnH5GTW4jG5kMabv71gGtrELD4mdV/zNj9MifF
	r37mhyaWLR78/1de5FsJuL18ch6ttGdyiLsJyP/5ZgH5iqleQKSLVTNK6oYo/EekPxiqMxWm4ND
	zLB/TosfTj8eWo/o2suUtk1Fcm+UoyTpEopp2ewDteOWwfxdKmJhxim2PB4V+2uL9AoiVmQPx9W
	rVZLIIRVuOzv/s3ByqZxCItBcTD9b1BbBaua5AxNMklaiJhohvBdSYMXrijlwTkDY+0ZRpA+yVx
	DjOaiw0Y/jrGDeZhl6KPnPD8l7J3yIg/zhmU3NMdbuBWrrEu910wcg==
X-Google-Smtp-Source: AGHT+IEU3LO3BLYHgDWrtN9CLYWTq6t5MCfWL98ImCZ5M7qGwidnZY2CVsEvZfUEZd+rLsDHEoZTxw==
X-Received: by 2002:a17:902:ecc3:b0:223:5c33:56a8 with SMTP id d9443c01a7336-22e32eeea95mr8802935ad.35.1746472886426;
        Mon, 05 May 2025 12:21:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e363a1aa1sm648655ad.194.2025.05.05.12.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 12:21:25 -0700 (PDT)
Message-ID: <afa68161-39cf-4d3b-96b9-9c20d3a3f732@linaro.org>
Date: Mon, 5 May 2025 12:21:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 44/48] target/arm/tcg/neon_helper: compile file twice
 (system, user)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-45-pierrick.bouvier@linaro.org>
 <7ff2dff3-20dd-4144-8905-149f30f665b1@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <7ff2dff3-20dd-4144-8905-149f30f665b1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lcEUCTV3byXR

On 5/5/25 11:44 AM, Richard Henderson wrote:
> On 5/4/25 18:52, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/tcg/neon_helper.c | 4 +++-
>>    target/arm/tcg/meson.build   | 3 ++-
>>    2 files changed, 5 insertions(+), 2 deletions(-)
> 
> Likewise, I think this could be built once.
> 

needs access to env->vfp.qc[0], so pulls cpu.h.

> 
> r~
> 
>>
>> diff --git a/target/arm/tcg/neon_helper.c b/target/arm/tcg/neon_helper.c
>> index e2cc7cf4ee6..2cc8241f1e4 100644
>> --- a/target/arm/tcg/neon_helper.c
>> +++ b/target/arm/tcg/neon_helper.c
>> @@ -9,11 +9,13 @@
>>    
>>    #include "qemu/osdep.h"
>>    #include "cpu.h"
>> -#include "exec/helper-proto.h"
>>    #include "tcg/tcg-gvec-desc.h"
>>    #include "fpu/softfloat.h"
>>    #include "vec_internal.h"
>>    
>> +#define HELPER_H "tcg/helper.h"
>> +#include "exec/helper-proto.h.inc"
>> +
>>    #define SIGNBIT (uint32_t)0x80000000
>>    #define SIGNBIT64 ((uint64_t)1 << 63)
>>    
>> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
>> index 3482921ccf0..ec087076b8c 100644
>> --- a/target/arm/tcg/meson.build
>> +++ b/target/arm/tcg/meson.build
>> @@ -32,7 +32,6 @@ arm_ss.add(files(
>>      'translate-vfp.c',
>>      'm_helper.c',
>>      'mve_helper.c',
>> -  'neon_helper.c',
>>      'op_helper.c',
>>      'tlb_helper.c',
>>      'vec_helper.c',
>> @@ -65,9 +64,11 @@ arm_common_system_ss.add(files(
>>      'crypto_helper.c',
>>      'hflags.c',
>>      'iwmmxt_helper.c',
>> +  'neon_helper.c',
>>    ))
>>    arm_user_ss.add(files(
>>      'crypto_helper.c',
>>      'hflags.c',
>>      'iwmmxt_helper.c',
>> +  'neon_helper.c',
>>    ))
> 
