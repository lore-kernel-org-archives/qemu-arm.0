Received: by 10.25.208.137 with SMTP id h131csp1145632lfg;
        Mon, 16 May 2016 00:57:54 -0700 (PDT)
X-Received: by 10.233.221.66 with SMTP id r63mr28765978qkf.87.1463385462187;
        Mon, 16 May 2016 00:57:42 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g140si21778964qhc.123.2016.05.16.00.57.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 May 2016 00:57:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2B52201FA;
	Mon, 16 May 2016 07:57:40 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-204-50.brq.redhat.com [10.40.204.50])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u4G7vPBJ018488;
	Mon, 16 May 2016 03:57:38 -0400
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org
Cc: christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: [kvm-unit-tests PATCH 05/10] arm/arm64: irq enable/disable
Date: Mon, 16 May 2016 09:57:19 +0200
Message-Id: <1463385444-12916-6-git-send-email-drjones@redhat.com>
In-Reply-To: <1463385444-12916-1-git-send-email-drjones@redhat.com>
References: <1463385444-12916-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 16 May 2016 07:57:41 +0000 (UTC)
X-TUID: OR9Eq9Q7Xuj2

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 lib/arm/asm/processor.h   | 10 ++++++++++
 lib/arm64/asm/processor.h | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/lib/arm/asm/processor.h b/lib/arm/asm/processor.h
index afc903ca7d4ab..75a8d08b89330 100644
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
 static inline unsigned int get_mpidr(void)
 {
 	unsigned int mpidr;
diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
index 94f7ce35b65c1..d54a4ed1c1876 100644
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
 #define DEFINE_GET_SYSREG(reg, type)				\
 static inline type get_##reg(void)				\
 {								\
-- 
2.4.11
