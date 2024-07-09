Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1544856dlb;
        Tue, 9 Jul 2024 08:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIgxZEQ0SoJYhpdED+PsUyHMV86Ot1g4ExZF6CUCPmEv4yzqIDi4wd54i4NX9P0nPO8XPB
X-Received: by 2002:a25:ab8d:0:b0:e03:9a27:feb0 with SMTP id 3f1490d57ef6-e041b0397c6mr3092867276.11.1720537539820;
        Tue, 09 Jul 2024 08:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720537539; cv=none;
        d=google.com; s=arc-20160816;
        b=hC6ZuR8f8xYbOdxBNwaF70/ItMDZFeswZL6eoua4N79N7xS4BJurAU5A4pv1kSTOST
         esxFuuY+jPXCgPeqE5ZsJUEA62BmgwAE872orW4T5coHzI3DOqN/xqPU2XQgM/OWaqd8
         bJOFqnpABZuKknfoXnAKS9tUCLUh5fojpz1mDs8ibKJZsXRwDBSygDP5MhSAr6S9sL+X
         9m9DrRnvGzV7oKqh17k53aQXiy1semRh7SbTUuZ9EKF2xOQxA9HFf4a7GQSwO3nSYpIo
         q1tjKMUEFuQDOKXjnMm85BNbcB6LRxqb7BSdgdMPkLjfooiYP3p+MoEXIsc+cZcDxkLH
         2tOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date;
        bh=G3tmbPCmTOO7NzDl++c0CzweFr+xYw1iJLQTHC46ai8=;
        fh=lOIA06NAXPsxDFsxS3HPMNppWUzRDijtfiaSigyD1S4=;
        b=GJCcpPsqjgRBzv1GkFc/BLKhMHLfys3muu/DUXhdVlDXyeLcz1P8WJVD+/qi8cafmm
         QUjSUjkhCXAl5wGnFzsExGHOFi+daP41d3e9xD2rN9i/Bid9NHCvo/iBGMzY+ep41Pya
         olu/S+IlCeObnkzW6BeQhSBagD2kBw7HsotdUZkkFi6Qth2EHl2U/Fd2HmbCQ+BpJHJd
         WvT2vDQDsjYTxCbBrCcZfCaEqCcsbAH1ar/ilbFvCA/ksFRi2VBu6q8NK84LQ1+Qjv6t
         slnGH62zeubhRbgMdWsNAoGPbb0omcIzxK0xLOtcTKK0HrQyk+vDnxaf/V3/OKBC7Nsd
         CTIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of alexandru.elisei@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=alexandru.elisei@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
Return-Path: <alexandru.elisei@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id 3f1490d57ef6-e041a8bd24asi1224925276.32.2024.07.09.08.05.39;
        Tue, 09 Jul 2024 08:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of alexandru.elisei@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of alexandru.elisei@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=alexandru.elisei@arm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B02312FC;
	Tue,  9 Jul 2024 08:06:03 -0700 (PDT)
Received: from arm.com (e121798.manchester.arm.com [10.32.101.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77DF53F766;
	Tue,  9 Jul 2024 08:05:35 -0700 (PDT)
Date: Tue, 9 Jul 2024 16:05:32 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, pbonzini@redhat.com,
	drjones@redhat.com, thuth@redhat.com, kvm@vger.kernel.org,
	qemu-arm@nongnu.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu, christoffer.dall@arm.com,
	maz@kernel.org, Anders Roxell <anders.roxell@linaro.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	Eric Auger <eric.auger@redhat.com>,
	"open list:ARM" <kvmarm@lists.linux.dev>
Subject: Re: [kvm-unit-tests PATCH v1 1/2] arm/pmu: skip the PMU
 introspection test if missing
Message-ID: <Zo1RvCdNDhaZHKMb@arm.com>
References: <20240702163515.1964784-1-alex.bennee@linaro.org>
 <20240702163515.1964784-2-alex.bennee@linaro.org>
 <Zoz7sQNoC9ePXH7w@arm.com>
 <CAFEAcA-LFtAi0DkFGc0Q3TYR_+X3TUWQru8crhbKun4EHctcdQ@mail.gmail.com>
 <87ed82slt8.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ed82slt8.fsf@draig.linaro.org>
X-TUID: D3jR0IBCVaUN

Hi,

On Tue, Jul 09, 2024 at 03:05:07PM +0100, Alex Bennée wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Tue, 9 Jul 2024 at 09:58, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
> >>
> >> Hi,
> >>
> >> On Tue, Jul 02, 2024 at 05:35:14PM +0100, Alex Bennée wrote:
> >> > The test for number of events is not a substitute for properly
> >> > checking the feature register. Fix the define and skip if PMUv3 is not
> >> > available on the system. This includes emulator such as QEMU which
> >> > don't implement PMU counters as a matter of policy.
> >> >
> >> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> > Cc: Anders Roxell <anders.roxell@linaro.org>
> >> > ---
> >> >  arm/pmu.c | 7 ++++++-
> >> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/arm/pmu.c b/arm/pmu.c
> >> > index 9ff7a301..66163a40 100644
> >> > --- a/arm/pmu.c
> >> > +++ b/arm/pmu.c
> >> > @@ -200,7 +200,7 @@ static void test_overflow_interrupt(bool overflow_at_64bits) {}
> >> >  #define ID_AA64DFR0_PERFMON_MASK  0xf
> >> >
> >> >  #define ID_DFR0_PMU_NOTIMPL  0b0000
> >> > -#define ID_DFR0_PMU_V3               0b0001
> >> > +#define ID_DFR0_PMU_V3               0b0011
> >> >  #define ID_DFR0_PMU_V3_8_1   0b0100
> >> >  #define ID_DFR0_PMU_V3_8_4   0b0101
> >> >  #define ID_DFR0_PMU_V3_8_5   0b0110
> >> > @@ -286,6 +286,11 @@ static void test_event_introspection(void)
> >> >               return;
> >> >       }
> >> >
> >> > +     if (pmu.version < ID_DFR0_PMU_V3) {
> >> > +             report_skip("PMUv3 extensions not supported, skip ...");
> >> > +             return;
> >> > +     }
> >> > +
> >>
> >> I don't get this patch - test_event_introspection() is only run on 64bit. On
> >> arm64, if there is a PMU present, that PMU is a PMUv3.  A prerequisite to
> >> running any PMU tests is for pmu_probe() to succeed, and pmu_probe() fails if
> >> there is no PMU implemented (PMUVer is either 0, or 0b1111). As a result, if
> >> test_event_introspection() is executed, then a PMUv3 is present.
> >>
> >> When does QEMU advertise FEAT_PMUv3*, but no event counters (other than the cycle
> >> counter)?
> 
> The other option I have is this:
> 
> --8<---------------cut here---------------start------------->8---
> arm/pmu: event-introspection needs icount for TCG
> 
> The TCG accelerator will report a PMU (unless explicitly disabled with
> -cpu foo,pmu=off) however not all events are available unless you run
> under icount. Fix this by splitting the test into a kvm and tcg
> version.

As far as I can tell, if test_event_introspection() fails under TCG without
icount then there are two possible explanations for that:

1. Not all the events whose presence is checked by test_event_introspection()
are actually required by the architecture.

2. TCG without icount is not implementing all the events required by the
architecture.

If 1, then test_event_introspection() should be fixed. I had a look and the
function looked correct to me (except that the event name is not INST_PREC,
it's INST_SPEC in the Arm DDI0487J.A and K.a, but that's not relevant for
correctness).

From what I can tell from what Peter and you have said, explanation 2 is the
correct one, because TCG cannot implement all the required events when icount is
not specified. As far as test_event_introspection() is concerned, I consider
this to be the expected behaviour: it fails because the required events are not
implemented. I don't think the function should be changed to work around how
QEMU was invoked. Do you agree?

If you know that the test will fail without special command line parameters when
accel is TCG, then I think what you are suggesting looks correct to me: the
original test is skipped if KVM is not present, and when run under TCG, the
correct parameters are passed to QEMU.

Thanks,
Alex

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> 1 file changed, 8 insertions(+)
> arm/unittests.cfg | 8 ++++++++
> 
> modified   arm/unittests.cfg
> @@ -52,8 +52,16 @@ extra_params = -append 'cycle-counter 0'
>  file = pmu.flat
>  groups = pmu
>  arch = arm64
> +accel = kvm
>  extra_params = -append 'pmu-event-introspection'
>  
> +[pmu-event-introspection-icount]
> +file = pmu.flat
> +groups = pmu
> +arch = arm64
> +accel = tcg
> +extra_params = -icount shift=1 -append 'pmu-event-introspection'
> +
>  [pmu-event-counter-config]
>  file = pmu.flat
>  groups = pmu
> --8<---------------cut here---------------end--------------->8---
> 
> which just punts icount on TCG to its own test (note there are commented
> out versions further down the unitests.cfg file)
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro
