Received: by 10.25.0.198 with SMTP id 189csp663078lfa;
        Sat, 6 May 2017 08:24:38 -0700 (PDT)
X-Received: by 10.237.54.193 with SMTP id f59mr19521957qtb.63.1494084278104;
        Sat, 06 May 2017 08:24:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o124si1075539qkc.158.2017.05.06.08.24.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 May 2017 08:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d71ZT-0007LS-Ov
	for alex.bennee@linaro.org; Sat, 06 May 2017 11:24:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d71ZL-0007J9-JA
	for qemu-arm@nongnu.org; Sat, 06 May 2017 11:24:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d71ZH-0002rg-JG
	for qemu-arm@nongnu.org; Sat, 06 May 2017 11:24:27 -0400
Received: from mail.kernel.org ([198.145.29.136]:48030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1d71ZH-0002rX-E4; Sat, 06 May 2017 11:24:23 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id DBFE8203A4;
	Sat,  6 May 2017 15:24:20 +0000 (UTC)
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D7526203A0;
	Sat,  6 May 2017 15:24:18 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat,  6 May 2017 17:24:11 +0200
Message-Id: <20170506152414.8704-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH 0/3] hw/arm/exynos: QOM-ify the SoC
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
X-TUID: js9cKlNbXkRx

Hi,

Convert the Exynos4210 SoC driver into QOM model.

No external dependencies, rebased on v2.9.0-363-g0de9191deb14.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  hw/arm/exynos: Move RAM initialization next boards
  hw/arm/exynos: Declare local variables in some order
  hw/arm/exynos: QOM-ify the SoC

 hw/arm/exynos4210.c         | 40 +++++++++++++++-------------------
 hw/arm/exynos4_boards.c     | 53 +++++++++++++++++++++++++++++++++++++++------
 include/hw/arm/exynos4210.h | 11 +++++-----
 3 files changed, 69 insertions(+), 35 deletions(-)

-- 
2.9.3

