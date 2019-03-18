Received: by 2002:a17:90a:ae18:0:0:0:0 with SMTP id t24-v6csp2833983pjq;
        Mon, 18 Mar 2019 09:45:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYE6jv4FKzDkgCE12ZYdWj2Lw3t6YnwHvFSBNuQJWkdFHWAWBI6DFa4SrGjGO+U4Nb7nQV
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr12161815wmh.53.1552927523808;
        Mon, 18 Mar 2019 09:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552927523; cv=none;
        d=google.com; s=arc-20160816;
        b=GK2JUsIX89SjFzDF2RFjMJm7ubPChKy3N1zNgS5eSndEB8zfe5HvNGrmwTekpFT/2A
         02Gx7bs1GX0tmN5VakQPi+NZwiRYw7FnbnhMkzJmVWWSmZ06n8tASHq90CnLk1d4aBDI
         iujGd1xyw2Wg2jBIMrnPNzrhH4DDQTGGpBjZL0SAfTEYA0r4Wagm82B4/tGaw64s0z7W
         HNYS5iHbHUiR7A2DgT85f33Roi4kg6VQwLU87Mlflg/mcQ8Mzn76KCDxtOaMH94VQ9VS
         VcHLY7TI6Fc0rao/al9n6m/d1F5PkWDivDuUgay6/qKMi3wTFmewfDMbhByjjxyVPDS2
         /paQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Z8mQjYNTsyjl5qww53XN4enz1CV59wlhBwW0NwqKTzc=;
        b=J+eXzZXiFD7j0nO8pC4wPFb0zVWOkVvp7yc/S8/Rjsbr3yO/5xtoN/OlpiCkz6ycJ5
         36qvwnqggIC08z4Maz+IqBZ2f5OC+clrGz1YbqGYoO8nWvQoij8qRLMLlRpLGqb5IwYc
         0QIk29Oq1QQ0Lmkqpih9sVwpojLXJjbRL8yFCe4mivb7laZApEBAZa+Zvee6wYvR6kdF
         4jglu17zC0WVbJHodWH9V3YerxbJAJpzGH3lHDrNwAQytGIYBFzfrP2epJDbi3n3sv0k
         Edre3zsiCuSMXMKmQspepvccXxop0OVUQcOHexrhe5af6kOvbynqubXKk/+cOwEDQys4
         Upkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si6827692wrn.426.2019.03.18.09.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 09:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h5vO6-0002BD-Ll
	for alex.bennee@linaro.org; Mon, 18 Mar 2019 12:45:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h5vNt-00027E-RO
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 12:45:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h5vNr-0000cc-RP
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 12:45:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h5vNp-0000bU-Ho; Mon, 18 Mar 2019 12:45:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6126770D61;
	Mon, 18 Mar 2019 16:45:04 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9829C60863;
	Mon, 18 Mar 2019 16:44:59 +0000 (UTC)
Date: Mon, 18 Mar 2019 17:44:58 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190318174458.1f9430b0@redhat.com>
In-Reply-To: <20190304145230.4435c998@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301180151.GE2851@work-vm>
	<20190304145230.4435c998@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 18 Mar 2019 16:45:04 +0000 (UTC)
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
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e2B4cIFfUjSs

On Mon, 4 Mar 2019 14:52:30 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Fri, 1 Mar 2019 18:01:52 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>=20
> > * Igor Mammedov (imammedo@redhat.com) wrote: =20
> > > On Fri, 1 Mar 2019 15:49:47 +0000
> > > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > >    =20
> > > > On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:   =20
> > > > > The parameter allows to configure fake NUMA topology where guest
> > > > > VM simulates NUMA topology but not actually getting a performance
> > > > > benefits from it. The same or better results could be achieved
> > > > > using 'memdev' parameter. In light of that any VM that uses NUMA
> > > > > to get its benefits should use 'memdev' and to allow transition
> > > > > initial RAM to device based model, deprecate 'mem' parameter as
> > > > > its ad-hoc partitioning of initial RAM MemoryRegion can't be
> > > > > translated to memdev based backend transparently to users and in
> > > > > compatible manner (migration wise).
> > > > >=20
> > > > > That will also allow to clean up a bit our numa code, leaving only
> > > > > 'memdev' impl. in place and several boards that use node_mem
> > > > > to generate FDT/ACPI description from it.     =20
> > > >=20
> > > > Can you confirm that the  'mem' and 'memdev' parameters to -numa
> > > > are 100% live migration compatible in both directions ?  Libvirt
> > > > would need this to be the case in order to use the 'memdev' syntax
> > > > instead.   =20
> > > Unfortunately they are not migration compatible in any direction,
> > > if it where possible to translate them to each other I'd alias 'mem'
> > > to 'memdev' without deprecation. The former sends over only one
> > > MemoryRegion to target, while the later sends over several (one per
> > > memdev).
> > >=20
> > > Mixed memory issue[1] first came from libvirt side RHBZ1624223,
> > > back then it was resolved on libvirt side in favor of migration
> > > compatibility vs correctness (i.e. bind policy doesn't work as expect=
ed).
> > > What worse that it was made default and affects all new machines,
> > > as I understood it.
> > >=20
> > > In case of -mem-path + -mem-prealloc (with 1 numa node or numa less)
> > > it's possible on QEMU side to make conversion to memdev in migration
> > > compatible way (that's what stopped Michal from memdev approach).
> > > But it's hard to do so in multi-nodes case as amount of MemoryRegions
> > > is different.
> > >=20
> > > Point is to consider 'mem' as mis-configuration error, as the user
> > > in the first place using broken numa configuration
> > > (i.e. fake numa configuration doesn't actually improve performance).
> > >=20
> > > CCed David, maybe he could offer a way to do 1:n migration and other
> > > way around.   =20
> >=20
> > I can't see a trivial way.
> > About the easiest I can think of is if you had a way to create a memdev
> > that was an alias to pc.ram (of a particular size and offset). =20
> If I get you right that's what I was planning to do for numa-less machines
> that use -mem-path/prealloc options, where it's possible to replace
> an initial RAM MemoryRegion with a correspondingly named memdev and its
> backing MemoryRegion.

> But I don't see how it could work in case of legacy NUMA 'mem' options
> where initial RAM is 1 MemoryRegion (it's a fake numa after all) and how =
to
> translate that into several MemoryRegions (one per node/memdev).
Limiting it to x86 for demo purposes.
What would work (if*) is to create special MemoryRegion container, i.e.
  1. make memory_region_allocate_system_memory():memory_region_init()
     that special which already has id pc.ram and size that matches
     the single RAMBlock with the same id in incoming migration stream
     from OLD qemu ( started with -numa node,mem=3Dx ... options)
  2. register "1" with vmstate_register_ram_global()/or other API
     which undercover will make migration code, split the single incoming
     RAM block into several smaller consecutive RAMBlocks  represented
     by memdev backends that are mapped as subregions within container 'pc.=
ram'
  3. in case of backward migration container MemoryRegion 'pc.ram' will ser=
ve
     other way around stitching back memdev subregions into the single
     'pc.ram' migration stream.

(if*) - but above describes an ideal use-case where -numa node,mem
are properly sized. In practice though QEMU doesn't have any checks
on numa's 'mem' value option. So users were able to 'split' RAM in
arbitrary chunks which memdev based backends might not be able
to recreate due to used backing storage limitations (alignment/page size).
To make it worse we don't really know what source (old QEMU) uses for
backend for real as it might fallback to anonymous RAM if mem-path fails
(there is no fallback in memdev case as there user gets what he/she asked
for or hard error).

There might be other issues on migration side of things as well,
but I just don't know about it enough to see them.


> > Dave
> >  =20
> > >    =20
> > > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > > > ---
> > > > >  numa.c               |  2 ++
> > > > >  qemu-deprecated.texi | 14 ++++++++++++++
> > > > >  2 files changed, 16 insertions(+)
> > > > >=20
> > > > > diff --git a/numa.c b/numa.c
> > > > > index 3875e1e..2205773 100644
> > > > > --- a/numa.c
> > > > > +++ b/numa.c
> > > > > @@ -121,6 +121,8 @@ static void parse_numa_node(MachineState *ms,=
 NumaNodeOptions *node,
> > > > > =20
> > > > >      if (node->has_mem) {
> > > > >          numa_info[nodenr].node_mem =3D node->mem;
> > > > > +        warn_report("Parameter -numa node,mem is deprecated,"
> > > > > +                    " use -numa node,memdev instead");
> > > > >      }
> > > > >      if (node->has_memdev) {
> > > > >          Object *o;
> > > > > diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> > > > > index 45c5795..73f99d4 100644
> > > > > --- a/qemu-deprecated.texi
> > > > > +++ b/qemu-deprecated.texi
> > > > > @@ -60,6 +60,20 @@ Support for invalid topologies will be removed=
, the user must ensure
> > > > >  topologies described with -smp include all possible cpus, i.e.
> > > > >    @math{@var{sockets} * @var{cores} * @var{threads} =3D @var{max=
cpus}}.
> > > > > =20
> > > > > +@subsection -numa node,mem=3D@var{size} (since 4.0)
> > > > > +
> > > > > +The parameter @option{mem} of @option{-numa node} is used to ass=
ign a part of
> > > > > +guest RAM to a NUMA node. But when using it, it's impossible to =
manage specified
> > > > > +size on the host side (like bind it to a host node, setting bind=
 policy, ...),
> > > > > +so guest end-ups with the fake NUMA configuration with suboptiom=
al performance.
> > > > > +However since 2014 there is an alternative way to assign RAM to =
a NUMA node
> > > > > +using parameter @option{memdev}, which does the same as @option{=
mem} and has
> > > > > +an ability to actualy manage node RAM on the host side. Use para=
meter
> > > > > +@option{memdev} with @var{memory-backend-ram} backend as an repl=
acement for
> > > > > +parameter @option{mem} to achieve the same fake NUMA effect or a=
 properly
> > > > > +configured @var{memory-backend-file} backend to actually benefit=
 from NUMA
> > > > > +configuration.
> > > > > +
> > > > >  @section QEMU Machine Protocol (QMP) commands
> > > > > =20
> > > > >  @subsection block-dirty-bitmap-add "autoload" parameter (since 2=
.12.0)
> > > > > --=20
> > > > > 2.7.4
> > > > >=20
> > > > > --
> > > > > libvir-list mailing list
> > > > > libvir-list@redhat.com
> > > > > https://www.redhat.com/mailman/listinfo/libvir-list     =20
> > > >=20
> > > > Regards,
> > > > Daniel   =20
> > >    =20
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK =20
>=20
>=20

