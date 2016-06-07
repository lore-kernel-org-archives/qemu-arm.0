Received: by 10.25.27.66 with SMTP id b63csp2207462lfb;
        Tue, 7 Jun 2016 14:09:03 -0700 (PDT)
X-Received: by 10.55.163.65 with SMTP id m62mr1573272qke.21.1465333741827;
        Tue, 07 Jun 2016 14:09:01 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4si16285293qht.28.2016.06.07.14.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 14:09:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAOFB-0002fL-9h
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 17:09:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAODv-000245-9E
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 17:07:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAODt-0007XF-46
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 17:07:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59791)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bAODm-0007UT-T4; Tue, 07 Jun 2016 17:07:34 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70B4D112D8E;
	Tue,  7 Jun 2016 21:07:34 +0000 (UTC)
Received: from [10.3.116.88] (ovpn-116-88.phx2.redhat.com [10.3.116.88])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57L7XJY001758; Tue, 7 Jun 2016 17:07:33 -0400
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-3-git-send-email-imammedo@redhat.com>
	<20160607202544.GF18662@thinpad.lan.raisama.net>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57573795.9050600@redhat.com>
Date: Tue, 7 Jun 2016 15:07:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20160607202544.GF18662@thinpad.lan.raisama.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="QSq3gMFkg7AVMWV65C7oPvdi0RIEra2tm"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 07 Jun 2016 21:07:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 02/10] target-i386: cpu: move features
 logic that requires CPUState to realize time
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ArvkEa/GbSpS

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QSq3gMFkg7AVMWV65C7oPvdi0RIEra2tm
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/07/2016 02:25 PM, Eduardo Habkost wrote:

> [...]
>> +    /* TODO: convert plus_features & minus_features static vars
>> +     * to global properties, once broken host_features is fixed
>> +     */
>=20
> I will rewrite this to:
>=20
>     /*TODO: cpu->host_features inclurrectly overwrites features

Was that supposed to be "incorrectly" or "currently"?

>      * set using "feat=3Don|off". Once we fix this, we can convert
>      * plus_features & minus_features to global properties
>      * inside x86_cpu_parse_featurestr() too.
>      */


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--QSq3gMFkg7AVMWV65C7oPvdi0RIEra2tm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXVzeVAAoJEKeha0olJ0NqfEkH/07+lRfdyROeDi1vySVM0tLS
d4i8UwNlEKOuRWGFlL2+clc+vVhTtt2+A8NMT2hl1y67cq7oMoQYJfVUS5avjZ7C
w/L/vFRWbU6/aQhLvYo0n6jxFZh9LZFWM2/IAZ51Cq4m1GJmElVScwj4DjogF4Jm
CkBryo9oB4hgKsF+AWb5/ywBei4qeZYSWWYaMmZ8/LRfLFwgYyHAPae8tNavQ1UT
R+ltLeWam8KGHRklcpu9Jw60MEJqAgSendLGvLObExI7PD/swrad+y0uwQXusV+U
W+/Lyayf3G0Q+Weuofq5nNdbtj5uiecb9eU5ArpIv2XFho4ZRnerHlh5LGA5eZQ=
=s2zD
-----END PGP SIGNATURE-----

--QSq3gMFkg7AVMWV65C7oPvdi0RIEra2tm--
