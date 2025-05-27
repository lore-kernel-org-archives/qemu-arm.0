Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4884394njc;
        Tue, 27 May 2025 08:11:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWN0Mg623BneilNTQNQ+pDuIQ0jKPvywAVBIxdLZe2CuOOkfB6+4oyaQBeqJtzCdP/xO9SY1D1gXFCGyg==@linaro.org
X-Google-Smtp-Source: AGHT+IFykRj97cX+0wjMSzO90FEqndy4kesVbQ44u8w8quv7uMNRVYfA4/Aj8j4VlFoN6LZvvuMl
X-Received: by 2002:ac8:5716:0:b0:4a1:479e:8f0a with SMTP id d75a77b69052e-4a1479e8f32mr117934251cf.1.1748358694467;
        Tue, 27 May 2025 08:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748358694; cv=none;
        d=google.com; s=arc-20240605;
        b=aDe+2Ug3zkUtsYwPn/ttblS3qe+PCMb2Y6lrxDSZ6xE8+xSvtyfXEK6FLRs7J/pC+W
         PXgZsnVWW73mtocZMGnb72+5M46bgnrSjdy8EA7J+VO3Sn7KQqnSl+/bpnA6w0HY9oK6
         CDaQ/yvyC9ovO0KLvrJLSaly7e1jXAfT9vI+6LuhP7CudbzA5gSz8kYKy2nZsW3t3OYy
         Sad4CenpcFAQyPR+ZD6iFXicGUqRqmK+S2h9Q+dtWgZs8ZE+ctBRCpUMEE58VRstUp8R
         vaacrsur8p8fWDuhaRcCk84WaTIH2W884ra71JkvjUcqJgcmjbOlWgaIQL6Rup9geXCQ
         ENZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=3sNGWd+VHncxTjaN1bnDQMjw95tKvwRYm31+HLIC/bU=;
        fh=Cs/dzet++lX7mmPi5SAz/5gH2khMLk7EVIH6FkmdedA=;
        b=YizKC5k5GRGCIDGTnZNwusc4a0YkfihqaGU3SbXCyvqq+HmMcGsmoP4CrXA60PCUuA
         OWR3/vv6FylS+RGQxq+DUAwxUOws3sdTh+/3+EHeYqtU93NrC+lu7wUl8nJdAk9eg7Np
         lHOXwHPpYzo2srnXTp7+xMqex2+fgJY9bjeY/BZYGg8kzh/gRZjtbgbFmU1FkmJ5h0yv
         fZ0CaV5/3JKkINPiS9hPOGpV7OQVjp5pP7LJuS6uuFq+j5YNS+M3XdpFpNiQ6GE3gImn
         7tDoJ1Pplzoo/nw/hLjx5jzmW/zGEXW0Lgii15ZFmdmsGpuuuW08d+jmzUCcNZsZ2knh
         r6Ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EiS1rdGW;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494b003d1bfsi256986031cf.294.2025.05.27.08.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:11:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EiS1rdGW;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748358694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3sNGWd+VHncxTjaN1bnDQMjw95tKvwRYm31+HLIC/bU=;
	b=EiS1rdGWo38WV9NqoOjSrKh+U0XLJaFR0JH2T2w/3BIKk7GM96AxR1LVWDHklD5SzzDJYT
	8VntnQaXcV67i1uTXA2wQuNp78GxmTl7Zi6BdMVtlWGXBHEnHL14gBqlUFZX4sKVVfD7zl
	jEY1GwvW8U2LKt0oQb8q2ynAn0jIUtQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-pKYveio5NdmNONLVDkrj1w-1; Tue, 27 May 2025 11:11:32 -0400
X-MC-Unique: pKYveio5NdmNONLVDkrj1w-1
X-Mimecast-MFC-AGG-ID: pKYveio5NdmNONLVDkrj1w_1748358692
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4d6d22b1aso1535791f8f.0
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 08:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358691; x=1748963491;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sNGWd+VHncxTjaN1bnDQMjw95tKvwRYm31+HLIC/bU=;
        b=fvv/saeHQbxSlUuZjabVH7Xa/iKwQEz5iDs66zfv0ggzKoriuyhBukcpf7iY/jxoOY
         r8uFbUpQud9RUjE0lKEPR6qWLNGid8I3prPLQko3oxWxQxQAetPz4f6RUeBlWEd9LG8I
         E7+xNd4iq4/uw52wLBVnTDI7Wvaw7JCvhhjGuclf2b/fqTT895HGTsEGJEDDtniFnowL
         EMlawHyAmzL09yRHTiZ91Le3oKQUYa8zeQai4zrJVqExA0D9rIE9hBxQK46Wm4in4wyW
         iqJ/WBxNKgn8/ljwrXeRvRC7cC1u24DS6zmAyUN8lVsLKq9Iu9zp77WNpR5QZP3aqJpc
         wXiw==
X-Forwarded-Encrypted: i=1; AJvYcCVmFw+rFi47sFnA86JUbH++qr/Hx2oVGOcbBfXiCYxcQZb96Q25xm42YwQdR74ZILltl7JFU6QUDxO1HQ==@linaro.org
X-Gm-Message-State: AOJu0YzYJ4quJEVeaBIqP+T2ZGBHUxVTM851QxdntD1zojJfQ+dTFrWQ
	yvzuesD+w/6qBErp17ksqoxQ3FJidFeY85kh09MQp7ApiPBpuOCquFpx8ej/alP1tHSEZ65tXvB
	K/fNxVRalDk79ocKOHkkM61PPePkuRfqyhz3VKdT0iWhxvoPbdpl8vhlnbGIIkyHu/IlH
X-Gm-Gg: ASbGncsuEob0Glj++cBmu46aUNecvtIbfQ7ppgp/8fjMKf9NicTkv8XfXAXCMo5KTCb
	itHuBSygC3EsmUwLzzD7wgGee3MFpDvyd/blsjpusNNQrRL0OFsl5ZcCF7lXdhHYQDyLzI+SsFq
	OyIjM1LIwGTwECtzw513PTqXhJVMqYeJOctW98aVF7AmucD/drz6/d+t2yub+fs+a3AXZ7nqqvB
	oIvyy7+dWSqz4HISLpJmcTvb6nvTBvKyzLw22x6bjSGUWaT8+06nEAC1FwxLiMMWwBPDpXNXPTR
	E7f31Z2qXINqdhOOXh6pdH0RTVyuSIsvJr3jiYV+
X-Received: by 2002:a05:6000:40da:b0:3a3:685b:118 with SMTP id ffacd0b85a97d-3a4cb46302fmr10550245f8f.24.1748358691584;
        Tue, 27 May 2025 08:11:31 -0700 (PDT)
X-Received: by 2002:a05:6000:40da:b0:3a3:685b:118 with SMTP id ffacd0b85a97d-3a4cb46302fmr10550208f8f.24.1748358691179;
        Tue, 27 May 2025 08:11:31 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-50-26.web.vodafone.de. [109.42.50.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cfcece9dsm9676491f8f.5.2025.05.27.08.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 08:11:30 -0700 (PDT)
Message-ID: <33015b21-bd6b-473f-8066-1df6c0c731aa@redhat.com>
Date: Tue, 27 May 2025 17:11:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/functional/test_aarch64_hotplug_pci: Update SHA
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 eric.auger@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20250527150229.1617074-1-gustavo.romero@linaro.org>
 <20250527150229.1617074-2-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250527150229.1617074-2-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: loh1O_z5nBqUA-VVpN9rd5yzUrj3O5CJQ1rqx5_KPpk_1748358692
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 91Lz8q31ppbd

On 27/05/2025 17.02, Gustavo Romero wrote:
> Update SHA for 'linux' and 'initrd.gz' images.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   tests/functional/test_aarch64_hotplug_pci.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
> index fa1bb62c8f..bb2c121503 100755
> --- a/tests/functional/test_aarch64_hotplug_pci.py
> +++ b/tests/functional/test_aarch64_hotplug_pci.py
> @@ -20,12 +20,12 @@ class HotplugPCI(LinuxKernelTest):
>       ASSET_KERNEL = Asset(
>           ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
>            'current/images/netboot/debian-installer/arm64/linux'),
> -        '3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca3117b2')
> +         'd92a60392ce1e379ca198a1a820899f8f0d39a62d047c41ab79492f81541a9d9')
>   
>       ASSET_INITRD = Asset(
>           ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
>            'current/images/netboot/debian-installer/arm64/initrd.gz'),
> -        '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b4')
> +        '9f817f76951f3237bca8216bee35267bfb826815687f4b2fcdd5e6c2a917790c')

If the images reside in a subfolder of a folder called "current" there, and 
are changed in the course of time, that's a good indication that we should 
use different location for the test images instead, otherwise we'll continue 
to play SHA-updating-whack-a-mole forever here.

Could you please try whether it works with the images from the "20230607" or 
the "20230607+deb12u11" folder, too, instead? (see 
https://ftp.debian.org/debian/dists/stable/main/installer-arm64/ ).

  Thanks,
   Thomas
