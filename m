Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1651665njj;
        Sat, 3 May 2025 15:26:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUryPQE7PInjRgS07HVSMrpNBuNIkTeahFGBIbmyI16Ovbj/o/OdEWnw0PtecVU3y1j9L715dVGJpHRQ==@linaro.org
X-Received: by 2002:a17:90a:e188:b0:2fe:a545:4c84 with SMTP id 98e67ed59e1d1-30a61a7473bmr3079509a91.34.1746311164003;
        Sat, 03 May 2025 15:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746311163; cv=none;
        d=google.com; s=arc-20240605;
        b=Shai5KTJIfphoIiYfVfwncSey2dCrdIZ2LEY4LClFF0zFcS2pGP+BDXdUk50HiDHCD
         4LMGmeFfypyeuAUnf5Phwmtxz8OLdwR0sscEfeN8k/oYe/FD/Wm/AC4pE5XgpD0cGkNk
         QyuLbZlXbS7DNXw3s8//k6lMvwfRSnvHQWp5wxA3CdHBD7Y47JVMzTyJxl0jYdfi2ScE
         oxWcy5uAgOR4F39s/3+yX9Gb5yT0K9wsNYGkdaa7yzWUDWPP/zJ50LNy+TGO4CE6tbMF
         CQuzVQCfbgVJ7AGofTxPMBvL1QTthsWQtgdyeOWjCpw/nRvAMAFQqGJpsQe0wyNjCgjt
         yi+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9i08Z+jcxbTTH6KQSk61zUEyMsxpIEuVYvglLCm0+hA=;
        fh=VVXOD/H/xoSdjAMRnvn/wmmGCzX4OfBkpRE6l+VGU1I=;
        b=EFGMt2XInpfTQZp/W/5aszoTChZxJNfeYu1SlyyAckdko9SP3i9hv0IEl82KOw8EKT
         +cnKGkATsK/pd+mGf0HvKoOr7xXTj+P/pK3Exp8jD9qR5D3EN4/nRORcxERXB6M0x2lq
         9fJTZT5yECO2mNqaTeIaEYzCofvl+XBbktrmWSxvG68BJKVr8jN2K1xFEPmxbUxZBkoQ
         dR+f57fdy/744rs138j/Vl8ztSBs2EjD0J77IGDcF34swGWlHQ0GwDOaSEnPyHEY6zSz
         OXsw9Z6yBba+AfTkr1UHrxuQ7d8JIImJqSze3eOlvRviiAukea2vEtepFKmgZtvDDBiV
         FWfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tfpLMReD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a475daabasor3505721a91.4.2025.05.03.15.26.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 15:26:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tfpLMReD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746311163; x=1746915963; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9i08Z+jcxbTTH6KQSk61zUEyMsxpIEuVYvglLCm0+hA=;
        b=tfpLMReDqJGhQSwzKJlK5cAPrMoae919O3FjLXLO3d0KoAVSEOGuwyqMApP/b9QhVh
         /MoOHj5UP9sEJWbSHGzLZBHk7Kd50XlOLfgxiuipDksZfNAf5+nWqny4quH3Wzv/0hYN
         Qhf3CLkTTS5NIO44T39j+9r/NvDIRR0pMdVMb/jaxPX1CY36AeUfZzMRwX+T/QPkTi3d
         49UTmNpHEbAkZbdaAPLhH0YAV7MT9JAR5QOAqDI73MS8MhxPEou79j5vPp+AvaxNH4AC
         SqJ0VjKYtG5X5+ylHuu29G4abXCF41u8um8HkeWQplHh3+EPLXlPHb7KTw6ojUPKeSn4
         RypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746311163; x=1746915963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9i08Z+jcxbTTH6KQSk61zUEyMsxpIEuVYvglLCm0+hA=;
        b=A+UGGyLEzlYaMIOnlj9+oEUICQvpY87r1CbGbTWjhDpNtelM4eDQUJvIHZWxrUVTLX
         bdMIvwlx/Ihng5ks13yUmJFoKEtpLRFsET/t2CwVuwuGjJtW9iZTvz3v70WCZfpaF4um
         pALYB0SKOACld1x8kteFAKnnyHK2H9bvNcwxk2eT747jiwMUxDp/w03pE7ZFqI88iNqJ
         9VX4GDawV7UbOdn/KTqkw4GCyC2t6vheEiBokdUKyqanEBbJKyzEjk/XpWexXxrWMF4Y
         BAhibpLccC52yA6peM1i5noF98ci5j/3EWfT5ODToG409VIbENOnmnwG8NqH7ceHn82j
         yZyw==
X-Forwarded-Encrypted: i=1; AJvYcCUyeNQXjUztvp3el+qLsw+YbPsbBkvnuV6qDpWTZ3qw7j8Ep8792TICDa/XEv3BVm6WX1W7ytPlA7RIHQ==@linaro.org
X-Gm-Message-State: AOJu0YzPQ0aeXv4DtGgwP+GeSy3mw/5lPY+zp0I1MGL+z+T3k+9FFwol
	xSSLuT/WdnTImsvbRZT86IFBdgBgUV3V8XPEevmKjzX4QFdMS2nNqou2uMR+/OMz/A==
X-Gm-Gg: ASbGncuTbC3DRBflRRI/jfY65E6QH7KSJSEMR0kIEuYNbLM0hxishV9Cb7SL8c8PT7o
	peeWIhvwsgP49h4XZ8/dMYmvth2j1Tom/vbzT6zJl2dh9beMaCH2ddg9y6p7VswY67hFhzbOB4j
	PCqUqvoUafeL+kloz8dkPBs+cJZ9NKd64M73pfa5bgFKQ3XYxQnaSfmERqxbG6iLxvzMG7rYkXX
	6cpQeaSuUkTpD0jrkTQiVjQvIk1RxX2ztt+fSS1GRgSG50/Ut59IYgvymLBB48HGrmq2lNiuhIO
	lJPACna6q0hwAXCBzksBffgJmTnUDQyE0ySKNO0pYpSuxGQd42LDzrOCaS0Lp3c9
X-Google-Smtp-Source: AGHT+IFVS6pgrVlMsUM12y7XK5SWDSNHy0AmYyU8HwZ9dIIHsc3zzGiZRrDxyDbWSBlN9jiNSw7pwA==
X-Received: by 2002:a17:90a:e188:b0:2fe:a545:4c84 with SMTP id 98e67ed59e1d1-30a61a7473bmr3079491a91.34.1746311163552;
        Sat, 03 May 2025 15:26:03 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f61bsm6240193a91.7.2025.05.03.15.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 15:26:03 -0700 (PDT)
Message-ID: <f37f5c9b-74ae-4c92-a731-803ec883b08c@linaro.org>
Date: Sat, 3 May 2025 15:26:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/33] target/arm/arch_dump: remove TARGET_AARCH64
 conditionals
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-26-pierrick.bouvier@linaro.org>
 <91c5f1ac-105a-4567-b1c2-e1d230d8cfc9@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <91c5f1ac-105a-4567-b1c2-e1d230d8cfc9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: AWDK93oN3I+E

On 5/1/25 12:30 PM, Philippe Mathieu-Daudé wrote:
> On 1/5/25 08:23, Pierrick Bouvier wrote:
>> Associated code is protected by cpu_isar_feature(aa64*)
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/arch_dump.c | 6 ------
>>    1 file changed, 6 deletions(-)
> 
> Should we assert() in the callees? Anyway,
> 

I don't think so, as call sites are guarded by cpu_isar_feature(aa64_*).

I understand your repeated question on this topic, and I think a good 
guideline could be to assert only when there are several call sites, or 
call sites external to compilation units. For a static function called 
in a single place, the risk to introduce a regression is quite low.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
