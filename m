Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3562940wrx;
        Mon, 4 Mar 2019 04:39:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqxZ6oLxRJB2EswzV9n4NWH5yNJ14RFZLc8ImoCIfdip0yUxsTS5PuTCLEKExUZtdhaNyZ4V
X-Received: by 2002:a25:2a4f:: with SMTP id q76mr15070039ybq.126.1551703169484;
        Mon, 04 Mar 2019 04:39:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551703169; cv=none;
        d=google.com; s=arc-20160816;
        b=VzxJRnBovnDwpj0Pg97WkWh4BfAskmBn5nI6DfeZo7TREvLTw6vDHWLTKDRviRv8M7
         gDud32Vy8fJepgqRi0NRHQhsp05FQeMYsyZzCfMX8GQo1/6O1bvbtGf2Qs1I7wAUBpEF
         Dp33eye47++RdwJlO9Zv8vk/pMHJDm3QjCl7hhzN5kmXePIKPCujRAeP3OOuA94XfcvE
         +js0/vPjPtxFBhWbww7e2O4XrKlDcUyxRkc0xrZ+ifc8ohy8X5vIcEfbfJWpqRecSZsq
         dEmKLG1B+YncFcdKZPW+ATrHmD1bKJKWkF4TrgMUOx2A5fKWvO7ElTpTd2sNllDdfGCG
         H67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=3mSaDuDsO06fTumt8//wBuuCEWYOySyhp26ehvWFj6Y=;
        b=p10k2clKFrHHo8sN+ZF+ZgpnsLI6tGgD1VFRpV+/2VvLXaLcifBdBqJTbwYFFhnG/F
         plNXCYFN5vPuaB+tyHCVzCW74oeM9PivDOsVmTLjN1LtFdt8xCfZGqZqBB25BZLp1z9S
         6sElPCtU0gId/RIy252HREBj+pHHd7yMX0SFiDSOP0eVo/W7a67a32iJa1YlEuQKPaab
         lfjwL6wKx0re54RWVrIBZvUkY9rCDnzVFDWHqmmBlMdyqmaujP9HoDI9naeTTZLRiHt7
         jxsZC1Dm0WwW/oWAxvGtpB3Kslvp6gHM7tg1XynuQRwwtvc7tMh+V+mNECRT2VPnehej
         a6lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si1594695ywa.234.2019.03.04.04.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 04:39:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0msT-0007fN-0H
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 07:39:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0msL-0007fF-Ve
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 07:39:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0msK-0000pW-Ar
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 07:39:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1h0msK-0000nK-1k; Mon, 04 Mar 2019 07:39:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B6A1C049E22;
	Mon,  4 Mar 2019 12:39:18 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A239260144;
	Mon,  4 Mar 2019 12:39:11 +0000 (UTC)
Date: Mon, 4 Mar 2019 12:39:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190304123908.GK4239@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304132507.39273826@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190304132507.39273826@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 04 Mar 2019 12:39:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	mprivozn@redhat.com, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, pbonzini@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QH9tSEAFEJb/

On Mon, Mar 04, 2019 at 01:25:07PM +0100, Igor Mammedov wrote:
> On Mon, 04 Mar 2019 08:13:53 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
>=20
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >=20
> > > On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote: =20
> > >> On Fri, 1 Mar 2019 15:49:47 +0000
> > >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > >>  =20
> > >> > On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote: =20
> > >> > > The parameter allows to configure fake NUMA topology where gue=
st
> > >> > > VM simulates NUMA topology but not actually getting a performa=
nce
> > >> > > benefits from it. The same or better results could be achieved
> > >> > > using 'memdev' parameter. In light of that any VM that uses NU=
MA
> > >> > > to get its benefits should use 'memdev' and to allow transitio=
n
> > >> > > initial RAM to device based model, deprecate 'mem' parameter a=
s
> > >> > > its ad-hoc partitioning of initial RAM MemoryRegion can't be
> > >> > > translated to memdev based backend transparently to users and =
in
> > >> > > compatible manner (migration wise).
> > >> > >=20
> > >> > > That will also allow to clean up a bit our numa code, leaving =
only
> > >> > > 'memdev' impl. in place and several boards that use node_mem
> > >> > > to generate FDT/ACPI description from it.   =20
> > >> >=20
> > >> > Can you confirm that the  'mem' and 'memdev' parameters to -numa
> > >> > are 100% live migration compatible in both directions ?  Libvirt
> > >> > would need this to be the case in order to use the 'memdev' synt=
ax
> > >> > instead. =20
> > >> Unfortunately they are not migration compatible in any direction,
> > >> if it where possible to translate them to each other I'd alias 'me=
m'
> > >> to 'memdev' without deprecation. The former sends over only one
> > >> MemoryRegion to target, while the later sends over several (one pe=
r
> > >> memdev). =20
> > >
> > > If we can't migration from one to the other, then we can not deprec=
ate
> > > the existing 'mem' syntax. Even if libvirt were to provide a config
> > > option to let apps opt-in to the new syntax, we need to be able to
> > > support live migration of existing running VMs indefinitely. Effect=
ively
> > > this means we need the to keep 'mem' support forever, or at least s=
uch
> > > a long time that it effectively means forever.
> > >
> > > So I think this patch has to be dropped & replaced with one that
> > > simply documents that memdev syntax is preferred. =20
> >=20
> > We have this habit of postulating absolutes like "can not deprecate"
> > instead of engaging with the tradeoffs.  We need to kick it.
> >=20
> > So let's have an actual look at the tradeoffs.
> >=20
> > We don't actually "support live migration of existing running VMs
> > indefinitely".
> >=20
> > We support live migration to any newer version of QEMU that still
> > supports the machine type.
> >=20
> > We support live migration to any older version of QEMU that already
> > supports the machine type and all the devices the machine uses.
> >=20
> > Aside: "support" is really an honest best effort here.  If you rely o=
n
> > it, use a downstream that puts in the (substantial!) QA work real
> > support takes.
> >=20
> > Feature deprecation is not a contract to drop the feature after two
> > releases, or even five.  It's a formal notice that users of the featu=
re
> > should transition to its replacement in an orderly manner.
> >=20
> > If I understand Igor correctly, all users should transition away from
> > outdated NUMA configurations at least for new VMs in an orderly manne=
r.
> Yes, we can postpone removing options until there are machines type
> versions that were capable to use it (unfortunate but probably=20
> unavoidable unless there is a migration trick to make transition
> transparent) but that should not stop us from disabling broken
> options on new machine types at least.
>=20
> This series can serve as formal notice with follow up disabling of
> deprecated options for new machine types. (As Thomas noted, just warnin=
gs
> do not work and users continue to use broken features regardless whethe=
r
> they are don't know about issues or aware of it [*])
>=20
> Hence suggested deprecation approach and enforced rejection of legacy
> numa options for new machine types in 2 releases so users would stop
> using them eventually.

When we deprecate something, we need to have a way for apps to use the
new alternative approach *at the same time*.  So even if we only want to
deprecate for new machine types, we still have to first solve the problem
of how mgmt apps will introspect QEMU to learn which machine types expect
the new options.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
