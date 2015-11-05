Received: by 10.182.105.169 with SMTP id gn9csp586886obb;
        Thu, 5 Nov 2015 09:14:15 -0800 (PST)
X-Received: by 10.31.146.76 with SMTP id u73mr8274818vkd.42.1446743655659;
        Thu, 05 Nov 2015 09:14:15 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b195si5328918vka.156.2015.11.05.09.14.15
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 09:14:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZuO75-0001Kt-Eg
	for alex.bennee@linaro.org; Thu, 05 Nov 2015 12:14:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZuO6g-0000yh-L2
	for qemu-devel@nongnu.org; Thu, 05 Nov 2015 12:13:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1ZuO6f-0002pd-NE
	for qemu-devel@nongnu.org; Thu, 05 Nov 2015 12:13:50 -0500
Received: from mx2.suse.de ([195.135.220.15]:52306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1ZuO6b-0002oj-A0; Thu, 05 Nov 2015 12:13:45 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6E093AC61;
	Thu,  5 Nov 2015 17:13:26 +0000 (UTC)
To: Wei Huang <wei@redhat.com>, qemu-arm@nongnu.org
References: <1446743477-21579-1-git-send-email-wei@redhat.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <563B8E48.8020407@suse.de>
Date: Thu, 5 Nov 2015 18:13:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446743477-21579-1-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH Trivial] hw/intc/arm_gic: Remove the
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
X-TUID: g4AP0UbYcBGH

Am 05.11.2015 um 18:11 schrieb Wei Huang:
> arm_gic.c retrieves CPU number using either NUM_CPU(s) or s->num_cpu.
> Such mixed-uses make source code inconsistent. This patch removes
> NUM_CPU(s), which was defined for MPCore tweak long ago, and instead
> favors s->num_cpu. The source is more consistent after this tweak.
>=20
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/intc/arm_gic.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

I don't mind either way, and it'll go through Peter's queue I guess,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Cheers,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)
