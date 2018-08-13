Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3067408wru;
        Mon, 13 Aug 2018 08:56:40 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzLV2EW698wo1+KeJNGmBk7RrF6fJZqKzvO+J5GF5B6R8vghN+GFSLCsvty7KB43Ex321mm
X-Received: by 2002:a0c:c251:: with SMTP id w17-v6mr15943118qvh.77.1534175799965;
        Mon, 13 Aug 2018 08:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534175799; cv=none;
        d=google.com; s=arc-20160816;
        b=bhbgWhHlf3dt5Ghk7zqTaVxDell4ucIbnbdZquRBv0CbB5jBoesQiAKYcfS0D1uSAS
         hLsUGQw4YQqjRYvPy1u0ULPktT9IFQzZNK9UR9mSAmvcTAXGNCEhrIeixmpTvpW1p+ih
         lfT9hh8MAOULGcK3UQcnX811a+yWIToiOLA3d7J4yWafPCN+VdELwI0vgpjZWAgOH8Zz
         hAD0LIYN0h9egg6bC/TgsZHiSjv/qbrM61w6is1yDsm94TvYqXasWujuOH7Mtvd+UZvt
         exuvhTnh/j31TpEey0QEERbtVZUB43HxlvfR/fLgJ/DdDEWuX+GtOCrIFRcqVGl3644r
         pQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=Mz9CD/BkGKwrrL82z15KSbDSHXdeAtWPMjLCkVWyNwo=;
        b=nBP+RH9x/Kb5mlCr9HGi9t+tYCwQEUAh2xsAXLDswFl3bVsIrq8OCwwLQiySw6c2HW
         imfbtDUd3BuNjxGv7ESCCidp4ho4KW1+9zL++CzCyAUXTkJTEVMSjhEauzDjle6oqsYk
         buC5lU5rl/9vEThipYVWPU00hFmQ20Q9cqn3egMJgYGQ/9CyTKdf98qqJR2rcgY8CDGG
         k4kDntobC6AuvEwuM7JfGzBp/XIS4Lfq5IHBe0lBCjuTlcRsx++zEzR8SsiMuddOltcn
         AIzBH4g85zP+uGLpPr/mqU8oUI12BUbz6bLd0QRnoP/UppYAxuiNKPl0StlAhvFHKfHK
         z9DA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r13-v6si1160039qti.308.2018.08.13.08.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Aug 2018 08:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpFCx-0005tD-Fu
	for alex.bennee@linaro.org; Mon, 13 Aug 2018 11:56:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpFCp-0005t7-9J
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 11:56:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpFCk-0002sI-EV
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 11:56:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33762 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpFCk-0002rg-7b; Mon, 13 Aug 2018 11:56:26 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF2D0402332F;
	Mon, 13 Aug 2018 15:56:24 +0000 (UTC)
Received: from localhost (ovpn-116-95.ams2.redhat.com [10.36.116.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5397D10FD2BA;
	Mon, 13 Aug 2018 15:56:23 +0000 (UTC)
Date: Mon, 13 Aug 2018 16:56:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180813155622.GA18429@stefanha-x1.localdomain>
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-6-stefanha@redhat.com>
	<1a84a9fc-93f8-3573-c27e-bb60d9c48a7a@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <1a84a9fc-93f8-3573-c27e-bb60d9c48a7a@amsat.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 13 Aug 2018 15:56:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 13 Aug 2018 15:56:25 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4 5/6] loader: Implement .hex file loader
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: atm2SKtH75DI


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 10, 2018 at 02:00:44AM -0300, Philippe Mathieu-Daud=E9 wrote:
> On 08/03/2018 11:47 AM, Stefan Hajnoczi wrote:
> > +        parser->rom_start_address =3D parser->next_address_to_write;
> > +        parser->current_rom_index =3D 0;
> > +        break;
> > +
> > +    case START_SEG_ADDR_RECORD:
> > +        if (line->byte_count !=3D 4 && line->address !=3D 0) {
> > +            return -1;
> > +        }
> > +
> > +        /* x86 16-bit CS:IP segmented addressing */
> > +        *(parser->start_addr) =3D (((line->data[0] << 8) | line->data[=
1]) << 4) |
> > +                                (line->data[2] << 8) | line->data[3];
>=20
> Can you add a qtest for this case?
> For the HEX loader I understand the specs as this is the same parsing as
> the START_LINEAR_ADDR_RECORD case; so I disagree with data[0] and
> data[1] shifts.

x86 real-mode CS:IP addressing means (CS << 4) + IP.  It produces 24-bit
addresses on 80286 and later.  This is not the same as
START_LINEAR_ADDR_RECORD.

GNU bfd implements it as follows:

  abfd->start_address +=3D (HEX4 (buf) << 4) + HEX4 (buf + 4);

https://sourceware.org/git/?p=3Dbinutils.git;a=3Dblob;f=3Dbfd/ihex.c;h=3D09=
f756a1c2c11e57c5da15a6ff96491275575b86;hb=3DHEAD#l415

Thanks for commenting on this, I had written (CS << 4) | IP instead of
(CS << 4) + IP.  This will be fixed in the next revision.

> This is different for the consumer (i386 expects 2 16-bit registers but
> HexParser->start_addr is a hwaddr, used as a single (at least) 32-bit
> register.

I think you're saying that on x86 the guest CS:IP registers should be
set.  This loader is never called from hw/i386/ so it doesn't matter at
this time.

GNU bfd uses START_SEG_ADDR_RECORD records on non-x86 architectures
where there are no segment registers and that's where we've encountered
them.

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbcaomAAoJEJykq7OBq3PIu8kH/i5D2D7Ej20E40WFfZQUrdit
uDgjAyam/swlhU47rMEC4dcjHKnQQu4AXwygERHn6Xym2WP7X3THXU/5N5UgOBu1
uTcSoGq9u9y3cm3y6zLVqBDpl6n5Kfcsr85JnMEa5M9xjEqq3cG96XFB9xWggkYK
B7tgaSRWaEtSNiMCQqqgny+nboOxRMr/Edsu+IPkHjoVfMfsm9FERgRVzfhezZpp
IiVJ4eKn7DiOH5tkesXrxgkYzzRWaqfecQ5tbY4KZ0mpLvwqapr2HwoAuKo+kfO+
6g4vdbvuPJymZY7Q+DMqfMhGFBLKgMmWnlY3eQWjcvBw8XFXHJzMhCy6kqc6ttw=
=dYus
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
