Received: by 10.25.208.137 with SMTP id h131csp1145608lfg;
        Mon, 16 May 2016 00:57:48 -0700 (PDT)
X-Received: by 10.140.99.106 with SMTP id p97mr27551407qge.94.1463385459243;
        Mon, 16 May 2016 00:57:39 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id q87si8879317qkq.207.2016.05.16.00.57.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 May 2016 00:57:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56E9D85541;
	Mon, 16 May 2016 07:57:38 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-204-50.brq.redhat.com [10.40.204.50])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u4G7vPBI018488;
	Mon, 16 May 2016 03:57:36 -0400
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org
Cc: christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: [kvm-unit-tests PATCH 04/10] arm/arm64: add some delay routines
Date: Mon, 16 May 2016 09:57:18 +0200
Message-Id: <1463385444-12916-5-git-send-email-drjones@redhat.com>
In-Reply-To: <1463385444-12916-1-git-send-email-drjones@redhat.com>
References: <1463385444-12916-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 16 May 2016 07:57:38 +0000 (UTC)
X-TUID: 3ji6HzKWa6WT

Allow a thread to wait some specified amount of time. Can
specify in cycles, usecs, and msecs.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 lib/arm/asm/processor.h   | 19 +++++++++++++++++++
 lib/arm/processor.c       | 15 +++++++++++++++
 lib/arm64/asm/processor.h | 19 +++++++++++++++++++
 lib/arm64/processor.c     | 15 +++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
index d2048f5f5f7e6..afc903ca7d4ab 100644
--- a/lib/arm/asm/processor.h
+++ b/lib/arm/asm/processor.h
@@ -5,7 +5,9 @@
  *
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
+#include <libcflat.h>
 #include <asm/ptrace.h>
+#include <asm/barrier.h>
 
 enum vector {
 	EXCPTN_RST,
@@ -51,4 +53,21 @@ extern int mpidr_to_cpu(unsigned long mpidr);
 extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
 extern bool is_user(void);
 
+static inline u64 get_cntvct(void)
+{
+	u64 vct;
+	isb();
+	asm volatile("mrrc p15, 1, %Q0, %R0, c14" : "=r" (vct));
+	return vct;
+}
+
+extern void delay(u64 cycles);
+extern void udelay(unsigned long usecs);
+
+static inline void mdelay(unsigned long msecs)
+{
+	while (msecs--)
+		udelay(1000);
+}
+
 #endif /* _ASMARM_PROCESSOR_H_ */
diff --git a/lib/arm/processor.c b/lib/arm/processor.c
index 54fdb87ef0196..c2ee360df6884 100644
--- a/lib/arm/processor.c
+++ b/lib/arm/processor.c
@@ -9,6 +9,7 @@
 #include <asm/ptrace.h>
 #include <asm/processor.h>
 #include <asm/thread_info.h>
+#include <asm/barrier.h>
 
 static const char *processor_modes[] = {
 	"USER_26", "FIQ_26" , "IRQ_26" , "SVC_26" ,
@@ -141,3 +142,17 @@ bool is_user(void)
 {
 	return current_thread_info()->flags & TIF_USER_MODE;
 }
+
+void delay(u64 cycles)
+{
+	u64 start = get_cntvct();
+	while ((get_cntvct() - start) < cycles)
+		cpu_relax();
+}
+
+void udelay(unsigned long usec)
+{
+	unsigned int frq;
+	asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=r" (frq));
+	delay((u64)usec * frq / 1000000);
+}
diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
index 7e448dc81a6aa..94f7ce35b65c1 100644
--- a/lib/arm64/asm/processor.h
+++ b/lib/arm64/asm/processor.h
@@ -17,8 +17,10 @@
 #define SCTLR_EL1_M	(1 << 0)
 
 #ifndef __ASSEMBLY__
+#include <libcflat.h>
 #include <asm/ptrace.h>
 #include <asm/esr.h>
+#include <asm/barrier.h>
 
 enum vector {
 	EL1T_SYNC,
@@ -89,5 +91,22 @@ extern int mpidr_to_cpu(unsigned long mpidr);
 extern void start_usr(void (*func)(void *arg), void *arg, unsigned long sp_usr);
 extern bool is_user(void);
 
+static inline u64 get_cntvct(void)
+{
+	u64 vct;
+	isb();
+	asm volatile("mrs %0, cntvct_el0" : "=r" (vct));
+	return vct;
+}
+
+extern void delay(u64 cycles);
+extern void udelay(unsigned long usecs);
+
+static inline void mdelay(unsigned long msecs)
+{
+	while (msecs--)
+		udelay(1000);
+}
+
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM64_PROCESSOR_H_ */
diff --git a/lib/arm64/processor.c b/lib/arm64/processor.c
index deeab4ec9c8ac..50fa835c6f1e3 100644
--- a/lib/arm64/processor.c
+++ b/lib/arm64/processor.c
@@ -9,6 +9,7 @@
 #include <asm/ptrace.h>
 #include <asm/processor.h>
 #include <asm/thread_info.h>
+#include <asm/barrier.h>
 
 static const char *vector_names[] = {
 	"el1t_sync",
@@ -253,3 +254,17 @@ bool is_user(void)
 {
 	return current_thread_info()->flags & TIF_USER_MODE;
 }
+
+void delay(u64 cycles)
+{
+	u64 start = get_cntvct();
+	while ((get_cntvct() - start) < cycles)
+		cpu_relax();
+}
+
+void udelay(unsigned long usec)
+{
+	unsigned int frq;
+	asm volatile("mrs %0, cntfrq_el0" : "=r" (frq));
+	delay((u64)usec * frq / 1000000);
+}
-- 
2.4.11
