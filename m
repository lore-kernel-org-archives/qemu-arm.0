Received: by 10.25.0.6 with SMTP id 6csp469961lfa;
        Wed, 10 May 2017 13:15:29 -0700 (PDT)
X-Received: by 10.200.40.46 with SMTP id 43mr378781qtq.132.1494447329043;
        Wed, 10 May 2017 13:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494447329; cv=none;
        d=google.com; s=arc-20160816;
        b=MPTLlCnkmFiyVsnltlX5NaXr2EHgfsXNpN30J9iKIxGj8w8e0wXGDbGoyVZO16h2zd
         RfB2sK24QwUZwtz0kzmog1PBaYLQvOZOgncQvAc+a6WGJDkaT5/SzGqeN2hQohiM2tmS
         WxxmZZlicoTmlch5l5jOq6KQEGejHDy3WkugwqIlJfBuAYdaHx6+RaqxBOX90cdY21f0
         OL4u6Z2UGDIU5RHvrMgBmbOZpRW11EPJZgDHXnJ6tWRtPWmX5Sly4c+x8ddA30ZL9KoB
         26Ex5dj7+0uLUqzqXvX5BlXfAhlJq4H6Df+accXW83iVedWMPr6DTT56TOv/Hh8vWssy
         uvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=ckhltYP4ZQAOPDH8d7P0gUnHjQF6zh7VbYjL4Luf9qI=;
        b=jpgBph7EHv1DeEQsAws9J+zN9R6FnzLd34N6ZtyjJ62U8UKTfvWvOL3rhSLRR90N0+
         yHZqq028fRC8SWpWxML9v43jZQKRnuPgFgxpot6iW0danjaTj1d8Of/72jz1vFQWU8X7
         4EI1vRYoESlht5JJ/qsakUn7Xh6AwL2V3cXqS3wEXSIFMLT6qyBl3YRUxDMCo5gXoQqP
         OiOeQnpraSdS51cuO4LXyLERyms/nCPiYXfWeOAY1+lgxCL3yGYbquFdPoBE/NlKIBiW
         4cwrRc0WWl9QbptlsjzVl81OWr7SCfMfbOSgfFSSv4Bpjteu0+phFSAhF/jzMdxv9862
         9Yrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l29si164196qtc.205.2017.05.10.13.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 13:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Y1A-00073F-EW
	for alex.bennee@linaro.org; Wed, 10 May 2017 16:15:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d8Y13-00070I-Vx
	for qemu-arm@nongnu.org; Wed, 10 May 2017 16:15:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d8Y10-0001uP-TC
	for qemu-arm@nongnu.org; Wed, 10 May 2017 16:15:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37820)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d8Y10-0001tF-KS; Wed, 10 May 2017 16:15:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FAFF3D945;
	Wed, 10 May 2017 20:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8FAFF3D945
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8FAFF3D945
Received: from [10.10.121.252] (ovpn-121-252.rdu2.redhat.com [10.10.121.252])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9597278482;
	Wed, 10 May 2017 20:15:16 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org
References: <20170510200535.13268-1-f4bug@amsat.org>
	<20170510200535.13268-3-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5a888274-0687-16ef-79d0-2c5ba9513164@redhat.com>
Date: Wed, 10 May 2017 15:15:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170510200535.13268-3-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="o3KXTmHwipfAWiFCubJAFJqvGtXHKJiUf"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 10 May 2017 20:15:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/8] target/arm: optimize
 smul_dual() and neon_trn_u8() using extract op
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G7/13ScIahp4

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--o3KXTmHwipfAWiFCubJAFJqvGtXHKJiUf
Content-Type: multipart/mixed; boundary="b50D1iRgc1Er2tC1XbJltBNiRK1JVJMiN";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>,
 qemu-arm@nongnu.org
Message-ID: <5a888274-0687-16ef-79d0-2c5ba9513164@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 2/8] target/arm: optimize smul_dual() and
 neon_trn_u8() using extract op
References: <20170510200535.13268-1-f4bug@amsat.org>
 <20170510200535.13268-3-f4bug@amsat.org>
In-Reply-To: <20170510200535.13268-3-f4bug@amsat.org>

--b50D1iRgc1Er2tC1XbJltBNiRK1JVJMiN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/10/2017 03:05 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Applied using Coccinelle script.

Thinking forward a year - if I want to reproduce this (to see if other
instances have crept in), I have to dig up a mail archive to learn the
formula you used.  Better is to list your coccinelle command line
directly in the commit message, so that reproducing the fix involves
less effort.  Same comment applies throughout the series.

For reference, see how I did it in commit de6e7951.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--b50D1iRgc1Er2tC1XbJltBNiRK1JVJMiN--

--o3KXTmHwipfAWiFCubJAFJqvGtXHKJiUf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZE3TTAAoJEKeha0olJ0NqdnwH+wadrcWapehQdArx3GIKXY52
ndC+3ECp0PXXv4gnSwRPrMGZ4d4hPP+35IAdHGvOzbr6WWoQGzSmPTIeTQXfg+Gg
zMFi2rWno9i14uerj6leK4FaDDSEv0PHDlqjXXtLtCHacfng9HzS1wAZBN1mFn55
BsjkhtCNJBL7p7j2dZ0+/mIz4rvbcKKoQWk4bWCtOJOE6G8MO8ZMZgDw+i3WnHT1
6zdnxzRUtc7t8zSbnTrlhqFwIaEqTGwX+c4sj2l2zZTKTiV9h4at1u4ndgVvaGbf
0qcP4QTwzuXcbVhOfqmValIbBYmBg8Y3iSId9SkaeqlfSMg3HNj4/fDRKmE9LLc=
=I24S
-----END PGP SIGNATURE-----

--o3KXTmHwipfAWiFCubJAFJqvGtXHKJiUf--
