Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5693372ejc;
        Tue, 28 Feb 2023 04:21:36 -0800 (PST)
X-Received: by 2002:a05:600c:3b95:b0:3eb:3998:36f1 with SMTP id n21-20020a05600c3b9500b003eb399836f1mr2255158wms.41.1677586896481;
        Tue, 28 Feb 2023 04:21:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677586896; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtaZntsO8HKOjFazLAmdOaNvuEO/rRrNaV3GYhx3doWKfn8jaomeRIL14iPLpTcA9B
         pesyO4Xtro4GDb9nRj+U+/ef/va1Tz4TKOj2Aq6aDrXnDgRz20+y8oPR4HBWsyOs8oCR
         qOHbChk25nZ0D3KmY0gXShlw30y6AYFQFku+lClXZ0v2A4lqmqGbIgF+tzghJ43BkTsl
         yhovdElOnFFRpO2LW2u8GQDDrgxP43yrwpk4zQfLEj+TZ0nCznvf2kXZHkxtrO1n+wuT
         BthXBYjxktmU2bF9ttkXljFWjxD9dAxlA8AJDyLcooAusIzsWzBJqQgy27zuWsfm7F+6
         0nhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=91GaZzjlTl0Bu/cPlQuB4+9xK993xopmGcPom33VZ3M=;
        b=UKmPPv3lv78Xih93fR+QGLVVTeqsmcVfSIYcwVmL2GWuK2HL/fcxcFMb/wdtBFVUeb
         jphGoidKacikHglYWKfUFzDMECM4uRTTA1hCPMy8rjrESUmBO1NMdqtcLfsJFVuKsm8a
         Bjqe8v0Pt6GD9BuK7k/+0TmuvcsufFayX/JskZ2ZQOADvAVTc8bv8yT9cgHvkkowosso
         +QD6s2lNF9oB50MNZJQBf3B3AgeHE+lLQKjuUsm71m4DRCayQTeWTeYVLUibfYO2C4/6
         ibH6Q1T14X1AgyAWkEY8PF8wEaXnrbMhn5Tszv0c7bBIBRAtjizRTh0PIK9f4Q9e/bm+
         rzGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b6GJ1L6i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l19-20020a1c7913000000b003e21d3e76eesor3589592wme.13.2023.02.28.04.21.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 04:21:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b6GJ1L6i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91GaZzjlTl0Bu/cPlQuB4+9xK993xopmGcPom33VZ3M=;
        b=b6GJ1L6ifW9AJhpyombrp6CGk1cFX38s4MU+H2qfvF+zAnpTSYa4ByiL4pJIA5stRC
         KgdUqBKBbEnNQHqCOfpbQQJS1B7wiGz+Pvtc8wAs1iKrT7XrJYLw/wtYuPONEsoSi0x+
         RIV+YKpHxmOF52CavE3PMaKVmwnqtJAZLft5tIbN+MSik5h/3lbI6d+zVxLzY3BtP44Y
         w510j0EF0y4mT27WSzJrGqAuQGRYjJDHibAvcAxYDD7eIKAVVqcKigKaWNbRoqGVoJMI
         j7tLkWcHU7903Cp7t+MSaghy1IVBZM7HSr8/11l/rpMPTZqoyFJzOWWfhH9Za7imQq0v
         oVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91GaZzjlTl0Bu/cPlQuB4+9xK993xopmGcPom33VZ3M=;
        b=RTHg2SugSW4Asv3laWMeb8NfOxxrlCdqiI2lLUrJTOsNRZbZ+lOD6WDnTMwVYIT03J
         KAaWbR1lwv15f4QEEfuTs14PjXpgIP0n7Phw5PYJMR/6cYut9Njku222JCJpmCRJCPKw
         ls+1eQYIxfDM9J6TmClFsm+WajkTi14gBBDGPiB7S8s4xczXcK2z2OriTmxl3KD2aB0b
         BTKW+LibmgZCiyHFJJv1QslKBUSVGXj9cM9MxT5dGThgd/Jk7g/V6ZjRTlaK9Xeqp52j
         0zauUxFOeMN/z0x+rzQ2Kw1Qz7x+yATsq0yYxlCsnkPRloLwWzjAV+r+QEgxvCYVTuC+
         xd7A==
X-Gm-Message-State: AO0yUKWbuGpgfuKgCw9Vmyq0rLnV4648K+9cy7SqcwcfDFktVbAFRTuh
	Ed6W8CEdSHQ4mWwuvINxlegs/2sHk2KfsU98HQ4=
X-Google-Smtp-Source: AK7set8PoN2e8CdgeoCxubbO4BCfoXW8vLQBJfHsjcuUHU4W35GaN1/4aFPkF1RrWXd6UgKnfkxCfg==
X-Received: by 2002:a05:600c:4510:b0:3e2:19b0:887d with SMTP id t16-20020a05600c451000b003e219b0887dmr2259700wmo.25.1677586895925;
        Tue, 28 Feb 2023 04:21:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n4-20020a7bcbc4000000b003dc3f3d77e3sm11589858wmi.7.2023.02.28.04.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 04:21:35 -0800 (PST)
Message-ID: <fee4a91c-3a66-e35a-2663-2565b4103549@linaro.org>
Date: Tue, 28 Feb 2023 13:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 4/7] tests/docker: add USER stanzas to non-lci images
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-5-alex.bennee@linaro.org>
 <6a0a7246-e9fd-abfc-283e-b591000cfec7@linaro.org> <87h6v6f0db.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87h6v6f0db.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: psNCEA58atxg

On 28/2/23 13:18, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 24/2/23 19:08, Alex Bennée wrote:
>>> These are flat but not generated by lcitool so we need to manually
>>> update them with the `useradd` stanza.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    tests/docker/dockerfiles/debian-all-test-cross.docker     | 5 +++++
>>>    tests/docker/dockerfiles/debian-alpha-cross.docker        | 5 +++++
>>>    tests/docker/dockerfiles/debian-hexagon-cross.docker      | 5 +++++
>>>    tests/docker/dockerfiles/debian-hppa-cross.docker         | 5 +++++
>>>    tests/docker/dockerfiles/debian-loongarch-cross.docker    | 5 +++++
>>>    tests/docker/dockerfiles/debian-m68k-cross.docker         | 5 +++++
>>>    tests/docker/dockerfiles/debian-mips-cross.docker         | 5 +++++
>>>    tests/docker/dockerfiles/debian-mips64-cross.docker       | 5 +++++
>>>    tests/docker/dockerfiles/debian-native.docker             | 5 +++++
>>>    tests/docker/dockerfiles/debian-powerpc-test-cross.docker | 6 +++++-
>>>    tests/docker/dockerfiles/debian-riscv64-cross.docker      | 5 +++++
>>>    tests/docker/dockerfiles/debian-riscv64-test-cross.docker | 5 +++++
>>>    tests/docker/dockerfiles/debian-sh4-cross.docker          | 5 +++++
>>>    tests/docker/dockerfiles/debian-sparc64-cross.docker      | 5 +++++
>>>    tests/docker/dockerfiles/debian-toolchain.docker          | 5 +++++
>>>    tests/docker/dockerfiles/debian-tricore-cross.docker      | 5 +++++
>>>    tests/docker/dockerfiles/debian-xtensa-cross.docker       | 5 +++++
>>>    tests/docker/dockerfiles/fedora-cris-cross.docker         | 5 +++++
>>>    tests/docker/dockerfiles/fedora-i386-cross.docker         | 5 +++++
>>>    tests/docker/dockerfiles/python.docker                    | 5 +++++
>>>    20 files changed, 100 insertions(+), 1 deletion(-)
>>> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker
>>> b/tests/docker/dockerfiles/debian-all-test-cross.docker
>>> index 8dc5e1b5de..981e9bdc7b 100644
>>> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
>>> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
>>> @@ -61,3 +61,8 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
>>>      ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs
>>> --disable-tools
>>>    ENV DEF_TARGET_LIST aarch64-linux-user,alpha-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sparc64-linux-user
>>> +# As a final step configure the user (if env is defined)
>>> +ARG USER
>>> +ARG UID
>>> +RUN if [ "${USER}" ]; then \
>>> +  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
>>
>> Is that intended for local image building?
> 
> For building tests. When we run the compilers inside the docker
> container we want to ensure the final binary is visible and accessible
> outside the container.
> 
>> Personally I only use the image built by gitlab and mount the containers
>> with -u $UID -v $HOME/.ccache -v $HOME/source/qemu. Would that still
>> keep working, or do I have to map from gitlab user to mine?
> 
> Its only added on for local builds so in theory you should cache all the
> layers apart from the last one.

OK.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

