Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp80945njh;
        Wed, 28 May 2025 13:55:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQMtM311uDsO89toA912FAadnXn4+8m0gwBrRHyInNYsqmkXzW3uW7fOXLWVO4RmKXZIAi6FvVAEbQqQ==@linaro.org
X-Received: by 2002:a05:6102:54a6:b0:4e6:245b:cf57 with SMTP id ada2fe7eead31-4e6245bcfe4mr6337137.24.1748465740349;
        Wed, 28 May 2025 13:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748465740; cv=none;
        d=google.com; s=arc-20240605;
        b=NVYLSkK0hZBb9OoVmcbb49s+kY0KdJMQExiZPGUul5bev2ehcnEr5AmwjSb9tGpWK1
         qaYaJjab36cS4ZJ28rudD1DdFVK2j85PKkdDHNNlgdiMX93jYgAcTRc10oKSpEEsccFY
         QWYMvFe0DK+it4bdzJSPJdouek56mThVLLwt/qoahQQQHu5c8sFPoGOpX6+tp9S4p6B6
         5k5+KDQtkNXXyyiqCZePAePduCUPdNSC7jvw4G56E9I6zEhrU4bSLM88DbcG0TXoBqM4
         JhE6m3RghLxmPozqubHK95acAl5ExoPcHMoyjdtHut1pAPw7PkDvm4XoSjrno1FNwXvf
         HPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=c1dW+MjMb1gwbQv9u5eh0QXnZTj7GjYzExak5PpiRHQ=;
        fh=6punUY3bd9OJ5dZXlJy/qzLKAV705B/RzidZcfe1PCc=;
        b=KUcuInpXek5ME4/C3zMrJzt1Zvy+78J+OLp8V1O0wMLydqsE2O7+xRxesGlzIiKKHe
         T3ujYRQwNWOToRGHyltG29tzvG0Zne7Fwnql8mAZKbpQtJEUQ4ykhytoUjV26HNfQUEz
         6EZa6tNz48pr+SVZc5t3Uprjr87qjw1tx9QtDs9iuz+OQtHKRts1tqyrSSnZCj75WtBr
         LJa93eMWqtBaS1021r1OB+x8lrpqUzShf16FuKZ2bmAmeAJKgBHMa2sjqrcs+VtDmgYy
         vN817RnAjpVp01i8egVS0O7HdKF8bncZGgZre5DsQ9MMAN7S45JMA+J2wyv4++GimfIP
         HQag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sPMg6VGv;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ada2fe7eead31-4e45adb85desor2544282137.1.2025.05.28.13.55.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 May 2025 13:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sPMg6VGv;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748465740; x=1749070540; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c1dW+MjMb1gwbQv9u5eh0QXnZTj7GjYzExak5PpiRHQ=;
        b=sPMg6VGvrdQ2t3pjlo/U741AkznFvykHzCcb6hWNMUj0cKfYV2sFCVxn2Wafu4CHyU
         jdTUpeTqjzVSQpKDriRkH9zYmr52EMqn3s4FhAAkNMIneCWfsAoUG66k1h6v6vF0+jIS
         0/XoiQTeL3Z8ufzMuiWrY2eoDHyvZE2iuJByvUqEaDuYv3lXkCh15In9iuOk7DexDvbv
         Ir261+vH03uQe0y/MjqeQS+udFr56ANT5G3SM8vm+d904lbTcJReRWjgTrtqzdbb1cUY
         x9LKYcs5iKJX1tU+Y6ZIs9dPQq+nqRQUif0Y8LnLjXKP7WNZKLsqmOCDBtdWIZhTnuBH
         PORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748465740; x=1749070540;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1dW+MjMb1gwbQv9u5eh0QXnZTj7GjYzExak5PpiRHQ=;
        b=ZV6axx7tIErH4dOjwFR7K3UE5JeYa4Zz2bJt+SDXGHGcl7o2TJnC7T0FMq5tJmAVSB
         Z9fdJ/mgUOvJ/WAYTGjg82w2i1civy0hn1ALDJoVAX2zK4qJqsLwIayQa+qrX0ynRhPl
         2SI9wDbjhLSE36iSxCIIAYXzUrVImaGpDLZPLqYyV9IPJelcKz+0Cc4L1wzABaut2veP
         JCD3G1BlYLETUG1NqPv/rRzctkh7eE+Ax8pnh5O+1UzUT9y9rYPv/UG6m1CWWByMAQlp
         Q7xinYpdm78EE2OIr1oP36AvQg3cVn9AQyH8ah0Gc0gAXj8Sgl8fIsa75z55WBuKFecN
         +JlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJwmWtHo3Fpg1+68SZD6r0Fa0U3ud4ht8vulg+3ITR6s4qR+6to0TO/ItuUFVTFyw6TW2LqthqYEdAZg==@linaro.org
X-Gm-Message-State: AOJu0YzojV3/NyXxXZgh+RrzwpBmt7ByPh7h+AsMLfFqxFyHYFWk3Vqh
	wWovSJvVrr5olEpq1v0W7WLkNVAE+a+qbsuwQ/m5B+tvzrvk2wwEcq1rFA9vmDQy4W+VbQ==
X-Gm-Gg: ASbGnctNYQQ0DMgCE+qOO/nLj44i5pq2Nj4kDdSKQqRrOJfrwxYB03z8x2IahsFYRVZ
	Mqj6cJQOKslS/37F03DC6WuE9irl2upNmHxH7LUv7YgUr3FtMZMo7i5LiBqeTPAUb0Q29DGjeg0
	slNldjMbonI/q6+WobKZGsQfxMWpIXHnkiNNu9HfPCxIsD+PJdMbzmSElcuq3EWGwk1xp/Od7ZK
	UR8gx4DYdy1bXAMZc97+8wqA+VvDxTyqnrw1h5kCIRr47ISFGmbMZ1si/29d3tpdO6s7vhinMKa
	YaW3o08UAo11AsxAtuu0oguwCGdMdu0BkGu4yfgp+NT+gz2w1PR5mCbl44/sNYvZmQfId5dRAeE
	zT+4jhScmV99UijEHa1m79XbPL8xBuQ==
X-Google-Smtp-Source: AGHT+IFOOELlhvuIbNRZh/Ks5IafJD2BJOdg3J5toZlMOkMTWajWNJeg7+zb16g2WbWNpn5Iqff5JA==
X-Received: by 2002:a05:6102:1613:b0:4cb:5d6c:9942 with SMTP id ada2fe7eead31-4e4240a445fmr16146479137.10.1748465739814;
        Wed, 28 May 2025 13:55:39 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:c792:c8df:e54f:dec7? ([2804:7f0:b402:6ba2:c792:c8df:e54f:dec7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87e2a390157sm43211241.27.2025.05.28.13.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 13:55:39 -0700 (PDT)
Message-ID: <559a5656-755b-4735-9578-64ecdf803bf2@linaro.org>
Date: Wed, 28 May 2025 17:55:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/test_aarch64_hotplug_pci: Update images
From: Gustavo Romero <gustavo.romero@linaro.org>
To: Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250528014737.1630668-1-gustavo.romero@linaro.org>
 <f79878fc-b5d3-4b5c-a717-0173f9c50056@redhat.com>
 <7e019a90-8715-46ce-9bae-50b070d4904d@linaro.org>
Content-Language: en-US
In-Reply-To: <7e019a90-8715-46ce-9bae-50b070d4904d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8+QF69RtFWCN

Hi Thomas,

On 5/28/25 09:11, Gustavo Romero wrote:
> Hi Thomas,
> 
> On 5/28/25 04:57, Thomas Huth wrote:
>> On 28/05/2025 03.47, Gustavo Romero wrote:
>>> The current links for the Linux and initrd.gz images are not truly
>>> immutable, so let's change them to point to immutable versions, to avoid
>>> having to keep updating their SHAs.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> ---
>>>   tests/functional/test_aarch64_hotplug_pci.py | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
>>> index fa1bb62c8f..2cf5c28b9f 100755
>>> --- a/tests/functional/test_aarch64_hotplug_pci.py
>>> +++ b/tests/functional/test_aarch64_hotplug_pci.py
>>> @@ -19,13 +19,13 @@ class HotplugPCI(LinuxKernelTest):
>>>       ASSET_KERNEL = Asset(
>>>           ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
>>> -         'current/images/netboot/debian-installer/arm64/linux'),
>>> -        '3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca3117b2')
>>> +         '20230607+deb12u11/images/netboot/debian-installer/arm64/linux'),
>>> +         'd92a60392ce1e379ca198a1a820899f8f0d39a62d047c41ab79492f81541a9d9')
>>>       ASSET_INITRD = Asset(
>>>           ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
>>> -         'current/images/netboot/debian-installer/arm64/initrd.gz'),
>>> -        '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b4')
>>> +         '20230607+deb12u11/images/netboot/debian-installer/arm64/initrd.gz'),
>>> +         '9f817f76951f3237bca8216bee35267bfb826815687f4b2fcdd5e6c2a917790c')
>>>       def test_hotplug_pci(self):
>>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>>
>> Since the original patch is still sitting in Alex' queue, I assume that he'll squash it into that original patch before it gets upstream?
> 
> Exactly. I have a meeting with him in a couple of hours and will ask him to queue it.

Alex had removed the original patch from his queue, so he asked me
to squash it with this one. I've posted the squashed version here:

https://lists.gnu.org/archive/html/qemu-devel/2025-05/msg06621.html


Cheers,
Gustavo
