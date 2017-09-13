Received: by 10.223.172.38 with SMTP id v35csp623356wrc;
        Tue, 12 Sep 2017 22:36:11 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4D3RvzqWGHRnFiMeksHYW+cciXZIudwF3WUzwL8xx7mfeAzBmZbnq4Ie2gmVC6f3m98yzy
X-Received: by 10.55.143.129 with SMTP id r123mr23893429qkd.9.1505280971829;
        Tue, 12 Sep 2017 22:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505280971; cv=none;
        d=google.com; s=arc-20160816;
        b=nOc3FlSi9J3jbPUMywYy930SZCW71Gk9/IA8m8u8+eBnFsrfpTuQcpHeumqZ8FHno4
         QIgYUWeDDCiOKY/Qahoh/mXW/7VXwTYh3pcX20e2HEouxwUFzxgfDsWcsKWCU56ehwDm
         WBAIiVBI8i35lN00M0ZxJKg932jArJUTh43wb5OlKS8PAht/p4mGsq6jLnROpCSgJ3CH
         fXXhe/zYLoQgd/wqvrFNMcP2Tu4POK5kUu4GxJpsIWOrh45cQSvL548jg8v9soiipacC
         uunJgY2g2ZDFmMj5U5P44rDEXrsyKyfU419en4wtyr6alKGvLqXDocy9UBI6WZk/5Hqn
         ouKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=4YdtPcw8VbVZWuOPdKprTMyYeV3p0aaA9lm46Ybv5lU=;
        b=mqeHczOpVZqutpYOd/aGwPeWKqFhJ4i1TLQL338jtWiEc+MTb0287kApad5V7PJgnR
         R4+c3mcdMYctAheXEvMqkMLu2V+L+6ZD6r6+b9NwfG7RqpfeQZdflkuldn2o2Vd8lc22
         QU9/b6QHa3373Kiyvb1XI717TFhmxylX0qRefDOd/7oHloGwszmbXJ8FkswFctf+FhYT
         WkmhJ00Z+FgekBkNgPlF0g4oI0PwqCKqLS6AuAIYyLmqYBjPZXKG7mipI/GTnT+mg3Ks
         7siGd7Mu0way0GnvlrkanN+ZbNfzrVe9D6bjur6E0wWp4GJY8jHVujgcQVo5cYCuEv5c
         AJLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=ZzMyPW9C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2si13488688qkl.98.2017.09.12.22.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 22:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=ZzMyPW9C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds0LJ-0005ki-Fz
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 01:36:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ds0L7-0005k3-C3
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 01:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ds0L3-0004IP-5r
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 01:35:57 -0400
Received: from ozlabs.org ([103.22.144.67]:42297)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1ds0L2-0004EX-3v; Wed, 13 Sep 2017 01:35:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3xsVkR1Qz1z9ryT; Wed, 13 Sep 2017 15:35:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1505280943;
	bh=BDayEiEvyk32qMtTUwo541ejnJzoGPyy6kJsdhTOPmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzMyPW9CSXFBL5yOvKaoKzucFwR6Rg0hJTO/FCXn1GEfLVr1aMgAyOUsyVX36ISE1
	lqN5LZrl6Oz+v8dWEQyefiukEc2YLnKH3OuJrvVQQsnBbqQdDCmX5rAX3uNGLA9SX2
	kPEWxxAi0iS51BOw/aPZNPfDkbiMIfXAFUrh2JkI=
Date: Wed, 13 Sep 2017 15:34:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20170913053436.GE7550@umbus.fritz.box>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912164644.2a0b6977@bahia.lan>
	<6198350f-a694-cf1b-ec00-4c42ccce39a6@redhat.com>
	<20170912153630.GC2225@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="phCU5ROyZO6kBE05"
Content-Disposition: inline
In-Reply-To: <20170912153630.GC2225@work-vm>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v3 0/3] hmp: fix "dump-quest-memory" segfault
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>, ehabkost@redhat.com,
	Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1TXLe15dEu1P


--phCU5ROyZO6kBE05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2017 at 04:36:30PM +0100, Dr. David Alan Gilbert wrote:
> * Thomas Huth (thuth@redhat.com) wrote:
> > On 12.09.2017 16:46, Greg Kurz wrote:
> > > On Tue, 12 Sep 2017 16:01:46 +0200
> > > Laurent Vivier <lvivier@redhat.com> wrote:
> > >=20
> > >> Fix aarch64 and ppc when dump-guest-memory is
> > >> used with none machine type and no CPU.
> > >>
> > >> The other machine types don't have the problem.
> > >>
> > >> Update test-hmp, to test none machine type
> > >> with (2 MB) and without memory, and add a test
> > >> to test dump-quest-memory without filter parameters
> > >> (it needs the fix from Cornelia Huck to work)
> > >>
> > >> v3:
> > >>   - remove blank line after a comment
> > >>   - forbid memory dump when there is no CPU
> > >>
> > >=20
> > > So in the end, we would forbid dump on aarch64 and
> > > ppc, while it is allowed on i386... I don't really
> > > care about which behavior is more appropriate but
> > > I guess they should be consistent at least.
> >=20
> > It's kind of consistent: Allow it on architectures with fixed endianess,
> > but disallow it on architectures without fixed endianess ;-)
>=20
> Another way to put it is that you can dump unless you need
> information about the CPU.
>=20
> It also makes me wonder what happens on those CPUs that can
> change their endianness dynamically.

We already have code for that on ppc, we actually look in on the CPU's
mode register at dump time to decide which.  Theoretically that could
still be tricked, but in the almost-always case of boot an OS which
sets the endianness then leaves it there, it should be fine.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--phCU5ROyZO6kBE05
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlm4w2kACgkQbDjKyiDZ
s5IbOBAAu1WdgmLUwkUkOXwdzzpdBYR9AIUZmRe0DATQhPWiaEBbDJxA70EtKRj2
4+1AdvVzhP1oIcmVUr1sEy/WQHscccGJOrOT74G0Y5wdKfrnMd/0LiIIPHo2tDhz
4R1xjSwGBm2zbk4EZN641y5op+9Ihv2ejKkIc6DengXh5+yjKbN42W4Wxa65U9Xc
qsHvrVSEMbjejlA/2RDa01Ifc5p8pZ0tRgNZj3Lt4W6tmKkw55AjpAuptL2ITf0O
ldSRWuxIXv703lX41jtZOv6VT4Et5SO0UUmirt52psEOvz/xjFOwL/hA6GNqAOPL
/Iy24c6k4USugyvyRy/z8Z4ngkXZdJkl3HV75OldnTtZCYDSW1PhxIdvowNGXRnE
UoHfuGs+jjpkzyKRBItHcgyxR0A2QP0dEWABxpsVIKW5Xpmg4yUIMcCR81YBMhPx
jP4T6IfFcqSS1fSxXHYfGY0Ab81MtDvt1Ob53FVm2TtzS/0uN76PLzMZGDUYbnjz
G1/56aBGZHlZBl+XzQgiSYhCBTCHnjTEWUCMssnC7MQbO4L1DleFRBrV8MwNqmm7
/BSmCxTHPz2yWue789dFAXL4Mxm9wUqSGkUaEcWTWDBpS1VM83LA5vkqpQEXNwjz
vj4xngANVrfyvznseUwDk9uhXLyBmAyP/dsIvEjU+b2wr8UYh2g=
=Vapc
-----END PGP SIGNATURE-----

--phCU5ROyZO6kBE05--
