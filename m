Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1078443njh;
        Fri, 30 May 2025 04:51:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1Oi72OEhcl1l3RoeJsZiz0tHjHlINavfBeKCIMxlu4GLZkxkVtPtplN7sTUdYyC50D5YOtVaKdq/NbA==@linaro.org
X-Google-Smtp-Source: AGHT+IHYYKNh36BcrszA3obkisGcl9olC3r8E9sSO8zT+Z0Ao9oNy3Myp4DAaLkuqRHo+xlhuXpg
X-Received: by 2002:a05:6214:4009:b0:6f8:b4aa:2a4b with SMTP id 6a1803df08f44-6faced25219mr59993216d6.28.1748605868913;
        Fri, 30 May 2025 04:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748605868; cv=none;
        d=google.com; s=arc-20240605;
        b=BKFeoYxZ/BlxJtocglz/OXb39B92GWK8naLkpY130/bIfqqZ+6FyO7yPJeWRgFUUht
         yPyGQdHkhf5FAu3Ho7w7zyd3DucOBYSdIIysw+gSWvQ/RYqGnRNHJGLI4agZa//h1BS/
         fG+sgFmavsz1824/MWn3O979Mq3Ca3s4JdDfUtgxYTsuRLhFyLvHsVYutd+LFUezUL5+
         ILdkXJMA9UidLnvXkJJ27nRzCC/5Z8nn7eLvzICUUzswnBkOY1J/+xB1rpZwulwTudUu
         1hv7oElBFRHKC4TnAvFp5amyd/ySpTBB4cxtAU8PmpSeG9Ukxjrny3mnGccojWID+Jdx
         2jIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=UhUYDbmNv01y/3WS2Oe8VPugXGgwp0E4Cwty/4v4usE=;
        fh=XVL/p20TWxhH+aZqOz3VPUbYKsGaq+hCUG90OOjkIPU=;
        b=EfEfRjM2OJ5jnz5ICDt9n/bpsy0TsjlvXELn/QDMw9sRCV7/hsbmsojxpwX0CKtSRd
         fg3TA4SZtER7nOYI5cUQ5jZz0fdPItsD+spHEldTPnG2fF8KKaydqkv93yjhCvJOuIPx
         3Tq6UaUmG5Yxn5Vys55c8KRODNRQfK4DV+XdgAbhkYrE7L8exwbbxRH/boJvb/ucsze4
         wvQ9uqmSGi8rKMGvdl9R+1gPt9VX5fK+vmBtksHwJFspHNF+CpzoLu+FspGEHFvg0HEB
         9/ccY7nXzHmZrCtacwaxxNl8y0JN/ri0vJR+UTdC3JWB8JjO3XcsjxtNmU49SW3gSCvT
         E1jA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dXO3ACza;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6e59c2dsi35923546d6.201.2025.05.30.04.51.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:51:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dXO3ACza;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748605868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UhUYDbmNv01y/3WS2Oe8VPugXGgwp0E4Cwty/4v4usE=;
	b=dXO3ACzaP3vPL461Ly/ubZkq2LRDBMkUb9KXTW5Bh4Ofgjgo0idrVbP3UIh0mQTnvyhtWi
	uWP4ohoZQtrU5SSKdtxAy2i1VdYbE0yJkfHQMB9khBUICcsBgEbgoM7kIKlrc1vk2uuQYv
	0V9tdEgp27QSUDQXIifKIBOBSOCig+A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-AsfwXuIZOzqAJ6xIkhWD1A-1; Fri, 30 May 2025 07:51:07 -0400
X-MC-Unique: AsfwXuIZOzqAJ6xIkhWD1A-1
X-Mimecast-MFC-AGG-ID: AsfwXuIZOzqAJ6xIkhWD1A_1748605866
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a367b3bb78so1241934f8f.1
        for <alex.bennee@linaro.org>; Fri, 30 May 2025 04:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748605866; x=1749210666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKx9OfLEwrhrxYqaPx+nIo9gZomyutfo8mU8vnyRzRs=;
        b=QpfIiD8Wfj2kORGUTOkywBOzh7S7gtbbOS0XM+F1HFhb/j8RCHAGLZ0MLsnNlDlTmH
         QpIAyUr7iUy+WRhVuHbUAstc16AAO6MPWdJ+dtrk04VJD1V9U60PKDPJV3rzNV9ZMyYO
         YYRlt+b37kitFTwQYbcuUb+zk2raF6mkJ2j/s+E8IAA6ESElahOVdVz5Ze9pwjGWBM/z
         Pd9n/ss9XNWUXtIAlEq1r9D6yygPolF+I3fRFINUoIDEYPXFvF+pdxlpfio9f3qjU17n
         i5gMENzrvyOg835Ke4ByZFlvfA7OHPkLITRPijCKXlevC6RZNCztrnfwiJso0uOO+e8D
         5P1w==
X-Forwarded-Encrypted: i=1; AJvYcCWJFyVPHYbNO49kKv64MV8V2XQMT1WpfxCqot1O0Xq6HDvFrpAukD58mb82m5O71sFPMNdak65igAOw/A==@linaro.org
X-Gm-Message-State: AOJu0YzNmLZKk9TWBgmMxCgu9qsGTyRQqgOn6FztICeSCpgJarYkPrk/
	5bbsJoTV9V+98a65yPab6PZAcYfPVxL/ZAXNeHYkW4ZCjl8Mz8bGlNcdMiJTEhQCf7O4krAyQ6T
	zjRg9ntpMpQju8FgNiZPKilgvx8NzgnjEG4cMPkbKzglXIuROiJHPrjRKpg==
X-Gm-Gg: ASbGncthzRn53Hx3P9HjW2bGl1h+FIr7ifbdWfgOzqS0jCJr14l2A3KWNZcI7Z9RLV8
	+64wHkTh3CIkAPk/69PCZE+k72kSca8oK7jp8Tc9NG4i3dxTx4GuxlZMM7AyzuViTakndhP/5g+
	5FHyoVPpgpbZVB3XZK1WYVL63YztNMLtf3ebmuMVSRMyzp4arZZ9g95jvqQ3NSdeJkS12AMFUAu
	IdC9H2DdmY66//j5jvNEsUmDGbLp/7MwC+Lab1LmCD4Q5EV3K6p9y+Jvv5BZKfw9nKSZ47hUuzU
	/8/d4J3vsio2FwKwGlYjT4sBB9hN7SfWMx59rBMAFfQ=
X-Received: by 2002:a05:6000:2505:b0:3a3:7749:9783 with SMTP id ffacd0b85a97d-3a4f7ab14d0mr2429066f8f.51.1748605866128;
        Fri, 30 May 2025 04:51:06 -0700 (PDT)
X-Received: by 2002:a05:6000:2505:b0:3a3:7749:9783 with SMTP id ffacd0b85a97d-3a4f7ab14d0mr2429041f8f.51.1748605865644;
        Fri, 30 May 2025 04:51:05 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009752esm4618481f8f.74.2025.05.30.04.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:51:05 -0700 (PDT)
Date: Fri, 30 May 2025 13:51:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org,
 alex.bennee@linaro.org
Subject: Re: [PATCH v2 24/25] tests/qtest/bios-tables-test: Keep ACPI PCI
 hotplug off
Message-ID: <20250530135103.09030cf0@imammedo.users.ipa.redhat.com>
In-Reply-To: <6a5776b4-73ef-427b-b4e4-b25031b0ce53@linaro.org>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-25-eric.auger@redhat.com>
	<20250528113813.47086516@imammedo.users.ipa.redhat.com>
	<375cfbd6-e585-4b6d-bf10-6571aa40370e@linaro.org>
	<20250528150239.5f6b63d0@imammedo.users.ipa.redhat.com>
	<6a5776b4-73ef-427b-b4e4-b25031b0ce53@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hWqGqncI9y_hDPDBedscENEMpghFrfN1C6YFDUaM6NM_1748605866
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8+xaeUKYcYCB

On Wed, 28 May 2025 12:04:26 -0300
Gustavo Romero <gustavo.romero@linaro.org> wrote:

> Hi Igor,
>=20
> On 5/28/25 10:02, Igor Mammedov wrote:
> > On Wed, 28 May 2025 09:41:15 -0300
> > Gustavo Romero <gustavo.romero@linaro.org> wrote:
> >  =20
> >> Hi Igor,
> >>
> >> On 5/28/25 06:38, Igor Mammedov wrote: =20
> >>> On Tue, 27 May 2025 09:40:26 +0200
> >>> Eric Auger <eric.auger@redhat.com> wrote:
> >>>     =20
> >>>> From: Gustavo Romero <gustavo.romero@linaro.org>
> >>>>
> >>>> ACPI PCI hotplug is now turned on by default so we need to change th=
e
> >>>> existing tests to keep it off. However, even setting the ACPI PCI
> >>>> hotplug off in the existing tests, there will be changes in the ACPI
> >>>> tables because the _OSC method was modified, hence in the next patch=
 of
> >>>> this series the blobs are updated accordingly.
> >>>>
> >>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> >>>> Signed-off-by: Eric Auger <eric.auger@redhat.com> =20
> >>>
> >>> it would be better to test whatever default we end up with.
> >>> (like x86) =20
> >>
> >> hmm maybe there is a confusion here, Igor. We are actually planning wh=
at you =20
> >=20
> > perhaps, see my reply to Eric about my expectations wrt tests. =20
>=20
> Yip, I read it before my reply here.
>=20
>=20
> > (i.e. default tests shouldn't have any explicit CLI options,
> > instead it should follow whitelist blobs/set new default patch/update b=
lobs pattern) =20
>=20
> I see. I agree with that. But this patch is not about the new test. The n=
ew test is
> _not_ in this series. Patches 8/25, 10/25, and 24/25 are _not_ about the =
new test but
> about adapting the _legacy tests_ (native acpi) to the situation when ACP=
I HP becomes
> the default, because this series makes acpi-pcihp=3Don the default, hence=
 the CLI option
> "acpi-pcihp=3Doff" added to them. An update to the blobs are also necessa=
ry because of the
> change in _OSC method, even when acpi-pcihp=3Doff.
>=20
>=20
> >> said. This patch and the other two in this series related to the bios-=
tables-test
> >> (i.e., patches 8/25 and 10/25) are for actually making the current (le=
gacy) test pass,
> >> since the new default as per this series will be acpi-pcihp=3Don. That=
's why here we're
> >> adapting the current test here to have acpi-pcihp=3Doff.
> >>
> >> The new test that will test for acpi-pcihp=3Don (the new default) is n=
ot in this series
> >> and we decided to merge it separate. It's in the patch 4/5 and 5/5 of =
the follow series: =20
>=20
> We're doing the "blobs/set new default patch/update blobs pattern" in the=
 new test, which
> we can merge later, once this series is merged, no? The step "set new def=
ault" then will
> not be necessary because the new test will be merged separate, after this=
 series, so when
> acpi-pcihp=3Don is already the default.
>=20
> Please note that although we're using acpi-pcihp=3Don in the new test, it=
's not necessary,
> we can dropped this option, making it implicit as you say, and it will wo=
rk. This is the
> new test:
>=20
> >> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html 4/5
> >> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html 5/5=
 =20
>=20
>=20
> Thus, there are to "acts" of modifying the bios-tables-test:
>=20
> 1) Adapt the current tests to when acpi-pcihp=3Don becomes the default (h=
ence the addition
>     to them of "acpi-pcihp=3Doff".


that's what I disagree with.

1) Instead adapting majority of tests to legacy before switching defaults,
just do whitelist/modify default/update so all of tests run with new defaul=
t.

and then

> There is also the need to update the blobs, but it's because
>     of the _OSC method change in DSDT table, which will change anyways, e=
ven with "acpi-pcihp=3Doff=C2=A8,
>     hence the need for patch 10/25 in this series. This is _done is this =
series_.


=20
> 2) Add a new test for testing the default (i.e. acpi-pcihp-on). It follow=
s what you're
>     saying above: "follow whitelist blobs/set new default patch/update bl=
obs pattern",
>     because we can drop the acpi-pcihp-on option from the CLI in this tes=
t without any
>     prejudice to test. While the step "set new default patch" was actuall=
y done in 1).

2) add a separate test case for native pcie hoplug (preferably within this =
series)

3) even better would be to add #2 before #1 (right after 10/25),
this way will guarantee that old native hotplug tables stay
the same regardless of followup patches that add ACPI pcihp aml.


> Cheers,
> Gustavo
>=20
> >> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05828.html 4/5
> >> https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05827.html 5/5
> >>
> >>
> >> Cheers,
> >> Gustavo
> >> =20
> >>>>
> >>>> ---
> >>>>
> >>>> [Eric] also added acpi-pcihp=3Doff to test_acpi_aarch64_virt_tcg_num=
amem
> >>>> ---
> >>>>    tests/qtest/bios-tables-test.c | 13 +++++++++----
> >>>>    1 file changed, 9 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-table=
s-test.c
> >>>> index 0a333ec435..6379dba714 100644
> >>>> --- a/tests/qtest/bios-tables-test.c
> >>>> +++ b/tests/qtest/bios-tables-test.c
> >>>> @@ -1626,7 +1626,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(v=
oid)
> >>>>        };
> >>>>   =20
> >>>>        data.variant =3D ".memhp";
> >>>> -    test_acpi_one(" -machine nvdimm=3Don"
> >>>> +    test_acpi_one(" -machine nvdimm=3Don,acpi-pcihp=3Doff"
> >>>>                      " -cpu cortex-a57"
> >>>>                      " -m 256M,slots=3D3,maxmem=3D1G"
> >>>>                      " -object memory-backend-ram,id=3Dram0,size=3D1=
28M"
> >>>> @@ -1747,7 +1747,8 @@ static void test_acpi_aarch64_virt_tcg_numamem=
(void)
> >>>>        };
> >>>>   =20
> >>>>        data.variant =3D ".numamem";
> >>>> -    test_acpi_one(" -cpu cortex-a57"
> >>>> +    test_acpi_one(" -machine acpi-pcihp=3Doff"
> >>>> +                  " -cpu cortex-a57"
> >>>>                      " -object memory-backend-ram,id=3Dram0,size=3D1=
28M"
> >>>>                      " -numa node,memdev=3Dram0",
> >>>>                      &data);
> >>>> @@ -1775,7 +1776,8 @@ static void test_acpi_aarch64_virt_tcg_pxb(voi=
d)
> >>>>         * to solve the conflicts.
> >>>>         */
> >>>>        data.variant =3D ".pxb";
> >>>> -    test_acpi_one(" -device pcie-root-port,chassis=3D1,id=3Dpci.1"
> >>>> +    test_acpi_one(" -machine acpi-pcihp=3Doff"
> >>>> +                  " -device pcie-root-port,chassis=3D1,id=3Dpci.1"
> >>>>                      " -device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.=
1"
> >>>>                      " -drive file=3D"
> >>>>                      "tests/data/uefi-boot-images/bios-tables-test.a=
arch64.iso.qcow2,"
> >>>> @@ -1846,7 +1848,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hm=
at(void)
> >>>>   =20
> >>>>        data.variant =3D ".acpihmatvirt";
> >>>>   =20
> >>>> -    test_acpi_one(" -machine hmat=3Don"
> >>>> +    test_acpi_one(" -machine hmat=3Don,acpi-pcihp=3Doff"
> >>>>                      " -cpu cortex-a57"
> >>>>                      " -smp 4,sockets=3D2"
> >>>>                      " -m 384M"
> >>>> @@ -2123,6 +2125,7 @@ static void test_acpi_aarch64_virt_tcg(void)
> >>>>        data.smbios_cpu_max_speed =3D 2900;
> >>>>        data.smbios_cpu_curr_speed =3D 2700;
> >>>>        test_acpi_one("-cpu cortex-a57 "
> >>>> +                  "-machine acpi-pcihp=3Doff "
> >>>>                      "-smbios type=3D4,max-speed=3D2900,current-spee=
d=3D2700", &data);
> >>>>        free_test_data(&data);
> >>>>    }
> >>>> @@ -2142,6 +2145,7 @@ static void test_acpi_aarch64_virt_tcg_topolog=
y(void)
> >>>>        };
> >>>>   =20
> >>>>        test_acpi_one("-cpu cortex-a57 "
> >>>> +                  "-machine acpi-pcihp=3Doff "
> >>>>                      "-smp sockets=3D1,clusters=3D2,cores=3D2,thread=
s=3D2", &data);
> >>>>        free_test_data(&data);
> >>>>    }
> >>>> @@ -2227,6 +2231,7 @@ static void test_acpi_aarch64_virt_viot(void)
> >>>>        };
> >>>>   =20
> >>>>        test_acpi_one("-cpu cortex-a57 "
> >>>> +                  "-machine acpi-pcihp=3Doff "
> >>>>                      "-device virtio-iommu-pci", &data);
> >>>>        free_test_data(&data);
> >>>>    } =20
> >>>     =20
> >> =20
> >  =20
>=20
