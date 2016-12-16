Received: by 10.25.205.13 with SMTP id d13csp804803lfg;
        Fri, 16 Dec 2016 09:24:42 -0800 (PST)
X-Received: by 10.55.12.19 with SMTP id 19mr4368001qkm.100.1481909082725;
        Fri, 16 Dec 2016 09:24:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 40si3661543qtm.258.2016.12.16.09.24.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 09:24:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHwFM-0003GX-5w
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 12:24:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cHwFF-0003B2-RX
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 12:24:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cHwFA-0004rl-R5
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 12:24:33 -0500
Received: from 11.mo5.mail-out.ovh.net ([46.105.47.167]:34501)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cHwFA-0004pP-KC
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 12:24:28 -0500
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 0020B57100
	for <qemu-arm@nongnu.org>; Fri, 16 Dec 2016 18:24:17 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
	by player760.ha.ovh.net (Postfix) with ESMTPSA id 624392D1;
	Fri, 16 Dec 2016 18:24:09 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1480441323-31417-1-git-send-email-clg@kaod.org>
	<CAFEAcA9SVh-pUS+mnPWBYgWR9is49ysh9O_y35K-x2iyDwhfNg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f7bba440-f985-3fc4-cc93-f12dac768426@kaod.org>
Date: Fri, 16 Dec 2016 18:24:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9SVh-pUS+mnPWBYgWR9is49ysh9O_y35K-x2iyDwhfNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 2540311665433479957
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrjedugddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.47.167
Subject: Re: [Qemu-arm] [RFC PATCH 0/4] FTGMAC100 model for the Aspeed SoCs
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
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Dmitry Fleytman <dmitry@daynix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O9Kwnm57nCmM

On 12/16/2016 05:48 PM, Peter Maydell wrote:
> On 29 November 2016 at 17:41, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>> The Aspeed SoCs AST2400 and AST2500 have two FTGMAC100 ethernet
>> controllers. This serie proposes a model for this device and a way to
>> customize the bit definitions which are slightly different from the
>> Faraday definitions.
>>
>> The last patch adds a fake NC-SI (Network Controller Sideband
>> Interface) backend to pretend a NIC is being managed.
>=20
> Could you explain in a bit more detail why the patchset is
> marked "RFC" and what parts you want comments on?  (An RFC
> patchset that doesn't say this kind of thing in the cover letter
> is dangerously close to being a "please ignore me" request :-))

This is true. I didn't take the time to do so ...

Well, first, this is not an area I am familiar with, so this=20
might look more like a draft for experts and the review should=20
take that into account :)=20

Also, I am not entirely satisfied with how the model looks for=20
the first descriptor to transmit. May be I am trying to fit=20
too well the driver.

And, the NC-SI is just a fake one to exercise the linux driver=20
(we did find bugs with it) but I am wondering how far we should=20
push the model. It's a rather complex interface.

Thanks,

C.=20
