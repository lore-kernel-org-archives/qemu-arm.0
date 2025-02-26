Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp1013025njg;
        Wed, 26 Feb 2025 08:16:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIrom98XSC1mrRGKX0TpmVwRZ75IwRqg24m5H81MEFBsMiVgUNUw8p/2V6UudLhj+2x311
X-Received: by 2002:a05:6122:553:b0:51b:8949:c9a8 with SMTP id 71dfb90a1353d-521efcf42a8mr11687414e0c.9.1740586590951;
        Wed, 26 Feb 2025 08:16:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740586590; cv=none;
        d=google.com; s=arc-20240605;
        b=JMql2WSJ042c/GB6G7q0XdVzzhz7uing0C5BgZpbTpu6inY7p1olicdCIw+VsFWhov
         ArKqU6m0CZr2IeuylG4r7L+jChwg8gsoy9jKnZjSirVddVjxS80ZgOFSDJo4mbqHnF8w
         IWtEZ6OoQkf3DLYbvXCaTEbsGkkI7qLIecZhd917GbLUYC9i3FLDfpZ6EhUeCk0Aek36
         3p4k2aKQPvg52pQGHrzYrBBB8M7Z4Z4JsjmaplVyLL48BeuXUDwgNBH1majY5/BiHwJ/
         nZAh3z6lvvIuPlCy2dp8vvukqB5XgDYrdw5LbsHkdYCPEa8UwsJFk4sG8Z4DkgQOIV7G
         fcOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=l6gjpLgXd86w5xvclAudwiAf93UtrJHiBjBNk3e8eA4=;
        fh=kMuyKEDVLpXx+n9GsiCpA1spgm27ONyskfB4MRxywKY=;
        b=EuPZEO+m/RO1blr2S5VrZdSqlqOAqSe2ljSpYnurVjSqEfvoon1kofitlCh1FrqqVJ
         CNPrR2BR1EavwsBIATSiMzgjIlgznSmd3NjzatANlgy3GXuHJlqsbTvKio8xknkMsCjN
         Ep8WA0pV4uylBHoS1m9sbK94nQyS9tqO8vmkn77VYrpa06vWwjSvRteltva8FfRWtfOD
         RgvyqFEAZ2WizLfkCU3HGVWG5UfLl8IA9F2D/17Dgqv6WORZv6sDGR73HZfE9W7I9/es
         WDocdhqwx1bw0c5748OPUhfkNoBCeeCOur+ZB9LMH0wHnQvoZzDkzppuAeE40HTYCjVV
         eZZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z9oiVsyM;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5223e077020si749580e0c.84.2025.02.26.08.16.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:16:30 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z9oiVsyM;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740586590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=l6gjpLgXd86w5xvclAudwiAf93UtrJHiBjBNk3e8eA4=;
	b=Z9oiVsyMb4VdXCWCxJRMDrvRU9ReavkA/7FijgFpRvrOwsEkEDCgqQYwKmqo9IrsCxShZq
	5kD3tmXiVv9tEJBBgHG4P5wo22pNbYmZczXWv6ePgmmhIbiuftqQA+RPu8QSHNKCVMc8/z
	3FFMsM4DjrJgVmaBhG8mCLcdeXQbp+w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-S1XGGzlTPvSit7WQtlV1rA-1; Wed, 26 Feb 2025 11:16:27 -0500
X-MC-Unique: S1XGGzlTPvSit7WQtlV1rA-1
X-Mimecast-MFC-AGG-ID: S1XGGzlTPvSit7WQtlV1rA_1740586586
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4399a5afc95so29975025e9.3
        for <alex.bennee@linaro.org>; Wed, 26 Feb 2025 08:16:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586586; x=1741191386;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6gjpLgXd86w5xvclAudwiAf93UtrJHiBjBNk3e8eA4=;
        b=NSAya11fVlOdZJMgiW60vqoqMjbq0Nw3Y/NJ8+DERdX+/rxzl/IAzIsd9/lKcoc/8t
         qgLIJvE6kEzztbTE7uT2h8ynkHkngcoGgnvjlxvQ9qrS2AHl9tsef8XS32UnADZ4hTpQ
         XUwTBTsAdbBqzliWbidJzvZyntaxWdvj/inWRhwznqXZjYK5Re8bAW/1Qd+IyIGQ4Ige
         w+WZ+LFSh3ngLYNwl8IsBU/c+Izp249gdGv3G000XC9n14NqU3Qe3zLM23AXf1BkpkD5
         it0TwKVgGqUTmH3dtaMXrbLE+95V3bCX7v2m72xblTLiINvwEsTnIwPGpMNJLbz8Ex6T
         kpbw==
X-Gm-Message-State: AOJu0Yw1sBjBrCd21qCiHf+NgqvokpYTRV9ECWLkYnMd6wiXu68HzBL2
	/SCD64cSJaog3jVu+HC0PkgyrfnnPbuxjv92S+AZTXjP1cK3PvM4bRSYAIJW/JwHBbPQ3PUzc0h
	3GmpGIyzRfrjRoX0rW2n6bn0T02b/p0m6V250xeTQa4aNZc/CQBI8mHI14OtVxPyC0sTPXD23zc
	0vEp3asv/sVl0QPGm+XV0VMkpJ39CuPT1UZg==
X-Gm-Gg: ASbGncvsMrUYlT1avdKrkLxcYlFRspL5K+KYD568rlyDMV5e8vAW1a/5Uc0bPrkiOyk
	Gm/mJiOJHlDoEGUxLdsrmU8Trjo/8520vbsrm8PdhZdk7Ag+P6jf3wZMxGngnW1+m8S1C56NYzk
	RCacS/wMQ+LwTbMniQbI+8ucVKmFg8KxWPhuXohsWV0KG0fO1u6uKGXUhdBLDw66egFzXb++c3H
	DTlTbR20QPfE3E3XsDurMjB25YsHd3Mr8RIC4dTx2mQX1mRTTi+F8LqwrgJ1K7y4UpV/YfoBf8/
	jcaEBJ0uAFLS6tuZTid0CYPofms1H4YP/GiDvI0C6IvH7+s=
X-Received: by 2002:a05:600c:4ed1:b0:439:a155:549d with SMTP id 5b1f17b1804b1-439ae1eacfdmr192847225e9.12.1740586586198;
        Wed, 26 Feb 2025 08:16:26 -0800 (PST)
X-Received: by 2002:a05:600c:4ed1:b0:439:a155:549d with SMTP id 5b1f17b1804b1-439ae1eacfdmr192846735e9.12.1740586585681;
        Wed, 26 Feb 2025 08:16:25 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-245.web.vodafone.de. [109.42.49.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7108sm6207968f8f.69.2025.02.26.08.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 08:16:25 -0800 (PST)
Message-ID: <629561b3-56c7-4daf-b40e-ace2267d72ac@redhat.com>
Date: Wed, 26 Feb 2025 17:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/25] tests/tcg: mark test-vma as a linux-only test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Riku Voipio <riku.voipio@iki.fi>, Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
 <20250226140343.3907080-12-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250226140343.3907080-12-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JLXrm5Ad1PjhTzLRk5lbYh4MFdbuAG4uTIxmOcC96n0_1740586586
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NnbsBTYakQju

On 26/02/2025 15.03, Alex Bennée wrote:
> The main multiarch tests should compile for any POSIX system, however
> test-vma's usage of MAP_NORESERVE makes it a linux-only test. Simply
> moving the source file is enough for the build logic to skip on BSD's.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/{ => linux}/test-vma.c | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename tests/tcg/multiarch/{ => linux}/test-vma.c (100%)
> 
> diff --git a/tests/tcg/multiarch/test-vma.c b/tests/tcg/multiarch/linux/test-vma.c
> similarity index 100%
> rename from tests/tcg/multiarch/test-vma.c
> rename to tests/tcg/multiarch/linux/test-vma.c

Reviewed-by: Thomas Huth <thuth@redhat.com>
