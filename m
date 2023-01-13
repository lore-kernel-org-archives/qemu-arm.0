Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp724342ejc;
        Fri, 13 Jan 2023 14:40:01 -0800 (PST)
X-Received: by 2002:a17:902:db0e:b0:194:5ff8:a3b0 with SMTP id m14-20020a170902db0e00b001945ff8a3b0mr10744601plx.7.1673649601575;
        Fri, 13 Jan 2023 14:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673649601; cv=none;
        d=google.com; s=arc-20160816;
        b=JXEtn6f6scaSN7tyAi4dFoTV2x4PsIFv1otRpysL3K5bQ8SxwYEpbUCjnmpLtwSe34
         OQ4Z/JUB9zO+e4PYVEwTLqbmPhWtGLGpnVVZ/HNXYaxz4/aBApWHwp3ie2h2/nrDoRFA
         pmG37lRqOBwQacMIxAu177sTdoom5ZiJe770paWdZjcErCG8DDQsZgx/yUe1gtv5LHGy
         BjyxjNmhxoV/pfdjKpq/4TYPV9zlDd7BiLl6LUka7gvseyD7n3rdP/zwXc7HOWqk1niM
         zPVER02onKc/zDoh9Qiw4QX9DhTsYrf26QePJXcNCsQsxq2get77JtUNXKLawo5YzBau
         izQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PAQwBrUSfubfwa4Hl4W3QtDsfa1c9Q95Emz8outdczg=;
        b=mI82rg6MNIzcztrX6ofLNI320JDSfL4PDXkOVGWdVBbmh7L2HT6zm+xnWKAWjMymue
         etMojMmuPIUPFv3yQgEXITZlkYEmQLF1Ye3gdFCrbvqdUmrrImXqh9p4yeAUHucQATkG
         jDZY8se1hAdwLgsGEKMYl05qz4g6jFuUICWneeJkkMAHrAPzd5KtTO3UmATdl87LyYQ+
         h8tknWc2Zmfq7bfyxW+cr6zLuEi9OR589t4+3m4gIwQ4H+d0EO7lniajASUEvI/k+gbD
         8XDSiJ23L3t7UZc01HXF+TAN5RSfJQ75zFDI8OFBfaBaJNaa2IKkkGykEzaY2SLBODgm
         6iJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MQZx9bq/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k2-20020a170902ce0200b00188fccbbe1asor10872057plg.66.2023.01.13.14.40.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 14:40:01 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MQZx9bq/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAQwBrUSfubfwa4Hl4W3QtDsfa1c9Q95Emz8outdczg=;
        b=MQZx9bq/HuTIv85OZtYY+/bL01kjvhQLNnU5mIba25W/nea1noSRnBFKg5eFqGSJzA
         tHQLIuGg+xzsesqHh46/BQEDhAVrtg6ZEUmzusRVcqjSsfHSSac0UQEGXewa+lNZL7QP
         Usvp7pIU4fGZczyj5FqWsiQsrsjtOPEnDiWP5swmJs4VaoeVqxOlGla2T0GYB2Z+XmCV
         jc3TrGeczaxWeqLe0UmEFnkC0PGMsln0Gbl1U+nyNtxbUstt3UwpMGm33iAqDZ8bSkoh
         rBocLMfaLgrJD0vl+5zBPtpTAPUEbgfihndZOzM2r5HoUgRr0xmy577VX0X6DbLWP3WN
         D1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PAQwBrUSfubfwa4Hl4W3QtDsfa1c9Q95Emz8outdczg=;
        b=kkJe4MlToRmgX/5kUlsvmrQq62kLE4UB0Qgv4kcNhjG6SoWAaXmBzaWTUMi/ZfqwKC
         WNmepTP6GzXlpOgaCHs2wSceitVhnCyyTdyt6EdVPuH+oxBWMXwkzTnojdilmaYwFh/i
         n6WdYEHaFF8Az2AzArriHDmSyyrGz7JnyFSLzSAjkKlcCgMNkbBHvkSZODHdxsgf8Ets
         1yIDxdLK3Y+68Duo1+kshzAI23A+iGhYREdiQOeqQNeP/f+k9DP5VM/VG74ZM51XOZk1
         hvdArdhikBWQwWQpVO/QpCJ+Rrm1Cv4Q0777J1xnjnBS6MfZFU9v1NVkElDmmbpMUTWh
         il/Q==
X-Gm-Message-State: AFqh2kqIw2N7j1TYt7pJ68aYIV/rhOMbBEtT+iy2PHjFVeaC+bDRvf7Y
	j3ZbCZbre6TV++ePEIlIAOENYuGe
X-Google-Smtp-Source: AMrXdXudO4fzg5H7q5lzEsT/Z7uJJ4aXE86DLxqyqMdD7woxp6Y4ZRoQ9KNMZNGQai0JVJbMpf5LFw==
X-Received: by 2002:a05:6a21:998a:b0:ad:f86d:c0bc with SMTP id ve10-20020a056a21998a00b000adf86dc0bcmr124664647pzb.7.1673649601092;
        Fri, 13 Jan 2023 14:40:01 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id z7-20020a63e547000000b00476d1385265sm11985884pgj.25.2023.01.13.14.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 14:40:00 -0800 (PST)
Message-ID: <54e6ed54-d7b2-c666-3fd8-614118e95a8f@linaro.org>
Date: Fri, 13 Jan 2023 12:39:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 27/28] arm/Kconfig: Always select SEMIHOSTING when
 TCG is present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-28-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-28-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 8EAlr0EBDHWL

On 1/13/23 06:04, Fabiano Rosas wrote:
> We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
> and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
> default.mak anymore. So reflect the change in a Kconfig.
> 
> Instead of using semihosting/Kconfig, use a target-specific file, so
> that the change doesn't affect other architectures which might
> implement semihosting in a way compatible with KVM.
> 
> The selection from ARM_v7M needs to be removed to avoid a cycle during
> parsing.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   configs/devices/arm-softmmu/default.mak | 2 --
>   hw/arm/Kconfig                          | 1 -
>   target/arm/Kconfig                      | 7 +++++++
>   3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
> index 6985a25377..24fb5f0366 100644
> --- a/configs/devices/arm-softmmu/default.mak
> +++ b/configs/devices/arm-softmmu/default.mak
> @@ -39,6 +39,4 @@ CONFIG_MICROBIT=y
>   CONFIG_FSL_IMX25=y
>   CONFIG_FSL_IMX7=y
>   CONFIG_FSL_IMX6UL=y
> -CONFIG_SEMIHOSTING=y
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y

All of the arm linux-user configs need updating too.

>   CONFIG_ALLWINNER_H3=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 17fcde8e1c..e6f984fea8 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -312,7 +312,6 @@ config ARM_V7M
>       # currently v7M must be included in a TCG build due to translate.c
>       default y if TCG && (ARM || AARCH64)
>       select PTIMER
> -    select ARM_COMPATIBLE_SEMIHOSTING
>   
>   config ALLWINNER_A10
>       bool
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index 3f3394a22b..60278ea9f7 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -4,3 +4,10 @@ config ARM
>   config AARCH64
>       bool
>       select ARM
> +
> +# This config exists just so we can make SEMIHOSTING default when TCG
> +# is selected without also changing it for other architectures.
> +config ARM_SEMIHOSTING
> +    bool
> +    default y if TCG && (ARM || AARCH64)
> +    select ARM_COMPATIBLE_SEMIHOSTING

AARCH64 implies ARM, so shouldn't have to check for both.

It would be even better if there were another way to do this, like

config SEMIHOSTING
	depends on TCG

but I suppose that winds up with a conflict.
It's just that we're eventually going to have the same issue with riscv.


r~
