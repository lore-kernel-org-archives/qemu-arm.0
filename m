Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3103323ejc;
        Wed, 15 Nov 2023 14:42:27 -0800 (PST)
X-Received: by 2002:a2e:9b54:0:b0:2bc:b75e:b88 with SMTP id o20-20020a2e9b54000000b002bcb75e0b88mr6648233ljj.18.1700088146885;
        Wed, 15 Nov 2023 14:42:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700088146; cv=none;
        d=google.com; s=arc-20160816;
        b=F4MOAuVkn70XTithHYe7G6B3PDNbyzDJ0WrHzK4N4DcRjU1wecNgkttpEy0C7oeXEj
         VRt2Po/lNNJLpTSFx9S/S++zi8uXH3a6A4VvxBnFxnlIZi/tr4OuPN8yqHDssjEZh7Xj
         XVCjETbrJmPHd5sVJsORCNufL5OzcftHxcXb6NmK02zgqpSsnHKRxUVlWgwBEhZaPL1O
         zTTzaSws1It9jkNf0NpsjVRm8muNBfeMKmIoEKAZxnV3gCtxK5DhaK2+az7OG4Bu2uDo
         CbRxiBMGpRWt6o7Rphn6ogRQQs9e2KGqm2SVekIPel9pq3b/PUswqaN5v00B0uPlbIxN
         0y7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=44wk12gWSx+VOHlf6Bx4iWBZ3gfXmmZ565tPJii52M0=;
        fh=h+iKxUU2n9apZdHM9PquWMwmSAAlgKvrIxVYLY/WCMQ=;
        b=PPHK6YbULRB9XzuWhIIFRj28Fu5KtUFvCB2NZT+CE9AQstp5sFKHbeazCBOxxVft2C
         YY5ozZJFNVGbvyZ/t3Z2Xgjr0vH2hrswzh3xxou+476w+JjLVKU3C5GL9kX5dpa4JHEf
         lJ8ZBt7G24Vw0/FloQREXmOlpPYo55Z9RcnE6Y3us1nQ6NgZ5pL8Te5hXe6bpBwKXmeD
         lAQbA9hnsH4+Rs6LAIWQ3RbQwypWATuAsqoKzaqkzgPmvvG6GQgrEWuHiLE0GHnzat1L
         lM3YWsoUsLCeljMI0G8B54toXgzNzaHn3hGPMgxQxm4qUJ+KTW+aupbGymMDHXNJDM6r
         T5gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmkoQnjw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f28-20020a170906739c00b009e5f65c27f1sor523155ejl.8.2023.11.15.14.42.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Nov 2023 14:42:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmkoQnjw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700088146; x=1700692946; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44wk12gWSx+VOHlf6Bx4iWBZ3gfXmmZ565tPJii52M0=;
        b=cmkoQnjwoBLsCQE10m5FSfKtFg3uQwhIZezzq8dfpFlCdeFYG6+FF1rH+O7UZOfJfn
         0FgefzzrQS/urIv2TD/CGYNcpo7uPHXw30jrjIUeqgp13EHyCmqXpirnntaN39LdvQu3
         aM8oXHmqECDm97VvBDL8eexJBCitWLjob5o0RsUFF9YMuXzpF2u3GhCEe5OtVq3jbfmZ
         N6lVGPIdAahtsLwueKcPPIMiN+4Bo6ORFZ6bFVGDOgd2fneGzkuIO1m0a2ISmGfAiSS1
         2r52HZMTHpmIVkVfEUmvIH79vyfuESZ4XQakzF7/GGiJFZNXX6yeu4WiOVC8dU28IeLE
         1AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700088146; x=1700692946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44wk12gWSx+VOHlf6Bx4iWBZ3gfXmmZ565tPJii52M0=;
        b=lonsWHm8jroqALez5nb3bX2ZfeTcrp/UfSVvxVcyv3nczv1mPXAVnTGhClYwsq1FBU
         2EVqY7ORaIKz2HGXUOf44ocFDrUw1rOr4LVL1NY+LudRSHq3FeOVnl4QBzNifHYbbpTH
         dot3wZZtk27PgVzGqrlFsLLoDfUMB+snifKhTQ+0DZw2pl2V/0gPo2dbNgO88nnKiipR
         J+LVKd4m47yTIpUFoJpRLQkpwtPmwixALzFhG3lUQs7Sq7VNyoQ8fI8gG/kYel1W63+f
         tpeCchP41EUSmLY2imX+pDUp7wRwX/NrvsOxcAExR/Qy3FpgC49Z5ob+8d2B6mxUtfAK
         EoXQ==
X-Gm-Message-State: AOJu0YzP+oPvYcr5JbTdXgWilGc0o6PPWTRAGE0QY76mQC7u8r/jrasC
	/JgW1nBrR37zKTKn2f0SArjldq+ooGk1RTAzqLwIKQ==
X-Google-Smtp-Source: AGHT+IFse9caeGquSlr2m9eSwd9C/SlEcfYReLU6l+yLtocabrZIn7zBpXT3NsC6q1UMIYahqXjjAg==
X-Received: by 2002:a17:906:711b:b0:9e5:dac6:86f9 with SMTP id x27-20020a170906711b00b009e5dac686f9mr10542523ejj.69.1700088145858;
        Wed, 15 Nov 2023 14:42:25 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.130.62])
        by smtp.gmail.com with ESMTPSA id dx9-20020a170906a84900b009c3828fec06sm7550338ejb.81.2023.11.15.14.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 14:42:25 -0800 (PST)
Message-ID: <5e90da45-7d64-4e2d-b914-540b0466201a@linaro.org>
Date: Wed, 15 Nov 2023 23:42:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] testing: move arm system tests into their own
 folder
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20231115205542.3092038-1-alex.bennee@linaro.org>
 <20231115205542.3092038-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231115205542.3092038-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jtaITpJTlxMe

On 15/11/23 21:55, Alex Bennée wrote:
> Prepare for expanding the arm system tests by cleaning up the test
> directory.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/arm/Makefile.softmmu-target           | 5 ++---
>   tests/tcg/arm/{ => system}/test-armv6m-undef.S  | 0
>   tests/tcg/arm/{ => system}/test-armv6m-undef.ld | 0
>   3 files changed, 2 insertions(+), 3 deletions(-)
>   rename tests/tcg/arm/{ => system}/test-armv6m-undef.S (100%)
>   rename tests/tcg/arm/{ => system}/test-armv6m-undef.ld (100%)

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
