Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5024718lfr;
        Tue, 13 Apr 2021 09:25:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSeaWSR6lwUDuZfr0w0NBKWz7zBqmpY0H9vNkIsmNPW6utYa/NzCn2wWXiKItHjFHymL4d
X-Received: by 2002:a17:906:dfd6:: with SMTP id jt22mr16621359ejc.161.1618331152710;
        Tue, 13 Apr 2021 09:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618331152; cv=none;
        d=google.com; s=arc-20160816;
        b=ACoCOghwPoEn0vP7kRGimpA7AE8irXelA0FyGwl4fBQXnyqWGVUDUi7UiJ7cv9M40R
         o6FEiNlSp0h8yoYI5pEFRBdW2iXrHJszzwMxaP5Co1Yuw7ab1iSTrQmAxAbVVnFs53/n
         WSksHPy0F4OL4805eEZXyS5by1417VF6hab0iUq3A/xeUEbQPGcghxwISVEwp/dwmaub
         5t94wOJEeIX7KHZrEbc0oSNeuMEZfGGfld8h0H1ccUR6ydEcTWHqA3xJy1iPsXIxMz7e
         9k17ducOnq+xGsqJpbxYe0Sq8zzUoQKqVZkIji1DQ9FTeMQuhAo4MjeIUbB/iKd2ykV7
         32BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=UyzVXPm06xid7WZRO0ycGgH+l4t6vdGXgJBFtM+qvbk=;
        b=KUAVU2fG/pCbHCqsA1TQ/nzqcSw6gv0Tc11cs9FlFndCeFrWAqdzS5IaZImJ+4/bcn
         J/SUEqNYpjp8hog1mg2BwZmy8azwU87JhHAljF/QAmI5x4iSznD23VGhFRBmsAWvZemy
         Yf6q/V5X2+i6Y0b1jnnmyVCeB7COVaAqAG17XjBrN+SPqkI9ZfGTRBA9Izpvz41M9Uqg
         2iK+nZw1vGoQTh1uSE0iq3lF72uj+dD7YtL1u3KsFwRH0cCZ42jTqSQ3VsaO40oJMDSO
         6u99TBs5I2xxVkaK2+7YHweVaz2bkGEDeRSjU/ylp5D1bIkpJ1ddiXSSFqcr57vnbrU5
         pNmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PZSktz6c;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id j16si12571467edj.401.2021.04.13.09.25.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Apr 2021 09:25:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PZSktz6c;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618331151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UyzVXPm06xid7WZRO0ycGgH+l4t6vdGXgJBFtM+qvbk=;
	b=PZSktz6ctQAam5h1kNMYuNnfNjB9DEq2ucLkWkJ7v8JO/B/upFXkts1eC0fYWg+1bw8Vwg
	ji/bocmKeLHn1TkyM0NU53yndoBpIsi1+P/WIubLmFlIdhd6hht1ltGIpOQ/bV/XA4QSiu
	8VYh/I+90Q+ChVZA8bZ2MBmO4LMTv2w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-cZrev3ePMMGZcSfIOJi6JA-1; Tue, 13 Apr 2021 12:25:49 -0400
X-MC-Unique: cZrev3ePMMGZcSfIOJi6JA-1
Received: by mail-wm1-f71.google.com with SMTP id h10-20020a05600c350ab029010cff8d09edso2919854wmq.4
        for <alex.bennee@linaro.org>; Tue, 13 Apr 2021 09:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UyzVXPm06xid7WZRO0ycGgH+l4t6vdGXgJBFtM+qvbk=;
        b=YKanbIHN0ObGEOEz/AcuvVWlF+mpZlEhcCfk599aGkMozgrasOZCQAD8X9Si8ehfIv
         NUXSjJ1O5GL+wHTcicGzfTnS9yxuF3rtCYUItOwc8IH6EW3lpZm7ErDxZwek4ZyqVt/W
         GI16JQhldA2fVbNWWoGShyHtQSh0/lgIDGy96n3+mcr5orTaZnHbpjiKqhQ8I/kB0xZ8
         deCPYL7uRQhmLaygJIrks85LeG6vnWlS7ajs63qejLm1xP2m4mzuqByEeGFFijkctQkx
         EuypbxK8NZoI4v1gZ3czrf/BM0g7JuwGt1qXQW369Q15RcDBhlzDMVn2HXBmDPEfqHay
         6tvg==
X-Gm-Message-State: AOAM533qwlMHGo5hZ4EC79gsCIxIH9LBNU2OSedZGxVv3hWbHGwjUSsI
	XyKZjvYMcf6w21iHkoyAf9Eutbcd5I2KoCwXYMYX3LBFQd6PEXo9L0JiTnNVvHWrHSAKeScFBxM
	ioc7nNvO31jGrp4w0
X-Received: by 2002:adf:ba54:: with SMTP id t20mr9484554wrg.353.1618331148621;
        Tue, 13 Apr 2021 09:25:48 -0700 (PDT)
X-Received: by 2002:adf:ba54:: with SMTP id t20mr9484540wrg.353.1618331148460;
        Tue, 13 Apr 2021 09:25:48 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net. [81.40.121.39])
        by smtp.gmail.com with ESMTPSA id f25sm4588116wrd.43.2021.04.13.09.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 09:25:48 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20200929224857.1225107-1-philmd@redhat.com>
 <87eefvnx3s.fsf@linaro.org> <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
 <87ft03wd3w.fsf@linaro.org> <b9fa6362-7899-884e-58b9-f670143de6ae@redhat.com>
Message-ID: <a2a463cb-e2a1-1884-cc97-8c5b4689341b@redhat.com>
Date: Tue, 13 Apr 2021 18:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b9fa6362-7899-884e-58b9-f670143de6ae@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: rMT8akwKU/VD

Hi Alex,

On 4/12/21 7:55 PM, Philippe Mathieu-Daudé wrote:
> On 4/6/21 7:12 PM, Alex Bennée wrote:
>>
>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>
>>> On 3/31/21 5:45 PM, Alex Bennée wrote:
>>>>
>>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>>
>>>>> The current 'virt_kvm' test is restricted to GICv2, but can also
>>>>> work with a GICv3. Duplicate it but add a GICv3 test which can be
>>>>> tested on some hardware.
>>>>>
>>>>> Noticed while running:
>>>>>
>>>>>  $ avocado --show=app run -t machine:virt tests/acceptance/
>>>>>  ...
>>>>>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: ERROR: Unexpected empty reply from server (1.82 s)
>>>>>
>>>>> The job.log content is:
>>>>>
>>>>>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-kernel GICv2 emulation\n'
>>>>>
>>>>> With this patch:
>>>>>
>>>>>  $ avocado --show=app run -t device:gicv3 tests/acceptance/
>>>>>  (1/1)
>>>>>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>>>>>  PASS (55.10 s)
>>>>
>>>> On the new aarch64 machine which is GICv3 I get the following:
>>>>
>>>>  (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2: ERROR: Unexpected empty reply from server (0.47 s)
>>>>
>>>> which it shouldn't have run. However:
>>>>
>>>>   ./tests/venv/bin/avocado --show=app run -t device:gic3 tests/acceptance/
>>>>   Test Suite could not be create. No test references provided nor any other arguments resolved into tests
>>>>
>>>> Is this something that has regressed or am I doing it wrong?
>>>
>>> Typo in the tag: "device:gic3" -> "device:gicv3"
>>
>> Doh!
>>
>> But what about:
>>
>> /tests/venv/bin/avocado run tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2
>> JOB ID     : 396696d8f9d31d970878cb46025b2ced76f3623f
>> JOB LOG    : /home/alex/avocado/job-results/job-2021-04-06T17.11-396696d/job.log
>>  (1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2: ERROR: Unexpected empty reply from server (0.65 s)
>> RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>> JOB TIME   : 0.96 s
>>
>> why doesn't that skip?
> 
> /home/phil/avocado/job-results/job-2021-04-12T17.51-efdca81/job.log
> 2021-04-12 17:52:44,589 machine          L0389 DEBUG| Output:
> "qemu-system-aarch64: Could not find ROM image
> '/home/phil/qemu/build/host/pc-bios/edk2-aarch64-code.fd'\n"
> 
> Missing prerequisite:
> 
> $ ninja pc-bios/edk2-aarch64-code.fd
> [1/1] Generating edk2-aarch64-code.fd with a custom command (wrapped by
> meson to capture output)
> 
> Then we are good:
> 
> $ avocado --show=app,console run -t device:gicv3 tests/acceptance
> JOB ID     : e84401e5cc3ae53a3094c79491e661385cc7b4a7
> JOB LOG    :
> /home/phil/avocado/job-results/job-2021-04-12T17.53-e84401e/job.log
>  (1/1)
> tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
> PASS (16.38 s)
> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
> CANCEL 0
> JOB TIME   : 16.70 s
> 
> Probably some missing dependency in Makefile/Meson?

Are you using multiple build directories?

I could reproduce doing:

$ mkdir A B
$ cd A
$ make check-qtest-aarch64
$ avocado --show=app,console run -t device:gicv3 tests/acceptance
$ cd ../B
$ ninja qemu-system-aarch64
$ avocado --show=app,console run -t device:gicv3 tests/acceptance

In A edk2-aarch64-code.fd has been expanded in A/pc-bios/,
in B it isn't.

check-acceptance is a Makefile rule, not a ninja one...
I suppose we need to convert it to ninja to be able to use the
rest of the dependencies checks.

Cc'ing Paolo because I'm not sure what the best move and where
to plug things.
