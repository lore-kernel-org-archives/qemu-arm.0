Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7740141njd;
        Wed, 9 Apr 2025 07:05:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJEaLNwwtzu5HBFItxwowXeaEnXEVljFxNc8SoTLuKpYhFmGcb4DeMj/jb50R3z+nbfzsyvsdcWMDvAg==@linaro.org
X-Google-Smtp-Source: AGHT+IFsSuyq6SB2bip+r3maPUucMy3N0PJWo2c5OeN/68Oppcdk0Q/0ddtftM26x0TB799v5Ui6
X-Received: by 2002:a05:6102:2d05:b0:4c3:c9:c667 with SMTP id ada2fe7eead31-4c9c44957d0mr2845590137.24.1744207544721;
        Wed, 09 Apr 2025 07:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744207544; cv=none;
        d=google.com; s=arc-20240605;
        b=cIXJKj5x5pdLxB7Xdmzm9DSB9OyBDpwLY7xnmv7K8Wqvc1PXn4rjIFePLB1mN8gCLB
         rFQ26GFkX3XXaOp8eoCn4hlj35uXHfH2u6INS1fwpyqg3MyQw8nSuLAXLmjyZbRfton4
         GLTl9PpDGRG+DnWh6OAKCDo4wL7K6EalGALU0R1ANtBarIY+FUpIEfMTQ+0lTuzjigqV
         RQkpwD6rYWkvFQk2q5QT0rE75QRGY+ptCc9vQBnJdF7Th4jbd4XOpXdqpPzc2iZRgJXA
         pYsHAcfEWT9IE4E2sIM7zLhOMsP7NRK9d4l76rMHRWNuGECEd6lvJIz4cFFgglGCYb0M
         8Yrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=1YM1739pT7eVrFGwXOBuJ8yRaZ5s30LzEQh82TbmLwo=;
        fh=le8jwqTLl9JPS0zOGs1uBEY2xY/b4iq04IHOpXF+otw=;
        b=QogkIn+cJpwXG9orvh4MSNQ5COdHWWZMZFhv5iUc3UQet2gbaZ/EZv8sY3TuGgRpo4
         tn+U29MyeA65xdqnK5UZfOsWQc5J12//oIIYQOPuhNchC7Du4RbcUX3ohJEBV075rtRf
         M+Zh48zUBUeSs69aMJF0kw7ot/ARYSONVrJs6fsOb5ojsDLjCgIF6Nx8JCSQZlk4lFYm
         4wfxbA+9QMwM740m9JWMKTxk59evLrNOEaCwRFfFJO+YIjVN87gYHmGcVXufH75WbD5k
         jV82pr5dzlkodvdV4oTdK198xKFB5n5TSqg72MwAfNmIjYtQUlEQVEAznv1QG5ZOX/D0
         natA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PZ6gS8yE;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c9c98c4a3dsi313718137.395.2025.04.09.07.05.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PZ6gS8yE;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744207544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YM1739pT7eVrFGwXOBuJ8yRaZ5s30LzEQh82TbmLwo=;
	b=PZ6gS8yER88um7lJcfoow2IwHKoGA27S3xN6i087vDKjUfmL9cD4NHKYpyYRp3FWxnw1/T
	zINJ9m1FeKrg1g/uCpOXT89pgITTwAMbkdctfq4HZHKYgiHxd7BGtmRWYLspr8rCT9KWEh
	w0ZyNn31Z1s1kWilSMNxYeilpZHX7e0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-oOzuEYbjOA-UT77T2U0b7w-1; Wed, 09 Apr 2025 10:05:38 -0400
X-MC-Unique: oOzuEYbjOA-UT77T2U0b7w-1
X-Mimecast-MFC-AGG-ID: oOzuEYbjOA-UT77T2U0b7w_1744207538
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so57682405e9.3
        for <alex.bennee@linaro.org>; Wed, 09 Apr 2025 07:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207537; x=1744812337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXpzjH0wmH12EgOOYARPuDYUpIMGYWhEcpVFwC8gjms=;
        b=ZjlKci8EJKanUkNL7N+rOP1i4Sv1skOpINfpcoK+X6crAWHMtJthx1PXqu/QG2XuYq
         dh5kdhAYQJxXQIRiU5f/NmOe/bGzoM6fdg8Y5dVDqhTGXa00T7I8yQUJ7iC5HYw1TMbx
         dQS2dpNn1rUeTsrsgFK6oJ7t6ZHfdpFUyWAFMlpHp6YV4ajaChzXmdEIkWwp/I/UfPaE
         Dz447O1Z0bLSQf2JSTYbl9PBiYxk3y8AeAwzqzfULEtwwHFDhPWtFxzmmW9M76fS6A/D
         pmp1dZo4nWPShjcprALCMPbAwc5Znhm4plt5TYqqm96JvSvHC9wDOvFzo/fV7yJ0joCE
         siDA==
X-Forwarded-Encrypted: i=1; AJvYcCWqxyb9rBh/EOxokMIcITmU+CHaPbyRTQA44ezHzArjY3oGjIkJRBkId8jLXY9meU+Y/yd/YbkI1LodUA==@linaro.org
X-Gm-Message-State: AOJu0YxTJF+RKy53v3B3HPYi/N8C3gqZypkLyzn9NfV8jkFNVS1GoAS9
	fThrHW2GvGyXGVGWWKXtlKdp1Wnt6iURfnmX3WflaikYVpUbgopUZDCPCqpKQWsgk8vrfdOxHi6
	8uMgHZQz7g/COlTsKkrvKMSrB6c6G5cUb8cDIM71/CvQA4bjozbwf1xmxhI/n2A==
X-Gm-Gg: ASbGncv5alfI7qNXtkYJdv/X+jbemDruWiGYrKyWwhiF63rGPYx1OkfpplDPBnYMvIQ
	WQIoRMIrVZ1DwLqPUNom4tFpdQbDxb1xkcuYbl7krXiyYs4f5ljj5OuuxGNoqrHbHKgeJth4wyM
	5E4I867pthpdbCYlaQog9GV3SqHuqIIKPDorLGkBqdVP0z7MSQ/5+hJmm1Qa/3dsz3rSbOV62hC
	PTWtuGrN1XbPst+IVYLbp9UdRi0uPuAo3F5KeY7IIgye2WAZ5cvtIipaaNN5kIEhEGybQ12+x+2
	QzSvzU52KTABddp4n5L/yRoSp4pODDXI
X-Received: by 2002:a05:600c:3584:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-43f1ff3f3c6mr23760195e9.20.1744207535148;
        Wed, 09 Apr 2025 07:05:35 -0700 (PDT)
X-Received: by 2002:a05:600c:3584:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-43f1ff3f3c6mr23759135e9.20.1744207533853;
        Wed, 09 Apr 2025 07:05:33 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecac8sm21264715e9.4.2025.04.09.07.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:05:33 -0700 (PDT)
Date: Wed, 9 Apr 2025 16:05:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org, Udo Steinberg <udo@hypervisor.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>
Subject: Re: [PATCH-for-10.1 v3 6/9] qtest/bios-tables-test: Whitelist
 aarch64/virt 'its_off' variant blobs
Message-ID: <20250409160531.341c205e@imammedo.users.ipa.redhat.com>
In-Reply-To: <671a6c82-ae10-4f3b-9d83-cecc32755206@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
	<20250403204029.47958-7-philmd@linaro.org>
	<671a6c82-ae10-4f3b-9d83-cecc32755206@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ciw5AHBK_IUDjKZC0ggj1J1gLAtp_mtZNBppLT9suwM_1744207538
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +aYfbqOI/ijE

On Fri, 4 Apr 2025 00:01:22 -0300
Gustavo Romero <gustavo.romero@linaro.org> wrote:

> Hi Phil,
>=20
> On 4/3/25 17:40, Philippe Mathieu-Daud=C3=A9 wrote:
> > We are going to fix the test_acpi_aarch64_virt_tcg_its_off()
> > test. In preparation, copy the ACPI tables which will be
> > altered as 'its_off' variants, and whitelist them.
> >=20
> > Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >   tests/qtest/bios-tables-test-allowed-diff.h |   3 +++
> >   tests/qtest/bios-tables-test.c              |   1 +
> >   tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 bytes
> >   tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 bytes
> >   tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 bytes
> >   5 files changed, 4 insertions(+)
> >   create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
> >   create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
> >   create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
> >=20
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/=
bios-tables-test-allowed-diff.h
> > index dfb8523c8bf..3421dd5adf3 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,4 @@
> >   /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/aarch64/virt/APIC.its_off",
> > +"tests/data/acpi/aarch64/virt/FACP.its_off",
> > +"tests/data/acpi/aarch64/virt/IORT.its_off", =20
>=20
> I think your first approach is the correct one: you add the blobs
> when adding the new test, so they would go into patch 5/9 in this series,
> making the test pass without adding anything to bios-tables-test-allowed-=
diff.h.
> Then in this patch only add the APIC.its_off table to the bios-tables-tes=
t-allowed-diff.h
> since that's the table that changes when the fix is in place, as you did =
in:

if APIC.its_off is the only one that's changing, but FACP/IORT blobs are th=
e same
as suffix-less blobs, one can omit copying FACP/IORT as test harness will f=
allback
to suffix-less blob if the one with suffix isn't found.

if blobs are different from defaults then create empty blobs and whitelist =
them in the same patch
then do your changes and then update blobs & wipeout withe list.

Phil,
the process is described in doc comment at the top of tests/qtest/bios-tabl=
es-test.c

> https://mail.gnu.org/archive/html/qemu-devel/2025-03/msg07082.html
>=20
> Plus, adding the blobs, which are actually related to the test in the oth=
er
> patch, and ignoring them at the same time looks confusing to me. I unders=
tand
> that only the blob that changes (APIC.its_off) with the fix should be tem=
porarily
> ignored and, later, updated, as in your first series.
>=20
>=20
> Cheers,
> Gustavo
>=20
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-t=
est.c
> > index baaf199e01c..55366bf4956 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -2151,6 +2151,7 @@ static void test_acpi_aarch64_virt_tcg_its_off(vo=
id)
> >       test_data data =3D {
> >           .machine =3D "virt",
> >           .arch =3D "aarch64",
> > +        .variant =3D ".its_off",
> >           .tcg_only =3D true,
> >           .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
> >           .uefi_fl2 =3D "pc-bios/edk2-arm-vars.fd",
> > diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/acp=
i/aarch64/virt/APIC.its_off
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c37d05d6e05805304f10afe=
73eb7cb9100fcccfa
> > GIT binary patch
> > literal 184
> > zcmZ<^@O0k6z`($=3D+{xeBBUr&HBEVSz2pEB4AU24G0Uik$i-7~iVgWL^17JJ`2AFzr
> > bgb+@aBn}xq0gwb2)Q)cq{30-g9B_L93G4|0
> >=20
> > literal 0
> > HcmV?d00001
> >=20
> > diff --git a/tests/data/acpi/aarch64/virt/FACP.its_off b/tests/data/acp=
i/aarch64/virt/FACP.its_off
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..606dac3fe4b55c31fd68b25=
d3a4127eeef227434
> > GIT binary patch
> > literal 276 =20
> > zcmZ>BbPf<<WME(uaq@Te2v%^42yj*a0-z8Bhz+8t3j|P&V`N}P6&N^PpsQ~v$aVnZ =20
> > CVg~^L
> >=20
> > literal 0
> > HcmV?d00001
> >=20
> > diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/acp=
i/aarch64/virt/IORT.its_off
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0fceb820d509e852ca0849b=
af568a8e93e426738
> > GIT binary patch
> > literal 236
> > zcmebD4+?q1z`(#9?&R<65v<@85#X!<1dKp25F11@1F-=3DRgMkDCNC*yK9F_<M77!bR =
=20
> > zUBI%eoFED&4;F$FSwK1)h;xBB2Py`m{{M%tVD>TjFfcO#g+N#Zh@s|zoCF3AP#UU@ =20
> > R!2`+%Dg6Hr$N|zYvjDIZ5CH%H
> >=20
> > literal 0
> > HcmV?d00001
> >  =20
>=20
