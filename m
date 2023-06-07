Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp339813ejb;
        Wed, 7 Jun 2023 08:29:24 -0700 (PDT)
X-Received: by 2002:a17:907:ea8:b0:974:2100:a2be with SMTP id ho40-20020a1709070ea800b009742100a2bemr7017291ejc.7.1686151764370;
        Wed, 07 Jun 2023 08:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686151764; cv=none;
        d=google.com; s=arc-20160816;
        b=uocmRMikRmhgcCX5pCua2R9ka59uvM3johNIAKmtXr6HZLFzkjGIBHmGHxzAjG34Fz
         0YmqnuEW+k9foMo4dj1q2R8yxO6fypx5N/e5WRxsJUBiR4JE3quRuJOLGoty3mVLB3l2
         +JERfoT6Os+x0pkA3uvFyVvn5S4Uro+Hz3q3lMbpbnx5wfJ8F77PsEHlDT78VrG7ReJG
         UKcytjgTG88dxvCjBFYUKHy5Y0Dkfy71cHSjgVEfBny8nXwiI/7SpiiuvlZMTruvb7oK
         OYytuvKtUE4btgqtnheawiDVNND3+i0TpqhaoSQOtcEXABMqbmYjbqT7IimwonkGzpPi
         OSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=/M1orYe/+V7Ktowyt9+oLMALLQqkm72aIJzmWoM0vCs=;
        b=YaGIxMiO3SJk9dzncvVunhdntE29d4eZ8WFy4jvA+eNgkpwe70rAS4dDK9FWq3DqTW
         mP/GbfwF6Rv+c0CcY8j02tk2uD/CfvDOxZqyN3HbCgf9tLspipLqvjhtP0OZj9keDe53
         0XsxbVf1jWQvF7Sve59vJnjL3yLHyMjzNrwKs5BbnXik8rztEc8HICQQBg2x9hcWrpcm
         9l05a1daxrY4IGNLX6xf/+7C7QLOuRKCY4WQui4wF2DDKb097k6Y8eU6Y7d+5WISCHJX
         4P761Prj4mJ8EeDMU6aARVcnB2mNM9khcxe1m/JT4CRPLOgb9xA8LK5P2GsP8rg4edaR
         sJmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWmClaQX;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id wc5-20020a170907124500b0095393d34f27sor6560371ejb.10.2023.06.07.08.29.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 Jun 2023 08:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWmClaQX;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686151764; x=1688743764;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/M1orYe/+V7Ktowyt9+oLMALLQqkm72aIJzmWoM0vCs=;
        b=PWmClaQXh/lUUNPdU5MgYiEL+ltL2oyH1cz6TRUtYiV/358Wv8WyuEdhkn6g4pmU5O
         5iC0Jg7wGDBeAcM3eaJLLxA+qzEcQfm8T6l2gZFQbvnR4Vn64vbZFEHFk0dWdOcpc1Oa
         CsfSCfnQAEUfXfuT1SF4f1GHyR4DS03/mJpB0eGBwJkQb7OTi/jvOy+ClRXnrCKDDxb1
         55BLf2py3Jq395Gx9pxFJO/GtzpiCyPzo/FtCZ9BqRnTQ3ZSHV+tKQNx/9AVo677P9r6
         DL0xT2jZNMXNOryuX1fRoYi3iMAzT2CvJEhR5483oiNTNn9Dm0NPZVw9bTwpVcwaG5Il
         EOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686151764; x=1688743764;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/M1orYe/+V7Ktowyt9+oLMALLQqkm72aIJzmWoM0vCs=;
        b=L83Vzvb9lXuEmll7hBFLT65q4mIK58IaxNDbxy2DuyoUCt7B/7N25IdpXumtbqkuy0
         t/pjN+TJhzHiwgXDTUnfPZFJDchi+5h8HScCmko89AG8lvwWNM5eEvutKuV4E4OXxfeI
         N2DGdO3Gm/WDUOLVExMMkLWKXkwvoFwpvryX58xRmb8ZCqXNBRT1fArkliHPboJEvMVD
         ngA+/Gg/ntimAwBn35T0xdgkENH7TX932RKM5RcUQvX40UjJDwdJ/wceuEqdMdg9g27q
         9jJzk4+yc9goBBUSUwU0y5g7zQh1y7252zpzPk+xEqDzg7S+eWeFWr+461ZB2ppImsXe
         lMZQ==
X-Gm-Message-State: AC+VfDwdDC/vWvuW67XuYeAHC3mLXXB1aQGHKwkAvr6lPlgCKzBHStXm
	SitxldhM9lEXFWYYLJJ5uVPrtHoz
X-Google-Smtp-Source: ACHHUZ6y6yxrV2yu4OJkg7Q0dwEwP2tZ+VH4HWXOD2kR/I+nyTt7iCYjdS2jh1CLMRYI6TqWZy9rGA==
X-Received: by 2002:a17:907:3e99:b0:96a:29c0:8515 with SMTP id hs25-20020a1709073e9900b0096a29c08515mr6590776ejc.58.1686151763999;
        Wed, 07 Jun 2023 08:29:23 -0700 (PDT)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.200.206] (83.21.93.182.ipv4.supernova.orange.pl. [83.21.93.182])
        by smtp.gmail.com with ESMTPSA id z16-20020a170906241000b009788d99244csm293233eja.149.2023.06.07.08.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 08:29:23 -0700 (PDT)
Message-ID: <50e8f35d-855b-4d0a-abdd-2aa42599bd65@linaro.org>
Date: Wed, 7 Jun 2023 17:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] tests/avocado: update firmware to enable sbsa-ref/max
Content-Language: pl-PL, en-GB, en-HK
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230530152240.79160-1-marcin.juszkiewicz@linaro.org>
 <ab3d3d19-2604-c519-03b0-af3952fb7718@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <ab3d3d19-2604-c519-03b0-af3952fb7718@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1e2AaKu45k03

W dniu 7.06.2023 o 16:33, Philippe Mathieu-Daudé pisze:
> On 30/5/23 17:22, Marcin Juszkiewicz wrote:
>> Update prebuilt firmware images to have TF-A with FEAT_FGT support
>> enabled. This allowed us to enable test for "max" cpu in sbsa-ref
>> machine.
>>
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> ---
>>   tests/avocado/machine_aarch64_sbsaref.py | 22 +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/tests/avocado/machine_aarch64_sbsaref.py 
>> b/tests/avocado/machine_aarch64_sbsaref.py
>> index 0a79fa7ab6..35f8042416 100644
>> --- a/tests/avocado/machine_aarch64_sbsaref.py
>> +++ b/tests/avocado/machine_aarch64_sbsaref.py
>> @@ -29,23 +29,23 @@ def fetch_firmware(self):
>>           """
>>           Flash volumes generated using:
>> -        - Fedora GNU Toolchain version 12.2.1 20220819 (Red Hat Cross 
>> 12.2.1-2)
>> +        - Fedora GNU Toolchain version 13.1.1 20230511 (Red Hat 
>> 13.1.1-2)
>>           - Trusted Firmware-A
>> -          
>> https://github.com/ARM-software/arm-trusted-firmware/tree/5fdb2e54
>> +          
>> https://github.com/ARM-software/arm-trusted-firmware/tree/c0d8ee38
>>           - Tianocore EDK II
>> -          https://github.com/tianocore/edk2/tree/494127613b
>> -          https://github.com/tianocore/edk2-non-osi/tree/41876073
>> -          https://github.com/tianocore/edk2-platforms/tree/8efa4f42
>> +          https://github.com/tianocore/edk2/tree/0f9283429dd4
>> +          https://github.com/tianocore/edk2-non-osi/tree/f0bb00937ad6
>> +          https://github.com/tianocore/edk2-platforms/tree/7880b92e2a04
> 
> Thanks for updating this comment!

Having a way to reproduce is crucial for CI.

>> -    @skip("requires TF-A update to handle FEAT_FGT")
>> +    @skipUnless(os.getenv("AVOCADO_TIMEOUT_EXPECTED"), "Test might 
>> timeout")
> 
> Can it still timeout?

All Linux based tests in this file have that @skipUnless as they take 
some time:

test_sbsaref_edk2_firmware: PASS (2.72 s)
test_sbsaref_alpine_linux_cortex_a57: PASS (23.71 s)
test_sbsaref_alpine_linux_neoverse_n1: PASS (23.53 s)
test_sbsaref_alpine_linux_max: PASS (28.16 s)
