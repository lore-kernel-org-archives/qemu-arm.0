Received: by 10.182.105.169 with SMTP id gn9csp621733obb;
        Thu, 5 Nov 2015 10:21:54 -0800 (PST)
X-Received: by 10.194.47.244 with SMTP id g20mr11535029wjn.124.1446747714465;
        Thu, 05 Nov 2015 10:21:54 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id j6si9539403wjf.167.2015.11.05.10.21.54
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:21:54 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4p-0004kZ-4E; Thu, 05 Nov 2015 18:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 05/16] exec.c: Add cpu_get_address_space()
Date: Thu,  5 Nov 2015 18:15:47 +0000
Message-Id: <1446747358-18214-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: KOJqLIrMQMhj

Add a function to return the AddressSpace for a CPU based on
its numerical index. (Callers outside exec.c don't have access
to the CPUAddressSpace struct so can't just fish it out of the
CPUState struct directly.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c                  | 6 ++++++
 include/exec/exec-all.h | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/exec.c b/exec.c
index 5e78d82..13da780 100644
--- a/exec.c
+++ b/exec.c
@@ -581,6 +581,12 @@ void cpu_address_space_init(CPUState *cpu, AddressSpace *as, int asidx)
         memory_listener_register(&newas->tcg_as_listener, as);
     }
 }
+
+AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
+{
+    /* Return the AddressSpace corresponding to the specified index */
+    return cpu->cpu_ases[asidx].as;
+}
 #endif
 
 #ifndef CONFIG_USER_ONLY
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 5dba8aa..fc05872 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -100,6 +100,15 @@ void cpu_reloading_memory_map(void);
  * Note that with KVM only one address space is supported.
  */
 void cpu_address_space_init(CPUState *cpu, AddressSpace *as, int asidx);
+/**
+ * cpu_get_address_space:
+ * @cpu: CPU to get address space from
+ * @asidx: index identifying which address space to get
+ *
+ * Return the requested address space of this CPU. @asidx
+ * specifies which address space to read.
+ */
+AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);
 /* cputlb.c */
 /**
  * tlb_flush_page:
-- 
1.9.1
