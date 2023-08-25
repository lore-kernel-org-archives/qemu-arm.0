Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1218558ejc;
        Fri, 25 Aug 2023 00:38:39 -0700 (PDT)
X-Received: by 2002:a05:6512:3c96:b0:500:a092:d085 with SMTP id h22-20020a0565123c9600b00500a092d085mr3682994lfv.68.1692949119720;
        Fri, 25 Aug 2023 00:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692949119; cv=none;
        d=google.com; s=arc-20160816;
        b=sWSm7aO5QRAJvcfWY+RTNM5YoDtlogQhkIABTjJMCB/0scsYqLIA1PShSXUe5kGxbu
         dUWCMU56R8b58iiXpfrLILOMBHPqMtUznPF7XfVnDMaOsrmXJ/SXeth+jRFEFYwxjUcR
         R3N6IfrJNZqZxD6zqtmcY4NZM6rdbq36RgMt/QWyric/dnrfSluabCVP0qgzUT6U4sCK
         F7ULOcj0fKHjIAI1SsXqdqwfdI2T2bp7s5pKJViqG8v5/G+JTwtnuHtaIWQBBpVHcBaH
         1iwFDWhBx6tZxq8w87+IoZyvpLgvLp1g6k2tYd8AdHu87CmfxkPgKxY85KpXMkoeIbBS
         aPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=m7FPeEhgkdsBqicWrmJ6zgHv8Z+lpIGsCg02gKRccgI=;
        fh=qmZ05mhLeMuz4yNBZ/q0UYaw6VXqQk8kLliJ08JnGGo=;
        b=shMXg4WU3F6hprPPdSoInPABDQHBPRni4bDrbMRANswDwvDWtmH/1VjrLvjwmGHaxU
         CjT9Fvng78J4hHRdytg3P/37otRKW+zgU4tLpWMawf9VR0tDPrKeIJFqg+rt+MEG39MB
         rSqTAOtxxPFXJ0U1/TidMcw7wH5iNcAcpkaKIOkYMRxHSPcmNj8bHYzkzVSCh4M+6TWa
         eJX7YQUtiBDuRlJMUjqMWRh6vVRLmeaNKiDlTEAj7yQRgcy1Nz79+93YIdvoXJEEbv+p
         d+xBSmZ1+oXC4peyga3jLQdeSXBCwbsOoiVds92pnevvbbX+fdhypgPcSCKf44mvJLNc
         cX+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ea1RxAYT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f27-20020a19381b000000b0050091c19647sor414917lfa.9.2023.08.25.00.38.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Aug 2023 00:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ea1RxAYT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692949119; x=1693553919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m7FPeEhgkdsBqicWrmJ6zgHv8Z+lpIGsCg02gKRccgI=;
        b=ea1RxAYTEFcIpZ9wrxWPivzpnIszV/U8e2axYgyt/R8y3iN/yhIe3wIjpd6Cey6Cls
         5CPZNG3Dh6zWqHdsy/rBGQzBVN39vi4SyI1RpEpk7SkZCLG4mM7rv39N3f0ArXCE8hKi
         vmjRJe6YNeCfQ0NHtwr4Edo/JZ7ZoYDkRZgDIoVSGAl3lwR810TzDgJ/tSef6//3f6Z2
         L3BvXWI7Hn5sCbj6MImGAXZzXC61fvjIXdUfMoeano19Fwal4y0WVAVkHec0pJTISnC9
         Qp3abSDRldUvvAsR27G1vuBKJEgPfpEKNy+JZpjcp2uTlQazS++gH3CQrT4DBaHi7rNq
         9Nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692949119; x=1693553919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7FPeEhgkdsBqicWrmJ6zgHv8Z+lpIGsCg02gKRccgI=;
        b=K+HTeaQ+RTGUNREUR/nuIGLk/LLtf9hpsiQCu0KjjPiQ1guF1lrJlrBmgh/4oQD3mY
         KDpqLJhkCFduex/5J0f1K/hhDHV1+QQUqaCqs5roP56XhzKRDfVSdEekg1ESnMxRF7bS
         m39/rp39IlcGvbXctGEb7w4LVkTid6WWjuJFewN2Iv0RRdKc39Tg/PKyyhWbQncKmUEN
         xkSCuTalN0GIFMTnzeYkyjGTUGQ/fnt3Tto2BYzfAc5JCo7Ip4eLr3xOUg7baicaHr1Z
         GOz+uzZjTqutWHhNvnJYziKWevtadMuo3axRme+nyu5uBmV6+3EdDWCO3xU1tVbF1plQ
         TWUQ==
X-Gm-Message-State: AOJu0YzqUAc7OzJ4vav694NV+RqTU/5b9boPEdoaTX9voEJFLp7hEm+t
	EpdQEDZaXPu2B92pyHUX54pWkZ5pAxA2NHuwpEMvYg==
X-Google-Smtp-Source: AGHT+IGLwCnb+HEkuehovrYsNTfkcrX9pGGcSeXMyrxX8gkl4rochpy7a+NcpScIncU18WN2DsSNug==
X-Received: by 2002:a19:e001:0:b0:500:a2d0:51ba with SMTP id x1-20020a19e001000000b00500a2d051bamr2282690lfg.44.1692949118848;
        Fri, 25 Aug 2023 00:38:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.164.69.26])
        by smtp.gmail.com with ESMTPSA id a5-20020a17090682c500b00992c92af6f4sm663584ejy.144.2023.08.25.00.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:38:38 -0700 (PDT)
Message-ID: <72ab2316-f80e-3e53-b40b-181fa034d724@linaro.org>
Date: Fri, 25 Aug 2023 09:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 01/12] gitlab: enable ccache for many build jobs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-s390x@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230824163910.1737079-1-alex.bennee@linaro.org>
 <20230824163910.1737079-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230824163910.1737079-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mRquGu0GbNex

On 24/8/23 18:38, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> The `ccache` tool can be very effective at reducing compilation times
> when re-running pipelines with only minor changes each time. For example
> a fresh 'build-system-fedora' job will typically take 20 minutes on the
> gitlab.com shared runners. With ccache this is reduced to as little as
> 6 minutes.
> 
> Normally meson would auto-detect existance of ccache in $PATH and use
> it automatically, but the way we wrap meson from configure breaks this,
> as we're passing in an config file with explicitly set compiler paths.
> Thus we need to add $CCACHE_WRAPPERSPATH to the front of $PATH. For
> unknown reasons if doing this in msys though, gcc becomes unable to
> invoke 'cc1' when run from meson. For msys we thus set CC='ccache gcc'
> before invoking 'configure' instead.
> 
> A second problem with msys is that cache misses are incredibly
> expensive, so enabling ccache massively slows down the build when
> the cache isn't well populated. This is suspected to be a result of
> the cost of spawning processes under the msys architecture. To deal
> with this we set CCACHE_DEPEND=1 which enables ccache's 'depend_only'
> strategy. This avoids extra spawning of the pre-processor during
> cache misses, with the downside that is it less likely ccache will
> find a cache hit after semantically benign compiler flag changes.
> This is the lesser of two evils, as otherwise we can't use ccache
> at all under msys and remain inside the job time limit.
> 
> If people are finding ccache to hurt their pipelines, it can be
> disabled by setting the 'CCACHE_DISABLE=1' env variable against
> their gitlab fork CI settings.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20230804111054.281802-2-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/ci-jobs.rst.inc                    |  7 +++++
>   .gitlab-ci.d/buildtest-template.yml           | 11 ++++++++
>   .gitlab-ci.d/crossbuild-template.yml          | 26 +++++++++++++++++++
>   .gitlab-ci.d/windows.yml                      | 13 ++++++++--
>   .../dockerfiles/debian-hexagon-cross.docker   |  9 ++++++-
>   5 files changed, 63 insertions(+), 3 deletions(-)

Very nice, thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
