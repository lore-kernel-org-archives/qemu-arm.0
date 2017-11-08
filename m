Received: by 10.223.150.237 with SMTP id u100csp1382897wrb;
        Wed, 8 Nov 2017 07:00:58 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QUkdX4x0uEGtBc/VX/vnCsSFEh8dJ9gshUxt9I0a00BDRedplPl2SshGuXg5hJ6bJlV5b6
X-Received: by 10.37.115.203 with SMTP id o194mr532528ybc.437.1510153258281;
        Wed, 08 Nov 2017 07:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510153258; cv=none;
        d=google.com; s=arc-20160816;
        b=px1c/uznHzI2VgURhIUacIJjnMrFYzj9uRw5AVU/Waojuw0+UoM73p7jH5VN2skPMN
         z6gvYYOUVnHyxCWLEta4REq60Z+vL6q8DSvMt1laOFGBiBRUvB/UL2BYdENl9fjzcH75
         F/rkm/SD3FZePbkiF08uQuyDcD6dTgABON4wuoFyvOzbNDfJHEvUTYN+xpYmDvz47Ied
         DPiua5NpOeS5stUGdpgwVP3aSsFM7Q6gJ0q4qtuOqs7ulUiw+2FxXdyQViHoHvn1ok+f
         Q1P+F39Ekd9lJEavPy/Cy82a5tiT33P3ZE9jXV5eChN5+APo12ViMJzTDr2+V4oH7Fzy
         Wrbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dmarc-filter:arc-authentication-results;
        bh=FCkivlTYgcsr9DMtFgh2ihKx8+lwaCuC5ypaP2cy1e4=;
        b=G6zE+yp7xMYtmiWsVT/C2/72epgyOZiHWjCxy3hwsVKrkssgaVn8Xg0eLSCey0YpW/
         gNPXxzXJGzi3xv2UjFSimeu2/ki78Z8nqNoGRzpqvH57B8dWcnaMofI9i4zIc1u0V/Hy
         1Sq7wp4nu6ZsK+kK4hbxTK5+D5q/aSiy4PV+x+/pJGozhW6HXqReN1mN1WKspP39iidg
         247JMBEOHKWSXBiEhceBcw1W39e9ulVdH2vZDZpmgFoTPkfQeqAhRvVUgzqk3IBcRQ4S
         MBKUtkWVXapW3O4ohV2d/ovXZO3Q5ObmzAluEbvlNPUh5ho2Hyjbmj+tsbM/b/8c8iMs
         pSDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t203si1037714ywe.337.2017.11.08.07.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Nov 2017 07:00:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCRqb-0000la-PP
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 10:00:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCRqN-0000lA-VN
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 10:00:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eCRqK-00038S-2s
	for qemu-arm@nongnu.org; Wed, 08 Nov 2017 10:00:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35513)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eCRqJ-00037X-QG; Wed, 08 Nov 2017 10:00:40 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6825C62676;
	Wed,  8 Nov 2017 15:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6825C62676
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.125.14] (ovpn-125-14.rdu2.redhat.com [10.10.125.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E28F26BF74;
	Wed,  8 Nov 2017 15:00:24 +0000 (UTC)
To: Alistair Francis <alistair23@gmail.com>,
	Markus Armbruster <armbru@redhat.com>
References: <cover.1508390588.git.alistair.francis@xilinx.com>
	<ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
	<87efpmccvu.fsf@secure.laptop> <87bmke4cu9.fsf@dusky.pond.sub.org>
	<51d103e9-8d6b-8c83-dd69-effe997d4813@redhat.com>
	<87shdptdf0.fsf@dusky.pond.sub.org>
	<CAKmqyKOhnGrbZ6tnaXgBNzdJ=LdnD9NWuWVV-LHmM3zea8OBvA@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <308c6070-e9b8-f40d-2389-96497dbe238d@redhat.com>
Date: Wed, 8 Nov 2017 09:00:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOhnGrbZ6tnaXgBNzdJ=LdnD9NWuWVV-LHmM3zea8OBvA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="kF2Ne2kcFoSMjrqnDiSc2XfQb1w9bXXj2"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 08 Nov 2017 15:00:38 +0000 (UTC)
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
	Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Anthony Perard <anthony.perard@citrix.com>, qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tcuX7Z/6lz8r

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kF2Ne2kcFoSMjrqnDiSc2XfQb1w9bXXj2
Content-Type: multipart/mixed; boundary="HlK2vbBoK3BTwrVSHObSjCdOTW6FxJQMW";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Alistair Francis <alistair23@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Fam Zheng <famz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Yongbok Kim <yongbok.kim@imgtec.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Alistair Francis <alistair.francis@xilinx.com>, John Snow
 <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <308c6070-e9b8-f40d-2389-96497dbe238d@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 01/46] Replace all occurances of
 __FUNCTION__ with __func__
References: <cover.1508390588.git.alistair.francis@xilinx.com>
 <ad7c1de551fbc497743e4dd60335a75cb5365a15.1508390588.git.alistair.francis@xilinx.com>
 <87efpmccvu.fsf@secure.laptop> <87bmke4cu9.fsf@dusky.pond.sub.org>
 <51d103e9-8d6b-8c83-dd69-effe997d4813@redhat.com>
 <87shdptdf0.fsf@dusky.pond.sub.org>
 <CAKmqyKOhnGrbZ6tnaXgBNzdJ=LdnD9NWuWVV-LHmM3zea8OBvA@mail.gmail.com>
In-Reply-To: <CAKmqyKOhnGrbZ6tnaXgBNzdJ=LdnD9NWuWVV-LHmM3zea8OBvA@mail.gmail.com>

--HlK2vbBoK3BTwrVSHObSjCdOTW6FxJQMW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/08/2017 08:51 AM, Alistair Francis wrote:

>>>> Let me rephrase the question: do we really support compilers that do=
n't
>>>> understand __func__?  The presence of numerous unconditional uses of=

>>>> __func__ in the tree means the answer is no.  Let's replace AUDIO_FU=
NC
>>>> by plain __func__.
>>>
>>> Answered elsewhere in patch 3/46 (where we DO replace AUDIO_FUNC by
>>> __func__).
>>
>> I see.
>>
>> Put 03/46 first, so we don't have to mess with AUDIO_FUNC twice?
>=20
> I would really like to avoid that, as the conflicts will be a bit of a
> mess. The way I see it there will be a lot of churn no matter what,
> so we don't gain much by swapping the order around.
>=20
> I have a new series ready to send today, so I'm going to send that
> through as I would like at least some of these patches to make it in
> 2.11. After that if you think strongly the order should be changed I
> can change it in the next version.

I think the reorder is not that hard.  Put 3/46 first (changing
AUDIO_FUNC to __func__), and then 1/46 doesn't have to touch any of the
files that used to use AUDIO_FUNC, because there is no intermediate
state using __FUNCTION__.

If I'm reading it correctly, the rebase conflict is limited to a slight
rewording of the commit message for 3/46, and one line in 1/46 to the
definition of AUDIO_FUNC (that will no longer be present).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--HlK2vbBoK3BTwrVSHObSjCdOTW6FxJQMW--

--kF2Ne2kcFoSMjrqnDiSc2XfQb1w9bXXj2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAloDHAcACgkQp6FrSiUn
Q2r23Qf+KWVL6ncuGiLwyij++5Xtg++Irybomd+ICJpYrF5KdV2xX2jl5EZW800/
aeseimOISxuXGTt14SnjzWC2FinRpD/X6ABjyp49CpjlT6ueglDRSXcHPS1CbJ2y
RFjZIN1TFAAk9vI1nafOKYKQhHxiKQ/qFYCF2XNuJmDEZwE2Bf+V5qp20MqejKIQ
0GM/PY3tAX1l921g+L+HrFUVTceyOXdCJCiy4zgzvc3nXfFv2EH2MvLuGj+XfffI
9vcTohI0eyocQb1zbcnpF6oU7kJPEcWV9B5xwhqkb53rjv7Isb9TKf4972doSDdM
vkCJbjm3IMRf5E7B3WwRSStCs8r26g==
=KiGA
-----END PGP SIGNATURE-----

--kF2Ne2kcFoSMjrqnDiSc2XfQb1w9bXXj2--
