Received: by 10.25.159.19 with SMTP id i19csp1802211lfe;
        Thu, 14 Jan 2016 06:18:15 -0800 (PST)
X-Received: by 10.28.158.74 with SMTP id h71mr5059221wme.74.1452781082028;
        Thu, 14 Jan 2016 06:18:02 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id wn4si9957766wjc.13.2016.01.14.06.18.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 06:18:02 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKd-0008UV-GZ; Thu, 14 Jan 2016 13:52:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 08/19] exec.c: Add cpu_get_address_space()
Date: Thu, 14 Jan 2016 13:52:44 +0000
Message-Id: <1452779575-32582-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: IU1QrXAESBVM

Add a function to return the AddressSpace for a CPU based on
its numerical index. (Callers outside exec.c don't have access
to the CPUAddressSpace struct so can't just fish it out of the
CPUState struct directly.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 exec.c                  | 6 ++++++
 include/exec/exec-all.h | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/exec.c b/exec.c
index 5bd3045..cbadca4 100644
--- a/exec.c
+++ b/exec.c
@@ -564,6 +564,12 @@ void cpu_address_space_init(CPUState *cpu, AddressSpace *as, int asidx)
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
index 587736e..05a151d 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -103,6 +103,15 @@ void cpu_reloading_memory_map(void);
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
