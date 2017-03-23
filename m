Received: by 10.25.15.230 with SMTP id 99csp766165lfp;
        Thu, 23 Mar 2017 06:52:59 -0700 (PDT)
X-Received: by 10.200.47.208 with SMTP id m16mr2237223qta.103.1490277179649;
        Thu, 23 Mar 2017 06:52:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m12si3733971qtf.141.2017.03.23.06.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Mar 2017 06:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56616 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cr3Ah-0001nF-6S
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 09:52:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cr3Ac-0001n9-13
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 09:52:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cr3AZ-0007Bi-0W
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 09:52:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cr3AY-0007B5-OD; Thu, 23 Mar 2017 09:52:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 476233B755;
	Thu, 23 Mar 2017 13:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 476233B755
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 476233B755
Received: from [10.10.121.124] (ovpn-121-124.rdu2.redhat.com [10.10.121.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC0E160BEF;
	Thu, 23 Mar 2017 13:52:46 +0000 (UTC)
To: He Chen <he.chen@linux.intel.com>, Andrew Jones <drjones@redhat.com>
References: <1490175166-19785-1-git-send-email-he.chen@linux.intel.com>
	<20170322103405.rcye74zye6gvrfis@hawk.localdomain>
	<20170323072335.GC10166@he>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <4c620bdf-5979-38f5-8dc2-74641c627151@redhat.com>
Date: Thu, 23 Mar 2017 08:52:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170323072335.GC10166@he>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="aSlSVi119flFnvmNsdRmavNEsFwfjtXJJ"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 23 Mar 2017 13:52:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] Allow setting NUMA distance
 for different NUMA nodes
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rqb6pAQlGSTF

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aSlSVi119flFnvmNsdRmavNEsFwfjtXJJ
Content-Type: multipart/mixed; boundary="X5IIEQKDxaoPhhQn8aqkTWl624HTwslfe";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: He Chen <he.chen@linux.intel.com>, Andrew Jones <drjones@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Message-ID: <4c620bdf-5979-38f5-8dc2-74641c627151@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3] Allow setting NUMA distance for different
 NUMA nodes
References: <1490175166-19785-1-git-send-email-he.chen@linux.intel.com>
 <20170322103405.rcye74zye6gvrfis@hawk.localdomain>
 <20170323072335.GC10166@he>
In-Reply-To: <20170323072335.GC10166@he>

--X5IIEQKDxaoPhhQn8aqkTWl624HTwslfe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/23/2017 02:23 AM, He Chen wrote:

>>> -numa dist,src=3D1,dst=3D0,val=3D21 \

>>
>> And maybe should also point out how to set an unreachable node with 25=
5.
>>
> Thanks for your careful review. Regarding setting unreachable node,
> which way is good? Set exact 255 as distance or distance that is larger=

> than 255 is regarded as unreachable?

Given that you spec'd val as 'uint8', you can't pass a value for
distance that is larger than 255.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--X5IIEQKDxaoPhhQn8aqkTWl624HTwslfe--

--aSlSVi119flFnvmNsdRmavNEsFwfjtXJJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY09MoAAoJEKeha0olJ0NqEDsH/0kauDQHjgH93I+2C7D78tXZ
XuJwTAsx35eolxLFYPasKbwrQ4QRsR/4DQB+enX12LTbaqNCWyw/UQu8ZyI9yDBM
4KuLxXD+LWFOfyKFjf9nAmtRJlaPzgvaXhHuoJRY+jjUxBIRGCf1cYQdacodhASm
1CB9b2FsqjSy7i3Ye03zqs3F6MtqvIL1IxYrRuKxUjhtqnDLQmwS6a3yEMtscikh
zAVXrRz7/ZCdv3jWtoVI832Gj7IZEOc4CyMbbwllshsNLMN1VCuW7mwFvPyGgG5D
FspF+htjYieTUNKRyNzigQ3scHKg/7M6pG/f8oBs3BpiQT+CF7DCLc8Gs/c5WwY=
=VMmG
-----END PGP SIGNATURE-----

--aSlSVi119flFnvmNsdRmavNEsFwfjtXJJ--
