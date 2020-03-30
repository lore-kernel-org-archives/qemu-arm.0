Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2507877lfi;
        Mon, 30 Mar 2020 02:22:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt4B2fiBT2ZLmQekLaPDrDFEqoL7BS6QoaJYXpXDzhepElwn8sXqDloOoTV3uJvLPQzLooP
X-Received: by 2002:a37:7783:: with SMTP id s125mr10434031qkc.492.1585560129884;
        Mon, 30 Mar 2020 02:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585560129; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1dF26bXk51UCsvMB54JlU+WuSjUy+aNKvESa7UeoHYRnYqJsoLPAhqdQd5LrAyq11
         x0TKLpBQqPT1Ig3PntYaizUahtJsMjeS41Kej49BwyrVDYwa1WVaWyqIvJC5I8Y1zzks
         uKrNBPousHMnHqQleQMOYrB+hzu97HpDXkqJ0TvvnWPxHOfYKfh5fp4TSxF2rh5yq414
         RQYasSo979dP/nFnoot0rgVxan1Bi6gUzu2R33cPMKANXXPPqOO++vpfKxEUVXLPbChS
         UZFlL+NJDC2IroHBECNL0aFZLjHKhrJLRmwWpLyNiX+qCRPv5R/7CtPSHMKHmmPDuQzt
         r61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=TTQOSi60Xg+k4c2akT3HCA42b+mAbXsd90oWRrvqAu4=;
        b=ShA1v77YC0XgJdi7TAfvA3GLo5cGptPMdpS7cclfx5zjBih1yldk7FSBa15PwtXCCm
         3l+Khk3Ck3BJ6woPbCxh0zIJN9qx2KRd/FY5l0q+BXDz0IDfdaum9QcO63de4Z1nBa1C
         obu+ZCePS6t43QcuUQeBe2gDZdlJZ3I6JXhpQWEdymGZKsDQMcrLrooWebC6tKowc1aj
         8+uXdDlSPNHxbrOh+9g7rcYdX7om1p9E7QibaaTL2eu2NKARq7D09+PCo2+I/EGjWnZn
         XSGyu5bNjTXIJLEUKVe3GkO5EM3WnBgAe6xgPPN/PaCBQLTB5p5yvER3ZF28C/CCjzgu
         0pjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jCMBWGpt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k31si7971246qta.133.2020.03.30.02.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 02:22:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jCMBWGpt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jIqcT-0000nX-9v
	for alex.bennee@linaro.org; Mon, 30 Mar 2020 05:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38409)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1jIqcJ-0000lF-P7
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 05:22:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1jIqcI-0007xh-4U
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 05:21:59 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:58771)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1jIqcH-0007xJ-V1
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 05:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585560117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TTQOSi60Xg+k4c2akT3HCA42b+mAbXsd90oWRrvqAu4=;
 b=jCMBWGpts6TBZeAexRd8lto2UdnadP7xbQOsiyRo+DN26c8INHcrb6+b22gm2B6SUUPx6X
 38ISn2uvqEMSngV2Ig/juUQvFmfd7XBbRnxGZIWILftm9FKIArcFhyw5EgzdnTpEni+Pq+
 R3Yu9g3X6OUqneU81+CX4FtKcLXQJIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-m7O6YrbIPMSZ3mShEjj7GA-1; Mon, 30 Mar 2020 05:21:53 -0400
X-MC-Unique: m7O6YrbIPMSZ3mShEjj7GA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 485788C02E2;
 Mon, 30 Mar 2020 09:21:33 +0000 (UTC)
Received: from localhost (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26E085C1BB;
 Mon, 30 Mar 2020 09:21:28 +0000 (UTC)
Date: Mon, 30 Mar 2020 10:21:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-5.0 00/12] hw: Add missing error-propagation code
Message-ID: <20200330092127.GE73285@stefanha-x1.localdomain>
References: <20200325191830.16553-1-f4bug@amsat.org>
 <CAAdtpL7rC1u=B-xW+ZbrRbpSMKvGx0kq_hug1J9-cxx6NgJR1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAdtpL7rC1u=B-xW+ZbrRbpSMKvGx0kq_hug1J9-cxx6NgJR1Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbQxIIC38V6v

--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2020 at 08:20:49PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On Wed, Mar 25, 2020 at 8:18 PM Philippe Mathieu-Daud=E9 <f4bug@amsat.org=
> wrote:
> >
> > This series is inspired of Peter fix:
> > "hw/arm/xlnx-zynqmp.c: fix some error-handling code"
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html
> >
> > Add a cocci script to fix the other places.
> >
> > Based-on: <20200324134947.15384-1-peter.maydell@linaro.org>
> >
> > Philippe Mathieu-Daud=3DC3=3DA9 (12):
>=20
> Hmm is that a git-publish bug?

Please run git-publish once more on the same branch and inspect the
$TMPDIR/0000-cover-letter.patch email in an editor when git-publish
prints "Stopping so you can inspect the patch emails:".

It would be interesting to see how your name is formatted, as well as
the MIME Content-Type and Content-Transfer-Encoding headers.

This information can be compared to the final email sent to the list
and/or received by the mailing list.

Stefan

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6BuhcACgkQnKSrs4Gr
c8geswf/Y1RvjCrsHUzGEgB7HqO1Ava0qbCa8POIXJhTPJXepAJGAWNp5uTItRsk
VLrUAaqlKuLcmybiR+Hnb6gg9ekMxuQpa+7PYtVYf1dEANgkC70rsybvZrQNUC9v
9JipcZA9LFyhFg4GVWjXw1B6HOLwxYnpzbnV93WVaTwGgl7RUqXTZ88c6EeHY/4E
DUaAKJeKl9z6C15BwvoB59zzqwGWV71V1q14fmErmuzuqMXR+NdcgYX6bhwPQXko
APnPPhpxm7NI17P/02t7wd6BN+sdz1NhgO2mPGenrXuyvJ57/5HuoHJqEMAgK6Ud
GXignHroHnlN+wOb5juZjpxj903FAQ==
=FGvm
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--

