Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3655786wrx;
        Mon, 4 Mar 2019 06:17:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/Tq6EjrlQgupex08FVMI7pAPejCNAqs3lF2QwG9beyou57qdV3NFrnaRdEOBe5XB/DAC4
X-Received: by 2002:a81:2556:: with SMTP id l83mr14357102ywl.290.1551709028394;
        Mon, 04 Mar 2019 06:17:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551709028; cv=none;
        d=google.com; s=arc-20160816;
        b=zGRw+cY684+wbaKR2hLt9osUCFWmpG5h+vfVRk4/bq0rhQM47lyP90YRC1rzVg91bq
         90eBLsz8RTRX1SRpoCtrs143YrIx26JCh6fr4QLGkXtRHdwY1hhzlkHg74Mw8siqhZx6
         3BB/3hsmDfCGkZNpRCN9E9HSoyLvj+Hp+eqLVp6wDutFCKMeLiLcmZtB+E1CTork2Bhe
         4W6gJ5uV2NbFnwcmoH2j6CiOEQNl7K32e2r55LelKR+nh3TYcY5Hv1qW+TcW8SwlyAD3
         LshRCsGZ+x5vhdMofZuRLdafivYAEhB/bhx8JcK7KnrsCsLBX3QsXBpUdzHtcsN62xop
         KYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=fd5LhmviT3t5+6gi7gbLMSjel8Sm92coNVHWm9SfQkc=;
        b=EV7T4RYLlRyIRaIB0sXCBappvKIHnrrR3bJ7jwNBkHX8cIsNPvfo4oBzAnJRzlVnNn
         IdJXsLWjfXaKqLB/Iq5rbvn8IOIRaDOuPG/h7vOlfG7VmAqawrdKiNKGP5NFhTCUyWk9
         6S2SZbT7d1oM2yRvjZ3soji66JAD94yDka6oEpviEBhIFr4UvGeMD7Z1NgQu0Bcv2VQS
         zDiH2XUgH5+4IHrTrd72U9iG5DUCxFJu6pNqjd5B20n0VU+PQ6vwqvlLl54owAg8EX96
         bF5v+CiptGyDHeCCR1coHeFPzvlwS4+8Ut+LVyfxt9co6+UVYDq94SvoQAxs4LyjCh7Q
         Y51A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192si2457379ybm.103.2019.03.04.06.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 06:17:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0oOx-0000VJ-PI
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 09:17:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0oOg-0000Ty-Uo
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 09:16:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0oOf-0006A9-T0
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 09:16:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58728)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h0oOf-00068w-IT; Mon, 04 Mar 2019 09:16:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09C583082AF0;
	Mon,  4 Mar 2019 14:16:48 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12B3A1A8F1;
	Mon,  4 Mar 2019 14:16:42 +0000 (UTC)
Date: Mon, 4 Mar 2019 15:16:41 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Message-ID: <20190304151641.3deefc3b@redhat.com>
In-Reply-To: <20190304123908.GK4239@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304132507.39273826@redhat.com>
	<20190304123908.GK4239@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 04 Mar 2019 14:16:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [libvirt] [PATCH 1/2] numa: deprecate
 'mem' parameter of '-numa node' option
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	mprivozn@redhat.com, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, pbonzini@redhat.com, "Dr.
	David Alan Gilbert" <dgilbert@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pHuP7MIq1/yP

On Mon, 4 Mar 2019 12:39:08 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Mar 04, 2019 at 01:25:07PM +0100, Igor Mammedov wrote:
> > On Mon, 04 Mar 2019 08:13:53 +0100
> > Markus Armbruster <armbru@redhat.com> wrote:
> >  =20
> > > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> > >  =20
> > > > On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote:   =20
> > > >> On Fri, 1 Mar 2019 15:49:47 +0000
> > > >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > > >>    =20
> > > >> > On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:  =
 =20
> > > >> > > The parameter allows to configure fake NUMA topology where gue=
st
> > > >> > > VM simulates NUMA topology but not actually getting a performa=
nce
> > > >> > > benefits from it. The same or better results could be achieved
> > > >> > > using 'memdev' parameter. In light of that any VM that uses NU=
MA
> > > >> > > to get its benefits should use 'memdev' and to allow transition
> > > >> > > initial RAM to device based model, deprecate 'mem' parameter as
> > > >> > > its ad-hoc partitioning of initial RAM MemoryRegion can't be
> > > >> > > translated to memdev based backend transparently to users and =
in
> > > >> > > compatible manner (migration wise).
> > > >> > >=20
> > > >> > > That will also allow to clean up a bit our numa code, leaving =
only
> > > >> > > 'memdev' impl. in place and several boards that use node_mem
> > > >> > > to generate FDT/ACPI description from it.     =20
> > > >> >=20
> > > >> > Can you confirm that the  'mem' and 'memdev' parameters to -numa
> > > >> > are 100% live migration compatible in both directions ?  Libvirt
> > > >> > would need this to be the case in order to use the 'memdev' synt=
ax
> > > >> > instead.   =20
> > > >> Unfortunately they are not migration compatible in any direction,
> > > >> if it where possible to translate them to each other I'd alias 'me=
m'
> > > >> to 'memdev' without deprecation. The former sends over only one
> > > >> MemoryRegion to target, while the later sends over several (one per
> > > >> memdev).   =20
> > > >
> > > > If we can't migration from one to the other, then we can not deprec=
ate
> > > > the existing 'mem' syntax. Even if libvirt were to provide a config
> > > > option to let apps opt-in to the new syntax, we need to be able to
> > > > support live migration of existing running VMs indefinitely. Effect=
ively
> > > > this means we need the to keep 'mem' support forever, or at least s=
uch
> > > > a long time that it effectively means forever.
> > > >
> > > > So I think this patch has to be dropped & replaced with one that
> > > > simply documents that memdev syntax is preferred.   =20
> > >=20
> > > We have this habit of postulating absolutes like "can not deprecate"
> > > instead of engaging with the tradeoffs.  We need to kick it.
> > >=20
> > > So let's have an actual look at the tradeoffs.
> > >=20
> > > We don't actually "support live migration of existing running VMs
> > > indefinitely".
> > >=20
> > > We support live migration to any newer version of QEMU that still
> > > supports the machine type.
> > >=20
> > > We support live migration to any older version of QEMU that already
> > > supports the machine type and all the devices the machine uses.
> > >=20
> > > Aside: "support" is really an honest best effort here.  If you rely on
> > > it, use a downstream that puts in the (substantial!) QA work real
> > > support takes.
> > >=20
> > > Feature deprecation is not a contract to drop the feature after two
> > > releases, or even five.  It's a formal notice that users of the featu=
re
> > > should transition to its replacement in an orderly manner.
> > >=20
> > > If I understand Igor correctly, all users should transition away from
> > > outdated NUMA configurations at least for new VMs in an orderly manne=
r. =20
> > Yes, we can postpone removing options until there are machines type
> > versions that were capable to use it (unfortunate but probably=20
> > unavoidable unless there is a migration trick to make transition
> > transparent) but that should not stop us from disabling broken
> > options on new machine types at least.
> >=20
> > This series can serve as formal notice with follow up disabling of
> > deprecated options for new machine types. (As Thomas noted, just warnin=
gs
> > do not work and users continue to use broken features regardless whether
> > they are don't know about issues or aware of it [*])
> >=20
> > Hence suggested deprecation approach and enforced rejection of legacy
> > numa options for new machine types in 2 releases so users would stop
> > using them eventually. =20
>=20
> When we deprecate something, we need to have a way for apps to use the
> new alternative approach *at the same time*.  So even if we only want to
> deprecate for new machine types, we still have to first solve the problem
> of how mgmt apps will introspect QEMU to learn which machine types expect
> the new options.
I'm not aware any mechanism to introspect machine type options (existing
or something being developed). Are/were there any ideas about it that were
discussed in the past?

Aside from developing a new mechanism what are alternative approaches?
I mean when we delete deprecated CLI option, how it's solved on libvirt
side currently?

For example I don't see anything introspection related when we have been
removing deprecated options recently.

More exact question specific to this series usecase,
how libvirt decides when to use -numa node,memdev or not currently?


>=20
> Regards,
> Daniel

