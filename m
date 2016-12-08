Received: by 10.25.159.131 with SMTP id i125csp971780lfe;
        Thu, 8 Dec 2016 09:50:44 -0800 (PST)
X-Received: by 10.237.36.170 with SMTP id t39mr66396608qtc.115.1481219444036;
        Thu, 08 Dec 2016 09:50:44 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c36si17876983qtd.119.2016.12.08.09.50.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Dec 2016 09:50:44 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF8A180514;
	Thu,  8 Dec 2016 17:50:42 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB8HoWn4022068;
	Thu, 8 Dec 2016 12:50:40 -0500
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, marc.zyngier@arm.com, andre.przywara@arm.com,
        eric.auger@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org
Subject: [PATCH kvm-unit-tests v8 03/10] arm/arm64: add some delay routines
Date: Thu,  8 Dec 2016 18:50:23 +0100
Message-Id: <20161208175030.12269-4-drjones@redhat.com>
In-Reply-To: <20161208175030.12269-1-drjones@redhat.com>
References: <20161208175030.12269-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 08 Dec 2016 17:50:43 +0000 (UTC)
X-TUID: FWKlAjvEIfjn

Allow a thread to wait some specified amount of time. Can
specify in cycles, usecs, and msecs.

Signed-off-by: Andrew Jones <drjones@redhat.com>

---
v8: rewrote basing on new sysreg framework. Also decided delay
    functions warrant their own files (delay.[ch])
---
 arm/Makefile.common       |  1 +
 lib/arm/asm/delay.h       | 14 ++++++++++++++
 lib/arm/asm/processor.h   | 15 +++++++++++++++
 lib/arm64/asm/delay.h     |  1 +
 lib/arm64/asm/processor.h | 12 ++++++++++++
 lib/arm/delay.c           | 29 +++++++++++++++++++++++++++++
 6 files changed, 72 insertions(+)
 create mode 100644 lib/arm/asm/delay.h
 create mode 100644 lib/arm64/asm/delay.h
 create mode 100644 lib/arm/delay.c

diff --git a/arm/Makefile.common b/arm/Makefile.common
index b2c0fc8a2fdc..89fe3f69eb44 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -48,6 +48,7 @@ cflatobjs += lib/arm/mmu.o
 cflatobjs += lib/arm/bitops.o
 cflatobjs += lib/arm/psci.o
 cflatobjs += lib/arm/smp.o
+cflatobjs += lib/arm/delay.o
 
 libeabi = lib/arm/libeabi.a
 eabiobjs = lib/arm/eabi_compat.o
diff --git a/lib/arm/asm/delay.h b/lib/arm/asm/delay.h
new file mode 100644
index 000000000000..2436b28c77ae
--- /dev/null
+++ b/lib/arm/asm/delay.h
@@ -0,0 +1,14 @@
+#ifndef _ASMARM_DELAY_H_
+#define _ASMARM_DELAY_H_
+/*
+ * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ */
+#include <libcflat.h>
+
+extern void delay(u64 cycles);
+extern void udelay(unsigned long usecs);
+extern void mdelay(unsigned long msecs);
+
+#endif /* _ASMARM_DELAY_H_ */
diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
index 6b0d36b87817..857bdd96a3cc 100644
--- a/lib/arm/asm/processor.h
+++ b/lib/arm/asm/processor.h
@@ -7,6 +7,7 @@
  */
 #include <asm/ptrace.h>
 #include <asm/sysreg.h>
+#include <asm/barrier.h>
 
 enum vector {
 	EXCPTN_RST,
@@ -51,4 +52,18 @@ extern int mpidr_to_cpu(uint64_t mpidr);
 extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
 extern bool is_user(void);
 
+#define CNTVCT		__ACCESS_CP15_64(1, c14)
+#define CNTFRQ		__ACCESS_CP15(c14, 0, c0, 0)
+
+static inline u64 get_cntvct(void)
+{
+	isb();
+	return read_sysreg(CNTVCT);
+}
+
+static inline u32 get_cntfrq(void)
+{
+	return read_sysreg(CNTFRQ);
+}
+
 #endif /* _ASMARM_PROCESSOR_H_ */
diff --git a/lib/arm64/asm/delay.h b/lib/arm64/asm/delay.h
new file mode 100644
index 000000000000..288e4b3fe610
--- /dev/null
+++ b/lib/arm64/asm/delay.h
@@ -0,0 +1 @@
+#include "../../arm/asm/delay.h"
diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
index 48abf2c9e358..0898d89f9761 100644
--- a/lib/arm64/asm/processor.h
+++ b/lib/arm64/asm/processor.h
@@ -20,6 +20,7 @@
 #include <asm/ptrace.h>
 #include <asm/esr.h>
 #include <asm/sysreg.h>
+#include <asm/barrier.h>
 
 enum vector {
 	EL1T_SYNC,
@@ -83,5 +84,16 @@ extern int mpidr_to_cpu(uint64_t mpidr);
 extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
 extern bool is_user(void);
 
+static inline u64 get_cntvct(void)
+{
+	isb();
+	return read_sysreg(cntvct_el0);
+}
+
+static inline u32 get_cntfrq(void)
+{
+	return read_sysreg(cntfrq_el0);
+}
+
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM64_PROCESSOR_H_ */
diff --git a/lib/arm/delay.c b/lib/arm/delay.c
new file mode 100644
index 000000000000..fa65e2dc9e35
--- /dev/null
+++ b/lib/arm/delay.c
@@ -0,0 +1,29 @@
+/*
+ * Delay loops
+ *
+ * Copyright (C) 2016, Red Hat Inc, Andrew Jones <drjones@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ */
+#include <libcflat.h>
+#include <asm/processor.h>
+#include <asm/barrier.h>
+
+void delay(u64 cycles)
+{
+	u64 start = get_cntvct();
+
+	while ((get_cntvct() - start) < cycles)
+		cpu_relax();
+}
+
+void udelay(unsigned long usec)
+{
+	delay((u64)usec * get_cntfrq() / 1000000);
+}
+
+void mdelay(unsigned long msecs)
+{
+	while (msecs--)
+		udelay(1000);
+}
-- 
2.9.3
