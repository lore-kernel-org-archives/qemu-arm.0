Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1950349wrq;
        Sun, 10 Feb 2019 17:22:44 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbbonQdOrY2W+y4vXflKbqhp7N8ZfaAeufUtVqjvK+kUEMLUngQRHCzXy+J1Cp/KUGh0BWs
X-Received: by 2002:a1c:c008:: with SMTP id q8mr6634156wmf.99.1549848164891;
        Sun, 10 Feb 2019 17:22:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549848164; cv=none;
        d=google.com; s=arc-20160816;
        b=VSvLZ7Gr9u7GQx+Zh15HfPZSktulHJ+gPEzcdieZZ5bUBe903dL+3Exp6tEgJRBp1R
         Q4Z01lAq92xDxktioZPvF5h9UVlGaJ8r+ZkcFa80gvZNxSPl9l5IZib5E6oinqnHQj2P
         HPtNBIYPchZd0R6pFOFHlz4pmMOvpSPgJaef8kaHer+o2Vqx+2xuhjQql3x+eG/u9cs7
         cnLCEwPjVFa5c0F6KuCPfDyldab++sx4yy0Y6f5AWRBe9B49FiBwemGMiV4ApxqkulEf
         vQr3GO643StzeBkX6abvbUkgqS8Q9URAnL7lq86LZoirqwJRFqCIvZ54pUz6hsbzTNhW
         21vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ymaxv9zbXnQNBLMQJfCDWxjmtO7rlV16zaXGdm7o62o=;
        b=r+b6cS+vGWsbr/c4VXVm3kbmkLcUFINgra0NHk99Xf3VV7v+Get3FoXIeSYhIBBYly
         vF8GC68TTbyxNxnsrZpfulQeg2jCbHboxuqAKfNb4pojWNuxavGR4iuxoESWlN5Kq3yy
         +taFhTkI5P5gLU8CHohIjxS5bcz4DLQ2MZldIrZxF29IQwRjcMz3d8Bmypype5Tz9qf1
         oU4DGHhZARqPFzf2cL+ed5o9di1AT/JsI+LBx105Rj10DHabJbm/pVCUxpttik5mH4FE
         UU7kSoP20rEHaXSWaGiUlnGpc5E78IV8r1VqCLndVF0zNOMWiHC/XaZDRINAReheJzOm
         fgHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kNaBYver;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si5716780wru.145.2019.02.10.17.22.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:22:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kNaBYver;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0J1-00080L-RO
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:22:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05u-0005vu-E9
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05s-00007p-7m
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:10 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37845)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05r-0008RW-RE
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:08 -0500
Received: by mail-pl1-x641.google.com with SMTP id b5so4516240plr.4
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ymaxv9zbXnQNBLMQJfCDWxjmtO7rlV16zaXGdm7o62o=;
	b=kNaBYver4RNr8omJ21XVp6ZSme5iGL970KWHu2CoT+glEsMAkV6h5hIRVJ7kbVkM3S
	viIp5DXCvmMY1hIisoEvU7VKw5hYuUtAM14aFV+ws3Fv2C6/3rM0B1GLKSB0wuxEhlrk
	MEM+fCaDhxmyv/5M2WOE4mNa4H1WlbzXpfOtOWagL3Ya5YiYX2dMNfDUWIJ9HOeCB15L
	SWiUDgSdvVZ04ZJtaefPTTv7IMRsy75jOL/YFfe/fhziGTuP1/+RVFlf8CAA9pVNXUy7
	mtXE9jsqsqkkokDUkEHuTUsqu115+UyC8ZdDIomeWJeseAEv7JtAlp7RZoi+poGdHfde
	zsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ymaxv9zbXnQNBLMQJfCDWxjmtO7rlV16zaXGdm7o62o=;
	b=Zjlo1ftI75P2+nhTBr+76n+jMoDIXdVNTprrIMDGxLhjD+V0MYOn2S4F8ic0B84E2a
	BSzril7m91x9cXrCaTZ0h7dRnbZlRUz3039d1CWERlk5zTHJlXKGpSMOUp/rBkH+sm+t
	aeGqzgBV2+y3pQK6z9R2S3X55lbp4NjrA6ibutHwZaaT8jmZxwBeqajdM3WB++y+gIUK
	Fys4fKqEhPCrput5oTcmxhzngYOdTLhthjh5D/tT17m5yK9/E+aUlsv1B2c5NBVNyVEa
	IWtxWGnu+wqqR1G/EJMV/wotIgBLfeWkBHOmqr4wI6rG5/jte7J64glgFrXGYd/MkrNU
	LtqA==
X-Gm-Message-State: AHQUAubZt9nnneEHN6g3NiVZLCuGsxT58x9Vh0HeKo0C4seKvcmLPivf
	RlaDaX4LoMPJf+wedX2fyynlsbvvLKQ=
X-Received: by 2002:a17:902:bd0b:: with SMTP id
	p11mr35123162pls.259.1549847341514; 
	Sun, 10 Feb 2019 17:09:01 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.09.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:09:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:26 -0800
Message-Id: <20190211010829.29869-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-arm] [PATCH v2 23/26] target/arm: Add allocation tag storage
 for user mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6cEzOZ96t1T5

Control this with x-tagged-pages, which is off by default.

The limitation to non-shared pages is not part of a future kernel API,
but a limitation of linux-user not being able to map virtual pages back
to physical pages.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Add the x-tagged-pages cpu property
---
 target/arm/cpu.h        |  1 +
 target/arm/cpu64.c      | 18 ++++++++++++++++++
 target/arm/mte_helper.c | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2626af4a9c..ec5ddfbacc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -910,6 +910,7 @@ struct ARMCPU {
 
 #ifdef CONFIG_USER_ONLY
     bool guarded_pages;
+    bool tagged_pages;
 #endif
 
     QLIST_HEAD(, ARMELChangeHook) pre_el_change_hooks;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c5675fe7d1..53a7d92c95 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -293,6 +293,18 @@ static void aarch64_cpu_set_guarded_pages(Object *obj, bool val, Error **errp)
     ARMCPU *cpu = ARM_CPU(obj);
     cpu->guarded_pages = val;
 }
+
+static bool aarch64_cpu_get_tagged_pages(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    return cpu->tagged_pages;
+}
+
+static void aarch64_cpu_set_tagged_pages(Object *obj, bool val, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    cpu->tagged_pages = val;
+}
 #endif
 
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
@@ -380,6 +392,12 @@ static void aarch64_max_initfn(Object *obj)
                                  aarch64_cpu_set_guarded_pages, NULL);
         object_property_set_description(obj, "x-guarded-pages",
             "Set on/off GuardPage bit for all pages", NULL);
+
+        object_property_add_bool(obj, "x-tagged-pages",
+                                 aarch64_cpu_get_tagged_pages,
+                                 aarch64_cpu_set_tagged_pages, NULL);
+        object_property_set_description(obj, "x-tagged-pages",
+            "Set on/off MemAttr Tagged for all pages", NULL);
 #endif
 
         cpu->sve_max_vq = ARM_MAX_VQ;
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 93f7cccee2..ad2902472d 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -53,8 +53,45 @@ static uint64_t strip_tbi(CPUARMState *env, uint64_t ptr)
 static uint8_t *allocation_tag_mem(CPUARMState *env, uint64_t ptr,
                                    bool write, uintptr_t ra)
 {
+#ifdef CONFIG_USER_ONLY
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    uint64_t clean_ptr = strip_tbi(env, ptr);
+    uint8_t *tags;
+    uintptr_t index;
+    int flags;
+
+    flags = page_get_flags(clean_ptr);
+
+    if (!(flags & PAGE_VALID) || !(flags & (write ? PAGE_WRITE : PAGE_READ))) {
+        /* SIGSEGV */
+        env->exception.vaddress = ptr;
+        cpu_restore_state(CPU(cpu), ra, true);
+        raise_exception(env, EXCP_DATA_ABORT, 0, 1);
+    }
+
+    if (!cpu->tagged_pages) {
+        /* Tag storage is disabled.  */
+        return NULL;
+    }
+    if (flags & PAGE_SHARED) {
+        /* There may be multiple mappings; pretend not implemented.  */
+        return NULL;
+    }
+
+    tags = page_get_target_data(clean_ptr);
+    if (tags == NULL) {
+        size_t alloc_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
+        tags = page_alloc_target_data(clean_ptr, alloc_size);
+        assert(tags != NULL);
+    }
+
+    index = extract32(clean_ptr, LOG2_TAG_GRANULE + 1,
+                      TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
+    return tags + index;
+#else
     /* Tag storage not implemented.  */
     return NULL;
+#endif
 }
 
 static int get_allocation_tag(CPUARMState *env, uint64_t ptr, uintptr_t ra)
-- 
2.17.2

