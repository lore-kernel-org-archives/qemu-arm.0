Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp587066wrs;
        Mon, 12 Aug 2019 06:55:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTWhJhG3lIChLI/Cs2GWGEIFFipGcXkRa2p8OwAIuiATo4QQq/pS1LHqPHpMQQbqLL7bgO
X-Received: by 2002:a37:6109:: with SMTP id v9mr23910938qkb.432.1565618106182;
        Mon, 12 Aug 2019 06:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565618106; cv=none;
        d=google.com; s=arc-20160816;
        b=CVhVFlR3lMCofqEkHN9Yks1sB/fcgz0ajW8ccaPNfp4g2WZ5K9kdWojByRfPxStdyF
         3glITTsrrqszp2edx9jslvYJQR3Agcc4LI+Lg9eILyEC0Da3qyAuZmpGky0nVDD4pHxH
         kxuKGNmCsqaCCrmxNaf9k58ts+D8O9c0HnDRklwfwpDc/c+DXmuCRBC5E9qKQLvYt+Hy
         HlxHIdUH+s6IOPXrQV7DmiL+aq9Q/nEBCZfWO6bT/xAJD2xS8NW1trtFx2Wz1MBglceh
         MWjvt7EYsg0qmMKley9S/5jMENorHWY4XN2J1rNbPFBqkdk/UZ6WpH+V7CBjs3oeIkMc
         1+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=Vn8D6zNsGu2kCnOi/OA8H/31wmqurOmxJ0I+QZXkHjU=;
        b=X8uME5opKuM9AK3rGU9STYhld/kLCkLsZvF8iFKRmR/YuY3RECHf2io9uM5mTTTURU
         5C7pOSKZcO/Mk0d9CmDEE8uqArvG0+dMgwMw526zYTeopJZkVnL/2aK87Mk55W4fKpqn
         MJP38+YvupPk1Lmfdz4spY3tK3RTrvcYqFEb+DLov+9xYk0MCpHkj7tx3ZrzQ0TzLJYq
         pxz/POPMQh9/NhgOaJJntIyVX2UtLDrH+k0hWPNQPcvynY5CcWarGw7ep6pFr8J8hXSH
         sGrkIpEOc6FAVMdzRNBSNwAbDTp/Q0RQ95dI46MnZFbS6TQgV90hSW+ubJdwIhd6+Cbr
         aQxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b="bBJGZ3/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n37si64487733qtk.173.2019.08.12.06.55.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 06:55:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b="bBJGZ3/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxAmv-00073U-OM
	for alex.bennee@linaro.org; Mon, 12 Aug 2019 09:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57787)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmN-0006Oc-Dk
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 09:54:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hxAmM-0008T0-28
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 09:54:31 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47087 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hxAmL-0008Qd-C0; Mon, 12 Aug 2019 09:54:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 466cld5WCgz9sPL; Mon, 12 Aug 2019 23:54:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1565618061;
 bh=WgEiA2bYSoYo1c+YVtUVqwKW3af/hSyQnnzpCRq/SrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bBJGZ3/t7i/EZwLzbf4eb7ls2oRUoKmE+xRciukNM6aDtGvfoSuL0ijgw5h5kZwYi
 HrWkq8g4sEHrnXWxh/wtZ+XRZUz4IXug91xrFQC4fPf9KzcFmKB9L0QIQKiHCCFeSq
 yjLJuX0SRMoHxUZpFLLKIIBAI3A4TfAlEc2/vHD0=
Date: Mon, 12 Aug 2019 20:36:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Message-ID: <20190812103633.GL3947@umbus.fritz.box>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-6-damien.hedde@greensocs.com>
 <20190731060533.GD2032@umbus.fritz.box>
 <51aa7e6d-3568-8485-4b67-a598a24a1f3d@greensocs.com>
 <20190808064810.GE5465@umbus.fritz.box>
 <4fa2ecbe-d81e-5285-822e-28f984aed77c@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CgTrtGVSVGoxAIFj"
Content-Disposition: inline
In-Reply-To: <4fa2ecbe-d81e-5285-822e-28f984aed77c@kaod.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH v3 05/33] Switch to new api in qdev/bus
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 alistair@alistair23.me, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 jsnow@redhat.com, rth@twiddle.net, Damien Hedde <damien.hedde@greensocs.com>,
 berrange@redhat.com, cohuck@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nEKed7giNEPR


--CgTrtGVSVGoxAIFj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 01:39:46PM +0200, C=E9dric Le Goater wrote:
>=20
> >>> So.. is this change in the device_reset() signature really necessary?
> >>> Even if there are compelling reasons to handle warm reset in the new
> >>> API, that doesn't been you need to change device_reset() itself from
> >>> its established meaning of a cold (i.e. as per power cycle) reset.
> >>> Warm resets are generally called in rather more specific circumstances
> >>> (often under guest software direction) so it seems likely that users
> >>> would want to engage with the new reset API directly.  Or we could
> >>> just create a device_warm_reset() wrapper.  That would also avoid the
> >>> bare boolean parameter, which is not great for readability (you have
> >>> to look up the signature to have any idea what it means).
> >>
> >> I've added device_reset_cold/warm wrapper functions to avoid having to
> >> pass the boolean parameter. it seems I forgot to use them in qdev.c
> >> I suppose, like you said, we could live with
> >> + no function with the boolean parameter
> >> + device_reset doing cold reset
> >> + device_reset_warm (or device_warm_reset) for the warm version
> >=20
> > Ok, good.
> >=20
> > I'm afraid the whole series still makes me pretty uncomfortable,
> > though, since the whole "warm reset" concept still seems way to vague
> > to me.
>=20
> Isn't the reset after the CAS negotiation sequence between the hypervisor
> and the pseries machine some sort of warm reset driven by SW ?

Yes.. and?  The fact that something as messy as CAS can come under the
category of warm reset only re-inforces that what a warm reset is
isn't really well defined.

[That said, in the case of CAS, I'd really like it if we can change
things to avoid the pseudo-reset and just rewrite the dt instead.
The sorta-reboot causes us problems with -no-reboot and with disabling
the SLOF autoboot flag]

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CgTrtGVSVGoxAIFj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1RQTEACgkQbDjKyiDZ
s5KUyxAAu2TiBsf0j9fE+XbZL0oHDdf3cZwxK+R8IIX+KPxmoWrx3uWJ0eYKKj2y
K2hO9fJQvJPxfs615SuVOy684MkEGldNyItKe/2kVaBS78H17hTFQDKmEVp9uZgx
gO5Z1CcBeVRcPTqUvSBn87ZpaehcmD0ZZDacFus3giMeReQz/nbhH78sAnLmrPdY
Yblmeq/7+kSbMhFtSh7g7tPtoK4OepkNfhVTWogeX9TymuGsS5+NiQZUPPNlCxnC
JtLlhLskFe24JMA5rt8IC/E6KPEvwr6ieR0Hdk4PeGBeI4BfqlZzAwcOrVyuy0x4
C3aQtq6XuVyKLAXdENyb5C+tY7r6Yo/ZwjOpC/byFprsCN/E0qamx1RU6uaadvIz
zTgzYKVpwY7H/hmVQgWUzD2ucJ6tv3umN5/cqc4CFurfEOuKw/3+ypN0hsT9P0ro
QJfv//NsrpbXZ5yqebszEfla9bxVMR8Zk/osMIvtpdx+2XKezRh8C75K82umpwwy
bTd1oibYJ8dsOK644hjb9f7ctWz9CuLa+H1moS40VZa49ny1gW6wW8E1euUCFwdH
n1J+uHkNHT4/ifrLN00kIFV/t7CNHk9HuXjFE5etWnQcAKlQjWpDjwpbxUGI1w5Y
U/m1uRsXBPgA72cGHp1DJvdAaeZ0outw4GjbFE+QM1nd16izQG8=
=56Xh
-----END PGP SIGNATURE-----

--CgTrtGVSVGoxAIFj--
