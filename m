Received: by 10.25.159.131 with SMTP id i125csp971793lfe;
        Thu, 8 Dec 2016 09:50:46 -0800 (PST)
X-Received: by 10.200.47.38 with SMTP id j35mr67689167qta.136.1481219446346;
        Thu, 08 Dec 2016 09:50:46 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d200si17848782qke.121.2016.12.08.09.50.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Dec 2016 09:50:46 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C62161BAB;
	Thu,  8 Dec 2016 17:50:45 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB8HoWn5022068;
	Thu, 8 Dec 2016 12:50:43 -0500
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, marc.zyngier@arm.com, andre.przywara@arm.com,
        eric.auger@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org
Subject: [PATCH kvm-unit-tests v8 04/10] arm/arm64: irq enable/disable
Date: Thu,  8 Dec 2016 18:50:24 +0100
Message-Id: <20161208175030.12269-5-drjones@redhat.com>
In-Reply-To: <20161208175030.12269-1-drjones@redhat.com>
References: <20161208175030.12269-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 08 Dec 2016 17:50:45 +0000 (UTC)
X-TUID: HxbC6Nl5xfvB

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 lib/arm/asm/processor.h   | 10 ++++++++++
 lib/arm64/asm/processor.h | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
index 857bdd96a3cc..6dc1472468dd 100644
--- a/lib/arm/asm/processor.h
+++ b/lib/arm/asm/processor.h
@@ -35,6 +35,16 @@ static inline unsigned long current_cpsr(void)
 
 #define current_mode() (current_cpsr() & MODE_MASK)
 
+static inline void local_irq_enable(void)
+{
+	asm volatile("cpsie i" : : : "memory", "cc");
+}
+
+static inline void local_irq_disable(void)
+{
+	asm volatile("cpsid i" : : : "memory", "cc");
+}
+
 #define MPIDR __ACCESS_CP15(c0, 0, c0, 5)
 static inline unsigned int get_mpidr(void)
 {
diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
index 0898d89f9761..f42f15c79d43 100644
--- a/lib/arm64/asm/processor.h
+++ b/lib/arm64/asm/processor.h
@@ -68,6 +68,16 @@ static inline unsigned long current_level(void)
 	return el & 0xc;
 }
 
+static inline void local_irq_enable(void)
+{
+	asm volatile("msr daifclr, #2" : : : "memory");
+}
+
+static inline void local_irq_disable(void)
+{
+	asm volatile("msr daifset, #2" : : : "memory");
+}
+
 static inline unsigned int get_mpidr(void)
 {
 	return read_sysreg(mpidr_el1);
-- 
2.9.3
