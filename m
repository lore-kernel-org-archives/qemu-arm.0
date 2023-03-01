Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6797866ejc;
        Wed, 1 Mar 2023 02:44:09 -0800 (PST)
X-Received: by 2002:a05:600c:997:b0:3df:fa56:7a33 with SMTP id w23-20020a05600c099700b003dffa567a33mr4643743wmp.26.1677667448810;
        Wed, 01 Mar 2023 02:44:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677667448; cv=none;
        d=google.com; s=arc-20160816;
        b=wiBYqlNyfBlmWoTkmD6J+ZHdDfXj+PcEwZ1UHfisZCp9HfQ5wfyEws7V6hPMtQQpkA
         cHSEIXpF2kmaELHrk/+aQYLFQfbWhvSQbf1TK7LvbltU73JTr3n1f+2NYlS4qWeqE8MR
         kSPvgsxJvJirdULZgmZhY5CWi85r0fX1sGYdilN+hXSxoyGUx7zpv5D14s0BCUoJeuLt
         FlobsMHcNAzP110U9FaaNkCOguhZ/3oKPRZcAeQCdIUWdkbmUIs78r7Ij8lojeenBWwP
         BcZplkril8aDwejFEF+fPqHJCcE42rgqFjJiTFdxwRfkG1dXjaO74vwHjjI9O68JVffh
         Gtpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EWILjlbpqPDkwwgYhqqVnHdu6hv7prnzqRtq851YOI0=;
        b=oE7UIVwnThbfsD7xucmZG8dOGzcimSZZEi2UQEbH2CBH8wa36qscFK07mBFo12bJz8
         bUKo9Yzfz6CCmmp+O6QHAPk2Um99wXwiOV933OLpxAgztg8cEbRbsgYxg4qEyPhppVrz
         3CjR++Wt9KahgyoAAZ68WGldvGbEc5XlQWN9+fDcjOnQSAEkGos6v75HDXfcBH7DWyt4
         I77UTbS4s1oXfo7DA4jVVXWd7Jg1WPIxLuCdfkJ1+0bTV7TmYMYz2ptU6w9xxZRF17t7
         j9gAwF2o1sZgBCmkP5uoIBrxW5utZQzjch+CMt2ksqHNnf4F9aytjedslyCLopBWeAHM
         K8lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H3sPnI9/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bg9-20020a05600c3c8900b003eb395a827esor3140275wmb.25.2023.03.01.02.44.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 Mar 2023 02:44:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H3sPnI9/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677667448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EWILjlbpqPDkwwgYhqqVnHdu6hv7prnzqRtq851YOI0=;
        b=H3sPnI9/l/R74Ht4pkgzonoVdbBUGE0QLdDwfu+czWaTOQpGPpkS5d6DRPfsAc+8fA
         ncckvYVO5CYlr7Wpj7V31TRS0UAzkB8a04Z/zuqrKAnw4rCshRjOybkOnoAyYlTDPXYi
         is19d1mRwZwp7laOmJZiAGXw860oMMKs/ZPiL/iAsvJUZflLS9ZVMA+5yCXgZHwUGCy2
         p62bpls9/fpsUJlr3/dXGMw0LjS3eO1PleaOpc9dO491nY2Xt8vTM16U9L9JkkkXFXpQ
         4CjEtLIMx+erWyyyfA6OZMPNrSL3UF7//bY12YqOYfDko77gq0UkB1XIMLVvVEy2wdV8
         i+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677667448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWILjlbpqPDkwwgYhqqVnHdu6hv7prnzqRtq851YOI0=;
        b=VvCUpLSbany76rV1DzATH4E96JVjV40zes90GyOLJW9EeZ1XQ2kCcop6AueM/XHv3D
         Ou4Bt9x/1t3joWlx50EihIYObo8GrMaY+nqMQ01eecEXT6i36/DXxuNml5aIj+Nniqn3
         CwMN1hKqZosFoHXAd/xaSRFTVVBynt1hoM3oOWI2Oi5bv1wwl5Ina2Dxw3q8hJakdQxk
         4Fy7A1qk9UC659un5Y/HtU4jDLgkjp2+IN37/1VvkqTlkFyVdFjIOKql0qbgNmEeJujN
         Bjw9dAoDxyqoDeydRl0T2SJqMQ4o7mbh+2Vzj0zDz6A9Fe39m0ECjTc7Qfdt+HWBsQpQ
         OSbA==
X-Gm-Message-State: AO0yUKVPJ1SmWhcWXgKS59hkWYAcnl9zU5QrnqlXvaw7oOYtgBcmyhEx
	zAk37f8+k59iGjYNikDXvHj/gUZZFRU9/l3xnAM=
X-Google-Smtp-Source: AK7set9foEZT8aN6zPnA937hIN3w+Of3XoY0wJwfCDGRfy9EGf5pqE3pqH407VI/0GsxuMUfxm8fpA==
X-Received: by 2002:a05:600c:4e88:b0:3eb:3945:d406 with SMTP id f8-20020a05600c4e8800b003eb3945d406mr4669280wmq.16.1677667448276;
        Wed, 01 Mar 2023 02:44:08 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id i13-20020adfe48d000000b002c5539171d1sm12459113wrm.41.2023.03.01.02.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 02:44:07 -0800 (PST)
Message-ID: <cce553f5-fef9-28d0-8e4c-2fc0d82a02af@linaro.org>
Date: Wed, 1 Mar 2023 11:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
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
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org> <87a60xe9q3.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87a60xe9q3.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Yq0d8Bd5clzf

On 28/2/23 22:55, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 28/2/23 20:06, Alex Bennée wrote:
>>> To avoid lots of copy and paste lets deal with artefacts in a
>>> template. This way we can filter out most of the pre-binary object and
>>> library files we no longer need as we have the final binaries.
>>> build-system-alpine also saved .git-submodule-status so for
>>> simplicity
>>> we bring that into the template as well.
>>> As an example the build-system-ubuntu artefacts before this patch
>>> where around 1.3 GB, after dropping the object files it comes to 970
>>> MB.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>>    .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>>>    2 files changed, 46 insertions(+), 51 deletions(-)
>>
>> This is still kludging the fact that 'make check-qtest' rebuild
>> the world even if QEMU binaries are present. Still an improvement, so
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Is something being missed by:
> 
>      # Avoid recompiling by hiding ninja with NINJA=":"
>      - make NINJA=":" $MAKE_CHECK_ARGS
> 
> ?

Sorry, I wasn't looking at the correct pipeline.
