Received: by 10.25.159.131 with SMTP id i125csp971755lfe;
        Thu, 8 Dec 2016 09:50:39 -0800 (PST)
X-Received: by 10.55.151.199 with SMTP id z190mr71364312qkd.166.1481219438939;
        Thu, 08 Dec 2016 09:50:38 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t67si747573qkd.222.2016.12.08.09.50.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Dec 2016 09:50:38 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE3EEC0528A4;
	Thu,  8 Dec 2016 17:50:37 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB8HoWn2022068;
	Thu, 8 Dec 2016 12:50:35 -0500
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, marc.zyngier@arm.com, andre.przywara@arm.com,
        eric.auger@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org
Subject: [PATCH kvm-unit-tests v8 01/10] arm/arm64: yield on cpu_relax
Date: Thu,  8 Dec 2016 18:50:21 +0100
Message-Id: <20161208175030.12269-2-drjones@redhat.com>
In-Reply-To: <20161208175030.12269-1-drjones@redhat.com>
References: <20161208175030.12269-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 08 Dec 2016 17:50:37 +0000 (UTC)
X-TUID: FvTCAikG31+d

In many tests one or more cpus wait for events from other cpus. However,
with TCG, if the event triggering cpus then continue without first
informing TCG it should schedule other cpus, then those other cpus may
never get scheduled, and never see their events. This is because the
TCG scheduler relies on either the currently running cpu to invoke an
instruction that results in scheduling or for some I/O event to occur,
and then to do scheduling while handling the I/O. kvm-unit-tests do not
have external I/O events, so we must invoke a yielding instruction
wherever needed. cpu_relax() is almost always a place it's needed.

While this change is mostly for TCG, it's fine to do for KVM as well.
The Linux kernel made the same change with 1baa82f4803 for armv8. As
the yield instruction is also available on armv7, we make the change
for both.

Signed-off-by: Andrew Jones <drjones@redhat.com>

---

v8: new patch that drastically speeds up the tests with tcg,
    actually allowing it to complete at all after adding
    -nodefaults to the qemu command line...
---
 lib/arm/asm/barrier.h   | 5 +++--
 lib/arm64/asm/barrier.h | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/arm/asm/barrier.h b/lib/arm/asm/barrier.h
index 394a4a2da26f..927cd3801dfb 100644
--- a/lib/arm/asm/barrier.h
+++ b/lib/arm/asm/barrier.h
@@ -1,13 +1,14 @@
 #ifndef _ASMARM_BARRIER_H_
 #define _ASMARM_BARRIER_H_
 /*
- * Adapted form arch/arm/include/asm/barrier.h
+ * Adapted from arch/arm/include/asm/barrier.h
  */
 
 #define sev()		asm volatile("sev" : : : "memory")
 #define wfe()		asm volatile("wfe" : : : "memory")
 #define wfi()		asm volatile("wfi" : : : "memory")
-#define cpu_relax()	asm volatile(""    : : : "memory")
+#define yield()		asm volatile("yield" : : : "memory")
+#define cpu_relax()	yield()
 
 #define isb(option) __asm__ __volatile__ ("isb " #option : : : "memory")
 #define dsb(option) __asm__ __volatile__ ("dsb " #option : : : "memory")
diff --git a/lib/arm64/asm/barrier.h b/lib/arm64/asm/barrier.h
index dbdac9d339c7..4f7bb97c2279 100644
--- a/lib/arm64/asm/barrier.h
+++ b/lib/arm64/asm/barrier.h
@@ -7,7 +7,8 @@
 #define sev()		asm volatile("sev" : : : "memory")
 #define wfe()		asm volatile("wfe" : : : "memory")
 #define wfi()		asm volatile("wfi" : : : "memory")
-#define cpu_relax()	asm volatile(""    : : : "memory")
+#define yield()		asm volatile("yield" : : : "memory")
+#define cpu_relax()	yield()
 
 #define isb()		asm volatile("isb" : : : "memory")
 #define dmb(opt)	asm volatile("dmb " #opt : : : "memory")
-- 
2.9.3
