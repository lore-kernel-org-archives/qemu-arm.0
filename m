Received: by 10.25.0.198 with SMTP id 189csp663176lfa;
        Sat, 6 May 2017 08:24:58 -0700 (PDT)
X-Received: by 10.200.50.183 with SMTP id z52mr51398610qta.272.1494084298021;
        Sat, 06 May 2017 08:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494084298; cv=none;
        d=google.com; s=arc-20160816;
        b=ZqutstB5GdQy7FKx3yUXb70CRVESm/WJhA01qJobzO4tTqKhUaOHlmYCg6gmCwz8YG
         L7uGeA5FGFsoMx7s7ot8UpqHdIKBDf0RW/AsXL0lKiY2AFp+lx4zO5kuSwMqyp1cQL2f
         Tghb6Vh/mp3kBvJ46pKmIfZyx7Y1vVZzOIbhSnvf5Q8c6x0B/RV12z+cEYq9eLLW0j5F
         iz4rjNyV8sY9dza7llXBkU2BM2rL/X58t76DadvYjXuXwybV5y8mFdKEOzwaa4NOOo29
         NNpGxgDI4gRKDd4lb4wXB/Ugxhy4OnFedHt65/bkH3OWhlWShdEi8YiHylcojc1ATv9v
         5Vxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=SgNa4nP93GtiHha41y+ZSodfhW54D4sg+tMcimpt/aE=;
        b=O0pMpk3NwIs5/TPKwUB6VY9/pGmKXK3MbHjEY8ybMiGDFeQg5i+KqECAkCj9q4PUyH
         K5Zs8ROPPj6xNqrbWTkIFSq6lz+7D9lv0pWlaVXl6S2Z5f1wKeYz5R53fXtL5qB4uwCD
         OCsh3X8znmOv90flwESGR8kRbZ/hna3uW+ylBgRL8YKcptl7vofZssLliFOU7J8IR3Il
         xN7Us/pC+NXTBAod+iVAUmJPGeYvtCyL2B+3O/Ao6k+eyiGxxjd6RksOIhOO3v25mQnJ
         +xgoyEusvTLVDoSGYGlgfB+KxQdWklnGi038vQ30TWF3GiT2OzI5X2Fqmpy5srgla0QX
         e50w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 25si7926948qtt.224.2017.05.06.08.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 May 2017 08:24:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d71Zn-0007VR-EI
	for alex.bennee@linaro.org; Sat, 06 May 2017 11:24:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d71ZM-0007JA-5x
	for qemu-arm@nongnu.org; Sat, 06 May 2017 11:24:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d71ZL-0002sG-F6
	for qemu-arm@nongnu.org; Sat, 06 May 2017 11:24:28 -0400
Received: from mail.kernel.org ([198.145.29.136]:48072)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1d71ZL-0002ru-9r; Sat, 06 May 2017 11:24:27 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id BC0C5203A0;
	Sat,  6 May 2017 15:24:25 +0000 (UTC)
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CD482203A4;
	Sat,  6 May 2017 15:24:23 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat,  6 May 2017 17:24:13 +0200
Message-Id: <20170506152414.8704-3-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170506152414.8704-1-krzk@kernel.org>
References: <20170506152414.8704-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH 2/3] hw/arm/exynos: Declare local variables in
 some order
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
X-TUID: VHqe0rpXD79i

Bring some more readability by declaring local function variables, first
initialized ones and then the rest (with reversed-christmas-tree order).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/arm/exynos4210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 0da877f8db0a..27a7bf28a5a9 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -162,12 +162,12 @@ static uint64_t exynos4210_calc_affinity(int cpu)
 
 Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
 {
-    int i, n;
     Exynos4210State *s = g_new(Exynos4210State, 1);
     qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
-    DeviceState *dev;
     SysBusDevice *busdev;
     ObjectClass *cpu_oc;
+    DeviceState *dev;
+    int i, n;
 
     cpu_oc = cpu_class_by_name(TYPE_ARM_CPU, "cortex-a9");
     assert(cpu_oc);
-- 
2.9.3

