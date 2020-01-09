Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2392999lff;
        Thu, 9 Jan 2020 09:13:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxydEO6xZnHq/ueuh3fXoiDrFw2/Mn8V2QuhTX79wgvKqPplzOv0lJSTZg0O8INlcXO+2iG
X-Received: by 2002:ad4:5888:: with SMTP id dz8mr9829213qvb.204.1578590011267;
        Thu, 09 Jan 2020 09:13:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578590011; cv=none;
        d=google.com; s=arc-20160816;
        b=wFSoDQk8bHVHb3T0kzjJR4d42GewuRjEZJ+8UacN6fzv2Vuu8s6spZE4l4pgkqkIch
         MxBKO8CsEI8Qu8x6mrRCPs94sXJMGrAlZf24I9dEpWBE/1xnwhagzmCdjzKjCwYhGNWO
         elk3Iles3YRXA0USQvG//EcwlXx79hQXR6sLDz29SCdVQ3gXMXPNorWKwN+SeLG1JXkZ
         kZgwU6tpGeYz+10chGv+xWj+u0hxIvURhdJV8yenzLVG+vTWUq8mfin3o4XHiGP5OGWM
         WTlc17eDmpPhrDsZlGeuVX8BsWba/l3vEwMdKF9wcIITSVgJXnXYTbP6d/arVkw5fOBt
         CbGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=eNVJ/PzTEhzkIw1WrsrtQ1OGorGceLIzb7qSZyLaPVs=;
        b=w9gtsmo8JwbCzeCH3P5p5yML/uiY9xI/yFXaZlmrhPEYx+uB+vx33GXjFSXHQFbrGU
         fKG//HM/fmYwy1GtsezxLZqYNu7aKG7BnRY3LCFMpv5e1PrtG63l0DZtz9MRxQIvBm5b
         1sUx7aYyW6eAtnbyZdBeQq6O820Z3CWj02sUSi1WgzZA3RIkMyRsurVmF7MsjWzEaSY6
         abzs1Hzs5H8kdNeyUzbRhSmiTC7eYf3XvQyMl6QXGbFZwH2ItFv4ajzsaRTm2xHLIn4z
         4KOx/mYIN51asKFvOy1vXt3rjminL0TC8WOH5Rr9W5zagU2OkGYu0ZYfsfMzEYk5hv6L
         22bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EgOsPmZy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r80si3779448qke.87.2020.01.09.09.13.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 09:13:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EgOsPmZy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipbNC-0003iM-KG
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 12:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ipbN2-0003he-OO
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 12:13:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ipbMz-0000sq-Qt
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 12:13:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45004
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ipbMz-0000m4-9T
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 12:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578589994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNVJ/PzTEhzkIw1WrsrtQ1OGorGceLIzb7qSZyLaPVs=;
 b=EgOsPmZysixrkcACpDSU8Hz9GCUdaOmWcHSc2WJdkn5PQPlRT++/Am6VpM/5Yv64+ZKQja
 ra6DooRT7mrMQT9Jo+Uky8HtgcDW8keMEleLvtsKxVjCOFsQMB4l4xGKopmbhVM49DNXpm
 U3+vBbNcXThxs/lz5oEnO5rmVrS2mAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-rScUL4pSOICZobdsIw0rcg-1; Thu, 09 Jan 2020 12:13:10 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BA228018C5;
 Thu,  9 Jan 2020 17:13:08 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10908272CC;
 Thu,  9 Jan 2020 17:13:02 +0000 (UTC)
Date: Thu, 9 Jan 2020 18:13:00 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH 0/5] ARM virt: Add NVDIMM support
Message-ID: <20200109181300.00238828@redhat.com>
In-Reply-To: <8562f82b7c0140d3ad0c7f6616cb6f28@huawei.com>
References: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
 <a133d4c4-3f60-2bb1-a7d7-35cdb06af265@redhat.com>
 <441c818f24084b4191315cf2a6267cef@huawei.com>
 <20191125164541.3f0a593f@redhat.com>
 <444efcb441fe42e5aff58b3af3ab14b4@huawei.com>
 <20191126095655.27227f59@redhat.com>
 <c2bb0be09e244ee59d27c7aaab1783a9@huawei.com>
 <20191211085727.1ab9564e@redhat.com>
 <8562f82b7c0140d3ad0c7f6616cb6f28@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: rScUL4pSOICZobdsIw0rcg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 Auger Eric <eric.auger@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rSzj6ajqQ6lt

On Mon, 6 Jan 2020 17:06:32 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi Igor,
>=20
> > -----Original Message-----
> > From: Shameerali Kolothum Thodi
> > Sent: 13 December 2019 12:52
> > To: 'Igor Mammedov' <imammedo@redhat.com>
> > Cc: xiaoguangrong.eric@gmail.com; peter.maydell@linaro.org;
> > drjones@redhat.com; shannon.zhaosl@gmail.com; qemu-devel@nongnu.org;
> > Linuxarm <linuxarm@huawei.com>; Auger Eric <eric.auger@redhat.com>;
> > qemu-arm@nongnu.org; xuwei (O) <xuwei5@huawei.com>;
> > lersek@redhat.com
> > Subject: RE: [PATCH 0/5] ARM virt: Add NVDIMM support
> >  =20
>=20
> [...]
>=20
> >=20
> > Thanks for your help. I did spend some more time debugging this further=
.
> > I tried to introduce a totally new Buffer field object with different
> > sizes and printing the size after creation.
> >=20
> > --- SSDT.dsl=092019-12-12 15:28:21.976986949 +0000
> > +++ SSDT-arm64-dbg.dsl=092019-12-13 12:17:11.026806186 +0000
> > @@ -18,7 +18,7 @@
> >   *     Compiler ID      "BXPC"
> >   *     Compiler Version 0x00000001 (1)
> >   */
> > -DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000001)
> > +DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000002)
> >  {
> >      Scope (\_SB)
> >      {
> > @@ -48,6 +48,11 @@
> >                      RLEN,   32,
> >                      ODAT,   32736
> >                  }
> > +
> > +                Field (NRAM, DWordAcc, NoLock, Preserve)
> > +                {
> > +                    NBUF,   32768
> > +                }
> >=20
> >                  If ((Arg4 =3D=3D Zero))
> >                  {
> > @@ -87,6 +92,12 @@
> >                      Local3 =3D DerefOf (Local2)
> >                      FARG =3D Local3
> >                  }
> > +
> > +                Local2 =3D 0x2
> > +                printf("AML:NVDIMM Creating TBUF with bytes %o",
> > Local2)
> > +                CreateField (NBUF, Zero, (Local2 << 3), TBUF)
> > +                Concatenate (Buffer (Zero){}, TBUF, Local3)
> > +                printf("AML:NVDIMM Size of TBUF(Local3) %o",
> > SizeOf(Local3))
> >=20
> >                  NTFI =3D Local6
> >                  Local1 =3D (RLEN - 0x04)
> >=20
> > And run it by changing Local2 with different values, It looks on ARM64,
> >=20
> > For cases where, Local2 <8, the created buffer size is always 8 bytes
> >=20
> > "AML:NVDIMM Creating TBUF with bytes 0000000000000002"
> > "AML:NVDIMM Size of TBUF(Local3) 0000000000000008"
> >=20
> > ...
> > "AML:NVDIMM Creating TBUF with bytes 0000000000000005"
> > "AML:NVDIMM Size of TBUF(Local3) 0000000000000008"
> >=20
> > And once Local2 >=3D8, it gets the correct size,
> >=20
> > "AML:NVDIMM Creating TBUF with bytes 0000000000000009"
> > "AML:NVDIMM Size of TBUF(Local3) 0000000000000009"
> >=20
> >=20
> > But on x86, the behavior is like,
> >=20
> > For cases where, Local2 <4, the created buffer size is always 4 bytes
> >=20
> > "AML:NVDIMM Creating TBUF with bytes 00000002"
> > "AML:NVDIMM Size of TBUF(Local3) 00000004"
> > ....
> > "AML:NVDIMM Creating TBUF with bytes 00000003"
> > "AML:NVDIMM Size of TBUF(Local3) 00000004"
> >=20
> > And once Local2 >=3D 4, it is ok
> >=20
> > "AML:NVDIMM Creating TBUF with bytes 00000005"
> > "AML:NVDIMM Size of TBUF(Local3) 00000005"
> > ...
> > "AML:NVDIMM Creating TBUF with bytes 00000009"
> > "AML:NVDIMM Size of TBUF(Local3) 00000009"
> >=20
> > This is the reason why it works on x86 and not on ARM64. Because, if yo=
u
> > remember on second iteration of the FIT buffer, the requested buffer si=
ze is 4 .
> >=20
> > I tried changing the AccessType of the below NBUF field from DWordAcc t=
o
> > ByteAcc/BufferAcc, but no luck.
> >=20
> > +                Field (NRAM, DWordAcc, NoLock, Preserve)
> > +                {
> > +                    NBUF,   32768
> > +                }
> >=20
> > Not sure what we need to change for ARM64 to create buffer object of si=
ze 4
> > here. Please let me know if you have any pointers to debug this further=
.
> >=20
> > (I am attaching both x86 and ARM64 SSDT dsl used for reference) =20
>=20
> (+Jonathan)
>=20
> Thanks to Jonathan for taking a fresh look at this issue and spotting thi=
s,
> https://elixir.bootlin.com/linux/v5.5-rc5/source/drivers/acpi/acpica/utmi=
sc.c#L109
>=20
> And, from ACPI 6.3, table 19-419
>=20
> "If the Buffer Field is smaller than or equal to the size of an Integer (=
in bits), it
> will be treated as an Integer. Otherwise, it will be treated as a Buffer.=
 The size
> of an Integer is indicated by the Definition Block table header's Revisio=
n field.
> A Revision field value less than 2 indicates that the size of an Integer =
is 32 bits.
> A value greater than or equal to 2 signifies that the size of an Integer =
is 64 bits."
>=20
> It looks like the main reason for the difference in behavior of the buffe=
r object
> size between x86 and ARM/virt, is because of the Revision number used in =
the
> DSDT table. On x86 it is 1 and ARM/virt it is 2.
>=20
> So most likely,
>=20
> >     CreateField (ODAT, Zero, Local1, OBUF)

You are right, that's where it goes wrong, since OBUF
is implicitly converted to integer if size is less than 64bits.

> >     Concatenate (Buffer (Zero){}, OBUF, Local7)

see more below

[...]

>=20
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 64eacfad08..621f9ffd41 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -1192,15 +1192,18 @@ static void nvdimm_build_fit(Aml *dev)
> =C2=A0 =C2=A0 =C2=A0aml_append(method, ifctx);
> =C2=A0
> =C2=A0 =C2=A0 =C2=A0aml_append(method, aml_store(aml_sizeof(buf), buf_siz=
e));
> - =C2=A0 =C2=A0aml_append(method, aml_subtract(buf_size,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_int(4) /* the si=
ze of "STAU" */,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf_size));
> =C2=A0
> =C2=A0 =C2=A0 =C2=A0/* if we read the end of fit. */
> - =C2=A0 =C2=A0ifctx =3D aml_if(aml_equal(buf_size, aml_int(0)));
> + =C2=A0 =C2=A0ifctx =3D aml_if(aml_equal(aml_subtract(buf_size,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_sizeof(aml_int(0)), NULL),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 aml_int(0)));
> =C2=A0 =C2=A0 =C2=A0aml_append(ifctx, aml_return(aml_buffer(0, NULL)));
> =C2=A0 =C2=A0 =C2=A0aml_append(method, ifctx);
> =C2=A0
> + =C2=A0 =C2=A0aml_append(method, aml_subtract(buf_size,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_int(4) /* the si=
ze of "STAU" */,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf_size));
> +
> =C2=A0 =C2=A0 =C2=A0aml_append(method, aml_create_field(buf,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_int(4 * BITS_PER_BYTE), /* offset at byt=
e 4.*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aml_shiftleft(buf_size, aml_int(3)), "BUFF")=
);

Instead of covering up error in NCAL, I'd prefer original issue fixed.

How about something like this pseudocode:

                NTFI =3D Local6                                            =
       =20
                Local1 =3D (RLEN - 0x04)                                   =
       =20
-                Local1 =3D (Local1 << 0x03)                               =
        =20
-                CreateField (ODAT, Zero, Local1, OBUF)                    =
      =20
-                Concatenate (Buffer (Zero) {}, OBUF, Local7)  =20

                If (Local1 < IntegerSize)
                {
                    Local7 =3D Buffer(0) // output buffer
                    Local8 =3D 0 // index for being copied byte
                    // build byte by byte output buffer
                    while (Local8 < Local1) {
                       Local9 =3D Buffer(1)
                       // copy 1 byte at Local8 offset from ODAT to tempora=
ry buffer Local9
                       Store(DeRef(Index(ODAT, Local8)), Index(Local9, 0))
                       Concatenate (Local7, Local9, Local7)=20
                       Increment(Local8)
                    }
                    return Local7
                } else {
                    CreateField (ODAT, Zero, Local1, OBUF)
                    return OBUF
                }

