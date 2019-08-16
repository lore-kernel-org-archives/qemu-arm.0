Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp715819wrs;
        Fri, 16 Aug 2019 05:05:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxsPswUEYHNtBf9vnxFdaKfb8y0s0c1SE26ztN3DlFx+/ixygzHKldeGJ2eDKoN7Lk3LI1S
X-Received: by 2002:aa7:d981:: with SMTP id u1mr10321903eds.150.1565957112061;
        Fri, 16 Aug 2019 05:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565957112; cv=none;
        d=google.com; s=arc-20160816;
        b=Mp2h333bLxViPXZcdXIk18rtNR0JBBziEAmQyp+UfO0bIar7gBF20mzJoxyEULqQGh
         ZsJA3P5lBR5uXsyQ1/0jCD1gLD2Iz6sRDaYki/0DCtflePd75/h0wSCATHtYgcZrRyT+
         YJn085YW6RLlUaEw7aXuCEOXfZ2iZLAuEfHRXmMQjClncMAtY59/t/9zO4eEKvw7Op8x
         zMu/wHl/JsHqIZyCVIJekhKZIzd4JhsUHYwRtN/CiNiwX/KIUeMSVhyTK/dH6G1Wj+JM
         9zRjunb6mNWJHq9BSOaeEOHxXLdnnWEInHbopIbyn0NSV6qDuezpz57Qib0SuwV7eZoM
         LjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=SFrsvsI3LrysVr80r/6NEg4VAbfVEIOfTeYwsys+avc=;
        b=lyQKLPMgATmzLKVQznE4Ne6SBMU7ZgOhHeeBNpG1jeXHJthsQ96l5zIpMWYoWIpYDK
         gw6MUFH9+vCSPvrMWvzWrztg6DaL8jWJFqL+Gx5a/HQmY4B88gg1nX59HUDhHNlnu1Bo
         CL71aQz9sDlxBDxQNcC65tC0AS6pI81NhLgy1uAjCYCdAJeI7J1poAgLH/R9kZu1F6lI
         yvBR1v2Vfyc4xpO/znPFWTapsh+z//Nsid4uAt7W1czLZSRfR943O214OMJiKf5XDpHs
         z42LamyptJo8yxl8yOuCMU+OI+UqbCK2B+VDmFGPVgSlTq6NOVIfhgDLkVtf2uAC/Iy2
         p+1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Wekzw6zx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si2716628ejr.125.2019.08.16.05.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 05:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Wekzw6zx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyayk-0004RA-TH
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 08:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54222)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1hyayX-0004GM-Vg
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:04:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hyayW-0004ag-JR
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 08:04:57 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45421 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hyayV-0004XL-9N; Fri, 16 Aug 2019 08:04:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46927M0thdz9sML; Fri, 16 Aug 2019 22:04:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565957087;
 bh=1OQXK0o9OvoNPapWpbimPbhqPrE5Qa0PGQHKlRYcMkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wekzw6zxxq4IvC7+Zbnwqdia1xVqewDn7eX7Ht9Y83gQasjzBhjYu5PoAd/WiLpW0
 0PKntAaqTZcpID4Z8EVVQ0BYFf4MjOJ+3toNPAxMyQTRRcgQcAbv4eU/EBfCSgFmWB
 Crykn4dJVY56dnF3V1Dz6Ofl/uRZ25H6HxZL3I/0=
Date: Fri, 16 Aug 2019 21:43:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190816114305.GB2259@umbus.fritz.box>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline
In-Reply-To: <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, balrogg@gmail.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 amarkovic@wavecomp.com, jan.kiszka@web.de, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, gxt@mprc.pku.edu.cn, robh@kernel.org,
 borntraeger@de.ibm.com, joel@jms.id.au, antonynpavlov@gmail.com,
 chouteau@adacore.com, lersek@redhat.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
 jslaby@suse.cz, marex@denx.de, proljc@gmail.com, marcandre.lureau@redhat.com,
 alistair@alistair23.me, paul.durrant@citrix.com, tony.nguyen@bt.com,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kaVc0SVo72+I


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2019 at 11:58:05AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Tony,
>=20
> On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:
> > This patchset implements the IE (Invert Endian) bit in SPARCv9 MMU TTE.
> >=20
> > v7:
> [...]
> > - Re-declared many native endian devices as little or big endian. This =
is why
> >   v7 has +16 patches.
>=20
> Why are you doing that? What is the rational?
>=20
> Anyhow if this not required by your series, you should split it out of
> it, and send it on your principal changes are merged.
> I'm worried because this these new patches involve many subsystems (thus
> maintainers) and reviewing them will now take a fair amount of time.
>=20
> > For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
> > targets from the set of target/hw/*/device.o.
> >
> > If the set of targets are all little or all big endian, re-declare
> > the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
> > respectively.
>=20
> If only little endian targets use a device, that doesn't mean the device
> is designed in little endian...
>=20
> Then if a big endian target plan to use this device, it will require
> more work and you might have introduced regressions...

Uh.. only if they make the version of the device on a big endian
target big endian.  Which is a terrible idea - if you know a hardware
designer planning to do this, please slap them.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1WlskACgkQbDjKyiDZ
s5K9oQ//Uuo9cWWmd396i/MdQyddqKELOko009vf2k8wlEaysKrMpuKkkj7EV4Lz
x+MQYyqEBAZMLC5KoTeSRYHynyRTPSBOURxhQNkH4Nqj3Skxr9buvX4pqhNLhmLE
A8tSn3paa4N5GKXbgt4fOiNwBXxnrcAQgmruCbyvO7NKXPmZyTSQxJkR8VHE/qxK
LWKEgA/bjyloFI7OwpWW0rc0LdqmDljy4NKmfHsFxlZdc+TlcM2PgkYPBdRMf5SH
Nlj3YvXrsxa1gfrGLou/tlS9WHyKxl7K1DSbh42ObtrBKtc6z9aPY9+mi1moAJLi
/CpHM3SbdY4j1mGPk5/TZBul+m7spkoJfDB0A/mwb5pTLsZKO0fIOThUkjlCD32D
It90f2Y2I+omAnGOs8nX52SOoNfUwB6vtA4ThBEXzKSOOepPuL5dgSmJ8sGUn1GY
eckRx2z4Emap23L0WavytQ+oaQW8PrhfMFUBWS1DSh/uPVUs1m4Zcs2Q8siBRXZJ
J70alEhGvbhch2+S5q69iYIvljVoMcA1DjHc06WTwZOatjUdjJAQpMLidpH03+UC
AKeSvwpEA5yvuxCfLuThYD+6MeEGyVtH/IEKqSLE7IFVp2VBeqZ4tNKN41Fw/aQH
t3Q5LKmwmLKiyzHZSFM5JmNuyjmdwG56N4INLGlLEAPy9F40PR0=
=nw08
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
