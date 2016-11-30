Received: by 10.25.159.131 with SMTP id i125csp248345lfe;
        Wed, 30 Nov 2016 04:02:37 -0800 (PST)
X-Received: by 10.55.8.136 with SMTP id 130mr30843723qki.74.1480507357085;
        Wed, 30 Nov 2016 04:02:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i73si18377396qka.31.2016.11.30.04.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 04:02:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cC3au-0004zo-0V
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 07:02:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@d-silva.org>) id 1cBye7-0004gC-HF
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 01:45:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@d-silva.org>) id 1cBye4-0006kT-DL
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 01:45:35 -0500
Received: from [202.78.40.170] (port=31524 helo=mail2.nmnhosting.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@d-silva.org>)
	id 1cBye2-0003CT-Bh; Wed, 30 Nov 2016 01:45:32 -0500
Received: from adsilva.ozlabs.ibm.com (static-82-10.transact.net.au
	[122.99.82.10] (may be forged)) (authenticated bits=0)
	by mail2.nmnhosting.com (8.15.2/8.15.2) with ESMTPSA id uAU5oSeJ049201
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 30 Nov 2016 16:50:37 +1100 (AEDT)
	(envelope-from alastair@d-silva.org)
Message-ID: <1480485027.2452.19.camel@d-silva.org>
From: "Alastair D'Silva" <alastair@d-silva.org>
To: qemu-arm@nongnu.org
Date: Wed, 30 Nov 2016 16:50:27 +1100
In-Reply-To: <20161130053629.23340-1-alastair@au1.ibm.com>
References: <20161130053629.23340-1-alastair@au1.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.1 (3.22.1-2.fc25) 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.4.3
	(mail2.nmnhosting.com [10.0.1.20]);
	Wed, 30 Nov 2016 16:50:40 +1100 (AEDT)
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail2.nmnhosting.com id
	uAU5oSeJ049201
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 202.78.40.170
X-Mailman-Approved-At: Wed, 30 Nov 2016 07:02:10 -0500
Subject: Re: [Qemu-arm] [PATCH v2 0/6] Add support for the Epson RX8900 RTC
 to the aspeed board
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6TKhA1ZQi8vC

On Wed, 2016-11-30 at 16:36 +1100, Alastair D'Silva wrote:
>=20
> This patch series adds support for the Epson RX8900 RTC to the
> Aspeed board.
>=20
> The tests use the existing imx25 infrastructure, and some minor
> changes have been made to uniquely identify the I2C buses.
>=20
> A NULL check have been added to eliminate empty i2cslave init
> functions.
>=20
> Support for named interrupts has been implemented in qtest to
> facilitate testing.

Sorry, I missed a changelog...

Changelog:
v2:
 - Avoid using error_report
 - Fix TIE behaviour
 - Move temperature init out of reset, it should not change
   on a soft reset
 - Fix IRQ in test failures
 - Add a NULL check for i2c slave init callbacks, so that we
   no longer need to implement empty init functions.
 - Refactor to use the existing qemu trace infrastructure
 - Move the RX8900 definition into the aspeed machine init
 - It it possible for check_update_interrupt_seconds in the
   rx8900 test to return 6,=C2=A0depending on the alignment with
   the wall clock.
 - Support low voltage detection
=09
=09
