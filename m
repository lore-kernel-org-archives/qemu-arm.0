Received: by 10.28.173.206 with SMTP id w197csp3866410wme;
        Tue, 9 Jan 2018 08:13:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBot6VhE7gzI4iWtFUzN5M7mnejmZTI86TzE2LzpCFSuXvFl47dOHP3NujZq7E72JNKw6+QxA
X-Received: by 10.13.250.134 with SMTP id k128mr14719615ywf.3.1515514420907;
        Tue, 09 Jan 2018 08:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515514420; cv=none;
        d=google.com; s=arc-20160816;
        b=z4KrXjS7iKjjDI1vcN3EktJp8b5dZ2CW4v2KBPR2VyenbLeAlj4OAg1pZjp+ccIMSk
         KFCN0kMBVylAcWYr8pz3DY42HuNWmYtm9r+0lkcudBYTL5loNihySoLtahy+cj0JNhpk
         d2kcUlxhiu2cUBBQI/kkv20foy17sow1yH2RG5GQmmzVbQzEYZasfUyBFAQ0lhXi0DiH
         0rc5o5jx5jE586kHv44te7IVsM9O1Z8GbN7fHSxiPt0HEZXrxzXXrFY+MLQS1xVYNYWi
         fuJWXGLssDFlCgiugkEFwHuBo4aeuVuDUD5XZNUHzHnlCfieJRWmkseFN0ZcLdZBJT9C
         kGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=kaRYkf0vUwXgHDYMPh2KIV599eLsKD/G4f4mC8jtOmI=;
        b=P88C5qyHw0lP+BCiQUkHdj5L0D2tP6DaDZU194jOfJt6VGG8PCmSu8OEnW4DXL2IZg
         ojEJGrif7jTQWRkEERXsnRCZfNqcqCf0KUkIvrpyZdyxl64/HQFwWYBOnPG3QjJLzr/Z
         4I3iQf6JT+vn5D2iyxliFEYFiKgPVxBnQjztb1oJbaTd9GG5snxFYfSavCMCrMJIr4zy
         WiFX1b941csHw7mcXLKw/PO/8dhhwV3XHjI98ohlgk1SuVSv8PQEaED287J6X50LXP+D
         wHfBzQ7luqfWj525aRoiP3mCBDa0NilYoIHhQyXvMJqNP7P/gyjr+0QzmBWf7aT3kWNw
         /mcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q0B0PP7Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9si1584867ywa.626.2018.01.09.08.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 08:13:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q0B0PP7Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYwWy-0000KK-87
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 11:13:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwWn-0000Ih-Fr
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:13:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwWm-0005fk-Aa
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:13:29 -0500
Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229]:32836)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYwWd-0005YM-IV; Tue, 09 Jan 2018 11:13:19 -0500
Received: by mail-qk0-x229.google.com with SMTP id i17so14778598qke.0;
	Tue, 09 Jan 2018 08:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=kaRYkf0vUwXgHDYMPh2KIV599eLsKD/G4f4mC8jtOmI=;
	b=Q0B0PP7Q3L/8UmBasoZkG7uj+UVBPj4xylMDXkJCNYNT/bb2hb0bGceGJUWLtL+xp2
	Nej3PaLMbHCK1eVdZNSfjt5eGMuKWhpSBfmyXyWEAfVDsXlCcleEAfz2vPfDqI2uGtjO
	cHaBq4AFGxfSjEmSo9HYM+pEb0/Uf/WXi2GQsgjEmX9wxJ7XnUn+sy0DIuq/FZOwXFqK
	epS/ZlGjPpzQWVyMMWBdaKsGku6pR31PZQfsOa6ldcMMgaLF/90C4uy32TW0QBZSLK9R
	VtVpCgrfsi5hEUBz3uEwgRb5Rb5EUp2Kf5qx8uLi9XFsCKWm1zc2sOzvwnXIbOOOU18G
	YbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kaRYkf0vUwXgHDYMPh2KIV599eLsKD/G4f4mC8jtOmI=;
	b=iwDxIfsQ4Vvq+WPM568SWTwkMM+6bMgn482BST/wVqhH3AGHdMGGHzgiE8szX3tq/J
	XUDn3yLXUxygX6Wdw20ALJv11P/lOOhz2Ad/9UInQ9vuod10f1LdTRiRWtOvErEPq6vR
	O+1sQR0UYO02gjMBvX/hkwnuTz3h+fDbIit9Y/22ony7aC9XuHaedYhCaAjKXPBWeOTB
	Bkn5mfbeKBteUpGUBOrNXTSS37flrz8vDmzOQ7T7TNYmJBbHYqLKk4zHkmRpsyM1GIET
	KtdBJU+dwNfPNefu8Lgj67wjfbxjuZ+GNsURl88BkYOaWdwQ8mEV1llRnLYMsfQYhApw
	hdgA==
X-Gm-Message-State: AKwxytfJHBzDtK5Bg18CIHZdML+QIZ/xa093i7E0spvpnN1/XwaNGKwo
	29+jtzd51EROZXsSfIEx72w=
X-Received: by 10.55.204.18 with SMTP id r18mr21542323qki.212.1515514398866;
	Tue, 09 Jan 2018 08:13:18 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id g5sm9648324qkf.91.2018.01.09.08.13.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Jan 2018 08:13:18 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d7f23db3-6669-76fe-661e-a5b506cfbeaf@amsat.org>
Date: Tue, 9 Jan 2018 13:13:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="kwNFjJuA79QvxwnyXiYVvuS3HyHpn6nB1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::229
Subject: Re: [Qemu-arm] [PATCH 0/4] Reset SD cards attached to legacy-API
 controllers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: So98Sy/UuXx7

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kwNFjJuA79QvxwnyXiYVvuS3HyHpn6nB1
Content-Type: multipart/mixed; boundary="edaU93EfZWhWVPaObQYGlZWSP0P7ICn1h";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, patches@linaro.org
Message-ID: <d7f23db3-6669-76fe-661e-a5b506cfbeaf@amsat.org>
Subject: Re: [Qemu-arm] [PATCH 0/4] Reset SD cards attached to legacy-API
 controllers
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>

--edaU93EfZWhWVPaObQYGlZWSP0P7ICn1h
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 01/09/2018 11:01 AM, Peter Maydell wrote:
> It turns out that we don't reset the SD card model if it's
> attached to a legacy-API controller. For new-style controllers
> where the SD card object is attached to an SD_BUS, the generic
> qbus infrastructure takes care of ensuring that the card's
> DeviceState::reset method gets called. But for the legacy
> API where the card is created by calling sd_init(), the card
> object has no SD_BUS to plug into, and so the reset function
> must be called manually.
>=20
> This mostly had no ill effects because a guest OS will typically
> perform an SD reset command as part of its device driver init
> sequence. However it does mean that migration won't work, because
> it's in sd_reset() that we set up the wpgrps_size field, and
> without that the migration struct on reload won't match.
>=20
> This patchset fixes up the four legacy controllers to call
> reset on the SD card device in their controller reset functions.
> The first 3 are cc:stable as migration bugfixes.
>=20
> This fixes https://bugs.launchpad.net/qemu/+bug/1739378
>=20
> Philippe: this probably clashes slightly with your sdcard
> patchsets (and where you've updated devices to the new APIs
> it becomes irrelevant), but I think we should apply these
> first so we can have a simple patch to backport to the stable
> tree.

Sure, it makes sens.

I didn't test migrating a card (but have a "sdcard migration qtest"
entry in my TODO).

this series:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

>=20
> Notes:
>  * OMAP doesn't migrate anyway, so isn't cc:stable
>  * for vexpress-a15, you also need "-machine secure=3Doff":
>    a config with trustzone emulation enabled doesn't
>    successfully migrate (haven't yet debugged why)
>=20
> thanks
> -- PMM
>=20
> Peter Maydell (4):
>   hw/sd/pl181: Reset SD card on controller reset
>   hw/sd/milkymist-memcard: Reset SD card on controller reset
>   hw/sd/ssi-sd: Reset SD card on controller reset
>   hw/sd/omap_mmc: Reset SD card on controller reset
>=20
>  hw/sd/milkymist-memcard.c |  4 ++++
>  hw/sd/omap_mmc.c          | 14 ++++++++++----
>  hw/sd/pl181.c             |  4 ++++
>  hw/sd/ssi-sd.c            | 24 +++++++++++++++++++++++-
>  4 files changed, 41 insertions(+), 5 deletions(-)
>=20


--edaU93EfZWhWVPaObQYGlZWSP0P7ICn1h--

--kwNFjJuA79QvxwnyXiYVvuS3HyHpn6nB1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpU6hsACgkQ4+MsLN6t
wN7p0RAAkY/dGWPp9YaVY9VDI33T4TBJDGuPL77XWjt3+CuceNrim8ecP7FqrRir
voknNtES38Zw2jTGVZtEqfRp+x3tus0ZvU+PJ/GT9XMf0qkFrasEJ0bAuj3C6qL1
Uc6g7QYwQvwHcdZxEY1tiNGcRJ6IU1cIQSYf32RJQ0sPhWyZn2xilqLYy4H6xmGF
PDU0OvEkel7Iq2Qk1cj8+4MtjGqy5pcqkalUto64izi2t74kDhrTfWjvBbTjT6Jv
GhVgdBmM4VyJMZP2F+E6FGxcicGAISW5gnL+/urBX/Gj/kiJfhNY+u18fYYzEUsW
mnuwmIVoo3IAtQp41rrtyvjbCq5rNoM9ApsfrkuX2Gn8Wxe4YGUcjaEQUyErzRP3
ymqINaP2gXcxFYmSOKzx7vBzThuYiQ0SR88uR0n+XdWLTjEtvh/efY40ZYbqi9U4
5TaXUSHcyaMX62iwgU3Y7MdyIrmGM7/TDzcK4Fg+UHPJVOryZSxog16tO/LjPKD9
VoYXEXd32XxOz/M/EyRRrbUnAWnalyb8QPF0KQvdnNeg/g0c1EvXdQuENMFwgi9j
8E5O0KpgeMxfJqBZeusbDOaSFj2yzdizDTx2Dx5b/dXs+Dzj7i79lCiv5XGR0wKo
DoH29u+iqN0IUqOn0vxiMp+dfODY4hqe0IssMOPoF8Bv14rmvgA=
=cNBO
-----END PGP SIGNATURE-----

--kwNFjJuA79QvxwnyXiYVvuS3HyHpn6nB1--
