Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1222022ejc;
        Fri, 25 Aug 2023 00:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLs67PQAnaVq4Bpzc/LarfMOqBiucGOfESnjWMSphNzN/RRFdGre5EG7txzfJOSdSXRRpv
X-Received: by 2002:a05:6512:31ca:b0:4fb:8eec:ce49 with SMTP id j10-20020a05651231ca00b004fb8eecce49mr16832906lfe.31.1692949591252;
        Fri, 25 Aug 2023 00:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692949591; cv=none;
        d=google.com; s=arc-20160816;
        b=F4T+nxNVJ368gpa1LNxAaLU16G8NKpQdsHWaflkdqbMjQgt+v5HP7lDmGLEz8wx38m
         BAI94OOP6kKeKTQbGM8TGyHjCK4/cg5MRnEHY9ycVX0z3EucXb7In8Ews+u72y6ZEKvu
         3AVj5y4lzIBhq/TQtAU/KT0FSughkqqkf3wYiTZWyCKUGfno1V9aagOlAda/vFmnoR/y
         4hsYD4yTRHW/QqSUmph9hRWKPXG3exrgOQew+wbyj+yQPBe3xksJjXOPiiaxSSiAlaws
         l1++fAFZWoaxd8S05zBdlOgg5K8D/g2wGcVGJjItDzgXIRmyu5UHVyNw70RSQd6p66ke
         btQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=DHj9EY5uEhNNchYqUkl1RjzgCO0Bta/pKbD4/3tkWNo=;
        fh=7zxhZzcEzgB32yUCHTNPBhL5R8k09Pp/XFwXMEks+Iw=;
        b=Hnn8Oo12rZGcTu9PF9JPg1X2GSnkZEAa8WqWrhGoCNaT3tSuQvVXvi7hXB3paoUBlr
         f4rmw9po1kwnhVLkg6J0uvLleFnW/EaJi1xgTT33pMmBRbqn7O8Jk4+mrHjjj7Vd+ai/
         D8zTVdzLnXIBVnnTP6x8ApPwI2C9R1ag/I0TzFajswGWRATFqv3TYS+Jz8JRClA5amjf
         gl/1Abcd0mDoyOV0bC9/jK0AIQJ+dPiWoIlRDaBG0/gwm3SyGipikByNrqGIdNl6GGvx
         HV+U8l3Ay7Euq4O/cRU0jDafTIHdi80cwTuR72oWQDsInTmwoUZ6Gq39evzT9oiaWugq
         pBMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Return-Path: <mjt@tls.msk.ru>
Received: from isrv.corpit.ru (isrv.corpit.ru. [86.62.121.231])
        by mx.google.com with ESMTPS id c17-20020a197611000000b00500a003e4dcsi342353lff.554.2023.08.25.00.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 00:46:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) client-ip=86.62.121.231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8B5791CD1F;
	Fri, 25 Aug 2023 10:46:51 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
	by tsrv.corpit.ru (Postfix) with ESMTP id 33D4F21B74;
	Fri, 25 Aug 2023 10:46:29 +0300 (MSK)
Message-ID: <20abecb3-b330-0303-0f4a-b0b5d0cfade1@tls.msk.ru>
Date: Fri, 25 Aug 2023 10:46:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230824163910.1737079-1-alex.bennee@linaro.org>
 <20230824163910.1737079-2-alex.bennee@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230824163910.1737079-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BFq0I+tuqFM7

24.08.2023 19:38, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> The `ccache` tool can be very effective at reducing compilation times
> when re-running pipelines with only minor changes each time. For example
> a fresh 'build-system-fedora' job will typically take 20 minutes on the
> gitlab.com shared runners. With ccache this is reduced to as little as
> 6 minutes.

I've been using ccache when building qemu in debian, for quite a while.

The problem here, in the way qemu build system works, is that the cache
is hugely dependent on the path to the source. You change just one char
in there (/build/qemu/v8.1.0/ => /build/qemu/v8.1.1) and whole cache becomes
unusable, it all gets compiled anew.  This is because qemu build sys uses
absolute file names when building, and this is detected by ccache, so
the source dir gets mixed into the hash together with gcc version and
other things.

Dunno how well this will work in the qemu ci though.

/mjt
