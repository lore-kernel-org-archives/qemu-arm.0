Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1747056lfg;
        Fri, 2 Apr 2021 14:46:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeCRZ+JtOQrn9GTYBmLV2HhvMvwZYeXfdjxuqO1z7z6y+bbaV/Up/BFcAp3DHAKCp2hNA5
X-Received: by 2002:a05:6638:35a2:: with SMTP id v34mr14664622jal.94.1617399968525;
        Fri, 02 Apr 2021 14:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617399968; cv=none;
        d=google.com; s=arc-20160816;
        b=I3jcE8gbrncNud0Y+UO1tMdKiiIejLKJ83C7HuelFRFDxfgFzx0E8XlJjDMeUcBF9Z
         n+9FesViKcgVHqNa0n8+AGXKm0wSYfl/f0GsBv58JCE4dvDMjdV7PBgybaeBPHKSZVjG
         j3g2oxzcg5ccPTAmU4fM7/lX+C880G5FaJOMbpGZImZJgmQFtOA0OfxPkv+1xT8KBm52
         Dii9k8grSJiNxh1a7NBEQwWuCbr3KvUh176YpqwEhxoy2pkNoWUCY0R+gppKaeQjyVGF
         1R8UPkv9g750g/s0plEOFVM6Dy5I73G6taiQ2SHGm42ah08j2CG5PFny5IEfpDKBds2I
         xrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cOmrmLleIvfS9SAvRM+rFaIFvSakRJgmx9iPS/gIMnk=;
        b=o+J6Ejg78eOT8xNXP8JDEO1M/sTLxhDhfBCaE5BL6HABsfowGyp8rutxaY4vpi2zcI
         FwQ801izlGx14pq4mp7YgehZz06m30++yrUo+LqLvH3M0jxbzFF9iy/jv/nMvgNUbzH4
         3qTazKIb73PtlROUlJHcmyfV6RsE3XuTpecaKGJQuL8IsvfrVAuUfAtGEiuSAKuDzOLd
         Rw7PEZA/OdhFy+uN6yghO7cYAgJn+8te/rGcH4JzPQocNB2/odo6pY+hGCgbZDUZBfQq
         ybZhz5BtCep940aLOzOk2d+MkKFcHofvsrcFCan9SntLD2GfHUQiJkahNB5OdjA0qQwh
         DJeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXWN0eHl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24si8617849jaq.29.2021.04.02.14.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 14:46:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GXWN0eHl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSRcF-0005Sq-NX
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 17:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYj-0000Kj-MH
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:29 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYh-0007hw-Q3
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:29 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so5142246pjb.0
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 14:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cOmrmLleIvfS9SAvRM+rFaIFvSakRJgmx9iPS/gIMnk=;
 b=GXWN0eHleJIOYPqqVw7XDwTogr0Wie/tRM2bVSFJvXYXKaK8EVi+Kj53UZVuB95CpT
 rnwEnCWWZGzt/R1XBOa1kGBn26Jnid1adpFlcbwp9dUDx9FfyZe9p1zNgIVq5g7ZzPaw
 A3AGJ9s+uFUwcdJQNRR5pdLhMTHX3+duC2KwelAbtPl4aao52GNVFWDrZn6AfZRxQUe0
 43x0GK05Lt7f4EzxNQFhIjshN9ueEITLWCa67krdf3N/rWeXm1P3rf/daAZn+lkAPGes
 Mgz6ah4hPvTVT+hoKZwp2jl6KrpiLadfgqM3FqACuNayIy3xnePZonMjQ0spl/kAoNNa
 NNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cOmrmLleIvfS9SAvRM+rFaIFvSakRJgmx9iPS/gIMnk=;
 b=dm1fv3g8XEqieRf4TXzzIsW3Qcmk0ipuogOp103gWpT1K91Hw62QQ1nbwibi2FNYa5
 /LMggETeD+ra9nwmvsaXAjw5Gak84gA9cj/2vRNWp+FjoYAcovQKJqJM4Ifnkr6GXLgB
 GbdwRlrwUAMjSRt1PzeK/4iO2FuEMeRqPrG8mBB5cfib3Z0rcPcRR7tedvz+f7lnkG+/
 IZF+hHl/OxYBmei/DKNyPda+Bf3K5A3/xg30K7el4EklWKD0lTNb8UhUqta18xiqH09/
 i8UKTE22JxyaY7BtuNLztWOg59AIHvOVbdkO1LV7BoXTQXLkpISMUrANgH96CoQruK+r
 +PVQ==
X-Gm-Message-State: AOAM533XZ40SMTTAmkY6QDkGFW26z8fRijuwl/xCOJPrdR3Npqp9+kdV
 6kvvkimDw+33dfgUbQ7wjC521B85RM5FoQ==
X-Received: by 2002:a17:902:ce8d:b029:e4:bc38:c4 with SMTP id
 f13-20020a170902ce8db02900e4bc3800c4mr14144501plg.48.1617399746604; 
 Fri, 02 Apr 2021 14:42:26 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/11] target/arm: Fix unaligned checks for mte_check1,
 mte_probe1
Date: Fri,  2 Apr 2021 14:42:11 -0700
Message-Id: <20210402214217.422585-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YlBxOGEST+i4

We were incorrectly assuming that only the first byte of an MTE access
is checked against the tags.  But per the ARM, unaligned accesses are
pre-decomposed into single-byte accesses.  So by the time we reach the
actual MTE check in the ARM pseudocode, all accesses are aligned.

We cannot tell a priori whether or not a given scalar access is aligned,
therefore we must at least check.  Use mte_probe_int, which is already
set up for checking multiple granules.

Buglink: https://bugs.launchpad.net/bugs/1921948
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 109 +++++++++++++---------------------------
 1 file changed, 35 insertions(+), 74 deletions(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 179846b463..6fcfaf5c9e 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -617,80 +617,6 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
     }
 }
 
-/*
- * Perform an MTE checked access for a single logical or atomic access.
- */
-static bool mte_probe1_int(CPUARMState *env, uint32_t desc, uint64_t ptr,
-                           uintptr_t ra, int bit55)
-{
-    int mem_tag, mmu_idx, ptr_tag, size;
-    MMUAccessType type;
-    uint8_t *mem;
-
-    ptr_tag = allocation_tag_from_addr(ptr);
-
-    if (tcma_check(desc, bit55, ptr_tag)) {
-        return true;
-    }
-
-    mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
-    type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
-    size = FIELD_EX32(desc, MTEDESC, ESIZE);
-
-    mem = allocation_tag_mem(env, mmu_idx, ptr, type, size,
-                             MMU_DATA_LOAD, 1, ra);
-    if (!mem) {
-        return true;
-    }
-
-    mem_tag = load_tag1(ptr, mem);
-    return ptr_tag == mem_tag;
-}
-
-/*
- * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
- * Returns false if the access is Checked and the check failed.  This
- * is only intended to probe the tag -- the validity of the page must
- * be checked beforehand.
- */
-bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
-{
-    int bit55 = extract64(ptr, 55, 1);
-
-    /* If TBI is disabled, the access is unchecked. */
-    if (unlikely(!tbi_check(desc, bit55))) {
-        return true;
-    }
-
-    return mte_probe1_int(env, desc, ptr, 0, bit55);
-}
-
-uint64_t mte_check1(CPUARMState *env, uint32_t desc,
-                    uint64_t ptr, uintptr_t ra)
-{
-    int bit55 = extract64(ptr, 55, 1);
-
-    /* If TBI is disabled, the access is unchecked, and ptr is not dirty. */
-    if (unlikely(!tbi_check(desc, bit55))) {
-        return ptr;
-    }
-
-    if (unlikely(!mte_probe1_int(env, desc, ptr, ra, bit55))) {
-        mte_check_fail(env, desc, ptr, ra);
-    }
-
-    return useronly_clean_ptr(ptr);
-}
-
-uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
-{
-    return mte_check1(env, desc, ptr, GETPC());
-}
-
-/*
- * Perform an MTE checked access for multiple logical accesses.
- */
-
 /**
  * checkN:
  * @tag: tag memory to test
@@ -882,6 +808,41 @@ uint64_t HELPER(mte_checkN)(CPUARMState *env, uint32_t desc, uint64_t ptr)
     return mte_checkN(env, desc, ptr, GETPC());
 }
 
+uint64_t mte_check1(CPUARMState *env, uint32_t desc,
+                    uint64_t ptr, uintptr_t ra)
+{
+    uint64_t fault;
+    uint32_t total = FIELD_EX32(desc, MTEDESC, ESIZE);
+    int ret = mte_probe_int(env, desc, ptr, ra, total, &fault);
+
+    if (unlikely(ret == 0)) {
+        mte_check_fail(env, desc, fault, ra);
+    } else if (ret < 0) {
+        return ptr;
+    }
+    return useronly_clean_ptr(ptr);
+}
+
+uint64_t HELPER(mte_check1)(CPUARMState *env, uint32_t desc, uint64_t ptr)
+{
+    return mte_check1(env, desc, ptr, GETPC());
+}
+
+/*
+ * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
+ * Returns false if the access is Checked and the check failed.  This
+ * is only intended to probe the tag -- the validity of the page must
+ * be checked beforehand.
+ */
+bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
+{
+    uint64_t fault;
+    uint32_t total = FIELD_EX32(desc, MTEDESC, ESIZE);
+    int ret = mte_probe_int(env, desc, ptr, 0, total, &fault);
+
+    return ret != 0;
+}
+
 /*
  * Perform an MTE checked access for DC_ZVA.
  */
-- 
2.25.1

