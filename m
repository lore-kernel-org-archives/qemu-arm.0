Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp408222njb;
        Tue, 13 May 2025 03:09:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmCn+NxSpxySVPgoYRyq8IMF/a4hQR8nPTYIiX0WWkC5ZHRKJyOd2Bl86rY9gQDHVXWNu2g0KAW7vFuA==@linaro.org
X-Received: by 2002:a05:6000:1a8c:b0:3a0:80dd:16d5 with SMTP id ffacd0b85a97d-3a1f649fba1mr14154711f8f.55.1747130964588;
        Tue, 13 May 2025 03:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130964; cv=none;
        d=google.com; s=arc-20240605;
        b=OEMp6+A3R3i85uooJ8yaIsWSZDc4wkf+8ioHTv+9NKVymoWaM4zjVDqP74K+p4euck
         ZE1fFKiRk+1t6qykVMIitpJeYjez1O6bQe6wh6GNFaor7viO23jUjMKbQNjAx4oYHvmM
         trpFO/WidgnxCqMLwoeUTtZdT1ph8K7/Fyq4daamtTlPqP9IMIu69VW+h5dmzq5fqYdA
         g+vjSt56UjuG4fb/v8hwU/mrCbH9VA+AtnM5L3VZA8pPQ0k1Y0wOdTIzP9wnLXy60cVI
         VREBWZ8ko8FQr7lNswVsd8yArsyQoOT0jZZHayZ/Psk2gD6GnFytVZrysgX/A94k9W2g
         cbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qAj39my+7Ge5Cp7+If3CmQHkrz/P16jjralaU9o8Ftk=;
        fh=Hvyav++DGVDHPIqqEIKiqeP012/+VCP5Xjh4YKbV55A=;
        b=b1xwscBIJdHkn+joP9baTizGl0gasPmC89XkTEVE7rAI0hi8D3Onl8ZD3LzanHqras
         RNvH/LR+KeqmcISXGgDp2S0gmMgkVibbJvtdZBoMA1laQ54nMyJHk1a4Utn4VgvTL+13
         YjlsJ6TRq/hTtDd4roI9XR7RWs/7+O/ulpeOfP5CgfQLJ7MClTuzv9KxQ3jmqvaKtCMo
         JKmM5jZ788Xe8hdCG9P3DWrOUUAse0p+vIOCkHgAY9a0pInYlhWsHRaFUWNhPIk31AOZ
         C3diww49+xiX8b4QrevlgJ74qpAy/eSg15fRwIk/qj3y2Bh4BM64cxJDWPPKJ6WQysWp
         6ItQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YO1zpx2A;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a1f5a5cacdsor3594869f8f.2.2025.05.13.03.09.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YO1zpx2A;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130964; x=1747735764; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qAj39my+7Ge5Cp7+If3CmQHkrz/P16jjralaU9o8Ftk=;
        b=YO1zpx2AhS1BGEU9lchIYATzkHKfVL2SbimV5JDyRzf3osEdfEjQm4ziqOevP4HVyd
         ZjV+mUPud5zAEUeSuXOV7HCOKUMzx0UeXSmC5maq4STupRJwV5WKBTG87GPw3ww16zxr
         kO0saMZU06hclJYBQccR7DPzud09gK4TWJsqzy5+CfY0zxmFpvNyMepv8pz5QdW4stSb
         qyaz8DSyuGVddr4QfOQ9SfAgNabFiUjURnrDZgheDPcJ/3pFrsKYQKUqPIqbSE6qVlPr
         Rb/PmTY2qHo99TdZ03KYsYEVnx2DKJTYHiIhXJ8abbDoO9TRJE975scg3E8P1mrPHxHM
         Sn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130964; x=1747735764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qAj39my+7Ge5Cp7+If3CmQHkrz/P16jjralaU9o8Ftk=;
        b=uXT2YWmb6iApIFio1XITjz5/byiBWUXQpzbzQIEyZnNeGp/RwjQ7a3b2a6W42Z45Ke
         CE5+Petwefx9Q+hzPJnH3G4Yvkb0J2mInK7WMspiXQjzbRV4/2TLwrUWukNgBcOUgU6L
         wz84q6g1z24+e1awZZUKeIarFbiC2It41ZrKtQeoiKQYzyZMtUgdOy3/mseVhJBdnWk+
         2K1S3pKcCZOOwTjbAgFuAV8mgjrg/FR47DqquDCtxsHm3o5AgxJdQ6PJgrGVAlWna5kN
         oyU9+ED1ti6tEwzCmOgmbOXPWy01bNeM7x3ZlppNhnysHIlVTPLdj1T3qeYrXWSskpKd
         zAZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb2UTD4G1UpsiaET2JI7XVSu6ZjcIww99U0BUExDBCW2qn0t3U+zyysdE/YsF2wsyGS6b2ldGT6RFMeQ==@linaro.org
X-Gm-Message-State: AOJu0YxvP4BVduG1MFzbAUoBcJHGDWAZEPfdmj1SxUM+XSOK2sv4cn6G
	GcQw7Fjx076lxGhHtspOWpAs4pX+NfsbJXpLV8nCPOQ3FW6IyTBn3JkG9X9PZ7ap8A==
X-Gm-Gg: ASbGncvrLQo6Io6cSY2NViTGSsFI9gkMbV3c3jOdM61cPPuDw4NQEBYVBTfy37jF0AR
	tiZlNiKF8EscLDGRpbbprieybslWDPeMXx11p3Rs0STZ3DFbTAntyHC2wvjbhDfFBt72/CbA9xA
	sPzws56Wp0FYr8RhN35lnl/ZtM8f2nmvLFdqKN7sbWPb/BQQkJn4rPPYH8fcCKtYWBlZuGyk52D
	fI3mCoLHZXxiJsx5hBr+1xQVRGM9bGrtXO/ILR2SIjMu2ImY0Y42/4fDuihFm99KCl/lu/vggD7
	KFMW+VYJDtTR9CBYhor9yNm9wVKKzcvd9FsVyZdz5wV43RCvffbrt5T9ymzNNoLYc5KaGPCYY+u
	AGIwynCRArfWo2s3U7Q==
X-Google-Smtp-Source: AGHT+IEUHm1wZNdfyUY8NiVVrmc8c22MR+Lj4Y4EqfglE9tVmzbAAQqqaSGPkDQdsGEihgYnq0Ecxw==
X-Received: by 2002:a5d:59ae:0:b0:3a0:b84d:60cc with SMTP id ffacd0b85a97d-3a1f6421bd5mr14438192f8f.2.1747130963996;
        Tue, 13 May 2025 03:09:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2b29sm15846995f8f.53.2025.05.13.03.09.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:09:23 -0700 (PDT)
Message-ID: <59b505e1-3cc7-4308-a546-d9c4663c5333@linaro.org>
Date: Tue, 13 May 2025 11:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 29/48] target/arm/ptw: replace target_ulong with
 int64_t
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-30-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-30-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0ZawLJ1wrJSs

Hi Pierrick,

On 12/5/25 20:04, Pierrick Bouvier wrote:
> sextract64 returns a signed value.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/ptw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 89979c07e5a..68ec3f5e755 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1660,7 +1660,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>       uint64_t ttbr;
>       hwaddr descaddr, indexmask, indexmask_grainsize;
>       uint32_t tableattrs;
> -    target_ulong page_size;
> +    uint64_t page_size;

Subject mentions int64_t, description mentions signed,
but patch uses unsigned uint64_t, is that expected?

>       uint64_t attrs;
>       int32_t stride;
>       int addrsize, inputsize, outputsize;
> @@ -1733,7 +1733,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>        * validation to do here.
>        */
>       if (inputsize < addrsize) {
> -        target_ulong top_bits = sextract64(address, inputsize,
> +        uint64_t top_bits = sextract64(address, inputsize,
>                                              addrsize - inputsize);
>           if (-top_bits != param.select) {
>               /* The gap between the two regions is a Translation fault */
