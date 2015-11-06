Received: by 10.182.105.169 with SMTP id gn9csp930946obb;
        Fri, 6 Nov 2015 00:14:41 -0800 (PST)
X-Received: by 10.31.173.214 with SMTP id w205mr11218550vke.95.1446797681072;
        Fri, 06 Nov 2015 00:14:41 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i65si7936817vki.127.2015.11.06.00.14.40
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 00:14:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZucAS-0001HJ-II
	for alex.bennee@linaro.org; Fri, 06 Nov 2015 03:14:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZucA4-0000wp-VV
	for qemu-devel@nongnu.org; Fri, 06 Nov 2015 03:14:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZucA4-00038q-3W
	for qemu-devel@nongnu.org; Fri, 06 Nov 2015 03:14:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Zuc9y-000367-Mk; Fri, 06 Nov 2015 03:14:10 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id E466F40B3A;
	Fri,  6 Nov 2015 11:14:09 +0300 (MSK)
Message-ID: <563C6151.9070800@msgid.tls.msk.ru>
Date: Fri, 06 Nov 2015 11:14:09 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Wei Huang <wei@redhat.com>, qemu-arm@nongnu.org
References: <1446744293-32365-1-git-send-email-wei@redhat.com>
In-Reply-To: <1446744293-32365-1-git-send-email-wei@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, afaerber@suse.de,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH Trivial V2] hw/intc/arm_gic: Remove the
 definition of NUM_CPU
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fD50w+a3VnIv

05.11.2015 20:24, Wei Huang wrote:
> arm_gic.c retrieves CPU number using either NUM_CPU(s) or s->num_cpu.
> Such mixed-uses make source code inconsistent. This patch removes
> NUM_CPU(s), which was defined for MPCore tweak long ago, and instead
> favors s->num_cpu. The source is more consistent after this small tweak=
.
>=20
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Signed-off-by: Wei Huang <wei@redhat.com>

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>

I'm not applying this to -trivial per previous comments.

Thanks,

/mjt
