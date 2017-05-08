Received: by 10.25.0.198 with SMTP id 189csp1390409lfa;
        Mon, 8 May 2017 07:32:07 -0700 (PDT)
X-Received: by 10.237.53.184 with SMTP id c53mr8304832qte.227.1494253927580;
        Mon, 08 May 2017 07:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494253927; cv=none;
        d=google.com; s=arc-20160816;
        b=R3+fWtl4Lqvavbr2XeSFoK7mwTLReAuZ5ZajJHPhUx9zarFCpDNLf5kar5h7+SqH7n
         LTgN0eoxRVZDwb7Y4wyZ7N9Fycpy3rh5nUymQ5F/Bj2K0YJDVdehnNIOWnOH/jzlzFTt
         nozp2GDOpDPYHXfflwtEY6ij0VGQV8TdRQlIxb9E0rmCU36W9Z4i1XQpR1gCSM8tA84t
         3P+HODbpy0xB2awy3VtOCQvsHadtCNPle9ir/sKPgRhrb9aM0IHYT3pbr/ilLGI436pq
         D1RD+8pz6r5LXaJy7rFOKxjTGJTak7xsi5yYo/A4uMRBlcuHVsSeNE1O9l7pxPHW4mAB
         SV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=9jNODnBYheSyBbYmrFmceA1+Yxi0W1wBIlTuoGsK2vA=;
        b=v4XRBERdvs789oIttbKWx3Yf1pS7g80UmrXNwHpI+BgB/ogruDK6a6zYBnL1BlhQZu
         Q8EnhQ+4IdT43EG1hyO+8+XDgLzjxoUfU1UQeOmfHZjVnv7DS7/Zc4RSE6cBbpXLp7uy
         /g23pw+RY/3ENIyqr5RHKUtEXHGKwx8ieEaOEiZCBIWLZu/qg573GBI5Vu3OuFsaY3Sr
         t8G3L93/ECr+w+48t4zNaN+b1zIBVATV5WgwHbdpwIg+F45e2+wl4U2O2ucePCOJUP3R
         poMHf/McK7IJHTU0IRoZVyDHm/YIa/LRpqBaixt2GaZ4fDlZ2R02gBJBpww4E5zNTuOu
         IXUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 32si12958123qkw.336.2017.05.08.07.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 May 2017 07:32:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7jhn-0006oI-0E
	for alex.bennee@linaro.org; Mon, 08 May 2017 10:32:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d7jXo-000614-NU
	for qemu-arm@nongnu.org; Mon, 08 May 2017 10:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d7jXk-0005Js-LV
	for qemu-arm@nongnu.org; Mon, 08 May 2017 10:21:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46539)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d7jXk-0005JX-C7; Mon, 08 May 2017 10:21:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EDF23D957;
	Mon,  8 May 2017 14:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6EDF23D957
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 6EDF23D957
Received: from [10.10.122.86] (ovpn-122-86.rdu2.redhat.com [10.10.122.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 819BF85A50;
	Mon,  8 May 2017 14:21:41 +0000 (UTC)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20170507113540.8687-1-krzk@kernel.org>
	<20170507113540.8687-4-krzk@kernel.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <f8b021fa-e3f8-50d7-8013-d67e66e25ce6@redhat.com>
Date: Mon, 8 May 2017 09:21:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170507113540.8687-4-krzk@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="f7DB2ABJN9Mfl5VVjmTDukd1KvTHtcrdb"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 08 May 2017 14:21:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/exynos: Add support
 for system poweroff
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lKqfxA1VOuJc

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f7DB2ABJN9Mfl5VVjmTDukd1KvTHtcrdb
Content-Type: multipart/mixed; boundary="7VSD1739bWsPnT4lkTdTKAs7Malje49Ko";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f8b021fa-e3f8-50d7-8013-d67e66e25ce6@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 3/3] hw/arm/exynos: Add support for system
 poweroff
References: <20170507113540.8687-1-krzk@kernel.org>
 <20170507113540.8687-4-krzk@kernel.org>
In-Reply-To: <20170507113540.8687-4-krzk@kernel.org>

--7VSD1739bWsPnT4lkTdTKAs7Malje49Ko
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/07/2017 06:35 AM, Krzysztof Kozlowski wrote:
> On all Exynos-based boards, the system powers down itself by driving
> PS_HOLD signal low.  Handle writing to respective PMU register to fix
> power off failure:
>=20
>     reboot: Power down
>     Unable to poweroff system
>     shutdown: 31 output lines suppressed due to ratelimiting
>     Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x00=
000000
>=20
>     CPU: 0 PID: 1 Comm: shutdown Not tainted 4.11.0-rc8 #846
>     Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>     [<c031050c>] (unwind_backtrace) from [<c030ba6c>] (show_stack+0x10/=
0x14)
>     [<c030ba6c>] (show_stack) from [<c05b2800>] (dump_stack+0x88/0x9c)
>     [<c05b2800>] (dump_stack) from [<c03d3140>] (panic+0xdc/0x268)
>     [<c03d3140>] (panic) from [<c0343614>] (do_exit+0xa90/0xab4)
>     [<c0343614>] (do_exit) from [<c035f2dc>] (SyS_reboot+0x164/0x1d0)
>     [<c035f2dc>] (SyS_reboot) from [<c0307c80>] (ret_fast_syscall+0x0/0=
x3c)
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  hw/misc/exynos4210_pmu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

> @@ -397,6 +398,12 @@ typedef struct Exynos4210PmuState {
>      uint32_t reg[PMU_NUM_OF_REGISTERS];
>  } Exynos4210PmuState;
> =20
> +static void exynos4210_pmu_poweroff(void)
> +{
> +    PRINT_DEBUG("QEMU PMU: PS_HOLD bit down, powering off\n");
> +    qemu_system_shutdown_request();

Depending on whether your patch lands before or after mine, we'll have
to update this. It sounds like it is a guest-triggered reset, so my
patch would have this use SHUTDOWN_CAUSE_GUEST_SHUTDOWN.

https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg01380.html

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--7VSD1739bWsPnT4lkTdTKAs7Malje49Ko--

--f7DB2ABJN9Mfl5VVjmTDukd1KvTHtcrdb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZEH70AAoJEKeha0olJ0NqrnYH/2B0h0Z1on6J33t3X+BIRAJi
u9cLRxp3+TYgjDfQa88bkUPgHLBFsOQbX2Hf2A1z48WZnGrULgW0D89LzHH45fYY
MGGVLfbVijp9tMjPjyVQkygABvbJ1mcWB2Bg2zBGw78xmg1ZPvexd+w0Gr2wkofh
v8Mu8hS3acmRZLU7JA1BkxxQUtAyGycdVXnaErhNLiLELOdx5ryS9Ntw0q5+qiBE
3CbRQJ4yPma/faaxLimZEucCLvplxaynnOUMolDI7aAxfRrOEstrXoV7woaNbRT6
B9kvTheWZAVF1k65IB06hSa4g2lSUnpQwru/BoGv6TixPpZOn03SPbSvKDwRIK0=
=ks00
-----END PGP SIGNATURE-----

--f7DB2ABJN9Mfl5VVjmTDukd1KvTHtcrdb--
