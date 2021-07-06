Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2041869lfk;
        Tue, 6 Jul 2021 04:04:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI8M/yMqHd0l1BvfW0+NypDRrQpFuBjVYJKtHznMZvaPoGt8sM2BzYFPDG00BO4vDQ7sdD
X-Received: by 2002:a05:6402:c18:: with SMTP id co24mr17138883edb.307.1625569481931;
        Tue, 06 Jul 2021 04:04:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625569481; cv=none;
        d=google.com; s=arc-20160816;
        b=tSrIIirL7I9YXgydePX4lVRievJ+stfmEQf75fobjIf8DGg5maBnIvaiZ5J6JZfn2e
         oObGgy6U4TjgCNhGBRy54+dI5ThYKwni9LoGmp7MNh0+f/2gS9LxvKugG6T17SMlGIap
         gmJFbouKaL56yQ3wBVPukb2eW5y1zb/RmxW39UIXsyWYTd/8IlwRiKe3x/LHB+LGqU0y
         SlSQlncCvv+oeJlnx2HNCYKruzo9a8H0mT1/xrAc+SXFjEApdWbv1h5MSuFDf8KYy3cb
         NoljaGn/9kF4yPhLLvPjhruDBe2OUT+qEDv85hlr21K/qvJpQommxdBKYvaoZzPK8DIf
         SJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:from:references:cc:to
         :dkim-signature;
        bh=r7AbVnA5e9vYP2819AcRFl5Chq8Aly/fAP0a660hw+o=;
        b=e18xy5R/c5txDAkoEmb3l4fgi8v1vPSN46NQBzYWloCKkiy0bKWOKQidEMLGFhINHH
         +CsE4gneWoSqYxXwAMhicO8bozp36IzA7y7AthnLmvisKbGk9u8DrqaoY9GTh8K0IB14
         qayZhEZIhQprfzE6GyAWeb4Q0Pt5kI0NDI56GB0wRzDJGZlAzzf1Rg/QN4oxq2l3/MUC
         wgpwpU5VEKCq6VdHNMJSXSia3XTqLtWnJIIGv8+G8e8iQoNnnbcmtT/Q/CX62zG42kD0
         P7G7R1C+dXLow2WfFZf+8KFGuuJsAkC4CgAkBSHeBqXJYg0PltIQAFTl6w2KQSFN0l/S
         r0HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q5sm1xvy;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id eb10si14334730ejc.41.2021.07.06.04.04.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jul 2021 04:04:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q5sm1xvy;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625569480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7AbVnA5e9vYP2819AcRFl5Chq8Aly/fAP0a660hw+o=;
	b=Q5sm1xvySperIhDQdk7F/yP3qs85uFzTF6gKK68XZ+g0ckzW3PjvwABU67f2NHOTJdjNDT
	N2fqLOiLQg4aZonmw9PqvxQwyZTg0nNlsFrF/wbWw0Fx+VfUU5l7qPVqwy5JVY+FeY9r97
	K6+gtNIfERv4kqA+xfzvyoXpP+5ENhE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-wmo1KuN7O2-YCX9sXg-ZIA-1; Tue, 06 Jul 2021 07:04:37 -0400
X-MC-Unique: wmo1KuN7O2-YCX9sXg-ZIA-1
Received: by mail-wm1-f72.google.com with SMTP id f16-20020a1c6a100000b0290210c73f067aso426119wmc.6
        for <alex.bennee@linaro.org>; Tue, 06 Jul 2021 04:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r7AbVnA5e9vYP2819AcRFl5Chq8Aly/fAP0a660hw+o=;
        b=VpaeyVJdPiAFFcJlm2hApLq/pY1DpsGTF5y7zGWhRru7Vn4ChBc70+oKIvM70obRBn
         PUD1VV/brqrwAN+B93mOVgG0b4UDhXssqc2FXkIg45WlmZvM4TwFRk9fl3xUdPDXo520
         vaevk4S8tyFpxxrE0gC/wNfCGmaymb//yLK4mIbEPnRwqnbOUoPDn++XKLZIlDPbYucu
         N8YRKDIjvAMbI3rSLuzaRoLjh+QZih0aRcfGrvG0fTLOWa+i1Wq5TOl6fh5dER1I+qEw
         P/7e/u34EpA9YfPzFDuncdh5vc6tFw3g78pR1GcFrTvuGzc13eje4iaS31zLc9Jibdvs
         uRCg==
X-Gm-Message-State: AOAM5333uDkOHzmeIb+S3A6ybm9FEVMJgG674eFQu1ghoskEVig3084w
	C4r9D6pkTL9KdFLfSVlSz65SUGvWAZZKxqfh8WoxYVG8LT19F79oaJj8zlvY2LjZRQmqUx6uJgH
	dtvbXgGQB0YsBlwqd
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr4160487wmk.124.1625569476450;
        Tue, 06 Jul 2021 04:04:36 -0700 (PDT)
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr4160463wmk.124.1625569476259;
        Tue, 06 Jul 2021 04:04:36 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9575e24.dip0.t-ipconnect.de. [217.87.94.36])
        by smtp.gmail.com with ESMTPSA id n5sm7679401wri.31.2021.07.06.04.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 04:04:35 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 3/5] hw/arm: move CONFIG_V7M out of default-devices
Message-ID: <7dbd2f9f-9c00-1771-1b5b-4992fc0930cf@redhat.com>
Date: Tue, 6 Jul 2021 13:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621152120.4465-4-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: pqkyqxcPFn1j

On 21/06/2021 17.21, Alex Bennée wrote:
> We currently select CONFIG_V7M for a bunch of our m-profile devices.
> The last sticking point is translate.c which cannot be compiled
> without expecting v7m support. Express this dependency in Kconfig
> rather than in default devices as a stepping stone to a fully
> configurable translate.c.
> 
> While we are at it we also need to select ARM_COMPATIBLE_SEMIHOSTING
> as that is implied for M profile machines.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> vconfigs
>    - cherry pick from re-factor
>    - minor tweak to subject line
> ---
>   default-configs/devices/arm-softmmu.mak | 3 ---
>   hw/arm/Kconfig                          | 3 +++
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 0500156a0c..4114aa9e35 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -1,8 +1,5 @@
>   # Default configuration for arm-softmmu
>   
> -# TODO: ARM_V7M is currently always required - make this more flexible!
> -CONFIG_ARM_V7M=y
> -
>   # CONFIG_PCI_DEVICES=n
>   # CONFIG_TEST_DEVICES=n
>   
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 528f71bb9d..062fe94b64 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -296,7 +296,10 @@ config ZYNQ
>   
>   config ARM_V7M
>       bool
> +    # currently v7M must be included in a TCG build due to translate.c
> +    default y if TCG && (ARM || AARCH64)
>       select PTIMER
> +    select ARM_COMPATIBLE_SEMIHOSTING

Reviewed-by: Thomas Huth <thuth@redhat.com>
