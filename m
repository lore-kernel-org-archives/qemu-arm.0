Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1902857ejt;
        Tue, 28 Nov 2023 06:04:37 -0800 (PST)
X-Received: by 2002:a05:6870:b61c:b0:1fa:3e11:711c with SMTP id cm28-20020a056870b61c00b001fa3e11711cmr10097898oab.13.1701180276656;
        Tue, 28 Nov 2023 06:04:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701180276; cv=none;
        d=google.com; s=arc-20160816;
        b=BnEIRBQhMAuZmY6Sw2dERnktrlFVNhdt/3wsZIF8RORxNc7hM/WKJmC+LUlgLK94By
         +7srp57iMwUhpWZUFmlclaCOSzB0TlAScqh2i8FKtXpTBYAkHZoZ2KBF4rgM7Ut4DuTA
         kYS3j3LZFTpLOwucA3l1Ack2QHJlxQVoXlHSNbmgoTCMSNj8+PKFW/dj8mOk3nT4KMD2
         IrPmRdUGeo58vnPls9/AllmscAG9zSsP6Re9vXmGPajLAC0+8MU5qsJfC7jwqxXbGY5v
         Rdqa7eX5QSPFDe9brVZTnqHEo1TLFR+REuFZW81WutfMWzMfpE59rX6OPHsflFjDEE1f
         EmyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lHMBvlKj1AZPfM3WQXCWVjL1Gdm2AyDWlCFVnKi0uEw=;
        fh=j47SlpSDusZ2mmWrSbVW2DB7/ZZUDU/502C3FK4P+uA=;
        b=JJ0yN/HVO8lsVa8DqkctVQMkxhZ2KAnHUUw7KoSjl3ERMX08mfxMzFMBr/bpcsj8Fn
         nC8QHIG3oOuhVU/XK+7nqEGtwngl3bCP//+HRJO8dSnMMwmzDTcTd0pTBGf0nFCi82Vy
         Wv1qd9kklbqpu97dBKbUNuziY9M5JLWwWWekDfo3TOP6hSYlyCJYWBMkGIXin7zzge4d
         w1dy2xTOOCP86SOleNjhjwSNgI3UFBJB1tQnOnM+ghtvZ9RoC3IamgPnX6KFjzlsDuRC
         OsIFK7/8a7P5l9Ohrmyye9yLvtg8suKSqVFCwN1yo/vTnJv9Uq+otxDNhDmj5b1Jvmsq
         AiJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=brh0rpHw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id le7-20020a05687c340700b001e12f6855a7sor4051636oac.5.2023.11.28.06.04.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 06:04:36 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=brh0rpHw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701180276; x=1701785076; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lHMBvlKj1AZPfM3WQXCWVjL1Gdm2AyDWlCFVnKi0uEw=;
        b=brh0rpHw4WPnqGPxkjtGQdAn4tXEG4mfKT3AphLmJv57/v7m8isx2XdhSG//RD3LTZ
         1RPGU/ILASAOX078AJSiaB9Q5GgtEs2L1CJ2v4OL36r9uym3h4GNBXavK3Yjw1cxM5F3
         0+cDPafM0FS/OhL94S13bkE0mRb8KYT4mz6QhmgZiNRYr6EH5jTt5fBCZp+63QIbniF+
         e3Ms1oigS38OjuCYKYdbHmBv5P4W8WfFyLeCPcGfOgYJ965hQohhonYockz+gQShKQg3
         hQc3oXFiIVFocwtCs3o8x6p5dFmUNlB7lW3GiVe3jZs+WmRqUHsRuGsB3MbFVdvat0p2
         AnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701180276; x=1701785076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lHMBvlKj1AZPfM3WQXCWVjL1Gdm2AyDWlCFVnKi0uEw=;
        b=EvzFs+lvHnP85JT9ptRxggiyQI1GeQj9VT7NaPWKANGlzZ07wpP0/gD1d8Xw1GqV1I
         5IbiwX3Shbf9nrvM3/YyBqZzfPrC91cs0sQ5Ioag5eCEoc3KFbHbjNEpL/A/Ovo7yr7l
         AYP8zCHiHQQv8bDhowLbQzR1iQtBlR9nTVroZKd1LXsSXh8pk0NqWAePVM0H83DozIY1
         nsl5RHDQGbGIr4Zn9d5kMAcaEbhdemkJ1LZxFUwsI4w+w3eut8wSPvXSxfffPhDgzXoT
         wY1gHc//Z11SzXNYK6UmskGkBe/zenks0VIn4CHlXIe1yZ5za9AC8MGF5u8A4l6FIZ/x
         6loQ==
X-Gm-Message-State: AOJu0YxsRFmiZIdOc6eaLq9a+RrP36WczpboPY57mvepple9bi0YkAgd
	icju1insbR74SzmaejRbSyWvdsi8
X-Google-Smtp-Source: AGHT+IFMiklwB5hWsMrQUYNk1ZbPPirycGyevA5FlDQF1WeL45cm6GAvtl0G0VZRH+k/syTixkdMtA==
X-Received: by 2002:a05:6870:f626:b0:1f5:cd12:260f with SMTP id ek38-20020a056870f62600b001f5cd12260fmr17921771oab.26.1701180276286;
        Tue, 28 Nov 2023 06:04:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id ny13-20020a056871750d00b001fa1350df8esm2068309oac.2.2023.11.28.06.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 06:04:35 -0800 (PST)
Message-ID: <23cf8ae1-70be-4ffe-9409-60b8aecbb33b@linaro.org>
Date: Tue, 28 Nov 2023 08:04:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 08/11] hw/arm/bcm2836: Use ARM_CPU 'mp-affinity'
 property
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
 <20231122183048.17150-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231122183048.17150-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ehmhpAlcjk81

On 11/22/23 12:30, Philippe Mathieu-Daudé wrote:
> The 'mp-affinity' property is present since commit 15a21fe028
> ("target-arm: Add mp-affinity property for ARM CPU class").
> Use it and remove a /* TODO */ comment. Since all ARM CPUs
> have this property, use &error_abort, because this call can
> not fail.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
