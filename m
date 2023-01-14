Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp79222ejc;
        Fri, 13 Jan 2023 18:34:09 -0800 (PST)
X-Received: by 2002:a17:902:e5c5:b0:189:c57c:9a19 with SMTP id u5-20020a170902e5c500b00189c57c9a19mr111243780plf.58.1673663649285;
        Fri, 13 Jan 2023 18:34:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673663649; cv=none;
        d=google.com; s=arc-20160816;
        b=xfZtH2Rc8Wk7C9ciJlTQyu+w2VfDlF7+PVJqE8K8NCITkd8aCCHkHTPpq2sBUtE3ws
         QMBW/O0UiJgWvhvSbZkG0csqd7zNj6Hpmp9Ad++9Ia+D+XvasbK0Kn8dJPAMuj3W1qaM
         gJEjduJVh8mFeqsrrBGbo3Op2IPa85RF3F9OffOTsZNjm/toYln4OyauSxtb/XMF6ry1
         Qutm9aJKKDGC7Vn5Aj6KNBcf3cne7apHL4gg9lVYTJs7kmdtkUyy52ezZAK9QiqSyjEj
         3R/YTslnmKt8GOC4aMjPmI1LxM4lLY/nNm1Ldoh/pZoumo4QyPWclSSvSX6jpRp/E7dr
         kvJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gjav3zuYvpbFyuced3+kXs6qBD4vCq1U9b46uWY/t7g=;
        b=cA8TpRUs6bADNId2s23ICkCpGMJQFu1nX+fJbZzgEvhaiSYP09d1jb9orSh+jAXB9k
         KEITvMq+j+udWW8ZJRlYbJzEr+N+E1zj/rPp65TtsxNDtkk2TUGaJThEoZ8nlGZa1f7y
         9bpMJrzNcnbxxCO5VwiupqjQnAUUywaUaFd5Ml1ZYM3iOuRVVJHaWUHOHqi2sifg09bx
         ngD2KzBJmqhInJTP4uEvMc96cPNx/yECN9V3fv4e1QTTTVFos5pgVA4+JMxEDtRBW9xp
         +foMEGq6ad1iNgbqjI0XXVHPkWxTTXyLKRvTIamYHcahllxpu7tisC9vSuvDdsPOfJC/
         65MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5IQpT1s;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jw22-20020a170903279600b001891fe1cc0csor4855687plb.123.2023.01.13.18.34.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 18:34:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H5IQpT1s;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjav3zuYvpbFyuced3+kXs6qBD4vCq1U9b46uWY/t7g=;
        b=H5IQpT1sVM87nUqQsS8zt1gQNPvxdwnce/PYS2KvVpEmRGDkZ8pceSK9jr+miftnEB
         fP9r4UmzhbazZyKBr/Ie/COHU1N4jtgzduS/r9TltG7wSlI5nHZ7pYEW3ertqcBGDTm2
         GxTJmfWpggXCds7j7EM3Yn1mnpjEO2+TEb7Zhgo0ZZqFH0HqWBqb6TuU3ONd2A2V5n0V
         pz+0VwswrbRrCwcL1jNBRVHWJhCkgrH9HQGi96ttAsbF6nrYK7ZoTR+idht7XWk6vdTM
         J4Y9S/5ce38EHVdEn8Ph40AbXzWO7jRGi0ewZjm7sJitHyiP9G5nF+XuHQEkB2Z8fBA+
         G8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjav3zuYvpbFyuced3+kXs6qBD4vCq1U9b46uWY/t7g=;
        b=sAfDXgLXNMghlDH17GVF9SgnO567hkBVslC/SJ5pGlQ/MqS+FQiIjKtQEXUJ/YLyUA
         fz/inK+Glkk8nDBvJ2xMXvz46rrHZwGI4eryp//XOnr0Ukq9brMxgVKfPWERxgtVSHt9
         iV4hUCSEwPlHZmqqzx64UMS/1rvUDo+/K/4eSTVDQbpR00dSbQTpU3dTJAGTinKqYFl0
         ltMWYtxuOOQLUWFYI1W51NhAYCfx1wDCJvsItKHB6vnE0yVF1ZI1Oen3N/tYDOX1+AHu
         ZkxfECsftQQ1um4wyqZLjpyc/b9uEUEruhLw+0Qo59Hzk+jDehW0ENmaTuByF7uMYePf
         pgrg==
X-Gm-Message-State: AFqh2kpGUurFhdV7TWkHjqM6IYVCzR43LptF2C8ohBsJD8dZy6Bag5sS
	A+wx1C+eNVnqaKuCvuUjKVLLMDrmFmhB9fkLiGE=
X-Google-Smtp-Source: AMrXdXuojJZX13oyLYJgGUrGXSDaQGoOZaJfinbwsIa1rRGu21YhzV5KU1TjUKeGZqhVGJTUT0yuxA==
X-Received: by 2002:a05:6a20:9b87:b0:ac:44ab:be3b with SMTP id mr7-20020a056a209b8700b000ac44abbe3bmr96762289pzb.60.1673663648679;
        Fri, 13 Jan 2023 18:34:08 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id c4-20020a63da04000000b0047911890728sm12430012pgh.79.2023.01.13.18.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 18:34:07 -0800 (PST)
Message-ID: <76e73d82-6a44-b9c6-ce60-417e15507b40@linaro.org>
Date: Fri, 13 Jan 2023 16:34:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] testing: probe gdb for supported architectures ahead
 of time
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230105181533.2235792-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105181533.2235792-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: KehmdqkOwv0j

On 1/5/23 10:15, Alex Bennée wrote:
> Currently when we encounter a gdb that is old or not built with
> multiarch in mind we fail rather messily. Try and improve the
> situation by probing ahead of time and setting
> HOST_GDB_SUPPORTS_ARCH=y in the relevant tcg configs. We can then skip
> and give a more meaningful message if we don't run the test.
> 
> [AJB: we still miss some arches, for example gdb uses s390 which fails
> when we look for s390x. Not sure what the best way to deal with that
> is? Maybe define a gdb_arch as we probe each target?]
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> Cc: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure                                     |  8 +++++
>   scripts/probe-gdb-support.sh                  | 36 +++++++++++++++++++
>   tests/tcg/aarch64/Makefile.target             |  2 +-
>   tests/tcg/multiarch/Makefile.target           |  5 +++
>   .../multiarch/system/Makefile.softmmu-target  |  6 +++-
>   tests/tcg/s390x/Makefile.target               |  2 +-
>   6 files changed, 56 insertions(+), 3 deletions(-)
>   create mode 100755 scripts/probe-gdb-support.sh

Plausible as a mechanism.

I would say that your script would need to actually examine all of the 'set architecture' 
output to map gdb arches to qemu arches.  In particular, the :foo stuff is important. 
E.g. mips:isa64 (amongst others) means mips64.

I can verify that I no longer get the MicroBlaze error with make check-tcg, so that part 
of the patch works.


r~
