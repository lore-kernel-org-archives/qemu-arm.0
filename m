Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp584003njc;
        Wed, 19 Mar 2025 16:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUzuRo5/xoD0C7LOb+cDV6r30uWvdN3WA6Hv/zQMoOwM5gYgUtyNEAME5q5/w4ahapgxWvG5T+zGpg3w==@linaro.org
X-Received: by 2002:a05:6a00:1486:b0:736:4110:5579 with SMTP id d2e1a72fcca58-7377a819f33mr1311596b3a.2.1742425581494;
        Wed, 19 Mar 2025 16:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742425581; cv=none;
        d=google.com; s=arc-20240605;
        b=dKO/9gTyDUAl/9aoxoMRIHdtsSMqaKYyp6xDWsHSXulUBJ6FlOhhQ8XxMdKuFatgvh
         wUK+x5i+GJHhnqPjey3I0O57bO8k2HFkLKn7v9u+dhofHqu1Dm3k676LRQu6W/+r/t0i
         tjFPWrOkkWAZa2pCosd+guKRuSHk+c3+hYusnl8v9/IgqnIFzX5bActVsV2TtDUrcrDr
         NUKAvp2AMk/mT9ORAzvxxHFRDzS4g6SOcwBDyxUOuHp+PBQjF+gBw298gMG4xeClYcHC
         wipOzXzdd5+3sGkdofn7XJO/eS8sJTNoDub1+hZ1BWJz0DbcMHX3Quea8FY2cI9/+4hv
         zgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0B7qZzLI8brQRidgeDupLP9VVQOT4B9SqSdemiBIJrM=;
        fh=7PxE7Gil9UBG+343iigI4YRH02laRCoqkkP6I9K/DjY=;
        b=hmydZKFS2Ovj6qXlxLH2AscFG8cwq9Sp09UEJfRUtSZATwPiggl+AEup0AZHxSHjmN
         qhA3hgJcdEGJOA0ykVYaQDKk2gpABaLuZEJB6bD7W068uyvqfzFJS6wZiC45bKPH0Pu+
         +rZpYhlzAuZc9jmeLZmVuyHmPTDsyGTf/OkJ+lvaYpeeHVdFtZcl/AHzRIF9P0q/KdU1
         BoQwY5+aJshvj30ML6Vc1aXCnm/WQKeY1SZ9O+FYuCUEYWEOYa4i2TB+W2lU/r7F4Nuu
         M06awnfnI3KFagK6y0nir+sdumQQ2yIFwKF1yNI8vZd+lfr1yIRaAXEZtyaW4d8YwXLp
         8XsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nlipe9So;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-737113d75b2sor7401246b3a.0.2025.03.19.16.06.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Mar 2025 16:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nlipe9So;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742425581; x=1743030381; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0B7qZzLI8brQRidgeDupLP9VVQOT4B9SqSdemiBIJrM=;
        b=nlipe9SoJsDxtmlXIdWvU8AVRalBd0/sMMCoi+XsoYF5vyZb982E/eqjhj88FlR/iz
         qZyYVVRopIISzVN3SK39riUe30Q+tSBsOct2dsOghOYK9Iz2MsmA1hwUE+g75MI86Kil
         sOtHKiJgP4c7Rrw1+uY8g3FAwekh7pSrQdqczW8bfKRJLxg8yoyPrNTh4cPy0OzUNbLS
         iZch7OCKKIkJe1iR1YlX7RCZXQHCPkY/NtjJ1nmY9CEo5aFGjGhfM0vgFsKnDKDX/HwQ
         Hrug7iqLvungxfTxOcX4neDp36halowjiFCXc/WZQF+QBNYO/F8hCnvrPvfzQ5ECbhA6
         4Nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742425581; x=1743030381;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0B7qZzLI8brQRidgeDupLP9VVQOT4B9SqSdemiBIJrM=;
        b=VialzhVhVnOGGwJJx/SKPvxWAe7YtSRoLjK4wjdvtcSjrBDUtrm/RnG9gAO6ezOt9u
         gUU4Euk9nLrm7roPTgWRTa071AY/6hht8ITFFDG2TrUdOUtVuB/Xn16zSoAGMvf/iHV0
         2zxbQAp5VU4YytjFrUscodJw92j314dW+k8o3SKKqlZaQxyAgGyb9/hdsc7e84LcQepQ
         8ibrj8cKjJRMcVdQbGG6MKifb6xaNPQoyWBLm0fISaDhKozTB3sjJAJD9rJ/kQFxO5Mv
         ur/Fx5guED6rP5Yl+rupqRch4qiNggRBjpb/Fx5rDMjoFBsYrur1r04vHlJ7ZUOiFvQa
         nd9g==
X-Forwarded-Encrypted: i=1; AJvYcCWESXekoASwIHB18LKhJNOHZP5oe0eqfqSID5e9GJstwFSoWm4zyFYfi+tEOtLrCcqTopdOIPtXRqrUkQ==@linaro.org
X-Gm-Message-State: AOJu0Ywx6++EImcmfliIVku/qZjk6T7LDygQK148lMoPkd5IgdKYc4uu
	mxFlsUnZpTOJC5XiqSf7X9tFXb6Y9MvZdtMWkaXPLPlV68UMWVwRxuFFttNhthPdKw==
X-Gm-Gg: ASbGncsnK8Ft+7APdBM2zs6jj18/y8xnIaT6D420u0o7wZHjhCm4SOybqtsYh0QCrq1
	nXn/T/fSZyyOdJWPJ197yOLnoEGqx2pTdIwe8+BNa3rFTc89aTpbv60CHpQCXUMCL7v1OlGqBJ1
	gj+6jje6qT6Oh+EVqg6uXTnaD1/SPVFayWJLgM2zMaHyLKleyIIwa1ifQDiQ4Q4yvDPC+7IHWfW
	XZq5fIB0wSJHqcNZ2QHlS/FzcWSAQT4AZyCbM30aC194qahG2rnROuhtWoQ/3mn2cdY3dxrXi4G
	C+fPgGkXADI05DP7CzCJa5Zf/pPROlWWwoG2LG/Tnz8ogkQknWa0BVb/tOVdDh9001Zu
X-Google-Smtp-Source: AGHT+IHtNH2/b50JPe298GmK9alO0tYGjRJ7dXzrqpDLLmEgohh2rXtZhg+BmTK0bW8zlb9NoYW0nw==
X-Received: by 2002:a05:6a21:168b:b0:1f5:5b77:3811 with SMTP id adf61e73a8af0-1fd10391437mr2016652637.22.1742425581014;
        Wed, 19 Mar 2025 16:06:21 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9ca18esm9770445a12.16.2025.03.19.16.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 16:06:20 -0700 (PDT)
Message-ID: <0845395e-f306-4fb3-bf4c-9723be4c969d@linaro.org>
Date: Wed, 19 Mar 2025 16:06:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] target/arm/cpu: move KVM_HAVE_MCE_INJECTION to
 kvm-all.c file directly
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-6-pierrick.bouvier@linaro.org>
 <f1ce73a6-717b-4230-95cd-45505fecf039@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <f1ce73a6-717b-4230-95cd-45505fecf039@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: oxgnJyworj1N

On 3/18/25 15:19, Richard Henderson wrote:
> On 3/17/25 21:51, Pierrick Bouvier wrote:
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index f89568bfa39..28de3990699 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -13,6 +13,10 @@
>>     *
>>     */
>>    
>> +#ifdef TARGET_AARCH64
>> +#define KVM_HAVE_MCE_INJECTION 1
>> +#endif
>> +
>>    #include "qemu/osdep.h"
>>    #include <sys/ioctl.h>
>>    #include <poll.h>
> 
> I think this define should go after all #includes, emphasizing that it only affects this file.
> 
> I think the #ifdef should use __aarch64__.  KVM is explicitly only for the host, so
> TARGET_AARCH64 really means the host is also AArch64.
> 
> I think you should go ahead and adjust x86_64 either with the same patch or immediately
> afterward.  There are only two users after all.
> 

I'll adjust this for x86_64 in the same patch.

> 
> r~
