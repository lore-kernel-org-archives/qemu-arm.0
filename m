Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4379470ejb;
        Wed, 22 Feb 2023 07:11:49 -0800 (PST)
X-Received: by 2002:a5d:5943:0:b0:2c5:4add:9e46 with SMTP id e3-20020a5d5943000000b002c54add9e46mr7252328wri.28.1677078709150;
        Wed, 22 Feb 2023 07:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677078709; cv=none;
        d=google.com; s=arc-20160816;
        b=YS+Jgbmt4eNORpX9Z3Imimbx+9PYHsdMWDjxUnoDsHbfv38NRk0keB+tMOFgZwCd0I
         JJHlSSBmarxJXKBJRCIip5S2kWiocGiTftfjKDnvDQubFvYIIdSRsKiONuBvpjzQHyN5
         zf95TjDwgKSeEshdIuf2hMinGaszi7p6NMBMlYBeFH5vo8AIAHLYNlZ6YNM/DUD0G8vw
         DQObeNOxLZeYiFrrREoQtySPcxqj1OrnW2rWt7d9lvt+2GhNpHZxlbkB5cES27d/ugDR
         axlkx9qnvQYlDCUF1t7vwWABtRX+H3bhkYEXkLRhqtS2ULnb5K55Z0ACHKnTc+ojZzoI
         0pzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aExpmLsIH+crBTBLT+vBRt1VOr2oWqSO1aMVLO7WXrs=;
        b=rzqd2xX9+xc4uLrrgfOqoicCEgVMod/7oXMB/q8XZi1uIuuVoQOTlhzAbJ9KAsewGc
         +5YVJ8oq6HtcYVzK3VuSWf/vvR/V1anp01oPvaVN8KnlRLGC6W0vP+mvw7Om7otoy7S5
         5lanJvjXRM/CWB/dgS5Rt7oP0FVR9ULB4ziCahaLpxN5bIkaTvWhmIPfe1t69WnrXjhY
         oV8OKyicRP9fODLwOsC9HqyyuRyfuuVcuGJo6wY4gU0MYCjHF1bHwCINZlcGGurN0r3R
         pH30kv76ftGTFBF8DJf0tprWtpyVJl+pPS2zVkc4Mxr/pdSSzVrIcl4kZjj5VMjyV5en
         Y/Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hm9DLcoF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q5-20020a5d5745000000b002c54db735d0sor3195229wrw.13.2023.02.22.07.11.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 07:11:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hm9DLcoF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aExpmLsIH+crBTBLT+vBRt1VOr2oWqSO1aMVLO7WXrs=;
        b=Hm9DLcoFzsrhThhwbwymQZkgFKBKjAc4qyNwGD6bALVrzdyxcZ4ADgroO1uJb4z8Kq
         OSHPk7zSTlr2bop7wjleOCqkSQ/LOI7GXNP/4qTdAA2mHaSCKmV4FoAl6YwEVTABA89Q
         6xLjmOeH83M9qFGt/71TlYexOYlRm+Yi0Y8/cX3QHPSlK0kDRzUH7ddnITll9L/OKhhr
         z1VhvBO0hDn8MRw+ZBsFof5Pox53BA8wMF7bpjYCFYb665xi9msUeE7c1lHfcJNf8XGS
         IJop5fp3QEjDVrBW+FWTrtNYFMbhb+P/r2HUyYCyyyJWRu9CJdqm8EcR81I+kIYoPsM5
         Aewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aExpmLsIH+crBTBLT+vBRt1VOr2oWqSO1aMVLO7WXrs=;
        b=W+7MwH4pVXraQuLziDwV0wK4+5ZqX1gTmYGw/F0xZJ4jggBXJsBLZInaS+JinSNF2V
         8hjXX5QTBtwvfKGLNQf8nsc08A8GvfVgHPJPc4f2ObPLAJejsAPG3/aYB1Hb7+OPoYkS
         X3r9b//vPmdmCWxBEY2X2MSNQhxDhS9GtA/ch+yNFdXAIrXDLc8Fq+zWMh225b8dodAf
         XgtvGiVXob9qz/3DgSjgWjDtF9Re5c3v+8oIDVu0khfszyRUM3nzV0STWikoPC0IFgO1
         jy0AeX8bu9J55wA7gvanW9QyFT0ACwEeYvFoQQ8OmD2ljQzYMDstnXj2RYfKD0chyUJ7
         fqbw==
X-Gm-Message-State: AO0yUKVBW6qW6KnsoH9VStLY5+0S1fjGJfp0YjOPOILJ+RxvT8rAVSdy
	73LmjbK1fdoireljs+6fy6hS+fjKroL16HRrYgA=
X-Google-Smtp-Source: AK7set9tnLa88Q7NP73ZNHtbWKFgSmpt4iOJVPvkvlYnnHxQWZ49Q1DgMlPr9FgRCPshWyxAC6TORw==
X-Received: by 2002:a5d:49c5:0:b0:2c5:519b:57b6 with SMTP id t5-20020a5d49c5000000b002c5519b57b6mr7446517wrs.66.1677078708777;
        Wed, 22 Feb 2023 07:11:48 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id a16-20020adffb90000000b002c54c92e125sm6557402wrr.46.2023.02.22.07.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 07:11:48 -0800 (PST)
Message-ID: <a7a76dd3-2c2f-7499-a44e-396456deee81@linaro.org>
Date: Wed, 22 Feb 2023 16:11:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>,
 Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-8-alex.bennee@linaro.org>
 <CAFn=p-b18P0oOhiYPkoQvVzQfqVu4XLprp4-JMbPRF4y72-svQ@mail.gmail.com>
 <Y+6HjEUG2fpalQWv@redhat.com>
 <CAFn=p-b8nK8pNWk3WZgVqjUMx27E4ekeypjGpyk2nrRz=UmNJg@mail.gmail.com>
 <Y++2AK5cDgCGkpVN@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y++2AK5cDgCGkpVN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: M9nEgQohDTPL

On 17/2/23 18:14, Daniel P. Berrangé wrote:
> On Fri, Feb 17, 2023 at 11:35:44AM -0500, John Snow wrote:

>> However, would it be possible to keep the older Ubuntu test as a manual
>> execution that we could invoke at will, only during RC testing phase? If
>> it's not a lot of work, I could even check that in myself as a follow-up if
>> it isn't unwanted.
>>
>> I find that "oldest version of x" is quite useful to me for testing Python
>> stuff in particular, as that ecosystem moves pretty fast. It'd be mighty
>> convenient to me in particular to keep an old Ubuntu test around to run
>> manually as needed.
>>
>> (Heck, even if it wasn't on CI at all but was just a container I could run
>> locally, that would still be quite useful.)
>>
>> Whaddaya think?
> 
> It would be pretty trivial to have tests/docker/dockerfiles contain
> Dockerfiles for *every* supported distro version we have, and then
> only build & test a subset in CI. It would merely suggest that we

That would be great! Could be added as byte-sized issue.

> change our naming convention so the dockerfiles in that dir include
> the version. Basically adopting the standard libvirt-ci naming
> convention for targets of $OSNAME-$OSVERSION:
> 
> $ lcitool targets
> almalinux-8
> almalinux-9
> alpine-315
> alpine-316
> alpine-edge
> centos-stream-8
> centos-stream-9
> debian-10
> debian-11
> debian-sid
> fedora-36
> fedora-37
> fedora-rawhide
> freebsd-12
> freebsd-13
> freebsd-current
> macos-12
> macos-13
> opensuse-leap-153
> opensuse-leap-154
> opensuse-tumbleweed
> ubuntu-1804
> ubuntu-2004
> ubuntu-2204
> 
> Contributors can then use 'make docker-XXXX' to run build tests
> locally on specific distros when they need to test something
> that isn't covered by default in out gating CI
> 
> 
> With regards,
> Daniel
