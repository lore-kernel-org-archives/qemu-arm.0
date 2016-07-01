Received: by 10.25.21.96 with SMTP id l93csp125154lfi;
        Thu, 30 Jun 2016 23:11:40 -0700 (PDT)
X-Received: by 10.237.59.227 with SMTP id s32mr17316115qte.91.1467353500626;
        Thu, 30 Jun 2016 23:11:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s59si1493592qtd.64.2016.06.30.23.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jun 2016 23:11:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIrfv-0008LY-NP
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 02:11:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bIrfq-0008Ka-0L
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 02:11:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bIrfk-00086q-0J
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 02:11:32 -0400
Received: from mo53.mail-out.ovh.net ([178.32.228.53]:36164)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bIrfj-00086X-Pq
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 02:11:27 -0400
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id DDD4DFF91E7
	for <qemu-arm@nongnu.org>; Fri,  1 Jul 2016 08:11:26 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 5C05562008B;
	Fri,  1 Jul 2016 08:11:23 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467301824-10123-1-git-send-email-clg@kaod.org>
	<CAFEAcA_iAVMPNxi8m=uv9OTGoHqxg8egsLT+SN=YFJA=tS4B9w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4c195494-c97a-29e5-f5fb-88e26e71ae13@kaod.org>
Date: Fri, 1 Jul 2016 08:11:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_iAVMPNxi8m=uv9OTGoHqxg8egsLT+SN=YFJA=tS4B9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 688487797234961323
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudekgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.228.53
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/misc: fix Aspeed SCU hw-strap2
 property
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nl3V3uPGOX5K

On 06/30/2016 08:24 PM, Peter Maydell wrote:
> On 30 June 2016 at 16:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> These strap registers are complex enough, let's not mix them.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Was there a cover letter for this patchset? I can't find
> it in my email...

Ah :/ No, I didn't send one as the patches were small and self=20
contained. Should we each time ?=20

Thanks,

C.

