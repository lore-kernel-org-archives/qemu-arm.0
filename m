Received: by 2002:ac2:4c90:0:0:0:0:0 with SMTP id d16csp38477lfl;
        Wed, 19 Jan 2022 13:15:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgwFV34e1t17l70RohTGBkNeKAFYiwtTuPPscLOs2gv9gCAqHl3xfThcm1izDymeBqGnBc
X-Received: by 2002:a05:6402:1686:: with SMTP id a6mr6886977edv.90.1642626949679;
        Wed, 19 Jan 2022 13:15:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642626949; cv=none;
        d=google.com; s=arc-20160816;
        b=DPLY9OfQ/KDfZkeJGpWOJ9l9acTIlDJvCgXx44wGK0r8v7OwrA08CTseaxjx/rWfhj
         hwovBObK5ip9ajMg/v7VYbROogZuJRB8nXKAaMe2eiNDa0dJ+fr0C/Aeij4YkH4+S39Y
         a1r4HRpjSqaewMUBOMAlUnW1T9sK+xrgaXq125Zk2eQ2LbDVZ5uaIhJseVjM4sKkomOH
         M97+eB7lcbzer9Fk4v8NRyqkQReT+uj7SN479ReozMXYED4LXNADA+snAC834V/14uHU
         jAivtxSM64GxzgU6mEMdi5pHaEuk0sk5H2WnrXCTZSfeDUZKGKNXyjNKMs/7QYQUaVG6
         SW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=S4Mc+Bj2M4K6QbPh7Tl9RSKCd3a3zACDDjMziCtb1r0=;
        b=mQMBIxt8WO81/okv98eypY085QWN+MCJ24PkbqocMTF3VTVQnCI+0BvnUK8RpKSGUp
         mForsLEmJQ5myzWM3hlFGDxWpxpjEdf0JnX1P5Nte/Axrk8hPEBz9N1KqY8w49oSJ3fu
         W3FfymjJ/W89+ditmm7lXQ2rPcyJvV3GV/iAxJ76nIAp4K/7ZQ+8fVYj3osyXpPiR+Qj
         g8pP7iimoZurZ8CqBqb4YjcwhSUL25xUj0Tcr/snz0clKR4nd4t7m/VDQS64pz0v5XIJ
         ceMZyky33x0VePk5lo/mJKf5L9rQI9jZSnlH9foDedyX6gKDvf4dPIqrlHHdFTnGBGXx
         KZdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=andre.przywara@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
Return-Path: <andre.przywara@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id sd27si523533ejc.414.2022.01.19.13.15.49;
        Wed, 19 Jan 2022 13:15:49 -0800 (PST)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=andre.przywara@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8081FED1;
	Wed, 19 Jan 2022 13:15:48 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45FCB3F774;
	Wed, 19 Jan 2022 13:15:47 -0800 (PST)
Date: Wed, 19 Jan 2022 21:15:05 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>, Andrew Jones <drjones@redhat.com>, Eric Auger
 <eric.auger@redhat.com>
Subject: Re: [PATCH v2 00/13] arm gicv3 ITS: Various bug fixes and
 refactorings
Message-ID: <20220119211505.1895544d@slackpad.fritz.box>
In-Reply-To: <CAFEAcA_BdvbTDp8sJyB32EicB=mNxndgKe7GyNZqE9ER5Ow+wg@mail.gmail.com>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
	<87pmop7xfw.fsf@linaro.org>
	<CAFEAcA-ncYCtpH2aCjd4GWuN9SLcxGMQUOutBWyNHByD6_gG0w@mail.gmail.com>
	<20220118232935.50ae1b25@slackpad.fritz.box>
	<CAFEAcA_BdvbTDp8sJyB32EicB=mNxndgKe7GyNZqE9ER5Ow+wg@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: lX2v1hEbNGa3

On Wed, 19 Jan 2022 10:15:52 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

Hi Peter,

> On Tue, 18 Jan 2022 at 23:30, Andre Przywara <andre.przywara@arm.com> wrote:
> > Looking at k-u-t's arm/gic.c and QEMU's hw/intc/arm_gic.c I see two
> > problems here: QEMU implements word accesses as four successive calls to
> > gic_dist_readb() - which is probably fine if that helps code design,
> > but it won't allow it to actually spot access size issues. I just
> > remember that we spent some brain cells and CPP macros on getting the
> > access size right in KVM - hence those tests in kvm-unit-tests.  
> 
> Thanks for looking at this. I should have read the code rather
> than dashing off a reply last thing in the evening based just
> on the test case output! I think I was confusing how our GICv3
> emulation handles register accesses (with separate functions for
> byte/halfword/word/quad accesses) with the GICv2 emulation
> (which as you say calls down into the byte emulation code
> wherever it can).

No worries!

> > But more importantly it looks like GICD_IIDR is actually not
> > implemented: There is a dubious "if (offset < 0x08) return 0;" line,
> > but IIDR (offset 0x8) would actually fall through, and hit the bad_reg
> > label, which would return 0 (and cause the message, if enabled).  
> 
> Mmm. I actually have a patch in target-arm.next from Petr Pavlu
> which implements GICC_IIDR, but we do indeed not implement the
> distributor equivalent.

Well, returning 0 is actually not the worst idea. Using proper ID
values might not even be feasible for QEMU, or would create some hassle
with versioning. With 0 all a user can assume is spec compliance.

> > If that helps: from a GIC MMIO perspective 8-bit accesses are actually
> > the exception rather than the norm (ARM IHI 0048B.b 4.1.4 GIC register
> > access).  
> 
> Yes. We got this right in the GICv3 emulation design, where almost
> all the logic is in the 32-bit accessor functions and the 8/16-bit
> functions deal only with the very few registers that have to
> permit non-word accesses.

Indeed. I dusted off my old GICv3 MMIO patches for kvm-unit-tests, and
QEMU passed with flying colours. With the debug switch I see it
reporting exactly the violating accesses we except to see.
Will send those patches ASAP.

> The GICv2 code is a lot older (and to
> be fair to it, started out as 11MPcore interrupt controller
> emulation, and I bet the docs of that were not very specific about
> what registers could or could not be accessed byte at a time).
> Unless we want to rewrite all that logic in the GICv2 emulation
> (which I at least do not :-))

... and I can't ...

> I think we'll have to live with
> the warnings about bad-offsets reporting for each byte rather
> than just once for the word access.

Yeah, if those warnings appear only with that debug switch, there is
probably little reason to change that code just because of this. At
least it seemed to work quite well over the years.

Cheers,
Andre

P.S. I changed k-u-t to special case the UP case, so that TCG passes.
But now KVM fails, of course. So I will have to make a patch for the
kernel ...
