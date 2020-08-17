Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2608438lfy;
        Sun, 16 Aug 2020 23:13:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyPWI/UtBEv0yLKCRzoyrtWoSXctJ/s4s+Hk7JkGZMTiuu5hXlZjxLWatDqyLw2Zd0djGW
X-Received: by 2002:a63:4456:: with SMTP id t22mr9022733pgk.362.1597644788753;
        Sun, 16 Aug 2020 23:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597644788; cv=none;
        d=google.com; s=arc-20160816;
        b=odAmB1oLwc1e8s9+Buc2uVJwARzDLEPjgkhMSZ6ET8B1X2qIVyIcEsh+Thhc5lyrlc
         46d0FMGuLKCx3B3vO6f/B5reo/CnjrG46aXmNWTqh+95KVqjpSRNrywAMlL7ZyKVHLQr
         bNmzVdeXcIBOpcBTAAneL/NGIYBVUUNLtswkT9P5Jydd8V4iVFC8TbTh0Q2WtcgYceNf
         PA613P2EBSsyldB+wrKHSddQiuiX0PQ3CbEsn/2lUlKdj3icykueA9yxSWFA0BGjdLF5
         9r8KqMAoXon6ol5Lk9Jk9sMZLcIW15xYBlv3MDhudqs0ZWsV9l1GgzLUtMEjIX4DwpIr
         nlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=IjxoiuiHTMvMdSioDwIsHWMkYaP8IbQG9n6NmjVQuB4=;
        b=llYFk5r0+DYq5B7+rJ1Qw+S+Zt1/ZwsNlFmEE8p3q9LbNkGrFml7tPdd2mTrahxbKc
         fSc1Tcf4LsxgjkQi7o+6uL/LtMLyodVMxh0NUN68wiNF2Ks1KqgHt57bBaIsbC9MGrGW
         YDiw6Yf2Ngm2nI8hXJqjNJ1BtB/NdZvgpw49A2M6cuohKbLFy+vblOT5U//vPHIeWzhs
         xsLBQ2O/nhpl1QLHFybSxmVOpM0JfIaRcrX/rBDSMHjq75978ZJZTiSSv2IQ7iNlJs0H
         3zSJ/RnBfqDTCDoE+40SygdKUPBKPhWo+bCiW2s7cRwGy2phD/NM2ZXllEXBSJQIi0G5
         98OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=E9Rxxqrc;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id s21si2572124plr.55.2020.08.16.23.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 23:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=E9Rxxqrc;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4BVNy76qYLz9sTK; Mon, 17 Aug 2020 16:13:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1597644783;
	bh=2VsOB1rFWMjvmOy/yXsE08WLYTHphvBiQBWgM+ZDD9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9RxxqrcGHrkzn7h8qVi8r3QeGOMlsauyuXI4WsO1JXGo7MEycQhoLvMIo0MvjJSa
	 6EMsyyZd7U/kWcs32OO6As5yNSfnasJd4OESK7YMyiku4gpbLCCITQhuAn5Gc2R/dV
	 qrNvxaa8F259A1yDA6iAn6LSoWmR/b/0fAjD/ok8=
Date: Mon, 17 Aug 2020 15:43:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Cornelia Huck <cohuck@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/8] Generalize start-powered-off property from ARM
Message-ID: <20200817054306.GL12805@yekko.fritz.box>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200817044730.GK12805@yekko.fritz.box>
 <83ebefab-8bdf-2584-53e6-e4fa0f540109@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hdW7zL/qDS6RXdAL"
Content-Disposition: inline
In-Reply-To: <83ebefab-8bdf-2584-53e6-e4fa0f540109@redhat.com>
X-TUID: hx0GJzPUuQJ1


--hdW7zL/qDS6RXdAL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2020 at 07:24:43AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 8/17/20 6:47 AM, David Gibson wrote:
> > On Wed, Jul 22, 2020 at 11:56:49PM -0300, Thiago Jung Bauermann wrote:
> >> The ARM code has a start-powered-off property in ARMCPU, which is a
> >> subclass of CPUState. This property causes arm_cpu_reset() to set
> >> CPUState::halted to 1, signalling that the CPU should start in a halted
> >> state. Other architectures also have code which aim to achieve the same
> >> effect, but without using a property.
> >>
> >> The ppc/spapr version has a bug where QEMU does a KVM_RUN on the vcpu
> >> before cs->halted is set to 1, causing the vcpu to run while it's stil=
l in
> >> an unitialized state (more details in patch 3).
> >>
> >> Peter Maydell mentioned the ARM start-powered-off property and
> >> Eduardo=C2=A0Habkost suggested making it generic, so this patch series=
 does
> >> that, for all cases which I was able to find via grep in the code.
> >>
> >> The only problem is that I was only able to test these changes on a pp=
c64le
> >> pseries KVM guest, so except for patches 2 and 3, all others are only
> >> build-tested. Also, my grasp of QOM lifecycle is basically non-existan=
t so
> >> please be aware of that when reviewing this series.
> >>
> >> The last patch may be wrong, as pointed out by Eduardo, so I marked it=
 as
> >> RFC. It may make sense to drop it.
> >>
> >> Applies cleanly on yesterday's master.
> >=20
> > This series appears to break the Travis build for a MIPS target:
> >=20
> > Unexpected error in qdev_prop_set_after_realize() at /home/travis/build=
/dgibson/qemu/hw/core/qdev-properties.c:30:
> > qemu-system-mips64el: Attempt to set property 'start-powered-off' on an=
onymous device (type 'I6400-mips64-cpu') after it was realized
> > Broken pipe
> > /home/travis/build/dgibson/qemu/tests/qtest/libqtest.c:175: kill_qemu()=
 detected QEMU death from signal 6 (Aborted) (core dumped)
> > Aborted (core dumped)
> > ERROR qom-test - too few tests run (expected 8, got 0)
> > /home/travis/build/dgibson/qemu/tests/Makefile.include:650: recipe for =
target 'check-qtest-mips64el' failed
>=20
> Good catch. hw/mips/cps.c, hw/ppc/e500.c and hw/sparc/sun4m.c are
> incorrectly setting the property after the cpu is realized because
> the cpu is created with cpu_create(). We need to create them with
> object_initialize_child() and realize them manually with qdev_realize().

Thiago, can you fix that up and repost please.


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--hdW7zL/qDS6RXdAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl86GOgACgkQbDjKyiDZ
s5Kk0RAAzUX7OUyh7MDEbNxNR3sWIUe+gOjFWWBb+ryDkbluHYAeJxaQIijJkpA+
a2LpVis2NWxh9dBw1u/kGn/lQljxfY5DKQUfSU5zrrS392MqdROsjGfFUlicUthH
QRhNYmPMSTHQ4fyYykGknI04Xxl6ynt8gcCtIfV1eVbvsvVXBrPnyL570U0D+6y/
b9zlMHdRfRlP3DC+xZN8AmKfXaiDlMD5uNpdrd6na2AmaqIYZZy/aJ21V8Xj3ivB
dDsN6rtBCzed4dsYoOpkIpokeCB4PVBK9MOs+yY988vWE+2qnhCYw0Djf11+KdYZ
OX3Uti293iC9K+frBoh5M4lhl3AYSQsY/OLjZZTgt6aovOElU8yDmv5h1tlBblTH
/5ikOZyarrUQuDWvoY5sZIkHJbympLUi8p8xRluC3JPkTSB1NptipN11qR9ls05Q
/ZQONetrt+p/DoGoWiPv27m3bHLH3pEGUAetP0xOOWAWeicLoiJ8EMHawPOY4SiN
KstOnasfPslPczslvmHVEBVxZH99qf44EAj3DhPVte5aMHsYblxGgiIO1tzKQygF
0DCIjjiYpJmlFux4fV418FKMxkwy06eorfSIe4DIUaFBSif2NVAgZQpRkET1yxkS
Jte0+lW7/IQ0PLfV1kfqsDKF/S4rZCHyFHHF1DJaw0rA4vOwg6Q=
=3lpU
-----END PGP SIGNATURE-----

--hdW7zL/qDS6RXdAL--
