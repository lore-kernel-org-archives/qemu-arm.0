Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp737731lff;
        Wed, 11 Dec 2019 06:57:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXtUaP45qaA5rzoxHNxD7Z2CPTmz1g5Ll7REwYZ7/TGQ853WJZO9U4/joSWLEVDxcIDiBH
X-Received: by 2002:a37:ae07:: with SMTP id x7mr322647qke.28.1576076233583;
        Wed, 11 Dec 2019 06:57:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576076233; cv=none;
        d=google.com; s=arc-20160816;
        b=pfjJfuB4lW6mE/wrLPe2L2ev85qAJcEuVxjmRBaDLZexqnl45Af4ZVlRyv0JF0MvRb
         GUQt8aGaZNAGB5XcytYw1yMgFzrFQtLVkB5ZblDGDMxS+wEFazklD753vrFCQI4A/07q
         9OkLTh9Ao06+NQiLxT1IsEE30X2CbMUKaujtkKAhcVZLNeBhMrI+3OHmt4MVOBZ8nOG+
         fv/2I2Ouo/n+QzRmA4sRulDqjsvgjLwbCi3F3aqDZrcKiNAolPQdvWowyO+ER3mt5+YN
         zVg3l2bJlHl/CcI2vzljt2yZNh0h7NurSQasIIOlGb9NwbVtrAgsv4GgMLVAIzylOtci
         eW7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=n4NPTSJrzliS+z69UC5eIwaL436Qm80hW2C6VDi4P7k=;
        b=FUPslH+EyJ0SdHUp5RppGtuROVS5NIGgs3l6kLijn4QsLWcdYCmdz+2cYstaDFbQJ/
         brvGpqFG813s/II0wFZPkx3HVAW3RJkWF+qClY6zIMWAB4feEcKjFZQvOZ0/FvoziRC9
         hKGpIcwe3XlU/aY6whdYgVTyUE7LgKZj9q69vjZwcfeGbirJuut9MeaD2qYpxx51YBoP
         sD8mZcpYauX8atRkLOmMinhxkeWFbMG1n5dtK83T1GFBcDDaQpwr2RTWJ8P5eCnt0rwP
         bbOak0ucVNc/LIIYbHIR8QIhbjNY7RY3CFyALFQ/r8Ld+OQvtCzo5o1Mb+l2XD7ZMaEW
         6Bvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si1145084qki.303.2019.12.11.06.57.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2019 06:57:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1if3QP-0004K3-09
	for alex.bennee@linaro.org; Wed, 11 Dec 2019 09:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40841)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prime.zeng@hisilicon.com>) id 1if3QG-0004Jg-2H
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 09:57:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prime.zeng@hisilicon.com>) id 1if3QE-0008SP-CO
 for qemu-arm@nongnu.org; Wed, 11 Dec 2019 09:57:03 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2425 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prime.zeng@hisilicon.com>)
 id 1if3QD-0008H3-Vj; Wed, 11 Dec 2019 09:57:02 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 43DB7CF27CCA2C6CCBDD;
 Wed, 11 Dec 2019 19:10:54 +0800 (CST)
Received: from DGGEMM421-HUB.china.huawei.com (10.1.198.38) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 11 Dec 2019 19:10:53 +0800
Received: from DGGEMM526-MBX.china.huawei.com ([169.254.8.101]) by
 dggemm421-hub.china.huawei.com ([10.1.198.38]) with mapi id 14.03.0439.000;
 Wed, 11 Dec 2019 19:10:45 +0800
From: "Zengtao (B)" <prime.zeng@hisilicon.com>
To: Andrew Jones <drjones@redhat.com>
Subject: RE: [Qemu-devel] [RFC PATCH 0/6] hw/arm/virt: Introduce cpu
 topology support
Thread-Topic: [Qemu-devel] [RFC PATCH 0/6] hw/arm/virt: Introduce cpu
 topology support
Thread-Index: AdQTlaRpUFkm+EncK0mrDnlTRz6dtGan2sPQADKVqIAARGvRgA==
Date: Wed, 11 Dec 2019 11:10:45 +0000
Message-ID: <678F3D1BB717D949B966B68EAEB446ED34066A4F@dggemm526-mbx.china.huawei.com>
References: <20180704124923.32483-1-drjones@redhat.com>
 <678F3D1BB717D949B966B68EAEB446ED3405A26F@dggemm526-mbx.china.huawei.com>
 <20191210101323.q7dn2f3pkx3ya5s4@kamzik.brq.redhat.com>
In-Reply-To: <20191210101323.q7dn2f3pkx3ya5s4@kamzik.brq.redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.74.221.187]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.187
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 huangdaode <huangdaode@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e7u7KWuy2CqO

Hi Andrew:

Thanks for your reply.
It 's fine for me if you are still tracking the thread. And I can help to t=
est
 if needed ^_^.

> -----Original Message-----
> From: Andrew Jones [mailto:drjones@redhat.com]
> Sent: Tuesday, December 10, 2019 6:13 PM
> To: Zengtao (B)
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; wei@redhat.com;
> peter.maydell@linaro.org; eric.auger@redhat.com;
> imammedo@redhat.com; xuwei (O); huangdaode
> Subject: Re: [Qemu-devel] [RFC PATCH 0/6] hw/arm/virt: Introduce cpu
> topology support
>=20
> On Mon, Dec 09, 2019 at 02:14:09AM +0000, Zengtao (B) wrote:
> > Hi Andrew:
> >
> > Any update for this patch series? I have met the same issue, and if the
> > topology guessed by linux MPIDR conflicts with qemu specified numa, it
> > will failed to boot (sched domain initialization will fall into deadloo=
p).
>=20
> Hi Zeng,
>=20
> This has been on my TODO list a long time, but it keeps getting preempted=
.
> We need to start by giving userspace control over the MPIDRs, including
> when KVM is in use. The earliest I can return to this will be mid/late
> January. If you'd like to jump in on it now, then feel free.
>=20
> Thanks,
> drew
>=20
> >
> > Thanks.
> >
> > > -----Original Message-----
> > > From: Qemu-devel
> > >
> [mailto:qemu-devel-bounces+incoming=3Dpatchwork.ozlabs.org@nongnu.or
> > > g] On Behalf Of Andrew Jones
> > > Sent: Thursday, July 05, 2018 4:49 AM
> > > To: qemu-devel@nongnu.org; qemu-arm@nongnu.org
> > > Cc: wei@redhat.com; peter.maydell@linaro.org;
> eric.auger@redhat.com;
> > > imammedo@redhat.com
> > > Subject: [Qemu-devel] [RFC PATCH 0/6] hw/arm/virt: Introduce cpu
> > > topology support
> > >
> > > This series provides support for booting mach-virt machines with
> > > non-flat cpu topology, i.e. enabling the extended options of the
> > > '-smp' command line parameter (sockets,cores,threads). Both DT and
> > > ACPI description generators are added. We only apply the new feature
> > > to 3.1 and later machine types, as the change is guest visible, even
> > > when no command line change is made. This is because the basic
> > > '-smp <N>' parameter makes the assumption that <N> refers to the
> > > number of sockets, but when no topology description is provided,
> > > Linux will use the MPIDR to guess. Neither the MPIDR exposed to
> > > the guest when running with KVM nor TCG currently provides socket
> > > information, leaving Linux to assume all processing elements are
> > > cores in the same socket. For example, before this series '-smp 4'
> > > would show up in the guest as
> > >
> > >  CPU(s):                4
> > >  On-line CPU(s) list:   0-3
> > >  Thread(s) per core:    1
> > >  Core(s) per socket:    4
> > >  Socket(s):             1
> > >
> > > and after it shows up as
> > >
> > >  CPU(s):                4
> > >  On-line CPU(s) list:   0-3
> > >  Thread(s) per core:    1
> > >  Core(s) per socket:    1
> > >  Socket(s):             4
> > >
> > > It's not expected that this should be a problem, but it's worth
> > > considering. The only way to avoid the silent change is for QEMU to
> > > provide boards a way to override the default '-smp' parsing function.
> > > Otherwise, if a user wants to avoid a guest visible change, but still
> > > use a 3.1 or later mach-virt machine type, then they must ensure the
> > > command line specifies a single socket, e.g. '-smp sockets=3D1,cores=
=3D4'
> > >
> > > Thanks,
> > > drew
> > >
> > >
> > > Andrew Jones (6):
> > >   hw/arm/virt: Add virt-3.1 machine type
> > >   device_tree: add qemu_fdt_add_path
> > >   hw/arm/virt: DT: add cpu-map
> > >   hw/arm/virt-acpi-build: distinguish possible and present cpus
> > >   virt-acpi-build: add PPTT table
> > >   hw/arm/virt: cpu topology: don't allow threads
> > >
> > >  device_tree.c                | 24 +++++++++++++
> > >  hw/acpi/aml-build.c          | 50 ++++++++++++++++++++++++++
> > >  hw/arm/virt-acpi-build.c     | 25 ++++++++++---
> > >  hw/arm/virt.c                | 69
> > > +++++++++++++++++++++++++++++++++---
> > >  include/hw/acpi/aml-build.h  |  2 ++
> > >  include/hw/arm/virt.h        |  1 +
> > >  include/sysemu/device_tree.h |  1 +
> > >  7 files changed, 162 insertions(+), 10 deletions(-)

