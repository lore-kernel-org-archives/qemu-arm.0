Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp645523wrp;
        Tue, 3 Sep 2019 09:07:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0ihN7P5ZuQ1s63zzrXQnKcU7zbQNr9M6KNKRC+/Z1sj2UOz7Ho7TM+OJvxPEz5ZamTIEW
X-Received: by 2002:aa7:df81:: with SMTP id b1mr13576379edy.281.1567526833202;
        Tue, 03 Sep 2019 09:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567526833; cv=none;
        d=google.com; s=arc-20160816;
        b=kWshDI6GoDfRatoI9iBDXk37jARpBYiknw0+jv+fspU2T7vGlYnmJqBu3rCEhOkas6
         QJ9MLNq0fEeMwISSJWhTpnlhUSgdG1gwdpmuUiYIsyjwq3yCOzxgR3m07sce/xGkfxVk
         gEZjrTUOnI6KN5vEtksJPfuC/vWFpbf5t/cBvzjSazYgly+tPFo4D0Tls6g38NT0K2Y9
         q/XQfZ7kig4jhkVDtmSAAHC4pjpYsyWbLFOtcmUAQS3j/3gXX7IgxnUp0gLpbq04GnnP
         5FUHKllskxDPRRkE0DMVzXaTbfII8HMKLph2sE8VFWEnLT6nhr9wAeF7q43OqYW52PBf
         k/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=mRQmaveSSpg3djm51GIrbMfvZ6RK5hq+k14nbPzgoMk=;
        b=BwH79oouRSh8MlbKyoI31L3dwtJFFp6v53tdBAeJDgmyDmXJMaukKzQXDoMyEwuQKY
         KpLuCFB2WYcQuk3+qJ/xN4d4iNayRaeW/VvU1OPGyfc/80CAoK6I0ru9WU9Xq7nLseCE
         i5QuhRIC3bD6Sd0oID2t7qrLaSiJ2F1ERA4d4UYnFoqLyR6J1GVFng8pXBIfcD42rjw5
         rf+Gii7LRmID2Kou7OarXtiKXHhqo4gwDfog2/RPwUJfhJNrWhnsvOxXyWOyWO8RaOMg
         b9Fjdzys0VwhSC9Xi8puPpIKytIantIJSy2MZ4n8cSdEPBYuPiGLAlDWNY3EpklnZOmw
         ZB+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj15si3947225ejb.284.2019.09.03.09.07.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 09:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5BKp-0006ib-So
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 12:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i5B2i-0004uI-Nk
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 11:48:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i5B2h-0005Y1-E4
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 11:48:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40734)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1i5B2e-0005Ra-6j; Tue, 03 Sep 2019 11:48:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6BDCE3083394;
 Tue,  3 Sep 2019 15:48:21 +0000 (UTC)
Received: from thuth.com (ovpn-117-51.ams2.redhat.com [10.36.117.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F315194B2;
 Tue,  3 Sep 2019 15:48:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue,  3 Sep 2019 17:48:10 +0200
Message-Id: <20190903154810.27365-4-thuth@redhat.com>
In-Reply-To: <20190903154810.27365-1-thuth@redhat.com>
References: <20190903154810.27365-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 03 Sep 2019 15:48:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC PATCH 3/3] target/arm: Make m_helper.c optional
 via CONFIG_ARM_V7M
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OnOXR1s08Yvd

We've already got the CONFIG_ARM_V7M switch, but it currently can
not be disabled yet. The m_helper.c code should not be compiled
into the binary if the switch is not enabled. We also have to
provide some stubs in a separate file to make sure that we still
can link the other code without CONFIG_ARM_V7M.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/arm/Makefile.objs   |  3 +-
 target/arm/m_helper-stub.c | 58 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/m_helper-stub.c

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 5cafc1eb6c..225e7a70a9 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -36,7 +36,8 @@ obj-y += tlb_helper.o debug_helper.o
 obj-y += translate.o op_helper.o
 obj-y += crypto_helper.o
 obj-y += iwmmxt_helper.o vec_helper.o neon_helper.o
-obj-y += m_helper.o
+obj-$(CONFIG_ARM_V7M) += m_helper.o
+obj-$(call lnot,$(CONFIG_ARM_V7M)) += m_helper-stub.o
 
 obj-$(CONFIG_SOFTMMU) += psci.o
 
diff --git a/target/arm/m_helper-stub.c b/target/arm/m_helper-stub.c
new file mode 100644
index 0000000000..8ec9de0fb6
--- /dev/null
+++ b/target/arm/m_helper-stub.c
@@ -0,0 +1,58 @@
+/*
+ * ARM V7M related stubs.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+
+void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
+{
+    abort();
+}
+
+void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
+{
+    abort();
+}
+
+uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
+{
+    abort();
+}
+
+void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
+{
+    abort();
+}
+
+uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
+{
+    abort();
+}
+
+void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
+{
+    abort();
+}
+
+void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
+{
+    abort();
+}
+
+void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
+{
+    abort();
+}
+
+void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
+{
+    abort();
+}
+
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
+{
+    abort();
+}
-- 
2.18.1

