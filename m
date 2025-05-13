Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp403161njb;
        Tue, 13 May 2025 03:00:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCsmyBfgaxcnnZH42SoCuG/qp5SUm0P/v2zqnxt42mKx3iAyRQDOVxAYa2UT/Djp29ucBHgoxo1xcfNA==@linaro.org
X-Received: by 2002:a05:6000:4283:b0:3a0:8524:b480 with SMTP id ffacd0b85a97d-3a340d15a00mr2370121f8f.2.1747130445878;
        Tue, 13 May 2025 03:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130445; cv=none;
        d=google.com; s=arc-20240605;
        b=IkDHJ2dDHDbVrSWXFX5R6ZKJMEH1XXA9G5wiUnA9hM8vAWpk6YrWEexot6eFq9q2GK
         caH42psvz44uUkCj2JvLAfZAsEGXSDL9rIKycCAVwDPKTBVsaZAdNWmZdaVer1wEYjfX
         Nvo9UyWMXDsrm9jQoPWobqFa3EXjTbPylvB9uPE00s1ARgdpBr8t/G9esdew0l+acePL
         98/B3GAVQFiVzJk/Wtafsx78dQaDJJVz6yIVTXTuclYjXwkPbSwpMJY/NT44MagjGTSP
         aaGiUxJoj2cdySgBq6vViyUm1x8hFYFaX5focjsaBIUGh7PA0LiTdMkHdMUoWpcvc8jF
         //4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=A6X/8oxrpAwVwBgKDFjZb6gd7YyOOEgNL2DIro56QAg=;
        fh=HiYtKRzEuRCyXNxIm0KkGxkprwKitVDp3uh/FKC/uEs=;
        b=ZqwFHpd8W0Fig90NXe1ms8DJiRg7a+Twe/s8pOOJw6UBPm/uKmMCLgQOPiPGq4C/Yz
         /Mgo4GJHzgE5gebK/1xmi++3CJ03bxzBf5NXo6+JbhaSZEkHaLohT06LEwErZCEDnVt3
         OSroi85xL0qW+qdgs+j6AvVVnDAJeTc8/Kc3nl39ZzmCXtMG8V5br/2ksZYMsPYdYP7a
         so/aEUEadnhocoGqia/K4kq6GMqJzWTk0tYCqdUZOWXXSYaJb2oEsLAZ6TuR+WnspAtB
         t9rwsdpwk8Ft53c+6nW1HUdvijOZT/CKNB1iWVZ6hzB+rn7+5H5mX+lkotKyNgQknuFd
         gf7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jn1bJJAd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a2078deb16sor783495f8f.3.2025.05.13.03.00.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 May 2025 03:00:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jn1bJJAd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130445; x=1747735245; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6X/8oxrpAwVwBgKDFjZb6gd7YyOOEgNL2DIro56QAg=;
        b=Jn1bJJAd9JBkdCgV4c6WdIBVJxNovQ/MXwNLeVRiirJwy3SvP9S+bHdp7Iv1W6UMse
         qiYS3VaoepNpSXKIyo/nNUDlW+9sas/GnmUh4p5JBt14v/ttrl8bTpsSwWZBDONbtPrn
         QBJLmmaJD5yuwRTanYtUSBCN6H0KoOAyTl8rfix3eC8s/0TIISzIwB6FJGDICNt7QWDf
         NPy48mSmUnPb8Vn9Zo6xO5NpvVWQlo9Gc96c5p7Y43pICvU89DcHNLjhfv+hYcWtmhva
         iNcuOS/HL4Od+YASH751FczZupXHs9JGe8F+iRgHtqiZJhozcRfX1RZU+ABzJdRir0UK
         AzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130445; x=1747735245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6X/8oxrpAwVwBgKDFjZb6gd7YyOOEgNL2DIro56QAg=;
        b=FJbGnej4l0DfNGCx9zFOpQ+NfJbYKAZPdade0eccY16YGsbJGY6NqN3oQrzejoHiOW
         90lVORYuMaVHI95sYzXySEHQaxuWYbvLbckiQU5XqtmxYHdvk10KqpCjp7wl5veYxCUg
         Bwg3FQCpJf89UVXA6QQM0BKaU/HrhIisJd5e0jzKdvXhsgOTI3iK5ec70tbMTAcYyz/i
         yniWfwjAG9lnr1O4GQ0KqsCLNQ9NybWPVx4BYO99Rn3HDDZwKoqndGp6yw2cc92cMo1q
         P6rcVjC4VrJ6ha0h6kjgpy6xeLZVB7pNaAAXHSJf1nTq90mN+9g1EFZCE47iK+TgFFl5
         W+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUk9XI4ZfwBXPPfESeAteJUniO34Sm2FQxhVSR7hhnwPj6dIxTwlYG5BGu4L1AvG34rgXXAoghCLRiBbg==@linaro.org
X-Gm-Message-State: AOJu0YzPKRQA9nB9ovF4B1ojJy/8fMm4Ahx2+almIrlA6zndgi4p+3th
	W7qhPsD3cg+zwv3X8wM6LiVJmrMG61RUfPZ8391l3N96k5l9Ma0lGxsy7jfk2ksraw==
X-Gm-Gg: ASbGncvf55JAHS67T6BFH2hu5EdQ7XHFnJYd0ymApjnlib+2S5Va+PX84CK3AmDOcIU
	wn3Juuy8Ni29JXA+pGsYY9D00VTodFEUtwpOYvhYxC4lkVpWps0MK309dWY46vZcQn1aRdgym56
	qA8NpF9pkkHnG36bO9LHQJvP94bfHjBR385pQsUXvPz42zlwBx9wnQ/OFiNhKlFujNDGJX6hh32
	KJlguYY1QAQU0eAs7sYYL1SaxW/bPNFFEolMeFEZfEpT2Uuqg7ntqNn4XwUD8pt7N6/lU7YLQWL
	mSpiv7sUhtCaaCuY6kXshB7+QgncdstleCCy73J1ES6TIb8a4qDhiFzOiTRqet0K9/Ytwji9yVZ
	3tI4mtwWkH2lK
X-Google-Smtp-Source: AGHT+IE9noWdUSLKLXTSJ+E5Phwdhc/M6/7kGwEv8EQZtG6DJWhggVKOupQOu5BGqxQvxDgrVQ66mg==
X-Received: by 2002:a05:6000:250f:b0:3a1:1215:9bc with SMTP id ffacd0b85a97d-3a340d34583mr2205372f8f.27.1747130445153;
        Tue, 13 May 2025 03:00:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2a79sm15364718f8f.48.2025.05.13.03.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:00:44 -0700 (PDT)
Message-ID: <af13ffc1-961f-4f5e-ac32-856faf4f0212@linaro.org>
Date: Tue, 13 May 2025 11:00:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/48] target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, alex.bennee@linaro.org, anjo@rev.ng,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
 <20250512180502.2395029-6-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250512180502.2395029-6-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Yx/7vjbPwnS3

On 12/5/25 20:04, Pierrick Bouvier wrote:
> Needed in target/arm/cpu.c once kvm is possible.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/kvm-stub.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
