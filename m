Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1525312ejc;
        Mon, 13 Nov 2023 10:13:26 -0800 (PST)
X-Received: by 2002:a05:6870:5b8b:b0:1ea:50ec:7087 with SMTP id em11-20020a0568705b8b00b001ea50ec7087mr10082523oab.26.1699899206027;
        Mon, 13 Nov 2023 10:13:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699899206; cv=none;
        d=google.com; s=arc-20160816;
        b=sGIbEXG+pF5Th5Hy/7mPAcBYzjXPs27xHVdxrHBCnxwGZEZOrbchN/Oz/dSReaejjc
         VNbrNLPOFlapM2bnP2M5CgAfdh2S+XLn8AuLX5cyHRp4ufdFcBtXXt4UPKCt0ErFmNro
         y4mTJXPSpXNHy1bu8hEXMwqN17mv6aheUyhO/8TzhofW944AcVm8C3MvPkbI9SGz9Nke
         rD/SIvb6p1rLYw1zwTWEoxD10wXq+iJ50cA8ZIE5xg4KaO1HEykiTicId7KHzh5zYn3L
         hOND8r6ewllj4TJMM0Bkty9lI6wFiSe8WtODT8kCrFOg4Vr/l/HSOAohfsEMObbIzshe
         BhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=47qdXCf7H17vKwnfJuoR9ApbQrhsQSNwWFz2iDtLcKY=;
        fh=/HDtWhJRbZPXKcPREch8nioyMDEMWS18rKZDF/D8Jac=;
        b=FHBUyILUcCxa1+GJtpOiNZkO6/zVcCF9KI7gzPfMWPiVpHlakp//eRKxtx5whXs8JR
         WkKBiDNnYyc5q/aULgJbwCXu8Kvwd1y8yNTdsr4QjkztrjyPe0HcerR0NlHH5gpM6FUH
         gGSokHPrYqq/46E8ablYd6Kp3k92fGA8xZ0dOc25468N3mDjuxmRJGfLucO7xMesUdeH
         zsL1TO+9ZMQ88LZ7wDYjGl5APniJ9ZQMWF0oRkhHDx5b/84Sa08QV1VvYv/IJ+Ufxmyb
         Jlcn2OcCccqfHWSUZBTXqOl3DDX0Igxh7zO8M+pN+QfUDs/XqUF2TcjKfKksWf8QsXRJ
         RWnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uZIgf3Lz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ds43-20020a0568705b2b00b001e5c2b6177csor1875347oab.14.2023.11.13.10.13.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 10:13:26 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uZIgf3Lz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899205; x=1700504005; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47qdXCf7H17vKwnfJuoR9ApbQrhsQSNwWFz2iDtLcKY=;
        b=uZIgf3LzIVHIXa1n9KaDQlB38T2vF0cBonMX9fHJ3LH4NRon3gu/bbf5UgCPodHORj
         nfDnjHYKRJYFG0JhiFHIiJCikmv1qR8mmcPs3Sc0tyCd6mHn7KlFtxgSjr1b0pH4OCKY
         DlbC7TRxAYkPe0Jc+cy8ZbCnKeQR3Zooj5FGS2INY5sJ9n5byRay1V702UKIFA8KcKeW
         oVKcMNTRqSyP+403Dj4v1VUNhgj+MI8vzJWogKaNuXtteN9InAmzVP7hy1ANiSQ7XUxw
         +O7U1Icx443mOI9PlFVQxrpf6mmC54qjuI4JYil9gSl5dMvgTcUMO2/MIVe0m56uO09C
         ReJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899205; x=1700504005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47qdXCf7H17vKwnfJuoR9ApbQrhsQSNwWFz2iDtLcKY=;
        b=MebO77aY+LXidbo1+YR84nQsXQov3u9XCmQ8y6EPyx9FlN9TzFJj3tV77g9jq2BV+W
         5sThae+3htLsZWQII0yvRMsbcV9PJqvdGdbWDezkXFSQzt0wNRtlnidL/bcUX3RohSyW
         20L87UpS8b2rfGiaGAdShokCRpooji1jAJpg0+f8PttVIsPe3CkZFLXwBhdMoIiyTiYI
         SJv+sABD/nOQEwf4oJ+FYfk8DTDMnysNMbaVlW4b7hhznUgpHtAmpScE/jXC0SKPzZnd
         ETR/66dCiVxet5/3Kfy/Ixv5QWiN2hmzqkqJDV47RY/dFujijcWlk0d9wJHBmnyPbCmW
         zxfQ==
X-Gm-Message-State: AOJu0YxxE2crw0GgAMiGUquwL2zP6yivUxr7nwn9kqS4b1qzUTJVLzOe
	mG6WgShm6xUOq9nacuatI3DNP1Wo
X-Google-Smtp-Source: AGHT+IEMW24hoP1qxVuHtBZTWwzdY1wJIRvBdCxR4pcag8Dcp4IYaLDv8RiEja604eSuwTfs9vPIQA==
X-Received: by 2002:a05:6870:e40b:b0:1ef:f127:34fa with SMTP id n11-20020a056870e40b00b001eff12734famr8873450oag.57.1699899205660;
        Mon, 13 Nov 2023 10:13:25 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id it13-20020a056a00458d00b006b58af8aae3sm4092255pfb.77.2023.11.13.10.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:13:25 -0800 (PST)
Message-ID: <b7d29ae2-2064-4e4d-8fd7-1a75af4cb4ad@linaro.org>
Date: Mon, 13 Nov 2023 10:13:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 03/10] hw/xen: Merge 'hw/xen/arch_hvm.h' in
 'hw/xen/xen-hvm-common.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: x6PQzjy7JpTh

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> We don't need a target-specific header for common target-specific
> prototypes. Declare xen_arch_handle_ioreq() and xen_arch_set_memory()
> in "hw/xen/xen-hvm-common.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/xen_arch_hvm.h   |  9 ---------
>   include/hw/i386/xen_arch_hvm.h  | 11 -----------
>   include/hw/xen/arch_hvm.h       |  5 -----
>   include/hw/xen/xen-hvm-common.h |  6 ++++++
>   hw/arm/xen_arm.c                |  1 -
>   hw/i386/xen/xen-hvm.c           |  1 -
>   hw/xen/xen-hvm-common.c         |  1 -
>   7 files changed, 6 insertions(+), 28 deletions(-)
>   delete mode 100644 include/hw/arm/xen_arch_hvm.h
>   delete mode 100644 include/hw/i386/xen_arch_hvm.h
>   delete mode 100644 include/hw/xen/arch_hvm.h
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
