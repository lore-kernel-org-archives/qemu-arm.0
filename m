Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1693317lfr;
        Tue, 6 Apr 2021 10:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9vCdUK8UqvUB2RKlHTaKkIY/fs/zhZtFezIfEUNpsFgO1vrRso7eyAxxw5Yz8W5jGeL9O
X-Received: by 2002:a05:6638:528:: with SMTP id j8mr2628537jar.108.1617731397023;
        Tue, 06 Apr 2021 10:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617731397; cv=none;
        d=google.com; s=arc-20160816;
        b=YZCGffZttr9E174pJfoONUxMzDMOtd/O2FZyDsPgOaL12nSRuemjkFumZvS/Cr7/M/
         zm4hfrZAvCbIJ6P0W/ELubAT5cGdXpJGAYVO0zYALWLCz3vck31qLNDepobjoGUySBSh
         GT8PErGtCNfIj/8v8y6aNVH31LaxzL87ZQpnH4jBGrtQ49AcTfXdEpvYRxGZiF0f7Zyj
         bO+a21KAKxKmByZMBCNU1TEpy9vdoNJ32s9NaykUDjJd/S8sX9trFA/C/Z2IJt/hWhBL
         NoNtodB/Y/Ve44MXvzM2fUkN9Ssg1wuCmvIXD8DpFSPZNhmEoJ4Rs9tCc46pQ9UZ2dkq
         WOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=P65R6awgu2+jcma22h8y387cCYyU3w5GvnO8K3vdbOs=;
        b=jN/8pOgIev35LkMCnNj15/31aNPMO7eHFetFiaW+j+xiMHdLJCobtHyUhZWwOhg5Mz
         D5og11Yxb2i99KBIr9ag1BhGESu9Nx5iR60FUKOYlI0Kpp3UQl0ZxRxC13tu0wOVn6ny
         TY5dmsvJO3CIwerxsu6G27qA30uwWbFHqFBZ+icGMfAcMlFAQp6MvJrjuO5BKHgIOg0c
         FusROKVl/fARIRk0TyFknsam7PTw1GKpf2IPOtnH5W+my/dQA3YayXTFCoCDT6V9Vlzm
         ZzKtsoSbsnWVDRExgWHnw89OVqHIlQJdHcYH0diwMrZ9vN8AAS4QdOXp7HKjzRhSr6C0
         qFqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XJxzJFhv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si20387987iow.63.2021.04.06.10.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 10:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XJxzJFhv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTpps-0003je-A7
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 13:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTph1-0001sU-D4
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:47 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:47047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgx-0006OE-PU
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:47 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d124so2116144pfa.13
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P65R6awgu2+jcma22h8y387cCYyU3w5GvnO8K3vdbOs=;
 b=XJxzJFhvQ+qKpRYv3+KlnCvl6Zoxf+3xYr/5Q8REfVGnjRYr2f+3LrY/3jYzk1odna
 bGljYDg5EMIOGXDb8S7bhmDJpNcXdvfsImjH1PdsHDkJYfzQB+CelDx5zvTYvT/Fmf3f
 B+swJwkbcu5OKUDIy1x7RTTK3YQz2jlqQobG+6yGelybSy0c96Fof7UKmrj6hruxPrRD
 VYWhqefi/uWBVZo6cg7QEbNFe8qa49N696VitbWU2X4Z2mCjDUFnIBmgKBAYEKpzI+Xl
 jT0ux+lHLjtGEaowpfP8CwpugHMGyIx0WO+N/AGOJ/BF/1F+WuHy4vNQ2cFKAZcpArMA
 czQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P65R6awgu2+jcma22h8y387cCYyU3w5GvnO8K3vdbOs=;
 b=grPlKO3FLoA5XNTswn1zI3Ha7lkupI5BoGhlGc8ntHp/S8FLdIvnObqqPGGiAAs97l
 1EBvdH7Y1HfMTZrzv8BVTp8ZF0SPc9OZ1B/CEKq7VEfmrjG9OcCxvZDoKl1kJYKrFwV9
 9HwwbA8befSyCuMh+cENsWanJOnvA2kIdycM5s6PB8Gfh6y0bCerGMJMOXeAOW1IlV50
 ssIwVY450nM+DJVmeyH3WfANcMkjRj4hVB8w+eTXW0Ks41lbyiSfAc283WlaSiqXi7Le
 HsdCuefCp9lMOnA4L48vyuj/xbNtYr19qy3rEcvXarm7RQH3C4d460UJx+6KUJdqm3so
 2SNg==
X-Gm-Message-State: AOAM5310Pqlom0MC32ppBTdRQRiWbK45Y8lyjUb+vcePBHGi3m7zO8rN
 blB7comWl2hkfhXRcCHkdPhdi3xIFyJSoQ==
X-Received: by 2002:a63:703:: with SMTP id 3mr28597454pgh.253.1617730842113;
 Tue, 06 Apr 2021 10:40:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/12] target/arm: Rename mte_probe1 to mte_probe
Date: Tue,  6 Apr 2021 10:40:28 -0700
Message-Id: <20210406174031.64299-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-TUID: AqLoNQqWYo0E

For consistency with the mte_check1 + mte_checkN merge
to mte_check, rename the probe function as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h  | 2 +-
 target/arm/mte_helper.c | 6 +++---
 target/arm/sve_helper.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index af1db2cd9c..886db56b58 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1145,7 +1145,7 @@ FIELD(MTEDESC, TCMA,  6, 2)
 FIELD(MTEDESC, WRITE, 8, 1)
 FIELD(MTEDESC, SIZEM1, 9, SIMD_DATA_BITS - 9)  /* size - 1 */
 
-bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr);
+bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
 
 static inline int allocation_tag_from_addr(uint64_t ptr)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 04479f33a1..6ac1d21318 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -121,7 +121,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
      * exception for inaccessible pages, and resolves the virtual address
      * into the softmmu tlb.
      *
-     * When RA == 0, this is for mte_probe1.  The page is expected to be
+     * When RA == 0, this is for mte_probe.  The page is expected to be
      * valid.  Indicate to probe_access_flags no-fault, then assert that
      * we received a valid page.
      */
@@ -808,12 +808,12 @@ uint64_t HELPER(mte_check)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 }
 
 /*
- * No-fault version of mte_check1, to be used by SVE for MemSingleNF.
+ * No-fault version of mte_check, to be used by SVE for MemSingleNF.
  * Returns false if the access is Checked and the check failed.  This
  * is only intended to probe the tag -- the validity of the page must
  * be checked beforehand.
  */
-bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr)
+bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
     uint64_t fault;
     int ret = mte_probe_int(env, desc, ptr, 0, &fault);
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b63ddfc7f9..982240d104 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4869,7 +4869,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                 /* Watchpoint hit, see below. */
                 goto do_fault;
             }
-            if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
+            if (mtedesc && !mte_probe(env, mtedesc, addr + mem_off)) {
                 goto do_fault;
             }
             /*
@@ -4919,7 +4919,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                      & BP_MEM_READ)) {
                     goto do_fault;
                 }
-                if (mtedesc && !mte_probe1(env, mtedesc, addr + mem_off)) {
+                if (mtedesc && !mte_probe(env, mtedesc, addr + mem_off)) {
                     goto do_fault;
                 }
                 host_fn(vd, reg_off, host + mem_off);
@@ -5588,7 +5588,7 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                 }
                 if (mtedesc &&
                     arm_tlb_mte_tagged(&info.attrs) &&
-                    !mte_probe1(env, mtedesc, addr)) {
+                    !mte_probe(env, mtedesc, addr)) {
                     goto fault;
                 }
 
-- 
2.25.1

