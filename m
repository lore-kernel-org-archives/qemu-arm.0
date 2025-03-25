Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2330226njc;
        Mon, 24 Mar 2025 18:24:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbBScVZbx72L7Qy/c3U5Vg7rKy+I8mZkmauuy5y9Trc3IVHFD4Ws0TVuRe0PdT8JgnvKciYbJA/XSv8A==@linaro.org
X-Received: by 2002:a05:6a21:3a48:b0:1f5:591b:4f7c with SMTP id adf61e73a8af0-1fe42f2c5cfmr23124197637.10.1742865843623;
        Mon, 24 Mar 2025 18:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742865843; cv=none;
        d=google.com; s=arc-20240605;
        b=gI0kQrEbdyEWuFz9Oi9l8eMohvqGIzWsP57fNdd0IzA+fsUPOut/P5tH0/+GWDDz7T
         mQNmq7rrfRFZkOGA+gkm/OsYEW5etofqsTEqFgf4dHm+hxWdXeFy1PO4AfUcWsK3zvgU
         V3RradOBZFFOvcmUogm12O/JwegJdNvD73mFSOlvKyu3n58Np3pcajdgHoMX8hT9pwla
         ICNRir1So38PtJVmfROucIU9tW9v753Yhkzf4Oj6pDYULYwpLN2WvEDMXEQv5/oKWuVH
         YkR+xw6RXKOVj82B+pW9cXP0E4JYFBMojtkT76I4UNTNXOQzE92va2VhwVtWNAgFwYg8
         Jhzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3f/aamhcaq65N5QVWFb7BojgdxkqrG6VyY1uYeOMdAE=;
        fh=QW+e0ADhIxSj4Ubn6Yy638Y3YMtzjmCYe3cnX8gfTt4=;
        b=PJJC0htufmw5wl/eZYb3fYu95CGKHh/BzE1kiQgcolLXmbMzYJQYvLfDfUmtiJqBhD
         6MzouXfTo7PFwHmz8Q8PqkjzyIft6iE0CM4mWkaVgA/+I85vyY+oSV7gqPxpbjlz+4bn
         6KzR7iIjF2j9Hkh/ZnxhtEr4bKA6b64n+c3UtGU/a8HpY96q6sxRDsyTr5zEZSupmfOU
         bfixDnaQvWNAT3SK+/MhV1TKvhL36pokY/HQIVQbM8E4zTLEhULzJfK7r7IETBRQQ//B
         aHJ+OMfVdaIUG4nue899i5AAFHm1m3trBynWLXC28oIjiDOfei9lJ0ZxjJPJDRKywCVf
         FeYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TLQt+RxQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2a3c0c3sor6496435a12.7.2025.03.24.18.24.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 18:24:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TLQt+RxQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742865843; x=1743470643; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3f/aamhcaq65N5QVWFb7BojgdxkqrG6VyY1uYeOMdAE=;
        b=TLQt+RxQWfV9IV8x4/NnDGXI/5cHedqsXn5+W2qQ4idbhZtVjRYBAwOO7s6vF3OCoL
         VqwHgtBHlhs/9fNs9WdEPw1NT2dWZfs04pwLq7771roOcDJYpPKpoj3lpH7I5NjibNfF
         K+gWAWs1R167FlzNd3WVK2moGAV9lNcf3J584ELHCXv75aaJakyKRQx2IUvxZRCi6ZEY
         9bOnphA/S8CVuKebCzd3Rhojrty5Zmku17AdtGa68whY6iTM1/SvndHafv08wjdtzKgW
         WsYnZxOHxGhUzIxWpd6tjYWGKLLMMzkN8utP276l8KasiF9oGK0rlQ/j/ZfahwRc/d+N
         IKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742865843; x=1743470643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3f/aamhcaq65N5QVWFb7BojgdxkqrG6VyY1uYeOMdAE=;
        b=LLQc2t94YsD78sXS4GCNKSrjkQWGJVpLI5OTxSaPMuacBpcl3iAMFrHgvXaoe3+GLU
         Bq3iUmjjdHYtYNp0XQQeUi/ygS2TZX7ohFAf6DItlOP9m/X9glC7ZcEhcp6247pUL0TS
         OJdBnNAS9SYwgd4i1fD0frwx80mGZ3xcwdml7Gwqoa+K4exbBARXBUU30GL8491l61RA
         qqrYXAo9m+DQxGbv8zl3O/xpYJ0WPsmntSzR26+Yih5XcUHQXCioa6eiXURQt26QLf4P
         iU/nGjZXjB1xfTNKkKlGye6pDvEY7TL04kTna/SoTPVne+LIXCgPGcnCPrff5mvGxyfs
         CHfw==
X-Forwarded-Encrypted: i=1; AJvYcCWJgYIHRsLJnNsUGzppVztjuaeGeXCOQdXT0lbAqw5ePwBtVTXIb6MH8u9pHfGOUolM90GXZTbmBqMRWw==@linaro.org
X-Gm-Message-State: AOJu0YybnKPF/TAskWMc6sQxB3UxzTIJN0Z6ZalOGNk/TN4ldShMpPyu
	rDn01FYaPCkfwfJLIlP228O0CFq3wyW1z341fWaMisNQs5tsUHNs9ryZNwYGvb5pDg==
X-Gm-Gg: ASbGncvUnKayLRutqGWIC9ekJY21JXiaF9ljxF2EIaslbpIS2sYQz7fcHviG1ECYZQD
	I7orTsxg7kSDYNdbztl5m2DMdA3ktpvMlnhpQGEUxKXTvv5PJuEuzjatb3vvvYktbi5DuN94qk9
	LlDUBg7iiPG0D7QPX3FhbvuX1rB1GkaUcQVwqY5hlfNatxifRuko7nUqiFD+55WPCr8HK/3mDH3
	8+0dhFRwzNhPTlNJhZtRSVky8Ljr1UPyA1J/DOJ5FBWoOOGjuQhNTcYLkHU2oaieD/VXyzq0Xsc
	+nBOMzWFgmMoe7rMKJbhJYL0ZDMSOMEASRMsdF2dWWcCNMKxzRa3Hvi4xzQkhaLsB6p0DMg/61F
	Kg67K0RVi
X-Google-Smtp-Source: AGHT+IHtYFXPUcyvhT6u7EcdDtjGqWUVYlhcNricl/EtL0dR+OXt6ZmrKRY5nBmdo5X4L15+2ngQQA==
X-Received: by 2002:a05:6a20:258a:b0:1f5:7280:1cdb with SMTP id adf61e73a8af0-1fe42f2c9d0mr25068794637.16.1742865842846;
        Mon, 24 Mar 2025 18:24:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a28467e9sm6648568a12.37.2025.03.24.18.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 18:24:02 -0700 (PDT)
Message-ID: <428e6fdb-24b9-47a2-9d3f-4ef5c2e1a0ae@linaro.org>
Date: Mon, 24 Mar 2025 18:24:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/30] target/arm/cpu: always define kvm related
 registers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-21-pierrick.bouvier@linaro.org>
 <1109fe22-9008-47c6-b14d-7323f9888822@linaro.org>
 <11b5441f-c7c0-4b4c-8061-471a49e8465a@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <11b5441f-c7c0-4b4c-8061-471a49e8465a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EJhwyymjoo7n

On 3/24/25 14:11, Pierrick Bouvier wrote:
> On 3/23/25 12:37, Richard Henderson wrote:
>> On 3/20/25 15:29, Pierrick Bouvier wrote:
>>> This does not hurt, even if they are not used.
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    target/arm/cpu.h | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>> index a8a1a8faf6b..ab7412772bc 100644
>>> --- a/target/arm/cpu.h
>>> +++ b/target/arm/cpu.h
>>> @@ -971,7 +971,6 @@ struct ArchCPU {
>>>         */
>>>        uint32_t kvm_target;
>>> -#ifdef CONFIG_KVM
>>>        /* KVM init features for this CPU */
>>>        uint32_t kvm_init_features[7];
>>> @@ -984,7 +983,6 @@ struct ArchCPU {
>>>        /* KVM steal time */
>>>        OnOffAuto kvm_steal_time;
>>> -#endif /* CONFIG_KVM */
>>>        /* Uniprocessor system with MP extensions */
>>>        bool mp_is_up;
>>
>> I'm not sure what this achieves?   CONFIG_KVM is a configure-time selection.
>>
> 
> CONFIG_KVM is a poisoned identifier.
> It's included via config-target.h, and not config-host.h.

Whoops, yes.

r~
