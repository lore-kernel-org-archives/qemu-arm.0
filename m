Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4990456njb;
        Thu, 12 Dec 2024 10:12:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjlBYuZUKtERtGhh4zbzoj9PXGL76RAof9IB6UzgmsXEUREhJdW3/KuSfe4bDKvA+hwzP86ASJji184A==@linaro.org
X-Received: by 2002:a17:90b:380c:b0:2ee:bf84:4fe8 with SMTP id 98e67ed59e1d1-2f128032398mr11767294a91.30.1734027151567;
        Thu, 12 Dec 2024 10:12:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734027151; cv=none;
        d=google.com; s=arc-20240605;
        b=cr8RZR/aG4AiydgaTjGwslq0CxyotRsCPskgVujyknHZwF5O++KGTFWBmcC8zCHEzs
         3e8JoCzUV/j/RpHwTQ+dTMOPvQY2AXzpIfWtCeUld15vzYvF1CR/Ae0/FHRszovEJVOh
         BYqX6tk73iK2/VzzKsr/tDRSJSZEVV5atcZDyy6jUiMqZ/wcY6PWqzpIShiJere8ME6R
         jYzRfTyz9qcGGIwfa74M0lUgODOtVYmcF3szliMsN4S6LnG5+d5IdtwSmKL5vehGW2Ki
         yAQ74hBwG/3OKzElslebrDzZSKmGX0TnlAlczBZa9AAs+pALl0pJGaWLTmF8YSp+6YI0
         wOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1lwMwykDY1Tdw7nrWT32NtYxImwWpTGpP8knmDCkmmg=;
        fh=L4CskY0Ap9w1H7Hm4zgONn8HpDIN/5oCXdFg987jOmU=;
        b=liWL9OSVeeLkOkJCQDAY/3BW0Vk0l1+HmxyZvH90ORJbmmLfhIJKQrwHCE6Lfa7mUL
         S7642akN8Lor8Pt7Lwq8TY7sRM+C+HN2sd0IiO8O/yQjHsQeNvwiSGg9gU9PXa0YFPOK
         VoH06eIpMlROPE33KUqAKIgxF89fpxKLBvhfpBkMIm8YHKFJEVHC6rsxWKdtpF2w1x97
         tygNCBSGBcxvv/kZJ8khG7K4WkLLBMhxlMUxYGK/jZLdgMoRnTSv8ncLHHEfsg2HLEgM
         4IB3LbcPpayfhyPe9o9KeMIZyhboZRnem07tapQbohq8nm6RcoT6Fe1XxU1Dt8B/zj+Z
         AG8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K39NeYY/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2163c2c6949sor44562305ad.18.2024.12.12.10.12.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Dec 2024 10:12:31 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K39NeYY/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734027151; x=1734631951; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lwMwykDY1Tdw7nrWT32NtYxImwWpTGpP8knmDCkmmg=;
        b=K39NeYY/qVJ8veqyTn65TTKHoP2BtWsgY6DsfuPVyrVCqQQ8CK3FUcVlwNe2PLOi5/
         XHjTfIz+xohY9IHbiK4Ay7JXfaJayg4qu2Fo6FNLDfa6tu6sFyibwGmXE1g+/H9ivUfS
         Qb02AHsxQBC6HOS2I+AXWWAG93QwDzCFhWkbgELmgnMSzDMxKvxK7Z/sCROvghYASyap
         Sd5cYwSnGAeiqsvpdfN6W31nuGzLXXeNJUkl0EbEg60P3WgnBxa9/i4oHJq56rySuGeK
         e1/GS1LUUz8YpFa05xOAnhISuHMzhLDblR3TTMaUDqiZN/CVID9ncmG6KCkuTyVYxH0v
         NaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734027151; x=1734631951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lwMwykDY1Tdw7nrWT32NtYxImwWpTGpP8knmDCkmmg=;
        b=blh80jBg45RqnhaA36vTs2xsFoftfNdyXG9Pl7EHRMb0I1I9sJ9Yyx1JgcOFG353Z6
         zY5nkD9peWui1IS74KEb/qHBQwTrT7breshwu7M44YbsdGzECL4QznmQT36xKOrAT87F
         Z75Hv6vKR1PiwBL/K6cHC7vLsEdA/y4g1D8uxV1RtNiLIerX38+hUl0o2y9nzQSyTvFM
         Gv71OfJb5tarZhjLaRzPuiO35LTphm3Ytfi+dc/0jH93C43c+JcJ7foF/e+qFQbe4N5e
         QSGUwfNZVpdJslFqf/+iM/XIFY2v6LrVq74BQ+PeAbdWl5kfTNxdLKhybohxUs8UPr3C
         W0Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVROlW3t1jQ3A9cphhF6M2xSRUA+d7jNqc1bJIiTguHkIM9AY9knwXFcF9YLafdURhI9kKPIKKygSk8vw==@linaro.org
X-Gm-Message-State: AOJu0Yz/iQnP+2CNWvknb9QvARAwtgiojMhVdurE8QtTnuGnYwXaXWxK
	812AU4k7aHj3Dpk4jjpEcEU+1YAHqU8Aso9PN3OFopyxHndVIG//y7pt+VXvRMyZNg==
X-Gm-Gg: ASbGncsjsQojFd82fy//2rfphoTIJ6q3K/iKICZf2EF9vOeuKh/hSIHMcHKwkEB0JVn
	P1rl/XEAqesuBgFUm7WGQbteU4GSJJINEkC7g0Zu31rgvyHDohd+N7YvzPXzuAJsM1KVseqGbp1
	L405YQVrDRVViQkem92DmdVw+m1h+DDmc9Bq7g30fvwTI2ei5AYmtom7rs/rG+4eJoMSVHWcegA
	iVTu9TwR036xbgkcOy1KH+qMWxoZ+8cWKzPyMycc0NiTAnIeBEk1BYDeO4xgThZ1YR7PQLSsQ==
X-Google-Smtp-Source: AGHT+IEZcRsK4rxunv3XsoZWTygWEUIuGKif2GawRfGtuigRWJOv9RGlKrwTQ2cl9TNHve+4gP8W1A==
X-Received: by 2002:a17:902:f54e:b0:216:53fa:634f with SMTP id d9443c01a7336-21778562039mr125516155ad.48.1734027151117;
        Thu, 12 Dec 2024 10:12:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.4.119] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162e21321asm92376835ad.279.2024.12.12.10.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 10:12:30 -0800 (PST)
Message-ID: <bcc5e5a2-91d4-45b3-9f67-d6b49833a3ef@linaro.org>
Date: Thu, 12 Dec 2024 12:12:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 02/20] arm/cpu: Add sysreg definitions in
 cpu-sysregs.h
To: eric.auger@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org, alex.bennee@linaro.org,
 maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20241206112213.88394-1-cohuck@redhat.com>
 <20241206112213.88394-3-cohuck@redhat.com>
 <2a83a49b-6863-4fb8-b5de-c3eacf3cdb77@linaro.org>
 <12a2ef7c-0ba3-49d9-9e08-733b8ca6a753@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <12a2ef7c-0ba3-49d9-9e08-733b8ca6a753@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NvouYl/ojYs2

On 12/12/24 11:46, Eric Auger wrote:
>> Do we really need anything beyond the defined registers, or even the
>> defined registers for which qemu knows how to do anything?
> what do you mean by "defined registers". The end goal is to be able to
> tune any id reg that the kernel allows to write. So I guess we shall
> encompass more regs than qemu currently handles.

Defined registers as in "have an architected definition".

E.g. there's no need to set any fields in (op0=0 op1=0 crn=0, crm=0, op2=1), because that 
isn't a defined system register.  It's in id register space sure, and almost certainly 
RAZ, but there's no call to either set it or represent it within qemu.

Because you're working to a a symbolic command-line interface, with FEAT_FOO, ID_REG.FIELD 
names, qemu will (be extended to) handle every register named.

> Wrt op1={1,3}, tbh I initially sticked to the KVM API. Now looking at
> D22-2, effectively we have very few ID regs there. If we were to use a
> hashtable we may be more flexible in picking up the indexes that are
> relevant for us.

Yes.  And I'm suggesting the "hashtable" be defined by compile-time constants.

>> const uint32_t id_register_sysreg[NUM_ID_IDX] = {
>>      [ID_AA64ISAR0_IDX] = SYS_ID_AA64PFR0_EL1,
>>      etc
>> };
>>
>> struct ARMISARegisters {
>>      uint64_t id[NUM_ID_IDX];
>> };
>>
>> This seems trivial to automate, and wastes no space.
> 
> Sure we will study such rework. As long as the key (ID_AA64ISAR0_IDX)
> can be matched against the index used by the KVM API we should be fine.

I haven't looked to see what KVM_ARM_GET_REG_WRITABLE_MASKS really returns, but I see no 
reason that it should not be trivial to map back and forth between the spaces.


r~
