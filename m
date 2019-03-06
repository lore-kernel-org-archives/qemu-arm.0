Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6291440wrx;
        Wed, 6 Mar 2019 11:57:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqyA3cpM8zoAtl4mXptGCn2YGvwfFBCUahpPZvOPHqxjrkWoxFdFTjFNbhMe3E2JVetSX1F9
X-Received: by 2002:a0d:e707:: with SMTP id q7mr6978065ywe.148.1551902221411;
        Wed, 06 Mar 2019 11:57:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551902221; cv=none;
        d=google.com; s=arc-20160816;
        b=YlvRygzhG45ldXXYStREeYNorz5RZdFsHJlgT1EL/1kHwsg+6iNdTLmf/I8M3Ej6q7
         JcShpArVDTaWEEBwZ+d5EP+l0O/Ow/8cYQGdw2eC/wKGy47XHCh4b2G+LgMYUIU6B9y6
         tsUlceJsjlE8htzEwAi24KBkV31g6STn46XxEfqhYl6uVWu+KRfNpH1GR+X3N6JabBQV
         lcoM8rAUD4OST8d260X6IAl8w+GJoXAiCU3YqaqTrQrEZ76uFYzAxHbCSpVbugw8qjs+
         jv3jLD/sArzetPaz/ewG2npdzYTFgpojmav6Nbo2Y2+jr1QN4JnHjAj2qvt34Aekx3n5
         Ax4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=jvtjmyIBJ9yrzH8VC39qhcNvZEvD/PeMfRRSpn1lH2E=;
        b=RL2P5iK6kSwdvgu6fpDgkNbqlGri708fQNQ8BhhjjoYyHW1XPGwKYpxavwcq9B1jWL
         ++qoTxYE7n028PbNWB2L+adWLHMseahYNpEcfTR4F0ziisrRHkxtZLzX3kmCjIDsGrzG
         XLEzO/1ARVxw3LZwDPR7/ZYPxlUU9ymhB+tTvuHZAiKGbv9LxiLAdnYXuipRQkCeAw3f
         pgA2vs9TjP77A6cfx8ZZdc2/q6Dv4B/+lzG9cxKJqZBVmoqZfP36AEStdZ6YSix1S24v
         rHJ2jF5LlfITxwd+sBZTMzrZVdiaiPDwMY8bCyZOIGK/BtsN+YVfU2gFnCM12plOXeM+
         4nlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si1449931ybb.461.2019.03.06.11.57.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Mar 2019 11:57:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1cey-0001Qp-QJ
	for alex.bennee@linaro.org; Wed, 06 Mar 2019 14:57:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1cen-0001QQ-Ht
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 14:56:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1cel-0006qy-Rd
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 14:56:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36820)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h1cel-0006ps-Hh; Wed, 06 Mar 2019 14:56:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C9E0C057F50;
	Wed,  6 Mar 2019 19:56:45 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-17.ams2.redhat.com
	[10.36.112.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B85865D783;
	Wed,  6 Mar 2019 19:56:39 +0000 (UTC)
Date: Wed, 6 Mar 2019 20:56:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <20190306205636.4ac310bb@Igors-MacBook-Pro.local>
In-Reply-To: <a6081774-c9d5-0496-3e65-ffb885408261@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 06 Mar 2019 19:56:45 +0000 (UTC)
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
Cc: peter.maydell@linaro.org,
	"Daniel P. =?UTF-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
	ehabkost@redhat.com, libvir-list@redhat.com,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com, "Dr.
	David Alan Gilbert" <dgilbert@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6/gzru4k7byI

On Mon, 4 Mar 2019 17:20:13 +0100
Michal Privoznik <mprivozn@redhat.com> wrote:

> On 3/4/19 3:24 PM, Daniel P. Berrang=C3=A9 wrote:
> > On Mon, Mar 04, 2019 at 03:16:41PM +0100, Igor Mammedov wrote:
> >> On Mon, 4 Mar 2019 12:39:08 +0000
> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >>
> >>> On Mon, Mar 04, 2019 at 01:25:07PM +0100, Igor Mammedov wrote:
> >>>> On Mon, 04 Mar 2019 08:13:53 +0100
> >>>> Markus Armbruster <armbru@redhat.com> wrote:
> >>>>   =20
> >>>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >>>>>   =20
> >>>>>> On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote:
> >>>>>>> On Fri, 1 Mar 2019 15:49:47 +0000
> >>>>>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >>>>>>>     =20
> >>>>>>>> On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:
> >>>>>>>>> The parameter allows to configure fake NUMA topology where guest
> >>>>>>>>> VM simulates NUMA topology but not actually getting a performan=
ce
> >>>>>>>>> benefits from it. The same or better results could be achieved
> >>>>>>>>> using 'memdev' parameter. In light of that any VM that uses NUMA
> >>>>>>>>> to get its benefits should use 'memdev' and to allow transition
> >>>>>>>>> initial RAM to device based model, deprecate 'mem' parameter as
> >>>>>>>>> its ad-hoc partitioning of initial RAM MemoryRegion can't be
> >>>>>>>>> translated to memdev based backend transparently to users and in
> >>>>>>>>> compatible manner (migration wise).
> >>>>>>>>>
> >>>>>>>>> That will also allow to clean up a bit our numa code, leaving o=
nly
> >>>>>>>>> 'memdev' impl. in place and several boards that use node_mem
> >>>>>>>>> to generate FDT/ACPI description from it.
> >>>>>>>>
> >>>>>>>> Can you confirm that the  'mem' and 'memdev' parameters to -numa
> >>>>>>>> are 100% live migration compatible in both directions ?  Libvirt
> >>>>>>>> would need this to be the case in order to use the 'memdev' synt=
ax
> >>>>>>>> instead.
> >>>>>>> Unfortunately they are not migration compatible in any direction,
> >>>>>>> if it where possible to translate them to each other I'd alias 'm=
em'
> >>>>>>> to 'memdev' without deprecation. The former sends over only one
> >>>>>>> MemoryRegion to target, while the later sends over several (one p=
er
> >>>>>>> memdev).
> >>>>>>
> >>>>>> If we can't migration from one to the other, then we can not depre=
cate
> >>>>>> the existing 'mem' syntax. Even if libvirt were to provide a config
> >>>>>> option to let apps opt-in to the new syntax, we need to be able to
> >>>>>> support live migration of existing running VMs indefinitely. Effec=
tively
> >>>>>> this means we need the to keep 'mem' support forever, or at least =
such
> >>>>>> a long time that it effectively means forever.
> >>>>>>
> >>>>>> So I think this patch has to be dropped & replaced with one that
> >>>>>> simply documents that memdev syntax is preferred.
> >>>>>
> >>>>> We have this habit of postulating absolutes like "can not deprecate"
> >>>>> instead of engaging with the tradeoffs.  We need to kick it.
> >>>>>
> >>>>> So let's have an actual look at the tradeoffs.
> >>>>>
> >>>>> We don't actually "support live migration of existing running VMs
> >>>>> indefinitely".
> >>>>>
> >>>>> We support live migration to any newer version of QEMU that still
> >>>>> supports the machine type.
> >>>>>
> >>>>> We support live migration to any older version of QEMU that already
> >>>>> supports the machine type and all the devices the machine uses.
> >>>>>
> >>>>> Aside: "support" is really an honest best effort here.  If you rely=
 on
> >>>>> it, use a downstream that puts in the (substantial!) QA work real
> >>>>> support takes.
> >>>>>
> >>>>> Feature deprecation is not a contract to drop the feature after two
> >>>>> releases, or even five.  It's a formal notice that users of the fea=
ture
> >>>>> should transition to its replacement in an orderly manner.
> >>>>>
> >>>>> If I understand Igor correctly, all users should transition away fr=
om
> >>>>> outdated NUMA configurations at least for new VMs in an orderly man=
ner.
> >>>> Yes, we can postpone removing options until there are machines type
> >>>> versions that were capable to use it (unfortunate but probably
> >>>> unavoidable unless there is a migration trick to make transition
> >>>> transparent) but that should not stop us from disabling broken
> >>>> options on new machine types at least.
> >>>>
> >>>> This series can serve as formal notice with follow up disabling of
> >>>> deprecated options for new machine types. (As Thomas noted, just war=
nings
> >>>> do not work and users continue to use broken features regardless whe=
ther
> >>>> they are don't know about issues or aware of it [*])
> >>>>
> >>>> Hence suggested deprecation approach and enforced rejection of legacy
> >>>> numa options for new machine types in 2 releases so users would stop
> >>>> using them eventually.
> >>>
> >>> When we deprecate something, we need to have a way for apps to use the
> >>> new alternative approach *at the same time*.  So even if we only want=
 to
> >>> deprecate for new machine types, we still have to first solve the pro=
blem
> >>> of how mgmt apps will introspect QEMU to learn which machine types ex=
pect
> >>> the new options.
> >> I'm not aware any mechanism to introspect machine type options (existi=
ng
> >> or something being developed). Are/were there any ideas about it that =
were
> >> discussed in the past?
> >>
> >> Aside from developing a new mechanism what are alternative approaches?
> >> I mean when we delete deprecated CLI option, how it's solved on libvirt
> >> side currently?
> >>
> >> For example I don't see anything introspection related when we have be=
en
> >> removing deprecated options recently.
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
>      qemu: Create memory-backend-{ram,file} iff needed
>=20
> Or this 7832fac84741d65e851dbdbfaf474785cbfdcf3c. We did try to=20
> generated newer cmd line but then for various reasong (e.g. avoiding=20
> triggering a qemu bug) we turned it off and make libvirt default to=20
> older (now deprecated) cmd line.
>=20
> Frankly, I don't know how to proceed. Unless qemu is fixed to allow=20
> migration from deprecated to new cmd line (unlikely, if not impossible,=20
> right?) then I guess the only approach we can have is that:
In non numa case (or 1 node case) there is migration compatible solution,
I'm working on it.

The only problematic case is where -mem-path + -mem-prealloc + pc-dimm are
used with muti-node variant + '-numa node,mem=3Dxx' option or plain '-numa =
node'
with implicit RAM distribution (the same as 'mem' just done by QEMU), here I
can't translate options due to different memory layout, so these VMs would=
=20
still continue using old 'mem' with old machine types.

> 1) whenever so called cold booting a new machine (fresh, brand new start=
=20
> of a new domain) libvirt would default to modern cmd line,
that's what I'd prefer and complained that this route wasn't followed.
(it would even work with currently broken QEMU, since modern CLI variant wo=
rks)

It would wean down 'mem' userbase that configures NUMA incorrectly (i.e. no=
n pinned mem&cpus).
Users still can do that with 'memdev' by leaving out bind policy but
when they ask for pinning with bind policy they will really get it since
under-hood "-mem-path + -mem-prealloc" will be the same 'memdev,prealloc=3D=
on',
without surprise due to quite non obvious call ordering.
=20
> 2) on migration, libvirt would record in the migration stream (or status=
=20
> XML or wherever) that modern cmd line was generated and thus it'll make=20
> the destination generate modern cmd line too.
since legacy option is not removed, it's not necessary for converting
legacy SOURCE to new CLI (new QEMU would still accept legacy CLI for
old machine types), i.e.e business as usual.


> This solution still suffers a couple of problems:
> a) migration to older libvirt will fail as older libvirt won't recognize=
=20
> the flag set in 2) and therefore would default to deprecated cmd line

> b) migrating from one host to another won't modernize the cmd line
I didn't knew that there was 'modernizing' feature in libvirt but
modernizing CLI only necessary when we remove option completely.


> But I guess we have to draw a line somewhere (if we are not willing to=20
> write those migration patches).
I wasn't able to make migration from 1 to N MemoryRegions and back work.
So the only choice left is to start deprecation of numa 'mem' option with
new machine types, so that at least there memory pinning would not be broken
and it wouldn't be possible to mis-configure it.


> Michal

