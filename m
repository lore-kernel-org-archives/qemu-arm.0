Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2316394lfa;
        Sat, 5 Jun 2021 16:04:01 -0700 (PDT)
X-Received: by 2002:a17:902:6b04:b029:10d:8c9e:5f56 with SMTP id o4-20020a1709026b04b029010d8c9e5f56mr10903575plk.8.1622934241245;
        Sat, 05 Jun 2021 16:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622934241; cv=none;
        d=google.com; s=arc-20160816;
        b=CQ5uvxYLD2W+6ZiIXajqRhGrHYeNYqNYfmHnCAG78yEgN9SOBto7hLAyHKIKbP9JuT
         ZtSqdZy/kjjAQRKyywA96g+AK2+jU5Sz/AJ0bD+fYaqCzsIdqiBjxzXhgk3i6L7HInCl
         FvdJCBs5o35sR+RewuKls1myeU3dVPpkwCgyLlvra+Nas3Pz+V1ZEA/yhFMQZkV+V7JS
         tXRwgUfzTQWv8aw2v5A+F0hYG6TnXQ2bb2ylrflhJhkScxrs7y3xsTS1lYJqrmyzB5dQ
         JFC2BTkzoGBAdO+AUQJOQa2eju5ZYINccjhkSHyKQtDfi281viTbKV/U2NdiDMgvcXjC
         PENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=yJyFbyBuFIKXpYw87hfnixnmy7+R6XNlootTr69lAME=;
        b=XeqGHY5mBngj58spa+YBg60Utx5YLl1EPFtJ9jFGEKQaMAYdOGehOGNkFuyzX8tHvP
         ypHuz44m/7hYVsyWebiMj7eR+r8pEvN6hLE1yrh4GtzjQHXxCDrD/V+jdFzSe9lD/qvz
         CFvwPzTD4hLb6aCceepBAj1x17KL322i0BByZ4bXh2kLMF1K/ZdvxeBpzwjV8raWcvX3
         WOxcWbEcFUFv6v1DGYP9vinU83XQ4YLX6rEghIA98ALuELm3Z49Ysh6blI6tMKQCX67m
         zaRbR6d3NALFg10b4cGDBTZKQw9ozt+hGfMjUa6xWtNrtXjrSSYLdlr/vwZwXNaiwPOs
         LA4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dh00gPK7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a10sor3158975pgh.57.2021.06.05.16.04.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 16:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dh00gPK7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yJyFbyBuFIKXpYw87hfnixnmy7+R6XNlootTr69lAME=;
        b=dh00gPK7rTIr30jv/mN+Q3np2e8cYbQMqLepkqlqgP7Rf2dmrP0MCxmb+Ja+/MHXbl
         ryCKU1KyFXscJYv+QEYsrZmiHIX8SB1oSKzCgKf1CUrKH4frImdxN8VDCzLJgiblemAv
         2YM2+DnBEmrIx/GWmD5I8vDVUYFcr/F3sVuXyU0DMWLaNB35BEpzKuG/Ns/lRKe4c90D
         iN9DnYCqCoWlti/4ARvoDi/qnpUEC2hf3rlgBPmXfinr7qS6FEEmtjR2viQWKwXDujLE
         AMzWYpK1NgEB6RbLq+chXJryl5fO5z1IkWtYiwyGictab3c6FLNHlg8XnI6M/SynXivY
         S5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yJyFbyBuFIKXpYw87hfnixnmy7+R6XNlootTr69lAME=;
        b=H97Bvn/TX1nwDRzXs9kMG/dj3td9HKKHDr8gFHWA9Amr7sHFUiS3Y8G6UCa4BI3IMT
         lhfsPvfTajVV29e1MKOZjcVpIOJX1DMptJktL7pDBPYaW2xwUZPEYgpyvztd08aYzIM7
         CfxXW+N4g/Cy7+OWGxQ6ntCh7WDSI+OVXPiWjLCOcIBe8gwpr5jH9D7/s9WXDwfEf+Ot
         jleDjUkE5K1HE6dIhoc2nnRrAHlmuNI5QcQy0XRW1womE3G/CHRBZePude8Btg2Ba24i
         /GtBitHTkXAFGsnAFCSXwrsVX5EiwvhpofEJhsvLMBDwPMEehvKsIn3KMARgqtiVxW4f
         7+jw==
X-Gm-Message-State: AOAM530m6QY+GMUQ5jyZJylNcofcEUFFMpoOD8ZpY35NQdx3zWx6qx6W
	Hb63oAo7tnBrxEnED3Fkgkvp6ESE
X-Google-Smtp-Source: ABdhPJwt5xj5F2KmodsKcbQGIW87MWHIYZ7E7UbqLo2SkIvlG0DaPY2MVN57WjzODjthgDZFzHyE4g==
X-Received: by 2002:a65:6884:: with SMTP id e4mr11364060pgt.71.1622934240838;
        Sat, 05 Jun 2021 16:04:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id s21sm4620501pfw.57.2021.06.05.16.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 16:04:00 -0700 (PDT)
Subject: Re: [PATCH v16 99/99] gitlab: defend the new stripped down arm64
 configs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-100-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <823cd2c0-6412-4a76-588e-720be9a24bd7@linaro.org>
Date: Sat, 5 Jun 2021 16:03:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-100-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ahsMvsqSaWxP

On 6/4/21 8:53 AM, Alex Bennée wrote:
> We can now build a KVM only aarch64-softmmu image which we need to
> cross build. We can also build a version that only supports a limited
> set of 64 bit images.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml   | 10 ++++++++++
>   .gitlab-ci.d/crossbuilds.yml |  9 +++++++++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index b72c57e4df..a48e723efe 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -645,6 +645,16 @@ build-without-default-features:
>           --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
>       MAKE_CHECK_ARGS: check-unit
>   
> +build-64bit-only-aarch64-softmmu:
> +  extends: .native_build_job_template
> +  needs:
> +    job: amd64-debian-container
> +  variables:
> +    IMAGE: debian-amd64
> +    TARGETS: aarch64-softmmu
> +    CONFIGURE_ARGS: --with-devices-aarch64=../configs/aarch64-softmmu/64bit-only.mak
> +    MAKE_CHECK_ARGS: check
> +
>   build-libvhost-user:
>     stage: build
>     image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 6b3865c9e8..a118aa3052 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -36,6 +36,15 @@ cross-arm64-system:
>     variables:
>       IMAGE: debian-arm64-cross
>   
> +cross-arm64-kvm-only-system:
> +  extends: .cross_accel_build_job
> +  needs:
> +    job: arm64-debian-cross-container
> +  variables:
> +    IMAGE: debian-arm64-cross
> +    ACCEL: kvm
> +    EXTRA_CONFIGURE_OPTS: --disable-tcg
> +

Any reason not to merge these two?  And use virt-only, which as I mentioned is 
a useful kvm-only configuration.


r~
