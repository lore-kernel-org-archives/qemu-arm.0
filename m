Received: by 10.25.0.144 with SMTP id 138csp206190lfa;
        Fri, 28 Apr 2017 06:41:35 -0700 (PDT)
X-Received: by 10.55.157.200 with SMTP id g191mr8801663qke.263.1493386895839;
        Fri, 28 Apr 2017 06:41:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l68si6026665qkf.290.2017.04.28.06.41.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Apr 2017 06:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:37171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d469P-0001fp-6C
	for alex.bennee@linaro.org; Fri, 28 Apr 2017 09:41:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@git.antfield.fr>) id 1d45ST-0005O2-BW
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 08:57:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@git.antfield.fr>) id 1d45SO-0001C8-GZ
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 08:57:13 -0400
Received: from bee.antfield.fr ([188.165.75.195]:54724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <luc.michel@git.antfield.fr>)
	id 1d45SO-0001Bl-7O; Fri, 28 Apr 2017 08:57:08 -0400
From: Luc MICHEL <luc.michel@git.antfield.fr>
To: qemu-devel@nongnu.org
Date: Fri, 28 Apr 2017 14:56:32 +0200
Message-Id: <20170428125632.5704-2-luc.michel@git.antfield.fr>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170428125632.5704-1-luc.michel@git.antfield.fr>
References: <20170428125632.5704-1-luc.michel@git.antfield.fr>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
X-Mailman-Approved-At: Fri, 28 Apr 2017 09:41:24 -0400
Subject: [Qemu-arm] [PATCH 1/1] target/arm: add data cache invalidation cp15
 instruction to cortex-r5
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Luc MICHEL <luc.michel@git.antfield.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SaNX5abOnIeH

The cp15, CRn=15, opc1=0, CRm=5, opc2=0 instruction invalidates all the
data cache on the cortex-r5. Implementing it as a NOP.

Signed-off-by: Luc MICHEL <luc.michel@git.antfield.fr>
---
 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b357aee778..47687a40c4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1062,6 +1062,8 @@ static const ARMCPRegInfo cortexr5_cp_reginfo[] = {
       .access = PL1_RW, .type = ARM_CP_CONST },
     { .name = "BTCM", .cp = 15, .opc1 = 0, .crn = 9, .crm = 1, .opc2 = 1,
       .access = PL1_RW, .type = ARM_CP_CONST },
+    { .name = "DCACHE_INVAL", .cp = 15, .opc1 = 0, .crn = 15, .crm = 5,
+      .opc2 = 0, .access = PL1_W, .type = ARM_CP_NOP },
     REGINFO_SENTINEL
 };
 
-- 
2.12.2

