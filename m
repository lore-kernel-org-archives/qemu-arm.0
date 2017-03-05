Received: by 10.25.0.147 with SMTP id 141csp1127783lfa;
        Sun, 5 Mar 2017 13:49:46 -0800 (PST)
X-Received: by 10.55.104.21 with SMTP id d21mr12435098qkc.49.1488750586578;
        Sun, 05 Mar 2017 13:49:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6si1010090qtd.44.2017.03.05.13.49.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Mar 2017 13:49:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cke2B-0006AD-UV
	for alex.bennee@linaro.org; Sun, 05 Mar 2017 16:49:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cke1z-00066B-2k
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 16:49:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cke1y-0007Sl-9L
	for qemu-arm@nongnu.org; Sun, 05 Mar 2017 16:49:31 -0500
Received: from mail.kernel.org ([198.145.29.136]:56846)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cke1y-0007SO-3g; Sun, 05 Mar 2017 16:49:30 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 387B120125;
	Sun,  5 Mar 2017 21:49:28 +0000 (UTC)
Received: from localhost.localdomain (bzq-109-67-52-244.red.bezeqint.net
	[109.67.52.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 748CC20212;
	Sun,  5 Mar 2017 21:49:25 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun,  5 Mar 2017 23:48:57 +0200
Message-Id: <20170305214857.9510-3-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170305214857.9510-1-krzk@kernel.org>
References: <20170305214857.9510-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH 3/3] hw/misc/exynos4210_pmu: Reorder local
 variables for readability
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
X-TUID: Z3jFSd4aFt6Y

Short declaration of 'i' was in the middle of declarations with
assignments.  Make it a little bit more readable.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/misc/exynos4210_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
index cbdfa0614600..60d1545c0baa 100644
--- a/hw/misc/exynos4210_pmu.c
+++ b/hw/misc/exynos4210_pmu.c
@@ -401,8 +401,8 @@ static uint64_t exynos4210_pmu_read(void *opaque, hwaddr offset,
                                     unsigned size)
 {
     const Exynos4210PmuState *s = (Exynos4210PmuState *)opaque;
-    unsigned i;
     const Exynos4210PmuReg *reg_p = exynos4210_pmu_regs;
+    unsigned i;
 
     for (i = 0; i < PMU_NUM_OF_REGISTERS; i++) {
         if (reg_p->offset == offset) {
@@ -420,8 +420,8 @@ static void exynos4210_pmu_write(void *opaque, hwaddr offset,
                                  uint64_t val, unsigned size)
 {
     Exynos4210PmuState *s = (Exynos4210PmuState *)opaque;
-    unsigned i;
     const Exynos4210PmuReg *reg_p = exynos4210_pmu_regs;
+    unsigned i;
 
     for (i = 0; i < PMU_NUM_OF_REGISTERS; i++) {
         if (reg_p->offset == offset) {
-- 
2.9.3

