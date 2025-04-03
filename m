Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4294906njd;
        Thu, 3 Apr 2025 11:04:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZZSeYgjFR7dl6s8rm7we8o21cJLJ4n7HIL+vDDapuESFKJkLtTqEmXevRmCnf4UkXvbWWUiV1fyeW9w==@linaro.org
X-Google-Smtp-Source: AGHT+IHzturzTJR+g83WehyhGf90UsCDlExBW1ZoJYxCCUYQQYXSfbrzcrMH+RbxbOlj+k5bgwXk
X-Received: by 2002:a05:620a:4506:b0:7c5:4349:2f19 with SMTP id af79cd13be357-7c774e386b1mr16717485a.49.1743703484778;
        Thu, 03 Apr 2025 11:04:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743703484; cv=none;
        d=google.com; s=arc-20240605;
        b=VBCIiyTM7CRfNm7rssi8idZOFd9x/+A4TjL04Sar6oweAhS7qbAkYyREcejtBm87PP
         vVDuRB6tFDU+GVfKsBZqTn2PPLYVbMB+ZU77ajYZFeIzFqDMXr3ac1sA42IF0qEj9nvH
         QxDwN3/eHhAHdSyGWhFsFDE82y1/DO3AHL06ItXp0IN3NTDT3yJXFFinc4DWMYPz2PfL
         YYVPKAV3VJp3N9vzZMbg1RjtgCmCgnbWb9Cu714tqF4fJxlBRimmaQGjomj4cDgY7soT
         ojhi+lOeE8cScEYpI8vVrjQW3SNyYOP3z8UYONJrF/HM3ar9T3jwtRpdDk2qZtPaHMT+
         vDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=zA54mzJX1QM4ZbqBQn/Jr/oljogyDh/69nY++/8aROc=;
        fh=ItZMo3kcNvEJdYej9ASYNJXbElyVtnz4vf8OfVVA+aE=;
        b=WH0xXg2JBq3H/al6tCqXsIpXo3IubIdlcAzU3iT+nwjU8cEOzr8hQ64ZzGu3fT8KvZ
         1sK0jAWo3L2aDVgGRjRI0tlRJHm6oTugVXxqS4YtVqlJvURls21qUSFlHjbSEX61kkAZ
         NRGI+DVyATd0VL2eoEpZp308t0Qc60Abl5hDF3S28HTxunVJG1k1dw1LMtVRejQHc0GV
         ehUQnteXgj4lQe+7rubIJ5khtGw2dQwFssCkFndTgiZWzwULeK3d8JSu7pHzNxThGgv3
         wA8AxNCs7AAFJ1jg/4NdQ4SQvJgqWQDo+p8t1u9758ILVJiwkJNpIKDUEWsxnjrg6lQ/
         jIMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ENoy77FO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8738b18daaesi596071241.37.2025.04.03.11.04.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:04:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ENoy77FO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743703484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zA54mzJX1QM4ZbqBQn/Jr/oljogyDh/69nY++/8aROc=;
	b=ENoy77FOjxWrR44z/MfkxXTBjqVydMxbJkVLov9Ml9eIig5TaGwlS/X8y+2kcy/kKrN9VQ
	/kFaYL9BVKlwP/PfMETt06omOlgTe8Baxxr58zX1CItmI/gAjvF5G+kmKRGYaA0BdO6qHX
	tjkkInu2/D1lZrbd0VDQ0hwcLwE3qrM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-QOXFpqlIMoqqNidD6Qlh7g-1; Thu, 03 Apr 2025 14:04:43 -0400
X-MC-Unique: QOXFpqlIMoqqNidD6Qlh7g-1
X-Mimecast-MFC-AGG-ID: QOXFpqlIMoqqNidD6Qlh7g_1743703479
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-391459c0395so586546f8f.2
        for <alex.bennee@linaro.org>; Thu, 03 Apr 2025 11:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703479; x=1744308279;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zA54mzJX1QM4ZbqBQn/Jr/oljogyDh/69nY++/8aROc=;
        b=iF3qOLNUfVK2YPU9gwDvRZvH62oeoszZNM6HvlLouCttFS20SimtSC+zbfQw5LN3xP
         LRqPAqhJNa3cFJ54F2llOPgtkPy/S1V4heSwdWCMQRdeKw0d49Y+cV2MzBwxcRqTtGI/
         th/gJX+6tFNkoFlfMTc+gh5JsDGK9uwz6Cjus1QHrs3wtxAUin35aPoKEEBgPz29URrP
         +dOQaO09gLlI55z8jHIJ2U8kzbfeKLPPAkOT/ozoC/zWSizUYypoI1MIKm3IJTliXXjW
         6nN4gQ6E/bftacgYkSce2t6+L0q+qNGndjpL3dl9SweTr7ckTQ5y/RrhpCHv3zKYLIms
         31vg==
X-Forwarded-Encrypted: i=1; AJvYcCUpuuT3bJm5oRwcndY2y7R4eWu8UZpOkAzRsibh+VWsO0lLcqRoVSTlIvCVR2689FLv57tnwn79YQnMew==@linaro.org
X-Gm-Message-State: AOJu0Yx781+//i7rjhLX74XXmjQ4aRyPNASxGuSgSDpDwOpuWTvTe4No
	9LQmNAl+awlSlXGypZFsFoRHM8J9EBmB4K4WByzSY+1Be+1lVxLwhRVNdjtXDQHG/OHO/S0hHAr
	W29J1fTeWVkimIyn/qWSFKruzNZ1I8nOpojR7oOey93nwjSs7wLRb7g==
X-Gm-Gg: ASbGncvZcYOuwLB9lFrjrHfMUa2qO1y8lCikBt7Qtrd1vEN598P+tBrg9eZev2bsXW0
	Q7e9ZAlHOq5GjzrzGGbhPYpKxqv0X2VksvmxdqB2hWpza0simtuKmrsVWp6lpqyFIdJnUkh1fHS
	vnWwUph1EmzYeY71AvSOWtsB9XMpXjkcyZx62yRavMnC1YNgoRWV5RBsOhSDJ/0vz4nTRt/xv3s
	A5CFwQm8SzRkoOdOXRPkPATuNGSGTyyx3RIBUN+ltDSlyfPHcvY2w6x5SjQi7tVj10dM8Ib97Ge
	x+yDcRriHJemgtDmBeuX434uTCFYY4tGg0Ephwj27sHa
X-Received: by 2002:a05:6000:2489:b0:391:4873:7943 with SMTP id ffacd0b85a97d-39cb35aaaeamr280815f8f.32.1743703478923;
        Thu, 03 Apr 2025 11:04:38 -0700 (PDT)
X-Received: by 2002:a05:6000:2489:b0:391:4873:7943 with SMTP id ffacd0b85a97d-39cb35aaaeamr280761f8f.32.1743703478312;
        Thu, 03 Apr 2025 11:04:38 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-76.web.vodafone.de. [109.42.51.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d9cfsm2368607f8f.78.2025.04.03.11.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 11:04:37 -0700 (PDT)
Message-ID: <7c417483-7d5d-456f-8187-56b5264f539e@redhat.com>
Date: Thu, 3 Apr 2025 20:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 v2 02/14] tests/functional: Add a decorator for
 skipping tests on particular OS
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Udo Steinberg <udo@hypervisor.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>
References: <20250403151829.44858-1-philmd@linaro.org>
 <20250403151829.44858-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250403151829.44858-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LkOnrA3_SeOiuOFwq3-m5yd9ugsIJPZclfnP0W8tXKE_1743703479
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9oNUiKa5g6ze

On 03/04/2025 17.18, Philippe Mathieu-Daudé wrote:
> Since tests might be failing on some operating systems,
> introduce the skipIfOperatingSystem() decorator.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/functional/qemu_test/__init__.py   |  2 +-
>   tests/functional/qemu_test/decorators.py | 15 ++++++++++++++-
>   2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/functional/qemu_test/__init__.py b/tests/functional/qemu_test/__init__.py
> index 45f7befa374..af41c2c6a22 100644
> --- a/tests/functional/qemu_test/__init__.py
> +++ b/tests/functional/qemu_test/__init__.py
> @@ -15,6 +15,6 @@
>   from .linuxkernel import LinuxKernelTest
>   from .decorators import skipIfMissingCommands, skipIfNotMachine, \
>       skipFlakyTest, skipUntrustedTest, skipBigDataTest, skipSlowTest, \
> -    skipIfMissingImports
> +    skipIfMissingImports, skipIfOperatingSystem
>   from .archive import archive_extract
>   from .uncompress import uncompress
> diff --git a/tests/functional/qemu_test/decorators.py b/tests/functional/qemu_test/decorators.py
> index 1651eb739a7..b6a1d41c55c 100644
> --- a/tests/functional/qemu_test/decorators.py
> +++ b/tests/functional/qemu_test/decorators.py
> @@ -5,7 +5,7 @@
>   import importlib
>   import os
>   import platform
> -from unittest import skipUnless
> +from unittest import skipIf, skipUnless
>   
>   from .cmd import which
>   
> @@ -26,6 +26,19 @@ def skipIfMissingCommands(*args):
>       return skipUnless(has_cmds, 'required command(s) "%s" not installed' %
>                                   ", ".join(args))
>   
> +'''
> +Decorator to skip execution of a test if the current
> +host operating system does not match one of the permitted
> +ones.

"permitted ones" sounds like you'd need to specify the ones that are allowed 
to run the test, but it's rather the other way round, you have to specify 
the ones that are not able to run the test. I'd suggest to rewrite the 
comment accordingly.

> +Example
> +
> +  @skipIfOperatingSystem("Linux", "Darwin")
> +'''
> +def skipIfOperatingSystem(*args):
> +    return skipIf(platform.system() in args,
> +                  'not running on one of the required OS(s) "%s"' %

Same here, maybe rather: "running on an OS (%s) that is not able to run this 
test" ?

  Thomas
