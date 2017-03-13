Received: by 10.25.77.4 with SMTP id a4csp1274885lfb;
        Mon, 13 Mar 2017 11:05:05 -0700 (PDT)
X-Received: by 10.55.109.198 with SMTP id i189mr34537305qkc.242.1489428305575;
        Mon, 13 Mar 2017 11:05:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k124si990340qkf.224.2017.03.13.11.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 11:05:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnUL9-0003IM-1k
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 14:05:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnUKw-0003HF-8Z
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:04:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnUKt-00011C-1a
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:04:50 -0400
Received: from mail.kernel.org ([198.145.29.136]:50648)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cnUKs-0000zt-Rl; Mon, 13 Mar 2017 14:04:46 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 1FE06203B1;
	Mon, 13 Mar 2017 18:04:43 +0000 (UTC)
Received: from localhost.localdomain (bzq-79-180-56-222.red.bezeqint.net
	[79.180.56.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 961F0203B0;
	Mon, 13 Mar 2017 18:04:39 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon, 13 Mar 2017 20:04:27 +0200
Message-Id: <20170313180432.7067-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH v2 0/5] hw: arm: exynos: Bring up secondary CPU +
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5icqFKIOdPp1

Hi,


The first patch fixes GIC and brings the secondary CPU. Unfortunately,
this brings up to light an annoying issue with CPUIDLE driver.


Changes since v1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1. Use one cast to obj in patch 1/5 (suggested by Peter).
2. Add Peter's review tags.
3. Re-order patches 3 and 4 to silence the checkpatch warning earlier.


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

Workarounds
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1. Boot with only 1 cpu
2. Build a kernel with disabled CONFIG_CPU_IDLE



Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  hw/intc/exynos4210_gic: Fix GIC memory mappings for secondary CPU
  hw/intc/exynos4210_gic: Use more meaningful name for local variable
  hw/timer/exynos4210_mct: Fix checkpatch style errors
  hw/timer/exynos4210_mct: Cleanup indentation and empty new lines
  hw/timer/exynos4210_mct: Remove unused defines

 hw/intc/exynos4210_gic.c  | 33 +++++++++++++++++++------------
 hw/timer/exynos4210_mct.c | 50 ++++++++++++++++++++---------------------=
------
 2 files changed, 41 insertions(+), 42 deletions(-)

--=20
2.9.3

