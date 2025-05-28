Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5315673njc;
        Wed, 28 May 2025 00:57:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4E5ZhCoXQoBL4agz/mp7yjFfPSGOBg/uh3ndhQQBCEwmSb7HJSwndW5cb3MdKUEv0pxq6MLyUwYmI2Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGlJoZmyAlm12o23brSp+LHuZK4sBHAUyZHNGzmsX75yCrKyRZYKfOaqh7C6U/2b+s8pFRl
X-Received: by 2002:a05:6214:3290:b0:6fa:a0c2:c35e with SMTP id 6a1803df08f44-6faa0c2c3a4mr187955296d6.12.1748419054582;
        Wed, 28 May 2025 00:57:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748419054; cv=none;
        d=google.com; s=arc-20240605;
        b=Tlkao5MRl5f4rPSazwSxHZIvOtemjsn8HGzkeJZue64H83zEo2MnLJB7k+O0ggrnrR
         +yi9mwvurLTY60Pz4cWrX42TnPFm3K91hbI0wroPmU3aghqtcDXGTgG0rWx0JarySTOV
         ZksKgHzkxpB72/OipvKUFrga0cUGfJer4tx69WLlitgdFuOPga4FA2MASLpATnyj6eB0
         UgjHTYNWwKmCu8+in7zAn6U8zvMdXlgI7b0xWluoLVEP+ffUc2dbrkI/VDksF0j1KjNy
         vu1mUzGCNlLqooQKCPlBSmXdnDakrpdesNSuHSLYN1LQNzlZ8q4bRR5ag3al8uoeGp05
         LbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=R6LaWX7syv0whEJnfjjPjQSY8hZa7TjdC6oVKq3FDOA=;
        fh=tdmx8eBeM4o4Eg6+ElFPoVYyxkdwlaHZuAqDJOJ0XOM=;
        b=KrTA0PsxzH6++oa8/PJCm7ezVapTs4kfFIDlbYrTKgaechlGDuz7GY1hXLEVpi3CY6
         4lM09r2RAeXntk3GLp3PzTnTwV1YGOBT+90l+u0laLiZXcOSZ0EDESJsbGj3w02G1YsF
         lxlI1oHwhbb5GbBAmp0Ueh/8WENNKOSsgOPboaMxSSOJtFxyuJPBYwSIXLcbfue/TspN
         5UDSYa6/+kUQu+khI34phSKDV/ZVqf7NNF2J30kdKdXDPN0BnShLOibD/MfF2OYUfcLG
         GQwA1tl3WiFqL2yzY6LwdjRJENOkn+zs9ks6leB1um1LAaHjrewkMaaB3drXfmPEAXzu
         8IIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OuscsV+0;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac0b29bd6si7689756d6.151.2025.05.28.00.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 00:57:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OuscsV+0;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748419054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=R6LaWX7syv0whEJnfjjPjQSY8hZa7TjdC6oVKq3FDOA=;
	b=OuscsV+0NWjIQPPPvabyFBBpML7en8zMAKkTfh31pPeFyTw4tR3u5oIKdHPSDH7MupwyuU
	wq2A5IBtDNKABHPF/4fuIN2rYFhkgtDjHETIi7/nUgxB4V5mecd3wKz3931w4emMMf3G9A
	BqM6K/rBQhbABfLmbCbAxoWH87nnBxU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-G-k7JznCNeC-a1wktemcng-1; Wed, 28 May 2025 03:57:32 -0400
X-MC-Unique: G-k7JznCNeC-a1wktemcng-1
X-Mimecast-MFC-AGG-ID: G-k7JznCNeC-a1wktemcng_1748419052
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac79e4764e5so431599366b.0
        for <alex.bennee@linaro.org>; Wed, 28 May 2025 00:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419051; x=1749023851;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6LaWX7syv0whEJnfjjPjQSY8hZa7TjdC6oVKq3FDOA=;
        b=Q4WxNCYDa3V1D8HTOeXfy+0jS9sDb65ViFrUg0luRlRWddp3mYOPnl1Cf1i+QarmDg
         C/nhzhbtVy5hNFzmcadl6ocriAXLFqvnsMlUcUStYuwBQO9xR+GJfjYQdPCdJcsUC3c8
         kBITEkzQJyeXcLODY9Db5OIFfSvYvWSdxKulMfFHhUBtviAIieIgwH1Xz0HPOns9kQUe
         lGKOgqg/f59vXKzAJk4NpVwhTQUXCY/t+o0cwG+5KZk5c+4LjMA8j/8MteheTs+febCX
         KXhaERT79/fvR/Ac6ha028JqrL9GdKhzcjKvH34P40X1xuPBK8Gnb1ndOn4rWaBw8myE
         Gyhg==
X-Forwarded-Encrypted: i=1; AJvYcCX9RUqfe+q0reAhRw48KoqgiaqUGCgU1PjinnoeKFR1Nrrrhtmkeb5Dlrf9NhFVOqVgtx8SC9dqdVDgcQ==@linaro.org
X-Gm-Message-State: AOJu0YwDGmp7esFyLWwKkwJpVQZOSLq87gROsYexlKcyY0eRkZVmakr8
	T2sce0GP+XPJhA6q82ormJdJYInC68N4mv2eHxBB0PhOlb1uEt2e9xgv8C21t8XiRYhr2r2sdU1
	4297KtMO53cK3O1aR/KN8zd3+AKJjVFmF8/GVfddJvjRxrIwqeMy4rPuVUiottzd03aRS
X-Gm-Gg: ASbGncs4MGUseVrClza/rFY42RTcG2MH0cFQUlhDU/J4Ru7DDTiiDs98sQ7gurOUx34
	qzE5Bbrr8WD8da/67Mc+M6Hkzqqr3/GadeiGqMkrNXBFMQK6OJnEIJrLZIw/uYgPdjtIOcP33jF
	LYv4buywWpqh5CJCO+ucUSnlisuzzBpWG6nIZ0qJnYuc9zto9EK68f4IlFXVF4joRQnczHQIBI2
	KTCGijF2Yk8+uGBE6hHD72wQRSOf8IRR7fasrXsvta9Fs7RuL9ZDNV8LHwinJqnxQ4GriQvess7
	kO0pFVw3ggJTCah6SRWHkKBjBd34IHgc8rejr5rJQSaxoGLnF/R9
X-Received: by 2002:a17:907:72ca:b0:ad8:91e4:a937 with SMTP id a640c23a62f3a-ad891e4ab46mr453180266b.57.1748419051549;
        Wed, 28 May 2025 00:57:31 -0700 (PDT)
X-Received: by 2002:a17:907:72ca:b0:ad8:91e4:a937 with SMTP id a640c23a62f3a-ad891e4ab46mr453178266b.57.1748419051093;
        Wed, 28 May 2025 00:57:31 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ltea-047-064-112-237.pools.arcor-ip.net. [47.64.112.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a19c9a18sm63778966b.42.2025.05.28.00.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:57:30 -0700 (PDT)
Message-ID: <f79878fc-b5d3-4b5c-a717-0173f9c50056@redhat.com>
Date: Wed, 28 May 2025 09:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/test_aarch64_hotplug_pci: Update images
To: Gustavo Romero <gustavo.romero@linaro.org>, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250528014737.1630668-1-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250528014737.1630668-1-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dBviJOOCzqmX2LbcpVMmzwvB9ah5dkgvgXM_13NCI74_1748419052
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4A3IeQmT4xs/

On 28/05/2025 03.47, Gustavo Romero wrote:
> The current links for the Linux and initrd.gz images are not truly
> immutable, so let's change them to point to immutable versions, to avoid
> having to keep updating their SHAs.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   tests/functional/test_aarch64_hotplug_pci.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
> index fa1bb62c8f..2cf5c28b9f 100755
> --- a/tests/functional/test_aarch64_hotplug_pci.py
> +++ b/tests/functional/test_aarch64_hotplug_pci.py
> @@ -19,13 +19,13 @@ class HotplugPCI(LinuxKernelTest):
>   
>       ASSET_KERNEL = Asset(
>           ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
> -         'current/images/netboot/debian-installer/arm64/linux'),
> -        '3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca3117b2')
> +         '20230607+deb12u11/images/netboot/debian-installer/arm64/linux'),
> +         'd92a60392ce1e379ca198a1a820899f8f0d39a62d047c41ab79492f81541a9d9')
>   
>       ASSET_INITRD = Asset(
>           ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
> -         'current/images/netboot/debian-installer/arm64/initrd.gz'),
> -        '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b4')
> +         '20230607+deb12u11/images/netboot/debian-installer/arm64/initrd.gz'),
> +         '9f817f76951f3237bca8216bee35267bfb826815687f4b2fcdd5e6c2a917790c')
>   
>       def test_hotplug_pci(self):
>   

Acked-by: Thomas Huth <thuth@redhat.com>

Since the original patch is still sitting in Alex' queue, I assume that 
he'll squash it into that original patch before it gets upstream?

  Thomas
