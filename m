Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z4sm9744368wrh.93.2019.09.30.03.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 03:26:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CDD731FF87;
	Mon, 30 Sep 2019 11:26:37 +0100 (BST)
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
 <20190930092519.GB11996@redhat.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, "open list\:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-discuss@nongnu.org
 <qemu-discuss@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org
 <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
In-reply-to: <20190930092519.GB11996@redhat.com>
Date: Mon, 30 Sep 2019 11:26:37 +0100
Message-ID: <87impakrky.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Tb+G6sNdTDRm


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Sep 26, 2019 at 10:11:05AM -0700, Richard Henderson wrote:
>> On 9/26/19 12:50 AM, Peter Maydell wrote:
>> > On Thu, 26 Sep 2019 at 00:31, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> The 32 bit hosts are already a second class citizen especially with
>> >> support for running 64 bit guests under TCG. We are also limited by
>> >> testing as actual working 32 bit machines are getting quite rare in
>> >> developers personal menageries. For TCG supporting newer types like
>> >> Int128 is a lot harder with 32 bit calling conventions compared to
>> >> their larger bit sized cousins. Fundamentally address space is the
>> >> most useful thing for the translator to have even for a 32 bit guest a
>> >> 32 bit host is quite constrained.
>> >>
>> >> As far as I'm aware 32 bit KVM users are even less numerous. Even
>> >> ILP32 doesn't make much sense given the address space QEMU needs to
>> >> manage.
>> >
>> > For KVM we should wait until the kernel chooses to drop support,
>> > I think.
>>
>> Agreed.  I think this discussion should be more about TCG.
>>
>> >> @@ -745,19 +744,22 @@ case "$cpu" in
>> >>    ;;
>> >>    armv*b|armv*l|arm)
>> >>      cpu=3D"arm"
>> >> -    supported_cpu=3D"yes"
>> >>    ;;
>> >
>> > I'll leave others to voice opinions about their architectures,
>> > but I still have 32-bit arm in my test set for builds, and
>> > I'm pretty sure we have users (raspi users, for a start).
>>
>> I'd really like to know what raspi users might be using qemu for.  Depen=
ding on
>> that answer, perhaps it would be sufficient for arm32 tcg to only support
>> 32-bit guests.
>
> I asked on the Fedora development lists for feedback on the idea of
> dropping QEMU 32-bit host support
>
>   https://lists.fedoraproject.org/archives/list/devel@lists.fedoraproject=
.org/thread/TPAVIC6YANGP2NK4RUOP7OCIOIFIOV3A/
>
> The response was rather underwhealming to say the least, with only one
> person explicitly expressing a desire for QEMU to keep 32-bit host
> support for armv7l.
>
> The main interesting thing I learnt was that even with 64-bit Raspberry
> Pi hardware, it can be desirable to run 32-bit Raspberry Pi supporting
> distro, supposedly for performance benefits.

I'd like to see actual numbers for that claim but certainly I know the
foundation has been keen to keep the same 32bit userspace for the "official"
distros since the Pi 1/2 era. AIUI other distros are available which
make full use of the 64 bit CPUs in Pi3+ devices.

>> For context, the discussion that Alex and I were having was about int128=
_t, and
>> how to support that directly in tcg (especially to/from helpers), and ho=
w that
>> might be vastly easier if we didn't have to consider 32-bit hosts.
>
> I know nothing about TCG internals, but Is it viable to implement int128_t
> support only in 64-bit host, leaving 32-bit hosts without it ? Or is this
> really a blocking item that is holding back 64-bit host features.

It's not a blocking item but it's an attempt to manage complexity - we
currently support 64 bit guests on 32 bit hosts but have to disable
things like MTTCG because we can't do guest atomic accesses. Some of the
backends currently do not support these "oversized" guests at all so we
are already seeing some fragmentation.

The int128 support is due to the fact we are going to start to see newer
architectures with things like 128 bit shadow capability registers and
they will be a pain to shuffle around in 32 bit generated host code as
well as requiring writing new extra plumbing for TCG's pre/post amble to
pass them back and forth between C and generated code. These guest
architectures may not even be full 64 bit guests so it's not quite as
simple as saying you can't have 64 bit guests on a 32 bit host.

So if lots of people still want 32 bit host support for TCG guests we
can probably come up with something that keeps existing functionality
ticking over while leaving the newer architectural features to 64 bit
hosts only. However if those users are better served by using an older
release of QEMU we could dump a fair bit of cruft going forward.

>
> Regards,
> Daniel


--
Alex Benn=C3=A9e
