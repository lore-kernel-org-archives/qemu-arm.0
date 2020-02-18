Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6316183lfp;
        Tue, 18 Feb 2020 08:49:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzSiMIsDLWkioDebmzbrDQ22dPq5OddFeGAVM1VirPVtt7YQKdBl7QqhYK+yWmxBwnERkgF
X-Received: by 2002:ac8:19b6:: with SMTP id u51mr18401690qtj.319.1582044541777;
        Tue, 18 Feb 2020 08:49:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582044541; cv=none;
        d=google.com; s=arc-20160816;
        b=UGoiBNLtQirjfuf2q1/wP/VkEmTv9jh3wiKiBTjDlZDeLhK4qIXbGZkZc6u0X8MNgT
         s4OO7Qyz9y65+A1LMB7z0COOEpkiRKxz1Dw0BbBL4Btsg1VotrdBjrtUe5ui57Rj45je
         UIHbudFYAfaCx8Th8OnQ4n69Jhxyf4uCMtb6wC8j7VEGwH5VYI551ysTIqgUYCkh2jMK
         9oZAkwND7vF1nbZzLH+bsgKzst+wHW2oXP1rdZZoTH/JBXrqUuvNJdpHUkuecWxfxL/4
         04JyOjC4wLkyCDH16pI6AEellxX1WNB7eCQxqupgFbwI1nOVjcIVsPehfEqAyc+VTEdA
         zwMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=D8589sR3fCG8HGTYkPo1CAu7+eGwq7K0+zYEcvFKHaw=;
        b=T7vGzI+OTyHqIIezCkgTCa339UwQaXKThIrpqWx1EijCFhWCWF43XGBnAiED8jW8Er
         JzOAy+pi2otSU38a3ksxEW4JrS9PHeYK0bJ7VjIBxA0eIBSAMBk8U0hMKhTrgBBsyNL1
         VKNePK7Nbh9Vt0M2Dq3zIru2pNfH2SOzphSei2/VpG4dBBrrLuv19BObPuhWExszSUiF
         NI2sOee3R0dotH5SnoEQYnYlvpl3VQJpdInA/vPZujtz0Y6WCXyW1nR6oudT4IaoZTrZ
         Jg6aqdxVkWf0TBqJaUeO+exF5LHYTb1LJGXttQY5j6acOal9zXiWzuRurT54UbFqOlb1
         zh5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S+QWhSNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m197si2166762qke.131.2020.02.18.08.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 08:49:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=S+QWhSNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j463R-0005KT-7n
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 11:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j4635-00052h-0x
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:48:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j4633-0007oF-Qc
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:48:38 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38886
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j4633-0007ny-Mv
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582044517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D8589sR3fCG8HGTYkPo1CAu7+eGwq7K0+zYEcvFKHaw=;
 b=S+QWhSNrslgAi36HkZ8TS12PkxJxglUty3f36+mnhL9qO26F+K5lJg6xqBxdomvCFSScC4
 yCc8NanP/Ql9NK/A7KZTaGy0Klcv5ZUB55xoedWllhHM5oIK3rU//j6vTpEuQbNUmeHLy/
 JMFdpnobBE3mn8mbMMjsjSoYKfNtywk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-pi_4OR9UOzmHqfBqc9sxvQ-1; Tue, 18 Feb 2020 11:48:35 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 382B713E4;
 Tue, 18 Feb 2020 16:48:33 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0401C1BC6D;
 Tue, 18 Feb 2020 16:48:28 +0000 (UTC)
Date: Tue, 18 Feb 2020 17:48:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 12/13] hw/arm/raspi: Add the Raspberry Pi B+ machine
Message-ID: <20200218174826.16dc7b82@redhat.com>
In-Reply-To: <c56d4f85-b4df-643c-c017-350b7f64aec2@redhat.com>
References: <20200217114533.17779-1-f4bug@amsat.org>
 <20200217114533.17779-13-f4bug@amsat.org>
 <26d85b1f-b2b7-ff9f-1236-43e9cb761c30@greensocs.com>
 <c56d4f85-b4df-643c-c017-350b7f64aec2@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: pi_4OR9UOzmHqfBqc9sxvQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1E?= =?UTF-8?B?YXVkw6k=?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6lx03XpYR8NO

On Tue, 18 Feb 2020 10:35:43 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Cc'ing Eduardo/Igor.
>=20
> On 2/18/20 9:48 AM, Luc Michel wrote:
> > On 2/17/20 12:45 PM, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >>    $ qemu-system-arm -M raspi1b -serial stdio \
> >>        -kernel raspberrypi/firmware/boot/kernel.img \
> >>        -dtb raspberrypi/firmware/boot/bcm2708-rpi-b.dtb \
> >>        -append 'printk.time=3D0 earlycon=3Dpl011,0x20201000 console=3D=
ttyAMA0'
> >>    [    0.000000] Booting Linux on physical CPU 0x0
> >>    [    0.000000] Linux version 4.19.69+ (dom@buildbot) (gcc version 4=
.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1261 Tue Sep 3 20:21:=
01 BST 2019
> >>    [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision =
7 (ARMv7), cr=3D00c5387d
> >>    [    0.000000] CPU: VIPT aliasing data cache, unknown instruction c=
ache
> >>    [    0.000000] OF: fdt: Machine model: Raspberry Pi Model B
> >>    [    0.000000] earlycon: pl11 at MMIO 0x20201000 (options '')
> >>    [    0.000000] bootconsole [pl11] enabled
> >>    [    0.000000] Memory policy: Data cache writeback
> >>    [    0.000000] cma: Reserved 8 MiB at 0x1b800000
> >>    [    0.000000] random: get_random_bytes called from start_kernel+0x=
8c/0x49c with crng_init=3D0
> >>    [    0.000000] Built 1 zonelists, mobility grouping on.  Total page=
s: 113680
> >>    [    0.000000] Kernel command line: printk.time=3D0 earlycon=3Dpl01=
1,0x20201000 console=3DttyAMA0
> >>    Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
> >>    Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
> >>    Memory: 434380K/458752K available (6971K kernel code, 635K rwdata, =
2080K rodata, 464K init, 797K bss, 16180K reserved, 8192K cma-reserved)
> >>    ...
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >>   hw/arm/raspi.c | 13 +++++++++++++
> >>   1 file changed, 13 insertions(+)
> >>
> >> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> >> index 3537a329ac..2d9f4e3085 100644
> >> --- a/hw/arm/raspi.c
> >> +++ b/hw/arm/raspi.c
> >> @@ -324,6 +324,15 @@ static void raspi_machine_class_common_init(Machi=
neClass *mc,
> >>       mc->default_ram_size =3D board_ram_size(board_rev);
> >>   };
> >>  =20
> >> +static void raspi1b_machine_class_init(ObjectClass *oc, void *data)
> >> +{
> >> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> >> +    RaspiMachineClass *rmc =3D RASPI_MACHINE_CLASS(oc);
> >> +
> >> +    rmc->board_rev =3D 0x900032;
> >> +    raspi_machine_class_common_init(mc, rmc->board_rev);
> >> +};
> >> +
> >>   static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
> >>   {
> >>       MachineClass *mc =3D MACHINE_CLASS(oc);
> >> @@ -348,6 +357,10 @@ static void raspi3b_machine_class_init(ObjectClas=
s *oc, void *data)
> >>  =20
> >>   static const TypeInfo raspi_machine_types[] =3D {
> >>       {
> >> +        .name           =3D MACHINE_TYPE_NAME("raspi1b"), =20
> > If it's the B+ model, why not call it raspi1b+ ? =20
>=20
> I thought about it (and prefer it), but I'm not sure this can have some=
=20
> side-effect.
>=20
> Eduardo, Igor, is that OK to use a '+' in a machine name?
>=20
> So far the names used match [a-zA-Z0-9-].
That was my impression as well.
How about "raspi1-plus"

=20
> >  =20
> >> +        .parent         =3D TYPE_RASPI_MACHINE,
> >> +        .class_init     =3D raspi1b_machine_class_init,
> >> +    }, {
> >>           .name           =3D MACHINE_TYPE_NAME("raspi2b"),
> >>           .parent         =3D TYPE_RASPI_MACHINE,
> >>           .class_init     =3D raspi2b_machine_class_init,
> >> =20
> >  =20
>=20

