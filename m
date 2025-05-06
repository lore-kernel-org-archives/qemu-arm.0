Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3205198njj;
        Tue, 6 May 2025 08:36:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXbAkMDIu1yqvGlqTpiePvZ0DDoqJyjR8OOwa9dy3Y9BE9QYBH+rl0Din19GQ7UDddtyp4YUsDlH60KBg==@linaro.org
X-Google-Smtp-Source: AGHT+IE9adFwmlu8gDfIENQjd4mO6/BoQv25oM3lvKf+rY/MAaNlVlxAThQfiKpuq+SupHNvXtgu
X-Received: by 2002:a05:622a:110a:b0:48d:50eb:91ca with SMTP id d75a77b69052e-4910c48af1emr48672901cf.15.1746545809739;
        Tue, 06 May 2025 08:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746545809; cv=none;
        d=google.com; s=arc-20240605;
        b=hhaL0OExJxyz/oaS+4HdxmFBsEbjNALY5Y6JHVjpSyVb91h/0mX8TcXeIz03ZWB746
         oipmRbUTbDENJ7fBuiHG89WCFgbCr2sO7jo8ybNjHjzCLhTawS5ODHZ3IPnUfseXW/ho
         3kAWPCRac4nbKXx3CI3ScOhHcGDcq1P8FaoiZoa5sZB7hqvzGiPLFQKJmKHWD2eInmYi
         qGST3DisfH0/b+Q3mxykvIcyrx8hNeB2YLSUc3BVKqRPqlDGyKUdTpwKUzMOee2pYafG
         0WC8K2i19UUWu79HYUK7Kr93ixnZn4AvpuxemcwGu1yTK8uQsPvgZfcdIhCThB7Wv4ex
         NQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=Dv1ca977orropaWFbDUJ4JxDj78h02W4h5heJrt0XzU=;
        fh=2f05hq84145YObAYqrfZh4KdVQsbMA3Mj67wfUNbysQ=;
        b=iDh1HunmeR+ktZW08JuZH1IT73uIytSm6pxpjhXxCWWq72P8z7+ETJm/aq+HHGutD4
         o6HV98nkUUiQCzRh1dSGrOxGZv14hXPS45Br3yLGhPhFuDqNjs6H+n38TYHR/JntCxPH
         vt5pXH2SFAkXWekG9i7TRBxvZO7OyhVtjMJIZrGqRQgw8BYC0SB7W7IdZXMbUV+So319
         U6JKNijAByKjcdM8DowS5vz5J3SE3vfcZywlE3q+l4Ztzqg+b1USpUfSZPN5xZwboGx7
         1hYMDm9PcZlvpSoy03ONEKdBqP02yEnt5ttHPMV/7FfTrb+Ypu0ve6uPdDD59deCQJsd
         svKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gpPtKmmk;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-48b98e08e93si119547991cf.589.2025.05.06.08.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gpPtKmmk;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746545807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dv1ca977orropaWFbDUJ4JxDj78h02W4h5heJrt0XzU=;
	b=gpPtKmmkALvN4sFEnxyZHzCBtG2CZEgZVwXO8m9sheCCZCbmWb8+r5BPVPiqpS6lNYXj6d
	ynCXMKpub95VDU8dDRMs5ROTluoydRLKQyArYJx6vgLRMXfKITvHwGrIjF8cogFCEcLFF9
	G+rLKwO2LUeyXD+DwGitV+Kqle5XlWE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-UdLh-TqWMUqAjbfMind4eg-1; Tue, 06 May 2025 11:36:46 -0400
X-MC-Unique: UdLh-TqWMUqAjbfMind4eg-1
X-Mimecast-MFC-AGG-ID: UdLh-TqWMUqAjbfMind4eg_1746545805
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so32350695e9.0
        for <alex.bennee@linaro.org>; Tue, 06 May 2025 08:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746545805; x=1747150605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nATGfPBc00hA6hE52Ziq/xoTNYj7zVigR5hNbi4ZnA8=;
        b=qciXTtXLgUIuKVDF9Fkgo7Pkj9BSk9MWi3hO49jexXXt6vMr8OA3PGE4CPylA0TYsF
         G83FVEj6LvXBEDYVY5/oxcDOiRN+Ujwd09oZ+hX3uMn6ZdZgcnsx5+YIRtNoVZk9UgIN
         h3olXPUPuNlAT4YYWu2dfxgeZSESQ6etky8ypHqDHVKuGzVxmlqWb5x9MbieGDXnVPq1
         6Lh4lVreG/8b/xF5xQ6CDhLnLHapkzkDMrkfbGMhv9bAjktbaDabbXIKU157zVniTBuB
         efOzeB8JqLY+n44Bs/65L3e7UkQFSU8MwuqaEh/2Xp1QxaSVjgsgMwAT/Bd8GgJC/W9i
         albQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxja7rELuyCX8zRkxuBwb+PC4Zkc+jtyYSY9vrzeaQ/sjLk5ykdKEwRrccrwa4XiKlRicjzPjw3Pev+A==@linaro.org
X-Gm-Message-State: AOJu0YzQ/geJTRpNoQ7w8xqijCEcT4ngSk6lC41oeLtR7qSYkW5E626o
	Dsi9Cup85HyVQaP+CDmFBWDujUuEm15Bjc1N2BLHZvr7pINz6QYW3m/JJe5avgbMoYlcwreiL9g
	pPwd8Qc8sbptf8WlU+E2J/mFD5t+vsL+Bx4ZfOiTZ1tWBQLNxWQ/iNA==
X-Gm-Gg: ASbGnctQnFzIFraE/ZRjzk40BlFGNr6r4elMJhTmOZhzt09QcScN4RbdaHs7GhjoOpr
	B/EUau+uAEAK4ssoO2SHAcnMlSQRXt9dkYeCJtUa0M8B6qSQWgu6XuHCcmiL1nkdnDrlSf9jSgl
	pX0ML7SMYD53r/mH2jubayL0dArysEc9+glcYZ0j9q3ixx090Zs6lBp8KzrnSOBseJY5Wk9xIo9
	4r02Njfb6dSfrbK8SLwyQjmU803VdXNBz8Hz16xXtYb1NlDpiyhGRlw+ngCGPDnVUnkd2+IA9Vl
	jd5eW0JKackF+XJBXAPxJU3MN/Oy4oP8
X-Received: by 2002:a05:600c:698e:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-441d357bc50mr9792305e9.31.1746545805249;
        Tue, 06 May 2025 08:36:45 -0700 (PDT)
X-Received: by 2002:a05:600c:698e:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-441d357bc50mr9792035e9.31.1746545804852;
        Tue, 06 May 2025 08:36:44 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441c0dfc537sm127699125e9.16.2025.05.06.08.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:36:44 -0700 (PDT)
Date: Tue, 6 May 2025 17:36:40 +0200
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
Message-ID: <20250506173640.5ed03a16@imammedo.users.ipa.redhat.com>
In-Reply-To: <ec5cec94-4d02-442e-94e6-c0c2e79f3684@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
	<20250403204029.47958-7-philmd@linaro.org>
	<671a6c82-ae10-4f3b-9d83-cecc32755206@linaro.org>
	<20250409160531.341c205e@imammedo.users.ipa.redhat.com>
	<98b2676d-ad21-4c05-a165-12ae5e1b9c64@linaro.org>
	<20250410085042.6aa5593d@imammedo.users.ipa.redhat.com>
	<ec5cec94-4d02-442e-94e6-c0c2e79f3684@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i7i1YuEfWMehAb_A8jg7LsUpMYUI4LqGkOEjj5sZv7I_1746545805
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: HVdY4p8KShr2

On Thu, 10 Apr 2025 13:22:06 -0300
Gustavo Romero <gustavo.romero@linaro.org> wrote:

> Hi Igor,
>=20
> On 4/10/25 03:50, Igor Mammedov wrote:
> > On Wed, 9 Apr 2025 12:49:36 -0300
> > Gustavo Romero <gustavo.romero@linaro.org> wrote:
> >  =20
> >> Hi Igor,
> >>
> >> On 4/9/25 11:05, Igor Mammedov wrote: =20
> >>> On Fri, 4 Apr 2025 00:01:22 -0300
> >>> Gustavo Romero <gustavo.romero@linaro.org> wrote:
> >>>     =20
> >>>> Hi Phil,
> >>>>
> >>>> On 4/3/25 17:40, Philippe Mathieu-Daud=C3=A9 wrote: =20
> >>>>> We are going to fix the test_acpi_aarch64_virt_tcg_its_off()
> >>>>> test. In preparation, copy the ACPI tables which will be
> >>>>> altered as 'its_off' variants, and whitelist them.
> >>>>>
> >>>>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> >>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >>>>> ---
> >>>>>     tests/qtest/bios-tables-test-allowed-diff.h |   3 +++
> >>>>>     tests/qtest/bios-tables-test.c              |   1 +
> >>>>>     tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 byte=
s
> >>>>>     tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 byte=
s
> >>>>>     tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 byte=
s
> >>>>>     5 files changed, 4 insertions(+)
> >>>>>     create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
> >>>>>     create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
> >>>>>     create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
> >>>>>
> >>>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qt=
est/bios-tables-test-allowed-diff.h
> >>>>> index dfb8523c8bf..3421dd5adf3 100644
> >>>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> >>>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> >>>>> @@ -1 +1,4 @@
> >>>>>     /* List of comma-separated changed AML files to ignore */
> >>>>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
> >>>>> +"tests/data/acpi/aarch64/virt/FACP.its_off",
> >>>>> +"tests/data/acpi/aarch64/virt/IORT.its_off", =20
> >>>>
> >>>> I think your first approach is the correct one: you add the blobs
> >>>> when adding the new test, so they would go into patch 5/9 in this se=
ries,
> >>>> making the test pass without adding anything to bios-tables-test-all=
owed-diff.h.
> >>>> Then in this patch only add the APIC.its_off table to the bios-table=
s-test-allowed-diff.h
> >>>> since that's the table that changes when the fix is in place, as you=
 did in: =20
> >>>
> >>> if APIC.its_off is the only one that's changing, but FACP/IORT blobs =
are the same
> >>> as suffix-less blobs, one can omit copying FACP/IORT as test harness =
will fallback
> >>> to suffix-less blob if the one with suffix isn't found. =20
> >>
> >> OK. Just clarifying and for the records, this is not the case for this=
 series
> >>
> >> =20
> >>> if blobs are different from defaults then create empty blobs and whit=
elist them in the same patch
> >>> then do your changes and then update blobs & wipeout withe list. =20
> >>
> >> Thanks for confirming it. That's what I suggested to Phil in my first =
review and what
> >> I understood from the prescription in bios-tables-test.c.
> >>
> >> However, on second thoughts, for this particular series, isn't it bett=
er to have the following commit sequence instead:
> >>
> >> 1) Add the new test and the new blobs that make the test pass, i.e. AP=
IC.suffix, FACP.suffix, and IORT.suffix (they are different than the defaul=
t suffix-less blobs) =20
> >=20
> > blobs should be a separate commit (that way it's easier for maintainer =
to rebase them,
> > if they clash during merge with some other change. =20
>=20
> I see. What is a bit confusing here is that the series consists in
> one blob addition act (for the new test) and one blob update/removal act =
(after the fix).
>=20
>=20
> >> 2) Whitelist only the APIC.suffix since that's the table that will cha=
nge with the fix
> >> 3) Add the fix (which changes the APIC table so a new APIC.suffix blob=
 is needed and also stops generating the IORT table, so no more IORT.suffix=
 blob is necessary)
> >> 4) Finally, update only the APIC.suffix blob and remove the IORT.suffi=
x blob and wipe out the whitelist
> >>
> >> This way:
> >>
> >> A) It's clear that only ACPI blob changed with the fix, because there =
is no addition of a FACP.suffix blob in 4) (it remains the same)
> >> B) It's clear that the IORT table is removed with the fix and is not r=
elevant anymore for the test =20
> >=20
> > I'd just mention it in commit log so  that later no one would wonder wh=
y we are adding and then removing tables
> >=20
> > As for the rest of suggestions, it looks fine to me. =20
>=20
> Well, 2) won't make sense anymore since APIC.suffix would be already in t=
he
> whitelist in the previous patch that added the empty blobs. Since there w=
on't
> be a commit that adds _only_ the APIC.suffix to the whitelist, in prepara=
tion
> for the fix, this info is "lost" in the series, even tho it's possible to
> mention in the commit message.
>=20
> Hence, what I think is not ideal from a maintainer's/reviewer's perspecti=
ve,
> is that in one commit all the blobs are updated/removed at once, which is
> confusing because the fix did not touch the FACP table (for instance) and
> this table is updated with APIC and with the removal of IORT, altogether,
> in the last commit.
>=20
> So, for this series, which adds new blobs and _also_ updates and removes =
some
> of them, how about the following organization:
>=20
> - Patch 1     : Add the new test, add the empty blobs *.suffix files, whi=
telist such a blobs
> - Patch 2     : Update the blobs in Patch 1 with the ones that make the n=
ew test pass and remove them from the whitelist
>=20
> - Patch 3     : Add the APIC.suffix blob to the whitelist (the table that=
 changes due to the fix)
> - Patch 4 - n : Fix(es)

3 is not bynanry so it can be folded into 4 or be a separate patch (either =
way works for me)

> - Patch (n+1) : Update the APIC.suffix blob, remove IORT.suffix blob, and=
 remove the APIC.suffix blob from the whitelist
>                * Add the APIC diff to the commit log
>                * Mention in the commit log that IORT.suffix is removed be=
cause IORT table is no long generated after the fix
>=20
> This way: a) no commit fails the test and b) blobs are added/updated/remo=
ved in separate commits
>=20
> What do you think?

LGTM

>=20
> Cheers,
> Gustavo
>=20
