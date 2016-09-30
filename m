Received: by 10.80.163.71 with SMTP id 65csp373471edn;
        Fri, 30 Sep 2016 11:37:10 -0700 (PDT)
X-Received: by 10.237.54.98 with SMTP id e89mr8838344qtb.5.1475260629786;
        Fri, 30 Sep 2016 11:37:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si3866780qkq.98.2016.09.30.11.37.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Sep 2016 11:37:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bq2gH-0003QQ-8X
	for alex.bennee@linaro.org; Fri, 30 Sep 2016 14:37:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bq2gD-0003QH-Qz
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 14:37:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bq2gA-0004Uv-02
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 14:37:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bq2g9-0004Ud-MT; Fri, 30 Sep 2016 14:37:01 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E94CB8E3E2;
	Fri, 30 Sep 2016 18:37:00 +0000 (UTC)
Received: from [10.3.116.116] (ovpn-116-116.phx2.redhat.com [10.3.116.116])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8UIb0tr019718; Fri, 30 Sep 2016 14:37:00 -0400
To: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <1475230780-8669-1-git-send-email-edgar.iglesias@gmail.com>
	<4496a78f-e527-fae4-0bc5-a9f1c0d5c997@redhat.com>
	<20160930104909.GD9606@toto>
	<CAFEAcA_6VUj5VDNTiRz1-hST=-AQD+tOneMy1-x7qYjt68YLFQ@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <83fc8d2a-2dd6-261c-ffdb-dda8881a5c25@redhat.com>
Date: Fri, 30 Sep 2016 13:36:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_6VUj5VDNTiRz1-hST=-AQD+tOneMy1-x7qYjt68YLFQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="OvFTxCd0GCkXD9VALLGUfTFfLXWNX0Ppu"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 30 Sep 2016 18:37:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix
 decoding of iss_sf in disas_ld_lit
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 99hapceyZZ3x

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OvFTxCd0GCkXD9VALLGUfTFfLXWNX0Ppu
Content-Type: multipart/mixed; boundary="jH8vQhjckt6axL9PrTnA0gcOUEigoQRHl";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, Thomas Huth
 <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Message-ID: <83fc8d2a-2dd6-261c-ffdb-dda8881a5c25@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix decoding of
 iss_sf in disas_ld_lit
References: <1475230780-8669-1-git-send-email-edgar.iglesias@gmail.com>
 <4496a78f-e527-fae4-0bc5-a9f1c0d5c997@redhat.com>
 <20160930104909.GD9606@toto>
 <CAFEAcA_6VUj5VDNTiRz1-hST=-AQD+tOneMy1-x7qYjt68YLFQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_6VUj5VDNTiRz1-hST=-AQD+tOneMy1-x7qYjt68YLFQ@mail.gmail.com>

--jH8vQhjckt6axL9PrTnA0gcOUEigoQRHl
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/30/2016 12:34 PM, Peter Maydell wrote:
>>>> +        bool iss_sf =3D opc =3D=3D 0 ? false : true;

Feels like a double negative.

>>>
>>> You could simplify that to:
>>>
>>>       bool iss_sf =3D !(opc =3D=3D 0);
>>
>> I don't really see how that is simpler/clearer.
>>
>> I considered:
>> bool iss_sf =3D opc !=3D 0;

Or even shorter:

bool iss_sf =3D !opc;

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--jH8vQhjckt6axL9PrTnA0gcOUEigoQRHl--

--OvFTxCd0GCkXD9VALLGUfTFfLXWNX0Ppu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX7rDLAAoJEKeha0olJ0NqmGcH/j9WW7QdREPwvLuO2WDTM1kx
6Jq1y9XngSlfwDTJd9NKE5jCaTfdBzGfgubkyg/JxYXVhzbHs73+QcU009KaUrdd
yB0cN03Xx3I5oqUz4LtBeBdnX1B1DFeI958WY1pEbHwbv3VCMkfLcjMB8WE20OKb
8V9Jf5YtR7tXKHOvWVYWat8qXdRd/DeaY3XqKjdjWSf3U3R0W8P851hxUg8xd9TB
q+qHMKwL87e2P0nKYE6dzvNTd8dFtcSHn17EYhCxlKlxrVkY5HDZXIJEeQNu3aTD
MnCCfRVFc/UzyoFQtwUMpJdZLWW9p9lT6aUmEVkEWkQSNBjo6XB9j4J4kDmNaAg=
=M1y5
-----END PGP SIGNATURE-----

--OvFTxCd0GCkXD9VALLGUfTFfLXWNX0Ppu--
