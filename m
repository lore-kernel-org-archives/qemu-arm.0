Received: by 10.25.208.211 with SMTP id h202csp75559lfg;
        Wed, 23 Mar 2016 07:31:29 -0700 (PDT)
X-Received: by 10.55.20.37 with SMTP id e37mr3995922qkh.8.1458743489526;
        Wed, 23 Mar 2016 07:31:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u24si2330614qku.113.2016.03.23.07.31.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 07:31:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aijon-0002hL-2U
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 10:31:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aijog-0002g5-2N
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 10:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aijob-0002ND-Rv
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 10:31:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1aijob-0002N9-MU; Wed, 23 Mar 2016 10:31:17 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id E6D2B804E4;
	Wed, 23 Mar 2016 14:31:16 +0000 (UTC)
Received: from [10.3.113.112] (ovpn-113-112.phx2.redhat.com [10.3.113.112])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2NEVGpP010732; Wed, 23 Mar 2016 10:31:16 -0400
To: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-3-git-send-email-peterx@redhat.com>
	<874mbyl64i.fsf@blackfin.pond.sub.org>
	<20160323041429.GG28183@pxdev.xzpeter.org>
	<87egb1bjxe.fsf@blackfin.pond.sub.org>
	<20160323120449.GT28183@pxdev.xzpeter.org>
	<87wpot47bo.fsf@blackfin.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56F2A8B3.1000701@redhat.com>
Date: Wed, 23 Mar 2016 08:31:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <87wpot47bo.fsf@blackfin.pond.sub.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="HG2BwXCC7eN16CpEwb8JQSIoUGge43u8E"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	mdroth@linux.vnet.ibm.com, abologna@redhat.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 2/5] arm: qmp: add
 query-gic-capabilities interface
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
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
X-TUID: 5SYc4jyuVjg+

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HG2BwXCC7eN16CpEwb8JQSIoUGge43u8E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/23/2016 08:06 AM, Markus Armbruster wrote:

>>> query-gic-capabilities looks like it fundamentally returns a list of
>>> capabilities.  Returning ['GICCapability'] is just fine then.
>>
>> I have posted v6 just as Eric has suggested. At least one advantage
>> is that it is easier to be extended (if needed) in the future, also
>> to follow the more-generic format to use dicts rather than
>> arrays. If you would not mind, I'll keep the dict interface there.
>=20
> Returning such a list of a structured type is a well-established
> convention by now --- qmp-introspect.c shows 28 commands doing it, most=

> of them named query-FOO.  I'd rather not start a different convention
> now, just because we got temporarily confused about our own rules.  So,=

> unless there's something about query-gic-capabilities that makes it mor=
e
> likely to need extension outside its list element type, let's stick to
> returning the list.
>=20
> Eric?

Makes sense to me, and perhaps my own fault for getting confused by not
even trying to delete just the whitelist line and seeing what would
happen.  Having a consistent style of query-* returning an array type is
reasonable to continue.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--HG2BwXCC7eN16CpEwb8JQSIoUGge43u8E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJW8qizAAoJEKeha0olJ0NqsekIAKsdmC4VM8UgGzCZu48Xemnh
CWjIRVLcbnTxtTN9Fe+VOePfHeTxtMCqjlfm1HmgIwBc16ns66HKCBHXgqFQllSi
X7L0r1K8uotPlbgFlIOgdsk4BptBoIexggIvzAelG9KBFbuvojskJV8T6IPpEP74
xXfjMDIZ5t4AbqV01IInQOwKOREkte0pWQBYWmdK5dcTRkqvrskrpdnHE4EJdxML
Fxcy1n/t2hBNJ31gEIvoF/OASHBrmv8wN800DjPbmDpobLaat9W3B/bDcyRoAnML
mNYLEIwO7usy55j2DEM2bniRfJFUwXFuHlugS3jqUrriWVMRNtEXDl5TVNCzIvQ=
=FWD2
-----END PGP SIGNATURE-----

--HG2BwXCC7eN16CpEwb8JQSIoUGge43u8E--
