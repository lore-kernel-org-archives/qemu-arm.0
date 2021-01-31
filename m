Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2627069lfo;
        Sun, 31 Jan 2021 04:42:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhAlmzKiuoWI7M5i9AGrVYlUR52j/kreNHdvHappwXPO6HgjP45U+Y5WvxEtiEKLHyp5Fo
X-Received: by 2002:a17:906:364b:: with SMTP id r11mr2219390ejb.447.1612096970972;
        Sun, 31 Jan 2021 04:42:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612096970; cv=none;
        d=google.com; s=arc-20160816;
        b=IwzCBrHrMZZkw8795at57Va1N/OJ6WmfzP4CpyPd/YbE1BrVyc+O8X9sM6dvjGZAO5
         YJq3bnHTdkycn/n9GAvzN/q1c+S7pe0gQgbvmcDFAXHvbh3NGy7eaZvH8fI/ZxRqEss/
         h6dQqdMGo7esPl+K6yrJylLWUHe1vwpiY5owCN36VQreLi7K/kskIHLT2iJtwPZrZsZ2
         9Vh8DQidawccHPZVSuNV1lJR07zpD5u+6XXfDwmHwrP5wsZNTItJzbQqzKzQyDJZtO/e
         SKwhN7DDjNW7XraFzw7rZZPvbq275QQEaYjYi1jVk5K9EeaTavXj1YmgLUnlEXtGCZlP
         fYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=r+fgSsYmJt0f3GPKQSs64Hq+gfQen9Lha7MbKdEpdgY=;
        b=UCiuhBdYfLjluUvEqaHjGIBZMkMz9+/guhgRMIj2ku/2qR57KrU4bKQaX1mrTAsB5o
         dSXu2nu9UW7+HEUxIgBrKCOudaETFzVi4nrdIJWTOuojtj8xBcUeY4Jc7cQNG8xfLXmY
         IGdrRdAPWYepqU8NTBFSpN6+AbhNwPF+NGeRSJruseIiSkrtSnMnV+G/PWF266JUc2Ld
         8APh4YwgEThrySiL/MYEXI7GBa/6sdmrz/nOtO+SlA+6NWS6tGOuB+tL/NC7xdK/0jqz
         Qp8Uf5wqgzqAyg9MBgMhA+stcyGCrzFZA3hAM4pDVa/CLmjOCw9GEB/8f9lA9JGiLbph
         NmlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C9d3ycWZ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id hs9si7846559ejc.78.2021.01.31.04.42.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Jan 2021 04:42:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C9d3ycWZ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612096970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+fgSsYmJt0f3GPKQSs64Hq+gfQen9Lha7MbKdEpdgY=;
	b=C9d3ycWZzthtencFEXyBArQqBMFUIM+7Uw84ewvjKbRVfyq5Z9ghtGVuAXWrNOADsQhz2/
	zzvW0siZmrwwjTxSe6jrVP51WOTkR+vRQSOzE5av8eQQ6BqcHv84lseCTMxaog2B5wo2Eu
	CKKznFSaH+lG3e0U0FUT/2APRwF7AbI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-e8sx9WpgNuK1bgyxudn-_Q-1; Sun, 31 Jan 2021 07:42:45 -0500
X-MC-Unique: e8sx9WpgNuK1bgyxudn-_Q-1
Received: by mail-wr1-f72.google.com with SMTP id n15so8659759wrv.20
        for <alex.bennee@linaro.org>; Sun, 31 Jan 2021 04:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r+fgSsYmJt0f3GPKQSs64Hq+gfQen9Lha7MbKdEpdgY=;
        b=QfK1INl2mHkj0f1iQIO3amy7jssAryQs40NKf7R1Cm5HdRu6IIRyRzbPed2lT/0x+A
         a6DtpTmTIl0LGZBm3GmTY/WDhheWNqirjN5ecXgbjYpSzvWEMzXb1ZNT0qWTyXY/avDI
         ia6+EcwQ+oa8WjElGxifwDHJctDCvbPUneLcjXuw1AgrHzSrI8k+1xSD2TIsqzUlh/LI
         rywXj0PmQQv8Ixu0cAyklN5DjGx4eimVZQwr7ReQiaFVFV5OyjXAtSztc0dmByC7tMc3
         4+j3o50K5HsKU3ca3yEaNae9HsI4WeMYnKuXh3lt0JyQRct2JxBNv8kceJrmrWTxKGG0
         1Wqg==
X-Gm-Message-State: AOAM5335rWl/YE2Iwcxq+KGQLZp46PIdSQU3XoQ7zSlHgerMuLkmltMq
	+eS9pN/BQDLSyZekx8q0KY11arJy1/fizuoHLvhHzo8QLAoZpOlxvQZhzagWZK1nB18RAlTgjJg
	aCUu/jATCMxuo5CE5
X-Received: by 2002:a5d:4c84:: with SMTP id z4mr13064331wrs.289.1612096964635;
        Sun, 31 Jan 2021 04:42:44 -0800 (PST)
X-Received: by 2002:a5d:4c84:: with SMTP id z4mr13064319wrs.289.1612096964476;
        Sun, 31 Jan 2021 04:42:44 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id h207sm15855648wme.18.2021.01.31.04.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 04:42:43 -0800 (PST)
Subject: Re: [PATCH v6 06/11] target/arm: Restrict ARMv7 R-profile cpus to TCG
 accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Fam Zheng <fam@euphon.net>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-7-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <80af7db7-2311-7cc5-93a0-f0609b0222d0@redhat.com>
Date: Sun, 31 Jan 2021 13:42:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131115022.242570-7-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7kLbnwikw7cS

On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
> 
> Beside, KVM only supports A-profile, thus won't be able to run
> R-profile cpus.
> 
> Only enable the following ARMv7 R-Profile CPUs when TCG is available:
> 
>   - Cortex-R5
>   - Cortex-R5F
> 
> The following machine is no more built when TCG is disabled:
> 
>   - xlnx-zcu102          Xilinx ZynqMP ZCU102 board with 4xA53s and 2xR5Fs
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  default-configs/devices/aarch64-softmmu.mak | 1 -
>  hw/arm/Kconfig                              | 2 ++
>  target/arm/Kconfig                          | 4 ++++
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/default-configs/devices/aarch64-softmmu.mak b/default-configs/devices/aarch64-softmmu.mak
> index 958b1e08e40..a4202f56817 100644
> --- a/default-configs/devices/aarch64-softmmu.mak
> +++ b/default-configs/devices/aarch64-softmmu.mak
> @@ -3,6 +3,5 @@
>  # We support all the 32 bit boards so need all their config
>  include arm-softmmu.mak
>  
> -CONFIG_XLNX_ZYNQMP_ARM=y
>  CONFIG_XLNX_VERSAL=y
>  CONFIG_SBSA_REF=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 6c4bce4d637..4baf1f97694 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -360,8 +360,10 @@ config STM32F405_SOC
>  
>  config XLNX_ZYNQMP_ARM
>      bool
> +    default y if TCG && ARM

The correct line is:

      "default y if TCG && AARCH64"

>      select AHCI
>      select ARM_GIC
> +    select ARM_V7R
>      select CADENCE
>      select DDC
>      select DPCD
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index fbb7bba9018..4dc96c46520 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -18,6 +18,10 @@ config ARM_V6
>      bool
>      depends on TCG && ARM
>  
> +config ARM_V7R
> +    bool
> +    depends on TCG && ARM
> +
>  config ARM_V7M
>      bool
>      select PTIMER
> 
