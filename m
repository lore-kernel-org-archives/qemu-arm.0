Received: by 10.223.150.237 with SMTP id u100csp419816wrb;
        Tue, 7 Nov 2017 11:42:10 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SGAcGBiMu53e6T4DH73/mKekb3+4yEMWB5kIZQ8ZRecq7VIlYhMdsT+MhiSMAQSb/qW2GJ
X-Received: by 10.13.193.130 with SMTP id c124mr12191745ywd.372.1510083730145;
        Tue, 07 Nov 2017 11:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510083730; cv=none;
        d=google.com; s=arc-20160816;
        b=aHcJynK8lUnWjFNrn0oy6aBG746kHujC31yF2uu6OkGXjnEa3Vl/160xuKqZo3qtsm
         gmwKoNkSq8Igky3FwvkBNXux1tsp+zgVC9R61pDuh+b+IfVZ8hr0LccX3fMAPto+rUqM
         EstBNaOdprUq3gowM04jDS60evYYDdKhW4vhMysH3QWPrbiPlY6eHndlWYJ4a9JCJHeL
         fSHaCw2YUy5DJM+4khoqE+aHi1WOdDZtUCOZr1sf6hfr6RakDY0F5Q4Fn5oon6invfja
         Noo0Sw48M2xim5+dGpweYvSNogVXWU0z4TX7+4osti/eMoGknkVG9tRt13fEhDAL1tKe
         cdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dmarc-filter:arc-authentication-results;
        bh=nweyDG6a7Ou8zgzcvCLXD6MRDT79vLNgSK7niyvhDFI=;
        b=ErjSDyAncl9zEyITEmuuE3HY3cz7FPSkRgHnKLGM9dOSuPDMyAq3qqnsWCz09Jn4TQ
         3CTGA8LxVEZRXykVHRdT9dqaLrsf9a7dlhYlHKysynuGggdcyjDVQ0Z/3U8sfyBiC0zt
         82BKNWYWNwDd8JlaTpg+dyK+RBZB9p3jIHJfWfYygYum2iZVNAOHgSdhqiAtbD89yqxJ
         DSktM02i+2Vby4I9p7eUjyhtOcgpFFxQbDRSQnWzBA0v00iDUoRnbYWi6W2jTNZltH61
         xOwTq3je2U/spLmLIslQ9IaWiR52WT4mvT8gZneoppmFO44+vXaXf7S+WM7OcfyVNYhg
         3uxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m15si432430ybk.129.2017.11.07.11.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 11:42:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC9lB-0002tn-JO
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 14:42:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eC9l2-0002th-M5
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 14:42:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eC9ky-0000Bu-NO
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 14:42:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44314)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eC9ky-0000BW-Dx; Tue, 07 Nov 2017 14:41:56 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E62AE77356;
	Tue,  7 Nov 2017 19:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E62AE77356
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.125.14] (ovpn-125-14.rdu2.redhat.com [10.10.125.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B64E5D6A9;
	Tue,  7 Nov 2017 19:41:49 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
References: <cover.1508390588.git.alistair.francis@xilinx.com>
	<ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
	<87efpmccvu.fsf@secure.laptop> <87bmke4cu9.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <51d103e9-8d6b-8c83-dd69-effe997d4813@redhat.com>
Date: Tue, 7 Nov 2017 13:41:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <87bmke4cu9.fsf@dusky.pond.sub.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="uwwnaKEfqEtGFaKvKrIFwaQN0bnBoTLvE"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 07 Nov 2017 19:41:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 01/46] Replace all occurances
 of __FUNCTION__ with __func__
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
	qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, Yongbok Kim <yongbok.kim@imgtec.com>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>, alistair23@gmail.com,
	Alistair Francis <alistair.francis@xilinx.com>,
	John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z6wRPTVPXhQn

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uwwnaKEfqEtGFaKvKrIFwaQN0bnBoTLvE
Content-Type: multipart/mixed; boundary="KMxhjsg5dvL8Rq68pVOfEn9fvSi4eJ41O";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
 qemu-block@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 alistair23@gmail.com, Yongbok Kim <yongbok.kim@imgtec.com>,
 xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <51d103e9-8d6b-8c83-dd69-effe997d4813@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 01/46] Replace all occurances of
 __FUNCTION__ with __func__
References: <cover.1508390588.git.alistair.francis@xilinx.com>
 <ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
 <87efpmccvu.fsf@secure.laptop> <87bmke4cu9.fsf@dusky.pond.sub.org>
In-Reply-To: <87bmke4cu9.fsf@dusky.pond.sub.org>

--KMxhjsg5dvL8Rq68pVOfEn9fvSi4eJ41O
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/07/2017 04:12 AM, Markus Armbruster wrote:
> Juan Quintela <quintela@redhat.com> writes:
>=20
>> Alistair Francis <alistair.francis@xilinx.com> wrote:
>>> Replace all occurs of __FUNCTION__ except for the check in checkpatch=

>>> with the non GCC specific __func__.
>>>

>>> +++ b/audio/audio_int.h
>>> @@ -253,7 +253,7 @@ static inline int audio_ring_dist (int dst, int s=
rc, int len)
>>>  #define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
>>> =20
>>>  #if defined _MSC_VER || defined __GNUC__
>>> -#define AUDIO_FUNC __FUNCTION__
>>> +#define AUDIO_FUNC __func__
>>>  #else
>>>  #define AUDIO_FUNC __FILE__ ":" AUDIO_STRINGIFY (__LINE__)
>>>  #endif
>>
>> Unrelated to this patch ....
>> Do we really support other compilers than msc and gcc?
>=20
> Let me rephrase the question: do we really support compilers that don't=

> understand __func__?  The presence of numerous unconditional uses of
> __func__ in the tree means the answer is no.  Let's replace AUDIO_FUNC
> by plain __func__.

Answered elsewhere in patch 3/46 (where we DO replace AUDIO_FUNC by
__func__).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--KMxhjsg5dvL8Rq68pVOfEn9fvSi4eJ41O--

--uwwnaKEfqEtGFaKvKrIFwaQN0bnBoTLvE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAloCDH0ACgkQp6FrSiUn
Q2pS9wf9GG4eL9iiIJxwjd5vCijsO1/RHRiPat6+DtxuejIILHJbB6EY4hHBalDI
xcshnT6eisNHvHvfWotdTn6oymhEBN7eVYGJqXucv3qXcBKsiQJZDnVqn/opnBVE
FGpvAybwkFLOzUbQyRuoehW0qAbYmuFPVlOtMgepuzbpXZ2sv7DdCueIuBGj+6PQ
eMVGSzQtgfVbxS8jYvv8l34aOaZHNrWjqwPNiYTaqo83/56On8sSghw8qrAT3xHT
RfbwM4Hh2NI6xFR8VlaZcBEWStWT2nKH3Bzj6s/PCjPLk+GhAn8UolaLxPK9XKMa
oHpLZWepo/fzcXHMglQxA3JeT0PMVA==
=3gMk
-----END PGP SIGNATURE-----

--uwwnaKEfqEtGFaKvKrIFwaQN0bnBoTLvE--
