Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp8201833njd;
        Wed, 9 Apr 2025 23:50:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbEi+zkeZJRpAFnM0s8NBjeEJ8z2mZDLKGqKHLbfurl6IF9BCyL5GuaXXK+GmC4dqbM3Buo8qBKsOBYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGvZPpIXecSfD51EGIYK4DZa3Tgb2MpuLTHm6243kEMIKBdVh72B/8mB9J0bEHBULTJCoM7
X-Received: by 2002:ac8:5989:0:b0:477:cb1:ab2a with SMTP id d75a77b69052e-4796cbb5912mr25068071cf.13.1744267849342;
        Wed, 09 Apr 2025 23:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744267849; cv=none;
        d=google.com; s=arc-20240605;
        b=XHOAVdk4YO5kvTgSSILJBmMHElTOMf+kqzewYpded3YoQ/v+V5Fe8heISgXB82UOfT
         fF9f9Z8pohBnL9JuhXXH/9d/6FZYfTr+qZBEKmOsuXFyiAiHMyE44nCjT8eeZtKXDF74
         DO56YoIxxnCap+d35RdGQPOzDIHEVOv3zG2aXjUqaXEklcTAVIq3jBBqpA3HW6GisT31
         1ADQiUjYmXE7iI1XMt1euPyJBrinWbqt1fLcz2uO/BueqMXZacc6VI6R2gI9sAhXAwLw
         AvlVi+acctnaKiOBO6Bwx5Zn4d2SbxO9qYjNsA0zP868pGitoB7dSDqBgFbmpgUG+4Sy
         /chg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=9xq+6ryzMsa583Rf6MUM7lr82WoeDQJ6LP4WIqsMoDc=;
        fh=ug9qOWQ8I4FyWPgHo6d8bCsvmL8yQOuHYDk3aNdtuO4=;
        b=iGDq6EsNhSsP2BEzjE4EnxSmoD3Mrnyd5X/SItX7sFNq9kzo57UzYmpEgSFpOa0PzU
         AM4V9RPyta7GrdjJC2n6a2AW1YCp2YkdaNywkJpMPFNzhj2H1Ypt5Tg3+5XKCJnFhHBz
         zuRsHUYgNEqHOTArtmhi3+KI+cANyWnqiGkrnBmlQykl9kZr2oLBNGuPp8zZUl5Y7nzc
         BeJtJZzZrNArRExGQ7YCpC65OYkRBEuSg4MS5MlRw57caVIlyBh6SL92noAgZ7c0uhy2
         ep100sS5TAcNry57UbCfMDh5Jn61SBnTWjSV31mBXdWOINNaO5NF99YgdJUWDb09T+Q8
         ZR7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J9W623cu;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4796ee138a9si5264251cf.651.2025.04.09.23.50.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:50:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J9W623cu;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744267849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9xq+6ryzMsa583Rf6MUM7lr82WoeDQJ6LP4WIqsMoDc=;
	b=J9W623cuf+NyHRqRm+bvGYIGRBdT6J5CeYpGl7xZbT4gYIJROIuoZu8kXwGdfE7nVBZPKO
	V/tyieF29HXb1IE90mp8895v6e5hoZowrMZ1NDTtp5WlzjF9mYtBz7wp1fezXFoSDDV4FR
	yjoFN5vv2F1492O99gDNBidCJTevGh8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-FKuMGa4IPMqnDumipLoOew-1; Thu, 10 Apr 2025 02:50:45 -0400
X-MC-Unique: FKuMGa4IPMqnDumipLoOew-1
X-Mimecast-MFC-AGG-ID: FKuMGa4IPMqnDumipLoOew_1744267844
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39134c762ebso155640f8f.0
        for <alex.bennee@linaro.org>; Wed, 09 Apr 2025 23:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267844; x=1744872644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTm3jxIp5j55tgccKANvtb9WBAkFtdMn3VAIesopr4Q=;
        b=wA5l2sLsgcdw0S8A4Pf27DtM+iM1zNqDSkEZ69GWzMVoheCarYfeP5x4jWcAc4RAzU
         up8iHUvly14/BuW01xa4yBfYFAK8zjeQztVbFkowKNya8++COi4uZVQ8og0P8GReIOqI
         OsUhehtddGfzJwDq3uX70Py4nh6JJspExoz2jF3ckTHVv+fmMx5G286NeKD8k7uNa0oa
         l9LO60JYuRvtHqn13GBGaJHMPYh2GmO+tivUaBPCE1wBrvSKQnyybym6Rlg+tvUnptIi
         wLlsLq6/UHuFcOPEdJEOtXuy1lbhMSjADP4SCyfT3wob43nciQ13cXSHBAb2xgJLK6dJ
         3fxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQbdODdzGCZPmDkiGdjf1afQ3AEM5Ovlc/NzwRL8rrtHCZy0+OiCzOPBaZJL5cvVy+Qs2+pBps0wZ2aQ==@linaro.org
X-Gm-Message-State: AOJu0YydM9HcD7Fu2WBNNUPvKpQRI5nwrFzqth7APAhhEfM/HHTJpKFh
	WG3E/pZZlr04jMpN9ao66ifmMWA75CDLirV1joo+rFYKmwlPtLifpmNswA+e4mL3uPxiWdJjPfx
	oHo8o7oWs88Yv3gFxhaeUjcTByLX0lZrydaqahNAwXekQ/7eqtO1eQA==
X-Gm-Gg: ASbGncsgdpQ3P7ZXuJmgXm31qxyVkYULXcNU3Qr9DicV/AonJwEk0uDNKwPRrAWYUg+
	X0bbiUefxzSp9i2Nec7YPaHfKcsPT0glIkZ00B0vI0SPRGoIyfZDJfWN6zrCwTQ49ByAUwxA2eZ
	ROrHhTXRf7dLSBNkt431HWStnji1Khr+fY4mMtPcq9tGMuMsh6OCwZHUet1zUg5+xz2H0KPgo5j
	8SP7wOvBgX/Jx8gFQbuYT7JYLAO6jKcRELutbnZCqGBGPuRMg+uzh3ipzS5ij5H/yFybytHlVGM
	cmWLYu6HMJzNndXpjFYBokLle9o6qMkh
X-Received: by 2002:a5d:64e3:0:b0:39a:cc34:2f9b with SMTP id ffacd0b85a97d-39d8f469224mr1259014f8f.16.1744267844406;
        Wed, 09 Apr 2025 23:50:44 -0700 (PDT)
X-Received: by 2002:a5d:64e3:0:b0:39a:cc34:2f9b with SMTP id ffacd0b85a97d-39d8f469224mr1258991f8f.16.1744267844033;
        Wed, 09 Apr 2025 23:50:44 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893631b5sm3740705f8f.3.2025.04.09.23.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:50:43 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:50:42 +0200
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
Message-ID: <20250410085042.6aa5593d@imammedo.users.ipa.redhat.com>
In-Reply-To: <98b2676d-ad21-4c05-a165-12ae5e1b9c64@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
	<20250403204029.47958-7-philmd@linaro.org>
	<671a6c82-ae10-4f3b-9d83-cecc32755206@linaro.org>
	<20250409160531.341c205e@imammedo.users.ipa.redhat.com>
	<98b2676d-ad21-4c05-a165-12ae5e1b9c64@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6ORAZTrD__f93sUq-jCADy_Xsx47igaEERlVIDlW4gM_1744267844
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FSvsM9gZQ8fm

On Wed, 9 Apr 2025 12:49:36 -0300
Gustavo Romero <gustavo.romero@linaro.org> wrote:

> Hi Igor,
>=20
> On 4/9/25 11:05, Igor Mammedov wrote:
> > On Fri, 4 Apr 2025 00:01:22 -0300
> > Gustavo Romero <gustavo.romero@linaro.org> wrote:
> >  =20
> >> Hi Phil,
> >>
> >> On 4/3/25 17:40, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >>> We are going to fix the test_acpi_aarch64_virt_tcg_its_off()
> >>> test. In preparation, copy the ACPI tables which will be
> >>> altered as 'its_off' variants, and whitelist them.
> >>>
> >>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> >>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >>> ---
> >>>    tests/qtest/bios-tables-test-allowed-diff.h |   3 +++
> >>>    tests/qtest/bios-tables-test.c              |   1 +
> >>>    tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 bytes
> >>>    tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 bytes
> >>>    tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 bytes
> >>>    5 files changed, 4 insertions(+)
> >>>    create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
> >>>    create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
> >>>    create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
> >>>
> >>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtes=
t/bios-tables-test-allowed-diff.h
> >>> index dfb8523c8bf..3421dd5adf3 100644
> >>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> >>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> >>> @@ -1 +1,4 @@
> >>>    /* List of comma-separated changed AML files to ignore */
> >>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
> >>> +"tests/data/acpi/aarch64/virt/FACP.its_off",
> >>> +"tests/data/acpi/aarch64/virt/IORT.its_off", =20
> >>
> >> I think your first approach is the correct one: you add the blobs
> >> when adding the new test, so they would go into patch 5/9 in this seri=
es,
> >> making the test pass without adding anything to bios-tables-test-allow=
ed-diff.h.
> >> Then in this patch only add the APIC.its_off table to the bios-tables-=
test-allowed-diff.h
> >> since that's the table that changes when the fix is in place, as you d=
id in: =20
> >=20
> > if APIC.its_off is the only one that's changing, but FACP/IORT blobs ar=
e the same
> > as suffix-less blobs, one can omit copying FACP/IORT as test harness wi=
ll fallback
> > to suffix-less blob if the one with suffix isn't found. =20
>=20
> OK. Just clarifying and for the records, this is not the case for this se=
ries
>=20
>=20
> > if blobs are different from defaults then create empty blobs and whitel=
ist them in the same patch
> > then do your changes and then update blobs & wipeout withe list. =20
>=20
> Thanks for confirming it. That's what I suggested to Phil in my first rev=
iew and what
> I understood from the prescription in bios-tables-test.c.
>=20
> However, on second thoughts, for this particular series, isn't it better =
to have the following commit sequence instead:
>=20
> 1) Add the new test and the new blobs that make the test pass, i.e. APIC.=
suffix, FACP.suffix, and IORT.suffix (they are different than the default s=
uffix-less blobs)

blobs should be a separate commit (that way it's easier for maintainer to r=
ebase them,
if they clash during merge with some other change.

> 2) Whitelist only the APIC.suffix since that's the table that will change=
 with the fix
> 3) Add the fix (which changes the APIC table so a new APIC.suffix blob is=
 needed and also stops generating the IORT table, so no more IORT.suffix bl=
ob is necessary)
> 4) Finally, update only the APIC.suffix blob and remove the IORT.suffix b=
lob and wipe out the whitelist
>=20
> This way:
>=20
> A) It's clear that only ACPI blob changed with the fix, because there is =
no addition of a FACP.suffix blob in 4) (it remains the same)
> B) It's clear that the IORT table is removed with the fix and is not rele=
vant anymore for the test

I'd just mention it in commit log so  that later no one would wonder why we=
 are adding and then removing tables

As for the rest of suggestions, it looks fine to me.

>=20
> What do you think?
>=20
>=20
> Cheers,
> Gustavo
>=20
> > Phil,
> > the process is described in doc comment at the top of tests/qtest/bios-=
tables-test.c
> >  =20
> >> https://mail.gnu.org/archive/html/qemu-devel/2025-03/msg07082.html
> >>
> >> Plus, adding the blobs, which are actually related to the test in the =
other
> >> patch, and ignoring them at the same time looks confusing to me. I und=
erstand
> >> that only the blob that changes (APIC.its_off) with the fix should be =
temporarily
> >> ignored and, later, updated, as in your first series.
> >>
> >>
> >> Cheers,
> >> Gustavo
> >> =20
> >>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables=
-test.c
> >>> index baaf199e01c..55366bf4956 100644
> >>> --- a/tests/qtest/bios-tables-test.c
> >>> +++ b/tests/qtest/bios-tables-test.c
> >>> @@ -2151,6 +2151,7 @@ static void test_acpi_aarch64_virt_tcg_its_off(=
void)
> >>>        test_data data =3D {
> >>>            .machine =3D "virt",
> >>>            .arch =3D "aarch64",
> >>> +        .variant =3D ".its_off",
> >>>            .tcg_only =3D true,
> >>>            .uefi_fl1 =3D "pc-bios/edk2-aarch64-code.fd",
> >>>            .uefi_fl2 =3D "pc-bios/edk2-arm-vars.fd",
> >>> diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/a=
cpi/aarch64/virt/APIC.its_off
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..c37d05d6e05805304f10a=
fe73eb7cb9100fcccfa
> >>> GIT binary patch
> >>> literal 184
> >>> zcmZ<^@O0k6z`($=3D+{xeBBUr&HBEVSz2pEB4AU24G0Uik$i-7~iVgWL^17JJ`2AFzr
> >>> bgb+@aBn}xq0gwb2)Q)cq{30-g9B_L93G4|0
> >>>
> >>> literal 0
> >>> HcmV?d00001
> >>>
> >>> diff --git a/tests/data/acpi/aarch64/virt/FACP.its_off b/tests/data/a=
cpi/aarch64/virt/FACP.its_off
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..606dac3fe4b55c31fd68b=
25d3a4127eeef227434
> >>> GIT binary patch
> >>> literal 276 =20
> >>> zcmZ>BbPf<<WME(uaq@Te2v%^42yj*a0-z8Bhz+8t3j|P&V`N}P6&N^PpsQ~v$aVnZ =
=20
> >>> CVg~^L
> >>>
> >>> literal 0
> >>> HcmV?d00001
> >>>
> >>> diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/a=
cpi/aarch64/virt/IORT.its_off
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..0fceb820d509e852ca084=
9baf568a8e93e426738
> >>> GIT binary patch
> >>> literal 236
> >>> zcmebD4+?q1z`(#9?&R<65v<@85#X!<1dKp25F11@1F-=3DRgMkDCNC*yK9F_<M77!bR =
=20
> >>> zUBI%eoFED&4;F$FSwK1)h;xBB2Py`m{{M%tVD>TjFfcO#g+N#Zh@s|zoCF3AP#UU@ =
=20
> >>> R!2`+%Dg6Hr$N|zYvjDIZ5CH%H
> >>>
> >>> literal 0
> >>> HcmV?d00001
> >>>     =20
> >> =20
> >  =20
>=20
