Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36847njj;
        Mon, 28 Oct 2024 23:11:16 -0700 (PDT)
X-Received: by 2002:a05:600c:450f:b0:431:136b:8bef with SMTP id 5b1f17b1804b1-431b55e6011mr6437355e9.7.1730182275827;
        Mon, 28 Oct 2024 23:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182275; cv=none;
        d=google.com; s=arc-20240605;
        b=ZxI9hLyZoqgrUiYDSn6my2AkTip5LbWwgLJZSgDN9YIdinIwEg20hZ7d9OL1D749Fe
         sosqEwHvgqp+hZLwfmgY0pVsXSh/3uStxpz9IaWL9VvHHn/T0BxomaLH0SXPG+PQmssp
         tXcWtWcWbXF7gYFbEd+tQCIl5Es7xehqxIiMLiuNss90PeauNBZZXOIS2O/O/e6SUAry
         nUiQP9K5tS/JdNXigUPjOAjZDdCxlpvOykZaxOyLC09GBSuIyv2HcvrQQVsgaJBnwnC5
         dC44UT7KjONLC/Ry0QNNcHcy1ZSrGmQHRwF/fYIGPF6hGhGgVKuKlIDz3XEQF1mHkK2g
         ClJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2Sn7dnxFDpjbpR+864fGEqvnIzbs6s3UCPBypZxjA6c=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=e9ItM3VNaI8DRfUykW8B9PliuPv1uzGA8C5cm+xOXfAdOh2gXMO9hb0aKMyA4DYn0q
         mI3pFuxdPLDhUd8FpmdmM4tjQvJJ2GZoLMJOIw8+m6m/3rPrNLznds+ioAVJy8BNy0KS
         Y4XQPQvesM760MhRkpxWeO2o8dbH7uivi0I0N2IV3OFtmzbj/1UL15ytBKoL1BU5aDQ9
         er4kSFF1DzOuznY3MVBc8sUHR+j7fd87J/4/WyPFjEzwVasS0o7Qbvnu4dAgKlUzYLca
         axu+ivr39nPaLsavLir/Ujtf2BAcyHFa8rQbjrJnwfjitK4LOQOwFTiWWMDt62CXcHtV
         0Suw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iu+eKP/p";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431936514fdsor23093015e9.5.2024.10.28.23.11.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iu+eKP/p";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182275; x=1730787075; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Sn7dnxFDpjbpR+864fGEqvnIzbs6s3UCPBypZxjA6c=;
        b=iu+eKP/pMYgH/ZMyoPAlx/F1rwiYc278SlxgrpqmJiG3wkqAV7ePIgDlPx86Q1rXX7
         MQqDTsmLId+8osVm7QDD4uS+PQacSrDvPaPEgOjbY9zMr8w6/Q6PMo8JeA0O1emmBo17
         Tv3oHYThhjLHyd/LWG6EvmKIU2A1zosHUKPaPI+Wq/C+noE3DLdS0vwckzu3QvNB5Lgk
         v0mChFdSOEY0/d1Lmh+TI9RA9x6npMfcnuDawFi1cFX4bNLhPkgY96DMACirWGPyH8oj
         S2jwmBhlGqLIVLZxcThJTcrecTwQHfN3nklzxYJQ8KaIBnlPJEj1d0XZtzjn0imqrZXx
         AspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182275; x=1730787075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Sn7dnxFDpjbpR+864fGEqvnIzbs6s3UCPBypZxjA6c=;
        b=ExrEeVkPC/1izsZZ73Fdf8C3ZwNFWMJKmuQWA4qu9ltagG6a3mHTzPwkS0l2mUUhLi
         TcQos8kykifs34Y24CWGwMwTmmf92fP/Z0RRyRqXLARkdaUussKBrVmwuvvaLCyqyz1S
         O/Y9HMqzrEO7pcLyYD1sym7n5vjX99xopqLdlIgrlK2lk3SYRXSfmeNT95gItoJC+OSR
         P7XBbWWNw/MkMVPwiMUzCNMuP3UXr/ALPM0AW2a2ljPImF8j4nMtpn7U1n/UN/nPoWfb
         wKRZGabV/hJunUNpBYX1YVpfaC1ojAngsHE83+nJkxWg1nOrceRWCEqmfX/+ndwbhjsG
         8Hlw==
X-Gm-Message-State: AOJu0Yzjs4ZF/aOfvNO0r/qqG61Bt1ZmgLq1cz76zsJW8fDk0wcHzG4i
	wc+Jkt8qODFNdt8/otZFmiEtFVovomAXyLUuPTV8pCoqqBpTGwCPpLQHkLSDkKD5xg==
X-Google-Smtp-Source: AGHT+IFVfS6+7h55NBGwVYtCNaB0wCrswmGz1sjCdbGLYykZJBDTYvp/54aKNIKxi8MoU1nTnMn68g==
X-Received: by 2002:a05:600c:1c0e:b0:431:5226:1633 with SMTP id 5b1f17b1804b1-431b5719562mr5656585e9.6.1730182275193;
        Mon, 28 Oct 2024 23:11:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b566f11sm161756735e9.20.2024.10.28.23.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:11:14 -0700 (PDT)
Message-ID: <82df9519-6e76-4aff-aa51-070ea96c8ba5@linaro.org>
Date: Mon, 28 Oct 2024 12:26:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/21] target/openrisc: Explicitly set 2-NaN propagation
 rule
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
 <20241025141254.2141506-20-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 8BfHS1hHLEoI

On 10/25/24 15:12, Peter Maydell wrote:
> Set the NaN propagation rule explicitly for the float_status word
> used in the openrisc target.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/openrisc/cpu.c          | 6 ++++++
>   fpu/softfloat-specialize.c.inc | 2 +-
>   2 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
