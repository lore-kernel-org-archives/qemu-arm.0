Received: by 10.25.44.15 with SMTP id s15csp3435148lfs;
        Mon, 10 Jul 2017 06:54:38 -0700 (PDT)
X-Received: by 10.55.106.66 with SMTP id f63mr3897872qkc.167.1499694878539;
        Mon, 10 Jul 2017 06:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499694878; cv=none;
        d=google.com; s=arc-20160816;
        b=n1THd0qq4CP9aeNDqUeAVjF7Tw+AOB3jn9YOiu4XXckO9KGDcGptqAdq7X7iDj3pNS
         Utt3TInW/jE+zEWY1iYW8LlWUupioBexC69HpyoqhAZZmNM/sEKHZk5PXm9uI1S1VfMz
         LehRJi9a2YzqSMMSgpx7u1GPvAzLh/KJ1x/nieCEU9uGJFWt26MX/nfmdPnuqhHW0KdT
         bG1eiJyJtjGskohK3H330yqUXgHbiu1u74g++HPwE7FCboDjS15YRglQCTBEvzUbcTXP
         5sSzYXt9dHw3dXwGGtKCwsQluxnYHse9npaXlVnzLeXVm4TlqMy5lUKvSiYhewJ5Vy66
         MgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=ONyriSSc2bdjrcVFXVeSt/fXuVTWVRAVC+VkMmAUaEc=;
        b=lqcsUsGoIqZWgRr4Y6RZFJqWSQCfYRIjChBIN1N/3sIMo6FT+LRK1isb/5bkWPetQm
         t4p7LTqes/FF2rLL4ak2Upgq56YE5+2BcAHGVN5EtM7a7SqnESjMSTYqlR67n03c8jM/
         BjEvkei+LAcuJ8ojcKDtKYNanUXEG5Vo04/ZJYEIxudY9m2Y6EWmVWw2LdMDW5+0od5x
         1re/WVwhh6i5Fds9oesHPy9vUvPuEC9ewUbLl6eIV3U/6peA9XtD1BYDrVNGCV5815Pi
         2q7eZdI1Qmun3+46p4qamb0WaGVpj7yfJP9zEsMrmtqMD2QL43s1bnWhI8MGbq9OeV5u
         VK2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a39si11070824qtb.176.2017.07.10.06.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 06:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUZ91-0002jw-Pg
	for alex.bennee@linaro.org; Mon, 10 Jul 2017 09:54:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dUZ8p-0002fc-TV
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 09:54:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dUZ8j-0006zg-QZ
	for qemu-arm@nongnu.org; Mon, 10 Jul 2017 09:54:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dUZ8j-0006zA-GZ; Mon, 10 Jul 2017 09:54:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB2663D95D;
	Mon, 10 Jul 2017 13:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CB2663D95D
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CB2663D95D
Received: from [10.10.121.60] (ovpn-121-60.rdu2.redhat.com [10.10.121.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 543E817DBD;
	Mon, 10 Jul 2017 13:54:08 +0000 (UTC)
To: Dongjiu Geng <gengdongjiu@huawei.com>, lersek@redhat.com, mst@redhat.com, 
	imammedo@redhat.com, famz@redhat.com, qemu-devel@nongnu.org,
	zhaoshenglong@huawei.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	zhengqiang10@huawei.com, huangshaoyu@huawei.com, wuquanming@huawei.com, 
	zhihui.gao@huawei.com
References: <1499678755-5633-1-git-send-email-gengdongjiu@huawei.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <df74267a-3f6f-b6f5-432f-40f8c04ab1f1@redhat.com>
Date: Mon, 10 Jul 2017 08:54:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499678755-5633-1-git-send-email-gengdongjiu@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="nSRXmSWLuCdkvscAGtpPira2xBW0Wgg3L"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 10 Jul 2017 13:54:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 1/3] ACPI: Add new ACPI
 structures and macros
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5U9qHJ25K+ek

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nSRXmSWLuCdkvscAGtpPira2xBW0Wgg3L
Content-Type: multipart/mixed; boundary="rVALXhrMRg6tcFqEfbici6JK7LiJ8wAOL";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>, lersek@redhat.com, mst@redhat.com,
 imammedo@redhat.com, famz@redhat.com, qemu-devel@nongnu.org,
 zhaoshenglong@huawei.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 zhengqiang10@huawei.com, huangshaoyu@huawei.com, wuquanming@huawei.com,
 zhihui.gao@huawei.com
Message-ID: <df74267a-3f6f-b6f5-432f-40f8c04ab1f1@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v4 1/3] ACPI: Add new ACPI structures and
 macros
References: <1499678755-5633-1-git-send-email-gengdongjiu@huawei.com>
In-Reply-To: <1499678755-5633-1-git-send-email-gengdongjiu@huawei.com>

--rVALXhrMRg6tcFqEfbici6JK7LiJ8wAOL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/10/2017 04:25 AM, Dongjiu Geng wrote:
> (1) Add related APEI/HEST table structures and  macros, these
>     definition refer to ACPI 6.1 and UEFI 2.6 spec.

Your mail is missing In-Reply-To: and References: headers, which makes
it appear as a new top-level thread for each patch.  You'll want to
figure out why you didn't properly link back to your 0/3 cover letter
with Message-ID: <1499678736-5244-1-git-send-email-gengdongjiu@huawei.com=
>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--rVALXhrMRg6tcFqEfbici6JK7LiJ8wAOL--

--nSRXmSWLuCdkvscAGtpPira2xBW0Wgg3L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZY4b/AAoJEKeha0olJ0NqWPIH/2JbCVFv1B+pecf/vB2+xpoU
/zckPX5LTHmCqyy9Q6ygPLuBZvwNZAS0c8vOxOQzM2a/lRVrU5gd1edik8QZctUH
PGN7yulnpA0TpdB7XwV5WjjRJ5OqizGvso1wSsBED9hTtmpr5BcN4lcm4KsqQlxK
vrHk08en3vxysN60+lgxE/EmnNEMlpp3IOzpWOzVokskBpVGvsjFIym5UzXgfJB8
XW6QqmcYomVKvUjd6VOALjJqIqCvV88Ip/2qjJtasN56aYv8+OCvGbMBPHwrAa9s
1qYu2VHUKgL6EQtPPidLwokWNDtLNboF2izi2dbG9fu8k1aNtWg37pk9bDoCnTY=
=z3js
-----END PGP SIGNATURE-----

--nSRXmSWLuCdkvscAGtpPira2xBW0Wgg3L--
