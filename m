Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36864njj;
        Mon, 28 Oct 2024 23:11:18 -0700 (PDT)
X-Received: by 2002:a05:6512:1149:b0:52c:8979:9627 with SMTP id 2adb3069b0e04-53b348b9171mr5526402e87.3.1730182278219;
        Mon, 28 Oct 2024 23:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182278; cv=none;
        d=google.com; s=arc-20240605;
        b=B8Oa66DdEleRLOaN932sMIVo4MNKPit8EBWUkEj4zfKXs2l+Qa5V0ArJuvDc0UA6bb
         BypReDojb40MwQ8lSRLLu/b8OpEyNVn2uWmUf70JsEQJ1D3QN50b2qIHRqY+afPIlx9P
         nyLiFrAz3+0A1Hbk30ZS+mQ8Nz8Ks5zTRQOL7E2wEolFukei5HCEcDyhuIsgLDIN7QKQ
         6sE0C3DmLDxTx/i1pJNxjxsmxGxPUdQcUpUQi/8E9NLQBaND/5onXgZX/OKvGlFP9mAJ
         GifZUoHive6RblfZnDFjQtKnEm9A8UN5dR2TdwsZTObTGL3+TrxAXtFc/hEZ/4JP99i+
         1IaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zd1Za7QUTE81MUtcXO2Dh0AxK8A5R0bpE+34K6hdCE4=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=XVdhLkKSFFz4jRWbEeMNINX1j2T0V1yMHQYSFH7hQMYWNLMmXlMAJ5DrhUJgFGPn+L
         sorWKs/TOZoXLrLlTi+wAgj5dsG+EXvdH0PDNp/UHZh7iiK176cFX3ZTnDLbv8VKRb91
         2R23mKZnSbvu042fS0387Ak4XreqxOy2jiw0HAqEdfsPKIu9XRjmKRANxozyAkEb2456
         gs0PGHgQ6tlZOqBGB0UdGe7E44i8Yiq4/69/VQV18SgzSkHORPOOPXJn93OyS9KUPPOi
         LF3J8UY9UOUhBobMzbAjBXSydP3tePiWXMIcTIwe/5mhmAoqVprMQUyGuWtM34wFvcuh
         Hq3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KiOpTDm4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-53b2e1b7afesor2370060e87.22.2024.10.28.23.11.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KiOpTDm4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182278; x=1730787078; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zd1Za7QUTE81MUtcXO2Dh0AxK8A5R0bpE+34K6hdCE4=;
        b=KiOpTDm4vAUijqIA5NCboCTlAvwLvplhYPW0F0/4pCyWdz3/qLmMv/HVdeUzuF8znC
         xV4O0+qKY6dbWa6jPZYYRRy+MQDxtXbrGM1iaWsb0My8S1ffCKxhN2eX8MVfvPUmhwzi
         h47q7xBOC93jlyiDjfs6CpWn5St+0m5F97H7RoI/lJjFSugYfXw6Vhgjc7OhXRFmUxJN
         mRz51ltj97i3WGTP974d7OWD/gPv0iA60BstTGcX1Rxm3OZxZ7jYs48UEc88jOBYvz35
         eO8OZGx4cB4IrW9klNXi6b/2CuuzNiA4Tram51RZQD7LHGPkeYPG2/SvXPSL/m8PIRPu
         3/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182278; x=1730787078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zd1Za7QUTE81MUtcXO2Dh0AxK8A5R0bpE+34K6hdCE4=;
        b=vgE23o5fgvpWwnngL51w6zWJ/dImvaNrIdJqjDekNMeKRXxY1cLCejkk3hqPpCM+7j
         bK8ExwDKwnWBnX5i/qnEyL7rSu+/JsBadZGVGAKehWgrmy3yXw8U7cm4uFc9szd9FY0o
         xSLr89Oo6mEYww8TBnN06XNyTNsUc2vKJd25iw5cXsJpyrSxqfqShIlPhYVY/BxXkYsx
         8Hpj4PRV1jRcy3O7vIK+TngknfKZWIZlU+sHnqadH/ZTzayl3nD1SVaAas6yPBYEXWl0
         MWZDkLr6mE+gUpeYSCOrHayojsF/QvCdTCdVvnUriQE/7Xzd3Psqc6r5mSVoTeoH0p4S
         PjAA==
X-Gm-Message-State: AOJu0YxQZ14PThCErKwDYLyMx/Z0ZnbXtY3aPI209eAoK9Lk7j/mTp35
	7HrG9r7OlHGbdHgh5EUGQCUGJ5y4q8yvoSr3ygTZb1tQjUk+pOmpzaEW5ICKeqYwDw==
X-Google-Smtp-Source: AGHT+IEi9ZC0m5ZaMCM0x9XkEky1wgCCENUqwSMyW1jWrdINf/W8tmByQSY2veljvfBvjwTLzhPHdQ==
X-Received: by 2002:a05:6512:1384:b0:539:f13c:e5ce with SMTP id 2adb3069b0e04-53b3491ac10mr4753109e87.46.1730182277578;
        Mon, 28 Oct 2024 23:11:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b566f11sm161756735e9.20.2024.10.28.23.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:11:17 -0700 (PDT)
Message-ID: <1b40e160-b6f3-49e0-ad3b-178ed94e0279@linaro.org>
Date: Mon, 28 Oct 2024 12:27:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/21] target/rx: Explicitly set 2-NaN propagation rule
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-21-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: RXUTbcIfBcPa

On 10/25/24 15:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly for the float_status word
> used in the rx target.
> 
> This not the architecturally correct behaviour, but since this is a
> no-behaviour-change patch, we leave a TODO note to that effect.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/rx/cpu.c                | 7 +++++++
>   fpu/softfloat-specialize.c.inc | 3 ++-
>   2 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
