Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp1006773njg;
        Wed, 26 Feb 2025 08:07:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjU5V4bdg+hTuqdWa/CW16o1X0SNJeXfIX/uiuSMWG0CxQcmYBiwAJSPMrKpGdWXv1po1D
X-Received: by 2002:a17:906:6a13:b0:ab7:d66f:c86d with SMTP id a640c23a62f3a-abeeee5cb23mr564013266b.34.1740586071485;
        Wed, 26 Feb 2025 08:07:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740586071; cv=none;
        d=google.com; s=arc-20240605;
        b=BBDcSa7cFLCaOSSdC0AhQJpPuGup9Adtg56ZLGXJio7+q6PlGh0i+aaP2NOtu6zDic
         y+G/7hLgzS7tB/bHN5tGn4PmSacFr0gQHrW4y7oRsio/q0JbuN/fh6EM3RZBrphGiBkF
         5s5ZwVatNIyvKOtzTPUz/Ri9ZnEr3jkIkOWGsfQ0Pn3+Io+dWkT61yJD5ny/tiq0bgUZ
         o1N1gQJOxYy/btue2Co6whw4lAsm4xC4uHKxdLFWwq8452SXQzgRcdPG1RYA8l0mZeW/
         w4w2XB0SsMm0RjjSNMzUtDj07x5gjP24W/MK+67ilS9/4PxXt5VDcDln2xIRMxiE6wJ3
         Xf4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=3wg6ZOCd43MRSnPl1PnnELQdbYFw1kzSUG4St9Z3JEA=;
        fh=y0cQKj8/08TrnNh0z5pGGMyMTD2FDYzEBQaunNWHxik=;
        b=QuJyN4f3X5yRP08rHQLofA+f8PDoz8A5YJxA53GfxMf/24b1zJKJdNswV4VUWfeVpT
         A2jtKLUeeGuUB2lhE2++MvsXF5HeSv+XerN0d59tyNlRGNT81JGZLA1jbjF3GlxKm4kP
         NXPfMckQgn8U2XF5cXFypZy47j8Rg5ILJoom73HNsaVOccNeazDR1rPXYgDLLf5raBr8
         aHiAS9D74ogdfgnH4g4rMpqeh1V3UqXl3+wW7ANUwVzn5XOTQlrITqAsP/7VcVAYRhIv
         cjb+dk0rYPX7HC1vMTNoJn2QjMJle68phpFR0yoSeDq9WGonl7IqjdfsEs23QlKAAKDz
         ig9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MHuavBx4;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a640c23a62f3a-abed20d9e84si383394066b.825.2025.02.26.08.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:07:51 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MHuavBx4;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740586070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3wg6ZOCd43MRSnPl1PnnELQdbYFw1kzSUG4St9Z3JEA=;
	b=MHuavBx4FUDxoDK9OgrfM79/oMTcgSw6pYQ6x8/VeIDaSJt9DsrSnKGemQdaQ7RGe0cb59
	nQ3n9RKJBnf67dUqmkbf4/0p+/TYbtjkYvXRCZRykCAi46Bh+as3TTTBzWo8e3khfv2w+2
	tgzbAXplUYaM4CN6ftnE7MT5GC/KJJk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-i-3B3VybPv6xapBTuZIp2A-1; Wed, 26 Feb 2025 11:07:49 -0500
X-MC-Unique: i-3B3VybPv6xapBTuZIp2A-1
X-Mimecast-MFC-AGG-ID: i-3B3VybPv6xapBTuZIp2A_1740586065
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38f4bf0d5faso3655031f8f.0
        for <alex.bennee@linaro.org>; Wed, 26 Feb 2025 08:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586065; x=1741190865;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wg6ZOCd43MRSnPl1PnnELQdbYFw1kzSUG4St9Z3JEA=;
        b=rlwXF9A867PW8nSfJCj9oI2QKcXLrWg43GXt02LNo3ZztKg98CIIVDjgTLQbeWUWsL
         0+eh02P+IYxnuuNR3WR9BNGK1xRm8LWQUpVHYYD72JTs+3hxKwElkr08nD4+k/7PiRUI
         TJ0zC/k+oOTSKldPrSO/cEPBhg0CXIOuik3C4BWuyf7bY5Y4eOshMBgsKdTLnIXvSw6i
         6jIX4kw3gDNX0WvK8xPVSFiWbQRvgInj73NBhNGbErRfbF5tk4NQLcPm8hrveF/NnGHc
         yXkzGqaPwK4j4nK+XEccV4+zTMygtctszjqgvcn/aM101WKv19H12xh9FBVeqpKz9oPW
         vpXQ==
X-Gm-Message-State: AOJu0YxcxQUL+9QrPiLVF6TaQqONn3N46rBAe0q2aS4xyFe6ZR+3uRx+
	MrJuouB6lpDgocNprZ4jzwR3kd4OsUtI5ThvV+p49s86icxX9+CumbZKyE3YLmdpXLNjtmI8cKY
	rQteQJhYVpFYRcg+EhteLDCbeGw6mQqMhdy3Px0+7mP6FbROaCvGVyhsWNEloXht8M9pbKbCHyD
	QKMsn8opZwD71pheQxMMeOWGFefCTVlgLNAg==
X-Gm-Gg: ASbGnctBnQ1yYc57R95X0bmHAIXNWXhGrC8LD3zA/iUFo57HTcIwgbL/PbuZwDvx/Z5
	oSNn5JaT7EXLCpd3sRJpUaRlgXZB7ncOnrF+EabPZZ/eFZ4hTAj6HM2bEzDLU7rUHSpcztylZEV
	IXmQskzkP2V/YO6owah+z65O1KO48jMHhiV25bsJEo+QUVwt7ZwZjuu92YhY7tAEkFu0AUCTW0j
	lt5eMdBwAe9ygMy/0k6aa/IieWQFQLUgicoOifbQoYAfcwvcAzFPHtZZoSkXzozZbDH3RBqUBE1
	/TJ0q5MxD8tARenJDt8G/sSnz3SyYlPxVS1LA3aQ55C7tuI=
X-Received: by 2002:a05:6000:1103:b0:38f:3d74:9af with SMTP id ffacd0b85a97d-390d4f9bfcbmr2751484f8f.45.1740586065074;
        Wed, 26 Feb 2025 08:07:45 -0800 (PST)
X-Received: by 2002:a05:6000:1103:b0:38f:3d74:9af with SMTP id ffacd0b85a97d-390d4f9bfcbmr2751436f8f.45.1740586064575;
        Wed, 26 Feb 2025 08:07:44 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-245.web.vodafone.de. [109.42.49.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390db1aa6c8sm2062307f8f.72.2025.02.26.08.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 08:07:44 -0800 (PST)
Message-ID: <13ffd935-9b26-4a43-8009-834220b709a1@redhat.com>
Date: Wed, 26 Feb 2025 17:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/25] tests/functional: skip vulkan tests with nVidia
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
 Ed Maste <emaste@freebsd.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20250226140343.3907080-1-alex.bennee@linaro.org>
 <20250226140343.3907080-9-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250226140343.3907080-9-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7Jcid7vVytcHBXHwfL67-MQRkeokxCPjslRNd6cGFdg_1740586065
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ct5TlnkL76Pt

On 26/02/2025 15.03, Alex Bennée wrote:
> While running the new GPU tests it was noted that the proprietary
> nVidia driver barfed when run under the sanitiser:
> 
>    2025-02-20 11:13:08,226: [11:13:07.782] Output 'headless' attempts
>    EOTF mode SDR and colorimetry mode default.
>    2025-02-20 11:13:08,227: [11:13:07.784] Output 'headless' using color
>    profile: stock sRGB color profile
> 
>    and that's the last thing it outputs.
> 
>    The sanitizer reports that when the framework sends the SIGTERM
>    because of the timeout we get a write to a NULL pointer (but
>    interesting not this time in an atexit callback):
> 
>    UndefinedBehaviorSanitizer:DEADLYSIGNAL
>    ==471863==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address
>    0x000000000000 (pc 0x7a18ceaafe80 bp 0x000000000000 sp 0x7ffe8e3ff6d0
>    T471863)
>    ==471863==The signal is caused by a WRITE memory access.
>    ==471863==Hint: address points to the zero page.
>        #0 0x7a18ceaafe80
>    (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x16afe80)
>    (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>        #1 0x7a18ce9e72c0
>    (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15e72c0)
>    (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>        #2 0x7a18ce9f11bb
>    (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x15f11bb)
>    (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>        #3 0x7a18ce6dc9d1
>    (/lib/x86_64-linux-gnu/libnvidia-eglcore.so.535.183.01+0x12dc9d1)
>    (BuildId: 24b0d0b90369112e3de888a93eb8d7e00304a6db)
>        #4 0x7a18e7d15326 in vrend_renderer_create_fence
>    /usr/src/virglrenderer-1.0.0-1ubuntu2/obj-x86_64-linux-gnu/../src/vrend_renderer.c:10883:26
>        #5 0x55bfb6621871 in virtio_gpu_virgl_process_cmd
> 
> The #dri-devel channel confirmed:
> 
>    <digetx> stsquad: nv driver is known to not work with venus, don't use
>        it for testing
> 
> So lets skip running the test to avoid known failures.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> ---
> v2
>    - implement block at the test level
> ---
>   tests/functional/test_aarch64_virt_gpu.py | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_virt_gpu.py b/tests/functional/test_aarch64_virt_gpu.py
> index 7a8471d1ca..a4ae5777e6 100755
> --- a/tests/functional/test_aarch64_virt_gpu.py
> +++ b/tests/functional/test_aarch64_virt_gpu.py
> @@ -9,8 +9,6 @@
>   #
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   
> -import logging

That hunk should likely be squashed into patch 1 instead?

With that change:
Reviewed-by: Thomas Huth <thuth@redhat.com>
