Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5387444wrt;
        Wed, 30 Jan 2019 00:23:28 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5LAesSg2zjPpgTbBPUJHaGVioo3BbqMKZSvBtCTp0N+zcnMuUO8t81FPn4+Oy9v8+sTDOp
X-Received: by 2002:ac8:7451:: with SMTP id h17mr28568804qtr.319.1548836608661;
        Wed, 30 Jan 2019 00:23:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548836608; cv=none;
        d=google.com; s=arc-20160816;
        b=W0LawlysnMTBnVLEZ9xmqTTHz67KYL5hnR2DYEiM1QSkMHYU7eNpeYMTPooNFYdbG7
         tlajOvlwj5Ah8jQXeRF1rks5OLAym8DGvILsCW1pquhCrnSCsbbG6YTvleNn8PqR8cjW
         v7tWL9THXGpFZAKJZ4eMJ2BP05STZ3ecWYlesjs+nBKRI0Vgj1oe1x+obqLGOutRXN4T
         rB207ugl7JtHufnbvzzIQ7kRC2eB6YXMUSM/SZdEYLwQCf2Dbrl9c5YWIAqZdYuxWHF7
         SSUV987JaAuj0Z0h37EcZs/oYyiWx3KFG8w4sQ58rl+pV9DJmCJ/rY47BDOFYTaqvN4/
         JHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=qu/JH9WrR7PwW8KVHEp8a2NWMFhHtjXyea/Fj6O4PlY=;
        b=RPTCRlOulNr7nMPu8NAbyiX7qXw8xJ3SY4nZV+wPRINB9/kc0yOt9uRs1eZDyl6/o0
         wF8GNX+C2OBxNkiKKG0t+uswOG9AowpB41FzCOdGSMan5P0F87IZraRZGSJ6x6ZiaI3P
         CSiJeSIP0E4bbWww9RBoA/SutybnKNnyOQzan+Y6O5RdWY7kqhs4EQ9v8leYJch8DKi2
         LahqHet6y5m8bBW9TRAF4t1WeIlYjiNWfSnQSxXrKq4SZTLO9nbvpZU2N14X/1d2082l
         M1ttA5XeC7RJUJ9C/YWkcyPEl+YX7nqoVmKRpXZd9yKh5LL6HpVg11cVSwadOT3LSb+r
         TtXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id i66si107292qkb.156.2019.01.30.00.23.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Jan 2019 00:23:28 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D87E81F0B;
	Wed, 30 Jan 2019 08:23:27 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (unknown [10.36.112.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4203A5C224;
	Wed, 30 Jan 2019 08:23:25 +0000 (UTC)
Date: Wed, 30 Jan 2019 09:23:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Radoslaw Biernacki
 <radoslaw.biernacki@linaro.org>, Ard Biesheuvel
 <ard.biesheuvel@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, Leif
 Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, Alex
 =?UTF-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v5 2/2] hw/arm: add Arm SBSA reference
 machine, devices part
Message-ID: <20190130092321.1ddbd29a@Igors-MacBook-Pro.local>
In-Reply-To: <CAFEAcA_+UhU56D7Yx5K8+=DbtUiiV8V7sX2UgxFKSkScUypxFg@mail.gmail.com>
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
	<1544173675-14217-3-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA9mF+WiPLW4yyv1aEMLTg2QK2krZvxyjCSsMziJtzx3Ug@mail.gmail.com>
	<CAHmQWvCw5ndod93WqLXDgGxDERtRM3ee_qiLA+S34Y9X2JFvVQ@mail.gmail.com>
	<CAFEAcA_+UhU56D7Yx5K8+=DbtUiiV8V7sX2UgxFKSkScUypxFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 30 Jan 2019 08:23:27 +0000 (UTC)
X-TUID: QqdiH7feLgo1

On Tue, 29 Jan 2019 15:26:29 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 28 Jan 2019 at 09:46, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >
> > On Tue, 22 Jan 2019 at 19:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Fri, 7 Dec 2018 at 09:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > > > +static void sbsa_ref_machine_done(Notifier *notifier, void *data)
> > > > +{
> > > > +    VirtMachineState *vms = container_of(notifier, VirtMachineState,
> > > > +                                         machine_done);
> > > > +    ARMCPU *cpu = ARM_CPU(first_cpu);
> > > > +    struct arm_boot_info *info = &vms->bootinfo;
> > > > +    AddressSpace *as = arm_boot_address_space(cpu, info);
> > > > +
> > > > +    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
> > > > +        exit(1);
> > > > +    }
> > > > +}
> > >
> > > I still don't understand why we need this -- it doesn't seem
> > > to be doing anything different from the default behaviour that
> > > boot.c implements if skip_dtb_autoload is false.
> > >
> >
> > According to the process of arm_load_kernel() in boot.c, If only
> > kernel loaded via -kernel but without any firmware, it works fine.
> > While in this case, we have have firmware loaded but no kernel (eg
> > firmware loads kernel from storage, firmware never come back to qemu
> > again), so the arm_load_kernel() returns in the middle before calling
> > arm_load_dtb(),  because arm_load_dtb() is the final step in
> > arm_load_kernel(), so there is no chance for the arm_load_dtb() to be
> > called, then we get error message and qemu quits.
> 
> Oh, I see now. I think this is a bug in boot.c and we should
> fix it by making the "this is a firmware boot" code path also
> do the arm_load_dtb() call. I'll send a patch.
pls, CC me on it as well.

I'm interested in it from hotplug + reboot perspective,
where we have a changed/bigger DTB on reboot as it contains new devices (cpus|memory)

loading rom like now doesn't work nice in case of reboot.

> 
> thanks
> -- PMM
> 
