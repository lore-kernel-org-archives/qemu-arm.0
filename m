Received: by 10.25.150.194 with SMTP id y185csp1205003lfd;
        Mon, 14 Nov 2016 13:08:51 -0800 (PST)
X-Received: by 10.200.43.120 with SMTP id 53mr7806696qtv.253.1479157731309;
        Mon, 14 Nov 2016 13:08:51 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 133si16321165qkf.329.2016.11.14.13.08.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Nov 2016 13:08:51 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D357AC05AA71;
	Mon, 14 Nov 2016 21:08:49 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uAEL8fjV014878;
	Mon, 14 Nov 2016 16:08:47 -0500
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: pbonzini@redhat.com, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com,
        christoffer.dall@linaro.org
Subject: [kvm-unit-tests PATCH v6 02/11] arm64: fix get_"sysreg32" and make MPIDR 64bit
Date: Mon, 14 Nov 2016 22:08:30 +0100
Message-Id: <1479157719-31021-3-git-send-email-drjones@redhat.com>
In-Reply-To: <1479157719-31021-1-git-send-email-drjones@redhat.com>
References: <1479157719-31021-1-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 14 Nov 2016 21:08:49 +0000 (UTC)
X-TUID: lRxOC7kvI8lL

mrs is always 64bit, so we should always use a 64bit register.
Sometimes we'll only want to return the lower 32, but not for
MPIDR, as that does define fields in the upper 32.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>

---
v5: switch arm32's get_mpidr to 'unsigned long' too, to be
    consistent with arm64 [Andre]
---
 lib/arm/asm/processor.h   |  4 ++--
 lib/arm64/asm/processor.h | 15 +++++++++------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
index f25e7eee3666..02f912f99974 100644
--- a/lib/arm/asm/processor.h
+++ b/lib/arm/asm/processor.h
@@ -33,9 +33,9 @@ static inline unsigned long current_cpsr(void)
 
 #define current_mode() (current_cpsr() & MODE_MASK)
 
-static inline unsigned int get_mpidr(void)
+static inline unsigned long get_mpidr(void)
 {
-	unsigned int mpidr;
+	unsigned long mpidr;
 	asm volatile("mrc p15, 0, %0, c0, c0, 5" : "=r" (mpidr));
 	return mpidr;
 }
diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
index 84d5c7ce752b..9a208ff729b7 100644
--- a/lib/arm64/asm/processor.h
+++ b/lib/arm64/asm/processor.h
@@ -66,14 +66,17 @@ static inline unsigned long current_level(void)
 	return el & 0xc;
 }
 
-#define DEFINE_GET_SYSREG32(reg)				\
-static inline unsigned int get_##reg(void)			\
+#define DEFINE_GET_SYSREG(reg, type)				\
+static inline type get_##reg(void)				\
 {								\
-	unsigned int reg;					\
-	asm volatile("mrs %0, " #reg "_el1" : "=r" (reg));	\
-	return reg;						\
+	unsigned long r;					\
+	asm volatile("mrs %0, " #reg "_el1" : "=r" (r));	\
+	return (type)r;						\
 }
-DEFINE_GET_SYSREG32(mpidr)
+#define DEFINE_GET_SYSREG32(reg) DEFINE_GET_SYSREG(reg, unsigned int)
+#define DEFINE_GET_SYSREG64(reg) DEFINE_GET_SYSREG(reg, unsigned long)
+
+DEFINE_GET_SYSREG64(mpidr)
 
 /* Only support Aff0 for now, gicv2 only */
 #define mpidr_to_cpu(mpidr) ((int)((mpidr) & 0xff))
-- 
2.7.4
