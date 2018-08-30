Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1472306wrd;
        Thu, 30 Aug 2018 00:07:30 -0700 (PDT)
X-Received: by 2002:a81:344:: with SMTP id 65-v6mr5098922ywd.373.1535612850696;
        Thu, 30 Aug 2018 00:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535612850; cv=none;
        d=google.com; s=arc-20160816;
        b=KAbBePyccuSlnH51Zc0lP6ooAkRh2Fv5oXiFFF6Uex/zk0v5NiPIcITSnOObQ8d2FW
         X4xHyfFGpHqOz2eAnQu+HYNDpE9bRVnfjP4UnmvQeTW3vteAJL9bBeU6zQtlyq7jiWHF
         armfzEoYyjJ6velSQWcKdXWMmTVQs4KtqZOG+txvD+5R2KJYWhlmkb5O99q4IoHGNPAv
         FR8M6DV+iEYK9wB5xVpOhltuzySB1KF49vWcGTF/JF78TYHzpPzEbb/31M0vROEn0JEt
         Jr9w4d5sqAff+VPyLJEmdSQ63qBvwM1Yiw1QvXVzHU300RcOfQr6DbnI/rKnJ3+Pk23Q
         R6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=YZLRq2zVo3ShRpPyYxkajkv7sbrh6GGeGQ99+wg2bz4=;
        b=CgWyuxyCQylYXTAlmO1LQgPwNaZo1z74TFlJzfqy7UpSuk+s6sfuAoyOtAR/rNFLjR
         AEI9GUmi3Aqomh1ATf4MQtIRu3PqYNox758S+Zx9mw8S/Nxg+rT4r6ClB6Ju7s2j3LmH
         pkBf1ZYqoNwR572dOGZiJjJGA32aNSUUX6n++DMSXxq3mzHe9yJZkjl5EFC8y/a4Cuig
         jKqLi7v5jtw362Wzy407XUkjJYvdreuwjm6P91Mox+pQ7GYqJrRoFRmrMpzPGDK8eln6
         lu9PrqrjGuCdy1/q96aQxlm2dQmtsP1K+5sNZwk7bkRY/Me0YpZHehNof4kPT6yuMdmg
         rjFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrTvSO+e;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o193-v6sor1657490ybg.73.2018.08.30.00.07.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Aug 2018 00:07:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrTvSO+e;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=YZLRq2zVo3ShRpPyYxkajkv7sbrh6GGeGQ99+wg2bz4=;
        b=SrTvSO+eSB0xWzmiqA6QdsL13bX8zceqd536bt6eViVo6NdPmhwgpBVyUxqvXQPzIs
         Qwqe/19zvrbHoJ44vh31+Z5Cp5pn1TobcJVwHXwiNeI0PyOJKVdLigbL2z7rfAf68k54
         bPNripdEVvHN763jKvISx38lBSBnGJGOB1xZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=YZLRq2zVo3ShRpPyYxkajkv7sbrh6GGeGQ99+wg2bz4=;
        b=R1yW+dBrrhUy7cwajP+MOIubipu472g/AO/+xoNPQCfsTfzMyZjsbu2W4YSmLe9Bmp
         XJvEIe0z6pl4/ZQVSnmH8Mws0CwgCsE8qIw7wlJkSgbNH+O7OZOwUq7V07RCHrUQv/6M
         y5TPmwQURGfDF3spnLdjONoNQRZFsThqy4yyoUcMaKX/sK1O+PYtjxMTDBLT7x6fQSrj
         e7Bm7+XylaONtLvxFVHAAZrdgEeXBzMZE7tsCEPJX//zwZddzLJ/rfsm8GdqYNDD7WIZ
         wmsSX5Pcy0/7NQbTrinBl1pa+AJntEtSGNX1H6jC79FYtPnVBVjbi8vNmrli/o7+nX9U
         RiXA==
X-Gm-Message-State: APzg51CjduFTdBgiXUjICgoD3wIchUFOjE37FYW1S/4eu6htsrtwuHIX
	H3l1ZsNWhiBtNMrNPYdZUbV3j739CKp5MYzPpAIyNDT2
X-Google-Smtp-Source: ANB0VdbYeeAyUgXkKQygEv2t6dVsKb6YgtIC0Wyjhd5uDMcbpYJYDf1WAFX0jLQ7TMH5m1Hhg2VxKxXCqMZEOjGfso4=
X-Received: by 2002:a25:7207:: with SMTP id n7-v6mr5209979ybc.287.1535612850169;
 Thu, 30 Aug 2018 00:07:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:8746:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 00:07:29
 -0700 (PDT)
In-Reply-To: <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com> <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 30 Aug 2018 15:07:29 +0800
Message-ID: <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5ewWeHGkyNhZ

On 29 August 2018 at 21:42, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Aug 29, 2018 at 05:17:20PM +0800, Hongbo Zhang wrote:
>> On 17 August 2018 at 21:37, Peter Maydell <peter.maydell@linaro.org> wrote:
>> > On 25 July 2018 at 06:30, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> >> For the Aarch64, there is one machine 'virt', it is primarily meant to
>> >> run on KVM and execute virtualization workloads, but we need an
>> >> environment as faithful as possible to physical hardware, for supporting
>> >> firmware and OS development for pysical Aarch64 machines.
>> >>
>> >> This patch introduces new machine type 'Enterprise' with main features:
>> >>  - Based on 'virt' machine type.
>> >>  - Re-designed memory map.
>> >>  - EL2 and EL3 are enabled by default.
>> >>  - GIC version 3 by default.
>> >>  - AHCI controller attached to system bus, and then CDROM and hard disc
>> >>    can be added to it.
>> >>  - EHCI controller attached to system bus, with USB mouse and key board
>> >>    installed by default.
>> >>  - E1000E ethernet card on PCIE bus.
>> >>  - VGA display adaptor on PCIE bus.
>> >>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>> >>  - No virtio functions enabled, since this is to emulate real hardware.
>> >>  - No paravirtualized fw_cfg device either.
>> >>
>> >> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>> >>
>> >> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>> >> ---
>> >> Changes since v1:
>> >>  - rebase on v3.0.0-rc0
>> >>  - introduce another auxillary patch as 1/2, so this is 2/2
>> >>  - rename 'sbsa' to 'enterprise'
>> >>  - remove paravirualized fw_cfg
>> >>  - set gic_vertion to 3 instead of 2
>> >>  - edit commit message to describe purpose of this platform
>> >
>> > Hi; there's been a lot of discussion on this thread. I'm going
>> > to assume that you don't need any further review commentary for
>> > the moment, and will wait for a v3. If there are any specific
>> > questions you want guidance on to produce that v3, let me know.
>> >
>> Thank you for this summary/remind.
>> Sorry for the late reply due to my vacation last week.
>>
>> Yes, I am working on the v3, with main changes:
>>  - machine name "sbsa-ref" (good name?)
>>  - a separate file sbsa-ref.c
>>  - don't touch the acpi c file, acpi will be supplied by uefi
>
> I agree with the above three bullets.
>
>>  - only necessary dt node, no other peripheral dt nodes
>
> I'm not sure what DT nodes are necessary. After discussing the
> ACPI tables, and that firmware would supply them, I thought we
> also agreed firmware would supply the DTB.
>
Yes, firmware supply ACPI to load OS.
But for DT, It is said that UEFI still needs some DT nodes, at least
for memory size. I am trying to figure out which DT nodes are
mandatory too, it is better we don't have any DT nodes left.

@Ard, @Leif, is there any possibility to remove all the DT nodes?
On real hardware, how does UEFI find the memory size and CPU number?

> Thanks,
> drew
>
>>
>> Before my sending, I still like comments on the above effort, it is
>> feasible/reasonable or not etc, in case I go wrong too much.
>>
>> I also know that some reviewers may like to give comments when they
>> see the patch codes, so if you don't have comments now, you can do it
>> after seeing the patch.
>> Thanks all.
>>
>> > thanks
>> > -- PMM
>>
