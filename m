Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2088319njk;
        Sun, 1 Dec 2024 05:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWSXYdjhmA4RYYiLv4D8Dgky7MZI0ebAqDtY+kHYnUuUBYEBMxSpZLeRIibhdZmpJFH59D/r8VdAGE9kg==@linaro.org
X-Received: by 2002:a05:6402:401a:b0:5d0:ccce:34b2 with SMTP id 4fb4d7f45d1cf-5d0ccce8ba0mr9020421a12.29.1733060096246;
        Sun, 01 Dec 2024 05:34:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733060096; cv=none;
        d=google.com; s=arc-20240605;
        b=kfzqnO1brPtUAUzojGMc5SjQEQ69qu65RrwSCjrMavpxCEr/GqFT4dpSVypDthjkID
         2oX/CJMU4MMrBsoSul7szUN3zCyxgAQwWrtY9lRCEff+cwIQ3nKYQA0Skq+KApuua0V/
         bZ43pIcKJw/eRGME/WMATcTxDEE1I/TLZPHGk2lNITxmZPPsXpPyfpeSME8cmcB298sX
         B5KUueL/np6hs20j0+8kaveUggFAUEQbi4pa0/P+Pp1EsgzzEFLmvkyXZ4zYKF16zYZ+
         sc8zTnnXqDHPmXzOaFi/qelpubjKn6ucZOWcHRU0tkTj9GG5VlVX4dkAEtugMXei5DL1
         L3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=NGCMlNJwJWoPBUMYqj5ryk/jTzepTBn3oHHeeRGVIxM=;
        fh=lZ2NcKyFatCKmrPYgQHCycHOKtfPAEK1th6PBbt3Odw=;
        b=EulbS/quX8iikHTMxJhQvDmKPQeBS1lnG0TZoDn4Zv02r/6yFUSvQ+fa2rUgQasU2l
         6Eu2fgl1dNURCZTAL33UolDEanIK194wK32vIJSUflWKWJVjDq79nZF4RAL4iSAgbynR
         spqP29y84ITGhWKIYoaolfMQGILkTHZsX34pP2RCgaSsJqyXOOHkBmYw4z/p0lUT9deG
         ZFFsb6wXklK8pNtddKJLf1PYeRuPF+seErtYMDZTLeWJr/gHXxX2ytLIs1AkcTV9FEu7
         Ol6H9XpMMiEbyXrgFdy3DIAYiXkblJJNNDoKC/W8MovsqHPFHfrLa2pIJKZCOtzEEo7m
         hHzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J26XcMXn;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5d0979caaaasor1008708a12.0.2024.12.01.05.34.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 01 Dec 2024 05:34:56 -0800 (PST)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J26XcMXn;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733060096; x=1733664896; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NGCMlNJwJWoPBUMYqj5ryk/jTzepTBn3oHHeeRGVIxM=;
        b=J26XcMXno3xD2gX06OYm+DHJKIGPss/ZBsqIbQX2Q5ykkSDXt0InE2pmGCibl5QG4H
         6EeYJCC7suxlunawEOKMlQcwKW8ap6eqedt/UQXZ9g0KPS5vZ0uSIFeDGdhqM/WjLh27
         X8kluq7ZZWdEfpbm3cWarauBu6s8/9vMJgkHzTE/TUXzDe2kWRJP+oCJlGHapuhIi3Mg
         htUFEmMvu51ja3vnaJ1d7TfryiijoV46qnMK0hhK4Ao6qxDyblH52RTBLT1LrBcR1xRv
         sZP8bSs9HHtswb/j3To921SQoDMOq0sjfDJQ27a9pMlXU96o9X7XCCWfZAyPRJu1M4vr
         b76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733060096; x=1733664896;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGCMlNJwJWoPBUMYqj5ryk/jTzepTBn3oHHeeRGVIxM=;
        b=GYPFc+C7hW4irscnbDNow15P3/js8ZW/JmB8H5ZMRRzNADuVZXKS9jOOBlzFALGE8B
         SvrHetL5uhYFYfRwvtxg9U+6DdnCcREVZ4b/hMRGp9Cshc81CqxTUcdGVA0w6T2ko77c
         Ok2CxG8dATb5twhzM9axPgesuFIj7HyCnQcVpiKIAFbVoLMIv2uvRg/2TQQPW2ZjWRJ+
         XxS5zIkeS5ZrUrP0Toe6Nu6l/EIHLQCHAlO3QdfPuj2FLfu2CRlO9kBQ/MeJ+CvB4Gvq
         4m08Tn+SbQ2CzZ7W5/AyX7fgDARb6atx4q/S4KX771NBLcb7sv8SSX0i/AuwR7hhUaiU
         FxPg==
X-Forwarded-Encrypted: i=1; AJvYcCWkK4L9lO9pLrrGrFWnXRra7OIVF6+XFkUDDmljjbUCsI9yYTTGKIjf6E7rAT7ExsUC39r/epO2BkHR8g==@linaro.org
X-Gm-Message-State: AOJu0YzTbs52EnNGEUCVv32D5WFL7ADhE348iuymthC0n2dMpz4kXDIx
	HUpCWVCQO8b51YvtxT+ja0/FmK3XnW3laoAPd0ij4TMbsDly+2FFYHlbR+jaFp+UuQ==
X-Gm-Gg: ASbGncuxlzyb0bfFYDqpNFxi7f8z6kQXJSMN2U6IIJR6nInsAfKl0Ws0cIlAytxPvy5
	aM3W+NCV43tDl7tN9LtQTfsC8a/SAPJvNlTCPQ0uPoJ4ixqWoY3SbjXFtqWNxcL2ruHSdUH9mGv
	6npsNg4Jo3FnkafXOCweaP2EvuCFZ94IlJcH09ptEuelq/KYlCOSmWnNBgUX2UT+sdXuxaLpZY2
	HkseJJ2OmdZtt4qhe7VGY1euK9cnlWSEih5WVWtg03V7gGbE0Hs9vm44YO7PaPEnwEhlr9+fq39
	Ycimy0tQtTG1RqTiq/p9HdefXNVo
X-Google-Smtp-Source: AGHT+IFHZqpJqSlEtwdeIDHp6W4GiXOVY24VRNGVAeNSPU88fdKNrEXs5cfmhllQnQH3wfEOvZZm3Q==
X-Received: by 2002:a05:6402:401a:b0:5d0:ccce:34b2 with SMTP id 4fb4d7f45d1cf-5d0ccce8ba0mr9020357a12.29.1733060095554;
        Sun, 01 Dec 2024 05:34:55 -0800 (PST)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.210.26] (83.11.10.28.ipv4.supernova.orange.pl. [83.11.10.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a9dfsm394070566b.157.2024.12.01.05.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2024 05:34:55 -0800 (PST)
Message-ID: <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
Date: Sun, 1 Dec 2024 14:34:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, alex.bennee@linaro.org,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 29c124yqnAig

W dniu 28.11.2024 o 22:37, Pierrick Bouvier pisze:
> This boot an OP-TEE environment, and launch a nested guest VM inside it
> using the Realms feature. We do it for virt and sbsa-ref platforms.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 5c048cfac6d..b975a1560df 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -13,6 +13,8 @@ endif
>   test_timeouts = {
>     'aarch64_aspeed' : 600,
>     'aarch64_raspi4' : 480,

> +  'aarch64_rme_virt' : 720,

Took 2974.95s on M1 Pro macbook.

> +  'aarch64_rme_sbsaref' : 720,

This one needed 2288.29s.

>     'aarch64_sbsaref_alpine' : 720,

Have to check cause timed out.

>     'aarch64_sbsaref_freebsd' : 720,

331.65s

So RME tests probably need longer timeouts or would not run at all.


> +++ b/tests/functional/test_aarch64_rme_sbsaref.py

> +        self.vm.add_args('-accel', 'tcg')

That's default value so can be skipped.

> +        self.vm.add_args('-cpu', 'max,x-rme=on')

> +        self.vm.add_args('-m', '2G')

I sent patch to bump default memsize to 2G recently.

> +        self.vm.add_args('-M', 'sbsa-ref')
> +        self.vm.add_args('-drive', f'file={pflash0},format=raw,if=pflash')
> +        self.vm.add_args('-drive', f'file={pflash1},format=raw,if=pflash')
> +        self.vm.add_args('-drive', f'file=fat:rw:{virtual},format=raw')

> +        self.vm.add_args('-drive', f'format=raw,if=none,file={drive},id=hd0')
> +        self.vm.add_args('-device', 'virtio-blk-pci,drive=hd0')

sbsa-ref is fully emulated target. There is AHCI controller built-in so 
only "-drive" argument should be needed (no "-device" one).

> +        self.vm.add_args('-device', 'virtio-9p-pci,fsdev=shr0,mount_tag=shr0')
> +        self.vm.add_args('-fsdev', f'local,security_model=none,path={rme_stack},id=shr0')

> +        self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
> +        self.vm.add_args('-netdev', 'user,id=net0')

e1000e is built-in already


As both virt and sbsa-ref tests do "more or less" the same stuff then it 
would be good to make common file/class and reuse it both tests by 
adding hardware differences.
