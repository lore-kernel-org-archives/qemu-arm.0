Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5379810lfq;
        Wed, 30 Sep 2020 03:21:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFoW1ohXo36f3N2bmhkDBV0d84Im812nNoNbKe+q/ukJjoDDWwQ0ZkhirZcKKK6tDgtO6S
X-Received: by 2002:a17:906:fb15:: with SMTP id lz21mr2008067ejb.185.1601461274104;
        Wed, 30 Sep 2020 03:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601461274; cv=none;
        d=google.com; s=arc-20160816;
        b=UvyUAeSq6bojVjScA2SQQ20CT3l1GTpvqIfydv05WKk5p0Q4o6x3ocCVWX/dGLlcSA
         UdRfEh9IQD6xuAPcQE7UZfJ4THvs7ytZUVREm9VZtvGGPBmh84wTxNfWdW4AJsQIIGdS
         S8aLV181ma5q8SS1Y30eEcjhF8cXUQpoFk8XUmqCBTQOIEQc4O+vuWs/Kg6HLukiAr0a
         2xWxMwY3KOZFAHYxOUlvkzLWvgnwWR8aikVfmTBmUFjX+1vYDmzE69RPyNxz8mx52nc4
         /c9jHf+2qQpSLAb5FUYiFWYIr3os1JGadMwSlldd5b8lCzLnXPCCkBCZ1ae4Ips1yHwN
         R8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=HKpq2oK2WNEzy5cJcVWHYsGnoJrgoZmDSZIZJeod+bc=;
        b=i0dFKEiYb0HfMwostWHEtjpstvAbYjCTMU/DyBptHobYkKubADOURMoyYAWbIUuXkn
         Id2DCAfztb7NwuSRwXiqwOwTKd7SeqOakmkZqbcJLKDDRNPOHg8/fR/lksSLjRaFSk+F
         FHgbWZCKCjzXMFOf9e4Zdq/wqEEGb/J/AXZNX0r79iG6Ru+QlAHGnhPOpIF7SogkcVDq
         Vea3HXmcdrVhk1AC68MtNXcIQt5FIcry2htsSzDGviBY3O+k+js/MR5E3r9cMD2ycowN
         WAlRBmxI5NqMuEh3QVVL9P3TMbSaBVLU8jPu7i18WpSebid2u9A7cmCNUF60JqhEmcXk
         H8hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bapuKhl5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id v10si695417eds.459.2020.09.30.03.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 03:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bapuKhl5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601461272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HKpq2oK2WNEzy5cJcVWHYsGnoJrgoZmDSZIZJeod+bc=;
	b=bapuKhl5rp5f0ei7UBSPfYrkgsYAMyEtmQpw53qKGiF+U3R6LcufON1fryeCk/1JqTDpPF
	To9Gts27sGYMetBK8QCb7LLC51aviIcnah9Wg3tbrtT7+Flnjw8pOrEaqJpUCYH8Jb1eo4
	/5IkxNDhoWEf9VNG0P9vWDrmDl9h5EI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-6dGirbqyPWi0wk--Sqn4gw-1; Wed, 30 Sep 2020 06:21:02 -0400
X-MC-Unique: 6dGirbqyPWi0wk--Sqn4gw-1
Received: by mail-wr1-f71.google.com with SMTP id r16so428546wrm.18
        for <alex.bennee@linaro.org>; Wed, 30 Sep 2020 03:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HKpq2oK2WNEzy5cJcVWHYsGnoJrgoZmDSZIZJeod+bc=;
        b=VE9ZEes5WKwLvFTOQ3IyI9FN+D0Z3NOk8lXtg5gtgw9g8Q2fJd7Ifxc0rJ7O4puopD
         BlBzDRimFoAyeyFJF7mK6jiJcjr71dGhgix5svq4Q8SbSntutemqvFWfRD/Qg9H8I+CZ
         B7Dbjtxf7jlnSckzuBjpd1c9sCl5xWAA6PV3qP5nN9d2DrTIsL2q55DFf2YIgxqHDjlQ
         YX/ajJnkxCKIhk6NHPR5yETS0f7X+t/j+zOfsT278IfyresWwH5dLFd15/N9Q/7yd3Wj
         8uylePdYii1jLRmbFilZvet3lyTsfxjlik/LsG4/44vRUyjFzUylmihSup6aTTnCvY7B
         xmxA==
X-Gm-Message-State: AOAM532oWwg4/lyZulLO4WUk5vT14fn/ovV6yAiISFbVziHGxQ+mtM6s
	yCsJ+9sMj7f0mo/meOjkpPJXFPi84rehGE/XLNuoCBc52pxwAw54feNEBMxxGVSC6KJBYfkmsjX
	oFOYLsan4IBdKULMX
X-Received: by 2002:a1c:7907:: with SMTP id l7mr2167345wme.89.1601461260924;
        Wed, 30 Sep 2020 03:21:00 -0700 (PDT)
X-Received: by 2002:a1c:7907:: with SMTP id l7mr2167326wme.89.1601461260625;
        Wed, 30 Sep 2020 03:21:00 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id i33sm2255084wri.79.2020.09.30.03.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 03:21:00 -0700 (PDT)
Subject: Re: [PATCH v4 00/12] Support disabling TCG on ARM (part 2)
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200930095841.3df7f8ee@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <1dd2c094-284c-0e32-bae3-0c227e5399ab@redhat.com>
Date: Wed, 30 Sep 2020 12:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200930095841.3df7f8ee@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: EYDaZ8oCCf4j

On 9/30/20 9:58 AM, Igor Mammedov wrote:
> On Wed, 30 Sep 2020 00:43:43 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Cover from Samuel Ortiz from (part 1) [1]:
>>
>>   This patchset allows for building and running ARM targets with TCG
>>   disabled. [...]
>>
>>   The rationale behind this work comes from the NEMU project where we're
>>   trying to only support x86 and ARM 64-bit architectures, without
>>   including the TCG code base. We can only do so if we can build and run
>>   ARM binaries with TCG disabled.
> 
> I don't recall exact reason but TCG variant is used by bios-tables-test
> to test arm/virt so it will probably break that
> (it has something to do with how KVM uses CPU/GIC, which was making
> ACPI tables not stable (i.e. depend on host), so comparison with master
> tables was failing)

Not a problem, we can restrict bios-tables-test to TCG.

I don't expect the KVM-only build being able to run many
of our current tests, as most of them expect TCG.

I'll have a look at restricting the TCG-dependent tests
after this series get accepted.

> 
>>
>> v4 almost 2 years later... [2]:
>> - Rebased on Meson
>> - Addressed Richard review comments
>> - Addressed Claudio review comments
>>
>> v3 almost 18 months later [3]:
>> - Rebased
>> - Addressed Thomas review comments
>> - Added Travis-CI job to keep building --disable-tcg on ARM
>>
>> v2 [4]:
>> - Addressed review comments from Richard and Thomas from v1 [1]
>>
>> Regards,
>>
>> Phil.
>>
>> [1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html
>> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html
>> [3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg641796.html
>> [4]: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg05003.html
>>
>> Green CI:
>> - https://cirrus-ci.com/build/4572961761918976
>> - https://gitlab.com/philmd/qemu/-/pipelines/196047779
>> - https://travis-ci.org/github/philmd/qemu/builds/731370972
>>
>> Based-on: <20200929125609.1088330-1-philmd@redhat.com>
>> "hw/arm: Restrict APEI tables generation to the 'virt' machine"
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg745792.html
>>
>> Philippe Mathieu-Daudé (10):
>>   accel/tcg: Add stub for cpu_loop_exit()
>>   meson: Allow optional target/${ARCH}/Kconfig
>>   target/arm: Select SEMIHOSTING if TCG is available
>>   target/arm: Restrict ARMv4 cpus to TCG accel
>>   target/arm: Restrict ARMv5 cpus to TCG accel
>>   target/arm: Restrict ARMv6 cpus to TCG accel
>>   target/arm: Restrict ARMv7 R-profile cpus to TCG accel
>>   target/arm: Restrict ARMv7 M-profile cpus to TCG accel
>>   target/arm: Reorder meson.build rules
>>   .travis.yml: Add a KVM-only Aarch64 job
>>
>> Samuel Ortiz (1):
>>   target/arm: Do not build TCG objects when TCG is off
>>
>> Thomas Huth (1):
>>   target/arm: Make m_helper.c optional via CONFIG_ARM_V7M
>>
>>  default-configs/arm-softmmu.mak |  3 --
>>  meson.build                     |  8 +++-
>>  target/arm/cpu.h                | 12 ------
>>  accel/stubs/tcg-stub.c          |  5 +++
>>  target/arm/cpu_tcg.c            |  4 +-
>>  target/arm/helper.c             |  7 ----
>>  target/arm/m_helper-stub.c      | 73 +++++++++++++++++++++++++++++++++
>>  .travis.yml                     | 35 ++++++++++++++++
>>  hw/arm/Kconfig                  | 32 +++++++++++++++
>>  target/arm/Kconfig              |  4 ++
>>  target/arm/meson.build          | 40 +++++++++++-------
>>  11 files changed, 184 insertions(+), 39 deletions(-)
>>  create mode 100644 target/arm/m_helper-stub.c
>>  create mode 100644 target/arm/Kconfig
>>
> 
