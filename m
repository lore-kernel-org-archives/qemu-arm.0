Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DF8C44500
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:42:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEcv-0005uA-2l; Sun, 05 Jul 2026 00:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbx-0004o6-U6
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:46 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbo-00044A-AH
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:45 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2cacb8416a1so13306475ad.1
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226255; x=1783831055; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IGDPhHwhZn4CtpoFYLi1kN7SQDwt8mZK08F0u+/IPxo=;
 b=P4iDrzxuiqP9WkWRlO+s7/yDn94SvkU5cqghNu5oDBLM8XYLH2lazv2ogb2Z5l/wey
 Qdq5BRnLB+W5kiWoRj9Up4whQ6Wnj/gWAmg/AS+NTZTHFLoC0q8ujgmDtLhTv+PLIP/t
 1g+goHRNciltObCkgS2j4XkbaYaoJIHsHKDtE178Sx+ArEBYnmPwgR7d1xUaLz5PG6sP
 18L9gYksouRpi7Upzkw4Le4OWj6PMmLZRMcFlRBMOvBQ/60cKXSx9kg/M0bFs9mt6o1o
 Sxipl4861HHiNx+qW71CSz/nlKUsJPiJX/ffjvBYFfSZVbArYG/2Af5jcHMdCVmG2Tc2
 rEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226255; x=1783831055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IGDPhHwhZn4CtpoFYLi1kN7SQDwt8mZK08F0u+/IPxo=;
 b=n6p2yJaDuxkc15kY0q7VmpnLnxBCmEzTuqKL8orhei3HE/f4NxBHoMh8urnPA8WcHp
 M0MpHSykk7JL4Y6r4yWxIwZ75Z+UXsSLoMdP6GIusD7KO/yzbqaRZioAa6FTHotztAPu
 hcwRfqbMeAu/CANQEs62nAb+yOjBadxHRxoqFQLr/UULAimYehVG7WGZ6/9f59UsCPv/
 OqmOJCK2J0JNZdq1YZDJUuYuIYHAQWAR3dmUY/i01zkYzMxd+RvVURm3CRQ1vV7srI6b
 KgVA9iKivMHSljSOdIsUmu5q7YjEqSMam5yT5JPwb1ZSQfMvcL1wfEpk5jKYf1v1Tj+l
 mUJg==
X-Gm-Message-State: AOJu0YwFnj/eP/vA2LiRKLYhP8bCjLathoQyCg+WYEqR3UNScQ+hEjzH
 uJdG3G4PZQOsAsUSP8pkAFEmKAV4CvvrhMV7hNnyh1MTucJse9lwQe4Cp6tlTWfPiLk=
X-Gm-Gg: AfdE7cmroMY6RGex/4Bld2eugnmJLd+dTeJeKHgGasKQyW/cjLBp5/vKb2+Vg0D5Tm+
 oISWYqoNKNbJzZydyPbLSSWAIzaVCsLvSwBYh1PBC0kGK8vESYoGsyvMfv7GdCuaEGZRf6+pqBZ
 iv8b/e7iMTrCr/yFOIom5FbAjUHu7wCrBniSU38DQN4f09B6zPnMY9/2zAXQVck/GzQNpJKH6CF
 p4DUHUPE2wOsSaKZxGnDn4IUzVqLYEyMsjv2mRHpmF7O1lDiSC0TYZnsdpqiTvYs553MaimMmCS
 8mEjmbwVBW9xUnOiu7XBl0GFInNILP1JCu8DlnSKY92pfF4A7raJXazBRg+DzeMenDZk7kfIs9E
 OLUJCKjiFN8WTZCnloVcM5dnRt3EBy/pG5r3hDm+d+zFXHM29QZFrXbK3E2PciXJ1fsKX8Sxqpz
 53O8zQoK5iSN9gI8+g406AUdQSyxOiiYmTqK5rbJFAghxsnEOUZ/YxlaL7xg==
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id
 d9443c01a7336-2cbb9e264d9mr49486075ad.17.1783226254795; 
 Sat, 04 Jul 2026 21:37:34 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 09/46] hw/core/cpu: Remove exec/breakpoint.h include
Date: Sat,  4 Jul 2026 21:36:48 -0700
Message-ID: <20260705043725.1373137-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This is no longer required in the generic header.  Add includes
where required elsewhere in the code base.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h     | 1 -
 accel/tcg/tcg-accel-ops.c | 1 +
 cpu-common.c              | 1 +
 gdbstub/system.c          | 1 +
 gdbstub/user.c            | 1 +
 target/i386/kvm/kvm.c     | 1 +
 target/ppc/kvm.c          | 1 +
 target/s390x/kvm/kvm.c    | 1 +
 target/xtensa/helper.c    | 1 +
 9 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 160db776d8..ca0b0c7978 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -22,7 +22,6 @@
 
 #include "hw/core/qdev.h"
 #include "disas/dis-asm.h"
-#include "exec/breakpoint.h"
 #include "exec/hwaddr.h"
 #include "exec/vaddr.h"
 #include "exec/memattrs.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 38e0a038c4..5c30a7be88 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -31,6 +31,7 @@
 #include "accel/tcg/cpu-loop.h"
 #include "system/tcg.h"
 #include "system/replay.h"
+#include "exec/breakpoint.h"
 #include "exec/icount.h"
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
diff --git a/cpu-common.c b/cpu-common.c
index ba2676cbad..af64bb1126 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "exec/cpu-common.h"
+#include "exec/breakpoint.h"
 #include "hw/core/cpu.h"
 #include "qemu/lockable.h"
 #include "trace/trace-root.h"
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 2063b63b2f..0b810477ee 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -15,6 +15,7 @@
 #include "qemu/error-report.h"
 #include "qemu/cutils.h"
 #include "exec/gdbstub.h"
+#include "exec/breakpoint.h"
 #include "gdbstub/syscalls.h"
 #include "gdbstub/commands.h"
 #include "exec/hwaddr.h"
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 97eb13e796..05fe18f906 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -14,6 +14,7 @@
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
 #include "qapi/error.h"
+#include "exec/breakpoint.h"
 #include "exec/hwaddr.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/commands.h"
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 64cc421abe..54bee753fa 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -68,6 +68,7 @@
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
 #include "migration/blocker.h"
+#include "exec/breakpoint.h"
 #include "exec/memattrs.h"
 #include "exec/target_page.h"
 #include "trace.h"
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 2a3711fb1d..c44edac41f 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -40,6 +40,7 @@
 #include "system/watchdog.h"
 #include "trace.h"
 #include "gdbstub/enums.h"
+#include "exec/breakpoint.h"
 #include "exec/memattrs.h"
 #include "system/ramblock.h"
 #include "system/hostmem.h"
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index fdef8f9e8a..9658534fa6 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -48,6 +48,7 @@
 #include "hw/s390x/s390-pci-bus.h"
 #include "hw/s390x/ipl.h"
 #include "hw/s390x/ebcdic.h"
+#include "exec/breakpoint.h"
 #include "exec/memattrs.h"
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/s390-hypercall.h"
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index 5a0e865514..0db5502287 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -30,6 +30,7 @@
 #include "cpu.h"
 #include "exec/cputlb.h"
 #include "exec/target_page.h"
+#include "exec/breakpoint.h"
 #include "gdbstub/helpers.h"
 #include "exec/helper-proto.h"
 #include "accel/tcg/cpu-loop.h"
-- 
2.43.0


