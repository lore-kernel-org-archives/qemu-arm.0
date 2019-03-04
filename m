Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3664178wrx;
        Mon, 4 Mar 2019 06:25:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzHfQlFhf3kRxR7Y3OGGHZtvPi1gX/7MgR6eZ5cd+rqSSQ0No54TMaA6GqKGdKFB/JPAKl
X-Received: by 2002:a0d:cb90:: with SMTP id n138mr14432989ywd.464.1551709499957;
        Mon, 04 Mar 2019 06:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551709499; cv=none;
        d=google.com; s=arc-20160816;
        b=vS79hTvIlEHQKXiskti5eiZgyItDrL3XTASJfODTgcJ8EMTcsfYSSonzzWORiJWfn6
         qQD3yVaaekZz/L84jj1eqgtWbdwke0zqf81avSvRwqJKde0ybfeoC8mhO3kDLPyHGsWB
         zvuEuD44WKPgiiHoFiLo1M/7m8MT+bQxwN0NXQH3xBAo1ilQqhKOSNfCZ7EBW4YYzcZy
         niaBtKa5MfjAHw0+tCyj+me07O4KCxhH8K+vvw1w44qDF0tnTaJ9gDEG7aNAU17dIKIj
         yVa3hAppQiSOFk9gDBxN/LG1ICyr3OLakAAYHgRJOuux5Eju+9/B6+5S4J352p6haJz+
         el3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=1ktiOqcj569k/2LvZjC/X5X4r3wYEiuNTAKXUNHeg6E=;
        b=ZK4C/+t1NLLT7plJweSmuvQia/VRIszF/j1/6NhX1rN+qblXuPRRk8UW7DFS21tuMA
         xMeadQZEMczkjxf3yrYJwuEjWtiDsRepYi57Ahbk0xWDqZg3Sltv6p07w5UPHfe9Tq0K
         Pkf/t4Fgr3S5yH4WQPAxATBCahlrTkj85eAD6CPGkh9039Be1sIyNGYrf7tqQNr5MhnE
         fJp9v6ZeNvbO1FcNhI4GqSX7z+vjyZptccgXxWJ7GcTP0OYHPH0/OD8kYyKqXj/UU7TP
         n3jgaR7OWpdHrUMM+lomgccEy/XzG+gkp7Dt6BN7zsJ7hvHFC8KwSZyb+F5XRv1AFQyx
         M7kA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186si3089208ybu.64.2019.03.04.06.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 06:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54835 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0oWZ-0002QD-BQ
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 09:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0oWM-0002Oz-0x
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 09:24:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0oWJ-0006Er-3b
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 09:24:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1h0oWI-0006Dz-PQ; Mon, 04 Mar 2019 09:24:43 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB4BC4E90E;
	Mon,  4 Mar 2019 14:24:41 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B0B45D77D;
	Mon,  4 Mar 2019 14:24:34 +0000 (UTC)
Date: Mon, 4 Mar 2019 14:24:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190304142432.GM4239@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304132507.39273826@redhat.com>
	<20190304123908.GK4239@redhat.com>
	<20190304151641.3deefc3b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190304151641.3deefc3b@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 04 Mar 2019 14:24:42 +0000 (UTC)
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
X-TUID: TFwxJM7tYRCg

On Mon, Mar 04, 2019 at 03:16:41PM +0100, Igor Mammedov wrote:
> On Mon, 4 Mar 2019 12:39:08 +0000
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>=20
> > On Mon, Mar 04, 2019 at 01:25:07PM +0100, Igor Mammedov wrote:
> > > On Mon, 04 Mar 2019 08:13:53 +0100
> > > Markus Armbruster <armbru@redhat.com> wrote:
> > >  =20
> > > > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> > > >  =20
> > > > > On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote: =
  =20
> > > > >> On Fri, 1 Mar 2019 15:49:47 +0000
> > > > >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > > > >>    =20
> > > > >> > On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrot=
e:   =20
> > > > >> > > The parameter allows to configure fake NUMA topology where=
 guest
> > > > >> > > VM simulates NUMA topology but not actually getting a perf=
ormance
> > > > >> > > benefits from it. The same or better results could be achi=
eved
> > > > >> > > using 'memdev' parameter. In light of that any VM that use=
s NUMA
> > > > >> > > to get its benefits should use 'memdev' and to allow trans=
ition
> > > > >> > > initial RAM to device based model, deprecate 'mem' paramet=
er as
> > > > >> > > its ad-hoc partitioning of initial RAM MemoryRegion can't =
be
> > > > >> > > translated to memdev based backend transparently to users =
and in
> > > > >> > > compatible manner (migration wise).
> > > > >> > >=20
> > > > >> > > That will also allow to clean up a bit our numa code, leav=
ing only
> > > > >> > > 'memdev' impl. in place and several boards that use node_m=
em
> > > > >> > > to generate FDT/ACPI description from it.     =20
> > > > >> >=20
> > > > >> > Can you confirm that the  'mem' and 'memdev' parameters to -=
numa
> > > > >> > are 100% live migration compatible in both directions ?  Lib=
virt
> > > > >> > would need this to be the case in order to use the 'memdev' =
syntax
> > > > >> > instead.   =20
> > > > >> Unfortunately they are not migration compatible in any directi=
on,
> > > > >> if it where possible to translate them to each other I'd alias=
 'mem'
> > > > >> to 'memdev' without deprecation. The former sends over only on=
e
> > > > >> MemoryRegion to target, while the later sends over several (on=
e per
> > > > >> memdev).   =20
> > > > >
> > > > > If we can't migration from one to the other, then we can not de=
precate
> > > > > the existing 'mem' syntax. Even if libvirt were to provide a co=
nfig
> > > > > option to let apps opt-in to the new syntax, we need to be able=
 to
> > > > > support live migration of existing running VMs indefinitely. Ef=
fectively
> > > > > this means we need the to keep 'mem' support forever, or at lea=
st such
> > > > > a long time that it effectively means forever.
> > > > >
> > > > > So I think this patch has to be dropped & replaced with one tha=
t
> > > > > simply documents that memdev syntax is preferred.   =20
> > > >=20
> > > > We have this habit of postulating absolutes like "can not depreca=
te"
> > > > instead of engaging with the tradeoffs.  We need to kick it.
> > > >=20
> > > > So let's have an actual look at the tradeoffs.
> > > >=20
> > > > We don't actually "support live migration of existing running VMs
> > > > indefinitely".
> > > >=20
> > > > We support live migration to any newer version of QEMU that still
> > > > supports the machine type.
> > > >=20
> > > > We support live migration to any older version of QEMU that alrea=
dy
> > > > supports the machine type and all the devices the machine uses.
> > > >=20
> > > > Aside: "support" is really an honest best effort here.  If you re=
ly on
> > > > it, use a downstream that puts in the (substantial!) QA work real
> > > > support takes.
> > > >=20
> > > > Feature deprecation is not a contract to drop the feature after t=
wo
> > > > releases, or even five.  It's a formal notice that users of the f=
eature
> > > > should transition to its replacement in an orderly manner.
> > > >=20
> > > > If I understand Igor correctly, all users should transition away =
from
> > > > outdated NUMA configurations at least for new VMs in an orderly m=
anner. =20
> > > Yes, we can postpone removing options until there are machines type
> > > versions that were capable to use it (unfortunate but probably=20
> > > unavoidable unless there is a migration trick to make transition
> > > transparent) but that should not stop us from disabling broken
> > > options on new machine types at least.
> > >=20
> > > This series can serve as formal notice with follow up disabling of
> > > deprecated options for new machine types. (As Thomas noted, just wa=
rnings
> > > do not work and users continue to use broken features regardless wh=
ether
> > > they are don't know about issues or aware of it [*])
> > >=20
> > > Hence suggested deprecation approach and enforced rejection of lega=
cy
> > > numa options for new machine types in 2 releases so users would sto=
p
> > > using them eventually. =20
> >=20
> > When we deprecate something, we need to have a way for apps to use th=
e
> > new alternative approach *at the same time*.  So even if we only want=
 to
> > deprecate for new machine types, we still have to first solve the pro=
blem
> > of how mgmt apps will introspect QEMU to learn which machine types ex=
pect
> > the new options.
> I'm not aware any mechanism to introspect machine type options (existin=
g
> or something being developed). Are/were there any ideas about it that w=
ere
> discussed in the past?
>=20
> Aside from developing a new mechanism what are alternative approaches?
> I mean when we delete deprecated CLI option, how it's solved on libvirt
> side currently?
>=20
> For example I don't see anything introspection related when we have bee=
n
> removing deprecated options recently.

Right, with other stuff we deprecate we've had a simpler time, as it
either didn't affect migration at all, or the new replacement stuff
was fully compatible with the migration data stream. IOW, libvirt
could unconditionally use the new feature as soon as it saw that it
exists in QEMU. We didn't have any machine type dependancy to deal
with before now.

> More exact question specific to this series usecase,
> how libvirt decides when to use -numa node,memdev or not currently?

It is pretty hard to follow the code, but IIUC we only use memdev when
stting up NVDIMMs, or for guests configured to have the "shared" flag
on the memory region.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
