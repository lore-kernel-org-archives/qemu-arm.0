Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2717248lfo;
        Sun, 31 Jan 2021 07:23:11 -0800 (PST)
X-Received: by 2002:a5d:544b:: with SMTP id w11mr14245385wrv.1.1612106591497;
        Sun, 31 Jan 2021 07:23:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612106591; cv=none;
        d=google.com; s=arc-20160816;
        b=AqeQZmtc4DzzJ5ys1bem3pYND/V3reK8w2OyF7M2bAgBBtMajfHG/6aMP7kdYPUy9B
         J8PaVjGD3JBII3hD33bMwCoppHyxpnWpYW5HPnPGteQHE5QgLRTOLclBR3EFdk9MZn9I
         cplRh3OECmlvuVTt4QQsCHWu3/9zoksrBnmLXxhdEbMDGgPFbRf7t+Ck7WsN20m05QP5
         gzw/MkwUsT+UelZtJkQMzNSEkxtFrkD9g747PAW1cKarszEjw9jqA+MBalnLiRzmWyuP
         GpGPHh9OvYv/A6Jr1sAG6AsL4zuJd+sO48FCRdGlSYG1cONrrH5mdalJ7R5yK03it9KL
         43Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=IlBA0xV68vxE5C5ct9JiYhm7IT1MEObF+rNNEQCxzM0=;
        b=I6PM77FLklY3iOU76KKiEYYio5pxfYUgjVcj+epGtSe6zrLr5H3/GlXGhUbSq5l7mB
         XIFQ6o/Z3d/PdA64nU9y4Di4AnwDDbl/ZlHIIhmT3/RCgY6s3ztop5JvMD3Zuq5yM1v8
         FBFf+xfGf3nqJasME+SXa8B5qsL655SMtOw0wmggNCk6XkV0PS8iuUGr2LYX/a8O6B5r
         q0JkFJ8aeVs23gb54q3j5iPOmHgYFhMiytlRCrQPTr2wdJGeVjlvpvkGBejg/7Ek3Yaa
         Q7yYEkEXCCkUfZg3N6Pp0kaYWbdG8OLo/G4xWSg5RwGaUXQV8D+eTI4nmoBGA4v0mpA5
         ty7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=N5QC32NJ;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a7sor7547592wrp.52.2021.01.31.07.23.11
        (Google Transport Security);
        Sun, 31 Jan 2021 07:23:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=N5QC32NJ;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IlBA0xV68vxE5C5ct9JiYhm7IT1MEObF+rNNEQCxzM0=;
        b=N5QC32NJIPcvAJL62qyOJJi0CIMn/+eeOANJ4J366IyF2swlJQ+5aQAUbonTlT+mcf
         nFwxHWPoie6wSea1rMXw/484Wgntbb/3VdCOSV4sGPcaOWhUf80ExpfModyzg3zXnu1u
         KrERVi3EUYzhXajfTyzrzKP51iDg6VZC15U5XRy/UswLTmkdy3uigI0wzn4zO0dvGCdI
         zkYCqJxeTx0yjOtzYD+fcX3wtCeJdQRLpY0aKXJWa98YusX/QhrRzuWJQJzKcK+wR9/c
         /qtWr2q1nJKM+0awFprD8S5YnhkV2C+UwIiMCL76XMZc30X/KsAmk8ydVDFqsSGnQ7UA
         AFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IlBA0xV68vxE5C5ct9JiYhm7IT1MEObF+rNNEQCxzM0=;
        b=ZBWVGiUdBqgC1mgw+e9Y11YhxSAddv3Dht6nGYDD4D7n3YFibTnO8vwgmiKezD8I/N
         VA+hUe2fUusq9WcoWuRuK34Zl5uZBJ5whwVlfTXLHYKjUiLzLX5fk7c0DXppJz+nM9yt
         LcaDDslyXaMi9DM3s6MCwGHQON1EzL0knBPG54cdPqacAAfpa9QUZQd9w7BSnE2yBVx1
         CchQlPLTJqWFblXhAdtmeCsT0841GiLQqXdENb78Hy07STugbJZHHtQVH1sk/xfIt2ng
         ksZoEa6Z6tW3DhiL+Lp5OdRA/C8zO0/vRBmPiXiq36pi1zjF31Rg0R8u2ualEay+Auc1
         s0tQ==
X-Gm-Message-State: AOAM532fYJxBBeHxjj8KgKbQ2CzA0RLFafcHqvAACAPidZYbK5PRKOur
	jjhUTVc2BTBMdp6G5L3NIowv06iDnSE=
X-Google-Smtp-Source: ABdhPJwtjiQDaBDfckhvRQWpQImJ+jTDy28yTiQVjN19SY0g2CmQtFk7CetPl883mcXCmJ3WhY806g==
X-Received: by 2002:adf:dfc3:: with SMTP id q3mr13517477wrn.223.1612106591243;
        Sun, 31 Jan 2021 07:23:11 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id l7sm18733011wmg.41.2021.01.31.07.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 07:23:10 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v6 00/11] Support disabling TCG on ARM (part 2)
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210131115022.242570-1-f4bug@amsat.org>
 <9924223e-3aeb-5200-c7fa-f120a7ae30fe@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9e3503ce-0d01-8958-9f36-6892dfe80e93@amsat.org>
Date: Sun, 31 Jan 2021 16:23:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9924223e-3aeb-5200-c7fa-f120a7ae30fe@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: e+JEN7o9I5ng

On 1/31/21 3:40 PM, Claudio Fontana wrote:
> On 1/31/21 12:50 PM, Philippe Mathieu-Daudé wrote:
>> Cover from Samuel Ortiz from (part 1) [1]:
>>
>>   This patchset allows for building and running ARM targets with TCG
>>   disabled. [...]
>>
>>   The rationale behind this work comes from the NEMU project where
>>   we're trying to only support x86 and ARM 64-bit architectures,
>>   without including the TCG code base. We can only do so if we can
>>   build and run ARM binaries with TCG disabled.
>>
>> Peter mentioned in v5 [6] that since 32-bit host has been removed,
>> we have to remove v7 targets. This is not done in this series, as
>> linking succeeds, and there is enough material to review (no need
>> to spend time on that extra patch if the current approach is not
>> accepted).
>>
>> CI: https://gitlab.com/philmd/qemu/-/pipelines/249272441
>>
>> v6:
>> - rebased on "target/arm/Kconfig" series
>> - introduce/use tcg_builtin() for realview machines
>>
>> v5:
>> - addressed Paolo/Richard/Thomas review comments from v4 [5].
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
>> [5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg746041.html
>> [6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg777669.html
>>
>> Based-on: <20210131111316.232778-1-f4bug@amsat.org>
>>           "target: Provide target-specific Kconfig"
>>
>> Philippe Mathieu-Daudé (9):
>>   sysemu/tcg: Introduce tcg_builtin() helper
>>   exec: Restrict TCG specific headers
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
>>  default-configs/devices/aarch64-softmmu.mak |  1 -
>>  default-configs/devices/arm-softmmu.mak     | 27 --------
>>  include/exec/helper-proto.h                 |  2 +
>>  include/sysemu/tcg.h                        |  2 +
>>  target/arm/cpu.h                            | 12 ----
>>  hw/arm/realview.c                           |  7 +-
>>  target/arm/cpu_tcg.c                        |  4 +-
>>  target/arm/helper.c                         |  7 --
>>  target/arm/m_helper-stub.c                  | 73 +++++++++++++++++++++
>>  tests/qtest/cdrom-test.c                    |  6 +-
>>  .travis.yml                                 | 32 +++++++++
>>  hw/arm/Kconfig                              | 38 +++++++++++
>>  target/arm/Kconfig                          | 17 +++++
>>  target/arm/meson.build                      | 28 +++++---
>>  14 files changed, 196 insertions(+), 60 deletions(-)
>>  create mode 100644 target/arm/m_helper-stub.c
>>
> 
> Looking at this series, just my 2 cents on how I would suggest to go forward:
> I could again split my series in two parts, with only the TCG Ops in the first part.
> 
> Then this series could be merged, enabling --disable-tcg for ARM,
> 
> then I could extend the second part of my series to include ARM as well.
> 
> Wdyt? (Probably Richard?)

¯\_(ツ)_/¯

I respun because Richard unqueue your series, and it looks
there is no big clashing.

Anyhow meanwhile peer review is useful, and thanks for yours ;)

> 
> Thanks,
> 
> Claudio
> 
> 
> 
> 
