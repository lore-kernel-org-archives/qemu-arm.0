Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6310120lfp;
        Tue, 18 Feb 2020 08:41:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqz22lH9XKtcgdPjS9pDEuDqmG/Ry8yvghfl8A6MAabUhjouv+SDqb7Znzsw/TG+L5RGoROZ
X-Received: by 2002:ac8:1ae5:: with SMTP id h34mr18076172qtk.323.1582044102323;
        Tue, 18 Feb 2020 08:41:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582044102; cv=none;
        d=google.com; s=arc-20160816;
        b=tc5GZ9FCBiPTa8B6KQzMEz76W8aqBAN+WN2JJ6RqTExhe1gL5TqZyoebGiymoNraCs
         Qnp4XTWI+jHy62nTURb6stDenFb4UIlnUp+MZcFOmdtV0pnYrY0BCu6eCiFUHQf37oQv
         fxAcdQVm41qUNWUGKdIYDuAkFRgzaK6c8zJGOgiFlgRbiiC1XDpBzu6ouWv+v+kC9owi
         6Qc/b02Gq30m/Ayeok+CTF+viha1zyE+5ybMXLmF6PSf/67FaHAIhWs0xvzRmxGVdoiv
         DGxHGvXFx5NAzG2FEl5Q88vPJA3sro/vUceu2wTXhR8FPGPWgOXomrmOl3oPhGwiodIr
         aXsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=S1MPo1vlUNeZKYdRkcefcAbXIT63k7sy+8PGGMjGCWo=;
        b=CsMRPpXUMZiAxdydTk4dUjONQQFim2yke9w240NG8k2jYXpZqL9av6fb0ikTbiQ0vF
         O1nBQPGfkG3memjygWiUHyPw8rdEcs+pcCYU1MDFrxyuyq1GV566Yh4Yowyr8TX/clyk
         l4K5iE3YBNRbpyYLuAKJLqrT79pwd50WvgvUdwZKloHoYg+MhnzugMiz1KAW1Mbpov3G
         Ljy2MNbj2QGZP8Gy28z1vh3WRSoaYOIKux6BKrdQw222MmOz+siEFlwjazU/HxkMBcex
         FCaISPHewn/dqEgM4lB9kRTjXazSJeHAWveLOnMdVTszlWMfcDYebeZJbfec5SjYCews
         3ljg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C6MWBOPS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si1972894qtm.60.2020.02.18.08.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 08:41:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C6MWBOPS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j45wL-0001ic-NH
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 11:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47055)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j45wD-0001iH-Ub
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:41:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j45wB-0004LL-Rn
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:41:33 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20185
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j45wB-0004Kg-Mb
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582044090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S1MPo1vlUNeZKYdRkcefcAbXIT63k7sy+8PGGMjGCWo=;
 b=C6MWBOPSMvaEcDt8mQnT5ARk1liiBxFhERXMu1JYo8JRjtDhcfXYXXy5FWXCvO8TiCKtfk
 c8PgS5FQOi9g4r791UxCAYuM1RfVpjxn6OoEWtE48w4Vj9q2QJBBw+eucH/mU2ebtPhvhc
 rF6qbi/XN7RsBYYRLxpcboyqQfOkNNM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-uf6qgfINM6uHj9010X31gw-1; Tue, 18 Feb 2020 11:41:25 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C647CDB61;
 Tue, 18 Feb 2020 16:41:23 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20E7D5C13C;
 Tue, 18 Feb 2020 16:41:19 +0000 (UTC)
Date: Tue, 18 Feb 2020 17:41:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v5 17/79] arm/integratorcp: use memdev for RAM
Message-ID: <20200218174117.1dab2b41@redhat.com>
In-Reply-To: <5e21adc1-a197-9d37-133c-ea510b9b9926@redhat.com>
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-18-imammedo@redhat.com>
 <5e21adc1-a197-9d37-133c-ea510b9b9926@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: uf6qgfINM6uHj9010X31gw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WumhZi30AYAk

On Tue, 18 Feb 2020 07:55:14 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 2/17/20 6:33 PM, Igor Mammedov wrote:
> > memory_region_allocate_system_memory() API is going away, so
> > replace it with memdev allocated MemoryRegion. The later is
> > initialized by generic code, so board only needs to opt in
> > to memdev scheme by providing
> >    MachineClass::default_ram_id
> > and using MachineState::ram instead of manually initializing
> > RAM memory region.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > ---
> > CC: peter.chubb@nicta.com.au
> > ---
> >   hw/arm/integratorcp.c | 9 ++++-----
> >   1 file changed, 4 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
> > index 0cd94d9f09..cc845b8534 100644
> > --- a/hw/arm/integratorcp.c
> > +++ b/hw/arm/integratorcp.c
> > @@ -585,7 +585,6 @@ static void integratorcp_init(MachineState *machine=
)
> >       Object *cpuobj;
> >       ARMCPU *cpu;
> >       MemoryRegion *address_space_mem =3D get_system_memory();
> > -    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
> >       MemoryRegion *ram_alias =3D g_new(MemoryRegion, 1);
> >       qemu_irq pic[32];
> >       DeviceState *dev, *sic, *icp;
> > @@ -605,14 +604,13 @@ static void integratorcp_init(MachineState *machi=
ne)
> >  =20
> >       cpu =3D ARM_CPU(cpuobj);
> >  =20
> > -    memory_region_allocate_system_memory(ram, NULL, "integrator.ram",
> > -                                         ram_size);
> >       /* ??? On a real system the first 1Mb is mapped as SSRAM or boot =
flash.  */
> >       /* ??? RAM should repeat to fill physical memory space.  */
> >       /* SDRAM at address zero*/
> > -    memory_region_add_subregion(address_space_mem, 0, ram);
> > +    memory_region_add_subregion(address_space_mem, 0, machine->ram);
> >       /* And again at address 0x80000000 */
> > -    memory_region_init_alias(ram_alias, NULL, "ram.alias", ram, 0, ram=
_size);
> > +    memory_region_init_alias(ram_alias, NULL, "ram.alias", machine->ra=
m,
> > +                             0, ram_size);
> >       memory_region_add_subregion(address_space_mem, 0x80000000, ram_al=
ias);
> >  =20
> >       dev =3D qdev_create(NULL, TYPE_INTEGRATOR_CM);
> > @@ -660,6 +658,7 @@ static void integratorcp_machine_init(MachineClass =
*mc)
> >       mc->init =3D integratorcp_init;
> >       mc->ignore_memory_transaction_failures =3D true;
> >       mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("arm926");
> > +    mc->default_ram_id =3D "integrator.ram";
> >   }
> >  =20
> >   DEFINE_MACHINE("integratorcp", integratorcp_machine_init)
> >  =20
>=20
> Looking at integratorcm_realize() this machine seems to handle at most=20
> 512MiB.

According to=20
http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.dui0159b/Cege=
adbj.html

it supports "optionally, 16 to 256MB of SDRAM plugged into the DIMM socket"
so I'm not sure that realize is valid reference here.
(well I don't know anything about arm boards, but it probably should be
double checked by maintainer).

PS:
It should not hold this series (as check wasn't there to begin with),
I'll post a patch on top to add check once we decide to what limit it
should be set.

