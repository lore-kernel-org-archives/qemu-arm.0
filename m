Received: by 10.25.27.66 with SMTP id b63csp799042lfb;
        Sat, 4 Jun 2016 11:16:21 -0700 (PDT)
X-Received: by 10.141.28.204 with SMTP id f195mr9002018qhe.97.1465064178449;
        Sat, 04 Jun 2016 11:16:18 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p77si7112773qhb.125.2016.06.04.11.16.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jun 2016 11:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98C8163E1F;
	Sat,  4 Jun 2016 18:16:17 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u54IG9ns008070;
	Sat, 4 Jun 2016 14:16:15 -0400
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, alex.bennee@linaro.org
Cc: christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: [kvm-unit-tests PATCH v2 02/10] arm64: fix get_"sysreg32" and make MPIDR 64bit
Date: Sat,  4 Jun 2016 20:15:57 +0200
Message-Id: <1465064165-14885-3-git-send-email-drjones@redhat.com>
In-Reply-To: <1465064165-14885-1-git-send-email-drjones@redhat.com>
References: <1465064165-14885-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Sat, 04 Jun 2016 18:16:17 +0000 (UTC)
X-TUID: AwZef0+f3cKy

mrs is always 64bit, so we should always use a 64bit register.
Sometimes we'll only want to return the lower 32, but not for
MPIDR, as that does define fields in the upper 32.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 lib/arm64/asm/processor.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
index 84d5c7ce752b0..9a208ff729b7e 100644
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
2.4.11
