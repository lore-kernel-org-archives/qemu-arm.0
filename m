Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5205298njc;
        Tue, 27 May 2025 19:09:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlGFC1RXvlg5UH6wESraqY6I2mQ/3p5NReW54pHBS+QMJ+3zAQG5OSkGMUcw+T2LmosjTdb3BOltLcuw==@linaro.org
X-Received: by 2002:a05:6102:4b01:b0:4db:154b:cb3b with SMTP id ada2fe7eead31-4e424065855mr14003064137.3.1748398168629;
        Tue, 27 May 2025 19:09:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748398168; cv=none;
        d=google.com; s=arc-20240605;
        b=kVwI8twCgy7KQGd759zPlEv/5Pk26GTDGXhPTJaL7BKkHz+kbMKzDFjcSQCckug5zd
         N0wWbex6OJi68+rqcjF3X2Wmq1alAmZCuwGKNK3sK/kWj+UPTZxgR7hJaizTDHpyIIur
         QPdgX948P6ToEQ2jWQtQ4opgU5cQ5PBAAhngGo/3BlcQR9oGg7Bfu2xcLhs91QdmdSO/
         jkH1uBjJ8e3TstrJV64v1w0R2gpwobTMp3a+Mvy/Wzie+grn1MWnAS+rjVtB/YraEUN1
         /BDoHicxfe94HI4ahC2iQUpb1y4uDKPvbKcn6d9jQDw2eWG5Mwg1eKVXx9ojWpO5FhS+
         565Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Wtbq2h+y9kthJuDsybddcS0fiWltNSujth8UJ2mhJ14=;
        fh=BDl/hN2KGpERY9Cauv6q3iqlM/lLb4t31zpnwOsKFuw=;
        b=MPNT8CeFXLSd2lhLjGNOdl0Fo8jbquwbEj2zun7BN7NeJDbCLHkaQVfd3+2MuCyiYQ
         qzQ0kqMWSYlg5KPZ4rCoiL4u7w1CjoW9O6xpEma3DJgpN5dCBvwnjIljoUp/wYLHjeZJ
         3Yii0AlLCNI4HAIl9nNw78TNS31E+6D6m3MvR3jBzFa409DqnsqL/afH41lx3n3TCCoO
         XX/XrQrRci9qFNHKiJBKbQ8NGB7YoAGnxv3ATh4UMkYzhPB3HbmTKuORqNUr88lhyOaE
         mpy0Bel0SCwgW+hDrUfVb4CCX2ogHtrt4FDOjjpol7clynblnwNIAQYyqgoBT9X8OXMM
         4Fmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQIGDD+f;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ada2fe7eead31-4dfa667a9d2sor2733729137.4.2025.05.27.19.09.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 May 2025 19:09:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQIGDD+f;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748398168; x=1749002968; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wtbq2h+y9kthJuDsybddcS0fiWltNSujth8UJ2mhJ14=;
        b=OQIGDD+fdnJvNOndF4D+L5Pa1AXNeC5zM7j1TxSFf1Oo24LFEGwzXBLJBBlEnbWnwX
         +fYilVLpPUH9WjuD3eSAURshM7dsD39IsvktIfH+CHDTr6auQooadhQRc4IiWdVv48GO
         dHKySIyZRMnTtnKdoDLuXNPYXiMtDVI0Ik9jiR08h6N5jm3PgNz2uaV1USq+LytWbUpm
         CjWwO4ekfjozZzhd31Z6G5TfQzl2jtEyOwxui5+9hXWkXmuPZnBVpqrRK83O56fjgrNb
         dkn6Ha8sXWGmL5x0m1PcYPUPSudbEKUAtRCzcCaf0mPC18/aTro+Ff5sZ+dDTctA5ai/
         zOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748398168; x=1749002968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wtbq2h+y9kthJuDsybddcS0fiWltNSujth8UJ2mhJ14=;
        b=MQrYNDCecelIIO3TFx98KSptbZfSVMO+5n7FRdtuUJJglAhH5I1AF7EflDW+9pedwy
         EmvBTBxuaMh0q0uyI3fn/6SiMvcshs2DZ11ZCjSXAlIW0MiZiCy8jLa18Bs/b00BngfD
         u6VT5kc7ZViP1CzzYyfxjVtA36dFGQ6ZKJs5vS1hEIqkd0Yi7SctMo3e56zaq3pSmGd7
         eU4DsdbFZ5DkOe4YZInDepiFVAoq4TGv4Sx+glhqVOeDWZT0FgsOoh5z0IM8rZPBuMFG
         68qwaAigEpFkUVbD4kP2cA+Kkudc4oc22By4vioF0DqRGe+lxsTAB/Eup71IRe1IvhCt
         UfbA==
X-Forwarded-Encrypted: i=1; AJvYcCWU48J6V565WUhuzFnvDuyLNV/42uh7V6rhderiMDRUefaLbG1fn2I5yv0K0k+Ojg+SIriJFrLIijS7kA==@linaro.org
X-Gm-Message-State: AOJu0YwqWXu3C+xUqw8kM2mwo47ZU9QHUYACZhTR8ST0zKsnnqsu0EwU
	luPqxSMzjIWi71RienPgd8qCbEBn0BGuD0ak0pPXgFZ0DXubbXlDsg/md9DM69k0xePFhg==
X-Gm-Gg: ASbGncsIOzfh8WqUHvjJ929BnfIl4YyC9AdcyYrb+9cQ3X8Xdk2NpBx6uxIVOhkodD9
	Vzaq4fMh0CA3hl8qbS64F1JMOcD2wOO0u0LSamNsfpuEJfBq5pLIi4L/aGkaQrww/YjQp5yaTa4
	QQQ+Srh+UnHOxlbdLBActFbgNnOKDd65QpS5S1Ds+bGNNKx8e1upUY+W3PfbFwjPlthgK4MdH7L
	sMYho2IvHObOof0X6UEcFRyjg3iAkVT2/jv+LNh0FCu1nFNeIqZG/0Sm/H+9yw+lmjU4Ab89yHV
	94XunNmgUa/BLN9z9iV6wOiq/FfyUm6bLOCAN66sIk3LL2qDCES5387wGyz5IhWvf8dcg6oQUK8
	HONOlXZ7qG6uhijTNMkUReP2KxpMQMg==
X-Google-Smtp-Source: AGHT+IGZAjy0fZu4/FipeUhUSoiBaPcyKNc2/KS/gA8KsVt+YWu82yAS7NM8wp0Oxk5jnHeUp7UjTQ==
X-Received: by 2002:a05:6102:2ad6:b0:4e2:9826:b72a with SMTP id ada2fe7eead31-4e42418a79bmr12520169137.23.1748398168178;
        Tue, 27 May 2025 19:09:28 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:2066:dacd:9134:8586? ([2804:7f0:b402:6ba2:2066:dacd:9134:8586])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e5a0307470sm113809137.17.2025.05.27.19.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 19:09:27 -0700 (PDT)
Message-ID: <b5e8dc94-913a-4582-9235-44dbe9bcb989@linaro.org>
Date: Tue, 27 May 2025 23:09:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/functional/test_aarch64_hotplug_pci: Update SHA
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 eric.auger@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20250527150229.1617074-1-gustavo.romero@linaro.org>
 <20250527150229.1617074-2-gustavo.romero@linaro.org>
 <33015b21-bd6b-473f-8066-1df6c0c731aa@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <33015b21-bd6b-473f-8066-1df6c0c731aa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: O/v57piQ9Vad

Hi Thomas,

On 5/27/25 12:11, Thomas Huth wrote:
> On 27/05/2025 17.02, Gustavo Romero wrote:
>> Update SHA for 'linux' and 'initrd.gz' images.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   tests/functional/test_aarch64_hotplug_pci.py | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
>> index fa1bb62c8f..bb2c121503 100755
>> --- a/tests/functional/test_aarch64_hotplug_pci.py
>> +++ b/tests/functional/test_aarch64_hotplug_pci.py
>> @@ -20,12 +20,12 @@ class HotplugPCI(LinuxKernelTest):
>>       ASSET_KERNEL = Asset(
>>           ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
>>            'current/images/netboot/debian-installer/arm64/linux'),
>> -        '3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca3117b2')
>> +         'd92a60392ce1e379ca198a1a820899f8f0d39a62d047c41ab79492f81541a9d9')
>>       ASSET_INITRD = Asset(
>>           ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
>>            'current/images/netboot/debian-installer/arm64/initrd.gz'),
>> -        '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b4')
>> +        '9f817f76951f3237bca8216bee35267bfb826815687f4b2fcdd5e6c2a917790c')
> 
> If the images reside in a subfolder of a folder called "current" there, and are changed in the course of time, that's a good indication that we should use different location for the test images instead, otherwise we'll continue to play SHA-updating-whack-a-mole forever here.
> 
> Could you please try whether it works with the images from the "20230607" or the "20230607+deb12u11" folder, too, instead? (see https://ftp.debian.org/debian/dists/stable/main/installer-arm64/ ).

Thanks for the review. "20230607+deb12u11" works fine and I chose it.

I decided to split these two patches so this one can get merged first
and doesn't need to wait for the ACPI PCI hotplug series:

https://lists.nongnu.org/archive/html/qemu-devel/2025-05/msg06331.html


Cheers,
Gustavo
