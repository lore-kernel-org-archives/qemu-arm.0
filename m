Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1005288ejc;
        Mon, 22 Aug 2022 09:16:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7es43bmRpyi+SCjalkp/cTWAf3yUSAV7tNKoLYtyg00utMYIDgb2ZG56vUYmZLcSj3AuJS
X-Received: by 2002:a05:620a:1402:b0:6bb:ecc1:e93 with SMTP id d2-20020a05620a140200b006bbecc10e93mr7354996qkj.344.1661185002926;
        Mon, 22 Aug 2022 09:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661185002; cv=none;
        d=google.com; s=arc-20160816;
        b=wdoIccLEDmBl8G6AMY3LL7oX8UT6eKzde7JgWYbZ5vltHGHpgm/bS9U9oyoFJ0SufM
         iYjTVT4jPQ/0MbJdTtThyfep0LTnPD7JWV6IVANLnUIjOHm0cQ4Xzs3HSKZwprXH4z0T
         0RGNDW0W4hTkkCCf8HGkJTSPfqQLgGTSKOJClgFapTt4JXeVAa4Ia8GolfRfoZ+/6Q/x
         IaiNWSRJEu5hqc6BeT5y8TCH70iHSvM95rtwzViwzMmJ9eQoODLdx1U12Ey23X1sUKSu
         Dg/ogq2hMCfCAQcCrOuIDgybCqo3a3dOPwXpajDTvTtBUx4ANXUg4ZYE+ibfxwQzrHjw
         ixRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sLuofTzD3XcbGEKkxECtfxPk5kwjXiJfOftJpAZ8w/Y=;
        b=kntr1Tr5+AbshrfqytDfuXPcc5UAYZQxekaRiBnPnrhhWrDvLpWiEpiifTJXXegyzj
         5yAUq850PJ/RdTt/g94abtSylIzf+yxYSbljuf8AEGdEBaDlaRkjdGn8fH1g449LRail
         z3/ehPLn/H2aU6asHgBZAvAMX10iWiOWcV3YE8CnCHO1ZzfnXs30HmuD/Ulk1i3nxHyb
         is8ySavhsfey8ecYRDuQ8FDDsKbB/wQ2uKGRVdc1ZeTDKW9xI6BEv7wTpbZLSVxd3BUA
         tj9lHmZOYsP0XibeXzp25/53VdIdxD8XUy5wIi9OD8YSBt+20cNlD74VP2fdJizeHX2J
         X6hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eY0jKCOi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194-20020a3709cb000000b006b8619a680csi4531659qkj.380.2022.08.22.09.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 09:16:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eY0jKCOi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQA6U-0002gv-8t
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 12:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oe-0004dK-8f
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:28 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ob-0001ae-Vr
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:23 -0400
Received: by mail-pf1-x432.google.com with SMTP id z187so10654462pfb.12
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=sLuofTzD3XcbGEKkxECtfxPk5kwjXiJfOftJpAZ8w/Y=;
 b=eY0jKCOi/0F6BnqLwWgsFl7dY2JIWefv5PgviFwo07jZhw+hnX20H9bXyBAC5UA/ig
 kKqEdmzo1xAbUH4IVm8+LQv2aKFx9WGImc0BPF4KBvzdL0jhUwk+ipCPfORK8N/uFfi4
 JuFRH/XZFyLDaLpxn89ej8tPGbAGg3GGE7czY5IkX0AwVuVg/1nRIk8DB+/fmccEK2PJ
 CZmVkFrQvExevpBD4lnUwOGkYzT1uySJrF0he/G7Movr38iY0jsf6SNqPFEluAHMNJ6c
 JMqTOgu61bHKsWtr7iKqVKSu0LemQvPkYLdw6vvCdnU7BDuQMIrv/7zgA103bpY8hXuc
 iDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sLuofTzD3XcbGEKkxECtfxPk5kwjXiJfOftJpAZ8w/Y=;
 b=Gx2O1lIaWqnTKYecUIzKeiZANB90VYyFln973kmxW8GIC9UzSogjg/8RLkUT14sBJz
 E/ZI3c/crbAZ06mmeiCkz/kni4KF++r4qcPQWsJvdSkGaOmbbPNgmnOQLQB4N1r2GUx0
 GNEBwgnWcniVi59zoACz7EuL9E9jrPo1A+FzHm9GyAq+kTdx2uoEw/8bkXC53GdXdw9r
 9lKobj35KvUdi2pWuXvYz/hQuDQ3BNHZnhYcXuUMMDQpC+pLpVsocA4MCWbzz0ansnyb
 nk2TcH9lzi1zHBrD2YYAJ7mnaqTDo31ZUzhnnGRhR75Q7br0bz8H+9e2sHsqsoyOxjwi
 C4ZA==
X-Gm-Message-State: ACgBeo2gMRZGkqnNyjsI1j+FSQH9mxDBKSXFFG0IFg8qa8nqC095UZXb
 c/o3UNZGiu8ceuZp4ROT3THmbA==
X-Received: by 2002:a05:6a00:1a49:b0:52d:4ad7:3bea with SMTP id
 h9-20020a056a001a4900b0052d4ad73beamr21749452pfv.66.1661182279316; 
 Mon, 22 Aug 2022 08:31:19 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 40/66] accel/tcg: Introduce probe_access_full
Date: Mon, 22 Aug 2022 08:27:15 -0700
Message-Id: <20220822152741.1617527-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2vE4gjhEYz3n

Add an interface to return the CPUTLBEntryFull struct
that goes with the lookup.  The result is not intended
to be valid across multiple lookups, so the user must
use the results immediately.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 11 +++++++++++
 accel/tcg/cputlb.c      | 44 +++++++++++++++++++++++++----------------
 2 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 311e5fb422..e366b5c1ba 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -435,6 +435,17 @@ int probe_access_flags(CPUArchState *env, target_ulong addr,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr);
 
+#ifndef CONFIG_USER_ONLY
+/**
+ * probe_access_full:
+ * Like probe_access_flags, except also return into @pfull.
+ */
+int probe_access_full(CPUArchState *env, target_ulong addr,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool nonfault, void **phost,
+                      CPUTLBEntryFull **pfull, uintptr_t retaddr);
+#endif
+
 #define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
 
 /* Estimated block size for TB allocation.  */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 5359113e8d..1c59e701e6 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1579,7 +1579,8 @@ static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
 static int probe_access_internal(CPUArchState *env, target_ulong addr,
                                  int fault_size, MMUAccessType access_type,
                                  int mmu_idx, bool nonfault,
-                                 void **phost, uintptr_t retaddr)
+                                 void **phost, CPUTLBEntryFull **pfull,
+                                 uintptr_t retaddr)
 {
     uintptr_t index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
@@ -1613,10 +1614,12 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
                                        mmu_idx, nonfault, retaddr)) {
                 /* Non-faulting page table read failed.  */
                 *phost = NULL;
+                *pfull = NULL;
                 return TLB_INVALID_MASK;
             }
 
             /* TLB resize via tlb_fill may have moved the entry.  */
+            index = tlb_index(env, mmu_idx, addr);
             entry = tlb_entry(env, mmu_idx, addr);
 
             /*
@@ -1630,6 +1633,8 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     }
     flags &= tlb_addr;
 
+    *pfull = &env_tlb(env)->d[mmu_idx].fulltlb[index];
+
     /* Fold all "mmio-like" bits into TLB_MMIO.  This is not RAM.  */
     if (unlikely(flags & ~(TLB_WATCHPOINT | TLB_NOTDIRTY))) {
         *phost = NULL;
@@ -1641,37 +1646,44 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     return flags;
 }
 
-int probe_access_flags(CPUArchState *env, target_ulong addr,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool nonfault, void **phost, uintptr_t retaddr)
+int probe_access_full(CPUArchState *env, target_ulong addr,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool nonfault, void **phost, CPUTLBEntryFull **pfull,
+                      uintptr_t retaddr)
 {
-    int flags;
-
-    flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
-                                  nonfault, phost, retaddr);
+    int flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
+                                      nonfault, phost, pfull, retaddr);
 
     /* Handle clean RAM pages.  */
     if (unlikely(flags & TLB_NOTDIRTY)) {
-        uintptr_t index = tlb_index(env, mmu_idx, addr);
-        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-
-        notdirty_write(env_cpu(env), addr, 1, full, retaddr);
+        notdirty_write(env_cpu(env), addr, 1, *pfull, retaddr);
         flags &= ~TLB_NOTDIRTY;
     }
 
     return flags;
 }
 
+int probe_access_flags(CPUArchState *env, target_ulong addr,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool nonfault, void **phost, uintptr_t retaddr)
+{
+    CPUTLBEntryFull *full;
+
+    return probe_access_full(env, addr, access_type, mmu_idx,
+                             nonfault, phost, &full, retaddr);
+}
+
 void *probe_access(CPUArchState *env, target_ulong addr, int size,
                    MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
+    CPUTLBEntryFull *full;
     void *host;
     int flags;
 
     g_assert(-(addr | TARGET_PAGE_MASK) >= size);
 
     flags = probe_access_internal(env, addr, size, access_type, mmu_idx,
-                                  false, &host, retaddr);
+                                  false, &host, &full, retaddr);
 
     /* Per the interface, size == 0 merely faults the access. */
     if (size == 0) {
@@ -1679,9 +1691,6 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     }
 
     if (unlikely(flags & (TLB_NOTDIRTY | TLB_WATCHPOINT))) {
-        uintptr_t index = tlb_index(env, mmu_idx, addr);
-        CPUTLBEntryFull *full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
-
         /* Handle watchpoints.  */
         if (flags & TLB_WATCHPOINT) {
             int wp_access = (access_type == MMU_DATA_STORE
@@ -1702,11 +1711,12 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
 void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
                         MMUAccessType access_type, int mmu_idx)
 {
+    CPUTLBEntryFull *full;
     void *host;
     int flags;
 
     flags = probe_access_internal(env, addr, 0, access_type,
-                                  mmu_idx, true, &host, 0);
+                                  mmu_idx, true, &host, &full, 0);
 
     /* No combination of flags are expected by the caller. */
     return flags ? NULL : host;
-- 
2.34.1

