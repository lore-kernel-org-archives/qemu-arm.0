Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3716283ejd;
        Sun, 21 Apr 2024 09:39:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0oR1CLYexw4bCnysh7yuiBgjJpR1IOGS22AAXqTUsBE4On+qYPrcZ2ZQNwKYScwFe9cFPTS9I+mSzwkI/A9oEHHlKdhqM
X-Received: by 2002:a05:6a00:9391:b0:6ec:fe26:4ec1 with SMTP id ka17-20020a056a00939100b006ecfe264ec1mr9415877pfb.22.1713717584219;
        Sun, 21 Apr 2024 09:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713717584; cv=none;
        d=google.com; s=arc-20160816;
        b=Uzu91qW6bNHtsGzNiazVGnQ2XaG5eoI3OxRCtIwFO6dZEqO8O9AcRr2dpdibwIAqGq
         AfoiflVbl5mb4tlBkvZWooYnbFWFcoadrORbtj9nnUYSnoKQZy9QDiVjUJIToqYpUoYm
         EUR/S1lmRvRYo9/HoxKtI0EQvd8qIc8RUQVfZ0eHIPpRwQxevLtU3LJGvpgdUqpnGz2w
         eXRo87oYOOsWG7/t7SBF/4KIG3lWKbKMo5CSLQYCvgVB+eKyfNBtrCuKlMVmBNiw5aUl
         1lN/6xjpYKaW0w2cFPK0e9U2dfWA3EbAM6sPbmiYfApC/iscb3AW4CZMZkQLdkAhqy73
         FbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zzO2PNgNf25sBWOLBMeh/HbHQD9is6hj3U7UeE02hcg=;
        fh=Fx1izFPZEI9p+xlJy2i0kkAe9VXHkvtwfqTxgs0nBnU=;
        b=noSY/yfyXvffyhMkfZp91zl/+5VXPSV2cN2SKA7v3VNWilCoZQnrvCiWXmOkazdGKX
         4P8K8zQ9Mv8yytG1qE0oeaSj5ZevrzW4NWeMP1CzuwedD3aCa8ibeOVa46sFrwxwCXX0
         0uiseoLu+l6XxZh2e55rbi+Yb20WRN6EIblbkt+0lURC++iwowz6fy5sP9/QiLFdqvGP
         94YpJEu9XH3JSPyptXf0dfJ48W3ii4cynBsO0GD0q8WsTDpRZambO9wq7iNnvUojoMm/
         A99zWSwb5fWqAHEU1KgQzZvYgrLEPU3wA9zAW9CDh5A1udlTCdXwLMr3E33bcwBGDhPo
         jcmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q7aIzqYE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e16-20020aa798d0000000b006e9f3c5683esor9699566pfm.4.2024.04.21.09.39.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 09:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q7aIzqYE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713717584; x=1714322384; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zzO2PNgNf25sBWOLBMeh/HbHQD9is6hj3U7UeE02hcg=;
        b=Q7aIzqYEANK53V8PpXgvN4g18lqphPnBD8LN+6uOBrJUBPvSbFJe/KlPlGkZG3QtB2
         CXVLgTuNvhTtZyh7wPOdDDUim9fF2/1KDI64ETc0Kt4HcohIAyH59RWuKTUPDp/0xRU+
         olf1ATiunJNVAEZqyE8JcitNXQeohKQOjn/rtRwROpq/narP671R3PpDYZSsgR/9afpl
         NRwpH2BGmdhd9OD2Bo74lMQmoeIBRWAd94FU9UV3Jk3Cbea6KQ7Wsqbp7m9bn5FQ7iO9
         mFC96Q8TFb1MFsRRFlty/5S3fXRKUSgyOQ4+Bk7pziuislWKFlJrHoTOqZL+xY4M+YhE
         QF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713717584; x=1714322384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzO2PNgNf25sBWOLBMeh/HbHQD9is6hj3U7UeE02hcg=;
        b=tem8qo+AZ7fs67mwBe4MUwLH5g3qhwo8GsHYHaN2m2tP+ovUIbLSFiME6/os3bIjTr
         gnabnUWHcyyF+DlPjHcTjlG5XpB9gyBUohbObm17SnerKvvYN24M+2OvlAY6e2jIpl4b
         +3dmRCvWtokEHgS3gzvm1ek74vNdxlIB0Ws9LBmMn7R8xNnjSkZCVCPIEicJN1wx8F/V
         bWe0mTgxj6cKWxlIxjzawgGd2ThZJAjbKB1clV1QqxxSjmoQ2cAUP/dTbZKrVeUwddgc
         mISAdtj+8cUknQ+Xo2V+ylFsaG0rKCcSmck4lhhqtyO6tSQB6qZmNFv4PQQEa/nBj7Nf
         tvdw==
X-Forwarded-Encrypted: i=1; AJvYcCVBtRpCTix3O6BmOK+ewVly8MaRgrlzV68fii8Ciog5z9Xgv7tj689Iy3KlpHG94ptKiZY1MVFx7RdFJdMI8ACdK/RNn+EA
X-Gm-Message-State: AOJu0YwpsSPP80AyQ3NdZ8bGJkU3UoOOEFzQSdmd10BeW+8O+xFeXqac
	J2Vz2XahfPJsRbnZA2olLUTL3uSU+OXGKZK7rHsf4yanZGv84GEoJAGtq23D+UlNnQ==
X-Google-Smtp-Source: AGHT+IH/SKE6UEfKYxylVBwIcibVOLa+qMlbo38nXDqQgX2EgKuPT0FYHg8DfaVI8dwZWcGh80JWuQ==
X-Received: by 2002:a05:6a20:6f87:b0:1ad:27ca:6347 with SMTP id gv7-20020a056a206f8700b001ad27ca6347mr730485pzb.43.1713717583731;
        Sun, 21 Apr 2024 09:39:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id fi41-20020a056a0039a900b006e6c6a50e5esm6344423pfb.34.2024.04.21.09.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 09:39:43 -0700 (PDT)
Message-ID: <f1fc19c6-77e0-4f67-9f59-ae9670b7dec6@linaro.org>
Date: Sun, 21 Apr 2024 09:39:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/24] target/sparc: Replace abi_ulong by uint32_t for
 TARGET_ABI32
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-14-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3IsFhjehNO0N

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> We have abi_ulong == uint32_t for the 32-bit ABI.
> Use the generic type to avoid to depend on the
> "exec/user/abitypes.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/sparc/gdbstub.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
