Received: by 10.223.159.74 with SMTP id f10csp1031693wrg;
        Sun, 3 Dec 2017 17:08:35 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb15aJ2iOw1eN4hXlrHYJFxslIlnU8trf83XIDRvyNpm4XnRrCGhKESszfzaS9BjDUH8RCP
X-Received: by 10.37.246.39 with SMTP id t39mr8414979ybd.497.1512349715574;
        Sun, 03 Dec 2017 17:08:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512349715; cv=none;
        d=google.com; s=arc-20160816;
        b=LESBdZ44VdPfFmCKOBI1EDOoSaA6zDAOV1gPT9QYwEqwMMIeyFQgBHxIW6FItaAQh2
         JbO+5t1/63XdFAhhTNNAkanTOvl3huKSzrHRzK5GIUnb3uT+e8UOZYkg4EbfhRz9UQX9
         y3YquXd68qXkL4cOcNcFI+xtsqFbM7c9OiOXAVz//4H2kJVw5g0P296fvSIgPzp8y5GI
         /yucBNF/GQNamVDnLTA/V5LvDwYzJ2+1CdBHqNGJa7mnwKMsacUeGYvek4ZhyL1tnFq2
         8zpv9VVc3jb9i+xkidGYuESP8U6IPCaS+3g+eHqlmULp7tXNo9lhLJczchhntOybqLq0
         LxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=R6KnEhRg9ZBnuWB4Vnuz7AijU+rmTSkQB5SZ9CsAn1M=;
        b=ZXP1TfxaIl2QAsv1++6jVL0+xMr/qPFLOVpHoUgkjVTKY4k5LieJ2JY7w2WRbRFUk6
         yC1j2HmODPaXNxm1zYmvrpaammgslWmMqoVbA2Q34Xr5sDTq7P8oxcr0hsofQElhM1DY
         G459yZD+aJ8HUS29ZHo3GIMk/DaHzLnZ+CmdijTqrmOoFkTSncBWRuCw9jVSkTagfRKa
         zLcG1jJCagKtdezthLHC/IZVbAQ+ETEaRYbBTz593GWdhHRFxvum/8S2S1GZUqy8aHi/
         ggW2YEHWGq6EqC0qcDWRbrSaIl/lnZPFkDygCTmyCx9WgeDMb6j3Th7gPk2wGImdfWjr
         UMvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=No8LobAV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s128si2378940yws.19.2017.12.03.17.08.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 03 Dec 2017 17:08:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=No8LobAV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eLfFL-0008Cw-0a
	for alex.bennee@linaro.org; Sun, 03 Dec 2017 20:08:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eLfF0-0008Cl-BE
	for qemu-arm@nongnu.org; Sun, 03 Dec 2017 20:08:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1eLfEz-0000N2-1x
	for qemu-arm@nongnu.org; Sun, 03 Dec 2017 20:08:14 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:58023)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1eLfEy-0000K6-Hb; Sun, 03 Dec 2017 20:08:12 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3yqmvl5JGdz9s7g; Mon,  4 Dec 2017 12:08:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1512349683;
	bh=AoY64/FTb+T0bH+ya+290WyTkEKCpb+vAyZsKzN10Us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=No8LobAVEiMEEbWu7i7WitlBzGqnDZZo7xwuegAGDPJiL6ZUw/mAGUQ1FwjOhg+4V
	U20qe6YR0NiTBM5i228bKde2eJLxBgha0CbPTklA7iQMj7i+ar+FVFKUqfgK7RmnRZ
	UWAHSzWAtOp52fV+q1wmVfdcpNRHVhpMvstrVy0A=
Date: Mon, 4 Dec 2017 11:45:26 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20171204004526.GE2130@umbus.fritz.box>
References: <20171130134159.9697-1-eblake@redhat.com>
	<20171130134159.9697-4-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="phCU5ROyZO6kBE05"
Content-Disposition: inline
In-Reply-To: <20171130134159.9697-4-eblake@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [Qemu-ppc] [PATCH 3/3] maint: Fix macros with broken
 'do/while(0); ' usage
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>, Max Reitz <mreitz@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oZoAl9XNXzPD


--phCU5ROyZO6kBE05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 07:41:59AM -0600, Eric Blake wrote:
> The point of writing a macro embedded in a 'do { ... } while (0)'
> loop is so that the macro can be used as a drop-in statement with
> the caller supplying the trailing ';'.  Although our coding style
> frowns on brace-less 'if':
>   if (cond)
>     statement;
>   else
>     something else;
> the use of do/while (0) in a macro is absolutely essential for the
> purpose of avoiding a syntax error on the 'else' - but it only works
> if there is no trailing ';' in the macro (as the ';' in the code
> calling the macro would then be a second statement and cause the
> 'else' to not pair to the 'if').
>=20
> Many of the places touched in this code are examples of the ugly
> bit-rotting debug print statements; cleaning those up is left as
> a bite-sized task for another day.
>=20
> Found mechanically via: $ git grep -B1 'while (0);' | grep -A1 \\\\
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>

ppc related portions

Acked-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--phCU5ROyZO6kBE05
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlokmqYACgkQbDjKyiDZ
s5JlyRAAmG2FNrMuFZQkEx6DIjE6ZBj9SOYXPPwhesK5z/9JLbRDW9S0dmqWJg7a
XvPXWaKVKox1Rt7ikCIVKgaCepwQT+mQjbA5god5D+KqdTRj2cLGAGaceKK987c1
8WIMUTv4QLGQkxvZvhUsyCUFg3VBBIFR3xdKxMArSb+4zNwN3IBh6+yYPFrOwsg6
CxjxQ1mioi64Ucp94MuExQ62RxDO4TJ/0uKExhNsYhYSpPYpenNVxIrhqjNshbOD
PR3i7nSDU8Ip49E+AN9CaTAJ8kX8eGK6u7024gMXfvpAWOvuo/u4i+4EMAXkWrcP
IWpevm/F53+T1zOKNSCm9R4KMw4d0cGz+FV5U7HmE7H6C+OzuSx5KpLa6p3XKN5i
wPsco9WeHihaza6hnDVoF/Xqmmzq12NtU3CAsF+cmCTn84NY5stpLJQBdYo3qK+w
z4kX2zwIniENUEbdNqn/bOgd/vRcea1wWMSnlZTpr1PyvVRRBLtgxsZ2mp6h1t9t
IPmN5XwDyko3IxZ87jUgzOmoeLnVVnNe/5DiFtUMdUhACfGflXd8Xq2pww3WP48z
mujpyWwub7tmt4vkhP2p5iS5ea/THuFp/dP05ji32RUcdAAIfrKbKWv0WFB4y4u2
qdhceKxte/9X7DUa7QKfO3JW8sGtz+wxExQpVupbogqivvL/hZk=
=+q/8
-----END PGP SIGNATURE-----

--phCU5ROyZO6kBE05--
