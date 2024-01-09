Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp383555ejs;
        Tue, 9 Jan 2024 05:31:07 -0800 (PST)
X-Received: by 2002:a1c:7208:0:b0:40e:4832:9fab with SMTP id n8-20020a1c7208000000b0040e48329fabmr1448666wmc.143.1704807066914;
        Tue, 09 Jan 2024 05:31:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704807066; cv=none;
        d=google.com; s=arc-20160816;
        b=qzweVLHaIku8f9EmweaecPeMpOixmes2c9Yqmdlb1P48DVQqFH+AuuTRxPB/xtZZYp
         U7/Ki0bnEC4vCecPpbuIh1RzzxI/eQU+TIKOmCJeWcddbzUIj17nQQb59hwk/GA0IMXy
         A2eIPLyJ56TVmAT4xGWDLjP3CJIkmInU6cOVm6hVlAR/ICeeps7qmJ0tGGErp5aOpyAa
         uR5c/CCI9RTPBas6vKKDvgMC991ZBeMxigD9pJula2DLFjV8TSfMJYUN2ZXW1N7cbC1v
         BIgTozvu8khZSmWswbTqv9c1i5YBAEbQfQQ6S6O8bTtaTO35mStMwNiRFtnQ4pPRYsN4
         e/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8tZaOxh8sXvPY7EuKjNICYqWEHqtF6t31467tcsqEas=;
        fh=tebFjQw8nyYXdpHWOtCSmNiXXYif6WEiSPQxtAL9eeQ=;
        b=ZojhmJ6hupzwboP5tV7UYGiVUnyLnWKNwezBQykepT8oJ9nVqa5vccKzhW7RO7q/cy
         jZLDkQO9AnXPWn38IzFG0xSA8g7iub/+TGcgFKOfY/kPpc9U8Qw219SW7SGBTc92VM3G
         kQrB9ycqoKXg10wbVdnahPU/5ikurpVnHJfbWPs/hrfdhfEJa/I0fG/1W/+DaqNdfbdT
         ZKAiS4tiThmpGqhJa01oaMPBikM0owuLO5iFlsoWN3JOJGI/qgFKWN+tP6QfefFa+22B
         +kAjPF4OPAqJEEvCwyJIA+soGPUKKVcWaE8fm9RRNvK3H7eKBl/GTdnyH326naiOLwWm
         MGVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yDPs/jc0";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u13-20020a05600c4d0d00b0040e39e878e6sor798642wmp.12.2024.01.09.05.31.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 05:31:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yDPs/jc0";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704807066; x=1705411866; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tZaOxh8sXvPY7EuKjNICYqWEHqtF6t31467tcsqEas=;
        b=yDPs/jc009Oh1mlIguKkipjDEebc4ijwc1Z71/OIjKVgESVHwjhkPdI9/8G2+Gs5wm
         w9gJjelnklerBNEp1BnrAu9/Iq1biMGszu4cZIDu++4WXSDHxuF9jLFoSsd42ktVEx5V
         eXfAAh+RajvQSnvhOzzbho+zFLyDYTD9mCdAC4I5bBfBciue3seYvnqKAdJLj7FeGwQL
         iP7jP6zl+zhO623exUwbPkG1aEI2W3Q74YSf2frUjPiBqSFMmDLfage4p97iXkeZDmI7
         4qBDdqSsv8cJLY3A2waoOpUOwtIDGgMzpFA8UgWRxr6gF+fx6r8L/F3skYKeRIMbe7BS
         DP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704807066; x=1705411866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tZaOxh8sXvPY7EuKjNICYqWEHqtF6t31467tcsqEas=;
        b=eSvOcKlMrVlpqoLk7LKCsqw6Loi+JM0nWSo2isYO38m+Xg3TtJ48NoCQYv8PDgO44w
         Bk5WxxGkvvJ5nYtmp9TV232AVevkiYETgqK0aKl6UY1p0ggykR+QnWAVnHuqW/+ypyZr
         ErjVBegdzljE8HLgww3ut9Khaj/3ZA4yk2K18C6eHsCsOydYhXqjjxGVNmmk2Kl+gkfi
         6zmOIAcVW6WfARkEnxWPNejCsQGZzxDTJEEGPj7Iw/igq2+nKdRlsbjZdaae6L4lN3hY
         3OeCf2wzJFCea1RcwHDgiCZGMCtApZ5d3ebaZmU3FYmsR+a4ghwMFELJimjRhkPoMqDc
         kJhA==
X-Gm-Message-State: AOJu0Ywf3EWYvgEDLZLyBiLXYHi4kJeK2KfnGJ4IS9oFD9pb861klf+X
	oubgmq6MzHvIfXJAJP9ujZV4tkfBp08rfOfq8FsKdO5q0BR730AW
X-Google-Smtp-Source: AGHT+IFBzIkF1sEG9hY3lyE8hBQCKL1dhyzyIqwAewzsaChrAyC6gBNU2Am9L1NAzMpbtdNqocFLfw==
X-Received: by 2002:a05:600c:458d:b0:40d:9208:ece4 with SMTP id r13-20020a05600c458d00b0040d9208ece4mr2736176wmo.33.1704807066535;
        Tue, 09 Jan 2024 05:31:06 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id fj14-20020a05600c0c8e00b0040d83ab2ecdsm3836420wmb.21.2024.01.09.05.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 05:31:06 -0800 (PST)
Message-ID: <48ca6b12-6838-4788-8484-90621b46d65f@linaro.org>
Date: Tue, 9 Jan 2024 14:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/PATCH v1 07/11] gunyah: Specify device-tree location
Content-Language: en-US
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>, peter.maydell@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: quic_tsoni@quicinc.com, quic_pheragu@quicinc.com,
 quic_eberman@quicinc.com, quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com
References: <20240109090039.1636383-1-quic_svaddagi@quicinc.com>
 <20240109090039.1636383-8-quic_svaddagi@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240109090039.1636383-8-quic_svaddagi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 7NZtew4G+ZlD

Hi Srivatsa,

On 9/1/24 10:00, Srivatsa Vaddagiri wrote:
> Specify the location of device-tree and its size, as Gunyah requires the
> device-tree to be parsed before VM can begin its execution.
> 
> Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
> ---
>   MAINTAINERS               |  1 +
>   accel/stubs/gunyah-stub.c |  5 +++++
>   hw/arm/virt.c             |  6 ++++++
>   include/sysemu/gunyah.h   |  2 ++
>   target/arm/gunyah.c       | 45 +++++++++++++++++++++++++++++++++++++++
>   target/arm/meson.build    |  3 +++
>   6 files changed, 62 insertions(+)
>   create mode 100644 target/arm/gunyah.c

(Please enable scripts/git.orderfile)

> diff --git a/include/sysemu/gunyah.h b/include/sysemu/gunyah.h
> index 4f26938521..a73d17bfb9 100644
> --- a/include/sysemu/gunyah.h
> +++ b/include/sysemu/gunyah.h
> @@ -27,4 +27,6 @@ typedef struct GUNYAHState GUNYAHState;
>   DECLARE_INSTANCE_CHECKER(GUNYAHState, GUNYAH_STATE,
>                            TYPE_GUNYAH_ACCEL)
>   
> +int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
I'm getting:

In file included from hw/intc/arm_gicv3_common.c:35:
include/sysemu/gunyah.h:30:24: error: unknown type name '__u64'
int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
                        ^
include/sysemu/gunyah.h:30:41: error: unknown type name '__u64'
int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
                                         ^
2 errors generated.
