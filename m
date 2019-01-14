Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2534684wrt;
        Sun, 13 Jan 2019 17:18:49 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6T7JEkCCdpeyL53KA3e8ycrogvkC61jHPwG4XyFLGqc4MwlKqh977HLqshJ+Uw3EqWOtnD
X-Received: by 2002:a1c:a913:: with SMTP id s19mr9371674wme.4.1547428729880;
        Sun, 13 Jan 2019 17:18:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428729; cv=none;
        d=google.com; s=arc-20160816;
        b=rs+aMnZT+3dIP7AxvNrcRRkMj5sM0aLTQXkQB24e6qHBmtvpdafDnyiRuxw00NdJg1
         LZPOQZEqQxHfVlwIrx1BVeXX7k5KZntTYqimircwOlJJktNdU2PPinumKskVnV5ITIqx
         FgiEgjjrbozA/21zlRX6pcYw7Q28zSx1fi3cpEcgoFnATWv0nMZ6ailCfCdGD+arsHq7
         H7CKVmjOcI3YDcA8mEKFIrqCZKtf29r3rdNPxt+RhOgyTcqM7PlT6aoZ5mRD9ev2hIy9
         incrDa8bLMXUvBsF3iL+vufWBVEOL8KpT9o9KqNo8chZM05ViUvmvWntOCDwugE9h9M9
         Eczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ahPLim/iyNOWm0ysZUMOW39UhmJ/M0Ol12YT99+6l5E=;
        b=zShh7AoJilIzuODF1ZIljOt88SRsmTOd1287rwtEZoL7Akdq4n7uYhY5iajsV5RGOW
         0tpLSvFlLUeGSDY6jPx6C5jay5Dvn/01hXJ3hSRNRk2MSAxwDfl7pCqx3xgwGG1k2RII
         tVpT4pK+21QYJIfmLiNC1yvL04m4uAYT4gjZaXD6Hac3/MOJLznE2ZIaA+awGQySWLPL
         lzqwVb+o3yCWFntp0DxkVb3OuXvk6muyGMvDkTefunpx//t21xDXwWzNY1Dy0d3onhOH
         LEUww0fL1arPXKbZDiUjjVcmk9Jx/nbKilqY996Ai6qFlwR3U0OoNN9Ol7cZFWf8O9SZ
         3bow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ffYZ7nR3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s24si49829125wrb.203.2019.01.13.17.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:18:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ffYZ7nR3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56077 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqts-0002Gl-PP
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:18:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnT-0005s7-Qb
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnS-00013x-Rq
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:11 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43667)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqnS-00013e-Mo
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:10 -0500
Received: by mail-pg1-x541.google.com with SMTP id v28so8722866pgk.10
	for <qemu-devel@nongnu.org>; Sun, 13 Jan 2019 17:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ahPLim/iyNOWm0ysZUMOW39UhmJ/M0Ol12YT99+6l5E=;
	b=ffYZ7nR3c6JJJZUmhH/pRzwmYKAylpT/PLahKAYXLa5mtud4+NolqbYPELj/aBdHmc
	ZZ+vbUXhmaDtigFpy9YLit6hqGCi5vZ2QKJL124bArQvjqdsWSUy2b0ayi31yGAT4aq6
	trYCNe69fUciI9tOtNGgV1zbRX4gU8DHQ3LU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ahPLim/iyNOWm0ysZUMOW39UhmJ/M0Ol12YT99+6l5E=;
	b=RA7HjUKQ/TdWMehzple31THKjg/Pu9gwLCak9NXglxiokS197nchJUzhPPew1rAa14
	IwsFnZuBKjNHl7IodpZ6uMfx5l3VJqgKg1lK7zO57SCGulCa4uexe1vIdiwjojS/mnu0
	jCtU8XGrA+nqPIYj9R1qVGoz8OX7umlDC0NvObDUY0CXnW+ZV20HMJRe1oC1YlS+mka7
	mZwj1UgTIZWiQG569a7ZeoRTDN1XnQ5N8oDojJRlQxKqjxiYppLAkyao5s/tl1QooJOm
	dPeYR+zcu3NeiUUxDgNLxrbbM5+BY6fcWGmxmPY1Da/tWLz1PT5i6iFlI1uKSa+hJovq
	PEKw==
X-Gm-Message-State: AJcUukcXIGwnA8LrqzMQ5Da1tFsf8R26A6N0vlyyzBzeRHM0JKFAddjM
	Tdxjn241M5YN4zjot4yFwVRvUUMFAjbRPg==
X-Received: by 2002:a63:9b11:: with SMTP id r17mr21283758pgd.416.1547428329438;
	Sun, 13 Jan 2019 17:12:09 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.12.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:12:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:17 +1100
Message-Id: <20190114011122.5995-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH 12/17] target/arm: Implement the LDGV and STGV
 instructions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b/4BYwQFVhBH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  2 ++
 target/arm/mte_helper.c    | 51 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 34 ++++++++++++++++++++-----
 3 files changed, 81 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index ff37c8975a..5bbfe43c13 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -111,3 +111,5 @@ DEF_HELPER_FLAGS_2(gmi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(ldg, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(stg, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(st2g, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_2(ldgv, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_3(stgv, TCG_CALL_NO_WG, void, env, i64, i64)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 06fd9c18f9..b125f49258 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -256,3 +256,54 @@ uint64_t HELPER(st2g)(CPUARMState *env, uint64_t ptr)
     /* ??? Do we need a more precise TBI here?  */
     return sextract64(ptr, 0, 55);
 }
+
+uint64_t HELPER(ldgv)(CPUARMState *env, uint64_t ptr)
+{
+    int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
+    uint64_t ret;
+    int rtag, i;
+
+    if (!allocation_tag_access_enabled(env, el, sctlr)) {
+        return 0;
+    }
+
+    ptr = QEMU_ALIGN_DOWN(ptr, 1 << LOG2_TAG_GRANULE);
+    rtag = get_allocation_tag(env, ptr);
+    if (rtag < 0) {
+        /* The entire page does not have tags.  */
+        return 0;
+    }
+
+    i = extract32(ptr, LOG2_TAG_GRANULE, 4);
+    ret = (uint64_t)rtag << i;
+    for (i++; i < 16; i++) {
+        rtag = get_allocation_tag(env, ptr + (i << LOG2_TAG_GRANULE));
+        ret |= (uint64_t)rtag << i;
+    }
+
+    return ret;
+}
+
+void HELPER(stgv)(CPUARMState *env, uint64_t ptr, uint64_t val)
+{
+    int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
+    int rtag, i;
+
+    if (!allocation_tag_access_enabled(env, el, sctlr)) {
+        return;
+    }
+
+    rtag = allocation_tag_from_addr(ptr);
+    ptr = QEMU_ALIGN_DOWN(ptr, 1 << LOG2_TAG_GRANULE);
+    if (!set_allocation_tag(env, ptr, rtag)) {
+        /* The entire page does not have tags.  */
+        return;
+    }
+
+    i = extract32(ptr, LOG2_TAG_GRANULE, 4);
+    for (i++; i < 16; i++) {
+        set_allocation_tag(env, ptr + (i << LOG2_TAG_GRANULE), rtag);
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 911d6f06b3..b4226def40 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3612,7 +3612,7 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
     uint64_t offset = sextract64(insn, 12, 9) << LOG2_TAG_GRANULE;
     int op2 = extract32(insn, 10, 3);
     int op1 = extract32(insn, 22, 2);
-    bool is_load = false, is_pair = false, is_zero = false;
+    bool is_load = false, is_pair = false, is_zero = false, is_tagv = false;
     int index = 0;
     TCGv_i64 dirty_addr, clean_addr;
 
@@ -3644,17 +3644,29 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
             /* ST2G */
             is_pair = true;
             index = op2 - 2;
-            break;
+        } else {
+            /* STGV */
+            if (s->current_el == 0 || offset != 0) {
+                goto do_unallocated;
+            }
+            is_tagv = true;
+            index = 1;
         }
-        goto do_unallocated;
+        break;
     case 3:
         if (op2 != 0) {
             /* STZ2G */
             is_pair = is_zero = true;
             index = op2 - 2;
-            break;
+        } else {
+            /* LDGV */
+            if (s->current_el == 0 || offset != 0 || rt == rn) {
+                goto do_unallocated;
+            }
+            is_load = is_tagv = true;
+            index = 1;
         }
-        goto do_unallocated;
+        break;
 
     default:
     do_unallocated:
@@ -3669,7 +3681,17 @@ static void disas_ldst_tag(DisasContext *s, uint32_t insn)
     }
 
     clean_addr = tcg_temp_new_i64();
-    if (is_load) {
+    if (is_tagv) {
+        if (is_load) {
+            gen_helper_ldgv(cpu_reg(s, rt), cpu_env, dirty_addr);
+        } else {
+            gen_helper_stgv(cpu_env, dirty_addr, cpu_reg(s, rt));
+        }
+
+        /* Post-increment with dirty = align_up(dirty, 16*TAG_GRANULE).  */
+        tcg_gen_ori_i64(dirty_addr, dirty_addr, (16 << LOG2_TAG_GRANULE) - 1);
+        tcg_gen_addi_i64(dirty_addr, dirty_addr, 1);
+    } else if (is_load) {
         gen_helper_ldg(cpu_reg(s, rt), cpu_env, dirty_addr);
     } else if (is_pair) {
         gen_helper_st2g(clean_addr, cpu_env, dirty_addr);
-- 
2.17.2

