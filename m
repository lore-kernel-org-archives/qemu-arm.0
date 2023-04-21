Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp945173ejm;
        Thu, 20 Apr 2023 23:21:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350a683YEQRgQ9BXOXGbO1jMZjW1IteraaCFsIA9SpxIsV9fr/hd8L7SMoIxTDXlheLj0f2gI
X-Received: by 2002:a05:6214:dce:b0:5ce:7b40:89bd with SMTP id 14-20020a0562140dce00b005ce7b4089bdmr7403833qvt.18.1682058094710;
        Thu, 20 Apr 2023 23:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682058094; cv=none;
        d=google.com; s=arc-20160816;
        b=npbmzUsUFFI4KHPCJHh/g/BaJ0P38HeXSEuGYWpEMSdA9GpbPe1IX5v6029Agfawd1
         gxwTVqMxtxZ4WzLx6z7vAxM1H5mWu9FZF/8LNjsU/svIUEtmosKMjGr55599lcPuPa7j
         rDfRelUpxjlJF0ccpvtozrH8UNPQMLspAFRbpm6yUeJ3pR8GpCUONJGOrP9ytvzyI9l4
         SADhciSdDm0afbiMHgU9y0cXw71IfeDsVzFRW11CIf+TiUQrLwiUWvlFaqSsyUYdsxwm
         dlPGIezsjK3/RuwWE5cmrG6JhbgAi4EdNK60vSGAp49Ep+isAlgHiaKi9AN8IurmQHRt
         OVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=P9aCUW1rzu5AelnfWVsFeaoXGem/sTQovNbaiabceSE=;
        b=a240eOfpJesHWEc9tNpAYUjE9c9681G/IIdDO52XwBIndtJUG5sU8sSr4Tel1YnOmO
         oRhhvJ6jp1qCiG94j/8RYPxjy9E2Ui9bZDvyKdZrnpz7wUYzW4qqqZFCK4bgvOXDTxow
         +teZZlzZ6Fws20VmehtztxpQcdCAcARMcWJwZRUqrL3IbvsLdPLQC2jEqWwpuRBakOOU
         A4eREunk2n4RUoRyCR2FGIXuy3JbzO1Pyg7PqMuximf849AAMrtoWJq0J4yY4yisgYWa
         +4PiUoAUf1MNWi73UQG3zU3DxEgctXQPxW70cnjMk+rtHwBgANtUC5dCHtwA88vOXbAl
         HQhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PQGJmbQ2;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id fv10-20020a056214240a00b005e9e789f094si2659503qvb.437.2023.04.20.23.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 23:21:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PQGJmbQ2;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682058094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P9aCUW1rzu5AelnfWVsFeaoXGem/sTQovNbaiabceSE=;
	b=PQGJmbQ2YIUPcp9Q/mW2Lni0bdgtrR1GqcDp/1gNfb1i9Z9aI6uxMoIsVITD8TVSzw3cMs
	hXhUkAivT8AEIwolE7oQFlrpz4A6OqCxD/94H7KtOKhvsgxRTL/1Rj9A45mqL60zEHuGVc
	v4IFBSBp25D+RaqPlNUj2VWh2G1IyEA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-IBsQ4EZMOFeJoQy0LM6pmg-1; Fri, 21 Apr 2023 02:21:33 -0400
X-MC-Unique: IBsQ4EZMOFeJoQy0LM6pmg-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-50470d68f1eso1173300a12.0
        for <alex.bennee@linaro.org>; Thu, 20 Apr 2023 23:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682058092; x=1684650092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P9aCUW1rzu5AelnfWVsFeaoXGem/sTQovNbaiabceSE=;
        b=JK597J8qONvltyh9+oE9lm7Umea0GBraJ2bRRR7eOwLFkfGbWVAEmVJIX0l3Td6nXt
         mxSjEevEQD+VdSX6DRiNV+EiZrCi3NpDomJJ2tLE4KbCVe+HFkBiAp8enbsU7gPHqngm
         N6qdVUWuUFNAtn6TdBf/ghF3qjfcGrmkpGjXOdhGnD+FvleqGIZQWCk9+Mil/TrhplOH
         oYEXlc1+geznQUNsAn5+JanR2BT7xVGIupWekjGSnJ+VpP0scD4dEAKEVO2U0v+rVKtA
         +vTP3Sf/VH+BIMbbovYqZomlcSsdGQF1b70Ff8TK1ZlOIc4Xg6LWZUhiRsMuVdBEHYhO
         1LjQ==
X-Gm-Message-State: AAQBX9fD2ek7QiMSUn/JxaLZUjPtSf568lFOxr/2qZ0+ZYOPjCKUqiUS
	km8rgPV+G32k1THtkC50NgZDwzvyfUMXh9ZyPthdkVpePjRkWHyFUzdZ9sCIkVW2GiHMCQTulnp
	SrDupnZM4yD0gjQ3X
X-Received: by 2002:a05:6402:798:b0:506:adea:aaf2 with SMTP id d24-20020a056402079800b00506adeaaaf2mr3793348edy.18.1682058091831;
        Thu, 20 Apr 2023 23:21:31 -0700 (PDT)
X-Received: by 2002:a05:6402:798:b0:506:adea:aaf2 with SMTP id d24-20020a056402079800b00506adeaaaf2mr3793333edy.18.1682058091496;
        Thu, 20 Apr 2023 23:21:31 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de. [109.43.178.20])
        by smtp.gmail.com with ESMTPSA id r22-20020aa7cb96000000b0050696c2d2f6sm1506487edt.88.2023.04.20.23.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 23:21:30 -0700 (PDT)
Message-ID: <7836af42-9969-a01a-3c8c-717987b0b27e@redhat.com>
Date: Fri, 21 Apr 2023 08:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <2a2124d2-5fcf-cfd2-4f68-c3f602f2824e@redhat.com>
 <edcd817b-826f-f437-4ea3-33c5a567770a@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <edcd817b-826f-f437-4ea3-33c5a567770a@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: byWp0a3WpMYz

On 21/04/2023 06.19, Cleber Rosa wrote:
> 
> On 4/18/23 03:10, Thomas Huth wrote:
>> On 17/04/2023 15.43, Alex Bennée wrote:
>>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>>
>>> Avocado version 101.0 has a fix to re-compute the checksum
>>> of an asset file if the algorithm used in the *-CHECKSUM
>>> file isn't the same as the one being passed to it by the
>>> avocado user (i.e. the avocado_qemu python module).
>>> In the earlier avocado versions this fix wasn't there due
>>> to which if the checksum wouldn't match the earlier
>>> checksum (calculated by a different algorithm), the avocado
>>> code would start downloading a fresh image from the internet
>>> URL thus making the test-cases take longer to execute.
>>>
>>> Bump up the avocado-framework version to 101.0.
>>>
>>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>>> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>>>
>>> ---
>>> v2
>>>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
>>> ---
>>>   tests/Makefile.include | 18 +++++++++++-------
>>>   tests/requirements.txt |  2 +-
>>>   2 files changed, 12 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>> index 9422ddaece..a4de0ad5a2 100644
>>> --- a/tests/Makefile.include
>>> +++ b/tests/Makefile.include
>>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>>>   # download all vm images, according to defined targets
>>>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, 
>>> $(FEDORA_31_DOWNLOAD))
>>>   +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))))
>>> +
>>>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>>> -    $(call quiet-command, \
>>> -            $(TESTS_PYTHON) -m avocado \
>>> -            --show=$(AVOCADO_SHOW) run 
>>> --job-results-dir=$(TESTS_RESULTS_DIR) \
>>> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>>> -            --filter-by-tags-include-empty-key) \
>>> -            $(AVOCADO_CMDLINE_TAGS) \
>>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>>> +    $(call quiet-command,                             \
>>> +            $(TESTS_PYTHON) -m avocado \
>>> +            --show=$(AVOCADO_SHOW) run 
>>> --job-results-dir=$(TESTS_RESULTS_DIR)     \
>>> +            $(if $(AVOCADO_TAGS),,                         \
>>> +            --filter-by-tags-include-empty                 \
>>> +            --filter-by-tags-include-empty-key)             \
>>> +        --max-parallel-tasks $(JOBS_OPTION:-j%=%)             \
>>> +            $(AVOCADO_CMDLINE_TAGS)                         \
>>> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS),             \
>>
>> We might need to revisit this --failfast logic, too. If I've got that 
>> right, failfast is now the default with the new system? So we might want 
>> to disable it by default again if GITLAB_CI is not set?
>>
>>  Thomas
>>
> Hi Thomas,
> 
> I must be missing something, because under Avocado 101.0, I'm getting the 
> following behavior without the --failfast flag:
> 
>    $ avocado run --max-parallel-tasks=1 -- /bin/true /bin/false /bin/true
>    JOB ID     : 646f476f01b8d5599a57530606de543f2d9a5366
>    JOB LOG    : /root/avocado/job-results/job-2023-04-21T04.15-646f476/job.log
>     (1/3) /bin/true: STARTED
>     (1/3) /bin/true: PASS (0.01 s)
>     (2/3) /bin/false: STARTED
>     (2/3) /bin/false: FAIL (0.01 s)
>     (3/3) /bin/true: STARTED
>     (3/3) /bin/true: PASS (0.01 s)
>    RESULTS    : PASS 2 | ERROR 0 | FAIL 1 | SKIP 0 | WARN 0 | INTERRUPT 0 | 
> CANCEL 0
>    JOB TIME   : 1.01 s
> 
>    Test summary:
>    /bin/false: FAIL
> 
> And this with --failfast:
> 
>    $ avocado run --failfast --max-parallel-tasks=1 -- /bin/true /bin/false 
> /bin/true
>    JOB ID     : ae4894607a42194a7382efa545eccaccf7495fa3
>    JOB LOG    : /root/avocado/job-results/job-2023-04-21T04.17-ae48946/job.log
>     (1/3) /bin/true: STARTED
>     (1/3) /bin/true: PASS (0.01 s)
>     (2/3) /bin/false: STARTED
>     (2/3) /bin/false: FAIL (0.01 s)
>    Interrupting job (failfast).
>    RESULTS    : PASS 1 | ERROR 0 | FAIL 1 | SKIP 1 | WARN 0 | INTERRUPT 0 | 
> CANCEL 0
>    JOB TIME   : 0.75 s
> 
>    Test summary:
>    /bin/false: FAIL
> 
> Maybe it's something in the Makefile I'm missing, or something specific to 
> these tests, but that would be a long shot.

Ah, thanks, I think I simply got it mixed up while trying to read the above 
Makefile logic - never mind my question, it should be fine.

  Thomas
