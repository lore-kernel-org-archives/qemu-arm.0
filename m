Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3820892lfp;
        Mon, 10 Feb 2020 05:09:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqwedP2XQnQ3DsxGsiF7twbguQfcgrEfC6UGA2a+wIE1cDnF8yHmXQAdGaLyYTO4Z/RKWGJK
X-Received: by 2002:a05:6214:b23:: with SMTP id w3mr10023128qvj.181.1581340188974;
        Mon, 10 Feb 2020 05:09:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581340188; cv=none;
        d=google.com; s=arc-20160816;
        b=df8tBk9S3kvLMnfM0cxVy+Pa4U7/sH5IoWrqBboSu6K7zleB10YlcP2Am3bCESkk23
         tmIugjCZ581PO2GeDlHBVgs/rg6SoaveQ/NqGMMA7vLscokTIQlSwczgVxB95ZtymuaD
         2SfOJm6EL284DKMd68pwHf6Xbm9PHmm2/AIv+BxtOLFB649MhiIHi30+91eCAjuidO90
         Yaw1V0qbkVpGj9n9xRCWOMFb6MRrZ8JmVevaBJWAQiIbjd9dg0l7qX348bg7zI5/RWGS
         IZ6zC04VMi5Aaq38RiAIpdq1uEsRLB1U4nRDK9NJ6KaekZbTnzSbkXktnHEuGId2QeqF
         BEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=lFmokft1kTFAFJrbqzvipAx5diDrfYbxHxW698ao9q4=;
        b=t4e+6awd6JgFWInSaMAAgd0w79luxwHbCE+bjITuG2wbuY5+sPD2q5xTLMYdQPiWuW
         iLUS3SDO9Ip6s+2AXB/2jR4iwHaCenjkMvX5UAwKUFuhJTPQjdHl3TJ2cw/QNcSR4xFO
         +GhMekEQCDPvdq8M/PTp257lpox7WkBNWuN4DZtTN8v5K5wxrNroIHaF+8v5cE5Sp6Zy
         J5y+MkXlDG0v4EEp5VjFLmcQ5SlrYVwXRkG+rz0/g5nZCTqh/x42NHsyY6KwAanSfNAi
         4qtAVgnZeaROouknROamthZvTWzy6NImUKTn8nBBI1OeScowBGpkNsGtQfMI4SudvZEJ
         UxUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UQjPnDAf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u186si106726qkd.185.2020.02.10.05.09.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 05:09:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UQjPnDAf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j18ou-00011G-E3
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 08:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j18oi-000119-VR
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:09:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j18oh-0003BE-IB
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:09:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36072
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j18oh-0003Ap-E2
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581340174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lFmokft1kTFAFJrbqzvipAx5diDrfYbxHxW698ao9q4=;
 b=UQjPnDAfyypKixxwGjPsjxIM6+xa6qcc4SNd65A4OX5CtKoCZa3q/BAqms5iVSeC2Q458Q
 LFjCZ4wP1zEXwbuxrMgAAPHa8oeqMlDI6OR7qjGw7dipIiG5DnJRTWXaX2NozAaLhOQnZ4
 Pfe4PdU0JtbKxV6rNRpbUIRDTyKSEIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-3O34Gw-hONmztIX9CZuEgA-1; Mon, 10 Feb 2020 08:09:27 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F612800D41;
 Mon, 10 Feb 2020 13:09:25 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A47B5DA82;
 Mon, 10 Feb 2020 13:09:19 +0000 (UTC)
Date: Mon, 10 Feb 2020 14:09:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v3 08/13] hw/arm/raspi: Make board_rev a field of
 RaspiMachineClass
Message-ID: <20200210140918.270c8a5d@redhat.com>
In-Reply-To: <2adc51a2-b526-7f6a-4c01-775f3ac06444@redhat.com>
References: <20200208165645.15657-1-f4bug@amsat.org>
 <20200208165645.15657-9-f4bug@amsat.org>
 <20200210105042.7e76e4e6@redhat.com>
 <2adc51a2-b526-7f6a-4c01-775f3ac06444@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 3O34Gw-hONmztIX9CZuEgA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XqcFAdbT+Cdn

On Mon, 10 Feb 2020 11:03:40 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 2/10/20 10:50 AM, Igor Mammedov wrote:
> > On Sat,  8 Feb 2020 17:56:40 +0100
> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >  =20
> >> We want to have a common class_init(). The only value that
> >> matters (and changes) is the board revision.
> >> Pass the board_rev as class_data to class_init().
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >>   hw/arm/raspi.c | 17 ++++++++++++++---
> >>   1 file changed, 14 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> >> index 62b8df3c2e..fbfcd29732 100644
> >> --- a/hw/arm/raspi.c
> >> +++ b/hw/arm/raspi.c
> >> @@ -46,6 +46,7 @@ typedef struct RaspiMachineClass {
> >>       /*< private >*/
> >>       MachineClass parent_obj;
> >>       /*< public >*/
> >> +    uint32_t board_rev;
> >>   } RaspiMachineClass;
> >>  =20
> >>   #define TYPE_RASPI_MACHINE       MACHINE_TYPE_NAME("raspi-common")
> >> @@ -227,9 +228,11 @@ static void setup_boot(MachineState *machine, int=
 version, size_t ram_size)
> >>       arm_load_kernel(ARM_CPU(first_cpu), machine, &binfo);
> >>   }
> >>  =20
> >> -static void raspi_init(MachineState *machine, uint32_t board_rev)
> >> +static void raspi_init(MachineState *machine)
> >>   {
> >> +    RaspiMachineClass *mc =3D RASPI_MACHINE_GET_CLASS(machine);
> >>       RaspiMachineState *s =3D RASPI_MACHINE(machine);
> >> +    uint32_t board_rev =3D mc->board_rev;
> >>       int version =3D board_version(board_rev);
> >>       uint64_t ram_size =3D board_ram_size(board_rev);
> >>       uint32_t vcram_size;
> >> @@ -279,13 +282,16 @@ static void raspi_init(MachineState *machine, ui=
nt32_t board_rev)
> >>  =20
> >>   static void raspi2_init(MachineState *machine)
> >>   {
> >> -    raspi_init(machine, 0xa21041);
> >> +    raspi_init(machine);
> >>   }
> >>  =20
> >>   static void raspi2_machine_class_init(ObjectClass *oc, void *data)
> >>   {
> >>       MachineClass *mc =3D MACHINE_CLASS(oc);
> >> +    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> >> +    uint32_t board_rev =3D (uint32_t)(uintptr_t)data;
> >>  =20
> >> +    rmc->board_rev =3D board_rev; =20
> >=20
> > instead of doing a bit obscure ".class_data     =3D (void *)0xa21041," =
and
> > using it here, I'd just do
> >=20
> >         rmc->board_rev =3D 0xa21041;
> >=20
> > using value specific for each leaf class =20
>=20
> Leaf classes are removed in patch #12 "Use a unique=20
> raspi_machine_class_init() method", see more uses of .class_data from v2:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg677164.html
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg677166.html
>=20
> Are you disagreeing with them? Then we should document .class_data as=20
> deprecated and show example of good code.

we sometimes use .class_data when creating many derived types
(typical example CPU types (x86) ) where it's impractical to code
leaf class_init functions. I'd use .class_data in cases where I
can't get away with explicit .class_init

However in case of machines (even various versioned ones) practice
was to use parent class_init to set common data and leaf class_inits
to set board (version) specific features.


> > with this change
> >   Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> >  =20
> >>       mc->desc =3D "Raspberry Pi 2B";
> >>       mc->init =3D raspi2_init;
> >>       mc->block_default_type =3D IF_SD;
> >> @@ -302,13 +308,16 @@ static void raspi2_machine_class_init(ObjectClas=
s *oc, void *data)
> >>   #ifdef TARGET_AARCH64
> >>   static void raspi3_init(MachineState *machine)
> >>   {
> >> -    raspi_init(machine, 0xa02082);
> >> +    raspi_init(machine);
> >>   }
> >>  =20
> >>   static void raspi3_machine_class_init(ObjectClass *oc, void *data)
> >>   {
> >>       MachineClass *mc =3D MACHINE_CLASS(oc);
> >> +    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> >> +    uint32_t board_rev =3D (uint32_t)(uintptr_t)data;
> >>  =20
> >> +    rmc->board_rev =3D board_rev;
> >>       mc->desc =3D "Raspberry Pi 3B";
> >>       mc->init =3D raspi3_init;
> >>       mc->block_default_type =3D IF_SD;
> >> @@ -327,11 +336,13 @@ static const TypeInfo raspi_machine_types[] =3D =
{
> >>           .name           =3D MACHINE_TYPE_NAME("raspi2"),
> >>           .parent         =3D TYPE_RASPI_MACHINE,
> >>           .class_init     =3D raspi2_machine_class_init,
> >> +        .class_data     =3D (void *)0xa21041,
> >>   #ifdef TARGET_AARCH64
> >>       }, {
> >>           .name           =3D MACHINE_TYPE_NAME("raspi3"),
> >>           .parent         =3D TYPE_RASPI_MACHINE,
> >>           .class_init     =3D raspi3_machine_class_init,
> >> +        .class_data     =3D (void *)0xa02082,
> >>   #endif
> >>       }, {
> >>           .name           =3D TYPE_RASPI_MACHINE, =20
> >  =20
>=20

