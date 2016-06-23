Received: by 10.25.21.96 with SMTP id l93csp360761lfi;
        Wed, 22 Jun 2016 23:36:11 -0700 (PDT)
X-Received: by 10.55.55.202 with SMTP id e193mr6280367qka.130.1466663770983;
        Wed, 22 Jun 2016 23:36:10 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j53si4198742qtj.9.2016.06.22.23.36.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 23:36:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFyFG-00071P-Ai
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 02:36:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bFy7u-0007VJ-Uc
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 02:28:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bFy7o-000456-VL
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 02:28:33 -0400
Received: from 9.mo1.mail-out.ovh.net ([178.32.108.172]:52688)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bFy7o-000451-P1
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 02:28:28 -0400
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 45525FF9AE5
	for <qemu-devel@nongnu.org>; Thu, 23 Jun 2016 08:28:28 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id 068272C0086;
	Thu, 23 Jun 2016 08:28:23 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
	<1466648115-17015-3-git-send-email-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <48bfefba-e383-9c6c-558a-55ca29e9fa21@kaod.org>
Date: Thu, 23 Jun 2016 08:28:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466648115-17015-3-git-send-email-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252
X-Ovh-Tracer-Id: 9334836131439414192
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdehgdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.108.172
Subject: Re: [Qemu-devel] [PATCH v2 2/3] ast2400: Integrate the SCU model
 and set silicon revision
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
X-TUID: fpIMKyPojJ5M

On 06/23/2016 04:15 AM, Andrew Jeffery wrote:
> By specifying the silicon revision we select the appropriate reset
> values for the SoC.
>=20
> Additionally, expose hardware strapping properties aliasing those
> provided by the SCU for board-specific configuration.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---


Reviewed-by: C=E9dric Le Goater <clg@kaod.org>

Thanks,

C.


