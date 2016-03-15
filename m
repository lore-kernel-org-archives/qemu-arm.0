Received: by 10.25.208.211 with SMTP id h202csp368398lfg;
        Mon, 14 Mar 2016 21:35:13 -0700 (PDT)
X-Received: by 10.140.135.84 with SMTP id 81mr37783259qhh.26.1458016513218;
        Mon, 14 Mar 2016 21:35:13 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d126si24884070qkb.84.2016.03.14.21.35.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Mar 2016 21:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45380 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afghM-0002UJ-PL
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 00:35:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jk@ozlabs.org>) id 1afgh3-0002C2-HB
	for qemu-devel@nongnu.org; Tue, 15 Mar 2016 00:34:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jk@ozlabs.org>) id 1afgh2-00058q-M5
	for qemu-devel@nongnu.org; Tue, 15 Mar 2016 00:34:53 -0400
Received: from ozlabs.org ([103.22.144.67]:49286)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jk@ozlabs.org>)
	id 1afggy-00056O-5D; Tue, 15 Mar 2016 00:34:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.org (Postfix) with ESMTPSA id 3qPMGW0xSWz9s2k;
	Tue, 15 Mar 2016 15:34:43 +1100 (AEDT)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <56E790E2.7040006@ozlabs.org>
Date: Tue, 15 Mar 2016 12:34:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm@nongnu.org,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v4 0/4] Add ASPEED AST2400 SoC and
	OpenPower BMC machine
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
X-TUID: qpOuL+S5NFsA

Hi Andrew,

> This patch series models enough of the ASPEED AST2400 ARM9 SoC[0] to
> boot an aspeed_defconfig Linux kernel[1][2]. Specifically, the series
> implements the ASPEED timer and VIC devices, integrates them into an
> AST2400 SoC and exposes it all through a new opbmc2400 machine. The
> device model patches only partially implement the hardware features of
> the timer and VIC, again mostly just enough to boot Linux.

Awesome! Nice to have these patches escaping the lab :)

In terms of naming suggestions: I think this depends on what we're
looking to emulate here. I see two options:

The qemu platform becomes a "reference" for OpenPOWER bmc hardware, but
doesn't necessarily align with an actual machine. In that case,
something generic like opbmc-<SoC> would make sense.

On the other hand, if we'd like to create qemu platforms that represent
actual machines (eg, the OpenPOWER "palmetto" machine), then
<PLATFORM>-bmc would seem more appropriate. In this case, the machine
name would be palmetto-bmc. No need to include the SoC name in that, as
it's defined by the hardware implementation.

I think the latter option may be more generally useful.

Regards,


Jeremy
