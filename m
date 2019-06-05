Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3665566wrg;
        Wed, 5 Jun 2019 14:03:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlMmw2r1AeNzwxkEHjNWmjDLPbbH+ZfaR8D1eR2ZVlUL0yTr6er/Ku6zOnwlqXFJOWFTEv
X-Received: by 2002:a37:a094:: with SMTP id j142mr35479133qke.2.1559768607937;
        Wed, 05 Jun 2019 14:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559768607; cv=none;
        d=google.com; s=arc-20160816;
        b=T/8S2FS1qyxx0nOu0P6a2EawLFHkU/XUrxNiaN+5SEIHvNpojI8TrRD3ZcLVfyOKPZ
         +9hSz9VW1OxCVzzYljGPbDioGYPMomvv4HBxPVc7NE9uPqEa8dsOdNN4KdnsHcLhdLoU
         bKkbqSvb78CamfVkuRw9KN0fUt2pXQdxaYVWLUk+zVXdqj8YEU6TYb8E3ehWclFNJAME
         SAxV8YbcaaYr5J5Sl2i4PCwLx8g5A3yb8tM56BIfW9Zqg0yzruFf6jsNw3N2oRjBUlWP
         ZhbfDFFXtIABXrAzQggcN3WyrXajFm2ewmGwf9wKPXfxk15NTGQIgxNfBo9BOmnuJrpV
         MhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ZCHRkKij7pQF0R23SJZo3xfE1Nbsenr9fc05DQb889w=;
        b=RLmWTSqLc7IQTVvbRGOi9PUs90Bs2JYUwJDMgwo+yuLKEXL+T1uqQzSerhURdzbd48
         9LT+sng6gj7VF224uztTJE/7OQd7jusB+X8IWM6LU7JYbgUUGSAX4gw3+WRQkOIdO+u5
         cP6FN9cQz3R07QWul70p2pPJW1IbFOQBmx4QFkg3+pubHCLb80snIo+j7Cdpb8Tk+y0a
         7REBbqlfaCPZ9U7R8vnoU72yiPeDv/7Y9P45sRUSuvkl/HKjl3fb6TNEvWbG8B2Dcm22
         0ByDmP/Aiu9M3ckKM4d2LjqaTiR4xvWfmZSbHN8SPSw21Sjkm2DwC9mGymBrt2P2cM/G
         9/qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EovjxdH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si4151513qvu.109.2019.06.05.14.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jun 2019 14:03:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EovjxdH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYd4B-0002nc-E1
	for alex.bennee@linaro.org; Wed, 05 Jun 2019 17:03:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYcyF-0006E8-O0
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 16:57:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYcyD-0008Iu-OA
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 16:57:19 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hYcyD-0008El-1M
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 16:57:17 -0400
Received: by mail-ot1-x343.google.com with SMTP id l15so2066058otn.9
	for <qemu-arm@nongnu.org>; Wed, 05 Jun 2019 13:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZCHRkKij7pQF0R23SJZo3xfE1Nbsenr9fc05DQb889w=;
	b=EovjxdH3T/hFo28fwmEY4teqysvGF3kpTosbWNfLqUUzpCL/8VbOr3ZGjDF1pTpI8B
	oPHN+5wO3+zDIAIxJRJsvvbX9gAgMWjpbzFADf9Lz5j9VO0UzuruG3h8PqUiUw1Zrt1f
	y5vuroM/lNzamL3UIV0WTJCsP1I3I3uy+wp9ctYDAGfNBw9ceHa4QzpkjTbsf5uderb6
	97i3uUECZOUwXgKhu0RFjLZc6jrzMTogEwJhpyzDTujT6CbfcZi3HNljgukKMl8k4tZt
	IC2bgX9MZ3N5Y+mnhjF+D5pROkgOhWcOUBHAmwbcjaOjDCjP/JplwRwQ1zaLjJ7DoTCc
	ze2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZCHRkKij7pQF0R23SJZo3xfE1Nbsenr9fc05DQb889w=;
	b=Iyh9LuV2qQj+pZUH5uwVySS4yf8B2foJtioKjFOH/p9RdniP7dtA7D+2s/0kbsLHfC
	p/Aqnh8hVmAL27iF7ITpgf0D7U4CgdrBlkIyM/9iFo/J2eqaCc/Zgfdj/uKuTIgoeP/2
	qpxmWH64JdbGvntNyGeie4fHvl0OC4uvMGkCh9A04g6CUr4Iw/9lGN5qsIe0BaqOA3DK
	RDI+s3njtv3k/ULQOnH4m16MWbs9E0yw0hPp2flxd046YS2MdoAg0If0eiP21ohskB2x
	XkPi0Jj2SlLuaPwbdr6C31YIMi9MhVVR3L/ViWpjf+6N2+HOXz1zCvFchL+RZt13gxuJ
	d8BQ==
X-Gm-Message-State: APjAAAWUWU4Pim4MKUbhyZCMTE5mOxTnRjFrUir/Q7YUqSYAA50uSwrE
	NX0g9H4W8aWZInE0Ycoj37Z+lw==
X-Received: by 2002:a9d:7c8b:: with SMTP id q11mr4161202otn.161.1559768236302; 
	Wed, 05 Jun 2019 13:57:16 -0700 (PDT)
Received: from localhost.localdomain (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86])
	by smtp.gmail.com with ESMTPSA id f5sm7414155otl.51.2019.06.05.13.57.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 13:57:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 15:57:03 -0500
Message-Id: <20190605205706.569-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605205706.569-1-richard.henderson@linaro.org>
References: <20190605205706.569-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: [Qemu-arm] [PATCH v6 3/6] linux-user: Set PAGE_TARGET_1 for
 TARGET_PROT_BTI
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, Dave.Martin@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bQQq3yrRTA35

Transform the prot bit to a qemu internal page bit, and save
it in the page tables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h     |  2 ++
 linux-user/syscall_defs.h  |  4 ++++
 linux-user/mmap.c          | 16 ++++++++++++++++
 target/arm/translate-a64.c |  6 +++---
 4 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index da07ce311f..e65530acae 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -249,6 +249,8 @@ extern intptr_t qemu_host_page_mask;
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
 #define PAGE_RESERVED  0x0020
 #endif
+/* Target-specific bits that will be used via page_get_flags().  */
+#define PAGE_TARGET_1  0x0080
 
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 7f141f699c..9a8a14e81e 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1097,6 +1097,10 @@ struct target_winsize {
 #define TARGET_PROT_SEM         0x08
 #endif
 
+#ifdef TARGET_AARCH64
+#define TARGET_PROT_BTI         0x10
+#endif
+
 /* Common */
 #define TARGET_MAP_SHARED	0x01		/* Share changes */
 #define TARGET_MAP_PRIVATE	0x02		/* Changes are private */
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 3117f57fd8..def64a41d5 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -85,6 +85,22 @@ static int validate_prot_to_pageflags(int *host_prot, int prot)
      */
     *host_prot = prot & (PROT_READ | PROT_WRITE | PROT_EXEC);
 
+#ifdef TARGET_AARCH64
+    /*
+     * The PROT_BTI bit is only accepted if the cpu supports the feature.
+     * Since this is the unusual case, don't bother checking unless
+     * the bit has been requested.  If set and valid, record the bit
+     * within QEMU's page_flags as PAGE_TARGET_1.
+     */
+    if (prot & TARGET_PROT_BTI) {
+        ARMCPU *cpu = ARM_CPU(thread_cpu);
+        if (cpu_isar_feature(aa64_bti, cpu)) {
+            valid |= TARGET_PROT_BTI;
+            page_flags |= PAGE_TARGET_1;
+        }
+    }
+#endif
+
     return prot & ~valid ? 0 : page_flags;
 }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 092f0df3c4..5043344eba 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14115,10 +14115,10 @@ static void disas_data_proc_simd_fp(DisasContext *s, uint32_t insn)
  */
 static bool is_guarded_page(CPUARMState *env, DisasContext *s)
 {
-#ifdef CONFIG_USER_ONLY
-    return false;  /* FIXME */
-#else
     uint64_t addr = s->base.pc_first;
+#ifdef CONFIG_USER_ONLY
+    return page_get_flags(addr) & PAGE_TARGET_1;
+#else
     int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
     unsigned int index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-- 
2.17.1

