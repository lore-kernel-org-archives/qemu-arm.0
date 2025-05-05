Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2648405njj;
        Mon, 5 May 2025 11:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCy5mmYk4jk6QEPyhuWfIugEpPN5WGrdVIc3jmns+7SsR91R+nNu0sfXHBJn8LIq4Y9SjHGBkWzMYqYQ==@linaro.org
X-Received: by 2002:aa7:9316:0:b0:736:339b:8296 with SMTP id d2e1a72fcca58-7406f17a52cmr12845333b3a.18.1746470751277;
        Mon, 05 May 2025 11:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746470751; cv=none;
        d=google.com; s=arc-20240605;
        b=TnxwDRu8N6jXltXkUcOvsbWneAgReazm0L+ifPCFZiwteH7rw6voubmjq8moiyPizq
         dIJ29yUYyYM8rAVjgpJS9Iv3/Nb5xX2x6Voj5hKki65DbKZVQfitUpsTDH0l0a+buFI5
         FTYyEg1xlcg83BRx2ww07WjYRE7yjbNOhNN8NVvtKY/Ws/S4CLZKbgTD2lOqlZD9yWoT
         Az3blGij8bvGQYxbre17iGOoIPxAgc64a8asvWbjBPagKHewQG03upi0948pK/rJBOj0
         LCCx/FRLMKWvKjoGiLJgVxA5UmqWOpPTTBu085O/Ie6cnFeDVqH4A/BHqOwViJRypJVT
         KKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aWTftBhQdOlFYtj6OF8kiijXsH+rAoychvoACwsGJw4=;
        fh=amtTXmPe1xVwJ50GP5MuCpuTQuWKffEH8qGNaHcm718=;
        b=Z1VyObi4ImbrwChgvdr9+uM1O9Z4hPMnfKsv7YL1ijQYqc4hpTzls5WvBXufuv2/IS
         ORQnifa9iNPRu6RtVGRTi6jgEQKywiro4Bbrv2QnHLLWumJZF3JZ4poVHbrSHaFqLfFP
         OVBFk5MGOKGPJGXh3/DNSGFvzWYyXdJZrTCmzQY7jLpA8/afHBWR6BTw+5YgeSD3otrs
         pvINBixuPgPmvSA+8jHSvQPyJi8nd6F2voy7qqWe6E2e5g1VLC8sWQOuKmJk33GQWQrW
         SveeQB9aYsBtTtK75UpCnKF7lzcARMEBi1ziubDdnvg0sg4WB6VRGtxpX5Ixw1Ro6NPn
         evSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJZmuSva;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef0e311sor5509379b3a.3.2025.05.05.11.45.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:45:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJZmuSva;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746470751; x=1747075551; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWTftBhQdOlFYtj6OF8kiijXsH+rAoychvoACwsGJw4=;
        b=TJZmuSva1hqDjlFHac9kbmB6nYVMRGnlFTLgi8+vc6uzx1xl8VoxPRH7gYU5A9JzbU
         WEJtH7kJjZjS1L9856tsNL2H729gPdmvKDCbElUCbVXEAYWz0IKY0DzX82ZkFlqktrRI
         tEcX0JmFNBukmNitCH80b30EFwqnZYWMVCnt6hACzuML9KRbgGI0k3jgdNdf0k+XRNIU
         FH6+x4fqjgIEsxFU5enDLypjRAu3heiDpfsTJDOfaUxgNS2zxz2PoakVpqbTd3b1yYBf
         08B6aTGmouQuKjBT3tU5Nvt7b1/jfcBOb5NMIu1os24K/p+5puEAzDwiZ5jKWyxlYDG9
         qaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470751; x=1747075551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWTftBhQdOlFYtj6OF8kiijXsH+rAoychvoACwsGJw4=;
        b=UOuhrl6Lm1OzKiviuQEClCu6ltK5p5zrxBI6++trZnQR220bJ/c6QMGWitWGVwJEyq
         n1PbHJDtS17mzWMX6Uw3963aHJll0sOgUXRC0AG8GZVQJmxbvGNHj7K04QfOl/G0rhNq
         qJkpd2TPVagnK64UD1HbJUoDBDha00niHlxQVnCCNC4dMPPV0DfaxejPQ3fShQvO/AiN
         kMaYkf7SH7nB7q6HweI5qQ5kQyIe0fn2Ws/ID2e6fZtB0pEHoCN5MT0utb1+7VCk8jki
         SkMUeIQqk6flkqwn0IfwClY1Y7GmMSw6pwFS9gfLvQHZjcT7hLX2mEnMh6Pez58G6oiU
         sbbw==
X-Forwarded-Encrypted: i=1; AJvYcCW/9Ju7lcpE15sRM24FoaHTSdxbvzaB4mxqLKpZ6zzvS/Ro2ceiFqwTbAOhEj2rRJVg80D5yfhvyJHSKQ==@linaro.org
X-Gm-Message-State: AOJu0YxMuKOYlI7rLXsY+iwAFMX+RFp6AxbyKf4XHIGMIR9xatXkAHPE
	2KJAK/nUwnAFRGK5773cszFX2Sa4KiQoSlK6cSBI66XdNBr1jV0oQXKBTEd0z3RUHg==
X-Gm-Gg: ASbGncs6UVAqEytGw3ziocWQU2Xsuhp8PfzT5it8z2r7h6FtMEBCW4N4BDdgh9HlOxz
	ifXnHJh5fb3Sh6O4k8LfjzONHwHtePHHY3vPmdemDcV3YJUf68MVW7uDY6w5n4BcXZRFA96+Z4J
	UVSf/BePz393XT4lEEmwnDLz4M4FiZjJMoF+UPPwFwuzBZ/UEw0FgbAEyVw5j50QnCyG01QQOyx
	zFnnxduT1FD0kMoYpr6gi/wiS9ZaXSQZ1BOjujIr4+dePnptuNMa2CQ+H+9crOrFRHnJ0ofpqvO
	iX9dviYP6EmT/c8t+UZWzZ+DGUx2OCAeWvmxFGpVNa87O1eoczDmgGhnkMMlNuzSADVNJNK+Wvv
	2YWyM3Ro=
X-Google-Smtp-Source: AGHT+IFBOsH5CpfTxma1JoQvpcL77zl4kO0LTsZyBNW1tuAbC5hqFDV3tzQd3HoxiOwVaQVcEYEh3A==
X-Received: by 2002:a05:6a20:1589:b0:1f5:6c94:2cc1 with SMTP id adf61e73a8af0-20e96ae6ab0mr12225551637.21.1746470750828;
        Mon, 05 May 2025 11:45:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020faesm7445748b3a.95.2025.05.05.11.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:45:50 -0700 (PDT)
Message-ID: <fa968652-f8ad-48a7-a320-c38c01a6bcc2@linaro.org>
Date: Mon, 5 May 2025 11:45:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 45/48] target/arm/tcg/tlb_helper: compile file twice
 (system, user)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-46-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505015223.3895275-46-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: c2FAec+PThlx

On 5/4/25 18:52, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/tlb_helper.c | 3 ++-
>   target/arm/tcg/meson.build  | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
