Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2498613njc;
        Tue, 15 Apr 2025 01:19:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOQPz1uvNweORvILia8+3PTMa8Q3tNKYwsCi5d4rxPc+sLg5Wi/4SoVvNiYmY0wagLSobCSSMtCKEjaQ==@linaro.org
X-Received: by 2002:a05:6000:2803:b0:39e:cbef:95a7 with SMTP id ffacd0b85a97d-39ecbef96b1mr6735391f8f.18.1744705182009;
        Tue, 15 Apr 2025 01:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744705181; cv=none;
        d=google.com; s=arc-20240605;
        b=FXwcofQ3qsXkqAmeA/tMQ0dP4fSYuruGncQtk97A7OpWu/I4yqRAiwa7SFJBO813SY
         Cj53F3VYmWMmTWCM4AVJugKahVk9rS/TcbmasfUc2xOeWmRHfxzi7WMwcZ3THPuIZkqi
         8v3rwpqkIgmmrA1KLzHlEvnAlMZ+p2F8x6k9KzCKrqItQx2SnxG8O+BEzruuMCwIAU4+
         6tZyou/aIwyWJO1SXo5vP5db7AxOo4ySdVR0UhlCuA9FUsrIRBsiIddx5bWyLTj1Oyim
         vL8dSL0jylO9WjA37hDztAAIcUG1rsQjdWoOw252qTvbDgS8LiBVd87wj013Yii/4q0V
         VFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wrlECfOkXHMaaj6i63srLhSlG43tNPbqR/Fa5b49eDw=;
        fh=WgRdOKCIxijeCBCFUfB24J6bPCS2LrMo4/dXbrWzgeA=;
        b=NJwfjw1OsyNjYb+VxDQxfrCS1IKugJ2pgRYNGZeK5FUXH4+xdp0jImfH7caFZe2tWK
         O0IxY9KVfFriDwE8Wq+1LvS0Yj2EjzIJJRFB5sW5+sAcwtAwNpxERp5D6etcrxY1iSG9
         3Ql7s1vnDIHooEn8HZYyiwQrH2OeQjSVag2YUDMada4ppBXb8ty3Ab2ZPav3WqJSpT9I
         itJhKwlhnrF9qwoC7htdsQN7Xpbndf06JHOKnnFXJPuTt4xo3DmzzbC1rwqdS6Fx8B73
         +FgODMlXqjORq7PL9kbzSO41pAEFqsxoJehjvnexnh0Vva3LmhkeAHckrWJxyvC7Bp4E
         U6vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QOHz4GMH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39d893f150fsor229504f8f.6.2025.04.15.01.19.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Apr 2025 01:19:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QOHz4GMH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705181; x=1745309981; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wrlECfOkXHMaaj6i63srLhSlG43tNPbqR/Fa5b49eDw=;
        b=QOHz4GMH1p4h+e0j0J3N05qVKD++UHZURAx3Y3wEMKiIwH1j3kavYBPcdI//duFyfd
         adEthDkvedElDFekZ+3HONtdi1W1J1u1krolGLUS1gfV9I/MCtKzKvaSyR0VRzU2J+jz
         QXkywjinVCXL37JqZjyHZS1pvooB3g5IbCerwBbGWBDNBJuHmZvH5qk5C1Y7APggP2Oz
         Zr0KBKt0wQ+sVe1iyEwLxilpOQEusmKHSQXhUGiIUDvBGsdJt++ZB1+V8WyLTc80DIUQ
         vXLStps3teipvy2JgbHLYUWltKMfE+PyP4dK88ts/GvOs0Zxlz23W/pkVQ8WF7AjHy6s
         xUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705181; x=1745309981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrlECfOkXHMaaj6i63srLhSlG43tNPbqR/Fa5b49eDw=;
        b=i5aDtH6abqVxIHEOGRo2987pvJlhkrs7DjeWUFBrEM+OYTcYQs1Z0qceCUzRwClSe9
         MbHbW+g8Zq8Wu89Oo5a+oVyOVoizcjcqz0SAijT8LjXClA1tEnutKmUjSoMRJa1NCd4i
         dloZgz8E3p4N8b7wy2/veuUDfX0A/TH4soN52NW01Ce/ymKsX1l0Msr1MNUXUpnVPJJl
         gLrVUHDDo66X3QI2txkHhNMCdEXx1C+b14GW7YhauHh7r+3LfIfvGUbUUqp8nlM1TM2A
         quiMCbpeDawx+PSmV7nQ8owi2yz1L4jbTsg25hqp5VNbILR3HvF7EliSBnJfaY80o7gM
         xKqA==
X-Forwarded-Encrypted: i=1; AJvYcCVoaCkp6DmEdVNhuoY700UH1aKN78B25Vv5Xmsipb8z7BrR09CS3TxvhqbxP6k7gzisQy729pOyAe1iKw==@linaro.org
X-Gm-Message-State: AOJu0YzqRY4Ql1v/Mv82pUJ43RPq8fMPDMMfMy9At9pCUxY8dyZsaeI8
	RQ/asEhcEGoKmiPCIr+RGL5fRl6S9LuQwr0/C7XgHPcsbmhihNZcGAIpe/gDP984qQ==
X-Gm-Gg: ASbGnctmrLe23XxElQPXKYLezhEuHiY03piPvqMtCjYOjMcv5w8qkXFOCpEwXk8p4gg
	maFTs2rbKadl7wEINnRA+RNZoXv/l8ii8GOTUO+ueMQhg65Ufrl02st27Gw+PjvAckXXlL0pXNX
	IrmjPpQAt7OlQ+oUEcgq4E8N3Q/iYfehAak3FEiMovpAAeWuvT8zACi7ZaYdaCLVevxOI/RlLq5
	m/O/PWgSfeREcIe2RTk3VxRJ4P3n1kZe2tcH3IaKeyVvbSuJyC6RREIZ7nex57XYOWc0Y0ZB8ZN
	T0XvMDxabYfajr/sqTt9y3C3BHUMhjv/wODY9doEn0+otolHS6Eval/c413FpMhOytdg7bvEA67
	BOYgeUEmlChpcIA==
X-Google-Smtp-Source: AGHT+IE6OWyjF2GH738pAscFKvG5FNa13uUiUulMeavFpSkpfChhlEcxTxvS5JKui0LgswChyPbjgA==
X-Received: by 2002:a5d:64e6:0:b0:391:2d76:baaa with SMTP id ffacd0b85a97d-39eaaec75cbmr13133082f8f.46.1744705181512;
        Tue, 15 Apr 2025 01:19:41 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c184sm13625655f8f.30.2025.04.15.01.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 01:19:40 -0700 (PDT)
Message-ID: <b26000c7-f72d-49cc-8f7d-2ce3458c47b2@linaro.org>
Date: Tue, 15 Apr 2025 10:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v3 0/9] hw/arm: GIC ITS=off ACPI tables fixes
To: Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>
References: <20250403204029.47958-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403204029.47958-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Gt58THbtmQzx

Hi Gustavo,

Could you take over this series? You seem better suited
with ACPI and testing with Aarch64 virt machine :)

Thanks,

Phil.

On 3/4/25 22:40, Philippe Mathieu-Daudé wrote:
> 
> Fix ACPI tables for '-M its=off' CLI option.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (9):
>    hw/arm/virt: Remove pointless VirtMachineState::tcg_its field
>    hw/intc/gicv3_its: Do not check its_class_name() for NULL
>    hw/arm/virt: Simplify create_its()
>    hw/arm/virt-acpi: Factor its_enabled() helper out
>    qtest/bios-tables-test: Add test for -M virt,its=off
>    qtest/bios-tables-test: Whitelist aarch64/virt 'its_off' variant blobs
>    hw/arm/virt-acpi: Always build IORT table (even with GIC ITS disabled)
>    hw/arm/virt-acpi: Do not advertise disabled GIC ITS
>    qtest/bios-tables-test: Update aarch64/virt 'its_off' variant blobs
