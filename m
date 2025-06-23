Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2401639dyb;
        Mon, 23 Jun 2025 01:20:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjupQb1tfix74nWhTcB8fr3GewEBjVpUabrtV6Ou3qhxU0rCY3ZPRFvBuhx+zihzFjNmZQ+Y4Zn+wJoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGVMACOQD5erNpBjD9Xjvxm45dI/mV2jCBBxcwlLCAIdaovSShe624xY+5yc83/DTityI8F
X-Received: by 2002:a05:622a:9013:b0:4a4:3449:2b82 with SMTP id d75a77b69052e-4a785abdea3mr167794291cf.13.1750666839560;
        Mon, 23 Jun 2025 01:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750666839; cv=none;
        d=google.com; s=arc-20240605;
        b=TiwscxSsUejMWkTJLECbuuV8B+AYmLVjNsXhHbE2xaUSAOZKa9rrFemZ1H0kGmZDzf
         dFJfP+FBo3PEfJZgzhFl7JnwojGwl/joTW40vWml6Mfuy/eLq+IAE3U/dIW6NSiVpOzl
         OcrUpA5belO6kYXe6LI8efKTCXhnwMMdv/4reNadW6cLliAHPS0/MBUxiCCmJzjcmrKn
         4jxyE9WZ6M1ZgZejoQaSBV8Si7XzdYDDwHCf01Y0anveeho+c5WYBI06qq+1gl7VcmPs
         qYgTdULgmpPwsJJd+TwVjOjOa/bby+UIIa7LfQ52798qIFt5V/zFzM3Pv5MUpxMP/YA/
         Ljwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=GBbPkcJ+cqTlKtkPkEOBLY6Eme/Qi2QlGOOm0lPBfy8=;
        fh=E0uL5X2WlsXz+8TqJzDRIMHdDt3FmzdV5owzLk9eP+4=;
        b=XQ7uSsa1nYRfSfdRTBrCkHVGQKn/nLfyz9IUUyCxAlBtkAiqEGVxrlhrYVsa/fkofk
         BFjUL3B48X/HgiiixaeOkWqsgBHxRIg0Q/9XmIrQ7iCzVtzGQFjnAzVYnBHV41XRqyNk
         i93F+iJRkPUma+1MvO0se8SV9tFB8dSKWp/KrWz47iuZ6D42LarRit4T2+Up26OU261u
         tBRD8Qy3wmUmQrXnApfOQnpYr/o7NL65d3PT5euR+3U5FKJQiGFkgvXlPo//uFU8RstH
         0DpSu+2qwbnTjNjjwFbbuefnAEy96FgloiUIIgMWXH5vXYiMi1VqHmxAdBpLOCGhLwMg
         JNRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CIK45zJ+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a779e992a3si77566931cf.259.2025.06.23.01.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CIK45zJ+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750666839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GBbPkcJ+cqTlKtkPkEOBLY6Eme/Qi2QlGOOm0lPBfy8=;
	b=CIK45zJ+/lUHW+bNfl0/hAzB24LRDT0UFGI2SFRwNg/kdb1J5KhK18Titp/poUQFZKXtZR
	6ujKnHwOomYcCWL24At2kx+hMhMEfbHaADbEe2zjB/UxSWbrjfkIWo3olXpC+XmmMc+Nqn
	KANOqOHZEyseHzdVGLNOFiQvBpcnK0A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-gI746RDONsas67etIKPqAA-1; Mon, 23 Jun 2025 04:20:33 -0400
X-MC-Unique: gI746RDONsas67etIKPqAA-1
X-Mimecast-MFC-AGG-ID: gI746RDONsas67etIKPqAA_1750666830
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a579058758so1614183f8f.1
        for <alex.bennee@linaro.org>; Mon, 23 Jun 2025 01:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666830; x=1751271630;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBbPkcJ+cqTlKtkPkEOBLY6Eme/Qi2QlGOOm0lPBfy8=;
        b=YNQRGxTSoGVDKrUcqwFWuueryUseHM12v33fHRgiUuOorpOm/3O8s4zKv911Vmyal1
         4e/9/7GuNIxbV0cGtsojxedGPZ+PTI6bg9BgVNXoDh9LVAZQmQLP+SPwaiqlQGh7vrH9
         +vi31esS2RbTaz9CXho5FUPRtqazveACWZb+BZhf8ce1GfwqHnC81M74cxk2ktgYQ4UT
         bv2uIvxRxabsjFjIdWGYIMxvN5hG0pZTjbuvZGLTM9El8whyREoc72TO6atTo1STQNQJ
         Shb102/ynDE3kQfFohdYqyjAdMQzuxvUVEwf9TrNPbOI32mMqJKgJhHuFlnqNYU4dlMl
         Fe+g==
X-Forwarded-Encrypted: i=1; AJvYcCVkFS5pa37znJ38svHRLFBeAyCKVNKgzdVoakoVMJyOgyDyLrTfAVRW9ax+jyKkhc/HIUvqZdGbWIx4Ig==@linaro.org
X-Gm-Message-State: AOJu0YwH/wgZAWbeSry+DmSIFdhuRbPzmSEucf/+ptwYzrDo98TaYpcG
	vbH7xHyFtBA2NqzTIvLLnEmZiHIJuuyqoM6/U8R8HxEjJAm99igAU3s81FnR4HnJS8SUIp81whl
	mbHHzJZ/18O002znh6maJkVDzKLV29Y/PLtVM/Kl02inxXAE8LtV2iz2EVQ==
X-Gm-Gg: ASbGnct5juFNEffM4c6/5WESIaXRVM6UoK6Ox5DnXRsOaWWOvaAzPyG2m+NjmFoZUjE
	JycXyjS5BamtVnuSwo/fMdw9z2Dc/C1eD3tyHU4fdkeBM8LU+xl+X9eM5E2ku8lA+iO/EREZYs/
	2cGZdOAcRG6h/cYEm6/taVTrNs9D6CH3KGqufsV3MK1ltKw+RLz6HD9h/7753OJ7vn2tW77MNto
	OJYv7/rCbaoy3H4vq2PB378tXX16n/PQ69u/PpktDm5SZUWazvD1HS/TL2OovD9B4NDzAQtT6pH
	4iMp9ISOrU9GNmxncy062AYYQZ4tD55Ohv6aK4odAwfqQ8t/4jz1pJqVzxdSm4g=
X-Received: by 2002:a05:6000:4605:b0:3a4:f6b7:8b07 with SMTP id ffacd0b85a97d-3a6d12e39famr8683869f8f.48.1750666830081;
        Mon, 23 Jun 2025 01:20:30 -0700 (PDT)
X-Received: by 2002:a05:6000:4605:b0:3a4:f6b7:8b07 with SMTP id ffacd0b85a97d-3a6d12e39famr8683830f8f.48.1750666829696;
        Mon, 23 Jun 2025 01:20:29 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ltea-047-064-114-166.pools.arcor-ip.net. [47.64.114.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647f29bdsm101598745e9.18.2025.06.23.01.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:20:29 -0700 (PDT)
Message-ID: <5ce9667b-3e88-4882-9e70-f5511f9cbe07@redhat.com>
Date: Mon, 23 Jun 2025 10:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/26] tests/functional: Add hvf_available() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Bernhard Beschow <shentey@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, John Snow <jsnow@redhat.com>
References: <20250620130709.31073-1-philmd@linaro.org>
 <20250620130709.31073-26-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250620130709.31073-26-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rxn1nUDUIgqvx0wHeg4H8hHzYNpikX84-KPX6zTOw7U_1750666830
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rz83bFx6lPT+

On 20/06/2025 15.07, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   python/qemu/utils/__init__.py          | 2 +-
>   python/qemu/utils/accel.py             | 8 ++++++++
>   tests/functional/qemu_test/testcase.py | 6 ++++--
>   3 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
> index 017cfdcda75..d2fe5db223c 100644
> --- a/python/qemu/utils/__init__.py
> +++ b/python/qemu/utils/__init__.py
> @@ -23,7 +23,7 @@
>   from typing import Optional
>   
>   # pylint: disable=import-error
> -from .accel import kvm_available, list_accel, tcg_available
> +from .accel import hvf_available, kvm_available, list_accel, tcg_available
>   
>   
>   __all__ = (
> diff --git a/python/qemu/utils/accel.py b/python/qemu/utils/accel.py
> index 386ff640ca8..376d1e30005 100644
> --- a/python/qemu/utils/accel.py
> +++ b/python/qemu/utils/accel.py
> @@ -82,3 +82,11 @@ def tcg_available(qemu_bin: str) -> bool:
>       @param qemu_bin (str): path to the QEMU binary
>       """
>       return 'tcg' in list_accel(qemu_bin)
> +
> +def hvf_available(qemu_bin: str) -> bool:
> +    """
> +    Check if HVF is available.
> +
> +    @param qemu_bin (str): path to the QEMU binary
> +    """
> +    return 'hvf' in list_accel(qemu_bin)
> diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
> index 50c401b8c3c..2082c6fce43 100644
> --- a/tests/functional/qemu_test/testcase.py
> +++ b/tests/functional/qemu_test/testcase.py
> @@ -23,7 +23,7 @@
>   import uuid
>   
>   from qemu.machine import QEMUMachine
> -from qemu.utils import kvm_available, tcg_available
> +from qemu.utils import hvf_available, kvm_available, tcg_available
>   
>   from .archive import archive_extract
>   from .asset import Asset
> @@ -317,7 +317,9 @@ def require_accelerator(self, accelerator):
>           :type accelerator: str
>           """
>           checker = {'tcg': tcg_available,
> -                   'kvm': kvm_available}.get(accelerator)
> +                   'kvm': kvm_available,
> +                   'hvf': hvf_available,
> +                  }.get(accelerator)
>           if checker is None:
>               self.skipTest("Don't know how to check for the presence "
>                             "of accelerator %s" % accelerator)

Reviewed-by: Thomas Huth <thuth@redhat.com>
