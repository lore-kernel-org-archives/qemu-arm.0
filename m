Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp294802ejm;
        Thu, 20 Apr 2023 02:19:02 -0700 (PDT)
X-Received: by 2002:a05:600c:1c93:b0:3f1:65d4:30f7 with SMTP id k19-20020a05600c1c9300b003f165d430f7mr4396955wms.10.1681982342459;
        Thu, 20 Apr 2023 02:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681982342; cv=none;
        d=google.com; s=arc-20160816;
        b=Jwi0/JIs6Ao2PtvDksDuUcobQjtpl8v0SseOEjZB+Bj/WMRvHHzXpdmS4nm/fHeF9V
         poHeFX+nt/ku/IRhY2ZIoHVd+pOAdQbePuS4DKAZ9Uv+5T9HpNnBh1ExeB73pRrLReN8
         TjQU0SMF9wEJIF0xXnljcHZt+bJ4dSwp+wGZbYRtCf4l2ixqSBDLoqsV/f72alopVeea
         dM1ux0aXY5kQ0x/tBC4/3Ca3anqlf0dSQZ9o97za35Gv0ttLcimXvcdl+VbA1cvPlWhA
         neVNEgcVqNir558T0GL6UZn7n7FXfgBw+9pFDNVmtBekKcCfDRfRrQ2XVAdbF7Sfubo1
         xF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=36y8Q4O8F/j5BGJBVRxBjoQzTY5Un2PWUo5VblEeBto=;
        b=TdOSe7OSu4VzvEt2LJT8daRhE7SOLRW2QKS8/kO5N56/4ql25SKXtNFe7UOOkdNhdL
         53Gg9jUeWAINUm1K2pVhrLBcEDJkMl/q03iVJOu151MA1xJR96jvqiE6r7uJKhAHs3Oi
         zuvqKwzdQjyQT1w0sPrQF7wqNTLye43CnnhXKt0onQBssl/PMtJeCzUYdJXibyQNBmaf
         +6c4a9VgI5C6CvGDUHmcmAzPn84jOEuAt2+RyOiBALijnn+OWRBacqrB65bYCYT0FcP0
         vCcXCyb/3k6K9WVuy4mhKtF+1Y49hKIN9+LQn9R2gW6niHh6SChUXg3VEwKqHfqnzdsl
         Q7mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wIia/i7B";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k13-20020a05600c0b4d00b003f17329f7fbsor331114wmr.14.2023.04.20.02.19.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Apr 2023 02:19:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wIia/i7B";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681982342; x=1684574342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=36y8Q4O8F/j5BGJBVRxBjoQzTY5Un2PWUo5VblEeBto=;
        b=wIia/i7BRopG0lN7urUbbi+XyLnvfiNZHnnkDK1d20CSImamy9E2RwMSspElv9S9D0
         7tvHtsFYjv56iYpC/lByE6qPFgt8YnWbjMJUogUX7POUMn4K4DKeU6UPSgeT8HXjDC8f
         8pU29cIkBeMjBhvcgtraeDv9H65hpR62OFPNIbFAiyRSy/fNgYngFVmMLs1//sAXPCYu
         VqYyMq7gWSgP1yAhusrmMG30HUS4Vsj5MiWQl9amMg6DVUkUOb8lzySLV9oRzkIoJ8eW
         mjmWq/n9shuKiBueqA1VbQyUs0Vez+bQs/CfGRiH46eUzJQ6M3PI7z7worwb0LBaTd61
         9ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681982342; x=1684574342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=36y8Q4O8F/j5BGJBVRxBjoQzTY5Un2PWUo5VblEeBto=;
        b=YfH7hu6r7YudMOkGmzHoETF5envioWELGmhENcyOd60UKl+HacJmMjwzh0awHf2ukI
         C+sM9gy2ZSMiAxmgQMO1W3Cfd1HF7ID7LzGc+wKVpnsSk7eflnK/OjOdKeJrrwfQBHCa
         iim6GsLtR4ngVbex3jzpzNnCeGNQgcDxCV1dXBXklYFHDtM6mE0aPRYDaH8lbNWkS3jz
         J/O0slT20tWmrhqlLp6ow8dH8gNaVRgn03r0AfaApIvypQ26pd8CH9ymBrTJ2LDxoseL
         6FsN4y1HJM444EpqJaqvKEEZqfAzAOueErl2hIcs8jd6eeYEdzT+XXUWQWLeiPGefHBW
         m2XQ==
X-Gm-Message-State: AAQBX9foKG9ACnTBgBBErxKGHuHRKoUETgqrYGqgwll/eAqpZK9UoaPB
	ZCTqkgGs+f8vm9oWamdrinW5NcocYXMrfjnDRWPhRzFG
X-Google-Smtp-Source: AKy350alKRPqeXMQmUsZlj41ZvgLTOQa+3dT/NIx/r4CXwoF2ELIpQ8yPEeGegvEqTVxhqdZ1yakTQ==
X-Received: by 2002:a1c:7712:0:b0:3f1:70d5:1be8 with SMTP id t18-20020a1c7712000000b003f170d51be8mr805026wmi.15.1681982341691;
        Thu, 20 Apr 2023 02:19:01 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id z3-20020adff1c3000000b002fb9e73d5e5sm1418290wro.60.2023.04.20.02.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 02:19:01 -0700 (PDT)
Message-ID: <74be23e6-015b-cb1d-967e-65fc32347553@linaro.org>
Date: Thu, 20 Apr 2023 11:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, Jan Richter <jarichte@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
 <87pm82e74d.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87pm82e74d.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: X7gu7FZK60oy

On 17/4/23 19:44, Alex Bennée wrote:
> 
> John Snow <jsnow@redhat.com> writes:
> 
>> On Mon, Apr 17, 2023 at 9:43 AM Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
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
>>>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
>>> ---
>>>   tests/Makefile.include | 18 +++++++++++-------
>>>   tests/requirements.txt |  2 +-
>>>   2 files changed, 12 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>> index 9422ddaece..a4de0ad5a2 100644
>>> --- a/tests/Makefile.include
>>> +++ b/tests/Makefile.include
>>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>>>   # download all vm images, according to defined targets
>>>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
>>>
>>> +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))))
>>> +
>>>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>>> -       $(call quiet-command, \
>>> -            $(TESTS_PYTHON) -m avocado \
>>> -            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>>> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>>> -                       --filter-by-tags-include-empty-key) \
>>> -            $(AVOCADO_CMDLINE_TAGS) \
>>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>>> +       $(call quiet-command,                                                   \
>>> +            $(TESTS_PYTHON) -m avocado                                                 \
>>> +            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR)  \
>>> +            $(if $(AVOCADO_TAGS),,                                             \
>>> +                       --filter-by-tags-include-empty                          \
>>> +                       --filter-by-tags-include-empty-key)                     \
>>> +               --max-parallel-tasks $(JOBS_OPTION:-j%=%)                       \
>>> +            $(AVOCADO_CMDLINE_TAGS)                                            \
>>> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS),                   \
>>>               "AVOCADO", "tests/avocado")
>>>
>>>   check-acceptance-deprecated-warning:
>>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>>> index 0ba561b6bd..a6f73da681 100644
>>> --- a/tests/requirements.txt
>>> +++ b/tests/requirements.txt
>>> @@ -2,5 +2,5 @@
>>>   # in the tests/venv Python virtual environment. For more info,
>>>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>>   # Note that qemu.git/python/ is always implicitly installed.
>>> -avocado-framework==88.1
>>> +avocado-framework==101.0
>>>   pycdlib==1.11.0
>>> --
>>> 2.39.2
>>>
>>
>> I thought there were test failures that prohibited us from bumping the
>> Avocado-Framework version. Did those get rectified recently?

No, still not working on Darwin. At this point I'm thinking at sending
a patch clarifying testing QEMU with Avocado is not supported on Darwin.

> I'm not seeing any with your patch applied.

Are you using running the Cirrus-CI jobs?
