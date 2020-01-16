Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8622040lff;
        Thu, 16 Jan 2020 08:55:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqyUsD8TeY8UD5zlP4pHTp09lTytvLSW/7EQ84yuBTyC9qezUFdDI/dPKyWi9hPWJVs9NPEK
X-Received: by 2002:a05:620a:817:: with SMTP id s23mr29349158qks.391.1579193746282;
        Thu, 16 Jan 2020 08:55:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579193746; cv=none;
        d=google.com; s=arc-20160816;
        b=zBVf3UWluaLcpdpab1/JfOLgqYF0XmiWi/a9J6WEP2uC4fFQvV0d6a35sLkvN+hIk7
         M28cGzDuygznDuII2asCvSC4kMxccrA3Vs4IaQxt8zmGPsFKMpkLVORvJZ0DampKLGgc
         PfdLKNG3S5DX3s94Oyzz7Ehg1cQVZssUrFB4L8xy7LspFT+rgdklwTPf6Z/cdcJxPM7G
         x0jxDaD8YqhRPKIJcJ2xXPlA0z0vWkoLwEQPBUYJTs5YeomOBQ9SMAiS8cmdjsqPzhif
         NeHvG1SKCtTNnbMPcomW1ZMVIGpTurP8H0whMuEs5wp2jEZWAKJi6FeMD/+7WxGL6zur
         ZQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=GJUJP4D9OUkRmRaE2G6XT5F1H0hWgvIWOR/wjlvLFbA=;
        b=LSBi9A8Zry+VosQWDt1ZPuzX77iY2g0x2WIEVY1FfJCVNoQ1blBWomV5UWWLB66e6Q
         cZ+o4pXUAeMRvwdBibIdEzTtsU3VzF5K3QAjG1lP6OvZqLOAyQh36Zfv9BQ8uMuwwHYl
         RB2JukrtZyJ0CvACqRbK3iwprrrE8C+trvcGtWNZ5QzqA79IyLrvApjuNVuVYs4aHjeo
         CShxVJSi3WdOGbk0+AmsHvg1NexVGcXn45eEqSCNy/Z7VyqswrMKVqh95XgzVIM3Vc9b
         huIglI+132A5DaOl3oqXgBdzOhP1XjS+w0POmAuQ2+ywfB0Pnkv1RIki6SQOtejXjpWi
         SnOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GvHYJY63;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si12046554qtg.196.2020.01.16.08.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 08:55:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GvHYJY63;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is8Qr-0003ob-Gx
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 11:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52217)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1is8QY-0003fZ-EN
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 11:55:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1is8QT-000187-9T
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 11:55:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35063
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1is8QT-00017M-4M
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 11:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579193719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJUJP4D9OUkRmRaE2G6XT5F1H0hWgvIWOR/wjlvLFbA=;
 b=GvHYJY63Oy4X2qeJF19lYTh2aNPVyn8bajQ2J0Z/ksTUaDAPTUGykYehKtAldxB4HTgFJC
 9QQWXw0qeGaOthbRwvHEDjpdSdsf1yz/yHNNdAn1JSEdzWhjKcdhqQtSUw5hu5gmOiNn68
 nq+JFZHrwe8mod9kg5ILZS0tx25IjPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-lIMh2B8KPISYIZDvp8i42w-1; Thu, 16 Jan 2020 11:55:18 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 594DC100550E;
 Thu, 16 Jan 2020 16:55:17 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 354925C548;
 Thu, 16 Jan 2020 16:55:11 +0000 (UTC)
Date: Thu, 16 Jan 2020 17:55:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 28/86] arm:raspi: use memdev for RAM
Message-ID: <20200116175509.36bafe7e@redhat.com>
In-Reply-To: <b2162130-041f-e709-a33d-56c0beb880b9@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-29-git-send-email-imammedo@redhat.com>
 <b2162130-041f-e709-a33d-56c0beb880b9@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: lIMh2B8KPISYIZDvp8i42w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Andrew.Baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4aXmAByc9Zga

On Wed, 15 Jan 2020 20:07:34 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 1/15/20 4:06 PM, Igor Mammedov wrote:
> > memory_region_allocate_system_memory() API is going away, so
> > replace it with memdev allocated MemoryRegion. The later is
> > initialized by generic code, so board only needs to opt in
> > to memdev scheme by providing
> >    MachineClass::default_ram_id
> > and using MachineState::ram instead of manually initializing
> > RAM memory region.
> >=20
> > PS:
> >   remove no longer needed RasPiState
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > CC: Andrew.Baumann@microsoft.com
> > CC: philmd@redhat.com
> > CC: peter.maydell@linaro.org
> > CC: qemu-arm@nongnu.org
> > ---
> >   hw/arm/raspi.c | 34 +++++++++++++---------------------
> >   1 file changed, 13 insertions(+), 21 deletions(-)
> >=20
> > diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> > index 6a510aa..33ace66 100644
> > --- a/hw/arm/raspi.c
> > +++ b/hw/arm/raspi.c
> > @@ -32,11 +32,6 @@
> >   /* Table of Linux board IDs for different Pi versions */
> >   static const int raspi_boardid[] =3D {[1] =3D 0xc42, [2] =3D 0xc43, [=
3] =3D 0xc44};
> >  =20
> > -typedef struct RasPiState {
> > -    BCM283XState soc;
> > -    MemoryRegion ram;
> > -} RasPiState;
> > -
> >   static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *in=
fo)
> >   {
> >       static const uint32_t smpboot[] =3D {
> > @@ -166,7 +161,7 @@ static void setup_boot(MachineState *machine, int v=
ersion, size_t ram_size)
> >  =20
> >   static void raspi_init(MachineState *machine, int version)
> >   {
> > -    RasPiState *s =3D g_new0(RasPiState, 1);
> > +    Object *soc;
> >       uint32_t vcram_size;
> >       DriveInfo *di;
> >       BlockBackend *blk;
> > @@ -179,30 +174,26 @@ static void raspi_init(MachineState *machine, int=
 version)
> >           exit(1);
> >       }
> >  =20
> > -    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s-=
>soc),
> > -                            version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM=
2836,
> > -                            &error_abort, NULL);
> > +    soc =3D object_new(version =3D=3D 3 ? TYPE_BCM2837 : TYPE_BCM2836)=
;
> > +    object_property_add_child(OBJECT(machine), "soc", soc, &error_fata=
l);
> >  =20
> > -    /* Allocate and map RAM */
> > -    memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ra=
m",
> > -                                         machine->ram_size);
> >       /* FIXME: Remove when we have custom CPU address space support */
> > -    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ra=
m, 0);
> > +    memory_region_add_subregion_overlap(get_system_memory(), 0,
> > +                                        machine->ram, 0);
> >  =20
> >       /* Setup the SOC */
> > -    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->=
ram),
> > +    object_property_add_const_link(soc, "ram", OBJECT(machine->ram),
> >                                      &error_abort);
> > -    object_property_set_int(OBJECT(&s->soc), machine->smp.cpus, "enabl=
ed-cpus",
> > +    object_property_set_int(soc, machine->smp.cpus, "enabled-cpus",
> >                               &error_abort);
> >       int board_rev =3D version =3D=3D 3 ? 0xa02082 : 0xa21041;
> > -    object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
> > -                            &error_abort);
> > -    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error=
_abort);
> > +    object_property_set_int(soc, board_rev, "board-rev", &error_abort)=
;
> > +    object_property_set_bool(soc, true, "realized", &error_abort);
> >  =20
> >       /* Create and plug in the SD cards */
> >       di =3D drive_get_next(IF_SD);
> >       blk =3D di ? blk_by_legacy_dinfo(di) : NULL;
> > -    bus =3D qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
> > +    bus =3D qdev_get_child_bus(DEVICE(soc), "sd-bus");
> >       if (bus =3D=3D NULL) {
> >           error_report("No SD bus found in SOC object");
> >           exit(1);
> > @@ -211,8 +202,7 @@ static void raspi_init(MachineState *machine, int v=
ersion)
> >       qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
> >       object_property_set_bool(OBJECT(carddev), true, "realized", &erro=
r_fatal);
> >  =20
> > -    vcram_size =3D object_property_get_uint(OBJECT(&s->soc), "vcram-si=
ze",
> > -                                          &error_abort);
> > +    vcram_size =3D object_property_get_uint(soc, "vcram-size", &error_=
abort);
> >       setup_boot(machine, version, machine->ram_size - vcram_size);
> >   }
> >  =20
> > @@ -233,6 +223,7 @@ static void raspi2_machine_init(MachineClass *mc)
> >       mc->min_cpus =3D BCM283X_NCPUS;
> >       mc->default_cpus =3D BCM283X_NCPUS;
> >       mc->default_ram_size =3D 1 * GiB;
> > +    mc->default_ram_id =3D "ram";
> >       mc->ignore_memory_transaction_failures =3D true;
> >   };
> >   DEFINE_MACHINE("raspi2", raspi2_machine_init)
> > @@ -255,6 +246,7 @@ static void raspi3_machine_init(MachineClass *mc)
> >       mc->min_cpus =3D BCM283X_NCPUS;
> >       mc->default_cpus =3D BCM283X_NCPUS;
> >       mc->default_ram_size =3D 1 * GiB;
> > +    mc->default_ram_id =3D "ram";
> >   }
> >   DEFINE_MACHINE("raspi3", raspi3_machine_init)
> >   #endif
> >  =20
>=20
> This patch diverges a lot from my current work:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg653818.html
perhaps we could generalize size checks on top of that.
there were some ideas in that direction in
  "[PATCH v2 66/86] ppc/{ppc440_bamboo,sam460x}: drop RAM size fixup"
thread


> So I'm not very happy about it. Maybe my bad I should ping more=20
> aggressively my patches. I can respin mine preparing for your series on t=
op.

this patch is trivial,
if your patches merged before this, than I'll just rebase.


>=20
> Meanwhile if you are in a hurry I tested yours, so:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
>=20

