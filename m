Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1156908njm;
        Wed, 30 Apr 2025 11:41:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9IfegzfwMgWOPxA1kKaKSUTvFgM+2Tm/uzZh+6Cl46Na4flEuCR3hzGFBfkBpgbGXwUdEZtCY9tPv7w==@linaro.org
X-Received: by 2002:a05:6a21:1589:b0:1f5:874c:c987 with SMTP id adf61e73a8af0-20aa2be3bb2mr5058998637.15.1746038465931;
        Wed, 30 Apr 2025 11:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746038465; cv=none;
        d=google.com; s=arc-20240605;
        b=e6kRVSOpoy/Zz42FG1LrdDoG/dshI4bvc18UpKOS2wG16tEcawY7jEqPw6J2lqDzoW
         L9jBR+nPz4brAVm2DC7qTB1bZRboA3aBMEgXUAxrEv/4zwuEEp+bttFVjSxY09hDMb+f
         zZTrYBRUC9nuTGvB9ZpTjhoRF/3w5jFaS6hERqqyIcEKvvHygNdYIb+t/18oulovxRph
         5Sx7XgygK+oESCcc6DJWcS5iVYjP7Y27MpYJKosdLklaCTPCdIEN+yW6BXylzHi1R7fb
         /OOqCnZOQjZXNTw+sjK4qVkD7OsNEjzBOx0Kya2lFt1j7DqqZLUMIbI66qLAHxvKan+1
         +R9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mzSKvNAqsUnH5ctO4BhCeoMH5BT8Wk4EgybesA/rLfc=;
        fh=IWVC7/WLxkzIqFW70TyLSOvSS4Ae9IoaVQ9WQ74jTiY=;
        b=AV/wM8aEMZt0B+zUM2OvVjM9T+OKG2BPQNuvqDOhcMCE4GcSo66N7L2lE3Dw4Pk2Lm
         V3ONNOGTq+f9eyRjvlbfb9CCFaQgcgd/UDuc5Ej0MhXScvy+45bOzjMqqWiC835w2Spl
         QyDBN89Zh8XCk1bmER62Ue1A1LCxWP8hqIJ2lzAD+GCItgmaQUVTdbJARot6V9CPhuDI
         OE4Ycdabk7c3zqafmJvMcUQld5aa8u9Yrt9y4OBBHfw7Zf8PToSmJWbNk8gH8mo3dEeq
         MfDFkSxOkhBfsc7SNXt2gDHDVRX9OMsjP+kmEQYCfYG0hgo/1tu21n3mETJ/wyu+N798
         BsXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uCo7wIGI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b15f4d011e8sor10921849a12.0.2025.04.30.11.41.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 11:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uCo7wIGI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038465; x=1746643265; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzSKvNAqsUnH5ctO4BhCeoMH5BT8Wk4EgybesA/rLfc=;
        b=uCo7wIGIldYMFRZTzRJE10rRRHhKXmrGVxPsaf+k3n7ropD/jZXsPwXTbqPh2IyU6s
         dMxWHO1eR6AcL0BP6iPOKfFPADqFce+ntKXEQ/xX3d0zVTzSLD/CSn1D7HHaIuLHbpct
         2pCEvKRBqOsES6jDsnVCwdCZOrh/eFnAZ5lv33/fj/mm1Eu2/E8L7u3yroYGULLndjCY
         BnWp7J3fBPGWDzoDMyjFP7BhCtZbSPJAaD+mucspOLEQ/wMYENxg31/mcQXpKemc5Btf
         IDJd7PTlbVvR6sTrh6YW+/xulcuNtaME36C3yTi2Lz9HJJ2vlPINSk4jcfoQEOpsk2iI
         yHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038465; x=1746643265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzSKvNAqsUnH5ctO4BhCeoMH5BT8Wk4EgybesA/rLfc=;
        b=GtkZB8+7HIlrGJpqg/Q804lEt5hxUcKAIPGDp3oYLiHdYHeJqrqlpgior/0wcBOPq3
         v1Ez2HS3pD4RLKnJ9ieP10edf+uVaLc+YdBbJctdYHinLYVgw/lZZvApLDrrdPDSwybe
         4sLs2OT6mbVwfcefzkcsj53jVxd7MWlk9QaqYXdrJtP2WRw4NI6qVc1x+nzedkbDU2k/
         6BRkea4oS0ycWMqG8q86KEgjn9JokKXcu9XJ9Lx6fTsiTqsLI3xRn16JcKNb4zWaSwv9
         /evwjvKRmlvwH2/Jyxl81QsCBBKcrSemD0HnhH4wqc4N/3qkzYO5XVB8/nL92OUBfelQ
         rZ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMPL5S3ka3ORRi/WGLOIydrI6sDuM3eEO0q5XV75a9MeOM46sA87m1ZP+hnyoHJIgfKR56g2IV+nIvdw==@linaro.org
X-Gm-Message-State: AOJu0Yygwt+Mj5WffJfK7rBjgie0x3/SyOBQ1zduzOLOjdIawTYECRIM
	E98FmEWsfGy19F1Nroqujx6QtEM2Got12Olw1Fv2+uhlU7qQa9d2hwdUAqo5OLMxJA==
X-Gm-Gg: ASbGncsrOdacEeQd72xvd0zy+TwZLyJIPzgiMBsijLnGMhKpM3TcBNXRRj41daqq/Eg
	xYUmqGzu+2tsIg7CedimuRMDQ8AphY7/Tyn01Gcxs1BYnqreztRuDZqKGUEot5YWlsRTfRYHdsr
	anx2wyBvg+voNsFib0xcSrtXjcr1wz628tKdAcghjdOshmw9yhWcHV3gvdoe/WKo++09FrY1vr+
	o93IgHe10bv6E9CMjCijX+4MDGDr+6RBq8XyhcpfVnFHGsuw/oeWZHv1uWlNmP++rgwA+dC6Y9b
	HwkSriBs6y6kOTtAGZEyG7yQAFnjYwWi4sdjyo8tKPgmCshhRZrdqYlbjyX6bk6QPJEHFp2O7Ic
	ajpHzU5Q=
X-Google-Smtp-Source: AGHT+IHkVhvhoqpOiueBFVAVKu1bI6pPByHvnXhSTgpQBKrZ/5Kcp+BpBsGGNCJZP+3+hpNcQ9Z3wQ==
X-Received: by 2002:a05:6a20:c704:b0:1f5:790c:94a with SMTP id adf61e73a8af0-20aa30d3d00mr6118919637.25.1746038465521;
        Wed, 30 Apr 2025 11:41:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740399415bcsm2026012b3a.73.2025.04.30.11.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:41:05 -0700 (PDT)
Message-ID: <9e612606-c7ba-4f81-bbff-9653aca9742c@linaro.org>
Date: Wed, 30 Apr 2025 11:41:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] target/arm/cpu: move arm_cpu_kvm_set_irq to
 kvm.c
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org, anjo@rev.ng
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
 <20250430145838.1790471-7-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250430145838.1790471-7-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: pK59k8VDIFCl

On 4/30/25 07:58, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/kvm_arm.h  |  2 ++
>   target/arm/cpu.c      | 31 -------------------------------
>   target/arm/kvm-stub.c |  5 +++++
>   target/arm/kvm.c      | 29 +++++++++++++++++++++++++++++
>   4 files changed, 36 insertions(+), 31 deletions(-)

Nice.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
