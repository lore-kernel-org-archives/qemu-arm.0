Received: by 10.25.150.194 with SMTP id y185csp1696756lfd;
        Tue, 8 Nov 2016 09:10:57 -0800 (PST)
X-Received: by 10.157.30.138 with SMTP id n10mr6328253otn.200.1478625056968;
        Tue, 08 Nov 2016 09:10:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e184si19687669oif.68.2016.11.08.09.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Nov 2016 09:10:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c49vE-0007fp-4E
	for alex.bennee@linaro.org; Tue, 08 Nov 2016 12:10:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1c49lG-0000Rc-F8
	for qemu-devel@nongnu.org; Tue, 08 Nov 2016 12:00:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1c49lC-0007zp-5X
	for qemu-devel@nongnu.org; Tue, 08 Nov 2016 12:00:38 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:35967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1c49lB-0007q3-RJ; Tue, 08 Nov 2016 12:00:34 -0500
Received: by mail-wm0-x243.google.com with SMTP id c17so23806218wmc.3;
	Tue, 08 Nov 2016 09:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=u2VYJpt4OmynGshwrFLufQ0SjsgW0enK2YF5OaImYL8=;
	b=yODoG1qGnB9RYu1ieSVL8SF2Wvx262LVB7LsHrwSOPiD4nLGDg8H9IexiHY82mcUrN
	37tvDUc4e3eWBjv3Ne+6K2DWG/QYYbNtwduJ+g5VrDryDkvs966rx9FiZfVTmde79fm1
	7rZcSe0B1mBaxIC/Dxgru/FIfpHiWJKpu6CdMIGBnzC4tQBUw8YgngI7GhIaefEf4Z5s
	/A99lPcB3rCE8H5E513QxnugP7E1It4JJNNq4PcLs2gKR5K2kx1ATvFtMRAa1bvTVpp1
	1q4Vnf4HjT+jY/t+cE/Cw/tWPPubV/8ZXkmLpN0SAcE2tlg/aVvWn4MVCIaJHC+fHP1n
	Th2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=u2VYJpt4OmynGshwrFLufQ0SjsgW0enK2YF5OaImYL8=;
	b=UmOFDeeJ6V7VkaNCs1aa8h9ye+DA9z5zfRp9ZeHYG8NDr6ZrX2JpmzhptODCjSmjaq
	uPxSKbMoY5PGGMU/n8OTo/ibDvAgFKT0xmqWCWAlX/06WXS1B+xFigVP73nEX6nxG5Y3
	KDkGyvtqvnzwHaC+oEKiJKjTGZFL3i1KEQvXsphA7zJjEQynXWVZWNjZ5KkVWbH/G7Bj
	2mwsPBCZHDGE93HuxzK8jK0U2wtGFMlOr3QmowumM2xirsxhcItc26dQgxwWDE3fKSe4
	HaUrjn739U9h7awkXyJb1jvXtmULI4sE6J/bmhZh4eWnpKr965Nx34StcSwUaZF2jyHY
	cEdQ==
X-Gm-Message-State: ABUngveiB/63sKSuZnpTedFxkAbYwNN7SJoCfp75Qi8ARnSDXsJInnCdq1OkERbK5glNbQ==
X-Received: by 10.28.113.76 with SMTP id m73mr7047241wmc.114.1478624413453;
	Tue, 08 Nov 2016 09:00:13 -0800 (PST)
Received: from localhost (host86-163-92-203.range86-163.btcentralplus.com.
	[86.163.92.203]) by smtp.gmail.com with ESMTPSA id
	ba10sm30958904wjb.32.2016.11.08.09.00.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 09:00:12 -0800 (PST)
Date: Tue, 8 Nov 2016 17:00:11 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20161108170011.GH11274@stefanha-x1.localdomain>
References: <1478607473-25851-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aF3LVLvitz/VQU3c"
Content-Disposition: inline
In-Reply-To: <1478607473-25851-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-devel] [PATCH 0/5] Fixes for the MAINTAINERS file
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laurent Vivier <laurent@vivier.eu>,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yKlfgHU+a5LM


--aF3LVLvitz/VQU3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 01:17:48PM +0100, Thomas Huth wrote:
> I've currently got some update patches to the MAINTAINERS file
> floating around, and Paolo asked me to send a PULL request for
> them - so here's now the assembled set of patches for a final
> review. If there are no objections, I'll send a PULL request in
> a couple of days.
>=20
> Note: I've also included John's patch for the bitmap support here,
> since it is related - if that should go through another tree
> instead, please let me know.
>=20
> The m68k update is also a v2 of a patch that I've sent some time ago...
> Laurent, please have another look at that one to see whether it is
> OK now.
>=20
> John Snow (1):
>   MAINTAINERS: Add Fam and Jsnow for Bitmap support
>=20
> Thomas Huth (4):
>   MAINTAINERS: Add some ARM related files to the corresponding sections
>   sparc: Add slavio_misc.c and eccmemctl.c to the MAINTAINERS file
>   m68k: Update the 68k sections in the MAINTAINERS file
>   MAINTAINERS: Add an entry for the CHRP NVRAM files
>=20
>  MAINTAINERS | 37 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
>=20
> --=20
> 1.8.3.1
>=20
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--aF3LVLvitz/VQU3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYIgSbAAoJEJykq7OBq3PIPEQH/j0McidnudytZwIjZGGy/VWg
j+6d1hMMYFiunxSog6x0Cl3eWHXVPuoNrZ/m6eTc/7TxVjFuGe+P4+/YxjDZtTMs
j8WM1z88jdpEGqlTduj4c+YZNutdBFPj82YsHF2vSMLS2TAMMYRRzlagIlg7yu1z
hNSiPXo6cb3aGjeg2Yp4aHFCFas/A4zqYBIoAvg05cK0fCDRiKj/Ko07BU8gsF2O
dJhssErYsK5P//SxL+xOe451Euv+E1VJsXaPnJeQts+RI8hOHVdz5dOWjHMVwfeJ
uHhbMUPkSWQkiYzM2p26D7glLUt/5Caj6nPQh59VxLUOqU65yJmBvFFY7n1oRzU=
=l4Rr
-----END PGP SIGNATURE-----

--aF3LVLvitz/VQU3c--
