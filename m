Received: by 10.25.44.15 with SMTP id s15csp4873632lfs;
        Tue, 11 Jul 2017 07:00:40 -0700 (PDT)
X-Received: by 10.223.136.216 with SMTP id g24mr7207wrg.199.1499781640637;
        Tue, 11 Jul 2017 07:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499781640; cv=none;
        d=google.com; s=arc-20160816;
        b=FL4ZoORBqJc9XvWuCOMQGT853reKM2HjO7840i9H1O9+q9g9w/y0GAkw9y+eOwQILz
         orVpczy9EZEQNJ2MFvdfttBAWlDNJH44lTZ3UjOeAIObKzJfshC9/3rEL82LHalHCaZR
         eAbBIkt6WBZm0C4pAL9ammT5ObVEZsJkh4yTMotvH+WfC1rP1AoXVFsUOGb2Jpg5xsvg
         MFXTQATe43Gn/2neYHpu7PZJCcPPzKIuN0ep3oBJCproHVJhIzelqK3oJCdVoBKPJzpl
         buyVN0/lblzDTsx6O/Jn7TsnHv6OMNSbQV/YghZDbp53TWSU1rhQwMlmTHpZpuhAVfph
         S8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=kmuXy+IE4R1EDSSyJ4HDKaDIPkBeRYkec1rD8Pjd+is=;
        b=k2GceiQxVtU2TqGxkRB3CyymjnjyG88oOCUObWcANSEEmDHqbdxeQk2UAmhHdrjmw2
         T/asvsE0+KDHtSG8Jk13Ra1YpHZvYP+Vz6Ih4y7v4rKUHMglgsaVpQrsaS8K2Wv0ArAY
         3uOtCpcsoplyrguuI4c3uzO+sTTcpD99S6GuJtoZw5dHv3W0Sw88AOW1rPVS2SwvKtrt
         W6kbs4bvxaVA9HBbJrUSUptZH2uSCX64jOw5h5Qr/6qUpiWNP32KoJ5wBRWIRuRsNeQQ
         T4HxeyKDKB60ija3RwcWaif8XnKLFUPUZnF4kVtP3DLCCyHbMohWFfbCKakb399BPhFs
         Ju/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 191si9426035wmw.153.2017.07.11.07.00.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 07:00:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUviR-0007tu-JG
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 10:00:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dUvgb-0006Zx-5r
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 09:58:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dUvga-00059w-6c
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 09:58:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dUvgW-00056h-0B; Tue, 11 Jul 2017 09:58:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20C2A4E4CA;
	Tue, 11 Jul 2017 13:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 20C2A4E4CA
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 20C2A4E4CA
Received: from [10.10.121.60] (ovpn-121-60.rdu2.redhat.com [10.10.121.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA4EE5D6A6;
	Tue, 11 Jul 2017 13:58:29 +0000 (UTC)
To: Laszlo Ersek <lersek@redhat.com>, Dongjiu Geng <gengdongjiu@huawei.com>
References: <1499755579-31262-1-git-send-email-gengdongjiu@huawei.com>
	<366f019e-50e8-03f4-9b8f-946ef318ca79@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <d18b0a8d-5c34-ae4a-a60c-c451c8df9872@redhat.com>
Date: Tue, 11 Jul 2017 08:58:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <366f019e-50e8-03f4-9b8f-946ef318ca79@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="X7RUiSILkwpBBk3FE2Bnfwt9vaKtIpo77"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 11 Jul 2017 13:58:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH resend v4 0/3] Generate APEI GHES table and
 dynamically record CPER
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
Cc: peter.maydell@linaro.org, wuquanming@huawei.com, famz@redhat.com,
	mst@redhat.com, qemu-devel@nongnu.org, zhihui.gao@huawei.com,
	qemu-arm@nongnu.org, huangshaoyu@huawei.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com, zhengqiang10@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7d7UStHMBtUY

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X7RUiSILkwpBBk3FE2Bnfwt9vaKtIpo77
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>, Dongjiu Geng <gengdongjiu@huawei.com>
Cc: mst@redhat.com, imammedo@redhat.com, famz@redhat.com,
 qemu-devel@nongnu.org, zhaoshenglong@huawei.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, zhengqiang10@huawei.com, huangshaoyu@huawei.com,
 wuquanming@huawei.com, zhihui.gao@huawei.com
Message-ID: <d18b0a8d-5c34-ae4a-a60c-c451c8df9872@redhat.com>
Subject: Re: [PATCH resend v4 0/3] Generate APEI GHES table and dynamically
 record CPER
References: <1499755579-31262-1-git-send-email-gengdongjiu@huawei.com>
 <366f019e-50e8-03f4-9b8f-946ef318ca79@redhat.com>
In-Reply-To: <366f019e-50e8-03f4-9b8f-946ef318ca79@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/11/2017 08:43 AM, Laszlo Ersek wrote:
> So send the patches with
>=20
>   git send-email *.patch
>=20
> or put all the patches into a temporary directory, and run
>=20
>   git send-email patch-dir/

Or you can even skip patch files, and directly send things with one lass
chance in your editor:

git send-email -v5 -3 --annotate --cover-letter

[send the top three commits in my current git branch as a version 5
patch series, where I get to write the cover letter and tweak any of the
patches in my preferred $EDITOR before sending anything]

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--X7RUiSILkwpBBk3FE2Bnfwt9vaKtIpo77
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZZNmEAAoJEKeha0olJ0NqhF0H/31M+z6ICVFuXEDGNaZJAYAS
ToSGNkYIhgDTQA5QKrg3/Efm2rYR2CN8vxWDR/ax4MdF2CRUnPXCxSvTb/cSfBhe
vC7PXDoMdaJ5uzYccQkGoNG7g97v/kUNF2cvnxeA5U6jv3FyxPUJrupJvCuUAGI7
c1IkKQ68/5bxXM+FSHtk6A3aX0ddcEj6sUUbeiU7N3Qq9I2tWBQEMitVXbw3/LTs
UYyoH8guyhFJlh1ZsqvrSMPDmcEn+L7y+OuVLzzET/ZZtSNWSA/4EtwHJ5gw5edc
KlAcuaK/68i9MhlH2haBZ6UO36oegDVCAykKTX0aN5vCJVkeELUxIDLGIE7DR/E=
=hLRO
-----END PGP SIGNATURE-----

--X7RUiSILkwpBBk3FE2Bnfwt9vaKtIpo77--
