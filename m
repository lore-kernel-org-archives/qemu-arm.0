Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp804081ejb;
        Wed, 15 Feb 2023 11:52:25 -0800 (PST)
X-Received: by 2002:a5d:64c5:0:b0:2c5:5349:22c1 with SMTP id f5-20020a5d64c5000000b002c5534922c1mr488057wri.5.1676490745348;
        Wed, 15 Feb 2023 11:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676490745; cv=none;
        d=google.com; s=arc-20160816;
        b=woYEbblgzpaDCpSNniMikkRA/lnJTr7/rGDZmlgNx56l//yBOba112dh38TMEx/zGI
         0RT2j2awcEzVuv75nhUzMDtpZyY3WTJI0lr+cshfogUPpxIs7y7IwUyj5fm35Mueb1Dq
         5YYOQzIwqsKe9cQ23vP8+FRvQ7qwvXyARgUBw2aVJJaGKWLNx+Fvdt7O159JBAXtsLqQ
         bmBPl1j58P3qAczoXXQQtEFEX1MiPaZsrUFjkjn67E0D8Sii+Xe8mjs38vTxzNYJPCXD
         VBdN3fDV9upqeZEdH3GUYFETQdD9F0pxpzmPufbkPjJ0AIqsk1KKcqKC+MbRF3JazKGv
         ZaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pv48IS0bIEUWeFjNSuZrUxV14PF1zqOzJD0ZOch69Ys=;
        b=A/chBMxPtlwPWapTKv8iFD1ERc+xhNR/XhsuubZSV6NT+RqHotHdkmFW3YIzvxpJDz
         ZdvMcrGtuqlv/pyrsUdsGedeD0nEAIBRV8XuaqI6Wy/PX3nH4vDzy8pMslamN8A3PeUa
         W6kWjRitq4bprrmP8g01E1SE/+EKpPJQC4DkPGy2Bxjl3zc9fsNYVhyYZgPiN/XJHnut
         qSpVwODBHzyBwJyVZ2L+NKWLEaX5G4J2eXBCpneL1s4fpbUNV4TZnQqG0Eb8iv1nO570
         0MDAdb1GuiJqnb5FPmtGUheZsl29yZlcHqFVE2ebzPHNbm/AoS9ZuWR7k5e41iZfI04a
         pzsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o8yNcngr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u4-20020a5d4344000000b002c3f76f78a9sor8222558wrr.43.2023.02.15.11.52.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Feb 2023 11:52:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o8yNcngr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pv48IS0bIEUWeFjNSuZrUxV14PF1zqOzJD0ZOch69Ys=;
        b=o8yNcngrU0Ugx6aILIA30qpSK0Bufv8E0dEpOHm/EBzd+PM0YBbVcilcv5DHUExCkM
         rs0LXVgaP14zRbNx2+RXGRYE6yQ5ls8xRSs6K+iQXwvpcxo1BsTa6vRX1FWekqdQUEfQ
         kjUcQi8y0kJ5z7OYJ7MlWqUmF/GergRIDva3p93OpHuJjlbsDEgozsxFkq0Iv4SbBWm4
         CeXC/LaZV36cPXHIArMJGfHYP8ypUNEU1JpCwsmFbJIjJggqYMFNhbOCMQ882GyA1AFJ
         O3QBw6k6DunuR5qp/myqWVkpRPErOiu9CBX0+lD6CUI8sLy0fsoquhNtfw78ta9fkQRr
         tObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pv48IS0bIEUWeFjNSuZrUxV14PF1zqOzJD0ZOch69Ys=;
        b=no7j8nguHX0cevn5/rFRwfkKiU7H6tR+Ws/M581d5Q6XzV1nLZCVdl8N02PgVFB/Ej
         Cb/vWyop6fZlFvIQ+Sf8a2cir9kPwqKKy9Vv+5mLWE8rIzoRY0f9JPk3V1FO4ro1G2Tk
         Bfsib3ImqIfTPpHsgNz60WhW3T4kt4z3jL7C0j9BX1zJfskxK2kOuAtyRE4LYu/At6r5
         MZG6Yungxuu4xy+axmYLP6g8a2TpLcPXnLQzsa6tvBEED9dC/VYgENFWKgVi3Fx9y3yx
         BAtFFGaNij5HAKJh+JOqPW0myP4rE8FOJxDyWq2Ooc6NE2ndjOWEJGztEIISl9vOhjzl
         5DDg==
X-Gm-Message-State: AO0yUKUZviDzTyUE9aqzBhY9yn2JzfmLUq8W+Jz7ukplv3pbZjwjp/ff
	3kE9JGXye3Z9YXgX0xvyZbTdrRgsqi78njE0hJo=
X-Google-Smtp-Source: AK7set9o5mu6bSAo1kbfDAmFjefIL0TeCZzX2GXEs+5LGsFY//FG9IXjn7pdU9oY4AgJPH0crruaHw==
X-Received: by 2002:a05:6000:787:b0:2c5:5916:e902 with SMTP id bu7-20020a056000078700b002c55916e902mr330528wrb.17.1676490744714;
        Wed, 15 Feb 2023 11:52:24 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id x1-20020adfffc1000000b002425be3c9e2sm16509304wrs.60.2023.02.15.11.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 11:52:24 -0800 (PST)
Message-ID: <049ce408-e1e7-6bac-0fef-654157a5f984@linaro.org>
Date: Wed, 15 Feb 2023 20:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 03/12] tests: add socat dependency for tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2NjvXYLvB77/

On 15/2/23 20:25, Alex Bennée wrote:
> We only use it for test-io-channel-command at the moment.
> Unfortunately bringing socat into CI exposes an existing bug in the
> test-io-channel-command unit test. For now disable the test with the
> preprocessor until someone can diagnose it on Mac hardware.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/unit/test-io-channel-command.c                  | 4 ++--
>   .gitlab-ci.d/cirrus/freebsd-12.vars                   | 2 +-
>   .gitlab-ci.d/cirrus/freebsd-13.vars                   | 2 +-
>   .gitlab-ci.d/cirrus/macos-12.vars                     | 2 +-
>   tests/docker/dockerfiles/alpine.docker                | 1 +
>   tests/docker/dockerfiles/centos8.docker               | 1 +
>   tests/docker/dockerfiles/debian-amd64-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-amd64.docker          | 1 +
>   tests/docker/dockerfiles/debian-arm64-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-armel-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-armhf-cross.docker    | 1 +
>   tests/docker/dockerfiles/debian-mips64el-cross.docker | 1 +
>   tests/docker/dockerfiles/debian-mipsel-cross.docker   | 1 +
>   tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 1 +
>   tests/docker/dockerfiles/debian-s390x-cross.docker    | 1 +
>   tests/docker/dockerfiles/fedora-win32-cross.docker    | 1 +
>   tests/docker/dockerfiles/fedora-win64-cross.docker    | 1 +
>   tests/docker/dockerfiles/fedora.docker                | 1 +
>   tests/docker/dockerfiles/opensuse-leap.docker         | 1 +
>   tests/docker/dockerfiles/ubuntu2004.docker            | 1 +
>   tests/lcitool/projects/qemu.yml                       | 1 +
>   21 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 425e2f5594..f3c34152ac 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -31,7 +31,7 @@
>   
>   static char *socat = NULL;
>   
> -#ifndef _WIN32
> +#if !defined(_WIN32) && !defined(DARWIN)

s/DARWIN/CONFIG_DARWIN/

>   static void test_io_channel_command_fifo(bool async)
>   {
>       g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
> @@ -128,7 +128,7 @@ int main(int argc, char **argv)
>   
>       socat = g_find_program_in_path("socat");
>   
> -#ifndef _WIN32
> +#if !defined(_WIN32) && !defined(DARWIN)

CONFIG_DARWIN

>       g_test_add_func("/io/channel/command/fifo/sync",
>                       test_io_channel_command_fifo_sync);
>       g_test_add_func("/io/channel/command/fifo/async",

^ Clearly another preliminary patch.

With the split, for both patches, using CONFIG_DARWIN:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
