Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1133728ejb;
        Fri, 15 Sep 2023 03:53:34 -0700 (PDT)
X-Received: by 2002:a17:906:4d:b0:9ad:dfe7:b36c with SMTP id 13-20020a170906004d00b009addfe7b36cmr141433ejg.57.1694775214248;
        Fri, 15 Sep 2023 03:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694775214; cv=none;
        d=google.com; s=arc-20160816;
        b=h37x8Exq9hgf4Nt0Sqt1ZJ3pvqUBRpFyajfMzNL+HNHslT1QqT7YC6b8vEDZSfsTJF
         ViPO6/FxAAELijs4ug0aQEuk7uA7NZWmGR2MibssAG48oFuGi3Egz9jgaIUNa/VcZkis
         Djb4zlxJJISFnjZGCoqCQe+WmEKk23Nzw8ofXgfhmfL35lspldbAUgEGjTspabWrTvB5
         THCKK86OT5JQ6E9IM7zdkbyCRirbIbQi9ibcnKlZzhI0Ms9rQdv2xsrbXowTIM43z113
         v+8oU+v0/MokN/wexDFtUfh23pd7P9yEtmhxtYhRAp1ag4e6mi3wp7xTInSXYuweFPYQ
         XhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=E4k7cQeZxV8vUXswzcTiTHVdLI1rOf5ExfLEQo9DK5g=;
        fh=1uijXMZ7FWQawR4QmcO5VVB8ixLeThpj3IAJJVZFCaE=;
        b=j5a9+05Tz9nBpIEkA+XP0GpeSr8zLKMhj1xb0MyFWfscMNZX93oiPIkLG3Z9a3BMqF
         cKNPd85nH1zafMg+FO5t0mR1wNpgZvKAC2o9s9ithaxrI5/SVnaHiKHqJYnwxVR9IsaN
         Fv1DgmrBywJ+2AHYCr/eOFKrBZiVddRYH4VIimT98npMv4/ZAqpNZq9LurzWvkSud+i8
         vQI6VytKA897FVokljGptLbQU3x2sD/lTeEH+BVvnIM6VcBnqe0SqLXbzSNvS0FT1KFw
         LgjpGMdbYWBT8bGii9Dof8iBTg4wqdSvY/8zTofNX02Sdfb1mROMgp+ns35x+6OaIPU5
         Qjrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5N76r3e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jl12-20020a17090775cc00b009a9f2fc15d9sor1098777ejc.14.2023.09.15.03.53.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Sep 2023 03:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5N76r3e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694775214; x=1695380014; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E4k7cQeZxV8vUXswzcTiTHVdLI1rOf5ExfLEQo9DK5g=;
        b=B5N76r3e8YBIkHhdW8/PLsdSpFIhTTUIse5Pno1mN3UevtBVvxA0NYJeDg/O5Lz6G6
         /8mZfisGUro5hNGX5fNntEZF5gMHKGf8bSiejCEobYQdLvLYgG02Dd62Q2mctEZRQTBH
         tLa1+St1fchf6xNgTmuXlHtZsuG/+IXdaUYXZnJs3YdcEOgjvgqT/8A21pWjVDUCgyNQ
         41CrmY8q4+czmjPljUL8cxV0pF/NdpQpgazSATfJSbHBz1k0Q83J5WhjpuIvysOtInuF
         vc3K9wTOcK5YrdHPh0Hh0lQtA9b6HF92UwULJd536zwKPowQhGB3hbMxJCTLpgSL2/qv
         iz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694775214; x=1695380014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4k7cQeZxV8vUXswzcTiTHVdLI1rOf5ExfLEQo9DK5g=;
        b=ca+VDFXfvGr5mxQbB/h18sTJBblNnO3yCSnVpCyKCFs07eyvt1ovBA5aqAd/5U2DcR
         PoZrMn3bmBfDdoDAs0oxDpvlS39IYSo8lgPPPLRBUGOXfiCOdGTfRRg+ZLGtCSAVsZkt
         15xMVv2QvyUjKDCrQbekWko+K03JtBz6PXKQ8u6tWvZs9wqKUrLpwD8XakGkNazEmSJr
         4u5yBv1d5ST4gX10vdfh+Jyc20L+Ii/RnoIkmcgUkIuvXWz5ARDOtMB4uxkzKSM83sZA
         Yw/7nPEgTF7roA+wHasL9Kz/A/2q02EK8t9po7l2jtQU9/+SAlGeKU4rZovvciVEdzDU
         t80g==
X-Gm-Message-State: AOJu0Yy4xJUvt8oSSm+WcCGz09GBbLrZOY2CImwuOG69jgLF/VufdMwu
	meTlC/Pq9zsS1VfjIxEaCLWuvjn3
X-Google-Smtp-Source: AGHT+IEbiIeZO2ns0sCFVueryz1hVV7LfgjNMta4jLZVD8e43xBC/1JUv9IMwXwZlD5k34IZ1KQV9Q==
X-Received: by 2002:a17:906:cc15:b0:9a9:e73a:3dd4 with SMTP id ml21-20020a170906cc1500b009a9e73a3dd4mr967955ejb.64.1694775213841;
        Fri, 15 Sep 2023 03:53:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-223-129.abo.bbox.fr. [176.131.223.129])
        by smtp.gmail.com with ESMTPSA id w15-20020a17090633cf00b009944e955e19sm2238018eja.30.2023.09.15.03.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 03:53:33 -0700 (PDT)
Message-ID: <242dc7bd-f0c4-d58c-fc6a-f3ddc0168bf2@linaro.org>
Date: Fri, 15 Sep 2023 12:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/9] tests: update Debian images to Bookworm
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
 <20230914155422.426639-2-alex.bennee@linaro.org>
 <30ac04ad-eb02-90ad-57ff-089538413602@linaro.org>
 <ZQQi6n+3mp+bQIgu@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZQQi6n+3mp+bQIgu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: m/hDqL3foBvi

On 15/9/23 11:24, Daniel P. Berrangé wrote:
> On Fri, Sep 15, 2023 at 11:14:29AM +0200, Philippe Mathieu-Daudé wrote:
>> On 14/9/23 17:54, Alex Bennée wrote:
>>> Bookworm has been out a while now. Time to update our containers to
>>> the current stable. This requires the latest lcitool repo so update
>>> the sub-module too.
>>>
>>> For some reason the MIPs containers won't build so skip those for now.
>>
>> Debian removed mipsel:
>> https://lists.debian.org/debian-devel-announce/2023/09/msg00000.html
>> https://lists.debian.org/debian-release/2019/08/msg00582.html ...
> 
> Wwith our general aim to support latest release, plus the previous
> release (capped to a maximum of 2 years), we can still consider
> mipsel supportable in QEMU CI by sticking with oldstable (Bullseye)
> for the mipsel containers.
> 
> Once Debian 13 comes out, however, we'll be discarding Bullseye
> from CI and so we'll be unable to do CI for mipsel. At the very
> least this means we'll consider mipsel to be downgraded in terms
> of supportability when that happens. We might then consider
> explicitly dropping it as a buld target entirely, as the writing
> is on the wall for 32-bit OS platforms in general...

I'm fine with dropping system emulation on 32-bit hosts, but a bit
reluctant to drop user emulation there. Anyhow I agree with our
distrib releases support rules, so the mipsel buildsys part is
effectively condemned.
