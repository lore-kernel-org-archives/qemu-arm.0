Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp260652ejc;
        Thu, 2 Mar 2023 14:16:51 -0800 (PST)
X-Received: by 2002:adf:fd86:0:b0:2cb:59ca:8671 with SMTP id d6-20020adffd86000000b002cb59ca8671mr8314489wrr.24.1677795411629;
        Thu, 02 Mar 2023 14:16:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677795411; cv=none;
        d=google.com; s=arc-20160816;
        b=jHO009jnEjnDwIytrCfQR3hLq/Hn0KQ64MHC1JNeQcfEdVAXq8ldY2shS5u16Cynba
         RR1ekfVFwMGrGQa0PVwf09qTn7O892DHvtNeKYHeRAmrpaMRVMBlUAWktPC64BYwwcG+
         x43hPZwKp0JSoW4LMys1vs7YUFR+0tu+GGk1KjrP4kCgrrcEsbl6sledVe/WBS9RdN9o
         dyqV5fikjzOcJApeii3Rnm8xrTmOQTfQhzFoxjgOjHQ/CAgcDUKmx+Hr5eXhAJDTEQhv
         hjggujXk38cdK8wzEZh2keuHgK7sxm+qskgAN8Nmv0cpE/JwwhWoiijNh7dKG+yBgDuC
         Mhzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=j/QW1HM2Mk99OFnysxfaddjjhGUCTkKLCoCNHfnkBus=;
        b=h1Xfq+v7pr5Ag7pvQ4F+r+/YvAbQXvwFPt2vDJDpvH9ttGhbjzecNjfDHcthzRJY5m
         mHFJaBhZ/iIKQLeas0fUjmesi59QhZVQ7oyy+Qw1hVrM3sFwj4JHqWJAowHHOMPftaYa
         anjRMvkqY0dPmghKxVp5PN7WLcZevoGY6p+ENse+BclrKpjMhjzDaZnHlOAxR3VKNiBf
         T9NLuITKSuQTRqnf6U7XTMRCIgBHfk9stxWGarhbUWuWrW7s8EKNydaVKKi00xzeH/M3
         HOLOT6o6DYvHwAEWfxbvWM5c3wQnftcKMaxfKZi1jB2MRxMDZ5N3g6/cFuniHyF/bsI1
         zTWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ALhBjpW+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o11-20020a5d4a8b000000b002c542043923sor217368wrq.39.2023.03.02.14.16.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Mar 2023 14:16:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ALhBjpW+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677795411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j/QW1HM2Mk99OFnysxfaddjjhGUCTkKLCoCNHfnkBus=;
        b=ALhBjpW+9d/4nqIcn9T7comSyKRfOMYle0Ef7GQcmPgOMdutjgV9UKobixXu/69zHV
         Gna/Ej5gE7HUKBhbCvqj8/rzOOj3rbijoydiLuqrANb5aNRLMwdpFwlO6Ij0SEjLwLD2
         SuURyr8oCgi/BLZT/28QMLcv7vIq/RsDcJEHtcwC9g3SA4Sh23srhZ96u5XizNgGCXBf
         ZH3j7PM46/BS1tqUUOXxHHonLNrabmZBig13eMG/aln6neAwBf8pxBBx/y54Rue4bw03
         m/17PD9lLEL2rAwGbbb36CMxU3NG/S/W6it0v6UIN8EOIM9HtOZbnfqO+RvCmNpJkpgk
         4s4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677795411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/QW1HM2Mk99OFnysxfaddjjhGUCTkKLCoCNHfnkBus=;
        b=AWwjndJ/wO2MWOuxFi6/Uiocg/FC8bYjKusmFKtKNw+/6yPBIwIee5rU75nAqdwZ57
         P2pSf6bTPt5bnquXnPFL2EHSL4K+DhCHwIwUST4Sz897xsX2mjJsff1JlS9zH6+DlaBq
         sP6qxaYqqJ2d0D5jh0/Xbkc2KnvPTTWoz6SqhqAwmrlZjrqM6O9Rxv6MyfGOh+mUqs9f
         GaEIE3FV1Mbhh0BzomvfVtBDIyoZwCS7dvVocaxfg7Zm4U3W0ORF5yXh2fJZGqiQrvQR
         Yb44KNlOuGqsP2YlCwqXVq+DsPFd1Jbjs4mJGtJjTxVgIdLi7XK2SoP7JfC7Ecmej18U
         4a1w==
X-Gm-Message-State: AO0yUKWUIcdWdrEeyzqvbKGXMkVTuHOdK6rUM+RX/HZkAfAsWT0O06RR
	gtXIVh8X//cDJBl4jEj3WDp1CN4tH56AGGKwQpg=
X-Google-Smtp-Source: AK7set8FAJoagkadDS0ky4D6I6VKl6CQte+kz2H8UpkpBkrwx3GyTQUjYMJKyj+fdM6XhAnFPLxhzw==
X-Received: by 2002:a05:6000:11c2:b0:2c7:1d55:a56b with SMTP id i2-20020a05600011c200b002c71d55a56bmr8281108wrx.70.1677795411324;
        Thu, 02 Mar 2023 14:16:51 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net. [95.127.39.43])
        by smtp.gmail.com with ESMTPSA id k21-20020a7bc415000000b003e206cc7237sm4096886wmi.24.2023.03.02.14.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 14:16:50 -0800 (PST)
Message-ID: <733a61bc-0e41-a864-c7fa-f177b35afa25@linaro.org>
Date: Thu, 2 Mar 2023 23:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302163106.465559-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: KqFvz1d4VInY

On 2/3/23 17:31, Thomas Huth wrote:
> qemu-system-aarch64 is a proper superset of qemu-system-arm,
> and the latter was mainly still required for 32-bit KVM support.
> But this 32-bit KVM arm support has been dropped in the Linux
> kernel a couple of years ago already, so we don't really need
> qemu-system-arm anymore, thus deprecated it now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index a30aa8dfdf..21ce70b5c9 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
>   on x86_64 hosts. Thus users are recommended to reconfigure their systems
>   to use the ``qemu-system-x86_64`` binary instead.
>   
> +``qemu-system-arm`` binary (since 8.0)
> +''''''''''''''''''''''''''''''''''''''
> +
> +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``. The
> +latter was mainly a requirement for running KVM on 32-bit arm hosts, but
> +this 32-bit KVM support has been removed some years ago already (see:

s/some/few/?

> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=541ad0150ca4
> +). Thus the QEMU project will drop the ``qemu-system-arm`` binary in a
> +future release. Use ``qemu-system-aarch64`` instead.

If we unify, wouldn't it be simpler to name the single qemu-system
binary emulating various ARM architectures as 'qemu-system-arm'?
