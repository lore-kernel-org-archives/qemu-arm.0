Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5659986ejc;
        Tue, 28 Feb 2023 03:43:05 -0800 (PST)
X-Received: by 2002:a05:600c:2ed3:b0:3ea:e4bb:33ef with SMTP id q19-20020a05600c2ed300b003eae4bb33efmr2262167wmn.9.1677584585599;
        Tue, 28 Feb 2023 03:43:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677584585; cv=none;
        d=google.com; s=arc-20160816;
        b=CtdtM1r50IaP+UmbBDNAs/E4R2bLG60x9pczK7dz8iukclcaraTbZaGB9s4yopb7Vi
         kpqIf3UC5T0RNELFd3Fu/4yO4Jqie70AVAExZ/ESUurU/BVFCBuIN+R2Tf0atR6qnyKt
         PbeIKI1ov/69JM1/7MTGOEjL9uCNTmi/YYVgYswsEI/Utqb/L8RqsSuBVLzsx5CoGA/q
         yFyZ99FLwbZLM74fLDZW8WMaqiaNO+lqaHLNwRlHjD6t33C04/HFX2J3wMHZxwfz5Zto
         SJOtNN3/nuX77Z0/FdABK+HJY06uefcXxMZFg9sAAq2f/kV3hxNBW55bTXZmxQHFC19U
         orOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qn5/lqpKPK5mBQVAYHDZtB1pxdZNOLvZjdZjGZoXK5I=;
        b=0OQJy+6Icd66lPO7iER72KSOnIhqJQOLfJtBX0MuEOrutuxXT9HOuufQdIM8A70JiM
         PnU6eUkGm+0/GGpIYDD+s2Awwqp622EYpDXR2e067HNqCJJHo5NcbYBCWM7VzC5G+fnL
         jRRcwgmoxOAxmSMV48GR/M4Ij9RmYZzL7PzFkq4Fhjq+yh966RTCQajY0g6oOnjyIMnA
         1AJlM6z9fux3vusee0GjirYPoDdjmsmIrI3EXlYnyk96/KLMZJxzlhUkEr7kdPrLHNk+
         no005InNhBSKc5uQlcG7Ddt0gO2TlkmWXQr9scuKtppbtMN/msHFv4hJU+AuJNcDiMJ9
         S1sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wi4DAfyx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fm15-20020a05600c0c0f00b003e222c98e48sor3635211wmb.21.2023.02.28.03.43.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 03:43:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wi4DAfyx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qn5/lqpKPK5mBQVAYHDZtB1pxdZNOLvZjdZjGZoXK5I=;
        b=wi4DAfyx6P1YCx8EQjYk3jCSjunAaV/YdGGiFB+4DUqGBIzbR70gGgRNi+avUKBcYv
         2gbry3YEI2itce20esRhEgrDCQuXVjdXZkjfqSgfrydB5PYO82kDTN5I/rsgg5zMiFEW
         5jFtKeatSwiR6VYby2KhMyqPyiuXR1au4lDL+E0cdPCZfZ1KTxaILR5CclLOWSakQvKF
         djZXTYWdc/mOZpD5Yqz59BakvhUIDZdzYzGwligU26DwCeVZnJ5Q1G6HoFFULvjDdEk8
         rpHnAOPHoZPJUe/jyEEUlBJGPV2G1xrBmuTCrpAz6GpfrcNi2SsEZm4vtY5Cj8SZzVym
         ei4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qn5/lqpKPK5mBQVAYHDZtB1pxdZNOLvZjdZjGZoXK5I=;
        b=07aoVFp+3cw9klMyrVclnNUfSHw8w5wle34uiu9lP93/ksyWQbvj/oJOJfXsAeKBLU
         YtaRPdqmHCGco4GOSLeQqbJMEVlapshF/Im2lVLz4+Te0uLAFhW2BbW7zVwdpRGaacoC
         fMzzsyTsyvOQ18PnwVlTkCfI49W/n1Zy/Kn1UpU7npwzCXxvSNvzKAVro+rMI6EpEXsg
         RoE0sZjYHS+vDiWHlSc434RGlJdbP9P9qitbOTxEmKGsvU9aSncq/qpyk2PCcUD243Yp
         tYqE2Fl4ZF3M1Fdpsd4HJn7rpaW3ZNmc0grZcUlPnFVjDg3XpwlX3mPjHzxgbHDLvn/J
         saSg==
X-Gm-Message-State: AO0yUKVwk3beo+QyA1DwxBeFQOyyH+Uw3IiSoZ4S/Pg/GfK+k9FwY61M
	niCjrF9gsc8236UiHicuF67O1Vd81oKdz3o9Q5E=
X-Google-Smtp-Source: AK7set/wz5KbJ1nqBKk3Hpu5iolxSle3o866r+XrhpX9vHACDxivAFx32qsCAH7G1sIHU0rs7sBcLw==
X-Received: by 2002:a05:600c:1652:b0:3eb:13d2:c32c with SMTP id o18-20020a05600c165200b003eb13d2c32cmr2165782wmn.40.1677584585011;
        Tue, 28 Feb 2023 03:43:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id a10-20020adfe5ca000000b002c3dc4131f5sm9351025wrn.18.2023.02.28.03.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:43:04 -0800 (PST)
Message-ID: <6a0a7246-e9fd-abfc-283e-b591000cfec7@linaro.org>
Date: Tue, 28 Feb 2023 12:43:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 4/7] tests/docker: add USER stanzas to non-lci images
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224180857.1050220-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: I0QhN5I2LD6E

On 24/2/23 19:08, Alex Bennée wrote:
> These are flat but not generated by lcitool so we need to manually
> update them with the `useradd` stanza.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/debian-all-test-cross.docker     | 5 +++++
>   tests/docker/dockerfiles/debian-alpha-cross.docker        | 5 +++++
>   tests/docker/dockerfiles/debian-hexagon-cross.docker      | 5 +++++
>   tests/docker/dockerfiles/debian-hppa-cross.docker         | 5 +++++
>   tests/docker/dockerfiles/debian-loongarch-cross.docker    | 5 +++++
>   tests/docker/dockerfiles/debian-m68k-cross.docker         | 5 +++++
>   tests/docker/dockerfiles/debian-mips-cross.docker         | 5 +++++
>   tests/docker/dockerfiles/debian-mips64-cross.docker       | 5 +++++
>   tests/docker/dockerfiles/debian-native.docker             | 5 +++++
>   tests/docker/dockerfiles/debian-powerpc-test-cross.docker | 6 +++++-
>   tests/docker/dockerfiles/debian-riscv64-cross.docker      | 5 +++++
>   tests/docker/dockerfiles/debian-riscv64-test-cross.docker | 5 +++++
>   tests/docker/dockerfiles/debian-sh4-cross.docker          | 5 +++++
>   tests/docker/dockerfiles/debian-sparc64-cross.docker      | 5 +++++
>   tests/docker/dockerfiles/debian-toolchain.docker          | 5 +++++
>   tests/docker/dockerfiles/debian-tricore-cross.docker      | 5 +++++
>   tests/docker/dockerfiles/debian-xtensa-cross.docker       | 5 +++++
>   tests/docker/dockerfiles/fedora-cris-cross.docker         | 5 +++++
>   tests/docker/dockerfiles/fedora-i386-cross.docker         | 5 +++++
>   tests/docker/dockerfiles/python.docker                    | 5 +++++
>   20 files changed, 100 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
> index 8dc5e1b5de..981e9bdc7b 100644
> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
> @@ -61,3 +61,8 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
>   
>   ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs --disable-tools
>   ENV DEF_TARGET_LIST aarch64-linux-user,alpha-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sparc64-linux-user
> +# As a final step configure the user (if env is defined)
> +ARG USER
> +ARG UID
> +RUN if [ "${USER}" ]; then \
> +  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi

Is that intended for local image building?

Personally I only use the image built by gitlab and mount the containers
with -u $UID -v $HOME/.ccache -v $HOME/source/qemu. Would that still
keep working, or do I have to map from gitlab user to mine?
