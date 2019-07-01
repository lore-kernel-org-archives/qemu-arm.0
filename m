Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2654010wru;
        Mon, 1 Jul 2019 06:26:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrCLZjV80/xd6tvdCFm7Iv5muL2VT4BrY6MGpIKPu8La4/7Q3wU4DV4MTpgTjwwKxX3sEW
X-Received: by 2002:aed:24d9:: with SMTP id u25mr20761846qtc.111.1561987611474;
        Mon, 01 Jul 2019 06:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987611; cv=none;
        d=google.com; s=arc-20160816;
        b=sYPM8nXFxDAO25+pNYVOcT8xgJm/plL0vKFPKr4Odlwso39Q8wx8TxA14HmEW8Nw4j
         OsOe31tNT/zk4lhtuu3HqHcxnSQ/aihVKMTv5vuiD7ThrHVY0w2U87GYt0sJDXAnOIqT
         dVB5ekaRliD3lTaGBZChIIfFeU2dNUCjh+98z2jFwh/znxU/I7IavigAEhEycay/+v/w
         riguIfKHu8L3sdFat51gfGTi/JSxi2KOjEeHgHRT/2fWoyCXH72XSS6jHiMmtk8oGHs3
         kDZ1rPO8ywiRAbhcRaGKzq282UoRmEfiQiJoqHgAyqXe+oVsxm5+QEDvx97LS7kc3dK7
         fPtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=aO0OQfRyFNC3MT6GDwOu7qcPg1Oy3jrBzlG8KFrsjJA=;
        b=rj4jNzVb9ERteb5v6Y6w/kTYWtEoG4QnXHbtaor+nu6uX1qqs/ud4xUVqz+mGOVnej
         09u1kni++124n1GVGTMvgDQgQ4QoZMa9HqKqBND3KU4FtHm+CIcSpccdFSv5LZTB2f8b
         X8/jfTGinnY96+1lWF8TBmlbkfXmBN9JEDA23hBDiOiQpGZngnrYLafDQye21AWYPUr6
         NtPwLgC0/n26skPZM0gyxbBi6ueCMDIMpMqKRKFarTgMsEiTM0yBHg7ah7ecyUGVRAjd
         5BUcTYkCSZ+QGX/eYUXIOKwaogu1XHKp6Nbxak+xeNy2qc3ewOpATO+cjP2ljLXoPfPz
         jdhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d22si7207453qtq.311.2019.07.01.06.26.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 957D830842D1;
	Mon,  1 Jul 2019 13:26:50 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD1486085B;
	Mon,  1 Jul 2019 13:26:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 21/27] target/arm: Declare some M-profile functions publicly
Date: Mon,  1 Jul 2019 15:25:10 +0200
Message-Id: <20190701132516.26392-22-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 01 Jul 2019 13:26:50 +0000 (UTC)
X-TUID: dRUK8d4aB9cK

In the next commit we will split the M-profile functions from this
file. Some function will be called out of helper.c. Declare them in
the "internals.h" header.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Was v7-only, add v8
---
 target/arm/helper.c    | 38 ++------------------------------------
 target/arm/internals.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 36 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 515a82af57..4e59ae4d96 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -41,21 +41,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr,
                                ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
-
-/* Security attributes for an address, as returned by v8m_security_lookup. */
-typedef struct V8M_SAttributes {
-    bool subpage; /* true if these attrs don't cover the whole TARGET_PAGE */
-    bool ns;
-    bool nsc;
-    uint8_t sregion;
-    bool srvalid;
-    uint8_t iregion;
-    bool irvalid;
-} V8M_SAttributes;
-
-static void v8m_security_lookup(CPUARMState *env, uint32_t address,
-                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                V8M_SAttributes *sattrs);
 #endif
 
 static void switch_mode(CPUARMState *env, int mode);
@@ -7735,25 +7720,6 @@ void arm_log_exception(int idx)
     }
 }
 
-/*
- * Return true if the v7M CPACR permits access to the FPU for the specified
- * security state and privilege level.
- */
-static bool v7m_cpacr_pass(CPUARMState *env, bool is_secure, bool is_priv)
-{
-    switch (extract32(env->v7m.cpacr[is_secure], 20, 2)) {
-    case 0:
-    case 2: /* UNPREDICTABLE: we treat like 0 */
-        return false;
-    case 1:
-        return is_priv;
-    case 3:
-        return true;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 /*
  * What kind of stack write are we doing? This affects how exceptions
  * generated during the stacking are treated.
@@ -12119,7 +12085,7 @@ static bool v8m_is_sau_exempt(CPUARMState *env,
         (address >= 0xe00ff000 && address <= 0xe00fffff);
 }
 
-static void v8m_security_lookup(CPUARMState *env, uint32_t address,
+void v8m_security_lookup(CPUARMState *env, uint32_t address,
                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                 V8M_SAttributes *sattrs)
 {
@@ -12226,7 +12192,7 @@ static void v8m_security_lookup(CPUARMState *env, uint32_t address,
     }
 }
 
-static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
+bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
                               hwaddr *phys_ptr, MemTxAttrs *txattrs,
                               int *prot, bool *is_subpage,
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 11bfdba512..232d963875 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -892,6 +892,27 @@ static inline uint32_t v7m_sp_limit(CPUARMState *env)
     }
 }
 
+/**
+ * v7m_cpacr_pass:
+ * Return true if the v7M CPACR permits access to the FPU for the specified
+ * security state and privilege level.
+ */
+static inline bool v7m_cpacr_pass(CPUARMState *env,
+                                  bool is_secure, bool is_priv)
+{
+    switch (extract32(env->v7m.cpacr[is_secure], 20, 2)) {
+    case 0:
+    case 2: /* UNPREDICTABLE: we treat like 0 */
+        return false;
+    case 1:
+        return is_priv;
+    case 3:
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /**
  * aarch32_mode_name(): Return name of the AArch32 CPU mode
  * @psr: Program Status Register indicating CPU mode
@@ -988,6 +1009,27 @@ static inline int exception_target_el(CPUARMState *env)
 
 #ifndef CONFIG_USER_ONLY
 
+/* Security attributes for an address, as returned by v8m_security_lookup. */
+typedef struct V8M_SAttributes {
+    bool subpage; /* true if these attrs don't cover the whole TARGET_PAGE */
+    bool ns;
+    bool nsc;
+    uint8_t sregion;
+    bool srvalid;
+    uint8_t iregion;
+    bool irvalid;
+} V8M_SAttributes;
+
+void v8m_security_lookup(CPUARMState *env, uint32_t address,
+                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                         V8M_SAttributes *sattrs);
+
+bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
+                       MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                       hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                       int *prot, bool *is_subpage,
+                       ARMMMUFaultInfo *fi, uint32_t *mregion);
+
 /* Cacheability and shareability attributes for a memory access */
 typedef struct ARMCacheAttrs {
     unsigned int attrs:8; /* as in the MAIR register encoding */
-- 
2.20.1
