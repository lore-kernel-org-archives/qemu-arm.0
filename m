Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp302325ejb;
        Wed, 7 Jun 2023 07:33:48 -0700 (PDT)
X-Received: by 2002:a7b:cd8f:0:b0:3f6:984:4e43 with SMTP id y15-20020a7bcd8f000000b003f609844e43mr7508908wmj.21.1686148427945;
        Wed, 07 Jun 2023 07:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686148427; cv=none;
        d=google.com; s=arc-20160816;
        b=frNesdlH7K4UHxJkMFu9Uvtb59dgSQCES05slI7qsFTLdtB/vpaIbxe3wdGihfLFN7
         rlEoW1H+yXFF1LYr9p3Lo1CO7BrQaYnj3SGdeCuonixpirQRFm1mWMUbQBkjDt3hvaP0
         MyWUqIGUC0xMsLQL4mf04kVDG0nOC+f9qaZIiH9IeMv3m7ImwpVPZeIRqucQOypF9vXB
         JeogxgC9Uah9H5xKcrdGVddjA9mWZ5oBWbXbMJawb9Swxou1L82LDir6jwxMViSzJFSS
         VPURxmCChXxfObOqDylM/S1KKcC0+/HNB5QuliT5u2kFMUuHJ9ky1820nBkXRDVqbGUC
         Jyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DRISuSMZAVWY6Gs4avNot3VpR1cnQEabLztdsVLdxb4=;
        b=Mij8BaM2TwaxuUZ/KnfaYiY7yNX1LE5Kew7CHIX+kMa4PO/U5DYuPIiVfUJNbCoKFn
         5sbkq9o5+ApqTUvvicVHdVn2f4GbCPTKs8E4rX/9b/Z61jrAfmK6NeiRb/aSUTZYhuAN
         E+iQCZYqwroqtgI+DLnxCJvx9EKCVWdc/FSPo4zehpJlHR6Vv51DF0aO6tDYqNgoPoXn
         QMEC4BWw1bfEoejYXfkGrDIz+IpH04nyrrPjfsPJg5k/UAYmVkhLh0NMrRHctpxoZWoa
         RAWYy6M2WsTsncqmArWHzLPo16OYGP+N3krXUt57k6zFktWkpfsJaF3epOZ8INguBOEM
         4RhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lhLDEyOw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z24-20020a1cf418000000b003f6f5199a7csor2435171wma.4.2023.06.07.07.33.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Jun 2023 07:33:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lhLDEyOw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686148427; x=1688740427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRISuSMZAVWY6Gs4avNot3VpR1cnQEabLztdsVLdxb4=;
        b=lhLDEyOw/vDaSdMmiDZ9H8Gi+uwoBJ8odZGQsJm7E1P1BUNQRmeOF86XvK2TVGCbmz
         bQTlfNUiXdnDfJ7tCICt7f/jVU8ToKVDFww/D6hk/MqJzcfyFt7wXhygBxs5GMh4Y5E8
         1/10TwCv9L0lYpOJoxQmZ4t+ttgMfs15wZedM/m7M/yiqupfIe2SLbQMb5ofvqQ7i+r3
         YahuMktQJ4Yvo+KineJwG+Qa6dg8JmIGdxSNRIXW6/0f/mksoq9H5LkQ21zX4nIdr3GU
         JNyRjbeJ95uQ22YCUS2PIKJDpAQELyOURtTebrLPzQcfAntMzrXAnvJWREHBiFTxPm4g
         zm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686148427; x=1688740427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRISuSMZAVWY6Gs4avNot3VpR1cnQEabLztdsVLdxb4=;
        b=FMh9Fdozucuc3fpOSl7zpl/7uMGaiQMVM00vxI0erF2GemzxqnAS5Cl9m9jGy1yyXA
         rU268Szqff4J4XKMFK+yqvkyRMirBgO1j21lW65KHla3xnBl97alckjeTMWA7ZCjpGcy
         7kA7oyeiR2CyHWkYYnlRdEHEnA4afTSHN7oOCY6/spGFr/kIkBJ9qSuxcWb3MQiNLWei
         owZzNl8hyNQI3KGrM7Wh7PSHAiC3ggPKv4AuvhTgbSpE4vhEYSL/b0pQCFUGdQY4WrsC
         cwRnvAWzJ7D+8FTjoqBouOahfPZSpNP7rRqlR9JuRuGb6kV7howjuhErzDBmCE+r03xK
         pcvw==
X-Gm-Message-State: AC+VfDzf0Q9mvsBx804gRKcAQ6VsF9UMERMd8DmJ2MhnnCdhYYjVtl6v
	9hQBhDIqgWrZ/RLAqvFIBFXy7B8g
X-Google-Smtp-Source: ACHHUZ7NIPV72POUlW2+LwzLVz/WKxoFEf3019z79mu1IrNPxYr0ovRxt4lxE9bli2ePrqkakVzWmg==
X-Received: by 2002:a05:600c:218b:b0:3f7:39ed:c9a4 with SMTP id e11-20020a05600c218b00b003f739edc9a4mr7526026wme.30.1686148427546;
        Wed, 07 Jun 2023 07:33:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (bd137-h02-176-184-46-52.dsl.sta.abo.bbox.fr. [176.184.46.52])
        by smtp.gmail.com with ESMTPSA id c23-20020a05600c0ad700b003f7f1466203sm2215326wmr.34.2023.06.07.07.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 07:33:46 -0700 (PDT)
Message-ID: <ab3d3d19-2604-c519-03b0-af3952fb7718@linaro.org>
Date: Wed, 7 Jun 2023 16:33:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 1/1] tests/avocado: update firmware to enable sbsa-ref/max
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230530152240.79160-1-marcin.juszkiewicz@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230530152240.79160-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OlSaTSRsAE8F

On 30/5/23 17:22, Marcin Juszkiewicz wrote:
> Update prebuilt firmware images to have TF-A with FEAT_FGT support
> enabled. This allowed us to enable test for "max" cpu in sbsa-ref
> machine.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
> index 0a79fa7ab6..35f8042416 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -29,23 +29,23 @@ def fetch_firmware(self):
>           """
>           Flash volumes generated using:
>   
> -        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat Cross 12.2.1-2)
> +        - Fedora GNU Toolchain version 13.1.1 20230511 (Red Hat 13.1.1-2)
>   
>           - Trusted Firmware-A
> -          https://github.com/ARM-software/arm-trusted-firmware/tree/5fdb2e54
> +          https://github.com/ARM-software/arm-trusted-firmware/tree/c0d8ee38
>   
>           - Tianocore EDK II
> -          https://github.com/tianocore/edk2/tree/494127613b
> -          https://github.com/tianocore/edk2-non-osi/tree/41876073
> -          https://github.com/tianocore/edk2-platforms/tree/8efa4f42
> +          https://github.com/tianocore/edk2/tree/0f9283429dd4
> +          https://github.com/tianocore/edk2-non-osi/tree/f0bb00937ad6
> +          https://github.com/tianocore/edk2-platforms/tree/7880b92e2a04

Thanks for updating this comment!

> -    @skip("requires TF-A update to handle FEAT_FGT")
> +    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might timeout")

Can it still timeout?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
