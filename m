Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2823907ejb;
        Tue, 28 Mar 2023 10:31:27 -0700 (PDT)
X-Received: by 2002:a5d:4ec9:0:b0:2c3:f79a:7319 with SMTP id s9-20020a5d4ec9000000b002c3f79a7319mr11890247wrv.17.1680024687334;
        Tue, 28 Mar 2023 10:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680024687; cv=none;
        d=google.com; s=arc-20160816;
        b=F/uQFtuhzthfnhqL4TPDtCLI7QfSQL/p7kWO7As6Wgpz/y0jU4BaDdB06OPRi2YVWM
         51ilAXYJWwAIgAyhf7bSeeRfrWoitWLetdfLe5T8iQYmc1UomRP530zhXqa4JuDjg/gd
         MPaB5hVtAfYBACYp52YHSo04P+VMAwke6DYdCRYaBeug0iWpoOtkC7sLYi+ztnmgxTWd
         YbzK1y+njL+K5kXTfDUeRek2J/aBfm0uc2z/L8kqpsKXaBvk1CuiMqdPfh7vYFziXg2Z
         LUKZt9GHIxvJ105+JO88v1niVHVFUYmHAnLWcJVW5M0skVqSgM42HEP4BzCyd3b8W3JD
         I13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gqrAcdahU7oRsjBb/8pSIcN5O6oYYEmsOBvgu0vyrxs=;
        b=D6GVPoxbadpkCVVmNkW3nMrQYcbrRXbG3jeEBdx+YymUPMlyEPaJa7pS+9BD2RmULi
         VHFJ8f+7/i2i1VEfCisnQWkrveuQh2PCb5804ENJZbTi+/4Wr85GZ5nZ+gHeTWvDDOzu
         sbqZirAjjsYASzwDBpgxBe3EqB+scTaTAYPVghZW7jdANWOXJQ6PtyCVKYejEB/mHq0g
         0XGqYEAFj7PhGlE8/DpI83Il4LdURi5Ii/jTZb4istMfoBGEgKjUk9NmZBMBk19l+FGU
         PMuB4e4Gqne53o+O6QjGU1zHWkD9zURYr2PVBPVIuPj9itsfnx2gaBJwSwCCyEHzX2pm
         ViGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SABEbYWv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p9-20020a5d4e09000000b002c7084e4085sor12805306wrt.29.2023.03.28.10.31.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 10:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SABEbYWv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680024687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqrAcdahU7oRsjBb/8pSIcN5O6oYYEmsOBvgu0vyrxs=;
        b=SABEbYWvAsqCtIuHHVJMPwwDiNUufQXexHxLxY5o5DWRxqkTyuYgXpiHdWCj8XbOsQ
         g2U4QrLITKjxpOl8htTloTznG9fy4SiSh9z2u7MZvSPDZ05sjPP2DcRASJ/ECcuk/hTn
         FanhhBJqgl+fd+AuRqtPXRNm/2RDJVxjbtBaDeUrxzPG/rYs0uzXUcPL0l3BwMp4iHxL
         un7gprTCArYbizF2Bh7zO4P+Mo0WIv3AKHLAkD5T3pWKM5VOrrSO/foqJH0NKcYwMMQ+
         RPLT/Zs7KI6Mup3we0uqbNOsD9fpV0CoT3pP/tXfgF38zGe/IQGujvU4QM0ptEM3Gj4w
         M1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680024687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gqrAcdahU7oRsjBb/8pSIcN5O6oYYEmsOBvgu0vyrxs=;
        b=64g0QyJ+VQJ1fe4rOM34sjEC7FGViR7jAWKOqMXQndxtb6RkV6+2oV1g2eG9VwgNuF
         PJBq/lV7tKaMfXLBLe1rWm1uncdpdGVzxuGuH3d1MktsZJJkFi72r6iXZJZrUOIURill
         m8+a1mvl0wjCU74/LLB0NtbGnxZ5J3aJtO0xb6jK5H4EX7KfDNWKOrnI2BQSNCbasr0B
         5nDG7maOyexKdknsycQ95JU/mndW+Oucn8lSt03HQonmlngc6fOB3a7IJiBaTRIJHJPz
         6ajSQvvVo84s3F/4BvjS1iqm4cpM5NPYn6zg4CGoph6ELrFIdbQUvGLvEUfMVTAvd38X
         bGvQ==
X-Gm-Message-State: AAQBX9f5DMmJvK+eolPscHoWfaNLfGD1o/NUDtuxIDl/rz/mpBM6D97i
	XonuO414VXNHu7ILUFaSM7qYWUG2
X-Google-Smtp-Source: AKy350YyHIiHFGR/fosZehCehPprHQcYz9ExSJFnhRvDxg2q1jv8aGhbEv8NbrMth/+Kl/XfLcZayg==
X-Received: by 2002:a5d:6381:0:b0:2d1:9b6b:92a with SMTP id p1-20020a5d6381000000b002d19b6b092amr12727581wru.23.1680024687011;
        Tue, 28 Mar 2023 10:31:27 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id t13-20020adfe10d000000b002db1b66ea8fsm14670416wrz.57.2023.03.28.10.31.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 10:31:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-ppc@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	kvm@vger.kernel.org,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH-for-8.0 v2 1/3] softmmu: Restrict cpu_check_watchpoint / address_matches to TCG accel
Date: Tue, 28 Mar 2023 19:31:15 +0200
Message-Id: <20230328173117.15226-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328173117.15226-1-philmd@linaro.org>
References: <20230328173117.15226-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FoXh3QhBEm9d

Both cpu_check_watchpoint() and cpu_watchpoint_address_matches()
are specific to TCG system emulation. Declare them in "tcg-cpu-ops.h"
to be sure accessing them from non-TCG code is a compilation error.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h         | 37 ------------------------------
 include/hw/core/tcg-cpu-ops.h | 43 +++++++++++++++++++++++++++++++++++
 target/arm/tcg/mte_helper.c   |  1 +
 target/arm/tcg/sve_helper.c   |  1 +
 target/s390x/tcg/mem_helper.c |  1 +
 5 files changed, 46 insertions(+), 37 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 821e937020..ce312745d5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -970,17 +970,6 @@ static inline void cpu_watchpoint_remove_by_ref(CPUState *cpu,
 static inline void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
 {
 }
-
-static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                                        MemTxAttrs atr, int fl, uintptr_t ra)
-{
-}
-
-static inline int cpu_watchpoint_address_matches(CPUState *cpu,
-                                                 vaddr addr, vaddr len)
-{
-    return 0;
-}
 #else
 int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                           int flags, CPUWatchpoint **watchpoint);
@@ -988,32 +977,6 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
                           vaddr len, int flags);
 void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
 void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
-
-/**
- * cpu_check_watchpoint:
- * @cpu: cpu context
- * @addr: guest virtual address
- * @len: access length
- * @attrs: memory access attributes
- * @flags: watchpoint access type
- * @ra: unwind return address
- *
- * Check for a watchpoint hit in [addr, addr+len) of the type
- * specified by @flags.  Exit via exception with a hit.
- */
-void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                          MemTxAttrs attrs, int flags, uintptr_t ra);
-
-/**
- * cpu_watchpoint_address_matches:
- * @cpu: cpu context
- * @addr: guest virtual address
- * @len: access length
- *
- * Return the watchpoint flags that apply to [addr, addr+len).
- * If no watchpoint is registered for the range, the result is 0.
- */
-int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
 #endif
 
 /**
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 20e3c0ffbb..0ae08df47e 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -175,4 +175,47 @@ struct TCGCPUOps {
 
 };
 
+#if defined(CONFIG_USER_ONLY)
+
+static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                                        MemTxAttrs atr, int fl, uintptr_t ra)
+{
+}
+
+static inline int cpu_watchpoint_address_matches(CPUState *cpu,
+                                                 vaddr addr, vaddr len)
+{
+    return 0;
+}
+
+#else
+
+/**
+ * cpu_check_watchpoint:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ * @attrs: memory access attributes
+ * @flags: watchpoint access type
+ * @ra: unwind return address
+ *
+ * Check for a watchpoint hit in [addr, addr+len) of the type
+ * specified by @flags.  Exit via exception with a hit.
+ */
+void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                          MemTxAttrs attrs, int flags, uintptr_t ra);
+
+/**
+ * cpu_watchpoint_address_matches:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ *
+ * Return the watchpoint flags that apply to [addr, addr+len).
+ * If no watchpoint is registered for the range, the result is 0.
+ */
+int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
+
+#endif
+
 #endif /* TCG_CPU_OPS_H */
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index fee3c7eb96..a4f3f92bc0 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -25,6 +25,7 @@
 #include "exec/ram_addr.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 9a8951afa4..ccf5e5beca 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -27,6 +27,7 @@
 #include "tcg/tcg.h"
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
+#include "hw/core/tcg-cpu-ops.h"
 
 
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index b93dbd3dad..8b58b8d88d 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -26,6 +26,7 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
 #include "trace.h"
-- 
2.38.1
