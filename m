Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp407308njb;
        Tue, 13 May 2025 03:07:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnky8XwWoiIXQ+YWjYdWkzmBICs/flhp803XxOl449IlaSsEFtPjZfwLwPSeMGt1PciWBPNwcxvKVKdA==@linaro.org
X-Received: by 2002:a05:6000:430e:b0:3a0:8291:20d0 with SMTP id ffacd0b85a97d-3a1f6445611mr14063141f8f.29.1747130867522;
        Tue, 13 May 2025 03:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130867; cv=none;
        d=google.com; s=arc-20240605;
        b=DfvtRPCiBZEgLgG0qRNRGOzMy5QXuYhhwn6FI7shFLYbAGfeTHREbIOtsWip24R4Uz
         +HCSTjc9nTubI35ebbzjfqopdvtE5Ys42OxbpBWU2ZOJf7WFd/+7mzwWRTVzMAqZ3PLx
         Xy/s2XaLPpqHknomfxHgu06sL96hWTBfGdZyIsQs3o6/2mO0XRcnYBSv2/OZz1Pgoo4R
         ijNYPyuHAV9tAUfvHhXICdrNCdXnc5ubNimo2xzYIWJv64AqV11j85vDR8I5eooh0Nzq
         hqxMlbUmTi0sa+YZMb3QlL/uE2bKdSAXpVWDCCSbY7ru31m/q6+Pf0UWqR8+MhlmCgSA
         dMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=q5InSWHz49sEJKfoQ2QNQ6ZQPGuqc5C2fmBxgyhIp60=;
        fh=0OKM3yTlBgkiBMuCJOp3bUsLPWqPMqL0QkrX2kxcvww=;
        b=jC0qrwLFn8BEArhgOIMFL8bl+mRGZYEHOtIKEk4zj1GGNSarGWzFyAJn8uOxcOPJWW
         zA97GBwmpfpumuOfsOGVACu7WHP3NDz/33xUxhVMEa7O0hvND5hI9sgbebeX1Ra5HXlG
         1TTtMkRWwP+swi9HjzsK2yZ3CzbRp6+wdayG7cC0rAU8NUhqyzTfqYbomH7za9q3fY55
         iAeWnKXqfUQgLm2TQ8F/aDShcbsqcVTv9POtpQSKu3uv2eflzE11qFs26hVqmn8Z8OFx
         ic+OBibLNryc0V7gQBxamFjQmz6CxgCNt52FGH7thmGpwSY3KtFVj5K9PonO0w70r3gA
         l1cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkzDIBnU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a2078c913dsor973862f8f.8.2025.05.13.03.07.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:07:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkzDIBnU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130867; x=1747735667; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5InSWHz49sEJKfoQ2QNQ6ZQPGuqc5C2fmBxgyhIp60=;
        b=WkzDIBnU3DP0ehCiXG0tFlVEcCbzT/+aWw3G3qie+1mURRiQYI5te95Mdqmyylaa5z
         KoXrLNWYudy52ZMQgQTNuwtXZolFsWktisycl/ecG43bWbF8bzclT7/mg1JJfqKSjkYi
         Ag7CpDuecDSM0dKHET8Y5diwH+CRdh11PMPiPuPuUef7JQmQYy1EMuhz8IgPb0znhMZL
         EObNC+ceqgYvj8YtJjwDkh2Zi5cgn3Bkz4Nh3qemKzGdpD/Dnp/7ZaSW1XWDg9JGkyI7
         MlfbaUzkWp7zDNVDEZ7EcrkQbuE6WiiXDfOLqhweWErhE+XTKRMn21WJVpCmQY6iaqci
         xX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130867; x=1747735667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5InSWHz49sEJKfoQ2QNQ6ZQPGuqc5C2fmBxgyhIp60=;
        b=aZLZS7AWeHdSiuir5C1QViq6qnapMpW5wu+oy+sW4Vzyef4w5OsyCFyYGsA84YVqjt
         K4oKt2JxWblrMxumrYFDZSnYzYSprVXuxV0ZyOF1GnkRemQYFwO8TMgga0hewg5zjZAR
         k/d7g8EXKkzNr6Zgu06rFHZojGXlzRBtmMdC817UzIq40utnDrDEptqx/QHM66KtvnpB
         tPXcxRG+W9kf5QW76anKYopsqjIHfdaOxFILMAHpWYKmG5xIrK73GUz9/kJRJRFyAsf4
         TrI/GPMP91vTYN4/A2IJP2u7ipdBOhrD9bFUSgDKBgt+jZ+o/lMnE6ZLI0SVKkGmKj9q
         itNA==
X-Forwarded-Encrypted: i=1; AJvYcCUPySTYKvzXJ7huYuW1JaI/97GMzcqMujPWU3dzPXS3STiRTzOUFV/SilnaOlNKaz5N2+doAd8ZTrecPQ==@linaro.org
X-Gm-Message-State: AOJu0YxqtPsvHuyTxQSnJDkVBHoX8ELI6lCbUIRy47yyjYUilPmDg6II
	UYe/ux3rN9CUfMAoAsEHdyXh7Np1EFD3Yif8+RqEX+wUFrOEmjlHL2gTKiU3P0wkI1nUM6ZiFn1
	Pcob9FgvXUQc=
X-Gm-Gg: ASbGncvNJ9f8aaUdcs2Dzjb7ayRJwqNAXKK0ptpkzkyTKGFvqCO5bgcY7n3+F/cgJUv
	XT7CE/zISPtWZotCfe7w2U+x/JFMLoIrDiVjXqx60jpDbskJjGw/CG1FPYB3kzLkRdSWy4n/oQj
	LXmLHKiLTFde9xEoN3L21OiUjAraIW1rBACOpO0X7yDoEHnrXmu01VNJOmMmkqA4zeYs+/UOX1D
	RBzuWA35/862+SjVaYskLn3+2L6cbDYZ7RlMT/jHgSoRrm+EKWKqZUJIrnZECt9KWLQxY3Wazm0
	XvQgdvNT11UFipDllWwJlGydzVMwrjxqLVaFx39fdk2JnWlEe4CWpzIHDP3y8Vulls/Psy+arTw
	Ai4wBLRtCJ9vscMnhPw==
X-Google-Smtp-Source: AGHT+IEOnwxZ1JusNsoCvG1vd1NMxSbChqXI542igsHv2GaoEABqup6FroB8iwhfyjOBtmplA56SdQ==
X-Received: by 2002:adf:b34a:0:b0:3a0:b8b0:440e with SMTP id ffacd0b85a97d-3a1f6482d4amr9896034f8f.45.1747130866873;
        Tue, 13 May 2025 03:07:46 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde27sm15954772f8f.17.2025.05.13.03.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:07:46 -0700 (PDT)
Message-ID: <f5c8fc6d-35a0-41a7-864e-ae89713f8f9b@linaro.org>
Date: Tue, 13 May 2025 11:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 26/48] target/arm/arch_dump: compile file once (system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-27-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-27-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kAyr9X5g2tUE

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
