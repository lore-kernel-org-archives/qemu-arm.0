Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp39557njc;
        Wed, 19 Mar 2025 00:03:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3WNzyHtljsWflA/sApjHWVCqJDcsLj4vta0BABNJxza+X6E32yMsnbB7bRhxJryh5JBDq1Pu0NloRzA==@linaro.org
X-Received: by 2002:a05:6000:2a5:b0:391:812:4e0d with SMTP id ffacd0b85a97d-39973c04e5cmr1013049f8f.10.1742367838570;
        Wed, 19 Mar 2025 00:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742367838; cv=none;
        d=google.com; s=arc-20240605;
        b=Yz9IOePFej/1T0pceXJ3gWq36kF8u8UKIaXh97LHJ3Ox0ssSswBzNvdhlQ5gHA8M8h
         1b5/8A8vlrmS7pUPrm5hnQQZRjkvPG09v7VTPoN5F++6crv0Ow9S+rvjfMNyMKEHQxIv
         yo6SQrhIoLdq0GltSGNWWM3W8FHyF6pGbqmMq1BUGKsCjBljN7I0s27/lQDYeklzXASD
         bXLXI1VGr/S9tVaArKLotTv7pP7phKkPhG0C69YEkrxRUrOirfeYl6TlqNFFMDaLx8jY
         MU5nhpyY/oh9wSR/6bpo0/HUCwQxGEHJI9ACu6lj3O9Z3Dr0U8+IqDkBTxdkSUCSnceK
         +Bfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7fzQMjdihmdHdTMPhZwn9J/dZihgq/4Rbt5LNPXzbk8=;
        fh=Zzgc65Pk318rOH/LyqiVy3Bq74CiqDp+Jatrpbn+Y6c=;
        b=QPxtklJWY6eHyGCyxdGmidF4PTAqRbocHmxFrGOh+IihPjlw1DKWFFqF3Cg68rsZ41
         8dC6TV04ftQ4zp24oxsvY+gEIA4vJfLqlXC17mektPNve+xcRLSK/lWfNIj+eYnLRG21
         7bbYojN54cVpajbNAZStqBfIAWJlBkvtg47CsJbdyJR6Aab3ILE1/FgFGpne9JEsk7/+
         ECTsGXO1xU4uvYz0hlwltBo3lYLtfMPLtjEksFkBvdwHaYgldCEuVscDQTcRxY1YL3gv
         xdDhGE/veSlFjSLoorlU+m1I9IUHa2/J67U4J70Wmi5D7nitNuF7UwmT7himY0cOq/0z
         8pPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lv+w8dDU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-399749a09e2sor186076f8f.2.2025.03.19.00.03.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Mar 2025 00:03:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lv+w8dDU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742367838; x=1742972638; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fzQMjdihmdHdTMPhZwn9J/dZihgq/4Rbt5LNPXzbk8=;
        b=lv+w8dDUMRU1vhPGUJTSiW96Pg751fZxfHjdgiWaL0XwjR5eLLsEoBd4ez4M1KPf8P
         qgAOTGeALKDp7PuX2y1aOukckIZ/IitfkpM+3V2aoIF/XFFLt3PpQVTlZKAtA5W3gzCl
         Cja3yotHXlXnfnpd04Kc8/4Nw/48CRRdnwztYEXTLPHBjFxha7mMedW5EqElKRqp9Lib
         wlnGdPltDw8p1q3iiyYB45udOyGb7LYSudRDvlH8z5u/TvhWkd0ZY6uJ0n/LXUdhyD2R
         dJ/mCyM41t6mPvOq0GZrwUIuSv4K+7SQSSw5kZdY+sf5aDMo1aNXH6qQvs/GO1vszCa5
         Tmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367838; x=1742972638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fzQMjdihmdHdTMPhZwn9J/dZihgq/4Rbt5LNPXzbk8=;
        b=rLzE33TmSUTab4MQbYi4Ng1yNv8ibcvv5w6qemhDCrb/Q+KC17Yzqyb3F3qLzfWpcG
         6+sk2rgdfwxPV/vQLi2A2zkrDH1pij2YWCAEt9IElMppRXT3e1vrafq/vdd24VPLdfgh
         sRDwa2ZxTDqYZfvSSTojfg3SGmF6W6eBLey8tLL0lmLAx230Y+d0A3afAbWaPtR9HeSt
         nJcdDWDWUPZqpK3UgAPjHjZ1C+g3+sbqmiM4sZlr/lgOn43Av8sr2zhu3HWLIRYWaNmV
         2L7Q98IZJn014GQwYwwTxhYZ7R/w1g2hJ6RxnJVvd38ClQi5a8i68/Pdyrd5yfy7q1Wm
         7sOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjpP4VGmhsyABK1cR6X1r0LG9lTIx8t6OFukDqkonovw8VqFutPwjd2pi1hJQ1L/r+E+F4gnckCRmFtg==@linaro.org
X-Gm-Message-State: AOJu0YwoFOPO5huE3Geq6T6wOqVgSP/Vqf/Jku7cd3VI+qHOORuq/E4M
	HHo7y1IcmNx3Ktn38q3x4m2S2LoR9sN77eJ50fkZ/x2kohJnUwvMCEZqeWJy4PhNxQ==
X-Gm-Gg: ASbGncuWkxkLct4ToQ+drMkwUH1wZPlb8kIZOHLA7MRDoADP3VZocLrw4NgoAgvpz1X
	DLgfnQ6O3QtUs6rOZNn6KkTo4L9qPI4ovua7pYR0Ouhqxf0iYJtDf02qXzNhOQbUJ4dpB9z8dd4
	O7sMV642uB89U05PQRXgJi+BsYkH11Kc+7FFPTUjdHZivIYXvMf55IxfqVY0rBjLQFZliVH4QJC
	sPYBua0z77gTFLuj0hnRj7aPqRtDA+3vAqXjmfJAHPSOHSiWf2VRgRstOOjXAVL8keBlcmxALcx
	OSCaF8ny9Rdbt2YOFduWg9kVHXsygwpdlVN2QN6smppzSxreh+4Z616tLE/5xh/OTXRfEQff1VC
	VA95/ar+PCH4L
X-Google-Smtp-Source: AGHT+IGZ1OYYU+hacx0hWCwMirBGV2FRtf+/lifMq6+bgxTMfGuPKE3k3/xaTQ/8RTztiUkGX9yLLg==
X-Received: by 2002:a5d:5f93:0:b0:390:ec6e:43ea with SMTP id ffacd0b85a97d-3996bb51f57mr5507704f8f.15.1742367837893;
        Wed, 19 Mar 2025 00:03:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888167bsm20067597f8f.45.2025.03.19.00.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 00:03:57 -0700 (PDT)
Message-ID: <52c8b6dc-048c-49d2-b535-4855b9f3d26b@linaro.org>
Date: Wed, 19 Mar 2025 08:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] target/arm/cpu: define ARM_MAX_VQ once for aarch32
 and aarch64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-10-pierrick.bouvier@linaro.org>
 <a88f54cb-73be-4947-b3be-aa12b120f07e@linaro.org>
 <52000c3d-827f-4e21-afa3-f191c6636b9d@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <52000c3d-827f-4e21-afa3-f191c6636b9d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qNEf8SaKKwI0

On 18/3/25 23:02, Pierrick Bouvier wrote:
> On 3/18/25 11:50, Philippe Mathieu-Daudé wrote:
>> On 18/3/25 05:51, Pierrick Bouvier wrote:
>>> This will affect zregs field for aarch32.
>>> This field is used for MVE and SVE implementations. MVE implementation
>>> is clipping index value to 0 or 1 for zregs[*].d[],
>>> so we should not touch the rest of data in this case anyway.
>>
>> We should describe why it is safe for migration.
>>
>> I.e. vmstate_za depends on za_needed() -> SME, not included in 32-bit
>> cpus, etc.
>>
>> Should we update target/arm/machine.c in this same patch, or a
>> preliminary one?
>>
> 
> vmstate_za definition and inclusion in vmstate_arm_cpu is under #ifdef 
> TARGET_AARCH64. In this case (TARGET_AARCH64), ARM_MAX_VQ was already 
> defined as 16, so there should not be any change.

I'm not saying this is invalid, I'm trying to say we need to document
why it is safe.

> Other values depending on ARM_MAX_VQ, for migration, are as well under 
> TARGET_AARCH64 ifdefs (vmstate_zreg_hi_reg, vmstate_preg_reg, 
> vmstate_vreg).
> 
> And for vmstate_vfp, which is present for aarch32 as well, the size of 
> data under each register is specifically set to 2.
> VMSTATE_UINT64_SUB_ARRAY(env.vfp.zregs[0].d, ARMCPU, 0, 2)
> 
> So even if storage has more space, it should not impact any usage of it.
> 
> Even though this change is trivial, I didn't do it blindly to "make it 
> compile" and I checked the various usages of ARM_MAX_VQ and zregs, and I 
> didn't see anything that seems to be a problem.

You did the analysis once, let's add it in the commit description so
other developers looking at this commit won't have to do it again.

> 
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    target/arm/cpu.h | 6 +-----
>>>    1 file changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>> index 27a0d4550f2..00f78d64bd8 100644
>>> --- a/target/arm/cpu.h
>>> +++ b/target/arm/cpu.h
>>> @@ -169,11 +169,7 @@ typedef struct ARMGenericTimer {
>>>     * Align the data for use with TCG host vector operations.
>>>     */
>>> -#ifdef TARGET_AARCH64
>>> -# define ARM_MAX_VQ    16
>>> -#else
>>> -# define ARM_MAX_VQ    1
>>> -#endif
>>> +#define ARM_MAX_VQ    16
>>>    typedef struct ARMVectorReg {
>>>        uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
>>
> 
