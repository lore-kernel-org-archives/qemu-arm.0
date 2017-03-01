Received: by 10.25.0.147 with SMTP id 141csp1984293lfa;
        Wed, 1 Mar 2017 10:26:47 -0800 (PST)
X-Received: by 10.200.34.37 with SMTP id o34mr353888qto.213.1488392807386;
        Wed, 01 Mar 2017 10:26:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c15si4885612qtb.14.2017.03.01.10.26.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Mar 2017 10:26:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cj8xY-0004jM-Ml
	for alex.bennee@linaro.org; Wed, 01 Mar 2017 13:26:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cj8xS-0004j0-Ss
	for qemu-arm@nongnu.org; Wed, 01 Mar 2017 13:26:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cj8xO-0006qc-7J
	for qemu-arm@nongnu.org; Wed, 01 Mar 2017 13:26:38 -0500
Received: from mail.kernel.org ([198.145.29.136]:41276)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cj8xN-0006q4-W5; Wed, 01 Mar 2017 13:26:34 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 2841B20383;
	Wed,  1 Mar 2017 18:26:31 +0000 (UTC)
Received: from localhost.localdomain (bzq-109-67-52-244.red.bezeqint.net
	[109.67.52.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C304A20218;
	Wed,  1 Mar 2017 18:26:27 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  1 Mar 2017 20:26:13 +0200
Message-Id: <20170301182618.22395-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [RFC 0/5] hw: arm: exynos: Bring up secondary CPU +
 CPUIDLE issue
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H9CqrYEjSpR/

Hi,


The first patch fixes GIC and brings the secondary CPU. Unfortunately,
this brings up to light an annoying issue with CPUIDLE driver.


Overview of the problem
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
On Exynos4210, by default Linux kernel uses cpuidle driver which tries
to enter low power mode, called AFTR (Arm Off, Top Running).  On real
hardware this brings some power savings.  This AFTR mode requires second
CPU to be off, so the driver (coupled cpuidle driver) when system is idle=
:
1. Turns off second CPU,
2. Enters AFTR on CPU0.

However the QEMU system is then totally unresponsive (e.g. on serial cons=
ole)
and RCU stalls appear from time to time.  I spent some time on it and did=
 not
find the real cause behind the lag.  Maybe it is because the second CPU
does not really power down itself and system just burns the cycles under =
spin
locks?

Looking at recent stable kernels:
 - 3.10, 3.16 - works fine with two CPUs (no CPUIDLE driver),
 - 4.1 and newer - stalls and are unresponsive due to CPUIDLE being enabl=
ed.

The cpuidle driver is not relying on DTS. It is just enabled in exynos_de=
fconfig
and works.


Question
=3D=3D=3D=3D=3D=3D=3D=3D
I am quite new to QEMU.  I do not know the internals (yet), nor the desig=
n
how hardware should be emulated in such subtle details.

The questions I have are:
1. What is the preferred way to solve it? Maybe some a QEMU
   workaround to disable the cpuidle is okay?
2. Is it worth implementing a proper secondary CPU power down and=20
   at the end proper AFTR cpuidle? It might be quite difficult...
3. How such issues with deep sleep modes were solved for other
   ARM targets?


Best regards,
Krzysztof


Krzysztof Kozlowski (5):
  hw/intc/exynos4210_gic: Fix GIC memory mappings for secondary CPU
  hw/intc/exynos4210_gic: Use more meaningful name for local variable
  hw/timer/exynos4210_mct: Cleanup indentation and empty new lines
  hw/timer/exynos4210_mct: Fix checkpatch style errors
  hw/timer/exynos4210_mct: Remove unused defines

 hw/intc/exynos4210_gic.c  | 36 ++++++++++++++++++++--------------
 hw/timer/exynos4210_mct.c | 50 ++++++++++++++++++++---------------------=
------
 2 files changed, 42 insertions(+), 44 deletions(-)

--=20
2.9.3

