Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp230324njk;
        Tue, 17 Dec 2024 06:07:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/DazTJjjUTxJPUswDMCC1ny62woWHDMBeGinlFIFzef61cVJDLOtL+QWWZ+bruJHo9j3Jx4YSWh6/Ow==@linaro.org
X-Google-Smtp-Source: AGHT+IHUr5fIAw1WdvhOe/g1F18kpGvxJ4tlU1cTrqX0RP6cOV4dxzL9wjai6e3Skehec2CEHrV/
X-Received: by 2002:a05:6122:32d5:b0:515:20e6:7861 with SMTP id 71dfb90a1353d-51a25cb598amr3336454e0c.2.1734444446563;
        Tue, 17 Dec 2024 06:07:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734444446; cv=none;
        d=google.com; s=arc-20240605;
        b=QxxW5lO3DM4jfPf1K2/w/EjcekD6UUC9uv7vnIhAciEMOVa6duX7hhNsn7NMnA8eC+
         BUSrt3v//D8kJzxYQ5xbSi5OCOqy3IKttVV6rpWTIJBeOlG9lihNdTma+ZDdU/K3n+eY
         J3VaOCBm1zRruje3vySHvL4w0CcoasYuwwZo6uTjHiwh8umaqwiFY715+ti6MHwSZFaI
         QsMSav4XDjz4o5ujqfECYRU+fpznR7t0k7EwMInCAmLicDPft77ANfbb8UvNkOXW5alw
         +m8IqE13DAtyzZM4abzlWRFM356iN4tFpgmhf0GKUb15T+3Fr2KLcgwnmidUrvEK8dmZ
         fTcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=74gRFMianHMsIWZDOBz6aYywOh8vp8qmdUQzHnxSF2o=;
        fh=WdQK5gPB856HFnEM4llbmGZQ6OHP9UT3fyT7CsE7kkg=;
        b=XZE80EFLTRPmNndmyro+W9nyDW1nMwsRPnVTaZzk6JjhxkAjeZuRToV1upwVXbIlX5
         QN5KMhRFzyHJrlCRdi3Nav8Mh07/LpkBRpKJAkNmtcTY473n7R75hjINxuahWlUzoGOt
         FTQn2BxU2H+JMAEmoFbaFqR2w98dnqZ0yyFLq9UyEuVIZWDegGqkSY/QNEBVXWtFtl/+
         lwRv4q73IE5jAD+7sqAaCJUhnA1UpX1AxIJrfxWPbwyV2928md3bOakL+CQIbBrAfFCL
         37KMUiLJH/jonJI5nIutPlWJlgbAgOSXaXdfpZtJcZtd7NsFFmRpDcNnyzrqVxCZit3y
         n05Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iz+WMUEE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-519e35e1b4esi2468775e0c.88.2024.12.17.06.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2024 06:07:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iz+WMUEE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNYDv-00055x-FT; Tue, 17 Dec 2024 09:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNYDt-00054k-LG
 for qemu-arm@nongnu.org; Tue, 17 Dec 2024 09:06:53 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tNYDr-000129-NF
 for qemu-arm@nongnu.org; Tue, 17 Dec 2024 09:06:53 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so29706945e9.0
 for <qemu-arm@nongnu.org>; Tue, 17 Dec 2024 06:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734444410; x=1735049210; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=74gRFMianHMsIWZDOBz6aYywOh8vp8qmdUQzHnxSF2o=;
 b=Iz+WMUEE010sDUqyCKEyFfWDhpGSi4MC7X85/YlpaLZILCHH0UGU3f//GJjNzSVk/T
 zN6eDTzpLcr+51HF6SNUCz7wuZD6WhAnFno4x6vUm8X5YCzUQK77v6dnsXk6RxaxjBar
 Cq0G8r545EAt0C7R3LQv+qbjK4hgcOk3dVQmcoAbuu14nsCioqfO57N1XwXAG31O4Sa9
 ynIo3aCfmO6RhTDHiGjdnL7gLUnYzQO2Ob2C9zSePFj3DYYFu8QfkPcNVufaKS6rKtRl
 eTSeSxgTi0TgtpKbj7HKYaAZ86irwke11rv+JImZQq/lTcUe3KR4W7ydpXvr/6kyTmd1
 jG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734444410; x=1735049210;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74gRFMianHMsIWZDOBz6aYywOh8vp8qmdUQzHnxSF2o=;
 b=nlpUEevtgPA6asqzY230AIWSL1JGLBX87GJn0qN4c+2CuufCr9xEtK7sff0TC2zSCy
 lai2cv5B0sp/oH0gT08TcrRGqksbO6pZZoF/VcN/SoOKhfwafyJgzg6J3EsJmC/UzHO3
 FcQaqsmSJKqxAokrnERM6NQ67usPMn5YS84qD9eZI/0Q4R97SmqmSfDw2LvXy2fyAL24
 4Up9d/KdtHUbnmAWj6gTDyNCJfUFlooiJL2AcGhhFmdKnjBVoX0Lka08MiOyGFCUhcm3
 OtM34pOErxc5Yt5Zj8o3ipy/plLfZIfad0VYDYoKrCgNVe1UNkfcwqekRElrw2+3QAq3
 /x2A==
X-Gm-Message-State: AOJu0YyQ0aGg6X2bmx5qF2DhSFMtHF4naNb26E3HhO8DZce5/5rXhCBE
 x9ufrwBAQ+0JWE4A9VltuZKQotS1TIlLE8BNvQFi0nyKfbVrfTNKbKL18M7iFWk=
X-Gm-Gg: ASbGncsZUxdVehDk9snxNRth3inSvHTAegTtietXIvHJs9j8zAp/BMmSblYUVGNAMOu
 bNyvRxv6K+mLJ3TZGRhqCW+4SAssZDdCr+ycaZqAgrzR64w6PLHc1BoZoTxcuGrvyr7JNxckt2Z
 irtLWQuwcM4VRQXwWSaMWhTnZydcmo9MHBBfz2PlF8Z5AjVX8dG/Im4Nkrm7V6eRFZHwZ1yrzlB
 Ohyyt/065+NHHCvAShu3bAu8WvNyvUiRYgQmdvCzqGQI8/iCGqOHQcVkh42NisF2lvmDPWtTXsM
 Yppw
X-Received: by 2002:a05:600c:6549:b0:434:f0df:9fd with SMTP id
 5b1f17b1804b1-4362aa1b061mr185727495e9.2.1734444409806; 
 Tue, 17 Dec 2024 06:06:49 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4363606f030sm118380655e9.26.2024.12.17.06.06.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Dec 2024 06:06:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] accel/tcg: Declare cpu_loop_exit_requested() in
 'exec/cpu-common.h'
Date: Tue, 17 Dec 2024 15:06:48 +0100
Message-ID: <20241217140648.98538-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kkyrasLfB5Yq

Move cpu_loop_exit_requested() declaration to "exec/cpu-common.h",
along with the related cpu_loop_exit_noexc(), cpu_loop_exit(),
cpu_loop_exit_atomic() and cpu_loop_exit_restore() methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20241212185341.2857-19-philmd@linaro.org>
---
 include/exec/cpu-common.h     | 18 ++++++++++++++++++
 include/exec/exec-all.h       | 17 -----------------
 accel/tcg/cpu-exec.c          |  2 +-
 target/arm/tcg/helper-a64.c   |  1 +
 target/s390x/tcg/mem_helper.c |  1 +
 5 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 638dc806a5f..0cf9a3d369c 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -186,6 +186,7 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 void list_cpus(void);
 
 #ifdef CONFIG_TCG
+#include "qemu/atomic.h"
 
 bool tcg_cflags_has(CPUState *cpu, uint32_t flags);
 void tcg_cflags_set(CPUState *cpu, uint32_t flags);
@@ -218,6 +219,23 @@ bool cpu_unwind_state_data(CPUState *cpu, uintptr_t host_pc, uint64_t *data);
  */
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc);
 
+/**
+ * cpu_loop_exit_requested:
+ * @cpu: The CPU state to be tested
+ *
+ * Indicate if somebody asked for a return of the CPU to the main loop
+ * (e.g., via cpu_exit() or cpu_interrupt()).
+ *
+ * This is helpful for architectures that support interruptible
+ * instructions. After writing back all state to registers/memory, this
+ * call can be used to check if it makes sense to return to the main loop
+ * or to continue executing the interruptible instruction.
+ */
+static inline bool cpu_loop_exit_requested(CPUState *cpu)
+{
+    return (int32_t)qatomic_read(&cpu->neg.icount_decr.u32) < 0;
+}
+
 G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
 G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
 #endif /* CONFIG_TCG */
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index c4a6ad3af2d..d9045c9ac4c 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -27,23 +27,6 @@
 #include "exec/mmu-access-type.h"
 #include "exec/translation-block.h"
 
-/**
- * cpu_loop_exit_requested:
- * @cpu: The CPU state to be tested
- *
- * Indicate if somebody asked for a return of the CPU to the main loop
- * (e.g., via cpu_exit() or cpu_interrupt()).
- *
- * This is helpful for architectures that support interruptible
- * instructions. After writing back all state to registers/memory, this
- * call can be used to check if it makes sense to return to the main loop
- * or to continue executing the interruptible instruction.
- */
-static inline bool cpu_loop_exit_requested(CPUState *cpu)
-{
-    return (int32_t)qatomic_read(&cpu->neg.icount_decr.u32) < 0;
-}
-
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /* cputlb.c */
 /**
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e9eaab223f9..c07e59cd0b1 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -25,7 +25,7 @@
 #include "hw/core/tcg-cpu-ops.h"
 #include "trace.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
+#include "exec/cpu-common.h"
 #include "exec/page-protection.h"
 #include "tcg/tcg.h"
 #include "qemu/atomic.h"
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 58eaca66012..95e46071cab 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -29,6 +29,7 @@
 #include "internals.h"
 #include "qemu/crc32c.h"
 #include "exec/exec-all.h"
+#include "exec/cpu-common.h"
 #include "exec/cpu_ldst.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 307388e5bd1..b617f78204f 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -25,6 +25,7 @@
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/cpu-common.h"
 #include "exec/page-protection.h"
 #include "exec/cpu_ldst.h"
 #include "hw/core/tcg-cpu-ops.h"
-- 
2.45.2

