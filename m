Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp881865wrx;
        Fri, 1 Mar 2019 09:33:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJyVWQY1p88Uizx1cdCMYNZsaZ+JxGqwWMDbGc6gQMkrIp6Xt4pTa6IcKA1CglRdmg2C8I
X-Received: by 2002:a81:8c9:: with SMTP id 192mr4754352ywi.288.1551461631208;
        Fri, 01 Mar 2019 09:33:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551461631; cv=none;
        d=google.com; s=arc-20160816;
        b=0NTlFEoFFqawV2B1BuPO2Gnzz6XeCuBxSglryUKDmmodSo0gjrS53Fn6lrGLaEy0oT
         ON6yqNxkEycXbrWLyJahWRnyuEXQqe8ofg4I5lpIJvywfayFiDNxU8jwefR72XLVrJQV
         aG1ydbmn8eljeiCUbEFNhWD18M/whnp//5CfYCyK5DSnENXDrQht2+GJdldat6JMOtlb
         7q7iCk8f/Tlch1MgdQ3gNUwnoyhf1WOMn9ZE//PM7LAKad71BaeSsh4AH8winRpAuRXR
         nag6jFz6y2zhjxdHC5MWXg6iJ82YM+k2lG8EoW6aQ5jhArWNBbzOl1yMoLpoaxxajLW7
         Vadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=9PKesn+Q+RYR126st12uBTbfMG6lFFe2LBTLkXiOp48=;
        b=Un+8LMYYG7PiOEKSK9RxQw92DKtVZmLS4sP6cNMqoA+98Q4Z1aSlSDh2eFJlkZkFv6
         6Di6s9RNAp2SAfNo3hbUVULJV23rAMLu5g3uKqndaYytvKHmQ//Y4di20LDTJth8eZvU
         Ek18QF62fJ4kOGv8s7rICoor+0BwKkfCQQ5Edvi8yDbgNigG7+zNmyPsspDEs1pwXOwq
         0d9jTmuW6hDhjkGgUkPbeaJ9TjBPTFRqELTkGH5RB3T3ktEJCVb5mhwQrfJFLsfJOosu
         GjJTM7WRRze8Z8VGcc244q65ZOcva43klzmDOHBKsALtVGKBx3FOjpoKrxAhJtqnC4zc
         jeWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n205si12575338ywb.42.2019.03.01.09.33.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 09:33:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzm2g-0004n1-J2
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 12:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzm2W-0004mr-Kt
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 12:33:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzm2U-0002kU-Ky
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 12:33:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzm2T-0002hY-5D; Fri, 01 Mar 2019 12:33:37 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52837301BE7F;
	Fri,  1 Mar 2019 17:33:34 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEB855D9C5;
	Fri,  1 Mar 2019 17:33:29 +0000 (UTC)
Date: Fri, 1 Mar 2019 18:33:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Message-ID: <20190301183328.20b63e23@redhat.com>
In-Reply-To: <20190301154947.GJ21251@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 01 Mar 2019 17:33:34 +0000 (UTC)
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
	qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gsmcO6dZaqUu

On Fri, 1 Mar 2019 15:49:47 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:
> > The parameter allows to configure fake NUMA topology where guest
> > VM simulates NUMA topology but not actually getting a performance
> > benefits from it. The same or better results could be achieved
> > using 'memdev' parameter. In light of that any VM that uses NUMA
> > to get its benefits should use 'memdev' and to allow transition
> > initial RAM to device based model, deprecate 'mem' parameter as
> > its ad-hoc partitioning of initial RAM MemoryRegion can't be
> > translated to memdev based backend transparently to users and in
> > compatible manner (migration wise).
> >=20
> > That will also allow to clean up a bit our numa code, leaving only
> > 'memdev' impl. in place and several boards that use node_mem
> > to generate FDT/ACPI description from it. =20
>=20
> Can you confirm that the  'mem' and 'memdev' parameters to -numa
> are 100% live migration compatible in both directions ?  Libvirt
> would need this to be the case in order to use the 'memdev' syntax
> instead.
Unfortunately they are not migration compatible in any direction,
if it where possible to translate them to each other I'd alias 'mem'
to 'memdev' without deprecation. The former sends over only one
MemoryRegion to target, while the later sends over several (one per
memdev).

Mixed memory issue[1] first came from libvirt side RHBZ1624223,
back then it was resolved on libvirt side in favor of migration
compatibility vs correctness (i.e. bind policy doesn't work as expected).
What worse that it was made default and affects all new machines,
as I understood it.

In case of -mem-path + -mem-prealloc (with 1 numa node or numa less)
it's possible on QEMU side to make conversion to memdev in migration
compatible way (that's what stopped Michal from memdev approach).
But it's hard to do so in multi-nodes case as amount of MemoryRegions
is different.

Point is to consider 'mem' as mis-configuration error, as the user
in the first place using broken numa configuration
(i.e. fake numa configuration doesn't actually improve performance).

CCed David, maybe he could offer a way to do 1:n migration and other
way around.


> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  numa.c               |  2 ++
> >  qemu-deprecated.texi | 14 ++++++++++++++
> >  2 files changed, 16 insertions(+)
> >=20
> > diff --git a/numa.c b/numa.c
> > index 3875e1e..2205773 100644
> > --- a/numa.c
> > +++ b/numa.c
> > @@ -121,6 +121,8 @@ static void parse_numa_node(MachineState *ms, NumaN=
odeOptions *node,
> > =20
> >      if (node->has_mem) {
> >          numa_info[nodenr].node_mem =3D node->mem;
> > +        warn_report("Parameter -numa node,mem is deprecated,"
> > +                    " use -numa node,memdev instead");
> >      }
> >      if (node->has_memdev) {
> >          Object *o;
> > diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> > index 45c5795..73f99d4 100644
> > --- a/qemu-deprecated.texi
> > +++ b/qemu-deprecated.texi
> > @@ -60,6 +60,20 @@ Support for invalid topologies will be removed, the =
user must ensure
> >  topologies described with -smp include all possible cpus, i.e.
> >    @math{@var{sockets} * @var{cores} * @var{threads} =3D @var{maxcpus}}.
> > =20
> > +@subsection -numa node,mem=3D@var{size} (since 4.0)
> > +
> > +The parameter @option{mem} of @option{-numa node} is used to assign a =
part of
> > +guest RAM to a NUMA node. But when using it, it's impossible to manage=
 specified
> > +size on the host side (like bind it to a host node, setting bind polic=
y, ...),
> > +so guest end-ups with the fake NUMA configuration with suboptiomal per=
formance.
> > +However since 2014 there is an alternative way to assign RAM to a NUMA=
 node
> > +using parameter @option{memdev}, which does the same as @option{mem} a=
nd has
> > +an ability to actualy manage node RAM on the host side. Use parameter
> > +@option{memdev} with @var{memory-backend-ram} backend as an replacemen=
t for
> > +parameter @option{mem} to achieve the same fake NUMA effect or a prope=
rly
> > +configured @var{memory-backend-file} backend to actually benefit from =
NUMA
> > +configuration.
> > +
> >  @section QEMU Machine Protocol (QMP) commands
> > =20
> >  @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
> > --=20
> > 2.7.4
> >=20
> > --
> > libvir-list mailing list
> > libvir-list@redhat.com
> > https://www.redhat.com/mailman/listinfo/libvir-list =20
>=20
> Regards,
> Daniel

