Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1244234ejc;
        Fri, 25 Aug 2023 01:34:47 -0700 (PDT)
X-Received: by 2002:a05:6512:68d:b0:4f7:6017:8fb with SMTP id t13-20020a056512068d00b004f7601708fbmr16386771lfe.26.1692952486957;
        Fri, 25 Aug 2023 01:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692952486; cv=none;
        d=google.com; s=arc-20160816;
        b=MnqJfon5dwKEWKjLSmpWkrND/rUXGm8piQZDp/5yO1eyb+NNTO+D6gZWXzpIZGAh0T
         B5+NAh29jfpHAi/DuDbuGfBXKpboY5sRBh7WyCDOXHPzm2xWXVBbN2ImT+pS+yJo6oJJ
         5m1NVT/ZhilTV90fBgnt4AOCYcrFzm14fb5aDYLM0FqHfZVqcR2fbi76IbZiL34qDar7
         dBfeH0DHPhOqj4c34V9nFGXHgkEW+MB4yxkuf9chV1WG8X3ttpxqSNE+QS3DzkCHxe6q
         ZfuH05pOwHEQipgmHZqgxA4Ydg53MiGE2qE63FfVG6MnIcgl3QVT9LZkg+KmwytmAwLF
         Fnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GVTbhpX1ixt5LMgddEVdjeM3WDjEF1ggdhovQZa+Erk=;
        fh=/aH3vaL+I/7MojHuGq7mYgj1YURcsLbCGFk/NKKwhuY=;
        b=jJos/Er1sftINkWPCwouUa0l02pk7YXwBzR1RtjVwZCflBctWW7RE1qy1FVuI6bvjO
         oWeoGogCUx4Q8PHXHOwPhbMZNewZTKxVBdeUPBax8Q6Jsj7WAlxqpydcjicL1pJQkmVe
         igzJDNGnQe86lPK8y77tOhpMZopzoyQMrOljAWbq6EKSxpMQrroax7ZVSUXdsXAp0SFG
         3DSH2gr7Xi6VKT7oJlLJsaBbtUlg6Yk5aO3dh6Or8Lq98vCiQ4oCFVoT3kppI2CeAvzR
         pkqTZ8xEEyAZyOH1wOlLhW9O7yplIAF8fvcICmIW7qNMJHGmRLRSlTFGhfs5cHtcCzuE
         YxXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Hp/Hug0h";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p26-20020a056512329a00b004fe129b758asor468131lfe.6.2023.08.25.01.34.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Aug 2023 01:34:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Hp/Hug0h";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692952486; x=1693557286;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVTbhpX1ixt5LMgddEVdjeM3WDjEF1ggdhovQZa+Erk=;
        b=Hp/Hug0hC2w7qkHx4GvAEc+9EJg8S53zkPifoV5cMtsXN15eY3snyasAibmeLpyt/b
         mxYiUccwoGW5TaPEn1+1TmGiMS8Br/A3pQBlwYOp2i6GXm1xZcUZWump8HtsDbJ9wESb
         Vb6v3+musLxdExCVvsHRyqNYp7w+ZnQe9BaUc0ZxKbreOKjnNJPXtxAV86x6bXViUclR
         PHHFkpr0kL4c5InYb3tFwrm+DpiypBEyjNY+I9hl64ZXMjA/gI4A1vSsfEd84hrgEvlR
         7RucXCmOyy6QWiPvH3cxkm8/OYrv0TQFxx2pN0ic8pkr3qVcljJg2hcWksBX6zNQ8ARq
         1SJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692952486; x=1693557286;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVTbhpX1ixt5LMgddEVdjeM3WDjEF1ggdhovQZa+Erk=;
        b=eL7M2okUgqIJaR7a6Gph5l2nn1SKC+ueOYGoxeVoan4ko08CmmD32yPBFwoNqHTK2/
         XUImaCZFbFVajPG9THPOXguOXL2inXc43TTTXk9biCedAF0nU12GeqTTtIchaReWr4lq
         0YAyxZZ8CeexFrCBbRw2Z/8yqX8UxLTgGTBvDqDnp3+1bYFeE/bV4a69BVGSlrC/y7rf
         IBaSrT/6zdPG5vdsdYzOtAFr82hWJ4O2qOsQXiw+mJku4rtw4hv0vkGTSQQJSC/4+7Ou
         hMbWShhlqlYwSNxOXS2HWyukraYcfrnsTpnUx1vbUNjfx5vJ34JCom0a7tSBKM9ph32i
         h2aQ==
X-Gm-Message-State: AOJu0YwgLexlLpXMHM73oyecXXdu3JA1apofZSfnOl5NRRyy3k3CtbpD
	Cbcm6FZbB457a4SLYLbr8Ha8shIM
X-Google-Smtp-Source: AGHT+IHOu9lDA/o/ISEuWJaE7JJ7RpLRvdIc54S8BaHzplCroSIpefeb1v8mGgF6G5/Iyr5Yo6fTsw==
X-Received: by 2002:a05:6512:39d2:b0:4f8:6bca:50d7 with SMTP id k18-20020a05651239d200b004f86bca50d7mr14554346lfu.13.1692952486261;
        Fri, 25 Aug 2023 01:34:46 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.164.69.26])
        by smtp.gmail.com with ESMTPSA id m17-20020a5d6a11000000b003142e438e8csm1553375wru.26.2023.08.25.01.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 01:34:45 -0700 (PDT)
Message-ID: <97490761-c138-d496-c59a-f71b86e57c3d@linaro.org>
Date: Fri, 25 Aug 2023 10:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 01/12] gitlab: enable ccache for many build jobs
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
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
 <20abecb3-b330-0303-0f4a-b0b5d0cfade1@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20abecb3-b330-0303-0f4a-b0b5d0cfade1@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jUnWhB2cuROY

On 25/8/23 09:46, Michael Tokarev wrote:
> 24.08.2023 19:38, Alex Bennée wrote:
>> From: Daniel P. Berrangé <berrange@redhat.com>
>>
>> The `ccache` tool can be very effective at reducing compilation times
>> when re-running pipelines with only minor changes each time. For example
>> a fresh 'build-system-fedora' job will typically take 20 minutes on the
>> gitlab.com shared runners. With ccache this is reduced to as little as
>> 6 minutes.
> 
> I've been using ccache when building qemu in debian, for quite a while.
> 
> The problem here, in the way qemu build system works, is that the cache
> is hugely dependent on the path to the source. You change just one char
> in there (/build/qemu/v8.1.0/ => /build/qemu/v8.1.1) and whole cache 
> becomes
> unusable, it all gets compiled anew.  This is because qemu build sys uses
> absolute file names when building, and this is detected by ccache, so
> the source dir gets mixed into the hash together with gcc version and
> other things.

__FILE__ is used by assert() family, some DEBUG_PRINTF(), but mainly
by "qapi/error.h", so all error_setg*() calls.

This has been bugging me since quite some time, since if you build
the same QEMU in different paths (usually on different machines) then
the output doesn't match.

GCC 8 & Clang 10 provides -ffile-prefix-map, but

1/ Our minimal GCC supported is v7.4,
2/ meson doesn't support it. Still there is a feature request:
    https://github.com/mesonbuild/meson/issues/10533


For more info, see also the reproducible build project:
https://reproducible-builds.org/docs/build-path/

Regards,

Phil.
