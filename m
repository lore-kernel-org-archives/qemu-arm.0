Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp8633625njk;
        Tue, 31 Dec 2024 11:10:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSewRW4Wc4IZdEcj1NMg0DKZQUfSEw/ucFL3CDVtlpkMopaksUcdl148osReSDl6MlQpMN8a7ICKCq6Q==@linaro.org
X-Received: by 2002:a05:6000:186e:b0:386:378c:b7ec with SMTP id ffacd0b85a97d-38a22405d3emr35056692f8f.58.1735672233115;
        Tue, 31 Dec 2024 11:10:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735672233; cv=none;
        d=google.com; s=arc-20240605;
        b=Gt7COySj5kY/i5f62zK7/FwbNAlYjDCnkvHVnoNvqVFC+S+72iF5g6VkseBxy6jo/x
         MvK2KVR3lmaRE4m/xdZI1K6NUfrQc+p987iHT0yoi00lzGouKe72oMljWxXO+pQ1dAYD
         q6p3dOLT69LhjK1cFCNxnBe6T/SyvBPT3VurTZIdGfYJVT7N1u/tMs4IA1RjEKiMQ/8T
         A2ZZqysIFeifAQd+GCzqVPHkb2Nnp1fhR0wDAzPk3hOvayoEhIp2/JHWpQLwMu6KrjlE
         Zd4aqxr51JiZpoLZiX/CdJ5YQq/HkpW0tGwwE8J+gGYKjoRznEVN4bntE9o4sbPXK/R9
         yCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BeygLn9ykMNOw/BE7vEWDHoaAdOtlNYtI57PhpXYn80=;
        fh=LpOS9Nwe5bfbvk006syFlk7Gp9CTtlEx3mPTrvaYC1s=;
        b=kYeOuTMEtw+yVgdrpvhrzDC35VjeEX5NeOEZUzwieXDyCCvplf8C1d2yFnbi11tb7x
         80WUkSO3LC9YZQZi9vgGNB8q45o9S+5Ed1H6ejVXvWpS7F8mFXnE+GzKO4fGrKfsiVQv
         dLRHIg/vyE4O1AJ8tEAMrLoJ0zey9yfMbRDYBNQIoguqxVWuBLbpFRNZBrNpq3+M9HFN
         l80I3zyCQaDqxYZSxT9HunN82dR0dq37sUpJhw+KzrDdAd7CQh/f5xal1aOQeJKX+OgR
         YJcCGu6BTUq+JffYqrDiMLzlr4DFwQYbaSjdPen8N2BHnCr4ReLOik0l17NLWaTdBTD+
         LQyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SV3JE2qO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-436611fb1e3sor63036885e9.2.2024.12.31.11.10.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 31 Dec 2024 11:10:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SV3JE2qO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735672232; x=1736277032; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BeygLn9ykMNOw/BE7vEWDHoaAdOtlNYtI57PhpXYn80=;
        b=SV3JE2qODwoi6ZXn7FhDP844cTyYZLAy28E9Ymd9M7qvPwparFjOe3kbKkQghrT2w1
         BZOHFmpjRTOYFBUAEeEeqUaWSmXzsBpB9m/GxTEHQyoKOUOHGYUdWuXoosZ2lSzeVVKZ
         tuzY7MTRdh85CNl5MAEU4EYkXlTMCUYeP+fUhCsNWjktQY0t18Y1n7HbaokLCfZ+P6Z/
         Cm25he9nrMRsMVTJRBCR44bAWsGfcFyde8FedMzEIt7vcaM4QAgowMgcSnVPEy1Jssra
         O64qIjqd76YUXg8+fV9OBWdx810+TzeAl1n/bZHfLahPfDL9yc7/kJIslgSCsXLzGpqD
         ulYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735672232; x=1736277032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BeygLn9ykMNOw/BE7vEWDHoaAdOtlNYtI57PhpXYn80=;
        b=OXP9KSjSn4v0fkZnFOJbTya4I1grgiBoCAu8aOVxcUwHGVK1xo0eX/aDJ2P0Ml91Qc
         Cc/xBwjbZhBlUgZ2rmEyGHD3/Fhkq1GSIKGh5CuznfU2OkgmlZ/KUQcBP4aR2Hx8LZlt
         LYRU6dD/2vk4RYgFJ1DqsyE1fgqi9NzmKPhv4uwx6aC2mfdXsOXL22Fas16E8/6DMXdk
         5w1H6qXglQ239vlcR7yCbRgsDDS9cfKqeVfehhTmIS4ERz26HYZhjsi2oFgejNajI5f5
         twBM4N3CwVR1HmS3w8NEIQ3CeKDjGYsEYYHThZJPrGcmj/Oxst8MxZC3F6KMBZ1r1PRA
         +zBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRTVuoCLBpSfkoSdQJicUcGI8WSEgVhTbXSxEieP6/Tj0/n/EQg5CKv+gtThjUgl77uQF0+eZmeIOZyQ==@linaro.org
X-Gm-Message-State: AOJu0Yx5JRUrlg9TW8ZGk/vfEBhVGxUy+VJtZMT7YHPqb0Se8XtSQXV5
	2DceaIk2HutytQy+HJyOv+P8V867c/CIn1HNLk9AZzel2zr2PT1ixLShVySJXgu6Gw==
X-Gm-Gg: ASbGncsVWyjHM87H4SIPwzdVTon0tDJgK4j2QhyFdTW42MBJiv2CB2xhGxIyiEUx787
	NNkF4hXhRxVwhtw2w+dcYez36yqm5nVLwsEOqPiFYZkNf6rJ5v88/DGKROXQwf/gRXrDMfzFE4z
	jzsQ/oNy2iwdigQFGhmcT0A5Xc9LnN/dgN03tyQWgCOBKsUQsa+oJrPT1DrJELPU2wOrKpH/66t
	cP80p8Fkfaisp3gWLsIZ7fCu2hv6R4Xqp2lU/yeIOdDFljD+hjgaTsM9dc1G+Gwnd0tgV0d1m/7
	/+/9RaYgyx5/RlOEbNZOyb/C
X-Google-Smtp-Source: AGHT+IGYnlsYAYCxCfIhBtxXny6yWaFiF6gmtL0ba+WpXpSSiqHjYfv6Puzt51BloFjvZtEHNhU5gg==
X-Received: by 2002:a05:600c:35cb:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-43668643642mr328078845e9.13.1735672232591;
        Tue, 31 Dec 2024 11:10:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm33651228f8f.44.2024.12.31.11.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 11:10:31 -0800 (PST)
Message-ID: <27983200-e32e-434b-ad4c-267276eb6112@linaro.org>
Date: Tue, 31 Dec 2024 20:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] hw/misc/ivshmem-flat: Add ivshmem-flat device
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 armbru@redhat.com
References: <20241216141818.111255-1-gustavo.romero@linaro.org>
 <20241216141818.111255-2-gustavo.romero@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241216141818.111255-2-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bL8VZgBRrEj2

On 16/12/24 15:18, Gustavo Romero wrote:
> Add a new device, ivshmem-flat, which is similar to the ivshmem PCI but
> does not require a PCI bus. It's meant to be used on machines like those
> with Cortex-M MCUs, which usually lack a PCI/PCIe bus, e.g. lm3s6965evb
> and mps2-an385.
> 
> The device currently only supports the sysbus bus.
> 
> The new device, just like the ivshmem PCI device, supports both peer
> notification via hardware interrupts and shared memory.
> 
> The device shared memory size can be set using the 'shmem-size' option
> and it defaults to 4 MiB, which is the default size of shmem allocated
> by the ivshmem server.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1134
> Message-ID: <20231127052024.435743-2-gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   docs/system/devices/ivshmem-flat.rst |  33 ++

Squashing:

-- >8 --
diff --git a/docs/system/device-emulation.rst 
b/docs/system/device-emulation.rst
index f19777411cd..a1b0d7997e0 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -86,6 +86,7 @@ Emulated Devices
     devices/ccid.rst
     devices/cxl.rst
     devices/ivshmem.rst
+   devices/ivshmem-flat.rst
     devices/keyboard.rst
     devices/net.rst
     devices/nvme.rst
---

to avoid:

docs/system/devices/ivshmem-flat.rst:document isn't included in any toctree
ninja: subcommand failed
make: *** [Makefile:168: run-ninja] Error 1

>   hw/misc/Kconfig                      |   5 +
>   hw/misc/ivshmem-flat.c               | 463 +++++++++++++++++++++++++++
>   hw/misc/meson.build                  |   2 +
>   hw/misc/trace-events                 |  16 +
>   include/hw/misc/ivshmem-flat.h       |  85 +++++
>   6 files changed, 604 insertions(+)
>   create mode 100644 docs/system/devices/ivshmem-flat.rst
>   create mode 100644 hw/misc/ivshmem-flat.c
>   create mode 100644 include/hw/misc/ivshmem-flat.h
