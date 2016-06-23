Received: by 10.25.21.96 with SMTP id l93csp363237lfi;
        Wed, 22 Jun 2016 23:44:15 -0700 (PDT)
X-Received: by 10.55.40.68 with SMTP id o65mr124285qkh.201.1466664255420;
        Wed, 22 Jun 2016 23:44:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id r70si4281801qkr.195.2016.06.22.23.44.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 23:44:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFyN4-0008SH-Pz
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 02:44:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bFy6t-0006eC-0b
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 02:27:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bFy6n-0003pu-0w
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 02:27:29 -0400
Received: from 19.mo1.mail-out.ovh.net ([178.32.97.206]:52751)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bFy6m-0003po-QO
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 02:27:24 -0400
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id DAF03FF9AAD
	for <qemu-devel@nongnu.org>; Thu, 23 Jun 2016 08:27:23 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id 2D1692C0085;
	Thu, 23 Jun 2016 08:27:19 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
	<1466648115-17015-2-git-send-email-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ccc7f78a-c5d7-8598-7faa-a7f8099a4258@kaod.org>
Date: Thu, 23 Jun 2016 08:27:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466648115-17015-2-git-send-email-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252
X-Ovh-Tracer-Id: 9316540257005570992
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdehgdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.97.206
Subject: Re: [Qemu-devel] [PATCH v2 1/3] hw/misc: Add a model for the ASPEED
 System Control Unit
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4OOKAI01Q1CP

On 06/23/2016 04:15 AM, Andrew Jeffery wrote:
> The SCU is a collection of chip-level control registers that manage the
> various functions supported by ASPEED SoCs. Typically the bits control
> interactions with clocks, external hardware or reset behaviour, and we
> can largly take a hands-off approach to reads and writes.
>=20
> Firmware makes heavy use of the state to determine how to boot, but the
> reset values vary from SoC to SoC (eg AST2400 vs AST2500). A qdev
> property is exposed so that the integrating SoC model can configure the
> silicon revision, which in-turn selects the appropriate reset values.
> Further qdev properties are exposed so the board model can configure th=
e
> board-dependent hardware strapping.
>=20
> Almost all provided AST2400 reset values are specified by the datasheet=
.
> The notable exception is SOC_SCRATCH1, where we mark the DRAM as
> successfully initialised to avoid unnecessary dark corners in the SoC's
> u-boot support.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>



Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Thanks,

C.
