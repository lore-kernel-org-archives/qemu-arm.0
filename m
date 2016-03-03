Received: by 10.25.208.211 with SMTP id h202csp2511680lfg;
        Wed, 2 Mar 2016 21:14:45 -0800 (PST)
X-Received: by 10.140.222.136 with SMTP id s130mr792978qhb.62.1456982085135;
        Wed, 02 Mar 2016 21:14:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h75si39449254qhc.86.2016.03.02.21.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Mar 2016 21:14:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:60584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abLb2-0003Xx-HH
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 00:14:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1abLb0-0003Xq-3G
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 00:14:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1abLaw-0007pX-U1
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 00:14:42 -0500
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:34521
	helo=homiemail-a15.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1abLaw-0007pC-Mr; Thu, 03 Mar 2016 00:14:38 -0500
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 4E84B76C06B;
	Wed,  2 Mar 2016 21:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=CEL3KTGyY/q2F6m15KnWi
	QapkEs=; b=FsAWcmYt2iLmrS7sOeXj9svpSW2s9ogf3XzVcGpazR7aVMwHXC3J9
	cWFGGxb0kjIMdqMIZkPs209/SUwzwKMDvj7BorwKoZHnO7lPsKhCTjxKix5QOwdf
	2R3MN4oFi3VXxlz8cYmFrMIA6FYuocfkSr1lLQsMunHrhl4dEDpn2A=
Received: from keelia (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id 27FBB76C069; 
	Wed,  2 Mar 2016 21:14:35 -0800 (PST)
Message-ID: <1456982069.10265.11.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 03 Mar 2016 15:44:29 +1030
In-Reply-To: <CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
	<1455622497-25966-3-git-send-email-andrew@aj.id.au>
	<CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-591C/syFYX7g9A77MvsG"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.163.253.7
Cc: openbmc@lists.ozlabs.org, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hw/intc: Add (new) ASPEED AST2400
 AVIC device model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: andrew@aj.id.au
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eQ7RRBDEuObK


--=-591C/syFYX7g9A77MvsG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-02-25 at 16:29 +0000, Peter Maydell wrote:
> > +    case 0x20: /* Interrupt Enable */
> > +        s->int_enable |=3D data;
>=20
> Are you sure this only ORs in new 1 bits?

As in, am I sure I only want to take the newly set bits? If so, yes, as
the the following register serves to clear the field's set bits:

>=20
> > +        break;
> > +    case 0x28: /* Interrupt Enable Clear */
> > +        s->int_enable &=3D ~data;
> > +        break;

The 'int_enable', 'int_trigger' and 'edge_status' fields all use the pa
ttern of separate set and clear registers (the remaining registers may
benefit from the extract64/deposit64 helpers, I'll think about that
further). I'll add some comments to help clear this up.

Otherwise, can you rephrase the question? At face value it seems like
you're implying that I'm doing more than ORing in the new 1 bits?

Andrew
--=-591C/syFYX7g9A77MvsG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW18g1AAoJEJ0dnzgO5LT5rNYP/2qAbk2FUu5gsNohItjdtiIE
WZ1DnujXLW7XZApj45Zx2sWl0BPkYfUz2HVNbitxPJMNlBunTfXR1IKuMGDi7lU7
7qOzKmiWntdleG4W+1DBSALd/ypkDqaE5QGnpfZz3s9tyedXX4YB1g2iJUeZxzEL
xGqLmLtPu591tCWFmJNJ49QcstXCDLCDU4UVsrHfReEgzinrWXqhD5zDt+uhXxsb
WDKrUeKV2payBGUa++L1GiBJuCALwF42t3OdM0g9KY+Toq1oM92YStgEyagLDj1Z
QAXbp+NeRWqSFqoRUNmyNmGhR9IwzYF1epsjXnMKxflXzWItoVGTkkuCNWuTj8SM
+K7f0tof4jrIgFPPauUeaPmeOGJFU5kkxrmkuHxOS1Bmyk/hhnoN0Sv6VDW0kSim
JaZIA8cqRNpj0RXUM2z5Lip6jJXNkwDgvk2B2wc/fm+H083QjfB/inzYqNrqa8YZ
VlevIWVMvBp7D3bthzo08pTqlF0U2DBt6wId+EVTM0KUrwcVEKNc3H2bMB7eDLiy
0463rYqW93/hSJXd1vYUdYBeLXNK75WpMFVPH3Ri+uOmjA6WfEJutMEHtaBItueA
aKQeGHeMVxRsN3x+hPTySq6I0Ancn3ZqiWpOFMNzJigJ2YMAlViY3vw18YbjVZbk
W7YKoObxJoHSL3slUTEo
=FRDD
-----END PGP SIGNATURE-----

--=-591C/syFYX7g9A77MvsG--

