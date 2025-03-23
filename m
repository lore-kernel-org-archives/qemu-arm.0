Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1559068njc;
        Sun, 23 Mar 2025 12:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjqEOls0Lbu3MUtZJ7Txs3DRMNpiBBFQwjla99YnKAlaA4+ZigHjonva/mnAk6yMXTJe49Z0Xd2ZdutA==@linaro.org
X-Received: by 2002:a05:6a00:1885:b0:736:2ff4:f255 with SMTP id d2e1a72fcca58-73905a139eemr15322891b3a.15.1742758504812;
        Sun, 23 Mar 2025 12:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742758504; cv=none;
        d=google.com; s=arc-20240605;
        b=NZQIbHZh3QnhpC07aeB8C7nX9x2g9jGb4BxPa336ze/24Cnmf+gil+mjWkmKVEg6KR
         qSBJ8A9tS9+PsKIZvF0Cg9/XQ0zye8WOYVPsRgAlDYEHBUo0gncztVKtdbdjGjf3omYl
         adSKwy7FzNbM20rkeyldebDkTRBpGz2SIxsNcNltZ5tBVyjUdkr38G+vynYEXG9m/CbZ
         pQpB4C0yyDbZtS0pBBKkmkeZJrk/8iciksobXeizN3k3A6FJesuYZRAIEF3c8z5EQ14x
         z0JsOdcdAfXl5Am+4xhggQsFQw2mVrOvQsURy+co4JSgmvEdemMXu1gl2p7s+8XBebGX
         hs9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6uFHprcikhpymWB55yCpTb6bdCmVjwgeavCcPBcr96U=;
        fh=+QUxOVYm2yr1I4ZliXO/yOWb0kI7Ruut5RSB9wBqbL8=;
        b=Y9HB4eYDQDtPwBe3jTlMsX9Du6WHeM+CF6EcqBdA6pGJLuyZQCZZCYqCOnSRouiJvn
         8jmShvb9PcvUmIr4wsgUudWt32y5sUcEwXjgL45ICZiTJWFhXZSA6/ICM+1UAujQXiM5
         lL3gG66yaayeRQTVhqjmEP7sO0VmJgn7Lx8YTmX0wUetvgACshKcjxX2ZMBkyMPvANnw
         pwyGNDkQqazzt7NwvSCPUQx/IYpduxLvb3Xq4cBPpMbOTjkD/GWxGbCOV5gCXwyGZQer
         Hy1lxdedxFgqO3e9Ef2gg9l61z94RqYUefT+8SqdDD5ioZsikFgC7KGBfgQrcHYWI0lC
         Hfzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a09KoFlw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905ee4951sor2928851b3a.1.2025.03.23.12.35.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 12:35:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a09KoFlw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742758504; x=1743363304; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uFHprcikhpymWB55yCpTb6bdCmVjwgeavCcPBcr96U=;
        b=a09KoFlweTnQu2e9JfehlTsh4OKcuT74y2kiIBJpM9za8KxG67Q+esaKtngFgU4BF+
         O/XVh7LeUIxDO1DUcmp4SgUXnffjNUFGN6lUfRHHFw3+UBav2MZBUg3grrqlvVEAB/rb
         QhPaiaNCkX9pzpsQq8AI0+0ra1LGc2jiHC+e510De71DvPCXhntiTznw1D0AGjLAw5CM
         2FbbRPYJaKoXFOaNPQ5Z7cL8gDbaOXSVD7tPL0s/7UOp2rxTyeIkMOQVABjJsCPHXFXb
         zZxUNOEMV6u44uAIadMztKDCBA4UWyHk3Cz0EP5d4Wb6IKfkHHdGEdYbF7wLkKL4vCnm
         RrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742758504; x=1743363304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6uFHprcikhpymWB55yCpTb6bdCmVjwgeavCcPBcr96U=;
        b=bAu91BOpjEMPYWFrgP8qE4IbEjzKFZOfFftgKhv0K6fvSA5dJ5YJJbp5AnVRkXzJQ8
         BiY9eD4bxl6UciwIi/zWgYdIAD8ZkqcXsZx3J4kiqYNis1FQQJNmag3LodZcOpJYjMBB
         tbWfdhu0TuTMNU7GrgdEyT8xGVwgV6CnTyQLy4JWZZqEo2WZ7JdTNL1TI0uAoyOp2ZJ4
         0A+joFI4i7BW2SjwrlvB9piO9V06r80A4NXxcTSGu/1VQH9Y/KKbTNmDHRrw9Ib4DmZs
         avIPShwUntGzHHdCO/xCcdaSuXjk9S3ztEdUY0d0gzHAbef629Xycsltj/xZTDLDOn5y
         DAEw==
X-Forwarded-Encrypted: i=1; AJvYcCVxt/k/Hcn917DKHYH52w58yHkuYvTcqsekiTFk2F4kNbcYvn/k5Jew3jc9YrqHN72gTL5T0YiBZjrIIw==@linaro.org
X-Gm-Message-State: AOJu0YzAzoqBBFYf48ioYJoCJ4wb60AmK2wH7jd0HCSTrYCBqaOju5BW
	CLY7Sd8tsWiMhSIuUo7kEmgJnsoidHLwE9dtNfPQQJccizi+No6P3ayhTDV5ut+dew==
X-Gm-Gg: ASbGncuFszV7Mig18IqMkn5n4YJvUJYpU6LsK5hvSm+zMvyYti8FrntzEXBotK37K6L
	DW6EWqBGTXnsA3vF//cSvhBaAeO1M6/amjA8FQt1PdDXWPFU9XcLZ8nOcDVGJ5YJ5JEfCr+9a3u
	Wei4hj9ZMpLUhazbKM5Dk7AG/Yn27VY7W+DcZTGQqkQPkhJsdbul9HupkxEdbbZLn1niLTObKaN
	eRBAOwDwQ4DQ0f8JLopLNHKexzjsdn4oMdAdu5OX1eJMgWm5PNr1c/i4G4mbzSEIbuwQWzRuEUn
	wrEt5zGxonBo3sVCzQTl9DOZYxhqH1WVxMsyigCge2nE3oqrY3aiYP12ZRcgmbG1/XG0MXmnr6s
	+63X3kOl9
X-Google-Smtp-Source: AGHT+IFgRup02ALEGV9Up4pGVIChVj4UQbwmHiBRpSmtL1xVI22i/KImHDNBG1uslaG2Cps0De1PoQ==
X-Received: by 2002:a05:6a21:3a90:b0:1f0:e3df:fe1 with SMTP id adf61e73a8af0-1fe42f09148mr16939001637.4.1742758504266;
        Sun, 23 Mar 2025 12:35:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27de717sm5639598a12.12.2025.03.23.12.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 12:35:03 -0700 (PDT)
Message-ID: <4586fe00-2be3-4d99-b681-5463058f3922@linaro.org>
Date: Sun, 23 Mar 2025 12:35:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/30] accel/kvm: move KVM_HAVE_MCE_INJECTION define to
 kvm-all.c
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-19-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250320223002.2915728-19-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 8XtLGS3jAeWi

On 3/20/25 15:29, Pierrick Bouvier wrote:
> This define is used only in accel/kvm/kvm-all.c, so we push directly the
> definition there. Add more visibility to kvm_arch_on_sigbus_vcpu() to
> allow removing this define from any header.
> 
> The architectures defining KVM_HAVE_MCE_INJECTION are i386, x86_64 and
> aarch64.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   include/system/kvm.h | 2 --
>   target/arm/cpu.h     | 4 ----
>   target/i386/cpu.h    | 2 --
>   accel/kvm/kvm-all.c  | 5 +++++
>   4 files changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
