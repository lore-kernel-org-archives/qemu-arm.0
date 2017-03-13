Received: by 10.25.77.4 with SMTP id a4csp1289391lfb;
        Mon, 13 Mar 2017 11:48:17 -0700 (PDT)
X-Received: by 10.237.53.231 with SMTP id d36mr32652385qte.240.1489430897194;
        Mon, 13 Mar 2017 11:48:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6si1085968qkc.276.2017.03.13.11.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 11:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnV0w-0001RA-MK
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 14:48:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnV0t-0001R2-KB
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnV0p-0004gi-NN
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:48:11 -0400
Received: from mail.kernel.org ([198.145.29.136]:55900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cnV0p-0004fz-GO; Mon, 13 Mar 2017 14:48:07 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 6275720263;
	Mon, 13 Mar 2017 18:48:04 +0000 (UTC)
Received: from localhost.localdomain (bzq-79-180-56-222.red.bezeqint.net
	[79.180.56.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DC74720260;
	Mon, 13 Mar 2017 18:48:00 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 13 Mar 2017 20:47:47 +0200
Message-Id: <20170313184750.429-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH v3 0/3] hw/arm/exynos: Minor cleanups
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
Cc: eblake@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bJ80Kz1hR3GI

Hi,

Minor cleanups, no dependencies.

Changes since v1
================
1. Patch 1/3: Address missed Philippe's comments about error reporting
   verbosity.

Changes since v2
================
1. Patch 1/3: Address Eric's comment.
2. Patch 2/3: Address Peter's comments about "const".
3. Patch 3/3: Use "unsigned int". I had impression that no consensus was
   reached during discussion. If that is wrong impression, let me know.

Best regards,
Krzysztof



Krzysztof Kozlowski (3):
  hw/arm/exynos: Convert fprintf to qemu_log_mask/error_report
  hw/char/exynos4210_uart: Constify static array and few arguments
  hw/misc/exynos4210_pmu: Reorder local variables for readability

 hw/arm/exynos4_boards.c   |  6 +++---
 hw/char/exynos4210_uart.c |  8 ++++----
 hw/misc/exynos4210_pmu.c  |  4 ++--
 hw/timer/exynos4210_mct.c |  6 ++++--
 hw/timer/exynos4210_pwm.c | 13 +++++++------
 hw/timer/exynos4210_rtc.c | 19 ++++++++++---------
 6 files changed, 30 insertions(+), 26 deletions(-)

-- 
2.9.3

