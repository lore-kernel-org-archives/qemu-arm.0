Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp770581lfp;
        Thu, 23 Jan 2020 07:10:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqxfORpBm45DwR2U7M9zXj12oHezZejct0VRrBT9VQdk5qb+3yg4OwYqAlIULmaZXIHNEHE6
X-Received: by 2002:a37:6d5:: with SMTP id 204mr15151285qkg.448.1579792226330;
        Thu, 23 Jan 2020 07:10:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579792226; cv=none;
        d=google.com; s=arc-20160816;
        b=fjA3Bt3bNwljBN5vugY+l5OziuVx0XMTKLEjbAnhKogm1q9JgFoFbIvYLPjYa3cOYZ
         EEflLChG9mARPYgeIgEr4AQL7bwWYr5Chm5MYqg4R28ndismcPR+gOINe+DdWji+DuSr
         acUEfDAeOXEF2YYrXMxmKWghz7JeoePGJJBW6H/lk8JseKiGn7v3Z8jRlruBIJ0BgQUf
         hH2BuyTWDv+2eQ3g1GdZ7j5wG5kvzGEJXmebU0C3cLN+yaE9ATVfUNpAbP5b+DeC2jom
         XAMo1iRAt6RENQhzj1uvYYKfMSPWW+N11M/K3ymkCJi+EfQY1ssGTTWxL2in2HceGFlC
         BFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=b+l3kQ8+aCZ03qp1W/gJ9AwYwFtBqPyA0eXu0waMUEM=;
        b=ddXbcme7l5ZhrJ9flvGfUd4VpKV8lh+Wzjky6AOgL8bp5hXDRyxUzGWZXU8vtO5YPq
         n3HWJfsjWH3Jy727eW6XdpHjEW4iL+lagCQymnOjnyllsZwcvWGy6ANMelaEIlGNTO3l
         HdJFGVjBHnufQMODg8lIx1yKrwOAGZcOBYnsZAvvQj2490ypCJMPFoMc7c1Mxv47m6gt
         WMXyAuNVt7uhd7Xn+rMeFr5UQMH24mPHa48pFN8FFh74ay+ii4aJCZvFgvzcvthwb5yY
         hP3PPDAJejzB3qTvz7Qo3/9PCOTXESro6+CZpG7nRJ+Ng+XivbuV1vKnzKzuhrVJWht8
         N6dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ov+QcNH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 197si1618619qke.117.2020.01.23.07.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 07:10:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ov+QcNH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iue7l-0004dv-0h
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 10:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuciC-0001fE-Pl
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuciB-0000U1-FQ
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:39:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38993
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuciB-0000Tg-Ct
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 08:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579786795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b+l3kQ8+aCZ03qp1W/gJ9AwYwFtBqPyA0eXu0waMUEM=;
 b=Ov+QcNH4Yc4q9LYWPzgG1GxgeU49pKn8O5uVXV6fQi3xAfl4l2gJ4CdGKFbr+j5KkJl1eZ
 IdFXQovZ7m0bAoWfPfRFpPtGLTrZm2l5x80Rm9ghuub++KF7WsiFjijcSuAeszn3WiN+Ne
 wZ/Ej5etqAWGYS11/lThgzNQldIxG4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-mUU0EsbOOnuQJHw3DHmPdg-1; Thu, 23 Jan 2020 08:39:51 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A1E0801E67;
 Thu, 23 Jan 2020 13:39:50 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44FB319C69;
 Thu, 23 Jan 2020 13:39:49 +0000 (UTC)
Date: Thu, 23 Jan 2020 14:39:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH REPOST v3 20/80] arm/mps2-tz: use memdev for RAM
Message-ID: <20200123143948.4ef7b702@redhat.com>
In-Reply-To: <20200123125909.p2aq3ad2x5l24zq5@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-21-git-send-email-imammedo@redhat.com>
 <20200123125909.p2aq3ad2x5l24zq5@kamzik.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: mUU0EsbOOnuQJHw3DHmPdg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: odSwoIS9MW+k

On Thu, 23 Jan 2020 13:59:09 +0100
Andrew Jones <drjones@redhat.com> wrote:

> On Thu, Jan 23, 2020 at 12:37:45PM +0100, Igor Mammedov wrote:
> > memory_region_allocate_system_memory() API is going away, so
> > replace it with memdev allocated MemoryRegion. The later is
> > initialized by generic code, so board only needs to opt in
> > to memdev scheme by providing
> >   MachineClass::default_ram_id
> > and using MachineState::ram instead of manually initializing
> > RAM memory region.
> >=20
> > PS:
> >  while at it add check for user supplied RAM size and error
> >  out if it mismatches board expected value.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v2:
> >   * fix format string causing build failure on 32-bit host
> >     (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>)
> >=20
> > CC: drjones@redhat.com
> > CC: peter.maydell@linaro.org
> > CC: qemu-arm@nongnu.org
> > ---
> >  hw/arm/mps2-tz.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> > index f8b620b..06dacf6 100644
> > --- a/hw/arm/mps2-tz.c
> > +++ b/hw/arm/mps2-tz.c
> > @@ -39,6 +39,7 @@
> > =20
> >  #include "qemu/osdep.h"
> >  #include "qemu/units.h"
> > +#include "qemu/cutils.h"
> >  #include "qapi/error.h"
> >  #include "qemu/error-report.h"
> >  #include "hw/arm/boot.h"
> > @@ -79,7 +80,6 @@ typedef struct {
> >      MachineState parent;
> > =20
> >      ARMSSE iotkit;
> > -    MemoryRegion psram;
> >      MemoryRegion ssram[3];
> >      MemoryRegion ssram1_m;
> >      MPS2SCC scc;
> > @@ -388,6 +388,13 @@ static void mps2tz_common_init(MachineState *machi=
ne)
> >          exit(1);
> >      }
> > =20
> > +    if (machine->ram_size !=3D mc->default_ram_size) {
> > +        char *sz =3D size_to_str(mc->default_ram_size);
> > +        error_report("Invalid RAM size, should be %s", sz);
> > +        g_free(sz);
> > +        exit(EXIT_FAILURE);
> > +    }
> > +
> >      sysbus_init_child_obj(OBJECT(machine), "iotkit", &mms->iotkit,
> >                            sizeof(mms->iotkit), mmc->armsse_type);
> >      iotkitdev =3D DEVICE(&mms->iotkit);
> > @@ -458,9 +465,7 @@ static void mps2tz_common_init(MachineState *machin=
e)
> >       * tradeoffs. For QEMU they're all just RAM, though. We arbitraril=
y
> >       * call the 16MB our "system memory", as it's the largest lump.
> >       */
> > -    memory_region_allocate_system_memory(&mms->psram,
> > -                                         NULL, "mps.ram", 16 * MiB);
> > -    memory_region_add_subregion(system_memory, 0x80000000, &mms->psram=
);
> > +    memory_region_add_subregion(system_memory, 0x80000000, machine->ra=
m);
> > =20
> >      /* The overflow IRQs for all UARTs are ORed together.
> >       * Tx, Rx and "combined" IRQs are sent to the NVIC separately.
> > @@ -642,6 +647,7 @@ static void mps2tz_class_init(ObjectClass *oc, void=
 *data)
> > =20
> >      mc->init =3D mps2tz_common_init;
> >      iic->check =3D mps2_tz_idau_check;
> > +    mc->default_ram_id =3D "mps.ram";
> >  }
> > =20
> >  static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
> > @@ -657,6 +663,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc=
, void *data)
> >      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-m33");
> >      mmc->scc_id =3D 0x41045050;
> >      mmc->armsse_type =3D TYPE_IOTKIT;
> > +    mc->default_ram_size =3D 16 * MiB; =20
>=20
> Shouldn't this line be added to mps2tz_class_init ?

Yep, it should be there

>=20
> Thanks,
> drew
>=20
> >  }
> > =20
> >  static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
> > --=20
> > 2.7.4
> >  =20

