Received: by 10.103.124.15 with SMTP id x15csp1873009vsc;
        Tue, 23 May 2017 07:59:56 -0700 (PDT)
X-Received: by 10.237.63.168 with SMTP id s37mr29357507qth.61.1495551596237;
        Tue, 23 May 2017 07:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495551596; cv=none;
        d=google.com; s=arc-20160816;
        b=DDBgJh49HKNR0IIYd2O5Voxl8KKTaV3IzWcYICmge3zRKPe4u6zkXM6sM5QQL4XQhO
         e9xNkNKdC/vZmX6hbiIe3WS2M5HTHd48KE2SQutNPhAqhL6TSLbokW23VpBAFJk3kQ/j
         /YsB6TPq1CiM7UruT+3QHhCjEUGejKCuUq2t/chBOYYDxcfziUBVtZl2ED3CQaHkH4d2
         M/AFkXE/5IlGAdy/XPi+REjyMk7dRkfDmrvnb8MVizzHVFxwROE2l4C2PmccaR6C56jp
         Zi2ohUxpMWR3BrH/kdbR9YB96Tdq/tg+RtAXbV9yt2N80gToOlnvWhEa5PXNs5BmRDrJ
         E2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=6O5ogU0T+Uelklqp6HjXJQ28iUykeq4/XUaljEIyYuc=;
        b=V+/Ly/68eBrPn34B/BKd0yb6gjtFqiVXExRZjyT9eB6vCkriiiC7bJv3etIv86sFzS
         L2j9RoPJVuQeGjR93G2G1m7pPmkflZkt0mnFkjy15OP68HlwXjz5T/WviLjnT6W4ug9G
         XcAG6JQgHbFbEfWKt0SKOGKAiZXQ3LIQq/9bHOwLqUrX2jJkNpI2qfteHP+gbdhn5Gm5
         LIvmH+UnD95Ck96VceqGmC9t3iPLzcpMkGboW/j4OLuzds2ObzZ8qaYavwGsj50XLZhe
         8dmoRV4iwpSz42KN+MIWdnEKISVq8O7DZyqC5oghjz9UO2RuI0bo4BzwoWcicQaIgnHo
         QYUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l31si22093172qtf.186.2017.05.23.07.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 07:59:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDBHv-0000l5-SG
	for alex.bennee@linaro.org; Tue, 23 May 2017 10:59:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDBGW-0008KU-Jm
	for qemu-devel@nongnu.org; Tue, 23 May 2017 10:58:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dDBGV-00057b-Ro
	for qemu-devel@nongnu.org; Tue, 23 May 2017 10:58:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dDBGS-0004wm-1r; Tue, 23 May 2017 10:58:24 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 32C33418EB;
	Tue, 23 May 2017 17:58:23 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 1D033437;
	Tue, 23 May 2017 17:58:23 +0300 (MSK)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-7-f4bug@amsat.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <79598bed-714f-7c3b-a806-3bf1a4968fd2@msgid.tls.msk.ru>
Date: Tue, 23 May 2017 17:58:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170508233918.9043-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-devel] [PATCH 06/11] hw/arm: removed unnecessary include
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h1g7+T+7s4i+

09.05.2017 02:39, Philippe Mathieu-Daud=C3=A9 wrote:
> "exec/memory.h" already includes it.

I think this sort of include cleanups isn't really necessary.
For a regular include file, it's better to include it if the
.c file in question uses definitions from there, no matter if
other .h files include that header already or not.

Thanks,

/mjt

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/arm/arm.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index a3f79d3379..b9c11d3fb8 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -14,7 +14,6 @@
>  #include "exec/memory.h"
>  #include "target/arm/cpu-qom.h"
>  #include "hw/irq.h"
> -#include "qemu/notify.h"
> =20
>  typedef enum {
>      ARM_ENDIANNESS_UNKNOWN =3D 0,
>=20

