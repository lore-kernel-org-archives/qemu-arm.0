Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6795599ejc;
        Wed, 1 Mar 2023 02:41:32 -0800 (PST)
X-Received: by 2002:a05:600c:4929:b0:3ea:ea8a:a94a with SMTP id f41-20020a05600c492900b003eaea8aa94amr4903244wmp.27.1677667292900;
        Wed, 01 Mar 2023 02:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677667292; cv=none;
        d=google.com; s=arc-20160816;
        b=yT/S9J436/sU0n+gIABM5KBw+7BzPOKG2J8lxEORtYPmY0OAtu2ZtO+JnuPx6WkJQk
         rNqtEBM/1/lnVBgfcWfZIrqCivZ28VIoWrAMHr8oLqafG+4x2TplAR5W/WBRCKhhtazu
         Vnr16R1nKGkQhiDf0aZXjwatt2AkVD0NgDIvcNM4uV4ONBWrDkABjRAtar2LtuxnbrSw
         xNQMQp0GIJa0JjKo4UMUirHPFiURUzSXwrXqEqh4xegyK2xUIirJPYIJkYHW2lxYMVOT
         3KLN5gdfagG+pmzf6ZqJwKUSCMJY1lUGzYdCv1U/9UCZavOANiRC5UD9QcsUxEAWVdeB
         R0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ox2O2OK4aGI1BMllSXrqC/7z82S+aWOv7xmHwuOpN9Q=;
        b=xDC/zDF15g4j7QUbJFGNGap861BpvkXX91cGLafXH94RMFhgYPOvRh1CUwwrzoRtup
         nXEbEQjwK9tXklwd8PAAk40Bnu0JSoI6db4++LW/LiX8JEj1V77ZtM9WkTnVao9Fm2R3
         RWkhLKQhWjOs8JmzPn1lkTpor3vSgUdIZEp3eNzx16V5gD805uMbEuBMh59NZz6vxHvY
         f2zYnU8UyThYPulV97dKNA6djkIGijAUg7k3MFRm5lTSGChOztCS10wqujC9DpQvAHSM
         /tHnVtKPiWRw9NmvrKfYVfEOe1ywXRHdmsMYo98yLaYWRwHim7t/S+iICNIiI7QZQSMC
         2Vdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m37rx2y9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f17-20020a7bc8d1000000b003d23e842d39sor3542793wml.18.2023.03.01.02.41.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 Mar 2023 02:41:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m37rx2y9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677667292;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ox2O2OK4aGI1BMllSXrqC/7z82S+aWOv7xmHwuOpN9Q=;
        b=m37rx2y9i3lVaNOMCAyMa03HMk8N6BhAIvXqeALWeMFCKD3g/9i115DosgX01kLCOe
         UI3php34U1JVTHFNJO/ZqN3Ace6ZRH7Jfp9+rkoRKQobzMksQskx5qMv8WVuwhQy3J79
         Sfcoqr1DDBB3h/xKNS0cZ4jAqgXBaxZJdEcNg1u8FlEuL2qfoah6JhyWl2JCXSIkKemQ
         cdfbVfZfH77P1E4sZVmWDYrh1vBffad8jyf94nex905l0u148PpA6kwu4CRYhRXeDX25
         EBgzR2Kmcsodvs0wda2fg9Hk5B9fwkrV+uYGnfcCEpJX2AkCXpbSmHJwRK6a3thi1wsZ
         qvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677667292;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ox2O2OK4aGI1BMllSXrqC/7z82S+aWOv7xmHwuOpN9Q=;
        b=m0ptYMdoMLcGB/WMJTDpR0r2D/VqaYosPmqBBTJ0CoCj6RWRPiZHN5YNHIPQK3DZrp
         rFPxlJYo0vtYgkcqcRoIKiZPlViYEqP4f+uaKq5sbp1sy1ZwmlMsp8ceGqYZ9EGkmCwz
         SP+5Fr1fLAiEHZtjLRFpC6y9p3D5O22k0cq6eg36rCTcmN0/P+xMM/urHSJhD/kxME2u
         otqK2kVNxMXdJp0B4jz3cb8gQLaH2v4PL7FfT3Qyg3QG7wMfAHDDQYAF07EdaDuDJ4q6
         FAcpsunWGockmKsaOCV7ER5IwGmxyie4snYTwF+e8lOe7/ZBAGPY7NqjyuQnU+7DYbqo
         6eRg==
X-Gm-Message-State: AO0yUKXqVGqdYgwiIZX/hxXJoWs9hQswQlDg8qlRW4PdcecYaQHO4iLV
	CFMI/dtbJJHlR/zq8O/1Jy+81erlFGEeimQhc98=
X-Google-Smtp-Source: AK7set9vDR3SdaGOC1yPodzAbyAFrlrQrUT+VUQiEf1VjNUrmHjmEtOAbPY2OSdLDBUfqxZpFLoIfw==
X-Received: by 2002:a05:600c:4fc5:b0:3ea:e7e7:a2f9 with SMTP id o5-20020a05600c4fc500b003eae7e7a2f9mr4932789wmq.13.1677667292350;
        Wed, 01 Mar 2023 02:41:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n41-20020a05600c3ba900b003e20fa01a86sm16635528wms.13.2023.03.01.02.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 02:41:31 -0800 (PST)
Message-ID: <d2513416-4378-f107-9fbc-d55f3640df5a@linaro.org>
Date: Wed, 1 Mar 2023 11:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
 <199f0714-901a-a15d-690a-2a2f56db015a@redhat.com>
 <3aa65498-4d4e-429e-44f4-bbeb34a0e21e@linaro.org> <87wn40dc48.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87wn40dc48.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rPlstXbGYePs

On 1/3/23 11:00, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 1/3/23 07:51, Thomas Huth wrote:
>>> On 28/02/2023 22.41, Philippe Mathieu-Daudé wrote:
>>>> On 28/2/23 20:06, Alex Bennée wrote:
>>>>> To avoid lots of copy and paste lets deal with artefacts in a
>>>>> template. This way we can filter out most of the pre-binary object and
>>>>> library files we no longer need as we have the final binaries.
>>>>>
>>>>> build-system-alpine also saved .git-submodule-status so for simplicity
>>>>> we bring that into the template as well.
>>>>>
>>>>> As an example the build-system-ubuntu artefacts before this patch
>>>>> where around 1.3 GB, after dropping the object files it comes to 970
>>>>> MB.
>>>>>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> ---
>>>>>    .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>>>>    .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>>>>>    2 files changed, 46 insertions(+), 51 deletions(-)
>>>>
>>>> This is still kludging the fact that 'make check-qtest' rebuild
>>>> the world even if QEMU binaries are present.
>>> Did you try? ... if so, that would kill even more CI minutes, i.e.
>>> it would IMHO be a show-stopper for this patch.
>>
>> I remember we had to pass all build/ otherwise calling 'make
>> check-qtest check-tcg' would rebuild the same binaries, it it
>> was pointless to split the jobs in 2 stages. I might have missed
>> when that was fixed.
>>
>> I haven't tried, however I see in Alex job:
>>
>> $ scripts/git-submodule.sh update $(sed -n '/GIT_SUBMODULES=/ s/.*=//
>> p' build/config-host.mak)
>> sed: can't read build/config-host.mak: No such file or directory
>> $ cd build
>> /bin/bash: line 144: cd: build: No such file or directory
>> ERROR: Job failed: exit code 1
>>
>> https://gitlab.com/stsquad/qemu/-/jobs/3847747769
> 
> That was an older run of the job where I thought the skip path would
> merge from the template. In the end I've just include git-submodules in
> all the build aretfacts instead of just for alpine.
> 
> It ran fine:
> 
>    https://gitlab.com/stsquad/qemu/-/jobs/3849512854

Indeed:
https://gitlab.com/stsquad/qemu/-/jobs/3849512800/artifacts/browse/build/

So a good improvement, but I'd prefer having a stricter "only include
what we need" policy rather than "exclude what we don't". The former
will catch missing additions, while the later won't notice until someone
spend time excluding pointless files manually again.
