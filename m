Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp3500346njb;
        Sun, 18 May 2025 02:26:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUb2VDzCHxu7hhsG6I647LVJRZRgVuJiKE2+NynZH6XL7jRZ64C7CV0owBEnrUKVTDhxOcofij5WTNvqA==@linaro.org
X-Received: by 2002:a05:600c:3114:b0:442:d9f2:ded8 with SMTP id 5b1f17b1804b1-442fd6444c4mr98931895e9.15.1747560383884;
        Sun, 18 May 2025 02:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747560383; cv=none;
        d=google.com; s=arc-20240605;
        b=Bxc4LFM1mxIs3HDlFn9FDTZ09I/oMRfQz7+CIkRYNK6Pl+4rpwFcx8/dyG8mL9EcHP
         4boy8xVxsB2pMJpB39gDcO02VX2lKy+QDpN+gnvofwSRY8Unqa+UzXQJh67GIxxjYk7e
         dvkfBHUhjAVY73laS7gVM2rb+iV366nGs7kfjcVfYa+Qo83YqLFaNu4Nl1rzPyWsqzxS
         3Ly5izXdvycCgyzMSAFyt24caddLtnPs/3QbkDJReHOU51AmLNGmmS+gy/LKE0/rtiu+
         zXHpzpdMvy0i2NtJ6YM7E2Y8Om55HScwm8MXqgb9xNaBvfFfx/mr4y1JTeNbZoW2j0OO
         RLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tye68HsEbrPuvv/GNCaIp4vNWzgV0y61jF9TskKCzhg=;
        fh=xvWPwk53mEPPX54DUSTRogckkQSnXBntiWNsQ6R53g0=;
        b=TibaINNYt6+L9ShXuwxnZi1r6GiBJNtwpBYSloo88kXEMadLnug8Se51C0c5nj6MV6
         GkRlCmc19B0+sPMejS+z4AsPzF3aiKEpkdy+9+/JhGNA3Nu7ICs3U1kpa4GlopZCfu+/
         DSI8jeuMMgNqAcRFg/OeTSBejjUulJdLbPDNiEB1zfEQ+MHQ8CAnyfyTHdb5+n9FpsFa
         H47lx5wfUi9ymcUxlH0yqFuhriDXZSrDYmMpmZlcb6DpMcSonNCi/TMCGfa1Bb3E1a8P
         O9wTo3WeC9Ag3olHAIjbN9UVO1OIt2pKFSuMOAEGqxbNRXunruUoCOzm7IraZenA8VrS
         2r1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XpvKaYbl;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-442fd548e87sor16737575e9.1.2025.05.18.02.26.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 18 May 2025 02:26:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XpvKaYbl;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747560383; x=1748165183; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tye68HsEbrPuvv/GNCaIp4vNWzgV0y61jF9TskKCzhg=;
        b=XpvKaYbljFvYx4+QywVa4KWLScJg7Hhoi5bgKMQ0GPpLsOXxEERPfAN0ew/j8QAuhK
         V7+CPh9vthSaCcKC8h98+ia0VmkH1GTZSMrg5c9E7yrHKNbcy8GFVY2gvYD83F0T3prh
         2pR51bccgMJye5wFXeA5g0iqPtYS2d2BcwdF8zX4e+i4+99zqBKzypH8NJIk7dIWjI/V
         ZA4tqxF3oyzSDDQCt2nvzP9zhK5APC5+Bh/UnRvK8xnB4UB0vyanmACm/8EorWrN0+Ph
         MFq/hu4hLLH7zll8GadTRVaJ+r7GE7A6nPJKgVj4+FGa2ad+F2G/cw2f9D0IhiD4HvcJ
         p0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747560383; x=1748165183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tye68HsEbrPuvv/GNCaIp4vNWzgV0y61jF9TskKCzhg=;
        b=Jx+IXLOJZ355w8++MzQN1Bpy+9CPIF2ST97L0YneJB2PLWrxD6kcGNVWWHLoUEx/yD
         /iO4QL2rOcgpdOJCMoVcGdKYcJEwP3vX8hoIMTYf+OhTU9EF7HPIvniBWpraOHTht7IU
         Om5GbstTqK3DlMQvzY+yaIkk76OPVqQqZxaJJ/iNVcGhyJMI8VASmNKxZhYjO4FHTUrb
         JAXG2v7Sz344UBT6Vtk/G0IYSXoATCr2Q6n+K8txz8+uxK0fLITpzq03cbMIpWZ43i7M
         LxGgyPm5yOBg0waOtYr5s41IXQ68yo+9T10jHFWHVIJ4LmU6FjN/mnS6VVjNhyQsnZ/+
         dN3A==
X-Forwarded-Encrypted: i=1; AJvYcCWW3i1VfQsIdo4SNPu+IaU9ueckCXpNduIbnk+9+A2e5I4jrCwK4jkjfuCUlQIlnwLkx7tOv2kCR8qwYg==@linaro.org
X-Gm-Message-State: AOJu0YxBPisQt7VC4YKhwWdVywEY7IaGChRpbgPYo1juwrYKgMyFhXFp
	0oUcqOdYCYgtRciyXf+vLAHZBlMf8u9QAM2/qfwA2l9JcGiwz0WYQC3dalm/JO5q9q2QNw==
X-Gm-Gg: ASbGncvMOkQhU+dQ8FmhpEW7Q00lR1IgyzcwCXivmfQxHJuDkqiKnaVbKFbZyuNqNnL
	oqtSsWu4wsy3aFXNm/yIVisSwa7n3HPQCzg8sKKmEgCTxN/Gi0+XPKdJmOljZl8mRXIzSBay7cd
	a0UcfJLGJcW/h2aQ1EBepyGnV5m7VCSCHQe2cNpeJlQgk3UJp4uXNnuE+9SEd4TL68nA9S9HAYd
	6lf3zXPEMv4yhyAhbUZHhAj8HLubOPZypSWoYu83BP4Moou45pTAkUUDXqqXRMSnxidwKi6NPDh
	uOxssHTdzHfBXMCmsE782t9vJi16c9EhEUjBfJVs2CfOOSeL1rbWh7BEo4/iTLw=
X-Google-Smtp-Source: AGHT+IFrD+DTG+DLL7LAIEFVYVoSa5Rgqme73HYIJq7iBNkVmTBRwa9aTLfERWguJWsofxaYYEtLXA==
X-Received: by 2002:a05:600c:4447:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-442fd675932mr89412965e9.29.1747560383249;
        Sun, 18 May 2025 02:26:23 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [10.226.118.16] ([149.232.183.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e84acsm175837185e9.25.2025.05.18.02.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 02:26:22 -0700 (PDT)
Message-ID: <85f13ff0-80c5-4a62-8b33-ff35911866a5@linaro.org>
Date: Sun, 18 May 2025 10:26:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tests/functional: Add PCI hotplug test for aarch64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, thuth@redhat.com, berrange@redhat.com
Cc: eric.auger@redhat.com, alex.bennee@linaro.org, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
References: <20250512144629.182340-1-gustavo.romero@linaro.org>
 <002caade-699e-4128-ac08-7797b83b3cc8@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <002caade-699e-4128-ac08-7797b83b3cc8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mvfc59Ocn6tZ

Hi Phil,

On 5/16/25 15:47, Philippe Mathieu-Daudé wrote:
> On 12/5/25 16:45, Gustavo Romero wrote:
>> Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
>> hot-unplug on arm64.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   MAINTAINERS                                  |  5 ++
>>   tests/functional/meson.build                 |  1 +
>>   tests/functional/test_aarch64_hotplug_pci.py | 74 ++++++++++++++++++++
>>   3 files changed, 80 insertions(+)
>>   create mode 100755 tests/functional/test_aarch64_hotplug_pci.py
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 23174b4ca7..9ebb768214 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2065,6 +2065,11 @@ S: Supported
>>   F: include/hw/pci/pcie_doe.h
>>   F: hw/pci/pcie_doe.c
>> +ARM PCI Hotplug
>> +M: Gustavo Romero <gustavo.romero@linaro.org>
> 
> As mentioned in v2, since this might interest ARM contributors:
> 
>     L: qemu-arm@nongnu.org

I thought you're saying "include qemu-arm@nongnu.org" when sending the
patch, not "add the email into a L: section in the MAINTAINERS".

The test is now queued in Alex's branch. What's best: send a patch
now; or wait for it to land in the master branch and then send the patch?

Thanks.


Cheers,
Gustavo
