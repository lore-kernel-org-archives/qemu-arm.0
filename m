Received: by 10.25.0.198 with SMTP id 189csp931960lfa;
        Sun, 7 May 2017 04:36:04 -0700 (PDT)
X-Received: by 10.200.50.143 with SMTP id z15mr48889278qta.114.1494156964258;
        Sun, 07 May 2017 04:36:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r68si9719037qke.26.2017.05.07.04.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 May 2017 04:36:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7KTp-0007fW-Ek
	for alex.bennee@linaro.org; Sun, 07 May 2017 07:36:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7KTk-0007eF-Ch
	for qemu-arm@nongnu.org; Sun, 07 May 2017 07:35:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7KTf-0004UD-Cy
	for qemu-arm@nongnu.org; Sun, 07 May 2017 07:35:56 -0400
Received: from mail.kernel.org ([198.145.29.136]:56144)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1d7KTf-0004Th-7z; Sun, 07 May 2017 07:35:51 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 92F4620374;
	Sun,  7 May 2017 11:35:48 +0000 (UTC)
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1522120361;
	Sun,  7 May 2017 11:35:45 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun,  7 May 2017 13:35:37 +0200
Message-Id: <20170507113540.8687-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH 0/3] hw/arm/exynos: Fix poweroff
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fTltFi9g8jxP

Hi,

Beside two minor cleanups, the patchset implements proper Exynos power off.
Still the GIC [1] fix is needed because the kernel will not reach power off
handlers without it.

[1] http://patchwork.ozlabs.org/patch/738320/

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  hw/arm/exynos: Use type define instead of hard-coded a9mpcore_priv
    string
  hw/intc/exynos: Constify array of combiner interrupts
  hw/arm/exynos: Add support for system poweroff

 hw/arm/exynos4210.c      |  3 ++-
 hw/intc/exynos4210_gic.c |  2 +-
 hw/misc/exynos4210_pmu.c | 14 ++++++++++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.9.3

