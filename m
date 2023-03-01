Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6645838ejc;
        Tue, 28 Feb 2023 23:38:05 -0800 (PST)
X-Received: by 2002:adf:ee85:0:b0:2c7:1a86:aecd with SMTP id b5-20020adfee85000000b002c71a86aecdmr4328255wro.2.1677656285133;
        Tue, 28 Feb 2023 23:38:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677656285; cv=none;
        d=google.com; s=arc-20160816;
        b=tWDWM7W7Vh+LVbsTwTtf3qCYkwdFQ4YRLc9YSmPriVp3qjZCHwvj6OQXDh0Nyo2Lq0
         Vqz/o10qZU7d5OU3ADX/4cYQVWsJOR7einK1qZXA0BH5n5jZg8FdHD2CH0QvL5NzSPTw
         KVsf/3jPKDDugzCv7VycgmJqpR/1Crp7WPzcqaxqNJcn//BRyUAg/hQbD+dE25IuSzns
         V2AXRVNbMw++/RyIaJdcI5WTQK3tcDwstcKyorfd4n16jYpxajmcpGXXlkQRkdosRq3n
         /hR1ZBi4iH/hvjCAcuGcSRdp/aTdkpgNQqFGZaQYnyIDLyHx4LZI6099FKdNzPYGo3GP
         +6IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XUpEQ/uHIC4kK9X3lf1DvjLD7Irehy2VfpQRNjmVuAs=;
        b=suN4k7R35AzBo+0YAC8TbsGOu5GAkMrpLttNFRm0mL7HQMFP53iFB3g73vZOe4/ZnU
         KzYxpGhRQwTjOL7tf7tSZ2EbyXsm+veYDfoi42tUJKqM+x61RuhTkYB55JBfzUKbYoiV
         d5RmFaStBc0S2+lO5UDUhrlrzS2+16JXvchjgl98Anod8uBOWu/x9sBS7gAEZq69DIeU
         fejBFBBzVfy9IsHcsTAKtqgGfWLk9ZZmuFnjeyc0p8LbxoPY9NxDjX3JaJ4Za8R3SLck
         Vk6iLccbeWpVVRbgkEV3TFIN5owvrkquo4DpINB6ldU0MYPJL4y5jN0VXRb6DM9KhHSG
         VN8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/k+yPnE";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t11-20020a5d42cb000000b002c54d9b8295sor4442833wrr.19.2023.02.28.23.38.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 23:38:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T/k+yPnE";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677656284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUpEQ/uHIC4kK9X3lf1DvjLD7Irehy2VfpQRNjmVuAs=;
        b=T/k+yPnEnNDGWwtdfjmSYseiBlXFDUZJKGYIF8GG2G1lzHTmmHEw28MBXuXr5ngjB+
         9ra3OS0tjmaoz4aeChGke5yaugWPw4DwC92JHHyPLG/3TRT8UeTxDn3KmbTU5nxHL9RJ
         C5RGB4PsoBmOROlbmCWDroZCwYhXp8hr9k1U766/fQHMX37LHQs6C9LFNDItYSj4KPqr
         Kh3cDQrXwH/IJEIQhCMXXo88784ZKyQeuJs+TPHy1yrwRJ/5KvIMvrAx7txmf6xG8w4/
         bKxnlSiWjucYlH5x7GOPIoklYucSDpEVEtsGEFYbRhPa1CZAZ1YIWVesMSzRmBN8AuDb
         wyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677656284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUpEQ/uHIC4kK9X3lf1DvjLD7Irehy2VfpQRNjmVuAs=;
        b=eyTvn+uVOMQhPyhyJFJTgGvqnzx7zRZbYY/8Csr4HR+i6lH3oEqDCPLL9cLNF+J0os
         wgQRhj/7mO7tZU+HfJE1ZPWzZ7kvt/wTkpVVA4iSGZ2mYuLAQxIEZMc+hMevTJJARILb
         O0h9TprSTSJPKdqKMaEtsHevSCqqOd0i2cWZrBYKiaF2Ma6dS7UJPV7NlaMJC/baxPWz
         ZJJy3vTH7KZjLv4IEpjF+O/cKdd9QcklFU4SrYHkDRIUvnV3ZKeNXPtGCCdxI5uSyHHU
         dxMrdoxSMtx9RtxxP56bXAQNz4tUlkcDAiZS0fo24uaT/sI+eIvnKbs3Hhawou+tQ7UK
         S3bw==
X-Gm-Message-State: AO0yUKXn5U+bPX2se1hHF6FTXWgmifKeos2TdbfF9bRsmjJILYXSESx3
	DVNAcb/mWr1MG46kgGQoWFCTwgvNskAuvyNyg2Q=
X-Google-Smtp-Source: AK7set+rXwvHDB1VgYk4qgSRVgkEWkfsYaTY0AHsrala+3ya5lCvJOOtfFyhWYGrZixe9aBZeGZxCA==
X-Received: by 2002:adf:f44b:0:b0:2c8:5f9d:9f6f with SMTP id f11-20020adff44b000000b002c85f9d9f6fmr4938814wrp.10.1677656284511;
        Tue, 28 Feb 2023 23:38:04 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.18.115] ([91.219.21.246])
        by smtp.gmail.com with ESMTPSA id y18-20020adffa52000000b002c55efa9cbesm11643744wrr.39.2023.02.28.23.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 23:38:03 -0800 (PST)
Message-ID: <db096848-11a3-b6da-93f1-b53a26a477f9@linaro.org>
Date: Wed, 1 Mar 2023 08:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228190653.1602033-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: D1FJ9RzxY63S

On 28/2/23 20:06, Alex Bennée wrote:
> To avoid lots of copy and paste lets deal with artefacts in a
> template. This way we can filter out most of the pre-binary object and
> library files we no longer need as we have the final binaries.
> 
> build-system-alpine also saved .git-submodule-status so for simplicity
> we bring that into the template as well.
> 
> As an example the build-system-ubuntu artefacts before this patch
> where around 1.3 GB, after dropping the object files it comes to 970
> MB.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>   2 files changed, 46 insertions(+), 51 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index cb96b55c3f..a6cfe9be97 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -25,6 +25,22 @@
>           make -j"$JOBS" $MAKE_CHECK_ARGS ;
>         fi
>   
> +# We jump some hoops in common_test_job_template to avoid
> +# rebuilding all the object files we skip in the artifacts
> +.native_build_artifact_template:
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build
> +      - .git-submodule-status
> +    exclude:
> +      - build/**/*.p
> +      - build/**/*.a.p
> +      - build/**/*.fa.p
> +      - build/**/*.c.o
> +      - build/**/*.c.o.d
> +      - build/**/*.fa
> +
>   .common_test_job_template:
>     extends: .base_job_template
>     stage: test
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 43f9e4a81d..44b8275299 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -2,7 +2,9 @@ include:
>     - local: '/.gitlab-ci.d/buildtest-template.yml'
>   
>   build-system-alpine:
> -  extends: .native_build_job_template
> +  extends:
> +    - .native_build_job_template
> +    - .native_build_artifact_template

I'm confused... Apparently this doesn't work:
https://gitlab.com/stsquad/qemu/-/jobs/3847747681/artifacts/browse
