Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp3496726njc;
        Thu, 12 Jun 2025 05:50:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwC9MU3d8wW72cqnw3PNSv7yzQ0vwI5W8PizQTBtIvUSgwlcTWOs5bYqCdyJVmrXfg3g0nFa5OqaegCg==@linaro.org
X-Google-Smtp-Source: AGHT+IG5NMD/aloqzdhd2OfFXirHkB8o4N5xuOxLyOoI8BLCH//mZhmPwEnI6m6K/pZSk3gPe4ys
X-Received: by 2002:a05:620a:3952:b0:7ce:c604:3f53 with SMTP id af79cd13be357-7d3b35edb8amr370658085a.24.1749732614758;
        Thu, 12 Jun 2025 05:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749732614; cv=none;
        d=google.com; s=arc-20240605;
        b=iwfj/yhemXwGXU+6l4D/rhLQ5pytm2HH1jpzgEjIJqKKxVZUWgg52dAfWa37Q95VBV
         krxrNbD4nS5asWOz9WFnKdnsILGVUdF6eYeUGMgJdSOcwVI5YqYf08vOqQkcNPUgFTfN
         ZOl4gCBCPCveEaN3YzZwdB7B93BoDKflwK8T65+MmRNk3YDsUEKBwzOBmO3y0ZZ1DrAP
         WydSb90+hjkJotHmv9cfXWIubadP2bRizqeBw8GJKHD6reZFRgzmMjMMUjaWTE7VvTmO
         MJqo+AMHJEobUnK1Rz9Hr/ggtJMS/70FAMrHLCKuI54UEvyvOlBGkZ1Gs51OsapWh0Sw
         90uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=5lFhxRtUAdJGBztxdsbcyW9odsc9OfWhuK0xDjPtH3o=;
        fh=AN9oTro8XipZC1oH9iqMGwCeRuu5aCYXlxbgQmjQ2HU=;
        b=bIca/cSoovBQMEDCaaYdWXq3JVgW+81422tsZzsYMapuAyKUB7Jd0pSi8O579NWc4v
         SoDLjvHsRigwJUB1ndoSZrByrIIJkbMo2N3uOvVHieutuMEIsAPi0MsdFjGvsyQyaOeu
         EGnWAgkeQneCYPcLhl+fPdBa6fn8yqRt511tPuJXCUK80HuwwrWCJu+inEYB179mi/Aa
         xcXjB/zDuI97w57JzgO3aAOo9rRbIcBYuUMOukELgnV5fs/TJZ9XsHJX6kaHhOwGwAYs
         cFrWXtS4xBSbuLGL6fpSN5+PYDadc+PQ1ekQAqE898AuulbrdgLRIh5HrEaGUmwQNRIa
         XvyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qs9StZMn;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8dff2aesi70506285a.135.2025.06.12.05.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qs9StZMn;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749732614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5lFhxRtUAdJGBztxdsbcyW9odsc9OfWhuK0xDjPtH3o=;
	b=Qs9StZMn3KiAfCxUxcSRaAdQktqYA87UIMQYzrK6abakyqmH/jJHSca+8T1/qPw7F9zcZS
	t+dSOzi/WPeG6anNSa4Y5Tzclm/NaErxvmmgzekxgOsgRysL7x+6GWwpCDybzvetZ8vvjV
	9KUmLsLOEjUv77ZnlPMXoZ+T/+TBnxU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-8S2C--WUMjCBFG2kdaZw_g-1; Thu, 12 Jun 2025 08:50:13 -0400
X-MC-Unique: 8S2C--WUMjCBFG2kdaZw_g-1
X-Mimecast-MFC-AGG-ID: 8S2C--WUMjCBFG2kdaZw_g_1749732612
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so432917f8f.1
        for <alex.bennee@linaro.org>; Thu, 12 Jun 2025 05:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749732612; x=1750337412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lFhxRtUAdJGBztxdsbcyW9odsc9OfWhuK0xDjPtH3o=;
        b=v8cX/yqc74soURdrGE4F6vI06u2nZ8E9DjqSi2FxdBmfvpEiCFT0xDl1KTJMVHl+px
         qTrqDApV0KqZ70qU6ahM5Vrgkg/6m6irCrHwq+tz3exeHUGerhJXWpeAcGI/7NZwTQHJ
         1BWUJ7Q1RvRaZfViUhu/I4fd/QOWkkJLA0/16M4+Ey6gP4BGNThljtrAE/A8++dlylXz
         pfaTEuXbgvUbxi65VZ3daon+hkz/hnHGu0p4CqLn9+BeRUhATE7/gtodNygSDAkASPtm
         tRDWvYxtkfjBXy0MaER7xrsPwZEC+a1mrqfPVNG67Eg5KHMDA29h6bBoQ/jZv88ZIk4c
         5twA==
X-Forwarded-Encrypted: i=1; AJvYcCV2PFtSJsK3pFEQ2CMVLiODBp2ftEVXfZ2AlZd3sVRFGXsysC8/jsNdrFLbB5xQZH4GRh9l3cC7UHTSIw==@linaro.org
X-Gm-Message-State: AOJu0YyZgUnpxPja4wV6uR5PpcPYO6sEdy+bKpKc9URmQKKrP3H67aHh
	4rB10bLq9ZRM1UuFrUWp4+L6xD5Q4qV/9jjnN74PRi5oOQ2FZ1DAzZlElKZ9wMpRglmTC3DX+gL
	uRYYHmTBIoiLejbr56YJCIj1Dsgp+pVHIi0TGWijOemZ+0mWgNHBqWmOKKA==
X-Gm-Gg: ASbGnctkahgqO5IYKlfJ0fFDPubDxfst7PLk/R8Autkc9fe360a8UX5oxUko53fJ9JD
	lvoHO/aCLREWKRKgAVIa5aQ42nPxVaW+EibzhXsyqzVIjDeTqdOVnSqPdy+liiWPZm71EX1KX4d
	WMAUI4OTfPd8IgeY9gHO8gDirU9s8RTuiOKvJ075x/5POcriHkpR+wtV3eXFI4qlexNGII/bUyQ
	2xZc3vFhdE/6t1R5Njkm7Q4oXf82qqisz6r3e9nlZk/uotKRkkP1wxP0xvtcAD/JFJAz5xkdwWY
	8nNNX9rQEgDl2fD5RXt35i3hLytXbU7Xmx/gA2v0Gm4=
X-Received: by 2002:a05:6000:40e1:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3a5607fa69emr3046016f8f.18.1749732611903;
        Thu, 12 Jun 2025 05:50:11 -0700 (PDT)
X-Received: by 2002:a05:6000:40e1:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3a5607fa69emr3045980f8f.18.1749732611447;
        Thu, 12 Jun 2025 05:50:11 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2522b1sm19433325e9.25.2025.06.12.05.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:50:11 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:50:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: Re: [PATCH v2 24/25] tests/qtest/bios-tables-test: Keep ACPI PCI
 hotplug off
Message-ID: <20250612145009.28d69876@imammedo.users.ipa.redhat.com>
In-Reply-To: <848ad5cf-7e83-49bd-8547-ac757c918fdf@linaro.org>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-25-eric.auger@redhat.com>
	<20250528113813.47086516@imammedo.users.ipa.redhat.com>
	<375cfbd6-e585-4b6d-bf10-6571aa40370e@linaro.org>
	<20250528150239.5f6b63d0@imammedo.users.ipa.redhat.com>
	<6a5776b4-73ef-427b-b4e4-b25031b0ce53@linaro.org>
	<20250530135103.09030cf0@imammedo.users.ipa.redhat.com>
	<bcc200fb-fa45-44ac-9e36-4c829becbf1c@linaro.org>
	<e3bc87d8-5016-455e-933d-6cefae993c25@linaro.org>
	<20250611105437.5ecda7c9@imammedo.users.ipa.redhat.com>
	<848ad5cf-7e83-49bd-8547-ac757c918fdf@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2vRbvmipkdOr4KZS94WJI4IEq3GYMRMYghVCjChNefs_1749732612
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8LVOwdxuIS4n

On Wed, 11 Jun 2025 10:14:55 -0300
Gustavo Romero <gustavo.romero@linaro.org> wrote:

> Hi Igor,
>=20
> On 6/11/25 05:54, Igor Mammedov wrote:
> > On Tue, 10 Jun 2025 11:29:02 -0300
> > Gustavo Romero <gustavo.romero@linaro.org> wrote:
[...]
>=20
>=20
> BTW, why did we ultimately choose to commit blobs instead of the actual A=
CPI
> code (as generated by iasl)? I'm just wondering if we could avoid committ=
ing
> the blobs to 1) avoid committing binaries and 2) have the changes in the
> ACPI code in the same commit that changes the ACPI itself.
>=20
> If that's only for historical reasons maybe I can improve the bios-tables=
-test.c
> to handle the ACPI code/struct in text format, avoiding the blobs, so I a=
sk.


We've had this for binary blobs at the beginning, however iasl output was
a moving target (whether it's ASL or AML) hence it proved to be unsuitable
for testing infrastructure (and not only testing, I don't remember concrete=
 bugs though).

As result, we've switched to custom AML generator (aml_foo() API) with
blobs it has generated. ASL output by IASL in tests is used by maintaners
for diagnostic (/documenting) purposes only.

> Thanks!
>=20
>=20
> Cheers,
> Gustavo
>=20
> >>
> >>
> >> Thanks,
> >> Gustavo
> >>     =20
> >>>
> >>> Cheers,
> >>> Gustavo
> >>>     =20
> >>>>    =20
> >>>>> Cheers,
> >>>>> Gustavo
> >>>>>    =20
> >>>>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.htm=
l 4/5
> >>>>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.htm=
l 5/5
> >>>>>>>
> >>>>>>>
> >>>>>>> Cheers,
> >>>>>>> Gustavo =20
> >>>>>>>>>
> >>>>>>>>> ---
> >>>>>>>>>
> >>>>>>>>> [Eric] also added acpi-pcihp=3Doff to test_acpi_aarch64_virt_tc=
g_numamem
> >>>>>>>>> ---
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0 tests/qtest/bios-tables-test.c | 13 +++++++=
++----
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0 1 file changed, 9 insertions(+), 4 deletion=
s(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-=
tables-test.c
> >>>>>>>>> index 0a333ec435..6379dba714 100644
> >>>>>>>>> --- a/tests/qtest/bios-tables-test.c
> >>>>>>>>> +++ b/tests/qtest/bios-tables-test.c
> >>>>>>>>> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_me=
mhp(void)
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.variant =3D ".=
memhp";
> >>>>>>>>> -=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine nvdimm=3Don"
> >>>>>>>>> +=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine nvdimm=3Don,acpi-p=
cihp=3Doff"
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -cpu c=
ortex-a57"
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -m 256=
M,slots=3D3,maxmem=3D1G"
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -objec=
t memory-backend-ram,id=3Dram0,size=3D128M"
> >>>>>>>>> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_nu=
mamem(void)
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.variant =3D ".=
numamem";
> >>>>>>>>> -=C2=A0=C2=A0=C2=A0 test_acpi_one(" -cpu cortex-a57"
> >>>>>>>>> +=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine acpi-pcihp=3Doff"
> >>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -cpu cortex-a57"
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -objec=
t memory-backend-ram,id=3Dram0,size=3D128M"
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -numa =
node,memdev=3Dram0",
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &data);
> >>>>>>>>> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_px=
b(void)
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to solve th=
e conflicts.
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.variant =3D ".=
pxb";
> >>>>>>>>> -=C2=A0=C2=A0=C2=A0 test_acpi_one(" -device pcie-root-port,chas=
sis=3D1,id=3Dpci.1"
> >>>>>>>>> +=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine acpi-pcihp=3Doff"
> >>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -device pcie-root-port,chassis=
=3D1,id=3Dpci.1"
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -devic=
e virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.1"
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -drive=
 file=3D"
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "tests/d=
ata/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
> >>>>>>>>> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_ac=
pi_hmat(void)
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.variant =3D ".=
acpihmatvirt";
> >>>>>>>>> -=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine hmat=3Don"
> >>>>>>>>> +=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine hmat=3Don,acpi-pci=
hp=3Doff"
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -cpu c=
ortex-a57"
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -smp 4=
,sockets=3D2"
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -m 384=
M"
> >>>>>>>>> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(vo=
id)
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.smbios_cpu_max=
_speed =3D 2900;
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.smbios_cpu_cur=
r_speed =3D 2700;
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_acpi_one("-cpu=
 cortex-a57 "
> >>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-machine acpi-pcihp=3Doff "
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-smbios=
 type=3D4,max-speed=3D2900,current-speed=3D2700", &data);
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_test_data(&dat=
a);
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0 }
> >>>>>>>>> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_to=
pology(void)
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_acpi_one("-cpu=
 cortex-a57 "
> >>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-machine acpi-pcihp=3Doff "
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-smp so=
ckets=3D1,clusters=3D2,cores=3D2,threads=3D2", &data);
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_test_data(&dat=
a);
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0 }
> >>>>>>>>> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(v=
oid)
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_acpi_one("-cpu=
 cortex-a57 "
> >>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-machine acpi-pcihp=3Doff "
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-device=
 virtio-iommu-pci", &data);
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_test_data(&dat=
a);
> >>>>>>>>>  =C2=A0=C2=A0=C2=A0 } =20
> >>>>>    =20
> >>>>    =20
> >>>     =20
> >> =20
> >  =20
>=20
