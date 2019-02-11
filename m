Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp116762wrp;
        Mon, 11 Feb 2019 16:10:38 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY+tN3Oq5Cs+PtzFpdBUkG+oxDhI2uhPpgtLp+7+hTi/hLFb4nUuczAob6o1Kouoit3be2Y
X-Received: by 2002:a81:5a86:: with SMTP id o128mr638722ywb.205.1549930238905;
        Mon, 11 Feb 2019 16:10:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549930238; cv=none;
        d=google.com; s=arc-20160816;
        b=CUqrATYDVj0Z8FupnZo303Tps65SZLoYR79zSqxnA76Zn8oTc1zHIibtSMXyRfQPdn
         onbH7ppUwDOu8U5F6MzwND3Tntv5TiL3vdeyvb+qncFNmgZhlvQ5EYsvtjxaFc2aAYXD
         KmPfHazUqt93/Ds9WRIonIpilpTjvMo02zQnRzLyxpeLcHZlA9mSQ+gqnffjNUuxnunF
         R/xlSOpCzuWYc4ZodsudcT8RNOhtoscIGPbAof86c+XleoNHGrQG+PJzmpqkRepqKyiU
         FBzKe6Yz2OrKLxfsiG0uAHsg6WmipIQGdC+BnD4FdN3YfnKvhc03ViH1WSNVNYTmysE+
         PD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ah6gpD+An0QDDQ04ODgwPJ8bm3GJsZDkKDcKBtcRmis=;
        b=CSihttvap9ANiAAXKxQlWzSkPHLuQ9c7FpBVzqGcMMvWNDoTBNtw0n4a+EPl6KVuqO
         t4UyjO1HR+4glcCFWPdhBTyWDOwO7WZ9N8RRMla11AS9r0O2sQ2ccHkn4PSMwOtpcQeJ
         qhod1jLbooQXFPV7PuWWEAt1c/x88FNPY0zOwie4/AdDQWTL8i2NNuWBet5MXyCIUE2+
         i5HZelQai3r4Va44B1k22OxGLeTHB046pVcUd6oEVfzM/kEoUXxG5wcZcziNtCiuNXUV
         Pq++qiYV6/xDhTXiPsNFdlPCUPEYSwUPXWrk1kqtWLttMCiNlaYzNZ7Sa9Sh97uSilwk
         KA3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ixi4F8QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si4864303ybk.214.2019.02.11.16.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:10:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ixi4F8QJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLeo-0001u5-7a
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:10:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOg-0005q7-8g
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:54:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOe-0004xx-CZ
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:58 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOc-0004gy-3z
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:54 -0500
Received: by mail-pf1-x444.google.com with SMTP id b7so328095pfi.8
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ah6gpD+An0QDDQ04ODgwPJ8bm3GJsZDkKDcKBtcRmis=;
	b=Ixi4F8QJmPd2QJM/RA/0JSAyu33wFhVUY2zFQgHscupUEWikNIZZwZk/QC4WzUz/4o
	rtpf5apJAcjNH8/iSZdSwkBrZ4cA/qDyWEmWKhSkMyTrMT0DRGuZBnAhUwi/Fg//b959
	8jvPC8o2ab4NsBIlaj/qRQAC+nfzxN6ayDtiWu+OpY54/X0/qZ0VSA+ASkqqL6CA9iSV
	SRJhmVDBXNArZiEhsk7G8ZGBzPz3UxeU1Jd+Rubi5+7e5FfG5itqhnfAa2P5t8vJoFND
	KenPAWeDLOzl7YxIoLoe5oZla3RcgyfGXSjDwR96du3NhRJn5JwY3LE3ou1WbUvBbkcA
	DNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ah6gpD+An0QDDQ04ODgwPJ8bm3GJsZDkKDcKBtcRmis=;
	b=sgT0EbwcY2CKXQ5IDdM5/AbvdyOrFjwFUc2d2VNTylfoiwYA/x3PmRUAYg8fv+Liax
	XgMIwqn7jxjkAieoWH/o2a7agMVkPBxSU4lRVgCf6cqazpE0grq7tfYuHpM2r+9JgKXh
	LXXDNkufwSWnhQ+N+Wh7FndgzX5j4MJJCmxetwNpxqDx2RZRINP/h7LE64Pvt+Dd8Wv9
	zXAet1sv4L2cz/WUUqGMk8Xnu6Ym4innSSX3mG2mcFcJIUvJahhI15HVxorq5Wh387r6
	r3D7knUDpVdrnKqfZalseyMwPSn5Jab9BWyufu2y1Vs/cpoM4RhmCmEvQaQj1rfYt2cp
	lrrQ==
X-Gm-Message-State: AHQUAuZFs4ltWlIxyiTMxHbhKVyEzGxrhXcuk5xDrKHwmI8+UwWL5MqP
	8JuyXj0y6HBoK2WrRY5hs13NKVKHzps=
X-Received: by 2002:a63:d5f:: with SMTP id 31mr840515pgn.274.1549929214138;
	Mon, 11 Feb 2019 15:53:34 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:55 -0800
Message-Id: <20190211235258.542-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v3 25/28] target/arm: Add allocation tag storage
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
X-TUID: W0NViLnyHBku

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
 target/arm/mte_helper.c | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

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
index 6d0f82eb99..09c387e2c7 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -28,8 +28,44 @@
 static uint8_t *allocation_tag_mem(CPUARMState *env, uint64_t ptr,
                                    bool write, uintptr_t ra)
 {
+#ifdef CONFIG_USER_ONLY
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    uint8_t *tags;
+    uintptr_t index;
+    int flags;
+
+    flags = page_get_flags(ptr);
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
+    tags = page_get_target_data(ptr);
+    if (tags == NULL) {
+        size_t alloc_size = TARGET_PAGE_SIZE >> (LOG2_TAG_GRANULE + 1);
+        tags = page_alloc_target_data(ptr, alloc_size);
+        assert(tags != NULL);
+    }
+
+    index = extract32(ptr, LOG2_TAG_GRANULE + 1,
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

