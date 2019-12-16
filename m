Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4834084lff;
        Mon, 16 Dec 2019 09:20:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqw6fQPiyTuFxqpUwGB4mcjZsm7j0S8dwdbCG4AVS46wuY/Tuvn64iq4b0vZVEwC2iU8cG3q
X-Received: by 2002:aca:5fc6:: with SMTP id t189mr84861oib.166.1576516835429;
        Mon, 16 Dec 2019 09:20:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576516835; cv=none;
        d=google.com; s=arc-20160816;
        b=urtVEomRNWv5TambC9OZC0J8XmoMQAhl8I0Y825Dtm14785BBkkmDsOISR4MpTV+Q4
         dqCBhglXV4cE2JNhJTIQu6vBmomYHU3Elu7INz8jcAOSdSg06T5HHcUPNNdm2NqhzpJX
         WJhHFonutSmWSWK8ze6mcCK6kNhX/vRRcxd1KcziXfjcJEXMST8KXAA7MlXJW5OhUe1c
         dJxSnWOtGKbXTMjdtvZkxdYk2N78ToZUI7NxqY2oCtnfi06EzqoFd7HvzBsowdsVCml9
         m5h+i87su+xOGuiuPUtmkyQdOwoW4A1LeqFBcZAHOn/+bZdGL2YrSl8OismGJHOI3paa
         kFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=6l+ZX6jfRcQPNGxAaff9khunijHeffZz2XH2nVa2low=;
        b=mNZ4iY9EX73pNlkFmMV5VysvMWtHNnqYPO+V4C6X6adJAFVk75+qfVDHlM6yel5J5x
         Xg1MD2i/0oHkmCB1Bkj3yDF97WoOl2ikUM9e7v+BD618ToyFkir854LKRfFSlX8QSQfM
         9lgz1rFRGU6zafSYnfeTyYq0mveaAV/Nx274Qv/m/4mRFTHMCqh4QDpBbpKZtOiSkM/z
         0Nr9XLzvIQIUNAOCnu7e0siImwOVw/fIfZzc7ysHYi/UKpFWENA6cmZj56N1FU5eFchM
         TbFBpRd/IDV2h04WN63zBFGhIuX6i9bLILyVZnEW9GXnURrTBIKsiPoz/B9ahrSGWoKL
         08EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DznEXNuR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f65si10861975oib.0.2019.12.16.09.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 09:20:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DznEXNuR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igu2s-0001xZ-4v
	for alex.bennee@linaro.org; Mon, 16 Dec 2019 12:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1igtcI-0000wG-Dk
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:53:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1igtcH-0006Nl-06
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:53:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42203
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1igtcG-0006Mf-SC
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576515184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6l+ZX6jfRcQPNGxAaff9khunijHeffZz2XH2nVa2low=;
 b=DznEXNuRxDsjbPo7MjO6eFx2ucVMd5jzKQrNYUDEv3NzVDO3UWA2dfKrXNVJ5jv1mH1qq8
 knbWidEw8QJ2V7hchllRMQo+hs2//jp6CFs9v7e0b6mnbR7v36RuV8b81QfT2TyHc0P1yM
 1rdNKkdNICzjBOSF1lzzBODtmKSkJGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-TQ-AMmSSOLaG5TXmBjBmWw-1; Mon, 16 Dec 2019 11:53:01 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F5BE802570;
 Mon, 16 Dec 2019 16:52:59 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-122.ams2.redhat.com
 [10.36.116.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50C8B60479;
 Mon, 16 Dec 2019 16:52:56 +0000 (UTC)
Date: Mon, 16 Dec 2019 17:52:49 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 5/5] target/arm/cpu: Add the kvm-no-adjvtime CPU
 property
Message-ID: <20191216165249.lygksiptf2yowqh7@kamzik.brq.redhat.com>
References: <20191212173320.11610-1-drjones@redhat.com>
 <20191212173320.11610-6-drjones@redhat.com>
 <CAFEAcA8=FcrT8dRMDzxu14J-gv5LEDuNBNpD5yo9j3waV7u8iw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=FcrT8dRMDzxu14J-gv5LEDuNBNpD5yo9j3waV7u8iw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: TQ-AMmSSOLaG5TXmBjBmWw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@huawei.com>, msys.mizuma@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NncxKzrHcbBH

On Mon, Dec 16, 2019 at 03:06:57PM +0000, Peter Maydell wrote:
> On Thu, 12 Dec 2019 at 17:33, Andrew Jones <drjones@redhat.com> wrote:
> >
> > kvm-no-adjvtime is a KVM specific CPU property and a first of its kind.
> > To accommodate it we also add kvm_arm_add_vcpu_properties() and a
> > KVM specific CPU properties description to the CPU features document.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  docs/arm-cpu-features.rst | 31 ++++++++++++++++++++++++++++++-
> >  hw/arm/virt.c             |  8 ++++++++
> >  include/hw/arm/virt.h     |  1 +
> >  target/arm/cpu.c          |  2 ++
> >  target/arm/cpu64.c        |  1 +
> >  target/arm/kvm.c          | 28 ++++++++++++++++++++++++++++
> >  target/arm/kvm_arm.h      | 11 +++++++++++
> >  target/arm/monitor.c      |  1 +
> >  tests/arm-cpu-features.c  |  4 ++++
> >  9 files changed, 86 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
> > index 1b367e22e16e..641ec9cb8f4a 100644
> > --- a/docs/arm-cpu-features.rst
> > +++ b/docs/arm-cpu-features.rst
> > @@ -31,7 +31,9 @@ supporting the feature or only supporting the feature=
 under certain
> >  configurations.  For example, the `aarch64` CPU feature, which, when
> >  disabled, enables the optional AArch32 CPU feature, is only supported
> >  when using the KVM accelerator and when running on a host CPU type tha=
t
> > -supports the feature.
> > +supports the feature.  While `aarch64` currently only works with KVM,
> > +it could work with TCG.  CPU features that are specific to KVM are
> > +prefixed with "kvm-" and are described in "KVM VCPU Features".
> >
> >  CPU Feature Probing
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > @@ -171,6 +173,33 @@ disabling many SVE vector lengths would be quite v=
erbose, the `sve<N>` CPU
> >  properties have special semantics (see "SVE CPU Property Parsing
> >  Semantics").
> >
> > +KVM VCPU Features
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +KVM VCPU features are CPU features that are specific to KVM, such as
> > +paravirt features or features that enable CPU virtualization extension=
s.
> > +The features' CPU properties are only available when KVM is enabled an=
d
> > +are named with the prefix "kvm-".  KVM VCPU features may be probed,
> > +enabled, and disabled in the same way as other CPU features.  Below is=
 the
> > +list of KVM VCPU features and their descriptions.
> > +
> > +  kvm-no-adjvtime          When disabled, each time the VM transitions
> > +                           back to running state from the paused state=
 the
> > +                           VCPU's vitual counter is updated to ensure =
the
>=20
> "virtual"
>=20
> > +                           stopped time is not counted.  This avoids t=
ime
> > +                           jumps surprising guest OSes and application=
s,
> > +                           as long as they use the virtual counter for
> > +                           timekeeping, but has the side effect of the
> > +                           virtual and physical counters diverging.  A=
ll
> > +                           timekeeping based on the virtual counter wi=
ll
> > +                           appear to lag behind any timekeeping that d=
oes
> > +                           not subtract VM stopped time.  The guest ma=
y
> > +                           resynchronize its virtual counter with othe=
r
> > +                           time sources as needed.  Enabling this KVM =
VCPU
> > +                           feature provides the legacy behavior, which=
 is
> > +                           to also count stopped time with the virtual
> > +                           counter.
>=20
> This phrasing reads a bit confusingly to me. What I would usually expect
> is that you get
>   name-of-option              Description of what the option does.
>=20
> But here we have
>   name-of-option              Long description of the default behaviour,
>                               taking many lines and several sentences.
>                               Brief note at the end that enabling this
>                               feature gives the opposite effect.
>=20
> Especially since the default-behaviour description isn't prefaced
> with "By default" or similar, it's quite easy to start reading the
> text assuming it's defining what the option is going to do, only
> to get to the end and realise that it's defining what the option
> is *not* going to do...

I'll take another stab at this, but my feeling is that a '-no-' option
should be one that just turns off the default behavior, which is why I
wrote a long description of the default behavior. If you'd prefer the
description to be more terse, then I can certainly delete a bunch of
the text, but then I fear what this option disables wouldn't be clear
enough.

>=20
> Incidentally, if I understand things correctly, for TCG the
> behaviour is (and has always been) that VM-stopped time is
> not counted, because we run the emulated versions of these counters
> off QEMU_CLOCK_VIRTUAL. So having the KVM default be the same as
> the TCG default is nicely consistent.

Thanks,
drew

