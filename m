Received: by 10.25.150.194 with SMTP id y185csp875797lfd;
        Thu, 10 Nov 2016 08:08:20 -0800 (PST)
X-Received: by 10.37.108.8 with SMTP id h8mr6148273ybc.77.1478794100629;
        Thu, 10 Nov 2016 08:08:20 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id x126si1469946ywb.245.2016.11.10.08.08.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 08:08:20 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 854C28F4F7;
	Thu, 10 Nov 2016 16:08:19 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uAAG86np023413;
	Thu, 10 Nov 2016 11:08:17 -0500
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: pbonzini@redhat.com, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com,
        christoffer.dall@linaro.org
Subject: [kvm-unit-tests PATCH v4 04/11] arm/arm64: add some delay routines
Date: Thu, 10 Nov 2016 17:07:57 +0100
Message-Id: <1478794084-5273-5-git-send-email-drjones@redhat.com>
In-Reply-To: <1478794084-5273-1-git-send-email-drjones@redhat.com>
References: <1478794084-5273-1-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 10 Nov 2016 16:08:19 +0000 (UTC)
X-TUID: XTO9Z0cwBE9u

Allow a thread to wait some specified amount of time. Can
specify in cycles, usecs, and msecs.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 lib/arm/asm/processor.h   | 19 +++++++++++++++++++
 lib/arm/processor.c       | 15 +++++++++++++++
 lib/arm64/asm/processor.h | 19 +++++++++++++++++++
 lib/arm64/processor.c     | 15 +++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
index d2048f5f5f7e..afc903ca7d4a 100644
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
index 54fdb87ef019..c2ee360df688 100644
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
index 7e448dc81a6a..94f7ce35b65c 100644
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
index deeab4ec9c8a..50fa835c6f1e 100644
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
2.7.4
