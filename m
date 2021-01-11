Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2782023lfq;
        Mon, 11 Jan 2021 07:46:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfEn+JTb1JXn5Nax5jcZ3qRGUR1o2aKPg3lWA8PEnH7W3psNjl2u5OEj/vqMk/fGq5ZZFU
X-Received: by 2002:a25:1d43:: with SMTP id d64mr495903ybd.380.1610379976669;
        Mon, 11 Jan 2021 07:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610379976; cv=none;
        d=google.com; s=arc-20160816;
        b=jLDQlbeB5h8dCF5ZjxU3mwBpupXAza9pcD0yEmzFE327Ug5e5loHbbX0eC9gmtB5io
         xBh814Qqdz7IFf5x7Ip6Xxa87ypUNz8Cjd4N9IcqPBTd8PekDF2jatzQBq3M+EckIFHN
         VqC8clpgUEJ/NQt2+HkmZzQP5fYc/2jXdSdIw0bJckl2VauyBgFP/2FyE/uToq1faQMT
         /yrC0mTH6b0oOq7VPhrZcX9gZV5/Si60evfNWcKFYaOWk12dn9LAzzFost4q6QrhQrHs
         eB93hqqIbFDsUzErqFl8PWMkb/H/iJx2C3rM4Tw1CgZ0pD7Ytao6wtBv2rC5W+Jfatm8
         VU9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=0xRYk4aYqXFkNtZPxQXZaXbFCshIPXtqYxoLwPPDwhs=;
        b=pq7fhPnorhQqPhtMv5pzVFT7MS8YUvXR2SjyTF0BSrf7zYCKL9u3Exz5XdrakCvOT9
         yAndstkT7OBeGV8ZB1GXkvCrKKLa92FET3NvsyZxWVDeMEHv8Ohif1CtWarZZ7MzP0u6
         ERg8MVDet+hbBlowv7zvJw1C70xNbT+lMVoiIwOgmWlUl15s9LXWTjWV2/VwEeWzZHCg
         y4NH7L8Flim1I0WjvIvZBZPsOLcTtKM+iZRflpfQK9MvXVY1VVxLkx5tX+Y5I+lvBdYF
         NTVpDfqlF/P0kVdkNTUNPeZr/IKoOlnZPvYfU9DEc/Ot8Xs8fDVX3VX+M1zF6kWg6H95
         +QdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NcdUW+8t;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id k15si163068ybp.200.2021.01.11.07.46.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 07:46:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NcdUW+8t;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610379976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xRYk4aYqXFkNtZPxQXZaXbFCshIPXtqYxoLwPPDwhs=;
	b=NcdUW+8tgXxvjHqgdM3BeOh1DmgKv6MsYguucJPLSESR0Sr9LGG74fB8RLl8T+SvoTy1y5
	ls6N9reeqeWdNr3JDy5OA3IS4rHow9CbhnNkbqJr5Q9NkZOLroU+ZpyqgDQl9UkI0hAFpF
	PXC8ftr7hArChtruvLGCuRQpAkHwGEw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-8EsPi8WvNYSkjXKBoDPI7A-1; Mon, 11 Jan 2021 10:46:12 -0500
X-MC-Unique: 8EsPi8WvNYSkjXKBoDPI7A-1
Received: by mail-ed1-f69.google.com with SMTP id z20so8362129edl.21
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2021 07:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0xRYk4aYqXFkNtZPxQXZaXbFCshIPXtqYxoLwPPDwhs=;
        b=Y7QK9JirZOYPVs6WR3Kd+YG+tvxj5nyCdgBvdZ0NaSpiR9PSme+VFjrDE64ScpxgLb
         tY0CPDbGOapH/dYS0MZGxfOsl0WBoDTmsbdpaH3OIKDI3sJSIW7BHcYvuzuO6cH4EHwp
         eyaBuF+7J39NGqIrojXeRqkWLTsOiaOh6rKmjLNcSF1UHGZH+tz73KkCVGqGLMaPo5c8
         DJku/f6OXXbLmTMpJrDV+JAB/c3OwmGmkB3VAmrn/FOhm+gnvUcjLG6tAsOZ7oPNKkh+
         rtgGBSucgRuw5M7+s9nE8VsQLkGC351I/m5HoO/eUuWbWK8+lSHAEy27gCBYU9p6/MaC
         r//A==
X-Gm-Message-State: AOAM532bGxZr+XjiwZvNj2IX8cEV8wn2SN+cdpGUkTRnmw/AMm0JKXvk
	eCbnE2q1VN1zppijV/8fp+gxLSmt0eyu5MSm/dthl73TPr6p2OXyynIPcD6bYRC4BUTU4l1iUek
	+pU58TtlwHuH7yMbW
X-Received: by 2002:a17:906:9388:: with SMTP id l8mr89933ejx.22.1610379971109;
        Mon, 11 Jan 2021 07:46:11 -0800 (PST)
X-Received: by 2002:a17:906:9388:: with SMTP id l8mr89919ejx.22.1610379970926;
        Mon, 11 Jan 2021 07:46:10 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net. [88.21.205.129])
        by smtp.gmail.com with ESMTPSA id d13sm7204083ejc.44.2021.01.11.07.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 07:46:10 -0800 (PST)
Subject: Re: [PATCH v1 12/20] semihosting: Move ARM semihosting code to shared
 directories
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Keith Packard <keithp@keithp.com>, Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <60effd22-55a1-1021-ecbe-4899e68ea9cd@redhat.com>
Date: Mon, 11 Jan 2021 16:46:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108224256.2321-13-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: wECJBM5eZlK6

On 1/8/21 11:42 PM, Alex Bennée wrote:
> From: Keith Packard <keithp@keithp.com>
> 
> This commit renames two files which provide ARM semihosting support so
> that they can be shared by other architectures:
> 
>  1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
>  2. linux-user/arm/semihost.c -> linux-user/semihost.c
> 
> The build system was modified use a new config variable,
> CONFIG_ARM_COMPATIBLE_SEMIHOSTING, which has been added to the ARM
> softmmu and linux-user default configs. The contents of the source
> files has not been changed in this patch.
> 
> Signed-off-by: Keith Packard <keithp@keithp.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210107170717.2098982-2-keithp@keithp.com>
> ---
>  default-configs/devices/arm-softmmu.mak               | 1 +
>  default-configs/targets/aarch64-linux-user.mak        | 1 +
>  default-configs/targets/aarch64_be-linux-user.mak     | 1 +
>  default-configs/targets/arm-linux-user.mak            | 1 +
>  default-configs/targets/armeb-linux-user.mak          | 1 +
>  target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
>  linux-user/{arm => }/semihost.c                       | 0
>  hw/semihosting/Kconfig                                | 3 +++
>  hw/semihosting/meson.build                            | 3 +++
>  linux-user/arm/meson.build                            | 3 ---
>  linux-user/meson.build                                | 1 +
>  target/arm/meson.build                                | 2 --
>  12 files changed, 12 insertions(+), 5 deletions(-)
>  rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (100%)
>  rename linux-user/{arm => }/semihost.c (100%)
...

> diff --git a/hw/semihosting/Kconfig b/hw/semihosting/Kconfig
> index efe0a30734..4c30dc6b16 100644
> --- a/hw/semihosting/Kconfig
> +++ b/hw/semihosting/Kconfig
> @@ -1,3 +1,6 @@
>  
>  config SEMIHOSTING
>         bool
> +
> +config ARM_COMPATIBLE_SEMIHOSTING
> +       bool

This misses:

          "select SEMIHOSTING"

'SEMIHOSTING' is a bit confusing. Wondering about better names,
maybe SEMIHOSTING_HOST_CONSOLE is clearer? (question not related
to this patch).
