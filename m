Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3964800lfb;
        Mon, 23 Nov 2020 13:47:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykYMIvh/Yfy0nsN2kmBptg30fpNBDKwCYzmBF7Q/g4mbAV7yPx5VMQ6FyXqyhO6IBg/8b9
X-Received: by 2002:a25:26d3:: with SMTP id m202mr1695108ybm.504.1606168023680;
        Mon, 23 Nov 2020 13:47:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606168023; cv=none;
        d=google.com; s=arc-20160816;
        b=mgxuGka2X9EEf6zMgp7ZMGjA2Ekom21b+C587OFjGjVXxwgDlbiK2rLFRgjzUz/eo1
         dasJmJgGQop9Pxy+2b/8Q5VeX5DSzF8Az4Vq6yn5ftA7dH425mRsR4zdKVbLak97mJQs
         S4/k6rN3Enta5hb6Wjr2enYOHoimeQ9suYB9Rj+hqTCzdK7x3/e2JAhNszP9sa7BVrLM
         HkwGzkY9tCga5VpzfPj8z4XEedrCJW3mT3cSBi+A+vtVSzTHnlfx+CpPVzans1JS44UJ
         Svu+Jry8x2Rdt+gt6sFVfIJo5bdmqs2f9VwMq19W529MG/qnsZda+jkZpe686ecAjEK1
         D1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=eDa2ZrVlt7oeuteUnvGn2troD7Ne9Ce5xpaIBjTE0H8=;
        b=d890YHlV+27YArbYEHW4gpibL6OrScZSwf9gLhw04n9n4Z0+c3hwll+j6Jn3tqVBqE
         WhjA2yy4CjJBu06BAv5l647v4yss02qfa/hZFbDD/EPg9OdikYBYAksQzuJSMaQe4woQ
         u0lAA9PvYvL+UKpnqENPGbF2saK8FL4lDNnI5fka9xWba357XDhdGpuBFKTFn7HLjN/v
         uEG5t+jylMCJjgtRanSSyQaRf6L59yNDQX6OZHEc9d/x4VEzll8K4Ol30wMNDtFynj2O
         MKqFaMyT55JYfWTPeiEBFCGv3sGxngBPEX4N+xe6uIpv/nErTUBjTh0thQZS13THECZ8
         V+MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zf5mBAfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r187si14639190ybr.321.2020.11.23.13.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 13:47:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Zf5mBAfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khJfq-0001cW-Mj
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 16:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khJfd-0001bm-24
 for qemu-arm@nongnu.org; Mon, 23 Nov 2020 16:46:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1khJfP-0006Fq-0a
 for qemu-arm@nongnu.org; Mon, 23 Nov 2020 16:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606167993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDa2ZrVlt7oeuteUnvGn2troD7Ne9Ce5xpaIBjTE0H8=;
 b=Zf5mBAfalqOR/aXcQKSL2lKymZ5BY/8ClJduBYtf2U4foaUMevLJi/9p+usxAWEJ1gwbHk
 Hf/bmyxigwVNvfUUpWJ+Z1UhrnDlL2nEGcFYX2j5oNZnZr6Afg+iOgItVWezOWRZl0Ugir
 Pfk1AjPU+KlL8qC49nFlrND8HlV19oM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-Tq4on-ksMXa_aU-Rm6oLJQ-1; Mon, 23 Nov 2020 16:46:29 -0500
X-MC-Unique: Tq4on-ksMXa_aU-Rm6oLJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFB19183586A;
 Mon, 23 Nov 2020 21:46:27 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D526B19D9D;
 Mon, 23 Nov 2020 21:46:23 +0000 (UTC)
Date: Mon, 23 Nov 2020 14:46:22 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Neo Jia <cjia@nvidia.com>
Subject: Re: [PATCH RFC] vfio: Move the saving of the config space to the
 right place in VFIO migration
Message-ID: <20201123144622.75a18812@w520.home>
In-Reply-To: <20201123193336.GA32690@nvidia.com>
References: <20201114091731.157-1-lushenming@huawei.com>
 <860bd707-8862-2584-6e12-67c86f092dba@nvidia.com>
 <20201119104127.5e243efa@w520.home>
 <a7be9306-f800-0323-293e-217e2e9f6015@huawei.com>
 <20201120150146.5e5693e9@w520.home>
 <09549a98-85a0-fe4e-59fc-fdb636a4a5cd@huawei.com>
 <20201123193336.GA32690@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, dgilbert@redhat.com,
 Shenming Lu <lushenming@huawei.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Um18dODdX1Ty

On Mon, 23 Nov 2020 11:33:37 -0800
Neo Jia <cjia@nvidia.com> wrote:

> On Mon, Nov 23, 2020 at 11:14:38AM +0800, Shenming Lu wrote:
> > External email: Use caution opening links or attachments
> >=20
> >=20
> > On 2020/11/21 6:01, Alex Williamson wrote: =20
> > > On Fri, 20 Nov 2020 22:05:49 +0800
> > > Shenming Lu <lushenming@huawei.com> wrote:
> > > =20
> > >> On 2020/11/20 1:41, Alex Williamson wrote: =20
> > >>> On Thu, 19 Nov 2020 14:13:24 +0530
> > >>> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> > >>> =20
> > >>>> On 11/14/2020 2:47 PM, Shenming Lu wrote: =20
> > >>>>> When running VFIO migration, I found that the restoring of VFIO P=
CI device=E2=80=99s
> > >>>>> config space is before VGIC on ARM64 target. But generally, inter=
rupt controllers
> > >>>>> need to be restored before PCI devices. =20
> > >>>>
> > >>>> Is there any other way by which VGIC can be restored before PCI de=
vice? =20
> > >>
> > >> As far as I know, it seems to have to depend on priorities in the no=
n-iterable process.
> > >> =20
> > >>>> =20
> > >>>>> Besides, if a VFIO PCI device is
> > >>>>> configured to have directly-injected MSIs (VLPIs), the restoring =
of its config
> > >>>>> space will trigger the configuring of these VLPIs (in kernel), wh=
ere it would
> > >>>>> return an error as I saw due to the dependency on kvm=E2=80=99s v=
gic.
> > >>>>> =20
> > >>>>
> > >>>> Can this be fixed in kernel to re-initialize the kernel state? =20
> > >>
> > >> Did you mean to reconfigure these VLPIs when restoring kvm's vgic?
> > >> But the fact is that this error is not caused by kernel, it is due t=
o the incorrect
> > >> calling order of qemu...
> > >> =20
> > >>>> =20
> > >>>>> To avoid this, we can move the saving of the config space from th=
e iterable
> > >>>>> process to the non-iterable process, so that it will be called af=
ter VGIC
> > >>>>> according to their priorities.
> > >>>>> =20
> > >>>>
> > >>>> With this change, at resume side, pre-copy phase data would reach
> > >>>> destination without restored config space. VFIO device on destinat=
ion
> > >>>> might need it's config space setup and validated before it can acc=
ept
> > >>>> further VFIO device specific migration state.
> > >>>>
> > >>>> This also changes bit-stream, so it would break migration with ori=
ginal
> > >>>> migration patch-set. =20
> > >>>
> > >>> Config space can continue to change while in pre-copy, if we're onl=
y
> > >>> sending config space at the initiation of pre-copy, how are any cha=
nges
> > >>> that might occur before the VM is stopped conveyed to the target?  =
For
> > >>> example the guest might reboot and a device returned to INTx mode f=
rom
> > >>> MSI during pre-copy.  Thanks, =20
> > >>
> > >> What I see is that the config space is only saved once in save_live_=
complete_precopy
> > >> currently...
> > >> As you said, a VFIO device might need it's config space setup first,=
 and
> > >> the config space can continue to change while in pre-copy, Did you m=
ean we
> > >> have to migrate the config space in save_live_iterate?
> > >> However, I still have a little doubt about the restoring dependence =
between
> > >> the qemu emulated config space and the device data...
> > >>
> > >> Besides, if we surely can't move the saving of the config space back=
, can we
> > >> just move some actions which are triggered by the restoring of the c=
onfig space
> > >> back (such as vfio_msix_enable())? =20
> > >
> > > It seems that the significant benefit to enabling interrupts during
> > > pre-copy would be to reduce the latency and failure potential during
> > > the final phase of migration.  Do we have any data for how much it ad=
ds
> > > to the device contributed downtime to configure interrupts only at th=
e
> > > final stage?  My guess is that it's a measurable delay on its own.  A=
t
> > > the same time, we can't ignore the differences in machine specific
> > > dependencies and if we don't even sync the config space once the VM i=
s
> > > stopped... this all seems not ready to call supported, especially if =
we
> > > have concerns already about migration bit-stream compatibility.
> > > =20
> >=20
> > I have another question for this, if we restore the config space while =
in pre-copy
> > (include enabling interrupts), does it affect the _RESUMING state (paus=
ed) of the
> > device on the dst host (cause it to send interrupts? which should not b=
e allowed
> > in this stage). Does the restore sequence need to be further discussed =
and reach
> > a consensus(spec) (taking into account other devices and the correspond=
ing actions
> > of the vendor driver)?

If a target device generates an interrupt when stopped, I think that
would violate the basic notion of running vs stopped in the device
state, right?

> > > Given our timing relative to QEMU 5.2, the only path I feel comfortab=
le
> > > with is to move forward with downgrading vfio migration support to be
> > > enabled via an experimental option.  Objections?  Thanks, =20
> >=20
> > Alright, but this issue is related to our ARM GICv4.1 migration scheme,=
 could you
> > give a rough idea about this (where to enable interrupts, we hope it to=
 be after
> > the restoring of VGIC)? =20
>=20
> I disagree. If this is only specific to Huawei ARM GIC implementation, wh=
y do we want to
> make the entire VFIO based migration an experimental feature?

Because it's essentially unproven by the larger community.  Let's face
it, there was a surprisingly positive response to my previous proposal
to mark this feature experimental, and mostly it was not due to the
immediate issue that caused me to sound the alarm.  I think this latest
issue shows that this feature has not had the upstream soak time that
it needs.  Had we persisted with its development after it missed QEMU
5.1, had we pushed it upstream after the freeze lifted and iterated
throughout the 5.2 development window, we might be in a better position
right now.

As it stands, we're potentially at the final RC of this release, other
vendors have yet to prove this for their devices and architectures in
the short time since the code entered mainline, we continue to see new
issues, we have zero available vendor drivers supporting migration,
we're not sure how to maintain bit-stream compatibility with the issues
we already know about, and we're out of time.  I don't see how the
upstream community can gamble that this is in a supportable state at
this point.  Thanks,

Alex

