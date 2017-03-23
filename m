Received: by 10.25.15.230 with SMTP id 99csp751806lfp;
        Thu, 23 Mar 2017 06:19:53 -0700 (PDT)
X-Received: by 10.200.43.149 with SMTP id m21mr2454286qtm.102.1490275193754;
        Thu, 23 Mar 2017 06:19:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n82si2461599qki.336.2017.03.23.06.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Mar 2017 06:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cr2ef-0006wK-7j
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 09:19:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cr2eZ-0006vw-E6
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 09:19:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cr2eT-0003B5-Ja
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 09:19:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58100)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cr2eT-0003Ae-Bj; Thu, 23 Mar 2017 09:19:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CFDC8E71F;
	Thu, 23 Mar 2017 13:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8CFDC8E71F
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8CFDC8E71F
Received: from [10.10.121.124] (ovpn-121-124.rdu2.redhat.com [10.10.121.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E1E7A569E;
	Thu, 23 Mar 2017 13:19:26 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-16-git-send-email-imammedo@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <59448b66-430d-48a1-cf98-541873c87cb7@redhat.com>
Date: Thu, 23 Mar 2017 08:19:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490189568-167621-16-git-send-email-imammedo@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="P1T8rw3QOnNhb7OK8Xe149ex66f6mQU1N"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 23 Mar 2017 13:19:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-2.10 15/23] QMP: include
 CpuInstanceProperties into query_cpus output output
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
X-TUID: klVYV95MamS4

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--P1T8rw3QOnNhb7OK8Xe149ex66f6mQU1N
Content-Type: multipart/mixed; boundary="nFUW7QmDvIoQsvWjpN4hFtpcW0QDimEGD";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Shannon Zhao
 <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Message-ID: <59448b66-430d-48a1-cf98-541873c87cb7@redhat.com>
Subject: Re: [PATCH for-2.10 15/23] QMP: include CpuInstanceProperties into
 query_cpus output output
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
 <1490189568-167621-16-git-send-email-imammedo@redhat.com>
In-Reply-To: <1490189568-167621-16-git-send-email-imammedo@redhat.com>

--nFUW7QmDvIoQsvWjpN4hFtpcW0QDimEGD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/22/2017 08:32 AM, Igor Mammedov wrote:
> if board supports CpuInstanceProperties, report them for
> each CPU thread listed. Main motivation for this is to
> provide these properties introspection via QMP interface
> for using in test cases to verify numa node to cpu mapping,
> which includes not only boards that support cpu hotplug
> and have this info in query-hotpluggable-cpus (pc/spapr)
> but also for boards that don't not support hotpluggable-cpus
> but support numa mapping (virt-arm).
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---

> @@ -1860,6 +1863,12 @@ CpuInfoList *qmp_query_cpus(Error **errp)
>  #else
>          info->value->arch =3D CPU_INFO_ARCH_OTHER;
>  #endif
> +        if ((info->value->has_props =3D !!mc->cpu_index_to_instance_pr=
ops)) {

checkpatch.pl doesn't flag that? We generally try to avoid side-effects
inside conditionals.

> +            CpuInstanceProperties *props;
> +            props =3D g_malloc0(sizeof(*props));
> +            *props =3D mc->cpu_index_to_instance_props(ms, cpu->cpu_in=
dex);
> +            info->value->props =3D  props;

Why two spaces after =3D?

With those cleaned up,
Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--nFUW7QmDvIoQsvWjpN4hFtpcW0QDimEGD--

--P1T8rw3QOnNhb7OK8Xe149ex66f6mQU1N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY08tcAAoJEKeha0olJ0Nq+VkIAIsuKx1YXnvSqeuJvsKry60q
FPqiyvM7dAxlxVfW+vZhQgyOedBrQ6d4k6kRKODGmm93R6bSItdEwTX1vfAeVOpt
NwyE3VGWqCKQkgN4TVkJNIMmPFo5aanQpoN2ZqiqV6+0Uzh7Kv3jtGpb54XEBkZI
0ykdx2O3PRWySWkD9DrcKhQAGRQwJbuIjg/E9vFjZl/w+TjbgjYMKI5kj7LJ2EEG
xuwTga8YSUEwXNOPk5FYguDq/0OaLRFqI5DSklzhY6xRVawTrcX2zYNF1U6yFGsT
o4vk0qvFIsBk86tuuKDySiK8vDAw+dokJ0xlWjRUJml4lc4YHRJK2BsyXSnuIBg=
=p5hB
-----END PGP SIGNATURE-----

--P1T8rw3QOnNhb7OK8Xe149ex66f6mQU1N--
