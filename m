Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1357988wrp;
        Wed, 25 Sep 2019 15:17:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3ZP2vHvyk8awVwH1nf5DnWCGIro1BXHnUsUfXdTdl68hrOn1SDHkeLi2z+hcwjYZlduCI
X-Received: by 2002:a02:bb8f:: with SMTP id g15mr651244jan.110.1569449832082;
        Wed, 25 Sep 2019 15:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569449832; cv=none;
        d=google.com; s=arc-20160816;
        b=oU8vP4xtk7FTnJpLL5ni5l+r4PUnjQ7T1wqKBIaeaIFzxmWcO9pW/K1FAV+ljaMp+b
         3wGxpBNqwTTSkj0g3q3bycdFCE3wMet6WNG8uYaUHM0vOou8mBQBoYWxXzCafWbF0kvZ
         PCiBORQ0Oy4h4HV3hM65gqPrpim3oSUNfD60rwe96I/d4EPqX4Syd4esrqx9fXmOhIAP
         RB0WAOO1UNQDFtvgFvpxL+wRARDXAadprPzlaiJaz0SR174QIeUUpceu2t/ZKRq6J6sv
         f2DVYjT1P3lrOW8OboiJoQmHhh0R7WSHbj71HV5y6IX96qyFIsQDWk8RJjDwD3QJUbC0
         /osA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=U32e0gvF+Du/ZMCNJhETOwflhH+X8Ij8z6MlMuQx8ZA=;
        b=b1FhuIxdX8Kqx1PzJU8+0SnDYP88aqF24Gg3mWFaCpGCLaklR7t4KIhNfAXq/QnN9A
         2t82CvEJgj1ix9LF9khsXS57cN/zatu4A8qmaKF2O06FV1M8EgVkONza4rr9ail30kzv
         gkupoO+oCPslloG66PtURo02mRQrV7hK+yytGyy8ZoQEa8QgyyJfclZI3dpNIc1SEO64
         WcRC6QMqmyDWyAwt/7k0vFWZmWciC4Rgb8ugazbeb4St4JwB4Laxidx52H8Y1KKjHsPj
         SLvKPNrjt0Rrs/5twi7hLvjEBc/P9iREktr10jkWafjDOMoFXl4g49fH1hY7TiL3BKCD
         KmJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t19si649881ioj.9.2019.09.25.15.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:17:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35AD42A09D7
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2019 22:17:11 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id j2so136741wre.1
        for <alex.bennee@linaro.org>; Wed, 25 Sep 2019 15:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U32e0gvF+Du/ZMCNJhETOwflhH+X8Ij8z6MlMuQx8ZA=;
        b=C9pLmXJIvh4e08jgsu7cRq7JBXKaHOWeRjCcwLyjsey0o3mFr0GGhei1Wd2pwOdHi+
         PxgSsBV115V009k+tH+DRkkq8UK9KmWljRqeDd2OFJvpG9/VoAKoyTjkCm8Yxu5RUwCQ
         /5U11n8laEzf7wJcLIgqGlkq9wQKZyLZjRBnEc8411j5UKUJmCSclnK7T3x/y/w3ERaL
         FpPX0/INbudY4gmfc6aXm657w8lp3IRyn5iuUFN9vfd8mc4CjhdybvfbNQiQEvLexDYr
         2vimW8FTpAsTbXkoDEtmGvK9hC8Gpx0UufiHx5RabL7E4Pgn4eOJGqQIiclxQZOUXBT1
         xCdQ==
X-Gm-Message-State: APjAAAVi+xj6Tlf3/ll1XyRF7/nsDxgMUbJbYSKQtbjZKdRGyHyNPxiO
	CXvVdFRTKMCzTx0uQbg0s9qS+m7XshiCP2VEJEAxCwTJY4lPHwtmkB+dCCJFWR+QxGA6QbOS++L
	MZJjEXagyPk0e6M9T
X-Received: by 2002:a7b:c932:: with SMTP id h18mr298961wml.86.1569449829925;
        Wed, 25 Sep 2019 15:17:09 -0700 (PDT)
X-Received: by 2002:a7b:c932:: with SMTP id h18mr298952wml.86.1569449829770;
        Wed, 25 Sep 2019 15:17:09 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id p85sm760651wme.23.2019.09.25.15.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:17:09 -0700 (PDT)
Subject: Re: [PATCH v3 19/33] tests/tcg: add float_madds test to multiarch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jsnow@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20190924210106.27117-1-alex.bennee@linaro.org>
 <20190924210106.27117-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <8e118a0c-becb-aeb3-5407-4f371945029e@redhat.com>
Date: Thu, 26 Sep 2019 00:17:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190924210106.27117-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: F63kWqVomtxU

On 9/24/19 11:00 PM, Alex Bennée wrote:
> This is a generic floating point multiply and accumulate test for
> single precision floating point values. I've split of the common float
> functions into a helper library so additional tests can use the same
> common code.
> 
> As I don't have references for all architectures I've allowed some
> flexibility for tests to pass without reference files. They can be
> added as we get collect them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2
>   - allow tests to add addition patterns to the list
>   - conditional diff-out
>   - use __builtin_fmaf instead of forcing optimisation
>   - use hex floating point definitions and output
> v3
>   - remove add_const stuff, make explicit tests explicit
>   - various style clean-ups
> ---
>  tests/tcg/Makefile.target           |   9 +
>  tests/tcg/aarch64/float_madds.ref   | 768 ++++++++++++++++++++++++++++
>  tests/tcg/arm/Makefile.target       |   3 +
>  tests/tcg/arm/float_madds.ref       | 768 ++++++++++++++++++++++++++++
>  tests/tcg/multiarch/Makefile.target |  12 +-
>  tests/tcg/multiarch/float_helpers.c | 230 +++++++++
>  tests/tcg/multiarch/float_helpers.h |  26 +
>  tests/tcg/multiarch/float_madds.c   | 103 ++++
>  8 files changed, 1918 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/aarch64/float_madds.ref
>  create mode 100644 tests/tcg/arm/float_madds.ref
>  create mode 100644 tests/tcg/multiarch/float_helpers.c
>  create mode 100644 tests/tcg/multiarch/float_helpers.h
>  create mode 100644 tests/tcg/multiarch/float_madds.c
[...]

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
