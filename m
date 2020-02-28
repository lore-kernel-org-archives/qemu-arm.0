Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp363579lfg;
        Thu, 27 Feb 2020 23:47:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzwzvKAG4U53m1unD6zi0FNRc7egcKBNsBc/UBdjMV5nAFslkGriLu3rQC2qVOROnN0GpFj
X-Received: by 2002:a50:f787:: with SMTP id h7mr2817051edn.301.1582876057153;
        Thu, 27 Feb 2020 23:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582876057; cv=none;
        d=google.com; s=arc-20160816;
        b=UqToJkNAOvL1Ylkiy7AAR3pT6yt7zDm4Ld+FjmSGpulvcK+05YBS/O+Uv8/UzeBHU+
         O2O7BkdYIyifZn/WRVNpitwxuSNrFkWsN29u0LVWQzaudPD6oje6ffwmZQB97z83MjGa
         OXKw8yq7ZZf2tmHwsNbqGLYaWajkNmu2UwBLL+bGIjHA0gQcoxqX4M/cEdJTgtGBIOCP
         YUMlRT0Uu4hXnZ6Qi/CJw3JfXxlKNCLu1dGBcZKCNng5FGtY6o2oHxwkl8kOKJTzqMQB
         5qC9s1LZdAUbI9UORpLEyezVbeE6c1iuiaDk1hVlhqaJAUWvMBzGW025bKpo/MTTxL2N
         KMSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=a+D8DOie91iTmWTa82CCKy55oa4ppjpizVpeCrtHLaI=;
        b=AWwaE1pZww7yGUgFNl6Zftlp7EeO30b3mSuvLPvCdUdHI/CvAweKe7Jg2QrXm9/pjS
         aX3Gh3NHv/GgiUqHrCsxYLeptq1nqGQv3vK9muQmzEwCaym1UWTfHEjXfFgqbqe6ujiz
         SS694ZaImm7F28OIU4Tv86M9DTwceXrHRaIASh5rOiDqzmbzf4V5JM2yAQXPGOHR0pMU
         DwAjSanwJC2MY7wEF604RXx3EferZVj9BaWa3he2EafxBuo6vk/6FhNWzWsVWXSF5bA2
         oCpLsojsivoXadI3C5SjN8M35LxtOLNXCL3othJ2LDzhujPJ/OixwUJ/OjOxl6dTe0P8
         3f4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ye9gMgd5;
       spf=pass (google.com: domain of imammedo@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id be1si1283024edb.593.2020.02.27.23.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2020 23:47:37 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ye9gMgd5;
       spf=pass (google.com: domain of imammedo@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582876056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+D8DOie91iTmWTa82CCKy55oa4ppjpizVpeCrtHLaI=;
	b=Ye9gMgd5La25MEtlGkCnw1iIXfBJ0XedcCD9bUqs11oOsDEz1PhL+irxlqM/g2x0HEjF/y
	XEfSwdUV/navgPc8d3xVpOvKoN132aL9aScQq27JivDC6pKncUh1ys9IcFhqbKxE7BZtKi
	QOGJr4Np5ODRrui2b9arI/XkPivtcpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267--HuvCzA2PEKbsW-hwEAi9w-1; Fri, 28 Feb 2020 02:47:34 -0500
X-MC-Unique: -HuvCzA2PEKbsW-hwEAi9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04D1213E4;
	Fri, 28 Feb 2020 07:47:33 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CCB360C18;
	Fri, 28 Feb 2020 07:47:31 +0000 (UTC)
Date: Fri, 28 Feb 2020 08:47:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, QEMU Developers
 <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v1 4/4] accel/tcg: increase default code gen buffer size
 for 64 bit
Message-ID: <20200228084729.3bb8bf11@redhat.com>
In-Reply-To: <CAPan3WrSRm986EfwJdXV2MduNLE5BS+QmCv0Bo5-BD+QfT-=dg@mail.gmail.com>
References: <20200226181020.19592-1-alex.bennee@linaro.org>
	<20200226181020.19592-5-alex.bennee@linaro.org>
	<2ca7b55b-5674-370d-5c4d-dc8b7782ca64@linaro.org>
	<87pne0w6rt.fsf@linaro.org>
	<56f5e355-9357-e212-e92b-9db1d8424dea@linaro.org>
	<CAPan3WrSRm986EfwJdXV2MduNLE5BS+QmCv0Bo5-BD+QfT-=dg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0zH3/Rc/h9Hr

On Thu, 27 Feb 2020 20:07:24 +0100
Niek Linnenbank <nieklinnenbank@gmail.com> wrote:

> Hi Richard,
>=20
> On Thu, Feb 27, 2020 at 1:57 PM Richard Henderson <
> richard.henderson@linaro.org> wrote: =20
>=20
> > On 2/27/20 4:31 AM, Alex Benn=C3=A9e wrote: =20
> > >> It does not make sense for a linux-user chroot, running make -jN, on=
 =20
> > just about =20
> > >> any host.  For linux-user, I could be happy with a modest increase, =
but =20
> > not all =20
> > >> the way out to 2GiB.
> > >>
> > >> Discuss. =20
> > >
> > > Does it matter that much? Surely for small programs the kernel just
> > > never pages in the used portions of the mmap? =20
> >
> > That's why I used the example of a build under the chroot, because the
> > compiler
> > is not a small program.
> >
> > Consider when the memory *is* used, and N * 2GB implies lots of paging,
> > where
> > the previous N * 32MB did not.
> >
> > I agree that a lower default value probably is safer until we have more=
 =20
> proof that a larger value does not give any issues.
>=20
>=20
> > I'm saying that we should consider a setting more like 128MB or so, sin=
ce
> > the
> > value cannot be changed from the command-line, or through the environme=
nt.
> > =20
>=20
> Proposal: can we then introduce a new command line parameter for this?
> Maybe in a new patch?

linux-user currently uses 32Mb static buffer so it probably fine to
leave it as is or bump it to 128Mb regardless of the 32/64bit host.

for system emulation, we already have tb-size option to set user
specified buffer size.

Issue is with system emulation is that it sizes buffer to 1/4 of
ram_size and dependency on ram_size is what we are trying to get
rid of. If we consider unit/acceptance tests as main target/user,
then they mostly use default ram_size value which varies mostly
from 16Mb to 1Gb depending on the board. So used buffer size is
in 4-256Mb range.
Considering that current CI runs fine with max 256Mb buffer,
it might make sense to use it as new heuristic which would not
regress our test infrastructure and might improve performance
for boards where smaller default buffer was used.


> Since the size of the code generation buffer appears to have an impact on
> performance,
> in my opinion it would make sense to make it configurable by the user.
>=20
> Regards,
>=20
>=20
> >
> >
> > r~
> >
> > =20
>=20
