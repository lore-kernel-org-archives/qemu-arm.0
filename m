Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1879867njc;
        Wed, 11 Jun 2025 01:54:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7FM5ZGJKoW3dJTzXwaU2oNa+WiF6G2LfFWoq4FuDG23Ud1dBM/q4S++uTQmnS8FTFL8tEzUbZ33Zxpg==@linaro.org
X-Google-Smtp-Source: AGHT+IE/kgdwNfHbFc7O2GljnbVT+ZGuOTbaPNKM4JllfBiXhiXbh6REJuVWIE3vQC4mDcC0q0Qi
X-Received: by 2002:a05:620a:244f:b0:7c5:afc9:5144 with SMTP id af79cd13be357-7d3a88e4f59mr321295085a.23.1749632082617;
        Wed, 11 Jun 2025 01:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749632082; cv=none;
        d=google.com; s=arc-20240605;
        b=JuhfNW5jXbbMapRqH4qpLLmvFo+njHtBFjA5bpvekqaNAb0qRPbP5dLx3Zj+V1065o
         8YzBXaadF4rP5fnoB9a1kMMFtj7UPIGBr6GHwhMh80mJ8WAtj17waV5/kYas5LQvpDXN
         pO/DQOKsbJc5rG8AoHy64MMglqg3JkZ+kIvc4o7RWre7YpO8t/mIYhSGU8Vwhgk4YCtl
         +Z7FNmQoz0c91lazFXyPUoJ93gJZcz28H4L4xezek77EI+j5Zgd49LnV1hWPHT1+s+EJ
         L+o6lCaam0oyufrV9ROP4Yx80uYOHBAhtK24iErMdjN2VFRTM6EPUepjyls6mVx4XiC0
         aNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=riYHadBKgFoUvYxgALKaU9VuI1UsfsdISOigZNurVKM=;
        fh=d4uInJbbRuFMusJ7DYR8vtME0JJaDTJy0sBm+POhD9A=;
        b=IzPkE1E+h7oFT2Aas/GYwRdGzRBr0HmEIQb2IZKJyManBQkuABE127CdtJaf6iRGgd
         npiMyP+JqMQ20kwNCVgNYHpJjfBumb22GXf0Dj2plKy/hdXRvKjYr7KdA4q5cmSwHxGt
         EhXZpLzdoHukrukIyl48QOW+KXVE9bDWedvOd38adR4QO+8uhGmbiXi742KKNNY+XHE5
         WMKNYlSVU2tIKJRarOwMk9o5H+4g2n72+uCGfy2NdkRyaMRAKk7Tyj7h4oCFYReacCxO
         g/iIwgaKh9x3OyPD3yI7g25ysEws87ZRiAwU7qzBDunAQVigk8CRYrrsI6DRQclVrHke
         fm+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W3I3kTVK;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d38e0b385fsi933702585a.519.2025.06.11.01.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W3I3kTVK;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749632082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=riYHadBKgFoUvYxgALKaU9VuI1UsfsdISOigZNurVKM=;
	b=W3I3kTVKedkK8pELg8R2iGhAu5j1Ix//Hq14VNu37iTtO7zbGG1PElcnd32VUE1aBpvk6+
	xd9Dz3RpFGxAcefmb859rfFKmPCQOICPfHNzl6iE0PY6zNpIJb7Mv0Dk5pCQ7O5qqItszn
	bUhJ74/hqClrlWfdiVqyJM+F3F+tVMM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-_VtzGwSdMH2Bzy0uV5HIug-1; Wed, 11 Jun 2025 04:54:41 -0400
X-MC-Unique: _VtzGwSdMH2Bzy0uV5HIug-1
X-Mimecast-MFC-AGG-ID: _VtzGwSdMH2Bzy0uV5HIug_1749632080
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704d22so20189325e9.2
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 01:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632080; x=1750236880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VNPHcpveAHPs/wj1NvQzKvutZKewV0gpTtxETRjrwk=;
        b=glG45RJaqO6z6n94LSJwfTf01lT5/0wFo06eoc3Ke2BSkj+/GDGOquGxmSExjgqdOW
         IeMTmzmZXaOWaqMX8AhjCF9sPi7ezFaocSNd6CfndGPXSPzP0BGKB4PSY4ML++WGrusY
         dxzSiM3/3fnD1UMS7MCsfu+fS/1IkSp733zGx+eUyd8UKyaci2T5VSNlZFDrlL3rFkbP
         4nI7WmVJYxcaaf1eFHvrXefA5gE8vr61QBVY0LQmY3sRbskRY3F/7T86yFsaKnZOekxM
         CqpvpYAtxu3dQRXda80pKhXK84msArVBPQ+S8+JOX3XDwPRKXkWodLUzTWj1AADDbLfv
         6xLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfZOlfTTtIQcHKveFjG4/gJqV4rvxGxNlJmmLQd6d60K1QYSfe0pabEqssh+ueN7fOXGEMESk2T78qmQ==@linaro.org
X-Gm-Message-State: AOJu0Yzvk5UC7HIPZe+FY7lkQk9TxCMWHle2g9PGqubpClYb6/8eCZcN
	Dib+TdBJWGbl9qW8WXjFOcr8wiYQdK/N+6BwAp/U1K02AkQzuN36gQMRbH03gQjFW7Lin/yIyKj
	Ao2riajk7Ta6woLcfEnBJS0RsKdJtOvx+fhuv0BSccJpPggzQuVXLdJ0v1w==
X-Gm-Gg: ASbGncsosQMqpWcZ9XikI/iPdi6sFt33m5r28W+nUq8K/fAEzcMWWcvI79gwBaMZ/OT
	dpOql2DWIhUII47QJvIWDBdQ+39c/J5MJgXCC1LQDe+Q9RGH2/Ublrr1c/X8kM7q8B3F0m7VsbY
	JPlLwjwsD9g5psjmiuvE8ZW1Om2tE8xovCSAQXGNWfhM1DYqVnLvirWE764EtJquWh/95yr6QL/
	Sp9RGHp5kNlVBFl1PoaJk6UQt5tdYpCJ3ThKfxpXndhyMnIeH4S+EZrilT7yXVKkbJB1csfpaOp
	8YaWdty/GepBUa4kmt0KHh2Md54wtm0PPb03Uojhrao=
X-Received: by 2002:a05:600c:8214:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-453248e805cmr18882925e9.29.1749632079624;
        Wed, 11 Jun 2025 01:54:39 -0700 (PDT)
X-Received: by 2002:a05:600c:8214:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-453248e805cmr18882505e9.29.1749632079146;
        Wed, 11 Jun 2025 01:54:39 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453251b38ecsm14434145e9.39.2025.06.11.01.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:54:38 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:54:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: Re: [PATCH v2 24/25] tests/qtest/bios-tables-test: Keep ACPI PCI
 hotplug off
Message-ID: <20250611105437.5ecda7c9@imammedo.users.ipa.redhat.com>
In-Reply-To: <e3bc87d8-5016-455e-933d-6cefae993c25@linaro.org>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-25-eric.auger@redhat.com>
	<20250528113813.47086516@imammedo.users.ipa.redhat.com>
	<375cfbd6-e585-4b6d-bf10-6571aa40370e@linaro.org>
	<20250528150239.5f6b63d0@imammedo.users.ipa.redhat.com>
	<6a5776b4-73ef-427b-b4e4-b25031b0ce53@linaro.org>
	<20250530135103.09030cf0@imammedo.users.ipa.redhat.com>
	<bcc200fb-fa45-44ac-9e36-4c829becbf1c@linaro.org>
	<e3bc87d8-5016-455e-933d-6cefae993c25@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qo955KgOEtDQL4oVCP-hu_C-S2WZ0mXXySeFwzAw8IQ_1749632080
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Kltr3JEn2prO

On Tue, 10 Jun 2025 11:29:02 -0300
Gustavo Romero <gustavo.romero@linaro.org> wrote:

> Hi Igor,
>=20
> On 6/2/25 03:06, Gustavo Romero wrote:
> > Hi Igor and Eric,
> >=20
> > I'm sending again this to the mailing list since it seems the first one
> > got lost... I can't find it either in qemu-devel@ or in qemu-arm@ :(
> >=20
> > On 5/30/25 08:51, Igor Mammedov wrote: =20
> >> On Wed, 28 May 2025 12:04:26 -0300
> >> Gustavo Romero <gustavo.romero@linaro.org> wrote:
> >> =20
> >>> Hi Igor,
> >>>
> >>> On 5/28/25 10:02, Igor Mammedov wrote: =20
> >>>> On Wed, 28 May 2025 09:41:15 -0300
> >>>> Gustavo Romero <gustavo.romero@linaro.org> wrote: =20
> >>>>> Hi Igor,
> >>>>>
> >>>>> On 5/28/25 06:38, Igor Mammedov wrote: =20
> >>>>>> On Tue, 27 May 2025 09:40:26 +0200
> >>>>>> Eric Auger <eric.auger@redhat.com> wrote: =20
> >>>>>>> From: Gustavo Romero <gustavo.romero@linaro.org>
> >>>>>>>
> >>>>>>> ACPI PCI hotplug is now turned on by default so we need to change=
 the
> >>>>>>> existing tests to keep it off. However, even setting the ACPI PCI
> >>>>>>> hotplug off in the existing tests, there will be changes in the A=
CPI
> >>>>>>> tables because the _OSC method was modified, hence in the next pa=
tch of
> >>>>>>> this series the blobs are updated accordingly.
> >>>>>>>
> >>>>>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> >>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com> =20
> >>>>>>
> >>>>>> it would be better to test whatever default we end up with.
> >>>>>> (like x86) =20
> >>>>>
> >>>>> hmm maybe there is a confusion here, Igor. We are actually planning=
 what you =20
> >>>>
> >>>> perhaps, see my reply to Eric about my expectations wrt tests. =20
> >>>
> >>> Yip, I read it before my reply here.
> >>>
> >>> =20
> >>>> (i.e. default tests shouldn't have any explicit CLI options,
> >>>> instead it should follow whitelist blobs/set new default patch/updat=
e blobs pattern) =20
> >>>
> >>> I see. I agree with that. But this patch is not about the new test. T=
he new test is
> >>> _not_ in this series. Patches 8/25, 10/25, and 24/25 are _not_ about =
the new test but
> >>> about adapting the _legacy tests_ (native acpi) to the situation when=
 ACPI HP becomes
> >>> the default, because this series makes acpi-pcihp=3Don the default, h=
ence the CLI option
> >>> "acpi-pcihp=3Doff" added to them. An update to the blobs are also nec=
essary because of the
> >>> change in _OSC method, even when acpi-pcihp=3Doff.
> >>>
> >>> =20
> >>>>> said. This patch and the other two in this series related to the bi=
os-tables-test
> >>>>> (i.e., patches 8/25 and 10/25) are for actually making the current =
(legacy) test pass,
> >>>>> since the new default as per this series will be acpi-pcihp=3Don. T=
hat's why here we're
> >>>>> adapting the current test here to have acpi-pcihp=3Doff.
> >>>>>
> >>>>> The new test that will test for acpi-pcihp=3Don (the new default) i=
s not in this series
> >>>>> and we decided to merge it separate. It's in the patch 4/5 and 5/5 =
of the follow series: =20
> >>>
> >>> We're doing the "blobs/set new default patch/update blobs pattern" in=
 the new test, which
> >>> we can merge later, once this series is merged, no? The step "set new=
 default" then will
> >>> not be necessary because the new test will be merged separate, after =
this series, so when
> >>> acpi-pcihp=3Don is already the default.
> >>>
> >>> Please note that although we're using acpi-pcihp=3Don in the new test=
, it's not necessary,
> >>> we can dropped this option, making it implicit as you say, and it wil=
l work. This is the
> >>> new test:
> >>> =20
> >>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html =
4/5
> >>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html =
5/5 =20
> >>>
> >>>
> >>> Thus, there are to "acts" of modifying the bios-tables-test:
> >>>
> >>> 1) Adapt the current tests to when acpi-pcihp=3Don becomes the defaul=
t (hence the addition
> >>> =C2=A0=C2=A0=C2=A0=C2=A0 to them of "acpi-pcihp=3Doff". =20
> >>
> >>
> >> that's what I disagree with.
> >>
> >> 1) Instead adapting majority of tests to legacy before switching defau=
lts,
> >> just do whitelist/modify default/update so all of tests run with new d=
efault.
> >>
> >> and then
> >> =20
> >>> There is also the need to update the blobs, but it's because
> >>> =C2=A0=C2=A0=C2=A0=C2=A0 of the _OSC method change in DSDT table, whi=
ch will change anyways, even with "acpi-pcihp=3Doff=C2=A8,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0 hence the need for patch 10/25 in this serie=
s. This is _done is this series_. =20
> >>
> >> =20
> >>> 2) Add a new test for testing the default (i.e. acpi-pcihp-on). It fo=
llows what you're
> >>> =C2=A0=C2=A0=C2=A0=C2=A0 saying above: "follow whitelist blobs/set ne=
w default patch/update blobs pattern",
> >>> =C2=A0=C2=A0=C2=A0=C2=A0 because we can drop the acpi-pcihp-on option=
 from the CLI in this test without any
> >>> =C2=A0=C2=A0=C2=A0=C2=A0 prejudice to test. While the step "set new d=
efault patch" was actually done in 1). =20
> >>
> >> 2) add a separate test case for native pcie hoplug (preferably within =
this series)
> >>
> >> 3) even better would be to add #2 before #1 (right after 10/25),
> >> this way will guarantee that old native hotplug tables stay
> >> the same regardless of followup patches that add ACPI pcihp aml. =20
> >=20
> > Got it now, hopefully... =F0=9F=99=82
> >=20
> > OK, I'm trying to follow what you recommended in 3). I've pushed a seri=
es to:
> >=20
> > https://github.com/gromero/qemu/commits/v2_20250527_eric_auger_redhat_c=
om/
> >=20
> > So, I understand we will need to add/update the blobs at three times,
> > 2 times because of the changes in the DSDT generation (_OSC changes and=
 when
> > acpi-pci=3Don) and an additional one because of the new PCIe native hot=
plug test.
> >=20
> > I dropped this patch (Patch 24/25) from the series.
> >=20
> > So the overview of the organization would be the following:
> >=20
> >=20
> > 3c302f7222 tests/qtest/bios-tables-test: Update DSDT blobs=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #1c (update blob)=C2=A0=C2=A0=C2=
=A0 \
> > 671f15f470 hw/arm/virt: Use ACPI PCI hotplug by default=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #1b (modify defau=
lt) |--- acpi-pcihp=3Don
> > 9468f730e1 tests/qtest/bios-tables-test: Prepare for changes in the DSD=
T table=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 #1a (whitelist)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /
> > c9ec0e0226 hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks
> > dc44749a34 hw/arm/virt: Let virt support pci hotplug/unplug GED event
> > f667079260 hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
> > 46731e563b hw/acpi/ged: Support migration of AcpiPciHpState
> > 4fa7b0e0f6 hw/acpi/ged: Call pcihp plug callbacks in hotplug handler im=
plementation
> > 587b001876 hw/acpi/ged: Prepare the device to react to PCI hotplug even=
ts
> > b55183d128 hw/arm/virt-acpi-build: Modify the DSDT ACPI table to enable=
 ACPI PCI hotplug
> > fe4c96b384 hw/i386/acpi-build: Move aml_pci_edsm to a generic place
> > 010c50dbc7 hw/i386/acpi-build: Introduce and use acpi_get_pci_host
> > 5a1be727e6 hw/i386/acpi-build: Move build_append_pci_bus_devices/pcihp_=
slots to pcihp
> > 14a172e192 hw/i386/acpi-build: Move build_append_notification_callback =
to pcihp
> > 5110ae8874 hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_h=
otplug
> > 82c2aef672 hw/i386/acpi-build: Introduce build_append_pcihp_resources()=
 helper
> > 6372fe7eef qtest/bios-tables-test: Update DSDT 'noacpipcihp' variant bl=
ob=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #2 (blob update for test), part =
2 of 2 (update blob)=C2=A0 ]--- New PCIe native test
> > 6fb29ba18d tests/qtest/bios-tables-test: Add aarch64 PCIe native hotplu=
g test=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 #2 (pcie native hp test), part 1 of 2 (whitelist)=C2=
=A0=C2=A0=C2=A0=C2=A0 /
> > 12c63a505e tests/qtest/bios-tables-test: Update DSDT blobs after GPEX _=
OSC change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Patch 10/25 in this series (update blob)=C2=A0=C2=A0=C2=A0 \
> > 779bd47749 hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Patch=C2=A0 9/25 =
in this series (modify default) |--- _OSC change
> > f260fd59c1 tests/qtest/bios-tables-test: Prepare for changes in the DSD=
T table=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Patch=C2=A0 8/25 in this series (whitelist)=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /
> > b000677fd9 hw/i386/acpi-build: Turn build_q35_osc_method into a generic=
 method
> > a72f87b634 hw/pci-host/gpex-acpi: Propagate hotplug type info from virt=
 machine downto gpex
> > 77a87b6ba3 hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generat=
ion
> > 67e4dc2e7b hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to acpi_ds=
dt_add_pci_osc
> > b89e69da54 hw/acpi: Rename and move build_x86_acpi_pci_hotplug to pcihp
> > 74f1080a74 hw/arm/virt: Introduce machine state acpi pcihp flags and pr=
ops
> > 1048082f33 hw/i386/acpi-build: Make aml_pci_device_dsm() static
> >=20
> > See notes on the right for when the blobs are updated or added in the
> > series. The new test for PCIe native hotplug (I prefer not calling it l=
egacy,
> > since it's not really legacy; it's just an alternative better in some s=
cenarios,
> > specially in virtualization) is now in the series (#2), "right after 10=
/25".
> >=20
> > Is something like that that you want? =20
>=20
> Igor, just a friendly ping on it. It would be quite helpful for us if you=
 could
> confirm I'm following what you recommended regarding the tests for this s=
eries.

spirit of above looks fine,
as for actual patches, it would depend on chosen default.
Lets' see what submitted v3 would look like.=20

>=20
>=20
> Thanks,
> Gustavo
>  =20
> >=20
> > Cheers,
> > Gustavo
> >  =20
> >> =20
> >>> Cheers,
> >>> Gustavo
> >>> =20
> >>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html =
4/5
> >>>>> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html =
5/5
> >>>>>
> >>>>>
> >>>>> Cheers,
> >>>>> Gustavo =20
> >>>>>>>
> >>>>>>> ---
> >>>>>>>
> >>>>>>> [Eric] also added acpi-pcihp=3Doff to test_acpi_aarch64_virt_tcg_=
numamem
> >>>>>>> ---
> >>>>>>> =C2=A0=C2=A0=C2=A0 tests/qtest/bios-tables-test.c | 13 +++++++++-=
---
> >>>>>>> =C2=A0=C2=A0=C2=A0 1 file changed, 9 insertions(+), 4 deletions(-=
)
> >>>>>>>
> >>>>>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-ta=
bles-test.c
> >>>>>>> index 0a333ec435..6379dba714 100644
> >>>>>>> --- a/tests/qtest/bios-tables-test.c
> >>>>>>> +++ b/tests/qtest/bios-tables-test.c
> >>>>>>> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memh=
p(void)
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.variant =3D ".mem=
hp";
> >>>>>>> -=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine nvdimm=3Don"
> >>>>>>> +=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine nvdimm=3Don,acpi-pci=
hp=3Doff"
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -cpu cort=
ex-a57"
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -m 256M,s=
lots=3D3,maxmem=3D1G"
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -object m=
emory-backend-ram,id=3Dram0,size=3D128M"
> >>>>>>> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numa=
mem(void)
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.variant =3D ".num=
amem";
> >>>>>>> -=C2=A0=C2=A0=C2=A0 test_acpi_one(" -cpu cortex-a57"
> >>>>>>> +=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine acpi-pcihp=3Doff"
> >>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -cpu cortex-a57"
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -object m=
emory-backend-ram,id=3Dram0,size=3D128M"
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -numa nod=
e,memdev=3Dram0",
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &data);
> >>>>>>> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(=
void)
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * to solve the c=
onflicts.
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.variant =3D ".pxb=
";
> >>>>>>> -=C2=A0=C2=A0=C2=A0 test_acpi_one(" -device pcie-root-port,chassi=
s=3D1,id=3Dpci.1"
> >>>>>>> +=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine acpi-pcihp=3Doff"
> >>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -device pcie-root-port,chassis=3D=
1,id=3Dpci.1"
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -device v=
irtio-scsi-pci,id=3Dscsi0,bus=3Dpci.1"
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -drive fi=
le=3D"
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "tests/data=
/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2,"
> >>>>>>> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi=
_hmat(void)
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.variant =3D ".acp=
ihmatvirt";
> >>>>>>> -=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine hmat=3Don"
> >>>>>>> +=C2=A0=C2=A0=C2=A0 test_acpi_one(" -machine hmat=3Don,acpi-pcihp=
=3Doff"
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -cpu cort=
ex-a57"
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -smp 4,so=
ckets=3D2"
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 " -m 384M"
> >>>>>>> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void=
)
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.smbios_cpu_max_sp=
eed =3D 2900;
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data.smbios_cpu_curr_s=
peed =3D 2700;
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_acpi_one("-cpu co=
rtex-a57 "
> >>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-machine acpi-pcihp=3Doff "
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-smbios ty=
pe=3D4,max-speed=3D2900,current-speed=3D2700", &data);
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_test_data(&data);
> >>>>>>> =C2=A0=C2=A0=C2=A0 }
> >>>>>>> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topo=
logy(void)
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_acpi_one("-cpu co=
rtex-a57 "
> >>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-machine acpi-pcihp=3Doff "
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-smp socke=
ts=3D1,clusters=3D2,cores=3D2,threads=3D2", &data);
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_test_data(&data);
> >>>>>>> =C2=A0=C2=A0=C2=A0 }
> >>>>>>> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(voi=
d)
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_acpi_one("-cpu co=
rtex-a57 "
> >>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-machine acpi-pcihp=3Doff "
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "-device vi=
rtio-iommu-pci", &data);
> >>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_test_data(&data);
> >>>>>>> =C2=A0=C2=A0=C2=A0 } =20
> >>> =20
> >> =20
> >  =20
>=20
