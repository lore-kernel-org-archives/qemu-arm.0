Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5432331njc;
        Wed, 28 May 2025 05:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWh7+CKC1V/8vAIky2NMHXnefYkY6+9fw8HiaHglwmBmr4I2ZtYT7n40ipTPhv2yhLq/uPqaDPNDagNGg==@linaro.org
X-Received: by 2002:a05:620a:268c:b0:7ca:f028:2e36 with SMTP id af79cd13be357-7ceecb821f0mr2339168685a.20.1748434281484;
        Wed, 28 May 2025 05:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748434281; cv=none;
        d=google.com; s=arc-20240605;
        b=ZxfIta0uP118nlC6ZPkoyz668tb5ZdmfRr0cEmtvMv7tk+mFFTyKkOE1u/o/CFNxQ5
         l0PVP9ij6uZkDUQukTiUM/IiNRbXRO9H7kVV6d/hlEH7L8JDPjg2vMSa+iG2JPsUxjDz
         lOPWpifrb6qfnsgvOrG64oldaNJ1Rhk1LPmaTMgDQeevnLk3jLChClUV6NsxV6HE1rwc
         U10BLz5McApB4tOgu/c4NeO1SpWfyEsbrQ63sGwQVssAmfyKuvxMTB9s89nKHhbLm7C3
         EXgonDRU2qSO3V5P6DtcJHUqbdhGPVSYi8xZQXZB3c/0JT4W9HgmIEiqhdj+SOE1SJRJ
         HBtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yAcKUHr6qVW7V44eLRkOBhoHjhAe62jvGATf6TS1gTs=;
        fh=9I9nJ05cx3mRVLzOsIGnumfZUcGyFHrPSNvAe9N5ogs=;
        b=bdTSk03k/Lb7Wt1t0w5vhY/QMmwmuA1ZBKNIrrPrq/3KUrf4XdhdiKyS21yB0NybBG
         +ZTPezzF2DeAkTwoPVlOI6VcAaCKFzfp3x7/BeyeWQYcPOZgZiojXWH0ABa4PVN7MXen
         gwGxpORcgSVSBoAaNLv/zmw+PS33Lyy1fRJPqkN3oqtcmZpfwZro7LrgLicbcJN/s59K
         Ej4cjE9Y6KOff+Juc6nquHuuJWbhSzv1lgeCdOmvjUmHJiXU3Emi7GWU4aNilm6jtmid
         iuYZlljDNzGzrY2cIGCpM/2u8AxXRFyAgko/p+wSP+nwbnTaCUY6V+QwPkYHEhj1YtCM
         9Sig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oqf9Wo8r;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7cd468bb53asor2064010185a.11.2025.05.28.05.11.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 May 2025 05:11:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oqf9Wo8r;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748434281; x=1749039081; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAcKUHr6qVW7V44eLRkOBhoHjhAe62jvGATf6TS1gTs=;
        b=Oqf9Wo8rU6qm1SuXzKAICUwbJdiqI7OpEoR/MeEoLKZ04ktGLLv77Pm7v4omq5HxUU
         R9HtvaX3wvmLcBgQKqp7CcVqK0Pu/khnGeoyCW/jFsfguDsR9fEzw1csKEM+zOlz1riR
         e7NikCbLp5uKYE/p4PlWSfjQtHLd2KDrdJe2S18yqHJWNKZJLcMydhoYD5cwD+nKY1j2
         Wvn7d6YNGbkDiCSJkfptwEZbOZsSCiejUqGmPJHTt+vN8pRn7DGYRtaLncNL1T+1P7yl
         7ugCmFMk1fAtTSCJr4ufEuYpM3wIcogCta2843NzBsy6GhCJOHxFLvwQ1NvX6oOxqNmu
         e2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434281; x=1749039081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAcKUHr6qVW7V44eLRkOBhoHjhAe62jvGATf6TS1gTs=;
        b=K2FKPv+me/tJnSUCggB+CHG367cJIjcJneUbV3NE3oXZtFKq/KMPX9XfYEHpLhKaUH
         gVAa17s09lapC0NR2v2/qz8IMJPNUcG5/RpEZX2C4k76b4by5eXcDXRd/msexTE/clQo
         XycFLkI7qlWiDN+tK/imSn2Ly4cKpQFXEoSG9qNxG5bsqlt1YHGrMmIxAVpA2pfggVCY
         STsoi+hkfL39A3FLTM3AVM/T2QkIZqfVSH3PMwxWqHHZ+nN/p3CjWaQkiFKCij3HSa4A
         oRtUmt3mTG4XLeEIfNequP1fQ3T5MeoJ/S0njdYRn8FxL2abuFjyMCA0/XW0lJK6sN6l
         1i3g==
X-Forwarded-Encrypted: i=1; AJvYcCX+KaGG/tlD4N9dogiblzZI2p2roKBgdfTyLcEDOEYILV9wvDDODeoisxfI1gHIitq172rUrqGA/XYilw==@linaro.org
X-Gm-Message-State: AOJu0YxNR16QgUbJt/GCKfxpPqJRhkbpMPoMd8jOGJUhGGX0m2+mf0cK
	na6+g3p09pqMpJ+mapDkbUPOwWlkDvROn6NRyXhhS/YD26PvRGLkK9iswwNG92P0k91W7JfcAp+
	/vz93QG0=
X-Gm-Gg: ASbGnct/NAKx1/BRn4JFJ8G3UPG8zngcL/KKBfpTXejxpQYq1Zy3SJN3JF7BCGmL1KB
	gOtc1d3LmeW1BVliYEiaY2kPZO5uBF1X/Hwbg62tOG0vXh/ME0TpQxbuoQbG3RhXuIokuNN68e7
	UalmDwGcizYIkIA0vSlESiTSey98e/AC8dCcVbExYWUUbaXLspn3ENLTme114ufdEr/EfWYSP7D
	r2mxBtdrlzyd6z9zyeulaKs29OekN0xWhFKPLuoV3Gls2vP7LHcghllK5n5fYr6+nHBCenULkuE
	3lICWFoU1xVJ++CHLaY6ovtTYYStR/oouS/c7YiXOQD/FgtXJYnlsu8oPXe259H2ttbZrvKAwr2
	vyGNmT8vEelxSd7IkPzeA6ahL4/DWqVUhVfIUNx9T
X-Google-Smtp-Source: AGHT+IG/Xd5z05bOgFrW3EwBMvIoR1oDtRcyzrVgncLV0KoRBIbudByLNoa0KrmmZlfuYZcoC/rTuw==
X-Received: by 2002:a05:6214:aca:b0:6f8:a978:d46 with SMTP id 6a1803df08f44-6fa9d131167mr276698426d6.19.1748434280926;
        Wed, 28 May 2025 05:11:20 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:2066:dacd:9134:8586? ([2804:7f0:b402:6ba2:2066:dacd:9134:8586])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e1efd0edcsm722433241.2.2025.05.28.05.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:11:20 -0700 (PDT)
Message-ID: <7e019a90-8715-46ce-9bae-50b070d4904d@linaro.org>
Date: Wed, 28 May 2025 09:11:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/test_aarch64_hotplug_pci: Update images
To: Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250528014737.1630668-1-gustavo.romero@linaro.org>
 <f79878fc-b5d3-4b5c-a717-0173f9c50056@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <f79878fc-b5d3-4b5c-a717-0173f9c50056@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hb/VY/g1IIX3

Hi Thomas,

On 5/28/25 04:57, Thomas Huth wrote:
> On 28/05/2025 03.47, Gustavo Romero wrote:
>> The current links for the Linux and initrd.gz images are not truly
>> immutable, so let's change them to point to immutable versions, to avoid
>> having to keep updating their SHAs.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   tests/functional/test_aarch64_hotplug_pci.py | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
>> index fa1bb62c8f..2cf5c28b9f 100755
>> --- a/tests/functional/test_aarch64_hotplug_pci.py
>> +++ b/tests/functional/test_aarch64_hotplug_pci.py
>> @@ -19,13 +19,13 @@ class HotplugPCI(LinuxKernelTest):
>>       ASSET_KERNEL = Asset(
>>           ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
>> -         'current/images/netboot/debian-installer/arm64/linux'),
>> -        '3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca3117b2')
>> +         '20230607+deb12u11/images/netboot/debian-installer/arm64/linux'),
>> +         'd92a60392ce1e379ca198a1a820899f8f0d39a62d047c41ab79492f81541a9d9')
>>       ASSET_INITRD = Asset(
>>           ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
>> -         'current/images/netboot/debian-installer/arm64/initrd.gz'),
>> -        '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b4')
>> +         '20230607+deb12u11/images/netboot/debian-installer/arm64/initrd.gz'),
>> +         '9f817f76951f3237bca8216bee35267bfb826815687f4b2fcdd5e6c2a917790c')
>>       def test_hotplug_pci(self):
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> Since the original patch is still sitting in Alex' queue, I assume that he'll squash it into that original patch before it gets upstream?

Exactly. I have a meeting with him in a couple of hours and will ask him to queue it.


Cheers,
Gustavo
