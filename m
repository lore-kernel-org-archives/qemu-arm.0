Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp942667wro;
        Thu, 14 Mar 2019 07:54:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZwBY/h+s2QjhihVQ+vf6YgxtA3NAK6P1CS2tKRDCC3Fb3MGhzcYB8TgUCCTksIFPQ/32c
X-Received: by 2002:a25:e0c5:: with SMTP id x188mr40435139ybg.376.1552575277632;
        Thu, 14 Mar 2019 07:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552575277; cv=none;
        d=google.com; s=arc-20160816;
        b=SbRpD6y/JBhNmhPH6jCenqC8iHAbmMJvq9hce8BGLdtW74bfpRLjKZ9aE5iDqqUGXY
         YfKxJisz3IGB8RhY7fHhnEJ8NwMuXR8WjQoY1lesAoQfDobDqaMeBD/a4gKfTrHZOemA
         Bn3L8nhB0Xd1cq4Y9pV2BFgNfkyar42XURNGuWjGEowpiecYmlZsJubM2Ec71jJR/x0Z
         sZRMPnjhT2Fe2En/FadDJtbkGp639rl8n+RXdS2sxMrnhG2rR4eBlE/YT79iWjUjmTKu
         AZ9mjKQKevJJxy/aayVMwVQxgvkkIqgNfxIThF02JtbJZdjVaWANlq8Qiov9ecx9M5At
         C5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=kgGb98BRGB9JXvKC+lxKOS/WSD/S18D046l80ZlIJRc=;
        b=eSw4w4mLUshL2SbiG50dNl2LBuz22s4JZzhUrekagLwFEl8Nff1ot7T14vi9JLL7ko
         QldQ0ix2I7Yp4o+hxybuNyPZTQuVxnr/9pApWBclE+czh6lNE7JafPEI6cjxCiXPsu12
         IioRBlbUDWTEBubYIgfNOYYM7UADjXZabKoNYcIuh1nHLZ5m4sk0dj7El/A2E/MByMKb
         adyK+QbKxmHz8FIb/ELeUJgMNat+yp5TDCkvyYX/N1ODaW6ix6jgltFr/I9bbbPtR9zQ
         dAx3X13D3VWw7eRWcg97w84pFBoGqJSxl2LBHPvwBBfVAPjTWu6iGmZFftqEddCpfO7s
         lxLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p139si8926776ywe.130.2019.03.14.07.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 07:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Rkj-0005dk-4F
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 10:54:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h4Rig-00040w-Hp
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 10:52:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h4Rid-0007V6-SG
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 10:52:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59820)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h4RiU-0007Q3-Ar; Thu, 14 Mar 2019 10:52:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 87184301EABE;
	Thu, 14 Mar 2019 14:52:17 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBB225C231;
	Thu, 14 Mar 2019 14:52:12 +0000 (UTC)
Date: Thu, 14 Mar 2019 15:52:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190314155211.477d9e44@redhat.com>
In-Reply-To: <871s3fxce6.fsf@dusky.pond.sub.org>
References: <20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304132507.39273826@redhat.com>
	<20190304123908.GK4239@redhat.com>
	<20190304151641.3deefc3b@redhat.com>
	<20190304142432.GM4239@redhat.com>
	<a6081774-c9d5-0496-3e65-ffb885408261@redhat.com>
	<20190304163516.GQ4239@redhat.com>
	<20190306200348.11e9eece@Igors-MacBook-Pro.local>
	<20190307095901.GF32268@redhat.com>
	<871s3fxce6.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 14 Mar 2019 14:52:17 +0000 (UTC)
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
	Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org, "Dr. David
	Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vOF/dsXfN75Y

On Sun, 10 Mar 2019 11:16:33 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>=20
> > On Wed, Mar 06, 2019 at 08:03:48PM +0100, Igor Mammedov wrote: =20
> >> On Mon, 4 Mar 2019 16:35:16 +0000
> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >>  =20
> >> > On Mon, Mar 04, 2019 at 05:20:13PM +0100, Michal Privoznik wrote: =20
> >> > > We couldn't have done that. How we would migrate from older qemu?
> >> > >=20
> >> > > Anyway, now that I look into this (esp. git log) I came accross:
> >> > >=20
> >> > > commit f309db1f4d51009bad0d32e12efc75530b66836b
> >> > > Author:     Michal Privoznik <mprivozn@redhat.com>
> >> > > AuthorDate: Thu Dec 18 12:36:48 2014 +0100
> >> > > Commit:     Michal Privoznik <mprivozn@redhat.com>
> >> > > CommitDate: Fri Dec 19 07:44:44 2014 +0100
> >> > >=20
> >> > >     qemu: Create memory-backend-{ram,file} iff needed
> >> > >=20
> >> > > Or this 7832fac84741d65e851dbdbfaf474785cbfdcf3c. We did try to ge=
nerated
> >> > > newer cmd line but then for various reasong (e.g. avoiding trigger=
ing a qemu
> >> > > bug) we turned it off and make libvirt default to older (now depre=
cated) cmd
> >> > > line.
> >> > >=20
> >> > > Frankly, I don't know how to proceed. Unless qemu is fixed to allow
> >> > > migration from deprecated to new cmd line (unlikely, if not imposs=
ible,
> >> > > right?) then I guess the only approach we can have is that:
> >> > >=20
> >> > > 1) whenever so called cold booting a new machine (fresh, brand new=
 start of
> >> > > a new domain) libvirt would default to modern cmd line,
> >> > >=20
> >> > > 2) on migration, libvirt would record in the migration stream (or =
status XML
> >> > > or wherever) that modern cmd line was generated and thus it'll mak=
e the
> >> > > destination generate modern cmd line too.
> >> > >=20
> >> > > This solution still suffers a couple of problems:
> >> > > a) migration to older libvirt will fail as older libvirt won't rec=
ognize the
> >> > > flag set in 2) and therefore would default to deprecated cmd line
> >> > > b) migrating from one host to another won't modernize the cmd line
> >> > >=20
> >> > > But I guess we have to draw a line somewhere (if we are not willin=
g to write
> >> > > those migration patches). =20
> >> >=20
> >> > Yeah supporting backwards migration is a non-optional requirement fr=
om at
> >> > least one of the mgmt apps using libvirt, so breaking the new to old=
 case
> >> > is something we always aim to avoid. =20
> >> Aiming for support of=20
> >> "new QEMU + new machine type" =3D> "old QEMU + non-existing machine ty=
pe"
> >> seems a bit difficult. =20
> >
> > That's not the scenario that's the problem. The problem is
> >
> >    new QEMU + new machine type + new libvirt   -> new QEMU + new machin=
e type + old libvirt
> >
> > Previously released versions of libvirt will happily use any new machine
> > type that QEMU introduces. So we can't make new libvirt use a different
> > options, only for new machine types, as old libvirt supports those mach=
ine
> > types too. =20
>=20
> Avoiding tight coupling between QEMU und libvirt versions makes sense,
> because having to upgrade stuff in lock-step is such a pain.
>=20
> Does not imply we must support arbitrary combinations of QEMU and
> libvirt versions.
Isn't it typically a job of downstream to ship a bundle that works
together and it is rather limited set.
e.g=20
  System 1 libvirt 0 QEMU 0 (machine 0.1 (latest)) could be migrated to 2 w=
ays to
  System 2 libvirt 1 QEMU 1 (machine 0.1 (still the same old machine))
while installing QEMU 1 on System 1 might work (if it doesn't break due to =
dependencies)
and even be able to start machine 1.0, wouldn't it really fall in unsupport=
ed category?


> Unless upstream libvirt's test matrix covers all versions of libvirt
> against all released versions of QEMU, "previously released versions of
> libvirt will continue to work with new QEMU" is largely an empty promise
> anyway.  The real promise is more like "we won't break it intentionally;
> good luck".
>=20
> Mind, I'm not criticizing that real promise.  I'm criticizing cutting
> yourself off from large areas of the solution space so you can continue
> to pretend to yourself you actually deliver on the empty promise.
>=20
> Now, if you limited what you promise to something more realistic,
> ideally to something you actually test, we could talk about deprecation
> schedules constructively.
>=20
> For instance, if you promised
>=20
>     QEMU as of time T + its latest machine type + libvirt as of time T
>  -> QEMU as of time T + its latest machine type + libvirt as of time T - =
d =20
>=20
> will work for a certain value of d, then once all released versions of
> libvirt since T - d support a new way of doing things, flipping to that
> new way becomes a whole lot easier.
On top of that libvirt should be willing to adapt to the new way for above
combination.

I'm experimenting with making 'mem' migration compatible with 'memdev'
(I have a working hack currently) to get a feeling of a toll it would
take on QEMU, so far outlook isn't good. It just adds more compat code
and new CLI options to deal with it (it just increases amount of
maintenance nightmare for indefinite period of time). And everyone would
hate adding such new CLI options which as it turns out we aren't able to
deprecate and remove in practice.

We really need to figure out how to introduce breaking change on management
(CLI) side* in QEMU and make it digestible for libvirt and others.
(* at least for new machine types).
