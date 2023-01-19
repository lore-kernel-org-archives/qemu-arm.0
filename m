Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp448090ejc;
        Thu, 19 Jan 2023 08:14:03 -0800 (PST)
X-Received: by 2002:a05:600c:5118:b0:3db:1e4f:7cdc with SMTP id o24-20020a05600c511800b003db1e4f7cdcmr3006083wms.15.1674144843546;
        Thu, 19 Jan 2023 08:14:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674144843; cv=none;
        d=google.com; s=arc-20160816;
        b=mOZMEwCLgvKwXmKKn0GGbLBeyGZ2fxZCx+NJU5HL2vBpPrhaFNKcpyH2MxT66uaXBG
         7+19Ap6V8BhjhYgfRSIajeEa998wteWp2RXQMEgbyc4BqKS30KBEuSvJkZGKxe6CGy0y
         hqAY0yu3zoEqevlps0HLgYV2clhqk1CyHQXAGajvMucgkhhybmph52g4ENSHV4QNc3Od
         vPBlxhRAjxC0zn9CU8dfnSk9EG2aMn8tFZgUorY/vh4zCeuvIF+ikB4GPnv5dT1zy+rK
         S1x36QrHYlaCFEIJ/Ij6jw/WlmZSW3t+jF8VPfX53Ph64nVj9NLluQHxIoPo3GZwHA0u
         qeqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Q1MSM7ZtQbaef2XsxiKC4Gik8tnSr6KmkvCbO4U/GLg=;
        b=sVtiIRJYd4JUyfjsevFqTC9FflbEuTH89hJWeviGoLx9IqBSsdOpROcQe4LE+w44Fu
         0/k92eIqOsDKdYkwI905QMZKbDyfprYPDfh8rvxgMtXkP8TvguwJ3uALh3t9VgYspnIX
         oomgRBO4fdvM4/EAGt7mDnZivfWDHbZqJTXj4o9nErrRC2sY5YGb+dqBuocVuuIOz8f1
         2cXKRLzvMw2c/849+TaCsR14njPrmsbwGv5QX1lGJe4Jx5KFrC+QwJU0hIOO2cx8djQs
         fogFuJLg2kYIlsNNUIp9vnwt9Q/aznaH9V+x+wsot7jAvN31fwjsk1+6OOpQ2OTCHCLE
         voow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1NSaw57;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v6-20020a1cf706000000b003d9ae6cfd40sor1997531wmh.0.2023.01.19.08.14.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 08:14:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1NSaw57;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q1MSM7ZtQbaef2XsxiKC4Gik8tnSr6KmkvCbO4U/GLg=;
        b=B1NSaw57yXSQDN/w8jooFhTRvKmJtFd+TIN2fsPDk9dkUemquiz3fH4ek84+R+oI+x
         z8f6yJOj35pao4bSUTrW1MTbt55kmVunFPaJld+QeXikpcekK/JleL/CCLaePZW/Kv3J
         PaLccHHV9LxyFlvCzR6Bm/ugyf9g56zmdlWT94Up9+GzqTB3xyfvMftPGzI07zN9jSw0
         Mw/40X4Xz5LdHDO0iE3u3MJQ5dLgySXSSfNc4v7OmVIhEFGJpThB/rG1oZQCbfd7HnlS
         rbK64joADy//KWHcMj4C+kssVGJg/EkXTTO3QlxeNPm7TO3imSxYhz+mNlaKOY+LstJp
         zw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1MSM7ZtQbaef2XsxiKC4Gik8tnSr6KmkvCbO4U/GLg=;
        b=uluhwhUCBIk2QxivBJR1S+JOCnyDbv/YOKsDPYq22TvpNtHqnpGoyL1BMDAIRxVXaB
         dJm6ABbl6wItSJjPe6iLjIs9X4DrGAI87iLOJZDy2vSx5NX6j8xydvgxAJhzUoXmRexN
         TnsRkBFuF8oM3eluqVk6gROXn2asu7ZoEWV8c1oqRMZNco6Tx3/4/nZocgS5KUy2iz4h
         Cv9NSGPmxDyMSIdv3M8cYYgm+mbgxHi/69iiwzi/xu78afIVe7HoL60MB+V1NnQ4ySy8
         NqMKB42vA8sqH+GKU5GXi0+ZSz8pqJrvPo/kt4TJUE2oyLZQvcDYCGmKyE5Wu5GWtWcT
         LmBw==
X-Gm-Message-State: AFqh2koI5j48C5Xca1zBzBnWetuTdxO/kA4jcmBx/nm6QhIOjTlMbuWU
	duh2HqHB4hNYYEjcGAP5QkZxXtvo
X-Google-Smtp-Source: AMrXdXuD0x3uYYc4FXDX50QFbEfLk11hdu11vkHw/689KT/Mx2XQvAlo7WK+W994UBqKjl2a9CGlZg==
X-Received: by 2002:a05:600c:b54:b0:3c6:e60f:3f6f with SMTP id k20-20020a05600c0b5400b003c6e60f3f6fmr10806821wmr.38.1674144843275;
        Thu, 19 Jan 2023 08:14:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600011cf00b00294176c2c01sm33658036wrx.86.2023.01.19.08.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:14:02 -0800 (PST)
Message-ID: <1c54e0ce-31ef-ada7-269b-9d3ee09a7b6a@linaro.org>
Date: Thu, 19 Jan 2023 17:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] gitlab-ci: Check building KVM-only aarch64 target
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-arm@nongnu.org
References: <20230119155646.50503-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119155646.50503-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8dInR353TGOs

On 19/1/23 16:56, Philippe Mathieu-Daudé wrote:
> gitlab-ci: Add KVM-only aarch64 cross-build job
> 
> Add a new job to cross-build the aarch64 target with
> only the KVM accelerator enabled (in particular, no TCG).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20230118193518.26433-1-farosas@suse.de>
>            target/arm: CONFIG_TCG=n part 1
> 
> Successful job:
>    https://gitlab.com/philmd/qemu/-/jobs/3630178191
>    Duration: 15 minutes 25 seconds

Alternatively we could move it to the custom aarch64 runner
in the qemu-project namespace...

> ---
>   .gitlab-ci.d/crossbuilds.yml | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 8dbbb8f881..fc78d36b31 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -210,3 +210,12 @@ cross-arm64-xen-only:
>       IMAGE: debian-arm64-cross
>       ACCEL: xen
>       EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +
> +cross-arm64-kvm-only:
> +  extends: .cross_accel_build_job
> +  needs:
> +    job: arm64-debian-cross-container
> +  variables:
> +    IMAGE: debian-arm64-cross
> +    ACCEL: kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-xen --without-default-devices
