Received: by 10.25.77.65 with SMTP id a62csp973042lfb;
        Mon, 13 Feb 2017 09:34:38 -0800 (PST)
X-Received: by 10.237.54.1 with SMTP id e1mr21503221qtb.68.1487007278655;
        Mon, 13 Feb 2017 09:34:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s4si7725231qkb.27.2017.02.13.09.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Feb 2017 09:34:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdKWK-0005Gv-4a
	for alex.bennee@linaro.org; Mon, 13 Feb 2017 12:34:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cdKIz-00008k-GF
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 12:20:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cdKIu-000564-Ev
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 12:20:49 -0500
Received: from 14.mo4.mail-out.ovh.net ([46.105.40.29]:46034)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cdKIu-00055r-6w
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 12:20:44 -0500
Received: from player159.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 951404A781
	for <qemu-arm@nongnu.org>; Mon, 13 Feb 2017 18:20:42 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
	by player159.ha.ovh.net (Postfix) with ESMTPSA id CD7C0480093;
	Mon, 13 Feb 2017 18:20:37 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1486997062-23227-1-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <df53ac4c-81bd-c8be-5be8-478292c7c3f4@kaod.org>
Date: Mon, 13 Feb 2017 18:20:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486997062-23227-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 16927342150168120128
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrleefgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.40.29
Subject: Re: [Qemu-arm] [PATCH 0/2] aspeed/smc: add support for DMAs
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2bOp6BTIUpus

On 02/13/2017 03:44 PM, C=C3=A9dric Le Goater wrote:
> Hello,
>=20
> Here is a short series adding support for DMAs to the SMC controller
> of the Aspeed SoCs. It uses coroutines to spawn the DMA requests in
> bottom halves. This method is inspired from the block layer, the code
> looks nice but maybe, this is unnecessarily complex. Paolo, could you
> provide some feedback ?

I forgot the magic word here. Sorry about that. When ever you have some
time, please !

Thanks,

C.=20

