Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp601047njc;
        Fri, 19 Jul 2024 10:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHgqymaYVdDzbP1BZAipmzIrOMjr0V4g7bo4TIDZ7PDuSylBXWwygkG+V9wThSQ4Mx2Bzl
X-Received: by 2002:a05:6102:3313:b0:48f:e4b0:81b4 with SMTP id ada2fe7eead31-4915976c88amr11222035137.7.1721410830598;
        Fri, 19 Jul 2024 10:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721410830; cv=none;
        d=google.com; s=arc-20160816;
        b=BWGdtweMVYbn5zdU40DTi15KgFXbsWOMHXrqJEudibuX6HM1QkyWBqPZkEEBS0qFMX
         1X+kNM6d0T01C8pUjBWaNtNvs9KHFuav6V1hfICIUAIoT2JZeQu9F5c7ql+6RGpgjWx3
         0J8nNvWy1vvUbEelbfyjgh1bKhRIqr6Og/fwXsUIh4VrB0Bk36kl5FW7l1npWnaBMwvP
         xgQ2Cvsj1LK1GSxhw883ZkPBJCosCpKylpC6x8hWUXsRNpIqtN6VTmSBQ3KEn9ZmAIOx
         GrD5mdL16JC9W3+a8OFbM8PlZlT6NVYRo3r5sZ45vNdC/iq2gCju8wrleSYtQEvdh1Ma
         QY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Qlavf071hcgu5/vDcxKZPUYyyjpKeLcKg4hCsaKtUzU=;
        fh=uVdFrqc4EgkpCeWTS8FzE9A/S81IxY4p8TDjyohpT64=;
        b=YHZGk/rsE1wn9TODPWIqxmv7+SmKxMJfW1FEfmjVjR+nWOuWDhn6eaFCOeXNWJYbnD
         CZTdExcEVUX0U+CE1LGQ+NDYQeaXnJRSophk4emNObp8zzbgYMYR2XAhuqoq5scCwRC0
         bvK34SRkJCYec79mDi3493m88z4qcFmW728oULWpGiCtFk0BIGAVBUhxb8GBBv3b3RsN
         dWI5iFmeIyDyrbpLQOagys6LHZMe/RjbXIbT0uN7hCEgfnUt9JHc+jXVwZhsVmZZZEa4
         a7bIYg8g21S/BBYC0SQidXUSR+KmNSF0xFXBS+r+sPXAvsva1KDotLCZXAJduRspl61w
         0M+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UMYnRuQ3;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cdb8508si21778351cf.237.2024.07.19.10.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 10:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UMYnRuQ3;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721410830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Qlavf071hcgu5/vDcxKZPUYyyjpKeLcKg4hCsaKtUzU=;
	b=UMYnRuQ3hFFv5tCD44YU8WTuo/nQCeYA26P4nwfslSY1pp05eRuRd1pe3GFlawpW7JvYDp
	IsJ7gLdRg7OmlrQRHqrqxbtKL07kRwv6ZcI1vrs1Sv9LsN3x8BVidioxTj/qSJdaOTn6yv
	N1K+RXrqo9WCfosueXK336s3/qumA9c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-FGke6j9-PYeTgKurDCD1Og-1; Fri, 19 Jul 2024 13:40:27 -0400
X-MC-Unique: FGke6j9-PYeTgKurDCD1Og-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42660bca669so13395445e9.0
        for <alex.bennee@linaro.org>; Fri, 19 Jul 2024 10:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721410826; x=1722015626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qlavf071hcgu5/vDcxKZPUYyyjpKeLcKg4hCsaKtUzU=;
        b=vNFC4uySgT4z8dg97LnoQuSaAe8EDpZcMfhHWe7gbT6DlpT/W/xIbg4oC1o9qULXq4
         v8PQbrXrfracc4LaquHxabVob/3p/fYJXIU0M/z6SU/hNt6JjEX+X0VLGkkkewKRSIVK
         0m6dnHc4R6H+GHuPTJCYRTn6ehFu190rEMXhLHKUHeY9mh0VqrNsSU5NSHXEEoLJP+b7
         Qwx3Tu74ZNg3zqAxCdcOPFeSzvbDRiFEGLvvjYgA6pqdwhV70uXCMNWVSSuYHAQD+U4Q
         yzEZFYCaJSuFv2xC4OCezZU62eFdz5rlrSTSC+I5JbmWDlz4Vxk3g+RCMOYtQYzaiZEm
         yZ7g==
X-Gm-Message-State: AOJu0YwTlJOfIvp99S1UWr5BfqW1UNJBHmJ/oOIAfnH48l0MOxSE8r40
	NrCsgOj28jtO890OfFksFWXRdm1bXOsEFMX8j5x3gAZh/MfA0ybYxjC7g5pRrdBbjfEZB13MK4y
	RVUVI/6D99bFC9t+J7SAYgeFPuY4HDvJkTy0PaK9oFSFNm4t6Px34Eg==
X-Received: by 2002:a05:600c:4f56:b0:426:6f17:531 with SMTP id 5b1f17b1804b1-427c2cb15cbmr75740715e9.13.1721410825874;
        Fri, 19 Jul 2024 10:40:25 -0700 (PDT)
X-Received: by 2002:a05:600c:4f56:b0:426:6f17:531 with SMTP id 5b1f17b1804b1-427c2cb15cbmr75740655e9.13.1721410825530;
        Fri, 19 Jul 2024 10:40:25 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ip-109-43-177-101.web.vodafone.de. [109.43.177.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6934ec6sm32970115e9.41.2024.07.19.10.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 10:40:25 -0700 (PDT)
Message-ID: <e0181f1a-15ef-4525-bb31-335d66aca4ee@redhat.com>
Date: Fri, 19 Jul 2024 19:40:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado: Move common Avocado tags to class
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>
References: <20240719151310.45927-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240719151310.45927-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 87m7M1BNnR1e

On 19/07/2024 17.13, Philippe Mathieu-Daudé wrote:
> When Avocado tags apply to all tests in a class,
> we can define them once in the class: they will
> be applied to all test methods.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/avocado/boot_linux.py           |  2 +-
>   tests/avocado/boot_xen.py             | 17 +----------------
>   tests/avocado/machine_aarch64_virt.py | 10 ++++------
>   3 files changed, 6 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index cdce4cbcba..df6cf209ef 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -64,12 +64,12 @@ def test_pc_q35_kvm(self):
>   class BootLinuxAarch64(LinuxTest):
>       """
>       :avocado: tags=arch:aarch64
> -    :avocado: tags=machine:virt
>       """
>       timeout = 720
>   
>       def test_virt_kvm(self):
>           """
> +        :avocado: tags=machine:virt
>           :avocado: tags=accel:kvm
>           :avocado: tags=cpu:host
>           """

This change seems to contradict your patch description?

  Thomas

