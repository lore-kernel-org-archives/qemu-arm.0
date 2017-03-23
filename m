Received: by 10.25.15.230 with SMTP id 99csp753598lfp;
        Thu, 23 Mar 2017 06:23:50 -0700 (PDT)
X-Received: by 10.55.110.198 with SMTP id j189mr2270230qkc.107.1490275430022;
        Thu, 23 Mar 2017 06:23:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c139si3676112qka.1.2017.03.23.06.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Mar 2017 06:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cr2iT-0008K4-FI
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 09:23:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cr2iN-0008Jy-3u
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 09:23:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cr2iJ-0004ZN-V3
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 09:23:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45070)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cr2iJ-0004Yq-Lx; Thu, 23 Mar 2017 09:23:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 875CE61E50;
	Thu, 23 Mar 2017 13:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 875CE61E50
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 875CE61E50
Received: from [10.10.121.124] (ovpn-121-124.rdu2.redhat.com [10.10.121.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D14A7D68A;
	Thu, 23 Mar 2017 13:23:34 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-23-git-send-email-imammedo@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <c22d6e03-e63c-6a90-e9f3-419255c2c4d2@redhat.com>
Date: Thu, 23 Mar 2017 08:23:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490189568-167621-23-git-send-email-imammedo@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="joBDmX8SifM9LJm99qNarDjcdWPvlNogk"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 23 Mar 2017 13:23:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-2.10 22/23] numa: add '-numa cpu,
 ...' option for property based node mapping
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFKrPTVlT+kv

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--joBDmX8SifM9LJm99qNarDjcdWPvlNogk
Content-Type: multipart/mixed; boundary="FwbJrnhxjVArcoC6OIDdAOOglnCaAHHWa";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Shannon Zhao
 <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Message-ID: <c22d6e03-e63c-6a90-e9f3-419255c2c4d2@redhat.com>
Subject: Re: [PATCH for-2.10 22/23] numa: add '-numa cpu,...' option for
 property based node mapping
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
 <1490189568-167621-23-git-send-email-imammedo@redhat.com>
In-Reply-To: <1490189568-167621-23-git-send-email-imammedo@redhat.com>

--FwbJrnhxjVArcoC6OIDdAOOglnCaAHHWa
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/22/2017 08:32 AM, Igor Mammedov wrote:
> legacy cpu to node mapping is using cpu index values to map
> VCPU to node with help of '-numa node,nodeid=3Dnode,cpus=3Dx[-y]'
> option. However cpu index is internal concept and QEMU users
> have to guess /reimplement qemu's logic/ to map it to
> a concrete cpu socket/core/thread to make sane CPUs
> placement across numa nodes.
>=20
> This patch allows to map cpu objects to numa nodes using
> the same properties as used for cpus with -device/device_add
> (socket-id/core-id/thread-id/node-id).
>=20
> At present valid properties/values to address CPUs could be
> fetched using hotpluggable-cpus monitor/qmp command, it will
> require user to start qemu twice when creating domain to fetch
> possible CPUs for a machine type/-smp layout first and
> then the second time with numa explicit mapping for actual
> usage. The first step results could be saved and reused to
> set/change mapping later as far as machine type/-smp stays
> the same.
>=20
> Proposed impl. supports exact and wildcard matching to
> simplify CLI and allow to set mapping for a specific cpu
> or group of cpu objects specified by matched properties.
>=20
> For example:
>=20
>    # exact mapping x86
>    -numa cpu,node-id=3Dx,socket-id=3Dy,core-id=3Dz,thread-id=3Dn
>=20
>    # exact mapping SPAPR
>    -numa cpu,node-id=3Dx,core-id=3Dy
>=20
>    # wildcard mapping, all cpu objects that match socket-id=3Dy
>    # are mapped to node-id=3Dx
>    -numa cpu,node-id=3Dx,socket-id=3Dy
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  numa.c           | 13 +++++++++++++
>  qapi-schema.json |  7 +++++--
>  qemu-options.hx  | 23 ++++++++++++++++++++++-
>  3 files changed, 40 insertions(+), 3 deletions(-)
>=20

> =20
> +@samp{cpu} option is new alternative to @samp{cpus} option

s/is/is a/

> +uses @samp{socket-id|core-id|thread-id} properties to assign

s/uses/which uses/

> +CPU objects to a @var{node} using topology layout properties of CPU.
> +Set of properties is machine specific, and depends on used machine

s/Set/The set/

> +type/@samp{smp} options. It could be queried with @samp{hotpluggable-c=
pus}
> +monitor command.
> +@samp{node-id} property specifies @var{node} to which CPU object
> +will be assigned, it's required for @var{node} to be declared
> +with @samp{node} option before it's used with @samp{cpu} option.
> +
> +For example:
> +@example
> +-M pc \
> +-smp 1,sockets=3D2,maxcpus=3D2 \
> +-numa node,nodeid=3D0 -numa node,nodeid=3D1 \
> +-numa cpu,node-id=3D0,socket-id=3D0 -numa cpu,node-id=3D1,socket-id=3D=
1
> +@end example
> +
>  @samp{mem} assigns a given RAM amount to a node. @samp{memdev}
>  assigns RAM from a given memory backend device to a node. If
>  @samp{mem} and @samp{memdev} are omitted in all nodes, RAM is
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--FwbJrnhxjVArcoC6OIDdAOOglnCaAHHWa--

--joBDmX8SifM9LJm99qNarDjcdWPvlNogk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY08xUAAoJEKeha0olJ0NqPNgH/3zKqCfYxhGsSAZ0Mto4OcC+
dFWGQsi3BT9/6OkzmCpR/SHNu0PbG6XuzDo9NQSB2VuQWBXrCGDUtmeyht+4xdJ5
dtPwgHdhyUKUT/v6h+cDnBMM8rGqb+eai5I/Rt6/50bSgYIjMvrK7V67lZL5hBr8
PD/XyArVwbt0oRZw17BtLHdL+DHZxFKXShTGKfTY5t9crieNNnh0UhqWoC2fW2Fa
XOEaRffSlxOUiiaGfP5y6OguAVvDpNRWR/smswhFMpgW6PXFFrVg09hJm9c13JFw
yT3KLNs5UMA4hmeNcw6yPFFZvkxrEIZFM5kj6IS7ONhBr0VtEVJ9+x7q4EvxaD8=
=01YH
-----END PGP SIGNATURE-----

--joBDmX8SifM9LJm99qNarDjcdWPvlNogk--
