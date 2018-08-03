Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp148530wru;
        Fri, 3 Aug 2018 07:40:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdWE8xN0NwYaU8/C4eOaZaafMVTKaDzzLo2K7T2qgCK0qFpzbvS+eMo74ObSkm4lIYbTM+b
X-Received: by 2002:ac8:2ee8:: with SMTP id i37-v6mr4117826qta.383.1533307202758;
        Fri, 03 Aug 2018 07:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533307202; cv=none;
        d=google.com; s=arc-20160816;
        b=PPq7VXyikYTWLgNm+UkWxdlTiorEWusmjGnySkqtEXZw68yLEe/RcHTo2/742qB3uN
         1K7ObJoiNOBvFgWTX+VLqHrBPWyY0fot33EZiPm83OL6YhDIRNmSTp2VrlRZDwPZhKBY
         n2Ojk223YYShFLT2iSWiu5HyRAvotmAuOZz1qsC2intyc8qS1sply1SG4g8Hw8g7n9+w
         jL24kjrbE2RDWAm0f2ZiROYUWjUaYg8H79bQeRR5hluSiS5EksTF0+pBaJwtAs0y+Yly
         4ufJG+Fw+IwndTK8cU7w8iDlY/M/Vb++DGzaUBtyPUcKDHO4/v0AnYL7pgTORfDxpq2p
         WEIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=FGMSdAi+5EtpgZEEZAQmOJZ1yPky005IvRQc8QtZr08=;
        b=UU6m+h2U+7WGbP7wRo3ixvRQg7djEEMQB2cG3PjY8in80CtkIQs28qsmUuqIz6/LMP
         dqV5j/CO9fy4WCj3pBH8N49iY98c/ZTlB1X+xqjg2Cb/Q6T8O3W1Yoo11SEf3LUAd3Cx
         hk1x7LesB7PPSxHxAnIBnINUGF3FYV71j8VX0AvelPyReBXa/XpdTDJDvO2EIUEc+tD0
         8og6Kn/uPxbZRRS5eaHon2t2JpJKwSDX19UWTfKOhPx64MNVifBHhx4xwHtc4jwdLn78
         gVa8smQeENryOIkFsGbc2NUJpprkpJAyeWq5DqVsOuFyrq0kkAjS/diDXZB5jXP4L/f+
         yEmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id b48-v6si848020qtc.146.2018.08.03.07.40.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Aug 2018 07:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F44E8315E;
	Fri,  3 Aug 2018 14:40:02 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87D0210CD65A;
	Fri,  3 Aug 2018 14:40:00 +0000 (UTC)
Date: Fri, 3 Aug 2018 16:39:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180803143958.yyujxlmjiftuq4x3@kamzik.brq.redhat.com>
References: <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com>
 <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
 <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com>
 <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
 <CAHmQWvB1zgaLi++BhGEs1Emb0-5HOrzCcPrHJDoxx-8Be9df1g@mail.gmail.com>
 <CAFEAcA_mVGSicjN=wwJY8OCJ-j=DtdLjDvM9U-dC3dQ=RQQXMQ@mail.gmail.com>
 <CAKv+Gu8sCjfL=uKy4nM6pcRneUzw2YG79CuOVBH3TeNOXf689A@mail.gmail.com>
 <20180803093748.2s563javprolaqsi@kamzik.brq.redhat.com>
 <730e9571-89fd-2ca2-f88f-47a3c0c3d235@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <730e9571-89fd-2ca2-f88f-47a3c0c3d235@redhat.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Fri, 03 Aug 2018 14:40:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Fri, 03 Aug 2018 14:40:02 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: NEMIXCzPFgy7

On Fri, Aug 03, 2018 at 03:44:21PM +0200, Laszlo Ersek wrote:
> Hi Drew,
> 
> On 08/03/18 11:37, Andrew Jones wrote:
> > On Fri, Aug 03, 2018 at 11:26:41AM +0200, Ard Biesheuvel wrote:
> >> On 3 August 2018 at 11:23, Peter Maydell <peter.maydell@linaro.org>
> >> wrote:
> >>> On 3 August 2018 at 10:21, Hongbo Zhang <hongbo.zhang@linaro.org>
> >>> wrote:
> >>>> The 'sbsa' machine won't consume QEMU generated ACPI, so it won't
> >>>> touch or add new ACPI tables.
> >>>>
> >>>> UEFI relies on its ACPI to load OS, but currently it still needs DT
> >>>> from QEMU to pass some info, one example is CPU number.
> >>>>
> >>>> So, the 'sbsa' code implementation should be like this:
> >>>> A separate file, no ACPI codes, a little necessary DT codes.
> >>>>
> >>>> "Necessary DT codes" doesn't include so many peripheral devices
> >>>> nodes, so the code overlap with virt won't be so much (contrary to
> >>>> sbsa.c with all the DT codes), then no need to separate the common
> >>>> part to a third file, and virt.c can be untouched or only a minor
> >>>> change with few lines.
> >>>
> >>> Would the real hardware you are trying to be an example
> >>> for use DT for this? It seems a bit unlikely to me.
> >>>
> >>
> >> Yes, as a matter of fact. There is work underway both on the EDK2 and
> >> the ARM-TF side to rely less on static descriptions, and more on DT
> >> to instantiate drivers and ACPI tables at runtime rather than at
> >> build time.
> >
> > Hi Ard,
> >
> > (A bit off-topic, but related to your comment above.)
> >
> > I started poking at teaching ArmVirtQemu how to get the base of RAM
> > from the DTB, where the DTB is passed to it through x1 (QEMU needed a
> > few new lines to ensure x1 had it in the firmware=y,-kernel=no case
> > too). I have the assembler written, but I got hung up on the
> > integration with edk2, because I don't understand the build files well
> > enough yet to swap in ArmVirtPkg/PrePi/AArch64/ModuleEntryPoint.S for
> > the ArmVirtQemu platform. I would also need to clean up the assembler
> > a bit before posting. I'll be out-of-office for all next week, but if
> > you send me some edk2 pointers in the meantime, then I should be able
> > to post an RFC the following week.

Of course I meant x0 above. (I have no idea why I wrote x1.)

> 
> "ArmVirtPkg/PrePi/AArch64/ModuleEntryPoint.S" is part of the
> "ArmVirtPkg/PrePi/ArmVirtPrePiUniCoreRelocatable.inf" module.
> 
> This module is built as part of two platforms:
> 
> - ArmVirtPkg/ArmVirtQemuKernel
> - ArmVirtPkg/ArmVirtXen
> 
> For each of those platforms, you'll find two files: DSC and FDF. DSC
> ("platform description") basically specifies what modules to build (and
> with what settings), while FDF ("flash device file") specifies how to
> lay out the flash device (i.e. how to include the EFI binaries built by
> the DSC into a firmware image). The DSC file is the starting point. The
> FDF file is referenced by the DSC (see [Defines] | FLASH_DEFINITION).
> 
> Now, based on the above, "ArmVirtPkg/PrePi/AArch64/ModuleEntryPoint.S"
> is not the file that should be modified. Under ArmVirtPkg, three
> firmware platforms exist in total:
> 
> - ArmVirtPkg/ArmVirtQemu
> - ArmVirtPkg/ArmVirtQemuKernel
> - ArmVirtPkg/ArmVirtXen
> 
> The first platform (ArmVirtQemu) is what gets booted from pflash.
> 
> The second platform (ArmVirtQemuKernel) is booted with the "-kernel"
> QEMU option, *without* pflash (i.e. it is launched like a "naked" Linux
> kernel).
> 
> The third platform (ArmVirtXen) is for booting in a Xen (PV)HVM VM.
> 
> The second and third firmware platforms (ArmVirtQemuKernel and
> ArmVirtXen) share the trait that the UEFI payload is not the very first
> payload to run in the guest. They are both launched by an earlier stage,
> and they are loaded immediately into r/w memory. This has a big effect
> on their entry points, and it gives them a lot more freedom in the
> earliest code.
> 
> Because these firmware platforms (ArmVirtQemuKernel and ArmVirtXen)
> share this trait, they both use the
> 
>   ArmVirtPkg/PrePi/ArmVirtPrePiUniCoreRelocatable.inf
> 
> SEC driver, which includes the assembly file you named. (You can see
> "SEC" from MODULE_TYPE in the INF file.) The module says "relocatable"
> in the name because, due to existing in r/w memory from the start, it is
> at liberty to patch various things on the fly, for relocating itself.
> 
> 
> The same does not apply to the ArmVirtQemu platform. It gets loaded into
> pflash, as the very first payload to run. During the 1st (SEC) phase,
> and until late into the 2nd (PEI) phase, code and global variables are
> read-only. In other words, there's nothing we can patch at runtime.
> 
> Accordingly, ArmVirtQemu uses a different SEC driver; namely, it pulls
> in:
> 
>   ArmPlatformPkg/PrePeiCore/PrePeiCoreUniCore.inf
> 
> for which the first assembly-language file is
> 
>   ArmPlatformPkg/PrePeiCore/AArch64/PrePeiCoreEntryPoint.S

As always thank you Laszlo for the detailed explanation! I'll digest
it more when I'm back in the office.

> 
> Initially, only the stack is writeable -- and the location of the stack
> is also hard-coded: see "PcdCPUCoresStackBase" in "ArmVirtQemu.dsc".
> 
> (The differences between the two *kinds* of platforms are explained
> somewhat at
> <https://github.com/tianocore/tianocore.github.io/wiki/ArmPlatformPkg>.
> Unfortunately, the most important diagram that explains the boot flow
> differences between "1st stage payload" and "2nd stage payload", namely
> "ARM-EDK2-Overview.png", seems to have been lost when the TianoCore wiki
> was moved from sourceforge to github. Sigh.)
> 
> In my earlier email
> 
>   dynamic DRAM base for ArmVirtQemu
>   http://mid.mail-archive.com/4cce2b8b-a411-bd5d-a06f-b0b80a5fb2f1@redhat.com
> 
> I investigated what it would take to adapt this SEC driver,
> "ArmPlatformPkg/PrePeiCore" (and other drivers that depend on it, and
> run from pflash) to a dynamic RAM base.
> 
> First of all, the driver would have to be cloned from ArmPlatformPkg to
> ArmVirtPkg (becasue we shouldn't / can't modify ArmPlatformPkg for this
> paravirt feature). Then all the changes should occur under ArmVirtPkg.
> 
> Those would begin with replacing the fixed PcdCPUCoresStackBase (i.e.,
> the location of the stack, which is the only writeable thing we start
> out with) with calculating (and passing around) a stack base derived
> from the initial x0 value. (This is bullet (1) in my above email.)

I'm actually attacking it without a stack. x0 will have the address of
the DTB, which may or may not also be the base address of main memory.
There's no need to code to the assumption it is in order to have a
stack. The code to parse the DT can all be done in assembler without
a stack.

> 
> IOW, the cornerstone of this feature is to replace all constants
> (FixedPCDs and otherwise) related to the RAM Base with values
> dynamically calculated from the initial x0 value. My earlier email
> details this as well -- at the earliest, the results can only be passed
> around on the (dynamically configured) stack itself; a bit later, PPIs
> (= structures identified by particular GUIDs, located originally in
> temporary SEC/PEI RAM) can be used too. But, there's nothing ArmVirtQemu
> can "patch" the way ArmVirtQemuKernel and ArmVirtXen do.

I need to digest this more, too, and to modify it to use the actual base
of memory found in the DT, rather then value of x0, which may or may
not be the same value.

Thanks,
drew
