Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1038653ejm;
        Fri, 21 Apr 2023 03:08:01 -0700 (PDT)
X-Received: by 2002:a05:600c:3657:b0:3f1:72ec:400d with SMTP id y23-20020a05600c365700b003f172ec400dmr1419600wmq.33.1682071681814;
        Fri, 21 Apr 2023 03:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682071681; cv=none;
        d=google.com; s=arc-20160816;
        b=X/L6tItsBJulsNqSnPx+cqMTjbNCc1kb9uGC5zOOUoi2U54zN3So43t3DcRCOwbOFj
         NDSQ3LKOFrvd/qJZyj49+xFq5Chz9cpqxBEN5ZaNe3De4m7M8Y4Kk0JIy3S5W86SZvIz
         D5v//SiJE3dDrvrVN7u/t1bclGdFWESndRqY4EmKyiEqRTmRN/u5RBvY95a5mxmCTs5s
         oRwU4FQ1Og5qgA+nBtHYSJUDUNKZUbCxWjnDTkG3rmsXQmwmSjWtYFphY2RZWmCOnOen
         mjE0srF1HtnUu0u4KI/MR+cmYCfVfc/au0O2fznmc5eUA0R6I4gDX8mxAH6dT5/3BUIh
         XH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ReHNjkIDoWkUpGRJS8gQsbm/eBQuxGHSsdTGePOJUGs=;
        b=VAqMxXO7RXHFGl4h5k/6L3mS3FwhIwgML83dpFTMflBBEyhciPIbCiQuv3vHX6MZbJ
         Xhyd9ShaHkoi2ot3esiVq+b324wz/mj3yk97ZsZh6m8LIn/s9S1RIjXwndgVDElpBfla
         OhhCWV5IjL9zXNGDrZklDX/TAJee8pvCrDQqTKAEwH4R92qRISqdPaW8eQbNOc6slvSk
         MJeyEpR3esM6+bpghWI9TSGPR91+7MLWiBX+kRk7tliI3jwT5HXAitalmkjXWXlwQA5i
         /RdJ8HJ2S0o4JvWnaDd+yBBYFtarkwv2gE534koB8JhO07WFicnDrzNsr5ot6aNtU63R
         lT8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlIeXXiw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h17-20020a056000001100b002f827cf1cb9sor1741807wrx.65.2023.04.21.03.08.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Apr 2023 03:08:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QlIeXXiw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682071681; x=1684663681;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReHNjkIDoWkUpGRJS8gQsbm/eBQuxGHSsdTGePOJUGs=;
        b=QlIeXXiwV4WC+IGlPT1Z22kSn02uQtL9IAfm+jc2Lu6f5gHZVs2UsvwMMSxCdAAxeB
         EyUmH70ygTt7ik/UxE+jDJJhnMZ0FKN8lOxQICAE91NrcktWvvAaSJtR+Bq9pW7v46ZB
         WGPxXz3ZlHewz7MpXTH/xPlGd2OfN9OO+IZ6uTqHed9kuou22NY2R6w2V81AFc9t0Q7R
         J0NxKXmp7TXQivzAfZiEmnWDQj+XU5zZ50OiIcvW0FvUTkuZalpwopar6fZGDDvUw9ZM
         bXy+KFrUgv2L4GOfslQUVYStEnYK0EPxV0e/7vmv/g62QYMDbVp8RNkf5Hvar3bFEGDZ
         BKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682071681; x=1684663681;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReHNjkIDoWkUpGRJS8gQsbm/eBQuxGHSsdTGePOJUGs=;
        b=H4CYDC6gjDhcYT3epWE+d7FW3Gv0p8PYlGP7bU3+0mf6bG8NfiPf5Vk0nj5gocBVIY
         3Ypqtx8Q+t0Kqyk2Hv14KHBtER/cRHq4j/jhB+dX4L7IQSToEk0BoejHEc/+LA5WMIlx
         2Qhca5jko49E7orpjoBB8uL0GQSZwM8X20aBHO/3DiQCiaUJImEEQ9m7bH61rVyQEHYm
         aDw6ppWLqQO5yEOJr7U53W0RiHWG1NhCz7uM7MYCEb6L0p6cfLoxUiHvbreluxQ8eDMS
         otcQlxL8TR82kB+PPXs9ZQTA3B1/6q7JdMgEAXPEtyC1BsCtu6Jh1mCSHVJF8VtNSiAG
         2Y1Q==
X-Gm-Message-State: AAQBX9f0rjM9fvEkB4zz2f7Bv6kqaoigEkTZuBHobfAvIOh5ThaoFnc3
	8yCK1N9abCFYxS5/TH27a11wnAWb
X-Google-Smtp-Source: AKy350aElyiRgIp0WxW93eVSqUXG3mEip2ECwbk2smqtWJjcc3nfmH1LGGWoRF+9gIRsE/8BmnkhDQ==
X-Received: by 2002:a5d:540f:0:b0:2f9:4fe9:74df with SMTP id g15-20020a5d540f000000b002f94fe974dfmr3373180wrv.17.1682071681411;
        Fri, 21 Apr 2023 03:08:01 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr. [176.184.28.119])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c358800b003f1738d0d13sm10795048wmq.1.2023.04.21.03.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 03:08:01 -0700 (PDT)
Message-ID: <fb01dbfa-426a-f87c-620b-c5e7b6d6598e@linaro.org>
Date: Fri, 21 Apr 2023 12:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jan Richter <jarichte@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
 <87pm82e74d.fsf@linaro.org> <74be23e6-015b-cb1d-967e-65fc32347553@linaro.org>
 <CAFn=p-boa4C1P0mJob=spZGMi4ECA-D5yNovHxC6-VTwkKJoHg@mail.gmail.com>
 <9a0a7b21-8798-d5d3-bf4b-f1de38e82581@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <9a0a7b21-8798-d5d3-bf4b-f1de38e82581@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zjNmztE74ssw

On 21/4/23 06:09, Cleber Rosa wrote:
> 
> On 4/20/23 12:54, John Snow wrote:
>>
>>
>> On Thu, Apr 20, 2023, 5:19 AM Philippe Mathieu-Daudé 
>> <philmd@linaro.org> wrote:
>>
>>     On 17/4/23 19:44, Alex Bennée wrote:
>>     >
>>     > John Snow <jsnow@redhat.com> writes:
>>     >
>>     >> On Mon, Apr 17, 2023 at 9:43 AM Alex Bennée
>>     <alex.bennee@linaro.org> wrote:

>>     >>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>>     >>> index 0ba561b6bd..a6f73da681 100644
>>     >>> --- a/tests/requirements.txt
>>     >>> +++ b/tests/requirements.txt
>>     >>> @@ -2,5 +2,5 @@
>>     >>>   # in the tests/venv Python virtual environment. For more info,
>>     >>>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>     >>>   # Note that qemu.git/python/ is always implicitly installed.
>>     >>> -avocado-framework==88.1
>>     >>> +avocado-framework==101.0
>>     >>>   pycdlib==1.11.0
>>     >>> --
>>     >>> 2.39.2
>>     >>>
>>     >>
>>     >> I thought there were test failures that prohibited us from
>>     bumping the
>>     >> Avocado-Framework version. Did those get rectified recently?
>>
>>     No, still not working on Darwin. At this point I'm thinking at 
>> sending
>>     a patch clarifying testing QEMU with Avocado is not supported on
>>     Darwin.
>>
>>
>> What's broken on Darwin?
>>
> Hi John,
> 
> IIRC, the main issue is that the legacy runner (the one active in 88.1) 
> pickles some stuff that do not play nice under Darwin.  It has never (to 
> the best of my knowledge) worked under Darwin.

Correct.

>> Is it broken with avocado-framework==88.1 too? (Is this a regression?)
>>
> It was already broken with avocado-framework==88.1,

Correct.

> but it should mostly 
> work with 101.0 (see previous reply).
> 
>> We might need to consider entirely separate issues:
>>
>> (1) We need to upgrade avocado-framework to a supported LTS version >= 
>> v90 for dependency harmony with qemu.git/python testing
>>
>> (2) We need to upgrade avocado-framework to >= v101.0 to fix the 
>> stated checksum issue in this patch
>>
>> (3) We would like avocado tests to work on Darwin. (Have they ever 
>> worked? When did they break? etc.)
>>
>> My understanding is that this patch helps with 1 and 2 but not 3, but 
>> if Darwin support isn't a regression, this is still a step forward.
>>
> To the best of my knowledge, this patch would help with 1, 2 and even 3.

As of today using v8.0.0:

$ make check-avocado
   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 
tests/fp/berkeley-softfloat-3 dtc
   MKDIR   /Users/philmd/source/qemu/build/tests/results
   AVOCADO Downloading avocado tests VM image for aarch64
The image was downloaded:
Provider Version Architecture File
fedora   31      aarch64 
/Users/philmd/avocado/data/cache/by_location/4f156e531446a679cbfe13caef8b7c9f9f79aafa/Fedora-Cloud-Base-31-1.9.aarch64.qcow2
   AVOCADO tests/avocado
Fetching asset from 
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_raspi3_atf
Fetching asset from 
tests/avocado/boot_xen.py:BootXen.test_arm64_xen_411_and_dom0
Fetching asset from 
tests/avocado/boot_xen.py:BootXen.test_arm64_xen_414_and_dom0
Fetching asset from 
tests/avocado/boot_xen.py:BootXen.test_arm64_xen_415_and_dom0
Fetching asset from 
tests/avocado/machine_aarch64_virt.py:Aarch64VirtMachine.test_alpine_virt_tcg_gic_max
Fetching asset from 
tests/avocado/replay_kernel.py:ReplayKernelNormal.test_aarch64_virt
Fetching asset from 
tests/avocado/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
JOB ID     : 142a0b2d3960c7daccd657781d52f814e1617392
JOB LOG    : 
/Users/philmd/source/qemu/build/tests/results/job-2023-04-21T11.35-142a0b2/job.log

Avocado crashed: TypeError: cannot pickle '_thread.RLock' object
Traceback (most recent call last):

   File 
"/Users/philmd/source/qemu/build/tests/venv/lib/python3.10/site-packages/avocado/core/job.py", 
line 632, in run_tests
     summary |= suite.run(self)

   File 
"/Users/philmd/source/qemu/build/tests/venv/lib/python3.10/site-packages/avocado/core/suite.py", 
line 311, in run
     return self.runner.run_suite(job, self)

   File 
"/Users/philmd/source/qemu/build/tests/venv/lib/python3.10/site-packages/avocado/plugins/runner.py", 
line 390, in run_suite
     if not self.run_test(job, test_factory, queue, summary,

   File 
"/Users/philmd/source/qemu/build/tests/venv/lib/python3.10/site-packages/avocado/plugins/runner.py", 
line 170, in run_test
     proc.start()

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/process.py", 
line 121, in start
     self._popen = self._Popen(self)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/context.py", 
line 224, in _Popen
     return _default_context.get_context().Process._Popen(process_obj)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/context.py", 
line 288, in _Popen
     return Popen(process_obj)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/popen_spawn_posix.py", 
line 32, in __init__
     super().__init__(process_obj)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/popen_fork.py", 
line 19, in __init__
     self._launch(process_obj)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/popen_spawn_posix.py", 
line 47, in _launch
     reduction.dump(process_obj, fp)

   File 
"/opt/homebrew/Cellar/python@3.10/3.10.9/Frameworks/Python.framework/Versions/3.10/lib/python3.10/multiprocessing/reduction.py", 
line 60, in dump
     ForkingPickler(file, protocol).dump(obj)

TypeError: cannot pickle '_thread.RLock' object

Please include the traceback info and command line used on your bug report
Report bugs visiting https://github.com/avocado-framework/avocado/issues/new
make: *** [check-avocado] Error 4

This is https://github.com/avocado-framework/avocado/issues/4888
which is still opened.

Manually using "avocado run --test-runner=nrunner" helps running the
tests but the console output is never displayed (see [*]) and once
finished Avocado lets various QEMU processes running in detached
mode, wasting resources.

[*] 
https://lore.kernel.org/qemu-devel/1d0baf8b-c757-265c-b206-07ca3f218b2a@linaro.org/
