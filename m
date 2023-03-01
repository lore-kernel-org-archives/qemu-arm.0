Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6642159ejc;
        Tue, 28 Feb 2023 23:32:30 -0800 (PST)
X-Received: by 2002:a5d:4e86:0:b0:2c7:fc61:1676 with SMTP id e6-20020a5d4e86000000b002c7fc611676mr4163901wru.7.1677655950342;
        Tue, 28 Feb 2023 23:32:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677655950; cv=none;
        d=google.com; s=arc-20160816;
        b=cn3KkAQhTVpQbPTYSMnFDWDW3Nvf5IMSevcPF9VeX8zCiDuUul8Ods3qN0G8nQIY2C
         u3+1a88pRYtMf0+4ZndPtGPiTapc4wkJYQv1O4S4g07AVyFY+RsgJr3S6tR2dvL/d6KY
         62549Hz8m3vQCM4NvzCHkHihsxxhlUcZq5CzsMJc2h4pgaq3JDsfDSViEgrah1eqRRV0
         xiDWzulTJVF0VWz8YOac8hvecCiBdb0YHiU4e4j9REl3r4iNdz1nVt3fZCOIYb2kMyhi
         gj9bJCeq3eS5sbH6lhgwFfIHnOzV1IC7VlhILmQ2JgX6mnHSrEeGAXarhHj62SERANIb
         SG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JTrpK5hPgoGiyYpqNs91jF/dKSneDnT+krWJxrVZ9AM=;
        b=g/q51JWQyp+4b0OSlsZcY2f74vaFE3DtmOFNRW/shDRDCRRqvZlA0ze33H3UKldBYv
         cp7mV88KVJgLhEv/DMDU7wcPZcnYqUafJPmiRMEh2s80Ui6mEJwjQApEfflBT70XVKlQ
         QE9N9zEJJUiUFe3YovMaAhEywdArht+d25CR4yT2QCdFZD/DghObgN2uFkBLOCs1HzAM
         ytjtjWyEwDw57HjbXHULxVFXFRyXCx7lKQFjR+NCEQ0EXPnj4GLy4zQg6vhkioyc7LSI
         aERjQwkK6LJDk32b/Ktc3YaX1sNbVjrttLA6SodksR6f1wsAlWgo+yL6Rh1rMSXphDxw
         Bxcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CLcaQ1iX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h13-20020a5d4fcd000000b002c55870b58esor4228490wrw.30.2023.02.28.23.32.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 23:32:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CLcaQ1iX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677655950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JTrpK5hPgoGiyYpqNs91jF/dKSneDnT+krWJxrVZ9AM=;
        b=CLcaQ1iX3K2cENTsi1z2YyOLo8fZxYN0Uc0k8neYrCvLe3z4guvU8Bw8HkQDQpqVSk
         h/Xej79IExhgM0Ll1snIq1/FqHNrUFpZouLXZbieOt3MrSJaBb118KnEKTcK+Meyu+Kn
         ye+YJzsGvqlfXErq9pVXwounCzLcbzpGneH0xYNiPAarz8YmHZM9ukLWkw4SKTBDsFHf
         pHN+ia+X2iZX1Hh4bQ/o773Yfc1r4HgG8fOjEv6zKMEnId06DakF+LfZyOYK+NQ5H/8w
         9EW2VrOWLBXkWP8LVfLQmH1Doh2OBhlrEtL2AjxcdigYCOO45j/dmhRL4CfL2SnvRDmd
         WxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677655950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTrpK5hPgoGiyYpqNs91jF/dKSneDnT+krWJxrVZ9AM=;
        b=mBN7gnUXS1DNc44UT3WqoA/NuIoT28ioKiJJC6S4E6ZLC7WqsMFwV4nmFbZopnmxB4
         M+utfndiUujPti5Y+qeWzfLbV08KhfyM/7x5A/dHzh53WA4xoSEaDHLKfxh5N7LYI28+
         7n+mwq5TVhOieHPY7zaJjI2BXwzCO4X0rr6Bj2/FYdjt/rPToT4H6+C3kZmTuNVdKG5t
         idGNrVj13KDVqxZLFhieSFnkhxNoNgQbowLg3aHJ2PAAF7QUh4nAmUt/WpzyT8ii4m9r
         i/dHj9HJ+lUGZsnXZbWPkdJgmQ1Kvmn+N73KSep4SdQczFckN2fJZ0+1tRk0b4FWbaZB
         V6TQ==
X-Gm-Message-State: AO0yUKVuow+xOWEnI6pdxLGuM9VtkCAHWw8SzI5TSUcvZjOo0ue6CwjQ
	XsLH4lVTJU0p6HnGheFLK2CfUMce
X-Google-Smtp-Source: AK7set9KXgNt8QtrHsmFXekecqcJy2CrSCvlR/IZmIJX7voN1q52G8JqysSXVmsWu8Yyi8rzY73kFQ==
X-Received: by 2002:a05:6000:18f:b0:2bd:d34e:5355 with SMTP id p15-20020a056000018f00b002bdd34e5355mr3708004wrx.20.1677655950000;
        Tue, 28 Feb 2023 23:32:30 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.18.115] ([91.219.21.246])
        by smtp.gmail.com with ESMTPSA id f7-20020adffcc7000000b002c7163660a9sm12146520wrs.105.2023.02.28.23.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 23:32:29 -0800 (PST)
Message-ID: <3aa65498-4d4e-429e-44f4-bbeb34a0e21e@linaro.org>
Date: Wed, 1 Mar 2023 08:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <199f0714-901a-a15d-690a-2a2f56db015a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Rf4sQb4KA2QT

On 1/3/23 07:51, Thomas Huth wrote:
> On 28/02/2023 22.41, Philippe Mathieu-Daudé wrote:
>> On 28/2/23 20:06, Alex Bennée wrote:
>>> To avoid lots of copy and paste lets deal with artefacts in a
>>> template. This way we can filter out most of the pre-binary object and
>>> library files we no longer need as we have the final binaries.
>>>
>>> build-system-alpine also saved .git-submodule-status so for simplicity
>>> we bring that into the template as well.
>>>
>>> As an example the build-system-ubuntu artefacts before this patch
>>> where around 1.3 GB, after dropping the object files it comes to 970
>>> MB.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>>>   2 files changed, 46 insertions(+), 51 deletions(-)
>>
>> This is still kludging the fact that 'make check-qtest' rebuild
>> the world even if QEMU binaries are present.
> 
> Did you try? ... if so, that would kill even more CI minutes, i.e. it 
> would IMHO be a show-stopper for this patch.

I remember we had to pass all build/ otherwise calling 'make
check-qtest check-tcg' would rebuild the same binaries, it it
was pointless to split the jobs in 2 stages. I might have missed
when that was fixed.

I haven't tried, however I see in Alex job:

$ scripts/git-submodule.sh update $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' 
build/config-host.mak)
sed: can't read build/config-host.mak: No such file or directory
$ cd build
/bin/bash: line 144: cd: build: No such file or directory
ERROR: Job failed: exit code 1

https://gitlab.com/stsquad/qemu/-/jobs/3847747769
