Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6196978ejc;
        Tue, 28 Feb 2023 13:41:37 -0800 (PST)
X-Received: by 2002:a5d:4e4d:0:b0:2c7:1159:ea43 with SMTP id r13-20020a5d4e4d000000b002c71159ea43mr3516717wrt.51.1677620497030;
        Tue, 28 Feb 2023 13:41:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677620497; cv=none;
        d=google.com; s=arc-20160816;
        b=0fRUY1I6UyDNmdDcrshMZRxWPNytNCiMt6XBNlicLwJSXKWoNqMlvEQ1ump4ZxEOZG
         4KRcJ26slwq+j2DxwVVOWk/smOZMmXi7VCNjC8uXrVeI2SMCf+zou1gE7Gsg7phYi+ey
         pGID+nTnrJ3nnFZ+LatwcTcu1wwYE7PT8MAQC1MkybsvlQf6NWNCE1fmkyT0D96M9kfa
         Cc6Uv13biYZzRaqcg9UN4V16m0RRMn2NP1AY/wBZa4460x3h+Y9YyCBZGWASAL1q8kZI
         OIwNWjHk2OThWNbkUnu/bpqKA//sen2WLw97QdUbLl+R/BU6wV92JKHthRjhjZO4Zi30
         Olhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NidVbJgV9MGiy8ABUJQGsBok5ojQzwtzR+nMwcr3V+4=;
        b=ln+YEadHM6tS8G6ZKUck3rYMqaAJ4N4raMQW7xy+cNmnrgC7HVTtxFNXV9jeCjuxxL
         sphsyFevNKnCBfxjZez04omdKBAEseiKsC1Wsr1+oB6p3Gt3BOLdkVAjWeR0hnR5GIRZ
         g7io6RLyAdzeNNEHOyOn8Pm7WUmoeL3MMH0rISfwcG5tTJJT4vOAAnz99dSIT4L2RiVT
         1J6tEbkEbStXktWDPEzadzi34ei6T+Qg2LwKo6QGM0ZzO3Yr3K/xTrfs030i/1O3bWGP
         DhmPMtlk3AoBhntRHApdr5FEdTnEel8mFGcnDGHO+gJVLFmYC9RQYrcOXLI4PHm6AohE
         TEiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kUOx0V7n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h15-20020adff4cf000000b002c7065ada2asor3929931wrp.50.2023.02.28.13.41.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 13:41:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kUOx0V7n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677620496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NidVbJgV9MGiy8ABUJQGsBok5ojQzwtzR+nMwcr3V+4=;
        b=kUOx0V7n/WurvEBGCTPomRDf68gIJ3ljzHpD3M8lEyw+UPSXnxROtKyMEox5lmv42R
         Q2Zu6Cc3pJINArjmJ7xNgVb5Tg+xisNbh+2ZJkNBV6yD62RpbkSq3Im138z/zOv1Dk3u
         eizkBNy8hrOhZNIynqw6Z1TOnCn3+Tz7WhvHKKvMDm/SPYG8HynYrIYHtSW4+64BMzM3
         gRKdTF9kvXSjnbL9DZ+Lv7rjU/uCWbbIEa3hRSSlxNEQmDaCSDRo9PQQeMHHWcPAeGNB
         DKuBZG+zvlBR/VhVpSZRz46RViclywTbLiafm00e9TQ/810u07q0F63rzWh+XQwVBPQm
         LkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677620496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NidVbJgV9MGiy8ABUJQGsBok5ojQzwtzR+nMwcr3V+4=;
        b=edD8w7dLn+n43n3z2sj3p33jwAFKMt7BbjJhybhLMWv7XaZiMfsFk1U1e1MtlhJhCK
         ocaPk7iwr64lLADbYHre3V15dtGUHPr51ENt1/FDtoG2vGET/0T6+L0+dw/R/OoFMBt+
         dE/YCWrf3OE3KUTIU0s6NyL5IBarKPvKHVMHaUzXs6kmQVqSJcsUtAY3GKwx/MrcDRsP
         lAUHjpqvD5BFwUOn8l0Iwfj/PjUkaWxsqiXvm1cCmDRVqhApVHmiCLukESJQM0ZCeuPR
         Gy2IuMi312fNoGNJZQGRG4tO3q3d0kl201YHDAAR1gaz3h25OT4MmgSlnRGgsfzRTGYj
         L9eQ==
X-Gm-Message-State: AO0yUKWF3EpnSnHf+2setFSDwEetOCtcymb6pNynyZTPJqmxofyvaVxt
	x/2gpc9pX0+Qd1QiClJS1uwEhSm3EWoyaptWeQ4=
X-Google-Smtp-Source: AK7set/1+agqYzpk0teuYEGGX59iqHgnHhW+l2jxq4JRrO+pqWndOHxSQxV5frMwwhBiW0XZuEdkmQ==
X-Received: by 2002:adf:f4cb:0:b0:2bf:d940:29b6 with SMTP id h11-20020adff4cb000000b002bfd94029b6mr3842577wrp.54.1677620496435;
        Tue, 28 Feb 2023 13:41:36 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.68.175] (166.red-88-28-30.dynamicip.rima-tde.net. [88.28.30.166])
        by smtp.gmail.com with ESMTPSA id m7-20020adfe947000000b002c70f5627d5sm10605279wrn.63.2023.02.28.13.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 13:41:35 -0800 (PST)
Message-ID: <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
Date: Tue, 28 Feb 2023 22:41:29 +0100
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
X-TUID: 307Hjsu7yEcB

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

This is still kludging the fact that 'make check-qtest' rebuild
the world even if QEMU binaries are present. Still an improvement, so
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
