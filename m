Received: by 10.223.159.82 with SMTP id f18csp3974954wrg;
        Wed, 29 Nov 2017 02:12:14 -0800 (PST)
X-Google-Smtp-Source: AGs4zMayWZoLgdmZtf2WZp/1Afy5a+n4tkpbpyl8hU3dvRfcGtwilCpPmRUXps9E+ZezWq8+hu92
X-Received: by 10.37.186.140 with SMTP id s12mr1370981ybg.111.1511950334584;
        Wed, 29 Nov 2017 02:12:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511950334; cv=none;
        d=google.com; s=arc-20160816;
        b=rmIWowWldbU4Y31fq143eh0WlWD3GwMVRjtankwh4pL5lCMahOsW8FxM2039cUjw3x
         40Nj+g+6Yj3eopnX9LN8p6KlrbFSYCQE6huaA6/8usiloscehBsfikGyLkwuKwVtPRa4
         TvrSnms4TuCdY/V1GpNnGoPmdqKIazJ6SHk0VGrq4e6s0yp+m7Fs5/xs8MCPsWRp2Jeh
         uRUeNTD1KHGZsWFv0+JiRUYGftnvrreSjU6JdQ+rEsLSIl5UWkz1XKTWIYcAsVveXmCK
         wRJFKDZC/RTgenr1gEqvyzV/fM5GzpYZoZ7puHKJ8Q8FeYr/xYgt/z0VHdRQo5tvAURn
         LJhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=3avFcD3hn45SKkokC5rhXAS3VgH/NRtl3rYwNuJcQYc=;
        b=beHHj8UP4Qe4Rkbp1SfJlTkiQy/kmuppPIrGm4qDPJAi9IAEBXT9SSUw8AdH92namm
         TNnwQcJ7LwM0LS/+8l0o2fk2VreuJPe56rMGGEUzH2ER1+mSV2EnM5081bxfBt4tb/Ft
         /hTKPKyPlIL7k+mQmUKV+O7p1DVRbhAYSBylI4NPcX3G+yVTNA38neAS/uJh9aXvWc05
         dZwqTTpfomuQrJyLM78U5i0pvc+tu0RPu96D+jF67lbMzB+ekMfg6Ten7kIekwANM2bW
         gup34LhJdYGuMgSwzuxVRrvGVyAM74ZDQy7h3sbw9sp+7dJcM6Y848j1b3dDfy+eLjYO
         3w9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E2PMv8D8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19si265106ywg.506.2017.11.29.02.12.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Nov 2017 02:12:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E2PMv8D8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJzLh-0001u5-U7
	for alex.bennee@linaro.org; Wed, 29 Nov 2017 05:12:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eJzLX-0001sR-FT
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 05:12:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eJzLW-0005kq-Ik
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 05:12:03 -0500
Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a]:35797)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eJzLW-0005k2-Cl
	for qemu-arm@nongnu.org; Wed, 29 Nov 2017 05:12:02 -0500
Received: by mail-oi0-x22a.google.com with SMTP id 184so2024913oii.2
	for <qemu-arm@nongnu.org>; Wed, 29 Nov 2017 02:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3avFcD3hn45SKkokC5rhXAS3VgH/NRtl3rYwNuJcQYc=;
	b=E2PMv8D8MO6HFZ6h8+eocoH5PDHbvpHgoHDim1ObV3HntnlpWgiYZ3qUmJaJBwldF0
	z8VLPAhNIz9tdUEdxL0g7V92GIIxR/WUFxB8OgaABCu/Pv5CQf+8biAzJOMvNMLslFi/
	W+HqL/uU8km8gAvfwaHvccB4VFZdvRyrSxdJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3avFcD3hn45SKkokC5rhXAS3VgH/NRtl3rYwNuJcQYc=;
	b=ZeoxHbTVFpxDyXTw3Cka6Rim3eh7JNXZBqcpVpba2s96SSFXsIN6ibOuw+T7ALdYkH
	9L/eVVqT4/4bAkLujRbOAdBCJUwibXIl7G+QndehOfkA/ukKCYaSM3AOfXZivuaRTWo5
	6YSvcT+OEuWYvaYunjNEfoNfTlEjpWqqALuHhhibCZCP2JKH5ZdCCz40prXHSKq0I3ba
	EDZyFV0jdbqZfg3Iin8RmKl050K/2Vm+wMbljCMTURI/wBK4reneN9+krt4AFMtccXkx
	Byqd5KPt8Gumy1u9POEgh/CBjY90dFAsGCzMqzAkpN2sT+4jxwgD66ZFhqHgs5y9TxOX
	q8Og==
X-Gm-Message-State: AJaThX4FdiVOrIdb8ZlEzg2QEfhDP8/iVbswZKf7X4ziF6RrN6EDkA08
	t6e7b0H7d81FiRuE8JHF5VE1PtZ6C+YrqESsFeCE6g==
X-Received: by 10.202.205.147 with SMTP id d141mr1592495oig.256.1511950321747; 
	Wed, 29 Nov 2017 02:12:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Wed, 29 Nov 2017 02:11:41 -0800 (PST)
In-Reply-To: <17d7270b-9016-face-5fba-c6e321e92d88@kaod.org>
References: <20171019151249.13663-1-clg@kaod.org>
	<17d7270b-9016-face-5fba-c6e321e92d88@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Nov 2017 10:11:41 +0000
Message-ID: <CAFEAcA-_7DVpck4wKsLSvpMdAZTKCFK+j3Q1F5OvAo2TT+5ZWw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22a
Subject: Re: [Qemu-arm] [PATCH v5 0/8] aspeed: add a witherspoon-bmc machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yoTeT0m/tNVE

On 29 November 2017 at 09:58, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 10/19/2017 05:12 PM, C=C3=A9dric Le Goater wrote:
>>  - introduce a dummy ROM device to catch invalid writes
>>  - removed 'ignore_memory_transaction_failures' on all Aspeed machines
>
> So that was a bad idea because old firwmares run load/store loops
> beyond the address space to guess how much RAM the SoC has.
>
> I am wondering if it is possible to model the same behavior with
> a MMIO region (of a correct size depending on the max ram size of
> the SoC) and mapped beyond the RAM region to catch such accesses
> and keep 'ignore_memory_transaction_failures' to false.

Yeah, if the hardware genuinely ignores accesses to a particular
region of the address space then you can model this with an
appropriate background memory region. You just need to figure
out what range of the address space it should apply to...

thanks
-- PMM
