Received: by 10.182.158.201 with SMTP id ww9csp119032obb;
        Mon, 16 Nov 2015 06:05:32 -0800 (PST)
X-Received: by 10.28.211.12 with SMTP id k12mr15028142wmg.29.1447682729370;
        Mon, 16 Nov 2015 06:05:29 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id fa15si5362950wjc.132.2015.11.16.06.05.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:05:29 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPL-00013W-TM; Mon, 16 Nov 2015 14:05:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 14/19] target-arm: Implement asidx_from_attrs
Date: Mon, 16 Nov 2015 14:05:18 +0000
Message-Id: <1447682723-3977-15-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 4TRjLDqMEqPb

Implement the asidx_from_attrs CPU method to return the
Secure or NonSecure address space as appropriate.

(The function is inline so we can use it directly in target-arm
code to be added in later patches.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.c | 1 +
 target-arm/cpu.h | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 690d984..32d0b5c 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -1450,6 +1450,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #else
     cc->do_interrupt = arm_cpu_do_interrupt;
     cc->get_phys_page_debug = arm_cpu_get_phys_page_debug;
+    cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_is_big_endian;
 #endif
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 9108b5b..ee873b7 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1997,4 +1997,12 @@ enum {
     QEMU_PSCI_CONDUIT_HVC = 2,
 };
 
+#ifndef CONFIG_USER_ONLY
+/* Return the address space index to use for a memory access */
+static inline int arm_asidx_from_attrs(CPUState *cs, MemTxAttrs attrs)
+{
+    return attrs.secure ? ARMASIdx_S : ARMASIdx_NS;
+}
+#endif
+
 #endif
-- 
1.9.1
