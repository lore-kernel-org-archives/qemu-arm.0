Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3058683ejb;
        Mon, 27 May 2024 02:32:21 -0700 (PDT)
X-Received: by 2002:a05:6512:52f:b0:523:a7f0:a087 with SMTP id 2adb3069b0e04-52965c2f882mr7925852e87.34.1716802341432;
        Mon, 27 May 2024 02:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716802341; cv=none;
        d=google.com; s=arc-20160816;
        b=FJ9awhZLT/EYYkItVscTny/kPVx/1wkNUzAAUs7WE3ojo6gA3g5fMEHwCGLlY79Cd9
         UrcwSh9W+I3K+EmhukklcxXRdzDMLsfWgAl+4uFsnIWXi0T61Cdxu9mPTzGi29cEHk92
         0zV2RqwPE8Wqd8+NZ9sszpGE5vuR0OAwNtPAcFCR/mwIZJTjhg+m2tir5R5SDuRXV1TX
         ETX0/JmekVDlUFQgrMOLV57H3QOt/5bpF3IvVR30acCsa0oTJenc0Hm3PPUyGdExPmBI
         X4K43AtDQXY55SpLHX7fl3nRS5Ee0GNKcphyhMl+bWeb5SA/4basqYjunSvYxqPxWOX5
         nfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=g/DU5vIId6YhzHGLFYreXmHswyG4Ber22YIIUQccoe8=;
        fh=LLpOg0/OATTQ28HCjkB0LEjyb6bemoF/EbI5n8j7nyg=;
        b=AhrEir+jEuEMwd7bTPSXjdiSPhqM/kKhRvwM+cA0iAoV170u90L2OPkgfiNlGIDHID
         asLsqAfXnCz9HTOFxke5TPaYGHVcvcfkCzSgvdD1+WCx4+WBJglBbdjnrWX/+x3whYjr
         TAbDfnLZxHS8Kp1J0s+lwUh6pTIu+xgwqQpEgf20gIY0fgNROe/X7duM0RIG5dWWN08J
         Ro8CLEd7hCEYcMLdlHIkPyvt/Qw/EEuXHolpw5ifpDwdaD62VMATana+6+HMQEv/XFw6
         OMVGclmOvEiAnUzXnL+37WUIO9Ev9zKkX4/g1cEUZEyz58u4rPog7ajaqfco4vMF8gz2
         r8Aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Txi9zVTf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5296ed55396sor1546765e87.9.2024.05.27.02.32.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 27 May 2024 02:32:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Txi9zVTf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716802340; x=1717407140; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/DU5vIId6YhzHGLFYreXmHswyG4Ber22YIIUQccoe8=;
        b=Txi9zVTfF9Fd/4TbhBQ+sNlc9hCMGHQ0XK1duOGmDJLR5cy6r8Uy8Noqw0J2+Q9595
         Zt6Nv+ZpK6Eu8mIkcdWwxQUZYilNd91Dq8vvzYLYiDlFW9upk3a+Y/wYki0OXD6e1jD8
         ZyuyC+3f+b94sacj0nMsUGGJvaNuij0tNiRihTFdSIfXUEG9oJjmAQpHHwlpzKZjLB1K
         DLdJ0Laa64eiUptzYamIUukCqbEsF1UYirSb9w/AF/I3zIFjT48+c7Ybs3rjXupLy4PO
         7Z2DhZQut6UQXJfHJIfuBXKNnQ5wED85rhdIj387jksdk0CYruSf2SnUkpk/QYVdJrTQ
         Ve/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802340; x=1717407140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/DU5vIId6YhzHGLFYreXmHswyG4Ber22YIIUQccoe8=;
        b=OxeSfAerIUg1MWHfFn7DS/C7S97OGa7IO5Z4edSR2CuWqi5xw8YEHFvIyclQa5H+0J
         KOvDKvZ9vcKXa1flFi7V87QslggCldDuxw/Sb3xoPSyDBrCaoG64UOkm8yWiFOv/Z8vt
         kRxErSkyVL3Iuth/5yY4tmEzxQGfb6UZCUy68rlJzj3EXieEjjRtdGc4N91u9ptixA80
         2u1isS5yMVNrgkcl8FMcBT95aYJhmq1AyswuymSvLlHKcUTXzDCGuevRTaEDo7aCkGR9
         uV4feor3cOndeeaf8W9JZHf7vcdgGxO/N4O97W//ONaXuR14d0vnI5AwzbNcclGWjjy7
         AVqQ==
X-Gm-Message-State: AOJu0YxauMfAyyt44LM1MGFfrDmElA2fdnPboBCJZSpkwnTU+DOUXNum
	41vyG21ol0A/TigWC5vULENS4G4cpZVA+SkMCnb1iTfe5MWLQ7+3/+cxgkOtYWcaHAqTbhD9Ir7
	zMMcq4g==
X-Google-Smtp-Source: AGHT+IHkRxYFyKRO+kgrRQGAcq0u8Q+SMCJlItR1oAHAaikdt5RWPpw5jEJYg/W44LsBvWTho953vQ==
X-Received: by 2002:a05:600c:2949:b0:420:e454:1599 with SMTP id 5b1f17b1804b1-421089da927mr90136605e9.15.1716802340384;
        Mon, 27 May 2024 02:32:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.152.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100eeca80sm136215695e9.2.2024.05.27.02.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:32:19 -0700 (PDT)
Message-ID: <ed69a712-689a-4294-978d-d8d818a12b6f@linaro.org>
Date: Mon, 27 May 2024 11:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] testing/next: purging remaining centos 8 bits
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Beraldo Leal <bleal@redhat.com>,
 qemu-s390x@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20240521125314.1255403-1-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240521125314.1255403-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JfcUoNxW176m

Hi Alex,

On 21/5/24 14:53, Alex Bennée wrote:
> There are a few more bits referencing centos8 in the tree which needed
> cleaning up. After this we can remove the dedicated runner from the
> gitlab registration. If we want to keep a dedicated Centos runner then
> we can add back the bits needed to set it up (although arguably we
> could have a single build-environment setup that handles all distros
> and integrates with lcitool).

Do you you mean we should generate 
scripts/ci/setup/build-environment.yml with lcitool?
Otherwise should we update it?

> 
> Alex.
> 
> Alex Bennée (4):
>    ci: remove centos-steam-8 customer runner
>    docs/devel: update references to centos to later version
>    tests/vm: update centos.aarch64 image to 9
>    tests/vm: remove plain centos image
> 
>   docs/devel/ci-jobs.rst.inc                    |   7 -
>   docs/devel/testing.rst                        |   8 +-
>   .gitlab-ci.d/custom-runners.yml               |   1 -
>   .../custom-runners/centos-stream-8-x86_64.yml |  24 ---
>   .../org.centos/stream/8/build-environment.yml |  82 --------
>   .../ci/org.centos/stream/8/x86_64/configure   | 198 ------------------
>   .../org.centos/stream/8/x86_64/test-avocado   |  65 ------
>   scripts/ci/org.centos/stream/README           |  17 --
>   tests/vm/Makefile.include                     |   1 -
>   tests/vm/centos                               |  51 -----
>   tests/vm/centos.aarch64                       |  10 +-
>   11 files changed, 9 insertions(+), 455 deletions(-)
>   delete mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
>   delete mode 100644 scripts/ci/org.centos/stream/8/build-environment.yml
>   delete mode 100755 scripts/ci/org.centos/stream/8/x86_64/configure
>   delete mode 100755 scripts/ci/org.centos/stream/8/x86_64/test-avocado
>   delete mode 100644 scripts/ci/org.centos/stream/README
>   delete mode 100755 tests/vm/centos
> 
