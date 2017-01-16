Received: by 10.25.205.13 with SMTP id d13csp130637lfg;
        Mon, 16 Jan 2017 09:51:48 -0800 (PST)
X-Received: by 10.200.46.162 with SMTP id h31mr15825628qta.164.1484589108365;
        Mon, 16 Jan 2017 09:51:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m30si10519159qtg.253.2017.01.16.09.51.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jan 2017 09:51:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTBRZ-00066H-S0
	for alex.bennee@linaro.org; Mon, 16 Jan 2017 12:51:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cTArM-0005se-9R
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 12:14:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cTArH-000501-Bn
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 12:14:20 -0500
Received: from 3.mo5.mail-out.ovh.net ([46.105.40.108]:38117)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cTArH-0004zt-4s
	for qemu-arm@nongnu.org; Mon, 16 Jan 2017 12:14:15 -0500
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id C59A86CC1E
	for <qemu-arm@nongnu.org>; Mon, 16 Jan 2017 18:14:13 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
	[90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
	by player760.ha.ovh.net (Postfix) with ESMTPSA id 91864396;
	Mon, 16 Jan 2017 18:14:04 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-28-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <16bf90e2-8538-ac01-bd62-1333f80854ee@kaod.org>
Date: Mon, 16 Jan 2017 18:14:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1480434248-27138-28-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 18403115455994694611
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelgedrfeehgddvvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuoehnohhnvgeqnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.40.108
Subject: Re: [Qemu-arm] [PATCH for-2.9 27/30] wdt: Add Aspeed watchdog
 device model
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jARJMWOFIuRs

On 11/29/2016 04:44 PM, C=C3=A9dric Le Goater wrote:
> From: Joel Stanley <joel@jms.id.au>
>=20
> The Aspeed SoC includes a set of watchdog timers using 32-bit
> decrement counters, which can be based either on the APB clock or
> a 1 MHz clock.
>=20
> The watchdog timer is designed to prevent system deadlock and, in
> general, it should be restarted before timeout. When a timeout occurs,
> different types of signals can be generated, ARM reset, SOC reset,
> System reset, CPU Interrupt, external signal or boot from alternate
> block. The current model only performs the system reset function as
> this is used by U-Boot and Linux.
>=20

Shall I resend the 3/4 patches related to the watchdog in a separate
patchset ?=20

Thanks,

C.=20

