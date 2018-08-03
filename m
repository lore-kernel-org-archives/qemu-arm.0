Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp88889wru;
        Fri, 3 Aug 2018 06:44:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpehkRn1T4kERAmS35htPr1GzCMBZC/7IKJVuCR0jyCjjiWF0Ry+AEXsPILHmsJk0o4w8Ag5
X-Received: by 2002:a0c:b24c:: with SMTP id k12-v6mr3547359qve.152.1533303864852;
        Fri, 03 Aug 2018 06:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533303864; cv=none;
        d=google.com; s=arc-20160816;
        b=eKi9QqRlkhIa964LLeK/5+Mm8evI7Mc3jhU1be3L8HwtGhIl/TKTRLoT2rtInIxX6+
         1Vzg1NviQjlT0KemeMEgfPP27FXJ2Ciyq2IvFXIfSafa9BKeCddH7T5zhwQ9C4IjMJaN
         v2pGRh8mREHU/cTPGZzBCVQw8SYF8E4cr9HTrE6AdmujV2yRzCoyt0XkAqQmtxJvsg14
         S4z/CNfV2YJr7TS/1iHqM3dIPqGXMmV2u8v8FhZ/CVpZg6VLrJhTSsoNSVL9Lv2COEOj
         1DUgol8CINVa7QAEo4ESMlbC9+1TGWjdtzYmOYpxGNiD4xja6KmK6OnT0gSutI71ieu9
         oY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=XRQXCKFoW8qhmx2M0s5rrW1iBDZoh/U+adoPOC2+MYY=;
        b=wvuPI4GQpWuJkrPNqbAulRDYrvGluJsVFhj7XQIHCcxv2CcTNjW+RruGYd/oRDdqc5
         UjbSLABo6qN2Qb4U06aZRI+B7sLKXd0KMP7dTbupUjpROd7R6Y11ihE7yqfXQIpOA8R8
         Xmf+3NZz4a5xN2DWC4TtbLBreD5/raYa2BMPWKMuGzUUqkO4HkzHno1Q2QwMWvhzTz8R
         HnE0XsHPaCJ3urMgiceJFyJ/O54jjAr/XX6j8gG9ZUVaEBhv8R/3nSme7bZoEvUkdaAt
         wG0EGEHZkrBlTfzCTB5mmXXi1iEB00Rx+xQQVHsjsqAxRnL3w+xwXrttpmcUlXpRqnM9
         /sUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id j3-v6si4869872qtc.98.2018.08.03.06.44.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Aug 2018 06:44:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3EB8F40216F7;
	Fri,  3 Aug 2018 13:44:24 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-198.rdu2.redhat.com [10.10.120.198])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FDB010CD6B5;
	Fri,  3 Aug 2018 13:44:22 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
To: Andrew Jones <drjones@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hongbo Zhang <hongbo.zhang@linaro.org>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com>
 <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com>
 <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
 <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com>
 <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
 <CAHmQWvB1zgaLi++BhGEs1Emb0-5HOrzCcPrHJDoxx-8Be9df1g@mail.gmail.com>
 <CAFEAcA_mVGSicjN=wwJY8OCJ-j=DtdLjDvM9U-dC3dQ=RQQXMQ@mail.gmail.com>
 <CAKv+Gu8sCjfL=uKy4nM6pcRneUzw2YG79CuOVBH3TeNOXf689A@mail.gmail.com>
 <20180803093748.2s563javprolaqsi@kamzik.brq.redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <730e9571-89fd-2ca2-f88f-47a3c0c3d235@redhat.com>
Date: Fri, 3 Aug 2018 15:44:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180803093748.2s563javprolaqsi@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Fri, 03 Aug 2018 13:44:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Fri, 03 Aug 2018 13:44:24 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-TUID: axO2yzf9Q5O8

Hi Drew,

On 08/03/18 11:37, Andrew Jones wrote:
> On Fri, Aug 03, 2018 at 11:26:41AM +0200, Ard Biesheuvel wrote:
>> On 3 August 2018 at 11:23, Peter Maydell <peter.maydell@linaro.org>
>> wrote:
>>> On 3 August 2018 at 10:21, Hongbo Zhang <hongbo.zhang@linaro.org>
>>> wrote:
>>>> The 'sbsa' machine won't consume QEMU generated ACPI, so it won't
>>>> touch or add new ACPI tables.
>>>>
>>>> UEFI relies on its ACPI to load OS, but currently it still needs DT
>>>> from QEMU to pass some info, one example is CPU number.
>>>>
>>>> So, the 'sbsa' code implementation should be like this:
>>>> A separate file, no ACPI codes, a little necessary DT codes.
>>>>
>>>> "Necessary DT codes" doesn't include so many peripheral devices
>>>> nodes, so the code overlap with virt won't be so much (contrary to
>>>> sbsa.c with all the DT codes), then no need to separate the common
>>>> part to a third file, and virt.c can be untouched or only a minor
>>>> change with few lines.
>>>
>>> Would the real hardware you are trying to be an example
>>> for use DT for this? It seems a bit unlikely to me.
>>>
>>
>> Yes, as a matter of fact. There is work underway both on the EDK2 and
>> the ARM-TF side to rely less on static descriptions, and more on DT
>> to instantiate drivers and ACPI tables at runtime rather than at
>> build time.
>
> Hi Ard,
>
> (A bit off-topic, but related to your comment above.)
>
> I started poking at teaching ArmVirtQemu how to get the base of RAM
> from the DTB, where the DTB is passed to it through x1 (QEMU needed a
> few new lines to ensure x1 had it in the firmware=y,-kernel=no case
> too). I have the assembler written, but I got hung up on the
> integration with edk2, because I don't understand the build files well
> enough yet to swap in ArmVirtPkg/PrePi/AArch64/ModuleEntryPoint.S for
> the ArmVirtQemu platform. I would also need to clean up the assembler
> a bit before posting. I'll be out-of-office for all next week, but if
> you send me some edk2 pointers in the meantime, then I should be able
> to post an RFC the following week.

"ArmVirtPkg/PrePi/AArch64/ModuleEntryPoint.S" is part of the
"ArmVirtPkg/PrePi/ArmVirtPrePiUniCoreRelocatable.inf" module.

This module is built as part of two platforms:

- ArmVirtPkg/ArmVirtQemuKernel
- ArmVirtPkg/ArmVirtXen

For each of those platforms, you'll find two files: DSC and FDF. DSC
("platform description") basically specifies what modules to build (and
with what settings), while FDF ("flash device file") specifies how to
lay out the flash device (i.e. how to include the EFI binaries built by
the DSC into a firmware image). The DSC file is the starting point. The
FDF file is referenced by the DSC (see [Defines] | FLASH_DEFINITION).

Now, based on the above, "ArmVirtPkg/PrePi/AArch64/ModuleEntryPoint.S"
is not the file that should be modified. Under ArmVirtPkg, three
firmware platforms exist in total:

- ArmVirtPkg/ArmVirtQemu
- ArmVirtPkg/ArmVirtQemuKernel
- ArmVirtPkg/ArmVirtXen

The first platform (ArmVirtQemu) is what gets booted from pflash.

The second platform (ArmVirtQemuKernel) is booted with the "-kernel"
QEMU option, *without* pflash (i.e. it is launched like a "naked" Linux
kernel).

The third platform (ArmVirtXen) is for booting in a Xen (PV)HVM VM.

The second and third firmware platforms (ArmVirtQemuKernel and
ArmVirtXen) share the trait that the UEFI payload is not the very first
payload to run in the guest. They are both launched by an earlier stage,
and they are loaded immediately into r/w memory. This has a big effect
on their entry points, and it gives them a lot more freedom in the
earliest code.

Because these firmware platforms (ArmVirtQemuKernel and ArmVirtXen)
share this trait, they both use the

  ArmVirtPkg/PrePi/ArmVirtPrePiUniCoreRelocatable.inf

SEC driver, which includes the assembly file you named. (You can see
"SEC" from MODULE_TYPE in the INF file.) The module says "relocatable"
in the name because, due to existing in r/w memory from the start, it is
at liberty to patch various things on the fly, for relocating itself.


The same does not apply to the ArmVirtQemu platform. It gets loaded into
pflash, as the very first payload to run. During the 1st (SEC) phase,
and until late into the 2nd (PEI) phase, code and global variables are
read-only. In other words, there's nothing we can patch at runtime.

Accordingly, ArmVirtQemu uses a different SEC driver; namely, it pulls
in:

  ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore.inf

for which the first assembly-language file is

  ArmPlatformPkg/PrePeiCore/AArch64/PrePeiCoreEntryPoint.S

Initially, only the stack is writeable -- and the location of the stack
is also hard-coded: see "PcdCPUCoresStackBase" in "ArmVirtQemu.dsc".

(The differences between the two *kinds* of platforms are explained
somewhat at
<https://github.com/tianocore/tianocore.github.io/wiki/ArmPlatformPkg>.
Unfortunately, the most important diagram that explains the boot flow
differences between "1st stage payload" and "2nd stage payload", namely
"ARM-EDK2-Overview.png", seems to have been lost when the TianoCore wiki
was moved from sourceforge to github. Sigh.)

In my earlier email

  dynamic DRAM base for ArmVirtQemu
  http://mid.mail-archive.com/4cce2b8b-a411-bd5d-a06f-b0b80a5fb2f1@redhat.com

I investigated what it would take to adapt this SEC driver,
"ArmPlatformPkg/PrePeiCore" (and other drivers that depend on it, and
run from pflash) to a dynamic RAM base.

First of all, the driver would have to be cloned from ArmPlatformPkg to
ArmVirtPkg (becasue we shouldn't / can't modify ArmPlatformPkg for this
paravirt feature). Then all the changes should occur under ArmVirtPkg.

Those would begin with replacing the fixed PcdCPUCoresStackBase (i.e.,
the location of the stack, which is the only writeable thing we start
out with) with calculating (and passing around) a stack base derived
from the initial x0 value. (This is bullet (1) in my above email.)

IOW, the cornerstone of this feature is to replace all constants
(FixedPCDs and otherwise) related to the RAM Base with values
dynamically calculated from the initial x0 value. My earlier email
details this as well -- at the earliest, the results can only be passed
around on the (dynamically configured) stack itself; a bit later, PPIs
(= structures identified by particular GUIDs, located originally in
temporary SEC/PEI RAM) can be used too. But, there's nothing ArmVirtQemu
can "patch" the way ArmVirtQemuKernel and ArmVirtXen do.

Thanks
Laszlo
