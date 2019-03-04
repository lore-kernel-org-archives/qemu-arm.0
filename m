Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3791159wrx;
        Mon, 4 Mar 2019 08:32:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwvNqieXgFG9NaPFAGe5RJs897f/geWbDJQotLMVbw2irJvoJh8LVgpp6Pb5/A4m7SCGwam
X-Received: by 2002:a25:1e07:: with SMTP id e7mr13683680ybe.511.1551717150792;
        Mon, 04 Mar 2019 08:32:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551717150; cv=none;
        d=google.com; s=arc-20160816;
        b=UtfoO/t7Ggl3ZFDqjTUISjSzljBfC+AHM0ZkAHFW28ang9VSELxGIcVycFoSy+KHnv
         F86L4d1KIIiPBKPRFJ9NI99pPOJGlh3CLi1LX73A437/coltyME9QtcHMY5RIMMSZpcR
         IiUAie7iSKWshn5rD7sprNpHmbUqOGXOY5U1Ef9YWrkpYwwcocipg87IS7nrFGsdmKYn
         /wpyGxO3GAHx+xj5fmzCT1CJd21NPLYpo1o/4VA4WgDr5CgZS2zc1sZ/8DsFeStFjife
         CGGQIaKAfVRC7dhR1pe8fZzIq/0ae99aRGAZCyWpBRJyT+3MgzREtePdjX2ePum7PVvy
         eGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=7Kk52F3kyhxqftQcFysxZ9bpSwRH9z8zXNzdnz8nK+o=;
        b=y4WOPDzdIXImYO2tg6Wt3Ac5bOreJw0Y4IFAOU/j1aYbjZku0FSAzYkXKpxF+Lp67R
         lL+uPnxG3hQuEw9GmvgqpKryAxbuCwsQmZXn2lRV+5y9ROWhiv4NByg3NnhUpgbVAzDb
         Fx7pJ7oOtD6nkBKnO64qHUUtA7mthloUJyXQgIZl5yVDGxRc8/Qa2WX3ce+knDkFrDGs
         hQtJqm0jQtuskHAycrQywn+w+tDrvsxCwVvA4tA5SFSi9rCp6qVaxW+utUs+chEFzxBw
         y6O4jer5/IhGxY+TPPXGTKr4SegsXydRb1AuBnFqwmGbUYQWUhpmMrVDmOJyqtiepGiW
         GAYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 191si3408412ybk.243.2019.03.04.08.32.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 08:32:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0qVy-0002da-54
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 11:32:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1h0qVQ-0002Yz-3m
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 11:31:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1h0qVO-0004oa-Gu
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 11:31:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1h0qVO-0004hi-3P; Mon, 04 Mar 2019 11:31:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 700B93082E6A;
	Mon,  4 Mar 2019 16:31:51 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14C3C60863;
	Mon,  4 Mar 2019 16:31:46 +0000 (UTC)
Date: Mon, 4 Mar 2019 16:31:44 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <20190304163143.GB2596@work-vm>
References: <1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304132507.39273826@redhat.com>
	<20190304123908.GK4239@redhat.com>
	<20190304151641.3deefc3b@redhat.com>
	<20190304142432.GM4239@redhat.com>
	<a6081774-c9d5-0496-3e65-ffb885408261@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <a6081774-c9d5-0496-3e65-ffb885408261@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 04 Mar 2019 16:31:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [libvirt] [PATCH 1/2] numa: deprecate 'mem'
 parameter of '-numa node' option
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	Igor Mammedov <imammedo@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sYLxf3u4Tv1o

* Michal Privoznik (mprivozn@redhat.com) wrote:
> On 3/4/19 3:24 PM, Daniel P. Berrang=E9 wrote:
> > On Mon, Mar 04, 2019 at 03:16:41PM +0100, Igor Mammedov wrote:
> > > On Mon, 4 Mar 2019 12:39:08 +0000
> > > Daniel P. Berrang=E9 <berrange@redhat.com> wrote:
> > >=20
> > > > On Mon, Mar 04, 2019 at 01:25:07PM +0100, Igor Mammedov wrote:
> > > > > On Mon, 04 Mar 2019 08:13:53 +0100
> > > > > Markus Armbruster <armbru@redhat.com> wrote:
> > > > > > Daniel P. Berrang=E9 <berrange@redhat.com> writes:
> > > > > > > On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wro=
te:
> > > > > > > > On Fri, 1 Mar 2019 15:49:47 +0000
> > > > > > > > Daniel P. Berrang=E9 <berrange@redhat.com> wrote:
> > > > > > > > > On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov=
 wrote:
> > > > > > > > > > The parameter allows to configure fake NUMA topology =
where guest
> > > > > > > > > > VM simulates NUMA topology but not actually getting a=
 performance
> > > > > > > > > > benefits from it. The same or better results could be=
 achieved
> > > > > > > > > > using 'memdev' parameter. In light of that any VM tha=
t uses NUMA
> > > > > > > > > > to get its benefits should use 'memdev' and to allow =
transition
> > > > > > > > > > initial RAM to device based model, deprecate 'mem' pa=
rameter as
> > > > > > > > > > its ad-hoc partitioning of initial RAM MemoryRegion c=
an't be
> > > > > > > > > > translated to memdev based backend transparently to u=
sers and in
> > > > > > > > > > compatible manner (migration wise).
> > > > > > > > > >=20
> > > > > > > > > > That will also allow to clean up a bit our numa code,=
 leaving only
> > > > > > > > > > 'memdev' impl. in place and several boards that use n=
ode_mem
> > > > > > > > > > to generate FDT/ACPI description from it.
> > > > > > > > >=20
> > > > > > > > > Can you confirm that the  'mem' and 'memdev' parameters=
 to -numa
> > > > > > > > > are 100% live migration compatible in both directions ?=
  Libvirt
> > > > > > > > > would need this to be the case in order to use the 'mem=
dev' syntax
> > > > > > > > > instead.
> > > > > > > > Unfortunately they are not migration compatible in any di=
rection,
> > > > > > > > if it where possible to translate them to each other I'd =
alias 'mem'
> > > > > > > > to 'memdev' without deprecation. The former sends over on=
ly one
> > > > > > > > MemoryRegion to target, while the later sends over severa=
l (one per
> > > > > > > > memdev).
> > > > > > >=20
> > > > > > > If we can't migration from one to the other, then we can no=
t deprecate
> > > > > > > the existing 'mem' syntax. Even if libvirt were to provide =
a config
> > > > > > > option to let apps opt-in to the new syntax, we need to be =
able to
> > > > > > > support live migration of existing running VMs indefinitely=
. Effectively
> > > > > > > this means we need the to keep 'mem' support forever, or at=
 least such
> > > > > > > a long time that it effectively means forever.
> > > > > > >=20
> > > > > > > So I think this patch has to be dropped & replaced with one=
 that
> > > > > > > simply documents that memdev syntax is preferred.
> > > > > >=20
> > > > > > We have this habit of postulating absolutes like "can not dep=
recate"
> > > > > > instead of engaging with the tradeoffs.  We need to kick it.
> > > > > >=20
> > > > > > So let's have an actual look at the tradeoffs.
> > > > > >=20
> > > > > > We don't actually "support live migration of existing running=
 VMs
> > > > > > indefinitely".
> > > > > >=20
> > > > > > We support live migration to any newer version of QEMU that s=
till
> > > > > > supports the machine type.
> > > > > >=20
> > > > > > We support live migration to any older version of QEMU that a=
lready
> > > > > > supports the machine type and all the devices the machine use=
s.
> > > > > >=20
> > > > > > Aside: "support" is really an honest best effort here.  If yo=
u rely on
> > > > > > it, use a downstream that puts in the (substantial!) QA work =
real
> > > > > > support takes.
> > > > > >=20
> > > > > > Feature deprecation is not a contract to drop the feature aft=
er two
> > > > > > releases, or even five.  It's a formal notice that users of t=
he feature
> > > > > > should transition to its replacement in an orderly manner.
> > > > > >=20
> > > > > > If I understand Igor correctly, all users should transition a=
way from
> > > > > > outdated NUMA configurations at least for new VMs in an order=
ly manner.
> > > > > Yes, we can postpone removing options until there are machines =
type
> > > > > versions that were capable to use it (unfortunate but probably
> > > > > unavoidable unless there is a migration trick to make transitio=
n
> > > > > transparent) but that should not stop us from disabling broken
> > > > > options on new machine types at least.
> > > > >=20
> > > > > This series can serve as formal notice with follow up disabling=
 of
> > > > > deprecated options for new machine types. (As Thomas noted, jus=
t warnings
> > > > > do not work and users continue to use broken features regardles=
s whether
> > > > > they are don't know about issues or aware of it [*])
> > > > >=20
> > > > > Hence suggested deprecation approach and enforced rejection of =
legacy
> > > > > numa options for new machine types in 2 releases so users would=
 stop
> > > > > using them eventually.
> > > >=20
> > > > When we deprecate something, we need to have a way for apps to us=
e the
> > > > new alternative approach *at the same time*.  So even if we only =
want to
> > > > deprecate for new machine types, we still have to first solve the=
 problem
> > > > of how mgmt apps will introspect QEMU to learn which machine type=
s expect
> > > > the new options.
> > > I'm not aware any mechanism to introspect machine type options (exi=
sting
> > > or something being developed). Are/were there any ideas about it th=
at were
> > > discussed in the past?
> > >=20
> > > Aside from developing a new mechanism what are alternative approach=
es?
> > > I mean when we delete deprecated CLI option, how it's solved on lib=
virt
> > > side currently?
> > >=20
> > > For example I don't see anything introspection related when we have=
 been
> > > removing deprecated options recently.
> >=20
> > Right, with other stuff we deprecate we've had a simpler time, as it
> > either didn't affect migration at all, or the new replacement stuff
> > was fully compatible with the migration data stream. IOW, libvirt
> > could unconditionally use the new feature as soon as it saw that it
> > exists in QEMU. We didn't have any machine type dependancy to deal
> > with before now.
>=20
> We couldn't have done that. How we would migrate from older qemu?
>=20
> Anyway, now that I look into this (esp. git log) I came accross:
>=20
> commit f309db1f4d51009bad0d32e12efc75530b66836b
> Author:     Michal Privoznik <mprivozn@redhat.com>
> AuthorDate: Thu Dec 18 12:36:48 2014 +0100
> Commit:     Michal Privoznik <mprivozn@redhat.com>
> CommitDate: Fri Dec 19 07:44:44 2014 +0100
>=20
>     qemu: Create memory-backend-{ram,file} iff needed
>=20
> Or this 7832fac84741d65e851dbdbfaf474785cbfdcf3c. We did try to generat=
ed
> newer cmd line but then for various reasong (e.g. avoiding triggering a=
 qemu
> bug) we turned it off and make libvirt default to older (now deprecated=
) cmd
> line.
>=20
> Frankly, I don't know how to proceed. Unless qemu is fixed to allow
> migration from deprecated to new cmd line (unlikely, if not impossible,
> right?) then I guess the only approach we can have is that:
>=20
> 1) whenever so called cold booting a new machine (fresh, brand new star=
t of
> a new domain) libvirt would default to modern cmd line,
>
> 2) on migration, libvirt would record in the migration stream (or statu=
s XML
> or wherever) that modern cmd line was generated and thus it'll make the
> destination generate modern cmd line too.
>=20
> This solution still suffers a couple of problems:
> a) migration to older libvirt will fail as older libvirt won't recogniz=
e the
> flag set in 2) and therefore would default to deprecated cmd line
> b) migrating from one host to another won't modernize the cmd line
>=20
> But I guess we have to draw a line somewhere (if we are not willing to =
write
> those migration patches).

What's interesting here is that this problem isn't really machine-type
related; so providing introspection on the machine type doesn't
immediately help.  What we're actually trying to do here is (mis)use a
machine type as a proxy for knowing that both sides are new enough to
handle the new command line.

That's an OK thing to do, and if we did have introspection we could
add a fudge flag to say it's allowed now.

Dave


> Michal
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
