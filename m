Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp373345wrh;
        Fri, 26 Apr 2019 02:17:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqykYaNPBB+p/zI8gnVOTuKPPSPmkv78xcEE+Yxg6SBr/bQ6PxdRkbP8+SvTs+vXKyBUdLc+
X-Received: by 2002:a37:b441:: with SMTP id d62mr15363719qkf.259.1556270229827;
        Fri, 26 Apr 2019 02:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556270229; cv=none;
        d=google.com; s=arc-20160816;
        b=DhB6mxi27KRlMgK4p9liVgnGWTiQzP9Gjb1+cAwB4XPCKauLtIabEUIU/oe1fakUaf
         BkUC5hrTDi1LJ5+eXOE0OPnRWuweabP04sLvvJpbL6ANokXufG2EuQgo8Dspv2rAEXKK
         HXBSinuMwKW7KNB3529KoL4KKDU2nNVEGR8JmW5Koob/fW0pNTWpVYAtFeQea4o8kEOo
         nKmjH6b0eouGaO1FWfq0I6cgztVHfLZbkEClQDsTN9ZZwCReH5VdwjSZJtD5Lnm3PWhO
         uz8ByxMz7K/W7a7hhE6jcJuLhOVmaraGN3ME0BqaZBbtDsP8AN8X7wuB15admoOwgW5Q
         J1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=WqxIJSJiH4/sw4d7C24Qkwpatobf77xcNVR8oEABn3c=;
        b=xODhelC4I6XJwhyAnqcjPPauGtReyfZJjbWexxnREM8vunRBcOvB2QA9eSQkTYPvcu
         IbTGXE5Q/i4yUzYqlsh0HBODpcZY3xXe/6hcnuwfm+nXf6IW3cCdyo2Uzvsl1I5WpA4q
         7tMZP6hhP6Uw8XS0UV8R82tbkgW/9EaFldDm8tafGHkYFi3RQWD6OB/3T8tFuy3YKRCQ
         Lyy2NXL20s1A/pG9goXqOjiKfRK8OK4StYCHFfWle0Z0ow5iMg3lMDhiFbSuKla8KE9b
         kqfxI6/4TGHQrh/7v5tw1d+/AweiVqZ7NOEQCgCY6nMXMYQsFqY2K3rg24vY3UdrgxF2
         3BWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h51si4841972qth.340.2019.04.26.02.17.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Apr 2019 02:17:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C73D83091761;
	Fri, 26 Apr 2019 09:17:08 +0000 (UTC)
Received: from localhost (ovpn-117-222.ams2.redhat.com [10.36.117.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A03411001E81;
	Fri, 26 Apr 2019 09:17:03 +0000 (UTC)
Date: Fri, 26 Apr 2019 10:17:02 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>,
	Julia Suvorova <jusual@mail.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel
 argument"
Message-ID: <20190426091702.GA2071@stefanha-x1.localdomain>
References: <20190103144124.18917-1-stefanha@redhat.com>
 <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
 <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 26 Apr 2019 09:17:08 +0000 (UTC)
X-TUID: owBzRcdE04Zm


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2019 at 08:07:06PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 1/4/19 4:16 PM, Peter Maydell wrote:
> > On Thu, 3 Jan 2019 at 14:41, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >>
> >> This reverts commit 01fd41ab3fb69971c24a69ed49cde96086d81278.
> >>
> >> The generic loader device (-device loader,file=3Dkernel.bin) can be us=
ed
> >> to load a kernel instead of the -kernel option.  Some boards have flash
> >> memory (pflash) that is set via the -pflash or -drive options.
> >>
> >> Allow starting QEMU without the -kernel option to accommodate these
> >> scenarios.
> >>
> >> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> >> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Previous to this commit (v3.1), we have:
>=20
> $ qemu-system-aarch64 -M netduino2
> qemu-system-aarch64: Guest image must be specified (using -kernel)
>=20
> Now (v4.0) we get:
>=20
> $ qemu-system-aarch64 -M netduino2
> qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1)

A user-friendly error message is needed here.  The check for -kernel was
too specific and is not desirable for microbit where we use -device
loader.

Old boards probably want to continue using -kernel.  New boards like
microbit may use just -device loader.  Perhaps there is even a group
that wants both options.

A solution is to introduce explicit checks so that we can tell the user
the appropriate option for the machine type.  I can work on this if you
like, but probably won't be able to send a patch until Tuesday.

Stefan

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcwsyOAAoJEJykq7OBq3PIxrQH/RvZOjp//Ku7wHbPSH6LRX1g
z7Fhi7/66tL7IDgjvybqRnwV+cH3hIU7bDyOPLK5ec/GHsDrqUlt0FPRXCQZksuo
AeazNW0YoqO+zI+M/JDZ6JXHMUSjnybtCDkC2ZbYpEKAJ0miSlrjIiKKjbKFPGc0
WHNsdPz5/KHvxPyD0lmI+7/MHE6B5YpanYr7V+2kDYW+/WhXT6AU99Ge3LxO4VNn
qC8FP0yRuC5FKHDlhaXw+GldH8sQvv+TUyqODXuBJZY4PF+3DFLhPI7tMizNBERs
yEgn6jGdtxXveA3RCbVkCfmUi9q9RjOY3n7ubxgCM/49EAztdzxNpT73OYr6od0=
=WxRV
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
