Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3826170ejc;
        Wed, 11 Jan 2023 01:01:13 -0800 (PST)
X-Received: by 2002:a05:600c:34c2:b0:3cf:7397:c768 with SMTP id d2-20020a05600c34c200b003cf7397c768mr51241102wmq.30.1673427673178;
        Wed, 11 Jan 2023 01:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673427673; cv=none;
        d=google.com; s=arc-20160816;
        b=VDHsTca0CmxOU8h83qVChzgtA9R8gNoUM65IWL2YAQOTXLknGYJlZowd3FLqy5vene
         MdgOgHJdHDj0HKECrCMeAwwcNqItQKvEP7P2CAYuIr0Ua0DIz0h9fCYNZyD6uG4fYRj1
         FZLysNKzOjGjG/mym9l+mD8VSbX/qgEoBKhPq2fGAXNulwwe68BFz7XlL8K4O4AZgL8H
         EOg6iu24XTif/BN1jNApiRp3CC3K/KckcKuMikEuz5MpxdGHRJc/1dWNm7wB8qjIv/TE
         qFI7WdgYkjxUE3E6Wk8NUqZItVXwNNKfd0Peifpb8k8IWXDug1S95mah92SOSvAaPVt6
         jhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YseKiHzchM/E9HI4JXEw8KCMkdc46Yvwu+u0m2DvUvY=;
        b=bFqdzADXvIQgABtMZ4D/trBSZAUiTKZwCfjpBn+uDDqGztwvIOTC+To5qjluRPd+hD
         N9MgAnutTcjrBONARLRZi7bEZSs/zG3FGqdQR3y7u3dC36n+QCVC08qZVi6ZTpn2To2S
         0LGbNMJURXb+ucxFTRh8SmXHbPC6Vqq+AhUH5ai0DwC8atjGt2mS7ch2fpqZEzUO3HeH
         hoeVz6df7P8ae2faKW2IdQ5ABHD6OyQNrMHXA8ccTJJ7CTDufXcHqLO9YzTEOOjfZ4PD
         97e+tm1IVwooyF7Qr6HJvsHWC4vu91WQSO+aqWCRZPjG25mZUMO/OiMvYQ+XPJ/N5q5f
         SVrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FOJgbjh3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v11-20020a7bcb4b000000b003cf7212529esor5649392wmj.40.2023.01.11.01.01.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Jan 2023 01:01:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FOJgbjh3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YseKiHzchM/E9HI4JXEw8KCMkdc46Yvwu+u0m2DvUvY=;
        b=FOJgbjh3VQc3EPHODsOOrZSA9ecu6EuAQ8GwyCasnQNuUesWSIltizJM5Xx/w9p7YZ
         QaGhwzfQOz1xRWRYqd3o06A5bhyvo0TuSniHMr2ewgxvt1IxkofCfiX8snYWg46ZcP32
         /OXOIk+AnnkIoT6iOWXiezL+pMbPPMXizbMdzgNBJ0FuqhGIs2Zh4FIqhjGb59Z6zP4k
         +1Z8+Xd/CRk8LJ71SbjC+t46qHefS3ihlvKpRfb5Sj78no9nSJwsMo2Z+5x4xJUn2YSb
         Uvlbs8x9R4qgY4XKlYg2Q6ro3TSNDBHebNA32+q8iyjvsja9f3uGIPnkry5r/G8+4JW1
         /npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YseKiHzchM/E9HI4JXEw8KCMkdc46Yvwu+u0m2DvUvY=;
        b=zBNVNhng6E8zhHMNyFBiF6PSeQiAT9fHRU0h2zW+sltTxHAYT/LDW2JhHMncjfYZ4M
         1yu4d3n5Vu+yoZVT6/STJkw9N8JGrgqE2yZdHJG1Bou2hKEBMXaUhwspqnawixqFDwbk
         XqSY1sxZ7K4fXQhWax1D7pNkM/LerUi0kBrogblzmWcCb4uMfXV/tG12IYZi/nemjo4h
         tA8iKFZ5E6e+na7ufdlxnK/yT6O7UfSXkMhQCwkewR3n/3y7T1LYQcSnWQqgfhwmfa9t
         sCxTUOmdGyoiDDpDt8gtIq334Ky5EaGcOff0ReUFn4D7/Y7LvTseFERE9qdibvgy4nRG
         hikQ==
X-Gm-Message-State: AFqh2kpAGhySBOIw4RcD4pD9r5Dter2XCB4dcDTzFGZQplwguheLvyXQ
	f6/Cp5YVyS7ZXowKg9+mR+x3b/i8
X-Google-Smtp-Source: AMrXdXvlwEI9vUXnKJ5Bs8D+NjYCsAbLmA7+L9qnNB6jmuWUywN7nm6is7+SSkhif474ZWKeUPxTLg==
X-Received: by 2002:a05:600c:2e44:b0:3d3:4406:8a3c with SMTP id q4-20020a05600c2e4400b003d344068a3cmr51011132wmf.32.1673427672934;
        Wed, 11 Jan 2023 01:01:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c469000b003d9b87296a9sm24407307wmo.25.2023.01.11.01.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:01:12 -0800 (PST)
Message-ID: <ab55c910-5da0-01d9-a097-aaf44ee18cc6@linaro.org>
Date: Wed, 11 Jan 2023 10:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 12/18] hw/arm/digic: Replace object_initialize(ARMCPU) by
 object_new(ARMCPU)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, ale@rev.ng,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Rob Herring <robh@kernel.org>,
 Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Beniamino Galvani <b.galvani@gmail.com>
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-13-philmd@linaro.org>
 <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gpSj2zaiXSch

On 10/1/23 17:52, Peter Maydell wrote:
> On Tue, 10 Jan 2023 at 16:45, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Replace the ARMCPU field in DigicState by a reference to
>> an allocated ARMCPU. Instead of initializing the field
>> with object_initialize(), allocate it with object_new().
>>
>> As we don't access ARMCPU internal fields or size, we can
>> move digic.c from arm_ss[] to the more generic softmmu_ss[].
> 
> I'm not really a fan of this, because it moves away
> from a standard coding pattern we've been using for
> new QOM 'container' devices, where all the sub-components
> of the device are structs embedded in the device's own
> struct. This is as opposed to the old style which tended
> to use "allocate memory for the sub-component and have
> pointers to it". It means the CPU object is now being
> treated differently from all the timers, UARTs, etc.

OK, at least you don't object on patches 1-11/13 :)

I might still post the other parts of this current approach to not
lose them in case I can't find a better way.

Thanks,

Phil.
