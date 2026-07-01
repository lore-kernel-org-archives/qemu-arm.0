Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1344C43327
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 03:05:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1welGB-00063j-Sp; Tue, 30 Jun 2026 23:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFv-0005h0-Ea
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:04:56 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFr-0002oh-Il
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:04:55 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2c74383c93cso1180265ad.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 20:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875090; x=1783479890; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fYkR10xGijSj9NHAYmbf6T4A8YrwDfmmBe0qsSqt02A=;
 b=PlJh29MZG+wnIK3EdQOaafl/sF1UKw7yA0RgbRw/knE+ZRI4U6MBNDMyYeMPsElD5R
 CankjxBYkYOBtF2g/jKbdBsve97YVd214sEqHfjAfsJ2PTEpOoqK/tZCzL9luePyz6YC
 yjEAr//nAIYnnj26I+ef9qhBDOVNyRWgdyCjnTF9dv6eyWvd6WlllQiExy8d3pPDrH5S
 0UlnQFt+hybYGklPWfiXl/DPj4LNdG+JbGlm06j1uBwrE+YvLp+OXmlRfHsZAA6tKt2s
 0OINouPKuiFH33QvC0TdbdBgY+1TuUXwWCIXUsDpn2s1scpgObEVgK492Etw2k0+3tzp
 5rWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875090; x=1783479890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fYkR10xGijSj9NHAYmbf6T4A8YrwDfmmBe0qsSqt02A=;
 b=tV4RrYSdXhK7PupGm9WvE6lofXAtvB4e8pvEiHdq5X+XthV2ArAtV0K4CPTot1aerW
 TufVuTu/c0I5HKta3lvhQr9stx0hc8gaNzVuorhqB/Lm68fUtMhbL1hMxybSxeSaHTjD
 /sdZkL7lUzY/TV0Bq2ziAIV8AXUQTsBzhlJOzuTDshy5XnCDzS3Iw02QNvCaXdUhJn7y
 JxM8F0turEylbdS/MTSBWlYzTAcqWsDvQfeFha3xwl0TzJ8vwveJF0QquNk1cTqcuYLo
 mD3rmca8A0yeP8MzEWZGK213Cw0NC1F5vSQxXi0U0hnVcltxsubl17M5SYkIXL+QyfbW
 LcmQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoiaRj6UXwf+A41z0AwkbOhQ/9bh55c5v5267E05TKjvkQdI1KXPpyk81foeUxOdS+gR8z3yIgQSQ==@nongnu.org
X-Gm-Message-State: AOJu0YwJxo8XbXTJ3zwYMvj8j7mtczW1yZIVqOOr6MMPDz3k+uAqGKr6
 SVx0tmTUjuIwOXNyOFy0viNXIRvC3Fyn0xLKu65Wl0E8KZnkG0oqHvApJ5xxFDASLG0=
X-Gm-Gg: AfdE7cnd0ZTn3esCEwcDy9ibwi2ImAbQqRHwgooNqexSIqzT1vSv/l75VZ6YhnGvBJT
 71AnCPF68WJ78KWOmpxGvS+8qNmeiAeOUZE7bQPiZ69qx/LlGbzWiwkYWxTL4NOu70LUMF17yS7
 LQ/6gsHiRvNGhyYzsUPAW8GSNd+Z+WOPMh1gVmRISqIZUVJUahC9WXYgLvSM9ihZa00BBf7pYci
 2RrjUp/fTjud/hTigde2xlHDBJG9x6Drsay+aS7nRAh69VT7665MpSeTtzSY4saflI5iVSW/O2z
 svXC+aZfg0ZlA23ZX3RXVpaa6CQGloGR/8fvavPZVPaeLFVZ+Mz0eeK9PC6Ye4d955HT73/tNir
 mdQMrGfr0bpEvtwb5riEu/KbGKiLFupDximMG9YMl7QdjkrCurCDUuJXkahYho1onefZEjfAJkA
 AQKMzosqVPP53A2xNxG2sGhs81zOo9FERxRPSSoYbsN+xJt9LIJQ==
X-Received: by 2002:a17:903:291:b0:2c9:bd64:8c81 with SMTP id
 d9443c01a7336-2ca5a58544dmr25847205ad.18.1782875089934; 
 Tue, 30 Jun 2026 20:04:49 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 06/17] *: Add missing include of exec/breakpoint.h
Date: Tue, 30 Jun 2026 20:04:32 -0700
Message-ID: <20260701030443.1382447-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops.c           | 1 +
 cpu-common.c                        | 1 +
 gdbstub/system.c                    | 1 +
 gdbstub/user.c                      | 1 +
 system/watchpoint.c                 | 1 +
 target/i386/cpu.c                   | 1 +
 target/i386/kvm/kvm.c               | 1 +
 target/i386/machine.c               | 1 +
 target/i386/tcg/system/bpt_helper.c | 1 +
 target/ppc/cpu.c                    | 1 +
 target/xtensa/dbg_helper.c          | 1 +
 target/xtensa/helper.c              | 1 +
 12 files changed, 12 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index c179cd4ade..c153bb3355 100644
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
index adb76b3a78..11ab32d64d 100644
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
index 2063b63b2f..6ff24312bf 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -18,6 +18,7 @@
 #include "gdbstub/syscalls.h"
 #include "gdbstub/commands.h"
 #include "exec/hwaddr.h"
+#include "exec/breakpoint.h"
 #include "accel/accel-ops.h"
 #include "accel/accel-cpu-ops.h"
 #include "system/address-spaces.h"
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
diff --git a/system/watchpoint.c b/system/watchpoint.c
index 21d0bb36ca..4c2543a7c9 100644
--- a/system/watchpoint.c
+++ b/system/watchpoint.c
@@ -21,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "exec/cputlb.h"
 #include "exec/target_page.h"
+#include "exec/breakpoint.h"
 #include "exec/watchpoint.h"
 #include "hw/core/cpu.h"
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5805d33ab9..422ca139af 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -39,6 +39,7 @@
 #include "standard-headers/asm-x86/kvm_para.h"
 #include "hw/core/qdev-properties.h"
 #include "hw/i386/topology.h"
+#include "exec/breakpoint.h"
 #include "exec/watchpoint.h"
 #ifndef CONFIG_USER_ONLY
 #include "confidential-guest.h"
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 64cc421abe..739e21793d 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -70,6 +70,7 @@
 #include "migration/blocker.h"
 #include "exec/memattrs.h"
 #include "exec/target_page.h"
+#include "exec/breakpoint.h"
 #include "trace.h"
 
 #include CONFIG_DEVICES
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 1f5c517e56..2b9cf3878d 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -7,6 +7,7 @@
 #include "hw/i386/x86.h"
 #include "kvm/kvm_i386.h"
 #include "hw/xen/xen.h"
+#include "exec/breakpoint.h"
 #include "exec/watchpoint.h"
 #include "system/kvm.h"
 #include "system/kvm_xen.h"
diff --git a/target/i386/tcg/system/bpt_helper.c b/target/i386/tcg/system/bpt_helper.c
index 2feea69c8a..3b1ecd8735 100644
--- a/target/i386/tcg/system/bpt_helper.c
+++ b/target/i386/tcg/system/bpt_helper.c
@@ -21,6 +21,7 @@
 #include "accel/tcg/cpu-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
+#include "exec/breakpoint.h"
 #include "exec/watchpoint.h"
 #include "tcg/helper-tcg.h"
 
diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 41edb18643..0bd6ebe39b 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -22,6 +22,7 @@
 #include "cpu-models.h"
 #include "cpu-qom.h"
 #include "exec/log.h"
+#include "exec/breakpoint.h"
 #include "exec/watchpoint.h"
 #include "fpu/softfloat-helpers.h"
 #include "mmu-hash64.h"
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index 3d1143ad5e..160cdd798c 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -30,6 +30,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
+#include "exec/breakpoint.h"
 #include "exec/watchpoint.h"
 #include "system/address-spaces.h"
 
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


