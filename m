Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4128517lfr;
        Mon, 12 Apr 2021 10:55:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7NCBJVS1mm/5u2vo2ZfqMqqNR3UbGFrr98D7sJZQsJxnx0x1mOtvItok4y53OinBe9cj7
X-Received: by 2002:a17:906:a10e:: with SMTP id t14mr21411001ejy.103.1618250153327;
        Mon, 12 Apr 2021 10:55:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618250153; cv=none;
        d=google.com; s=arc-20160816;
        b=FrnAO2pp80ofJ36X9Bei1LgGIlolFpztSh3Vdf5A+4EJyUjeWZR7Sgn7JcjOKGr0s6
         pk3Dmvy5nRXcJDfK447VwLukGae/rFjq1YrUPfnpW6Dj5wkOlKCMnjWrHUugttHoQNZN
         rmAfJvTme2UKfr5wD272IWqUPL6VRiSJkgp0AiNzmrYVTdfmwuF0wFi3PDzP3xZ0Zq5T
         yTzKKtzFdV4dDLqJAtdrnS0+LDsPyX4/0cuBD4dj+7gr2JZg/piKlqb9MJ7GDsJaRH7y
         flx4m0qks6POTFzpngxhzLn5VX2epgj1D8uch+Lkpd1KpNfk23U5rlu13GQAZ7MfnRLa
         XfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=4I/jK6qGFeqeeX1jfX4FwqC54GIlyL+4m5g/knaNbjw=;
        b=OYx9uQJLeiA2NKJBC0BDOvYnvcRDoO5kQcTpANMawcQE9Yh7jRw3GA+TtxOBvN4PYQ
         2JF36gdW42T9VpgkTBrP522zMBiiZDDuQs2qucuALAhKqNOpBPjU/aWcggIykxzkEpxL
         39uAjiPLNa+xkqkEMElelTGpuxYiaPD/+v9kY7cNdZG6BHFi6c537ulyOnQW1C4yuelL
         ZL9YzGJpi7nNa+SH/LS+kGX/rdibpQpFOZxIlfrc+IP62wdmNGytXqcdznPrheWu74pc
         vtkFKijZlXaQZpBFuI5JD19PO3IZ9phT5f8ZMWTHeNrEL4dtJOGTZU1eyBuETPEpe9wd
         qFjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GRd/IstG";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id i21si6908449ejg.243.2021.04.12.10.55.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Apr 2021 10:55:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GRd/IstG";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618250152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4I/jK6qGFeqeeX1jfX4FwqC54GIlyL+4m5g/knaNbjw=;
	b=GRd/IstGszhxgJdhERKG2BxH6dU+rK/XWIFFLMkjttM7kCxDXM3B89ELG0qbDNOH1Q3ZXz
	GIiOyTvoa8AsOWgrtaZNIdwqn2IGtKF6gVCAEjFXj7zZ0I0RRY6lUpdp2ovzjXR57TqO8A
	VDcut4fG7dFMchM8uGkWTfS1UgpUuco=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-q0Qw5T_hMnyWLKBFBUnguQ-1; Mon, 12 Apr 2021 13:55:50 -0400
X-MC-Unique: q0Qw5T_hMnyWLKBFBUnguQ-1
Received: by mail-ed1-f69.google.com with SMTP id b8so3646860ede.5
        for <alex.bennee@linaro.org>; Mon, 12 Apr 2021 10:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4I/jK6qGFeqeeX1jfX4FwqC54GIlyL+4m5g/knaNbjw=;
        b=dH6XpecgRKcdfj3pQSf3i5RWbfuJq4CJAqqG2zhXlAsT013jbOrcLC17vk4pys59zw
         RILtjNtGddvF5BU+t8egDdlPVb648wb/23NkG1QDyxVpgvcPPtFcOgL7G08tIq6vqP5c
         hJ4FTOAOMIfDIh6fIVNEFg5BMZVS9U5O/ipyaQMci073rk7POgENqGLLwqarxfqiHOqn
         nFCzqW7awtfQLCw1iiVwHJpJSWiHVf+0qJp6jtU6+aU0BhcKBgFaiV9F5hlwMTu1yhZx
         ogWZ8FduURyI2l9Jv+yp6J7uqCTsr1u5lzGW4N8S70wy3lM+Z1+BvlVoq5Tm9PUlcuTc
         yfxA==
X-Gm-Message-State: AOAM531Enk1tWcztHKFBcqxSRVKRns7UJwmIEXiogefTJ4cp8XJWxbPw
	xKvpyLAyib78Ra/8AAw2d0E/EVek0DScugV7OdoJE/0SLTPaVxFhKL3pn/ILAqBC89tEXfSrQN5
	A2VDnsA7z5VMsuGdU
X-Received: by 2002:a50:a699:: with SMTP id e25mr30175947edc.276.1618250149664;
        Mon, 12 Apr 2021 10:55:49 -0700 (PDT)
X-Received: by 2002:a50:a699:: with SMTP id e25mr30175936edc.276.1618250149516;
        Mon, 12 Apr 2021 10:55:49 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (63.red-83-51-208.dynamicip.rima-tde.net. [83.51.208.63])
        by smtp.gmail.com with ESMTPSA id e20sm1288829ejy.66.2021.04.12.10.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 10:55:48 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20200929224857.1225107-1-philmd@redhat.com>
 <87eefvnx3s.fsf@linaro.org> <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
 <87ft03wd3w.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9fa6362-7899-884e-58b9-f670143de6ae@redhat.com>
Date: Mon, 12 Apr 2021 19:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87ft03wd3w.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Gn6UIvvy/Uah

On 4/6/21 7:12 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 3/31/21 5:45 PM, Alex Bennée wrote:
>>>
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>
>>>> The current 'virt_kvm' test is restricted to GICv2, but can also
>>>> work with a GICv3. Duplicate it but add a GICv3 test which can be
>>>> tested on some hardware.
>>>>
>>>> Noticed while running:
>>>>
>>>>  $ avocado --show=app run -t machine:virt tests/acceptance/
>>>>  ...
>>>>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: ERROR: Unexpected empty reply from server (1.82 s)
>>>>
>>>> The job.log content is:
>>>>
>>>>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-kernel GICv2 emulation\n'
>>>>
>>>> With this patch:
>>>>
>>>>  $ avocado --show=app run -t device:gicv3 tests/acceptance/
>>>>  (1/1)
>>>>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>>>>  PASS (55.10 s)
>>>
>>> On the new aarch64 machine which is GICv3 I get the following:
>>>
>>>  (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2: ERROR: Unexpected empty reply from server (0.47 s)
>>>
>>> which it shouldn't have run. However:
>>>
>>>   ./tests/venv/bin/avocado --show=app run -t device:gic3 tests/acceptance/
>>>   Test Suite could not be create. No test references provided nor any other arguments resolved into tests
>>>
>>> Is this something that has regressed or am I doing it wrong?
>>
>> Typo in the tag: "device:gic3" -> "device:gicv3"
> 
> Doh!
> 
> But what about:
> 
> /tests/venv/bin/avocado run tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2
> JOB ID     : 396696d8f9d31d970878cb46025b2ced76f3623f
> JOB LOG    : /home/alex/avocado/job-results/job-2021-04-06T17.11-396696d/job.log
>  (1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2: ERROR: Unexpected empty reply from server (0.65 s)
> RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 0.96 s
> 
> why doesn't that skip?

/home/phil/avocado/job-results/job-2021-04-12T17.51-efdca81/job.log
2021-04-12 17:52:44,589 machine          L0389 DEBUG| Output:
"qemu-system-aarch64: Could not find ROM image
'/home/phil/qemu/build/host/pc-bios/edk2-aarch64-code.fd'\n"

Missing prerequisite:

$ ninja pc-bios/edk2-aarch64-code.fd
[1/1] Generating edk2-aarch64-code.fd with a custom command (wrapped by
meson to capture output)

Then we are good:

$ avocado --show=app,console run -t device:gicv3 tests/acceptance
JOB ID     : e84401e5cc3ae53a3094c79491e661385cc7b4a7
JOB LOG    :
/home/phil/avocado/job-results/job-2021-04-12T17.53-e84401e/job.log
 (1/1)
tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
PASS (16.38 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 16.70 s

Probably some missing dependency in Makefile/Meson?
