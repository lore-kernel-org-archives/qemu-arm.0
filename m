Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2024064njn;
        Mon, 13 Jan 2025 12:47:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXT/vP6dSvgR40SYkqTFXMEqoLZO4W9GQ1cxdPiuQe8OKO2OvrcvH+85qDFwb+i2oBGQ6mTaYYPnkw5Ng==@linaro.org
X-Received: by 2002:a05:6a00:3912:b0:72a:8cc8:34aa with SMTP id d2e1a72fcca58-72d21df2fb5mr35345962b3a.0.1736801254000;
        Mon, 13 Jan 2025 12:47:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736801253; cv=none;
        d=google.com; s=arc-20240605;
        b=hzQvXLR6QYRCCXnaif9k3m8aRy286uly2nvLU1+pjzdYZ8baWYIVsFllr7EGDnognV
         /ZdDdGO5o5d8kBcPfLy0435/zD+D1/CFea3A9pSdXNHVFnaFD6cX5U3DfAXGEYgo5c46
         pOSJM7a6aqapIXUdeYE3keQTbH8Blt37Z7rw8mLP8zVCSulBe8RSFSC2RgBP0ytW0jfq
         01ixK9pWQPPWKmh/xFWrnZ4uRmCQuoJfxWVQoPFrVvSTAQdefuJ9o4hN0LEZbJPV3nAs
         VUrSG2Vs12fF2AHCy41Y9pngDvsY4xQfvUsoTzKDQKX2sN3/7ielDn4qsUjVeSyi9wkW
         9+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iSpRzJS58+XCV/UTHd9T6bQL6dIENzuXvmusP38uUC4=;
        fh=EkydWbVufLqTjbiXKKNktfOhCoPN/wSWE25QQSdH4qc=;
        b=evFaszqeV0uyLarDPq2mVwlmKp+ggzI1juXgtAnIgk3iAZ1JSI6H4Tu4pc64aA9qcG
         SG4B7sKGOj2Iy8MVCIALb9N0Tq7YdmSL1aYFR2GdP0W9CokUkYvjNsbhWBYLjS7Z3ibd
         /wwU/S9xK7qsz1RjDIVd8tDQGMNhtcTlB/7835vLSLWNRLVS0SKmRnh/L9128LdYzG4K
         nXL6dA0f1jxzj9rGStEAGzeHqsWq94hGZnXzSCT5FZLNF8b9MuJl222XO2WZBSXSCc5T
         7EmoJ8HdIgyBSEEbntiBFIQwhd2n7KXAYQO56PDQb0tkakFNCa9mvFQ5xB03JlF18WLY
         3epw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uactfvHt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72d33f3ee26sor7886634b3a.3.2025.01.13.12.47.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Jan 2025 12:47:33 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uactfvHt;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736801253; x=1737406053; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSpRzJS58+XCV/UTHd9T6bQL6dIENzuXvmusP38uUC4=;
        b=uactfvHt6rnti4xWlKXgwAA51fHjIkzURG+TV8ItCYLmbM5VeEobhJZAWZ+E153xOs
         ZbK0WbkjYKnoFehMCGsiYkUtTKYWMniYkKxpwR/BuIFuUEMzs2b2gk1WjLqaT3qFDrP/
         yjP8hxHkpgIyUXIYfEC4WpkpabrbzXlKxmIk4invlL9jNh3hKy3+lwr1wFW42I6HMBln
         9wwzDNzhwAdoUj6gLU+APnIztDPXG0X7wG5mWCpX28Dv+HSm/bDxtbW4V8ddMD/f8UOE
         K00YMdKZUZDi/ddmgxRynp6GLjvsbRmtqxaljj25EA3na5bfg2xlnQ8GDv48iR3oI2va
         AgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801253; x=1737406053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iSpRzJS58+XCV/UTHd9T6bQL6dIENzuXvmusP38uUC4=;
        b=cGKz0yye8iOeHJKUhFaSEDSdX4ILZRXpEkAH6fJYp0gff6wjfiFZOiT2nVWIefcm+d
         /JRnkIb4708Tg+0KuPxTBwQmaE7Rxewcx4qmWqcHA/ws43lmYr7aLIly3JSUvgqEx+Gk
         16dX//LOGY0Hc3VwPbY5Nr2T0JD6ffOHTidalSt88veq9UxCdvtMZtbtUmQ79lM96WrP
         xSVpEuQLx1uBUh8sNwo8VlHJLmaKr3GWU3uCgzudBZ7DVC3fU/pVbWbgMFFPrE1PqMqi
         KSUaiwZhiitaHM0SeMr/kFIOUHLO1IcwXDrvY8p5uneXNZIk8XDur0k1uugqPATg3M/r
         Fi9w==
X-Forwarded-Encrypted: i=1; AJvYcCU0DP1EOWChxVLl3ZSpqCcjY91IYCukEPQ3LpzIvu24gETSkuvoYECeZSVAicgnLdwt/bl8IXP78A1HIw==@linaro.org
X-Gm-Message-State: AOJu0YxZt66/Z+rpaHRqPOOdKba7mmftKYLLAkGRK9tbbBxaD3wXLP0f
	cHod9FS9a5DupJYAnPMwzOMSRCfV5XtzmLvzyUlLerchXN5EcEFz2fvIb33AolWuAA==
X-Gm-Gg: ASbGncsn74Md1U9jaH0mC7DBgf+oBcoabtsM1ZhAvuYCcQxqErCv8uZ9K8wPAfA8vX7
	3antaNTb9yWgisGCTBlOcg5Q4tWY/qEpCir2wW6H+MhfEpSt9vC2CjSRrj07Z7jyh+ttT81JXTl
	8HvuL3gz5HiCRaxyqekOlw43VfpmfbduRKptrwSjbAHl/MCfPZwe8idQerl/ZE+7hKEDsplRTD4
	cWEmAqt/ixUT2iPcAWegyc/zZt3pmsuGHfiSh9xk+m2VQeuEkP9BTtEX7OhVrAGVF2jfw==
X-Google-Smtp-Source: AGHT+IGbC+ClgfWQHiGFak830382rHucPPraHeqFoOc5HTzidWB8BL/bKsXX+OJhRoN7VoFroz/OvA==
X-Received: by 2002:a05:6a00:1152:b0:725:f282:1f04 with SMTP id d2e1a72fcca58-72d21fcf2d9mr31928642b3a.18.1736801253336;
        Mon, 13 Jan 2025 12:47:33 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406a9433sm6371563b3a.176.2025.01.13.12.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 12:47:32 -0800 (PST)
Message-ID: <55932eae-bc2d-4c22-abc4-5c9c04612281@linaro.org>
Date: Mon, 13 Jan 2025 12:47:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Enhance documentation for new developers
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org, Andrew Melnychenko <andrew@daynix.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-block@nongnu.org, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>, Kevin Wolf
 <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 Fabiano Rosas <farosas@suse.de>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, gustavo.romero@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: W6oVNYE/rN3j

On 12/9/24 10:30, Pierrick Bouvier wrote:
> This series extends our documentation with new pages to help developers
> onboarding on QEMU. It focuses on providing a big picture of QEMU (to a
> modest extend).
> 
> As such, it was written to be simple, short, easy to understand, and pointing to
> more details. It provides another way to dive into details instead of simply
> hitting the "search" box.
> 
> The first patches enhance the existing developer section. They provide
> information about b4 and git-publish, two important tools that I learnt from my
> coworkers, and were not presented anywhere, and were really missing IMHO.
> 
> Then, we introduce a new Codebase page, presenting (succintly) the various parts
> of QEMU, and what every folder of the codebase contains.
> We then add a glossary with the most recurrent acronyms we hear in our daily
> conversations on the mailing list.
> Finally, we add an "How-to" page which present how to build and test qemu, and
> how to contribute a patch. It's definitely a repetition of existing information,
> but the goal was to have a self contained page with all the commands I run
> daily personally, and that someone would be interested to have.
> 
> When reviewing, please keep in mind this is targeting someone who discovers
> QEMU, and not someone who contributed to the project for several years. What is
> obvious for you will not be obvious for a random young developer.
> 
> That said, please free to point if something is "false", or "really incomplete".
> It can be hard to summarize in one or two sentences complex parts, but that's
> the intent here.
> 
> Your feedback on content or organization is very welcome!
> 
> Thanks,
> Pierrick
> 
> v2:
> - removed how-to section
> - integrated all suggestions from Daniel and Peter (thanks for all your comments)
> - Note: build environment keeps mentioning windows-arm64 because we solved the
>    issue with gcc_struct attribute. The related series will be merged before this
>    documentation.
> 
> v3:
> - added a comment about git-publish asked by Daniel.
> 
> v4:
> - add suggestion from Thomas for codebase and message-id.
> 
> Pierrick Bouvier (6):
>    docs/devel: remove dead video link for sourcehut submit process
>    docs/devel: add git-publish for patch submitting
>    docs/devel: add b4 for patch retrieval
>    docs/devel: add information on how to setup build environments
>    docs: add a codebase section
>    docs: add a glossary
> 
>   docs/about/build-platforms.rst         |   4 +-
>   docs/about/emulation.rst               |   2 +
>   docs/devel/build-environment.rst       | 118 +++++++++++
>   docs/devel/codebase.rst                | 220 +++++++++++++++++++
>   docs/devel/control-flow-integrity.rst  |   2 +
>   docs/devel/decodetree.rst              |   2 +
>   docs/devel/ebpf_rss.rst                |   2 +
>   docs/devel/index-build.rst             |   1 +
>   docs/devel/index-internals.rst         |   2 +
>   docs/devel/index.rst                   |   1 +
>   docs/devel/migration/main.rst          |   2 +
>   docs/devel/multi-thread-tcg.rst        |   2 +
>   docs/devel/qapi-code-gen.rst           |   1 +
>   docs/devel/submitting-a-patch.rst      |  44 +++-
>   docs/devel/testing/main.rst            |   9 +-
>   docs/devel/testing/qtest.rst           |   2 +
>   docs/glossary.rst                      | 280 +++++++++++++++++++++++++
>   docs/index.rst                         |   3 +
>   docs/interop/qemu-ga.rst               |   2 +
>   docs/system/arm/virt.rst               |   2 +
>   docs/system/images.rst                 |   2 +
>   docs/system/qemu-block-drivers.rst.inc |   2 +
>   docs/tools/qemu-nbd.rst                |   2 +
>   docs/tools/qemu-storage-daemon.rst     |   2 +
>   docs/user/main.rst                     |   6 +
>   25 files changed, 709 insertions(+), 6 deletions(-)
>   create mode 100644 docs/devel/build-environment.rst
>   create mode 100644 docs/devel/codebase.rst
>   create mode 100644 docs/glossary.rst
> 

Gentle ping on this series.

It was reviewed and it's currently waiting to be pulled by a maintainer.

Regards,
Pierrick
