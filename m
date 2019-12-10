Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5597238lff;
        Tue, 10 Dec 2019 02:13:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHMl4s3WJtSEOnToL+C91ACWduPfcovUlaiJEd8HxkZxBmgVfTLfrRNvsZN5nvWEr4SFxg
X-Received: by 2002:aca:d6d2:: with SMTP id n201mr3460365oig.112.1575972827126;
        Tue, 10 Dec 2019 02:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575972827; cv=none;
        d=google.com; s=arc-20160816;
        b=aTEWKjzeI8gt6KA+JgQyZLabwbWeLoeC0vXI7EXhTwL2CSMIm4dtqxRC1enQSzaloj
         HoEOkyFMAy7L18a6Dq2+xdmj5pYZZgDwvmepsxkm7LrSTNKfvmG35BYWN6fDBqTXOKyX
         gJnKBg45j4onKfcb0Iayfn0FxifzMh5LNUV9FJZcS9zVwViC5AXdSS+qqlvZAsqWAx0n
         UXiwcOcR0u1ywbCY/mWM8IigVVQhE27SBjvhZ7tQhTmNEstqg1VA/2PQ98q+s19uIepZ
         YQAS8q6vuvxVka1lcEkSP61zhZ1oQ4wPmiEYA6RnHW6Byhd+rgiPdb14B034MIxv4hr/
         4IUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=3wCO3GuM2moFcAks0xXtIp9Oxy/EmVQGKpZZV5ENJBE=;
        b=VsXaRXMDAyHJgPurZEmbYPneO0ag3AV7I3ggNm0ig1uVwhozzEKnz9SlmwfXbk8/GN
         4K6HZQpFcqalZPsVZG4upRAVMC3mp9dlT3iGMdmRLzM59rB6y5n3G5lYvm1lr5utJ6Pg
         E5i+ywMAEo/22+JL6fQjvt7EO7slVFHSPo7U/iHZPtoYosTcn6TAwy3/V/lPXoVIUeaC
         RCRyIVajCNz45ruv6JrqBA3AEw1Ny89oxoWCKzkCjGxyl0Csk/lucbYXbOXb+7IN2W7X
         G+zcgkTMrI1QEa1MPiNAetHnXh6QoSF30t4o1XZesBJBc5vUgSKRTzZ9GAPemgs4vnQ8
         vySQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YTwJLSAd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l131si1691809oib.174.2019.12.10.02.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 02:13:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YTwJLSAd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iecWY-0004ri-CY
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 05:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iecWR-0004rW-NW
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 05:13:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iecWQ-0007gD-JH
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 05:13:39 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46729
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iecWQ-0007ft-FH
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 05:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575972818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wCO3GuM2moFcAks0xXtIp9Oxy/EmVQGKpZZV5ENJBE=;
 b=YTwJLSAdcbADMtYbi5ZrlRnn2VvuDELoP7YoYUwkfF1LZ288LTOSIHNuEDZmyQpaNNBOpq
 CB4W1nEB3rwaARCwMMudJ8bpOPLzegikTyEk7SA1/MtsdYMbYarc2rQ7zD8hmaWm3enTea
 3aZg3UeXxQWS+fw5A1qW+lBm2liR2nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-Sv9F--SmMlq1LqAvEJt_rA-1; Tue, 10 Dec 2019 05:13:34 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62D31107ACC4;
 Tue, 10 Dec 2019 10:13:33 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5004760561;
 Tue, 10 Dec 2019 10:13:26 +0000 (UTC)
Date: Tue, 10 Dec 2019 11:13:23 +0100
From: Andrew Jones <drjones@redhat.com>
To: "Zengtao (B)" <prime.zeng@hisilicon.com>
Subject: Re: [Qemu-devel] [RFC PATCH 0/6] hw/arm/virt: Introduce cpu topology
 support
Message-ID: <20191210101323.q7dn2f3pkx3ya5s4@kamzik.brq.redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
 <678F3D1BB717D949B966B68EAEB446ED3405A26F@dggemm526-mbx.china.huawei.com>
MIME-Version: 1.0
In-Reply-To: <678F3D1BB717D949B966B68EAEB446ED3405A26F@dggemm526-mbx.china.huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Sv9F--SmMlq1LqAvEJt_rA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-TUID: Hd7NThglUUUj

On Mon, Dec 09, 2019 at 02:14:09AM +0000, Zengtao (B) wrote:
> Hi Andrew:
>=20
> Any update for this patch series? I have met the same issue, and if the=
=20
> topology guessed by linux MPIDR conflicts with qemu specified numa, it
> will failed to boot (sched domain initialization will fall into deadloop)=
.

Hi Zeng,

This has been on my TODO list a long time, but it keeps getting preempted.
We need to start by giving userspace control over the MPIDRs, including
when KVM is in use. The earliest I can return to this will be mid/late
January. If you'd like to jump in on it now, then feel free.

Thanks,
drew

>=20
> Thanks.
>=20
> > -----Original Message-----
> > From: Qemu-devel
> > [mailto:qemu-devel-bounces+incoming=3Dpatchwork.ozlabs.org@nongnu.or
> > g] On Behalf Of Andrew Jones
> > Sent: Thursday, July 05, 2018 4:49 AM
> > To: qemu-devel@nongnu.org; qemu-arm@nongnu.org
> > Cc: wei@redhat.com; peter.maydell@linaro.org; eric.auger@redhat.com;
> > imammedo@redhat.com
> > Subject: [Qemu-devel] [RFC PATCH 0/6] hw/arm/virt: Introduce cpu
> > topology support
> >=20
> > This series provides support for booting mach-virt machines with
> > non-flat cpu topology, i.e. enabling the extended options of the
> > '-smp' command line parameter (sockets,cores,threads). Both DT and
> > ACPI description generators are added. We only apply the new feature
> > to 3.1 and later machine types, as the change is guest visible, even
> > when no command line change is made. This is because the basic
> > '-smp <N>' parameter makes the assumption that <N> refers to the
> > number of sockets, but when no topology description is provided,
> > Linux will use the MPIDR to guess. Neither the MPIDR exposed to
> > the guest when running with KVM nor TCG currently provides socket
> > information, leaving Linux to assume all processing elements are
> > cores in the same socket. For example, before this series '-smp 4'
> > would show up in the guest as
> >=20
> >  CPU(s):                4
> >  On-line CPU(s) list:   0-3
> >  Thread(s) per core:    1
> >  Core(s) per socket:    4
> >  Socket(s):             1
> >=20
> > and after it shows up as
> >=20
> >  CPU(s):                4
> >  On-line CPU(s) list:   0-3
> >  Thread(s) per core:    1
> >  Core(s) per socket:    1
> >  Socket(s):             4
> >=20
> > It's not expected that this should be a problem, but it's worth
> > considering. The only way to avoid the silent change is for QEMU to
> > provide boards a way to override the default '-smp' parsing function.
> > Otherwise, if a user wants to avoid a guest visible change, but still
> > use a 3.1 or later mach-virt machine type, then they must ensure the
> > command line specifies a single socket, e.g. '-smp sockets=3D1,cores=3D=
4'
> >=20
> > Thanks,
> > drew
> >=20
> >=20
> > Andrew Jones (6):
> >   hw/arm/virt: Add virt-3.1 machine type
> >   device_tree: add qemu_fdt_add_path
> >   hw/arm/virt: DT: add cpu-map
> >   hw/arm/virt-acpi-build: distinguish possible and present cpus
> >   virt-acpi-build: add PPTT table
> >   hw/arm/virt: cpu topology: don't allow threads
> >=20
> >  device_tree.c                | 24 +++++++++++++
> >  hw/acpi/aml-build.c          | 50 ++++++++++++++++++++++++++
> >  hw/arm/virt-acpi-build.c     | 25 ++++++++++---
> >  hw/arm/virt.c                | 69
> > +++++++++++++++++++++++++++++++++---
> >  include/hw/acpi/aml-build.h  |  2 ++
> >  include/hw/arm/virt.h        |  1 +
> >  include/sysemu/device_tree.h |  1 +
> >  7 files changed, 162 insertions(+), 10 deletions(-)

