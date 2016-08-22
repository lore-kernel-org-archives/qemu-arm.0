Received: by 10.25.21.156 with SMTP id 28csp1590816lfv;
        Mon, 22 Aug 2016 02:07:33 -0700 (PDT)
X-Received: by 10.55.141.199 with SMTP id p190mr22245201qkd.185.1471856852939;
        Mon, 22 Aug 2016 02:07:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m22si11408681qtc.21.2016.08.22.02.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Aug 2016 02:07:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bblCe-0004Zq-Bo
	for alex.bennee@linaro.org; Mon, 22 Aug 2016 05:07:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bblCY-0004Wt-MD
	for qemu-arm@nongnu.org; Mon, 22 Aug 2016 05:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bblCR-000249-Qa
	for qemu-arm@nongnu.org; Mon, 22 Aug 2016 05:07:25 -0400
Received: from 14.mo5.mail-out.ovh.net ([188.165.51.82]:42251)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bblCR-00023D-Kg
	for qemu-arm@nongnu.org; Mon, 22 Aug 2016 05:07:19 -0400
Received: from player688.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id D1EC61014E89
	for <qemu-arm@nongnu.org>; Mon, 22 Aug 2016 11:07:15 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player688.ha.ovh.net (Postfix) with ESMTPSA id 9C5E620074;
	Mon, 22 Aug 2016 11:07:10 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-4-git-send-email-clg@kaod.org>
	<CAFEAcA9xrwghN6FMRsbHAMrTfSLv3K+iVAJEA-8p-NQ+s-bfxw@mail.gmail.com>
	<d2c9a78f-ace2-0538-ea4e-91d10b7dbe7f@kaod.org>
	<CAFEAcA_TvCzzbSW1sQwbEqvhwK+oAmTkxUjTomUgof5GAWXL8Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <266675a9-ee33-3370-7bbb-0c6c39bb5985@kaod.org>
Date: Mon, 22 Aug 2016 11:07:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_TvCzzbSW1sQwbEqvhwK+oAmTkxUjTomUgof5GAWXL8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 13889945679299316651
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrfedugddtleculddtuddrfeeltddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.51.82
Subject: Re: [Qemu-arm] [PATCH v3 03/10] aspeed-soc: provide a framework to
 add new SoCs
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
X-TUID: ZnadFXrwyJqz

Hello Peter,=20

On 08/12/2016 11:21 AM, Peter Maydell wrote:
> On 12 August 2016 at 09:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 08/11/2016 12:14 PM, Peter Maydell wrote:
>>> board_id 0 means "I am an EBSA110", which this isn't,
>>> and your silicon rev values are completely out of range.
>>
>> OK. I was not aware of this. I will request new board ids for
>> the ast2400 and ast2500
>=20
> Why do you need them? Anything new should be device-tree-only,
> and I would expect pushback from the kernel side if you
> try to allocate new stuff.

Sorry for the late answer, I was out in Brittany (and it was=20
sunny).

I got confused by our aspeed kernel tree which still has some=20
unmerged oddities. I will use -1 for the board ID.

Thanks,

C.


