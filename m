Received: by 10.223.172.38 with SMTP id v35csp1808497wrc;
        Tue, 5 Sep 2017 12:43:14 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7ErhdDcJQfIzuVezyISOX3OUpIfRd1W1qwFFhDJND0OJtfOsQij2eucz6o18q+c00bJb9E
X-Received: by 10.55.201.5 with SMTP id q5mr262890qki.75.1504640594106;
        Tue, 05 Sep 2017 12:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504640594; cv=none;
        d=google.com; s=arc-20160816;
        b=tZ2PmXv9bJxUEmWEvwcenJgb74+1KL2O8X2WFU/O2lgZLdyR2+nMdYFW9atVW/S9iy
         +G+LyiXzONZWgOxFZBKu1r88Hsj+j48k01xyur2+EXfkKB3HRPtI9gm4kEgfz0hIWEHv
         9k63jhaNp0r+9WUPRTGsPwYkpvirq06Qi4KuU3Btd1tJ/umeEQNz3EWkH4A+SO+1kvgL
         oGrU1TQw4ncRe+HpJLklDu409/VttdELVG1eSNoOuAxTlclNJeQVZQYAg4disGBoI3gg
         rdmBMl8kHTnMTnMYYa5XaYrz/5C+ILsaycpPfHcv67+6wejstcWu8ZJ3YG2FFaBrluUY
         oTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:organization:openpgp:from
         :references:to:dmarc-filter:arc-authentication-results;
        bh=4T+NAj2GuTd0NA4zvHPc+vvcGlxrD36bcM8g+C0AnCE=;
        b=bwEg3QQa9yDGU5t5QRRvQU+oOpOb9iD0Kl12GgG7GsuemEoLPDLfMRC9i+m23ESKHW
         uxVJrv81P4AIHqiPZYdk5qYCNZ3WVByrEqqKfvkeULacPo9lqTECUzPwm9n7taGc0k26
         dGtS8mcLUje5FZEfL/iC6FB3rnXywXkI3q0nbGgi4mWcBj3MDbuPz6eZCdvgFV0Em4/n
         iqSYE6xfwy4lU5WsH/023nEftkp/NoYgzLD2MQwexV/ZBkZmkcZVig4E9T4HhOE541ck
         Sd1rvXYF90xXm6r+BYxRU8MVnw6fdOU7HzvuTCHjPHCNFV3PkEPQWdWJiWXT+wSAjdei
         0FIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1si1052470qth.104.2017.09.05.12.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 12:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpJkd-00054k-S8
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 15:43:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dpJkO-00052Z-JN
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 15:43:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dpJkI-0007on-0H
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 15:42:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52870)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dpJkH-0007nU-Nw; Tue, 05 Sep 2017 15:42:49 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A86561468;
	Tue,  5 Sep 2017 19:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8A86561468
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.120.228] (ovpn-120-228.rdu2.redhat.com [10.10.120.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6347261F24;
	Tue,  5 Sep 2017 19:42:47 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	niuguoxiang <niuguoxiang@huawei.com>
References: <20170905112152.8851-1-ppandit@redhat.com>
	<CAFEAcA8B4EwXCPSBsftt=QkAuH8jCBbK23-uU7NA7G3k6ADHLw@mail.gmail.com>
	<7FD21DDFE9A3784693E393AF276FE7D21F17E49E@DGGEMA501-MBX.china.huawei.com>
	<CAFEAcA8JxuM-ddQVTBfgnSDD2fD+kz_RNShdNDqMqVH=zOKBfw@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <4dac78d2-da60-95c7-4d46-76f660db6a9f@redhat.com>
Date: Tue, 5 Sep 2017 14:42:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8JxuM-ddQVTBfgnSDD2fD+kz_RNShdNDqMqVH=zOKBfw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Od5WInuJV72EVsEl2cCTLXPX4XB053hqX"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 05 Sep 2017 19:42:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] =?utf-8?b?W1FlbXUtZGV2ZWxdIOetlOWkjTogW1BBVENIXSBp?=
 =?utf-8?q?ntc=3A_arm=5Fgicv3=3A_limit_GICR_ipriority_index?=
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
Cc: P J P <ppandit@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/QxPSTw4GoV

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Od5WInuJV72EVsEl2cCTLXPX4XB053hqX
Content-Type: multipart/mixed; boundary="lmpFQ0F4aE2cferGqdfpA879HH9XjpgBd";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 niuguoxiang <niuguoxiang@huawei.com>
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>
Message-ID: <4dac78d2-da60-95c7-4d46-76f660db6a9f@redhat.com>
Subject: =?UTF-8?Q?Re:_[Qemu-devel]_=e7=ad=94=e5=a4=8d:_[PATCH]_intc:_arm=5f?=
 =?UTF-8?Q?gicv3:_limit_GICR_ipriority_index?=
References: <20170905112152.8851-1-ppandit@redhat.com>
 <CAFEAcA8B4EwXCPSBsftt=QkAuH8jCBbK23-uU7NA7G3k6ADHLw@mail.gmail.com>
 <7FD21DDFE9A3784693E393AF276FE7D21F17E49E@DGGEMA501-MBX.china.huawei.com>
 <CAFEAcA8JxuM-ddQVTBfgnSDD2fD+kz_RNShdNDqMqVH=zOKBfw@mail.gmail.com>
In-Reply-To: <CAFEAcA8JxuM-ddQVTBfgnSDD2fD+kz_RNShdNDqMqVH=zOKBfw@mail.gmail.com>

--lmpFQ0F4aE2cferGqdfpA879HH9XjpgBd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/05/2017 07:35 AM, Peter Maydell wrote:
> On 5 September 2017 at 13:30, niuguoxiang <niuguoxiang@huawei.com> wrot=
e:
>> I think only assert is not enough, because assert() depends on NDEBUG
>> preprocessing
>=20

> Incidentally, QEMU can never be compiled with NDEBUG not
> set -- we will #error in the compilation if it is not set.

Well, right now, we only #error if you happen to compile certain
devices, although the proposal has been made to #error for ALL builds:

https://lists.gnu.org/archive/html/qemu-devel/2017-08/msg03608.html

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--lmpFQ0F4aE2cferGqdfpA879HH9XjpgBd--

--Od5WInuJV72EVsEl2cCTLXPX4XB053hqX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlmu/jYACgkQp6FrSiUn
Q2oNoAf+MHcGk37Q1saDI/TiX3T6/1WZ7lKeYJjjaLnUupKKeWRmgYjduY/Z9GVH
tkY/ciMEyWBdp2185TjjViIZ3YMSbgnIs+SEpvLukJGCiEaQFbwnF0ZyViLl4RAF
3gKcNP5aeSnuqV3sAwa7Vs+Lvuy9xyo22sLGK023h9WjJXfUHhuGKet+xj6N75Nq
1vZ3FGQ1p48kQP3TUzyLB4jLbzIs0DPR4wHAbYttGtyYZVPSoxj1q2V8Hu9Q3jg6
a/gewurjHqc7BOyjd2QID2/umdUtx8XkJk/GqcAaCA/syvsmbONjVpwnBsWLOKoT
fK+UOjalG7zdZNWY1UPaA77AXt61ZQ==
=FeB6
-----END PGP SIGNATURE-----

--Od5WInuJV72EVsEl2cCTLXPX4XB053hqX--
