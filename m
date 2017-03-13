Received: by 10.25.77.4 with SMTP id a4csp1286297lfb;
        Mon, 13 Mar 2017 11:38:26 -0700 (PDT)
X-Received: by 10.237.59.150 with SMTP id r22mr33124919qte.100.1489430306071;
        Mon, 13 Mar 2017 11:38:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s126si1062775qkb.275.2017.03.13.11.38.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 11:38:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnUrP-00077D-CF
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 14:38:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnUph-0005l3-BM
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:36:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnUpg-0000i4-F4
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:36:37 -0400
Received: from mail.kernel.org ([198.145.29.136]:54476)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cnUpg-0000hg-8z; Mon, 13 Mar 2017 14:36:36 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 7F7DE203F7;
	Mon, 13 Mar 2017 18:36:34 +0000 (UTC)
Received: from localhost.localdomain (bzq-79-180-56-222.red.bezeqint.net
	[79.180.56.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0CF87203F1;
	Mon, 13 Mar 2017 18:36:30 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 13 Mar 2017 20:35:57 +0200
Message-Id: <20170313183557.23195-4-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170313183557.23195-1-krzk@kernel.org>
References: <20170313183557.23195-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH v2 3/3] hw/misc/exynos4210_pmu: Reorder local
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
Cc: eblake@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HOyaIlVpCH6n

Short declaration of 'i' was in the middle of declarations with
assignments.  Make it a little bit more readable.  Additionally switch
from "unsigned" to "unsigned int" as this pattern is more widely used.
No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/misc/exynos4210_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
index e30dbc7d3d83..63a8ccd35559 100644
--- a/hw/misc/exynos4210_pmu.c
+++ b/hw/misc/exynos4210_pmu.c
@@ -401,8 +401,8 @@ static uint64_t exynos4210_pmu_read(void *opaque, hwaddr offset,
                                     unsigned size)
 {
     Exynos4210PmuState *s = (Exynos4210PmuState *)opaque;
-    unsigned i;
     const Exynos4210PmuReg *reg_p = exynos4210_pmu_regs;
+    unsigned int i;
 
     for (i = 0; i < PMU_NUM_OF_REGISTERS; i++) {
         if (reg_p->offset == offset) {
@@ -420,8 +420,8 @@ static void exynos4210_pmu_write(void *opaque, hwaddr offset,
                                  uint64_t val, unsigned size)
 {
     Exynos4210PmuState *s = (Exynos4210PmuState *)opaque;
-    unsigned i;
     const Exynos4210PmuReg *reg_p = exynos4210_pmu_regs;
+    unsigned int i;
 
     for (i = 0; i < PMU_NUM_OF_REGISTERS; i++) {
         if (reg_p->offset == offset) {
-- 
2.9.3

