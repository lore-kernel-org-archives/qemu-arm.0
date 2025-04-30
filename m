Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1156068njm;
        Wed, 30 Apr 2025 11:39:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULQbgmmX1zkhDSs8cWp8PVZNgK8DUAl3bS8SyJzkQeF/IKTkK1Kg2n45eYOb70JV7LEaPZVDT8H6rNXA==@linaro.org
X-Received: by 2002:a17:902:dac3:b0:223:faf5:c82 with SMTP id d9443c01a7336-22df5769b69mr47983475ad.8.1746038380072;
        Wed, 30 Apr 2025 11:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746038380; cv=none;
        d=google.com; s=arc-20240605;
        b=dhWngM0c0m/IzCVdztjIEEHweXayxQVHc9BPSuVo0/KN/WbOWyQJzhP7mdwADDbJFh
         nZNbQ4JOmB1j3kPPxHTITKc3Q83eaFSF4IAapisA5eTVt5lmNuO75QTQqD2o1C8++kSw
         BbjLvyzUdXr3iQf/31111bz63r1sf2z/OM/I414gHp6O0Y5uYpkpcDETU/2Gmtgy1LSG
         h0vdqaU5xNOSbvdxOno1UNezUcuJw6ZKDHuAsrkIT+UEznXBFrFnh96yUdB+MLAJkm+t
         GIL7O+A9f7UfWPkC4lDNQs8NFsY3ebYOZDkQXCpJi1KswffDmssSALhVqNQPVkCX5A2N
         zkJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2ff8Y6zqBYXNmm9gwXG98+NPFRnuYVDI1VQURvXQtWA=;
        fh=p6ZUOrcw0V3vzcoZUWi8ClbX/Y5kYbxe90gE/r3Y/Eg=;
        b=hG8dqzmM1qlIVbP+Yn9JOpSItC1rFd0sBEfcKJAnP6/2362pcW9at8xHpMVBm1j3Zu
         YbZvBtHVg3djjW2258Ic3RjkuWaw3nJVsM+r1vsdZzAH4QmMmiJqLL39QfFyyQHNvfw6
         tSkFkfIhpfxmjMco9hxJxjJHhm0VPaIUhImGjsjQsfi+fsinBFz+MbuH8D1bYA/tYbnO
         kax/V07oF+5+CBwZoN4V/7yIXeuSD63MPlwLO2ZlE5fZ+Stll+zCrAKMSdfUR5zA6AzS
         UZRbbvY4CWrAfBMaVURqqkxYPmi4vNvo2TQ0rFm9fmSnmWlxOof1h0e/beV0W+EuwZlE
         W8AA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mta072Fl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db520e350sor100930675ad.16.2025.04.30.11.39.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 11:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mta072Fl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038379; x=1746643179; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ff8Y6zqBYXNmm9gwXG98+NPFRnuYVDI1VQURvXQtWA=;
        b=Mta072FlcjxiX6mCTohSbyvBqfXBBYlb/9Z/Zy8iRGwfVPT8y/Zk6lQAHBmExvY/Ud
         tSE0mfL7fVPQZufpwIzSzhA6D5Tfh/IFfEbFtACnX0bIPR3kd2bIP2UMWg1yVp+UFVym
         JmxC0kgSg7ZPZ2O/WqzYtrdVwSm4SD0imAayqha9XBLzQ0GqHJLMFZCK+Ao9lb5HN/OT
         M1eV0EYukK3a+InHpqkAvsXaBnCKOCLPspXhDJ8nrGUxqpK+/8Ch/22jwHDfzu/OA0nn
         g4aITKBqyoVPMmEQTE4kL+YcQRgpZ/kuihYHSJTwcsA+bg5Dj3c8R9FTt4Mc8nIT6ugE
         yUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038379; x=1746643179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ff8Y6zqBYXNmm9gwXG98+NPFRnuYVDI1VQURvXQtWA=;
        b=Tm7opoqmGb/iNqhA2x7k8hMO59d+4Bi3qNP0o2nF0K3Twqj/9LC5mLOAt3ctD7ig0W
         9bWb3DKjaOFW0k8gl54Fpq+W6gEegcc5hkdtXO73UTpHuoCRaXLWeTR1QLl+R/k7soVQ
         rLouh6TrkHwxHYCsJ+ianpfVsQe0AU+VpGh6hNCdt/1fkVYPz02K9RNhzXQGl4aAcF5N
         vhNNR44VQuH33Tg9apVcJq3MFtzqDAqDoR84WKVioZ76mrS8iIhqFSySgmBMEoB4nVx7
         vd6NKk+7xo8rY56nRQ811TQUd6BackW0RgN2ev2k6w2RSdv+KkOBLYZLsm9mfSY7N5pY
         HPMA==
X-Forwarded-Encrypted: i=1; AJvYcCWsaLpSSQZYuRgmrTe01zYovHk17GJ07o6Zfwz/1pgJvM6BvYmkC+aMCVEdmilrj656jwcfySzkbQmSog==@linaro.org
X-Gm-Message-State: AOJu0YwiZJrHYcdZMVVUSGrDijzIqBEYRpMWTQzLjH7AvaONAV0yBFPo
	2wUSeiPPPyWrgt2BsP0IJQgYX8XRnd+fkPlZ+iaLYi9X3hMd/nyOcxlsdMpEHEBlcpzoc+Uo/Wk
	QNF0=
X-Gm-Gg: ASbGncvXkAOnVVyCLbXkHHF3nuneumiA6u2py3Z5tcyVh3BWnoNncpGAali4OCcR3DE
	M0fzzhzDHSyJHnkimLKf9Eg/MAWlzJ19CnP96VBih6jIkYvRhLwONrtboEmyczml3KZXGELu4vO
	WFwjwAuFOPQM95/Mo1x4fCji7RokKmaeDIc+GvcqKNTO6y+iT0sSiuhAlu2MpZjF/u6toUWQGdP
	gLJpWaZ6yLg+cG5G9W5cBTC/Qs0cjLX9y5D6XXDDnaqIoQlImVq+dYObixyPF2OH25JWMaUKMsp
	+4QpjpuAm6g/C+xz0pb0zNg0107LKmwAamZ61b23RBiSYeKThz3sC6Vh9RCqcafRNl/s7E+YQ46
	SHnz1bU0=
X-Google-Smtp-Source: AGHT+IGXF4Fgw1kYgpyx8Ulqwz6AW0vOTKOeRFdEg9TqKru3gxSbDPa1DRENkGOwQUFTbr6oFy/sxA==
X-Received: by 2002:a17:903:3c67:b0:215:b473:1dc9 with SMTP id d9443c01a7336-22df5838ca7mr62603565ad.46.1746038379655;
        Wed, 30 Apr 2025 11:39:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5103259sm125531555ad.185.2025.04.30.11.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:39:39 -0700 (PDT)
Message-ID: <1c9aa799-4254-45de-9918-435566299b2e@linaro.org>
Date: Wed, 30 Apr 2025 11:39:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-6-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250430145838.1790471-6-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: WKtr9yt4btj6

On 4/30/25 07:58, Pierrick Bouvier wrote:
> Needed in target/arm/cpu.c once kvm is possible.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/kvm-stub.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
> index 2b73d0598c1..e34d3f5e6b4 100644
> --- a/target/arm/kvm-stub.c
> +++ b/target/arm/kvm-stub.c
> @@ -99,3 +99,8 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
>   {
>       g_assert_not_reached();
>   }
> +
> +void kvm_arm_reset_vcpu(ARMCPU *cpu)
> +{
> +    g_assert_not_reached();
> +}

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
