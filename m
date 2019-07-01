Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653328wru;
        Mon, 1 Jul 2019 06:26:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLHo+CakKiBU6CnNaKxd8TzuugCRTVnn1KFnYOGukFImknIE5Y8ZVXRy6sWmVSYhN7BRVk
X-Received: by 2002:ac8:285c:: with SMTP id 28mr21028126qtr.186.1561987572449;
        Mon, 01 Jul 2019 06:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987572; cv=none;
        d=google.com; s=arc-20160816;
        b=FjwCbtS1m/c3BNl8MvE3ygqAdepL1H+9tq0uzEoXVt+r+iNQbyTdFoxiPLc5nw6hWa
         eaM/tPMPbz+dk7+N7ewEviqDb+1aIazYOaRQkRxUMDCNQ3EIYz/dPg1qcmZEOjsEK33t
         IoxDE30+gEWmX+vKuywcEJpnzADecu3WzQoFxDtEu4AyUxeRbaH61r02IuAaiPg3bXcs
         xJPv8R/VIWl0fF5FKc2ZY6y8S6SzGc1ZKlBUl3QzDWJszwKeNbpFRKJ89UythdxojqAJ
         ZhgpkpsYtmCOWGZp3cXird8XmkCo7hkfruEygBFT50+FHsvUyneKyN6ASlLvPXA+lM4Z
         q9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=uoSEU1Mr3KHyVlfmUicDatYmHhk0jhU4DwXD6Lhye6g=;
        b=Q2fMV+K77Sl5wtxJ7/5kHu5F7dDsrYQKs8kf4xuK7ol+ru8d3qVPZA3GBWAjhzn/p/
         KXoFOuSunuR31I/nh5ScwlU4xFvQLBiBUJb4myv4/HAbtoGgywr32fyEQUDwUnwP2s2M
         iDoWH1fFI9wpDa7KQuuUWOoJwFuYnZpuz1yoOrw28nrbJZ1ffr2JZeARUQBRISQ6rDW4
         kYks2IgSpN7rKZDSH2YutVvmnnEPe0WzyK4pKFbaf7qri73iF9Rmghnu9nzmOQKRWilb
         HBNXgnE23DQracenkCv0lhm4wVYfT/PifR0qtYWl3znlVu9JLr1Bq05DdY8K5lZ5YLJ6
         6Y2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 46si7858660qtw.234.2019.07.01.06.26.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F3E5356D2;
	Mon,  1 Jul 2019 13:26:11 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C21986085B;
	Mon,  1 Jul 2019 13:26:08 +0000 (UTC)
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
Subject: [PATCH v3 11/27] target/arm: Declare get_phys_addr() function publicly
Date: Mon,  1 Jul 2019 15:25:00 +0200
Message-Id: <20190701132516.26392-12-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 01 Jul 2019 13:26:11 +0000 (UTC)
X-TUID: Tt3/tayQAAYT

In the next commit we will split the TLB related routines of
this file, and this function will also be called in the new
file. Declare it in the "internals.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/helper.c    | 21 +++++----------------
 target/arm/internals.h | 16 ++++++++++++++++
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a87fda9191..063f4778e0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -33,17 +33,6 @@
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
 #ifndef CONFIG_USER_ONLY
-/* Cacheability and shareability attributes for a memory access */
-typedef struct ARMCacheAttrs {
-    unsigned int attrs:8; /* as in the MAIR register encoding */
-    unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
-} ARMCacheAttrs;
-
-static bool get_phys_addr(CPUARMState *env, target_ulong address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                          target_ulong *page_size,
-                          ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
 
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
@@ -12639,11 +12628,11 @@ static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
  * @fi: set to fault info if the translation fails
  * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
-static bool get_phys_addr(CPUARMState *env, target_ulong address,
-                          MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                          hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                          target_ulong *page_size,
-                          ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
+bool get_phys_addr(CPUARMState *env, target_ulong address,
+                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
+                   target_ulong *page_size,
+                   ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
         /* Call ourselves recursively to do the stage 1 and then stage 2
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5a02f458f3..ff5ab0328e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -985,4 +985,20 @@ static inline int exception_target_el(CPUARMState *env)
     return target_el;
 }
 
+#ifndef CONFIG_USER_ONLY
+
+/* Cacheability and shareability attributes for a memory access */
+typedef struct ARMCacheAttrs {
+    unsigned int attrs:8; /* as in the MAIR register encoding */
+    unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
+} ARMCacheAttrs;
+
+bool get_phys_addr(CPUARMState *env, target_ulong address,
+                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
+                   target_ulong *page_size,
+                   ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
+
+#endif /* !CONFIG_USER_ONLY */
+
 #endif
-- 
2.20.1
