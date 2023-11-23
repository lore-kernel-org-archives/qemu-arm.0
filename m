Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp272971ejj;
        Thu, 23 Nov 2023 02:00:51 -0800 (PST)
X-Received: by 2002:a05:6000:18a4:b0:332:d48d:3414 with SMTP id b4-20020a05600018a400b00332d48d3414mr3313962wri.50.1700733650900;
        Thu, 23 Nov 2023 02:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700733650; cv=none;
        d=google.com; s=arc-20160816;
        b=JSDVVA5vspes8DtcXUjJzQt9DDmQn425AazNIb8ZWP9XRq1FnH2ePvWVVC/30gSNGx
         OI0/DaK5A2z1JC5PgKbpaNw3TMc47tkvRrzpOXs8wvSaN/DYBwD6fCkao3Ft0aMBcJEZ
         CZwu1vRwj/+5RQdG8fVkps2UzqG4uAe6IVoBgHjSmFrhz5MB6Zb8P6Y/WBWAllyrIxKX
         74tSe1GHhFbDEdl6/6CbhsPDn5+abd5jgewd59pNk/ZPgx0jme/yqjRQkoRxECgdvpBQ
         Z1mh6isHGRt/63GyTCFMHEFCIHzhN5949T5SyX9om3+qZ9prPrbK7AYTNA+cfQPOjTQq
         bGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uhF8UjaKtMa3szBB3PYJ7CaLfrF8gURumFjUK6ZS6vo=;
        fh=/Jij6XHzk97EGjn8kiPNQAHV5Sa0Deqi0/ecY0NYlF8=;
        b=Zs/KvJCoBA8E1XdSw54m9Izym8JOh29FWldWAZEc5tnMw1/Z1wpgTxG5Sk5pVSwpoH
         9IMRYBPyufZaUO0gKBpiPLm6b0Cc9vqX5jBptLaO+o/o8LOgJ1awBECJoi+5WwiwKFAp
         SxqTrYfDqjJC5PYxi9/elhQ4qqDDz6yLQBA0dRvGP0euNJbce7iHyZ4q+NlEpxn1dKk6
         n3zrSluUsWbtLQwU/Nb73Zxuvi51lX8/+ESZJxri47LRubEmXcs78xv/7RGZpf+JiOer
         7RDBQsSdXIWTFPCxj6anQqi3NqKQislKm7gdypQVfLfxINpJ/kAeJOfKF5FMkuqXtlw6
         rv0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pyaIeGF1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q3-20020adf9dc3000000b00332ddd885b5sor210105wre.0.2023.11.23.02.00.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Nov 2023 02:00:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pyaIeGF1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700733650; x=1701338450; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uhF8UjaKtMa3szBB3PYJ7CaLfrF8gURumFjUK6ZS6vo=;
        b=pyaIeGF1wlwmEfhJW/UaXAvMN80OfBQhhCVpXh5wqXg3/QT7VGiRIxLzErcb6HvIlg
         3DYC+2P2M6KVCfKx6fRvvcK7cmChswsKVgATcah6KtUTUMl/MKqRURwOlZi4vCKSbekj
         qCfB+PEhzoOER0/5ZtpMlRIoJm3qlxpoD84NgqzkDnm9dT6BMliHHKeta5vXHMVjRQRg
         5ml5bHoRC4jsZzjeh6Wdm/v/Ago0aQUzK/Or5SxPiM9utIlUK2Rjk5oKCBEhRGcpSsES
         5+OyI1aH0vKjk8WEL4unHmfEiv+Qj69QOQrvgmVWUN5JKwBGjREMwpOiU1Fc/ORENO3V
         oDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700733650; x=1701338450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhF8UjaKtMa3szBB3PYJ7CaLfrF8gURumFjUK6ZS6vo=;
        b=gGAtnvJFLMqbMctdfxHwL9WsjYXmHAbfWk/fpVvvtRLC0Kf5KYOncujOq4oT+wvFPv
         zt1U3FzSX6RO9xWPHYyw9gfJAARSet7EFpbxEIqE3tTt2UkimthXVNlFAV2ZQUuEFGlB
         JYgyjvGWIjW6OBvOgH/UgALy5YmsLEproynLCT4ylRHnxjMTJ/Usvrogj81/V3Y+B4Uz
         Zx/pthqltBFXqv78pNMLBFgfMWpDPKME5ol0PfOYeneH5tTC4P0fjSZaYWLdCF372ErK
         OugD4ADsyCTdhrcqV381Y5IVGp4sWEZhuvmhymJUJF9JqY1PO6j/7Ies5gM5Gd1HjIv+
         rMxQ==
X-Gm-Message-State: AOJu0Ywm62PZVjhGggk0aFwi1jZD6EGD6k8S9EAFUO467S4h5ypayaD2
	1QdC9bJDHvdQd+/F3c7xcihzdeJH
X-Google-Smtp-Source: AGHT+IHx+SD/0zkpuvOSADdw6ceWWuFrh9u4dDRlbXzg8816flrF3uNsgv9Mzcp+b+WTVscveXh0yA==
X-Received: by 2002:a05:600c:3108:b0:409:703c:b9b1 with SMTP id g8-20020a05600c310800b00409703cb9b1mr3507739wmo.40.1700733649821;
        Thu, 23 Nov 2023 02:00:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c4e9200b00403b63e87f2sm1430208wmq.32.2023.11.23.02.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 02:00:49 -0800 (PST)
Message-ID: <4b89c690-1a21-439d-ab30-0fa5bc7bb038@linaro.org>
Date: Thu, 23 Nov 2023 11:00:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.0 02/11] target/arm: Add
 target_aarch64_available() helper
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
 <20231122183048.17150-3-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231122183048.17150-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FeA+m8fTJpq4

On 22/11/23 19:30, Philippe Mathieu-Daudé wrote:
> We want to build HW models once, but don't want to
> register types when all prerequisites are satisfied. Add
> the target_aarch64_available() to know at runtime whether
> TARGET_AARCH64 is built-in.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu-qom.h | 2 ++
>   target/arm/cpu.c     | 9 +++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index 02b914c876..bf6b3604ed 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -33,4 +33,6 @@ typedef struct AArch64CPUClass AArch64CPUClass;
>   DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
>                          TYPE_AARCH64_CPU)
>   
> +bool target_aarch64_available(void);
> +
>   #endif
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 25e9d2ae7b..1990c04089 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2548,3 +2548,12 @@ static void arm_cpu_register_types(void)
>   }
>   
>   type_init(arm_cpu_register_types)
> +
> +bool target_aarch64_available(void)
> +{
> +#ifdef TARGET_AARCH64
> +    return true;
> +#else
> +    return false;
> +#endif
> +}

I forgot to precise here, what was discussed during the previous 2
years. Eventually qemu-system-arm is absorbed by qemu-system-aarch64,
but to keep backward compatibility we add a new qemu-system-arm wrapper
which simply calls 'qemu-system-aarch64 --32bit-only' (or better named
option) forwarding the same command line. target_aarch64_available()
then becomes:

   bool target_aarch64_available(void)
   {
     return option_32bit_only == false;
   }
