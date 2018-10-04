Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1295994wrt;
        Thu, 4 Oct 2018 12:52:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62trqQ6bnzxv/oVI7LmjFGX/CGvtOxwi8LM8fSDdFIuIs5CT7pUsxskzrvdCkWdNKyGg1S2
X-Received: by 2002:ac8:130c:: with SMTP id e12-v6mr6943951qtj.22.1538682773441;
        Thu, 04 Oct 2018 12:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538682773; cv=none;
        d=google.com; s=arc-20160816;
        b=hEyZa/ESuyu0i9wZy4lSr3PiJqR0tQcM7mQjDZX2dQo7KdGIiON5Dn1S7lUjHx3x+U
         EOixon8ZAGa9umZOtVfbt4GmNAZe8xZ+hSw4zIizlRhcsQy7jaQgrOJT6Hb5btrKhT/F
         BpBfaWkMa6b5K7ihOC4XzTma+NrpekVTr5IOfGAOxLuNCNfbWWFOa0WB+dRJqAME0XF/
         nk3Pc7rmw4JkTgYFUcQ9aByGlkHcmd/fBrhPkXouAOEv88x+AbHKsYx63PPRoKUJh+/X
         26Cayuzp4OXUnfGsAkmNx7PTp5gHK7Ni/sIWOC2vtc6rpDbWLsJIhzykUfksdG5VOKEe
         BlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=Jl4xHWSsWjcAk16D2/vu3s8ET0ZpcCEb5r2Ny8YpiMI=;
        b=I3VxWAm5ykaTqgItjeDcXhQO+TnQARAmBSGR6Kl2AkjUHmECIWlwTQtxpLZxlB5SCe
         BfKDF1TwKJ3mEE5F2gQ0IMbewP1Wrcuk/Jx0Tu9Ds8sBORX+G8U2v4e5mplMiVvu86rj
         7QcIbjIDUbjvIrvhxv6RP/NEWqX6xUIKLAgNt903Fzbp3+lcKV9GocprqJKFC7svd6vX
         PlyZWQCa+J5CvHZKTDFLyQL8Dvqg9I1LM0IcliddvYpbfME+GWq6nXSR3IHvCDB2qAcI
         ernQjcfArSd4iYnuBElEOylcWwmq2jKR28JMcRl/C/2vFaF+QD5jUOrmyoPEbLL1loxn
         w2ow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p57-v6si4003504qte.210.2018.10.04.12.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 12:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g89g5-0004qc-0H
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 15:52:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1g89fv-0004qF-VJ
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 15:52:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1g89fq-0006pp-L4
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 15:52:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52382)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1g89fq-0006fG-BD; Thu, 04 Oct 2018 15:52:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57A0620264;
	Thu,  4 Oct 2018 19:52:30 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E36F967C7E;
	Thu,  4 Oct 2018 19:52:26 +0000 (UTC)
Date: Thu, 4 Oct 2018 16:52:25 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20181004195225.GV5738@habkost.net>
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-16-luc.michel@greensocs.com>
	<35ffbd68-f783-b6f4-18a2-dd995819c046@redhat.com>
	<CAFEAcA9vHi=qrV-Aj5ptgBQntafLGwL6VezxnmOuuR=6=Pr8cA@mail.gmail.com>
	<33c3ea72-652a-53b2-4865-830f3d7f2c3a@greensocs.com>
	<3d459f14-b701-02b6-d231-fc48c509640f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <3d459f14-b701-02b6-d231-fc48c509640f@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 04 Oct 2018 19:52:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 15/15] arm/xlnx-zynqmp: put
 APUs and RPUs in separate GDB groups
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rm01Z/ruw33R

On Thu, Oct 04, 2018 at 06:07:45PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 03/10/2018 13:44, Luc Michel wrote:
> > On 10/2/18 1:58 PM, Peter Maydell wrote:
> >> On 2 October 2018 at 12:33, Philippe Mathieu-Daud=E9 <philmd@redhat.=
com> wrote:
> >>> Cc'ing more QOM involved people.
> >>>
> >>> On 01/10/2018 13:57, Luc Michel wrote:
> >>>> Create two separate QOM containers for APUs and RPUs to indicate t=
o the
> >>>> GDB stub that those CPUs should be put in different processes.
> >>>>
> >>>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> >>>> ---
> >>>>  hw/arm/xlnx-zynqmp.c | 7 +++++--
> >>>>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> >>>> index c195040350..5e92adbc71 100644
> >>>> --- a/hw/arm/xlnx-zynqmp.c
> >>>> +++ b/hw/arm/xlnx-zynqmp.c
> >>>> @@ -22,10 +22,11 @@
> >>>>  #include "hw/arm/xlnx-zynqmp.h"
> >>>>  #include "hw/intc/arm_gic_common.h"
> >>>>  #include "exec/address-spaces.h"
> >>>>  #include "sysemu/kvm.h"
> >>>>  #include "kvm_arm.h"
> >>>> +#include "exec/gdbstub.h"
> >>>>
> >>>>  #define GIC_NUM_SPI_INTR 160
> >>>>
> >>>>  #define ARM_PHYS_TIMER_PPI  30
> >>>>  #define ARM_VIRT_TIMER_PPI  27
> >>>> @@ -175,17 +176,18 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqM=
PState *s, const char *boot_cpu,
> >>>>                                     Error **errp)
> >>>>  {
> >>>>      Error *err =3D NULL;
> >>>>      int i;
> >>>>      int num_rpus =3D MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLN=
X_ZYNQMP_NUM_RPU_CPUS);
> >>>> +    Object *rpu_group =3D gdb_cpu_group_container_get(OBJECT(s));
> >>>
> >>> I'd rather keep this generic: not involve 'gdb' container name.
> >>
> >> Yes, I agree. We should structure how we construct our
> >> model to follow what the hardware has (two CPU clusters
> >> with 4 cores each), and then the gdb code should introspect
> >> the system later to decide how it exposes things to the gdb
> >> user. GDB specifics should (as far as possible) be kept out
> >> of the board code.

Agreed.

> >>
> >> The fact that there are two clusters here also
> >> affects other things, like whether they have the
> >> same view of memory, whether they can share translated
> >> code (they shouldn't but do at the moment), and so on --
> >> it's not just a GDB-relevant distinction. So we should
> >> be modelling it somehow, definitely. I don't have a clear
> >> view how just yet.
> >=20
> > So for now, maybe it's better to rely on an heuristic such as the one
> > suggested by Philippe in the gdb code to group the CPUs. Once QEMU ga=
ins
> > more supports for such heterogeneous architectures, we can remove the
> > heuristic and put the proper QOM introspection code instead.
>=20
> I'm not sure this is the best approach, just suggested because using
> object_resolve_path_type("", TYPE_CPU, NULL) seemed to me the
> quicker/easiest approach.
>=20
> Eduardo: Do you have other thoughts on how to resolve those generic
> containers, without involving any gdb-specific tag?

Changing the object hierarchy based on GDB groups doesn't seem
right, but I don't think it would be a big deal if we have the
board code explicitly telling the GDB code how to group the CPUs.

If you really want to do it implicitly, would it work if you
simply group the CPUs based on object_get_canonical_path()?

If a more explicit GDB grouping API is acceptable, what about
just adding a INTERFACE_GDB_GROUP interface name to (existing)
container objects that we expect to become GDB groups?

I'm not sure which way is better. I'm a bit worried that making
things too implicit could easily break (e.g. if somebody changes
the CPU QOM hierarchy in the future for unrelated reasons).


>=20
> >> This probably ties into the stuff I have somewhere on
> >> my todo list about supporting multiple heterogenous
> >> systems. The problem with this xilinx board is that it
> >> is trying to model that kind of system but we don't actually
> >> properly support that in QEMU yet.
> >>
> >> thanks
> >> -- PMM
> >>

--=20
Eduardo
