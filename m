Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp105434wrp;
        Mon, 11 Feb 2019 15:56:56 -0800 (PST)
X-Google-Smtp-Source: AHgI3IacDGUmme+Wtk8nZNG1wllBK2WK2VOW6tFzPJ/eQuZr1VRY3b69Q05CTzIyD6HMfOFvP+Pn
X-Received: by 2002:a25:90e:: with SMTP id 14mr644261ybj.474.1549929416124;
        Mon, 11 Feb 2019 15:56:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929416; cv=none;
        d=google.com; s=arc-20160816;
        b=If04SCvm9VPhrEvmDPdIU7q9lgKtE3jGqxW63AlVa8Al4ViS667LqUh53H5736h54Q
         NaL2q45HhBvRpRFTjSzjnyyz0xYJsFr+6DVXVZ3Iyd2QaRd4oQLloMuYef7mMQlWpexj
         vegW5DNaNEqjb8RDvexcoJ2ODse7OnnRNCLihTYERI9+oxlPioaBYnt2OZXLlgrf4YjV
         oRpyGN3sJkPLroC/cGPqwsv4jjgM3xKCmRJHchk4Xob5amF2GpGTqmGJcfe+G7i00jqG
         qSke7a2sXT78gpJ/4HIRwK29rJmlPQh8zQl2qkJGPMQ7hKVcByzFMkiQmm/nMiEkv4vt
         3B1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=yBCUhDhUUX/BVeMsTLdHvYEBPRtZXUGYZEktbYJveAI=;
        b=qRo/aXcZlPWIJKbffmdkK6KdhcaAbOLwQPBl4vVqbxPatcOF03UH2TpZ9Men74btWn
         7nnZQfrnQbKjJYTrXDxzuALnOBDd6z6r+/e8BdXXi07ByYVkKMns0nsmzyf1JBFrZzWL
         bf9oC+xuQlYk4PT1VXb25Mp511eqB3hA9P++axMVIvzbxIDQPkHvwWoVXL6a0wT4+VEq
         FU4VRH0Ubsh+iQnfeN3VFxg7eVWfn99oxIG06KTNNz9lJr3/sHV303rJB1BZWk4FmP3j
         0Kk9jILHAswO5+l9UqzbeJ8RKrjNZycGKBBXx8K+MN1iALw9780dN8VIbYPQm48WVNMw
         Q/mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MIJ5oHxz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si6552898ybr.58.2019.02.11.15.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:56:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MIJ5oHxz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLRX-00085k-Hy
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:56:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOE-0005Mg-Gq
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOC-0004YJ-9H
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:30 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOC-0004RC-09
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:28 -0500
Received: by mail-pg1-x544.google.com with SMTP id m1so314275pgq.8
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yBCUhDhUUX/BVeMsTLdHvYEBPRtZXUGYZEktbYJveAI=;
	b=MIJ5oHxz8xZS64wqJuv3lWSDpZqfRHLUxHLxRNso7oB77nR9CoMhUYyGmzvExch5Ox
	hPc65MKayM6CsBUwjMs+8hew8eCy7371scGnmUptRIbN1p+joA4CkiK+JTF90cmdXO6p
	tR8y4fC2Wgj2dQKZ80k3PGr1A3d4q1Ir8OCoNa/7MSctR1NELu1xc0QFxUNIdKugUstl
	AHYs84z9lK6V9KP0uH5Jhi5E0xhGhluvDnGd10fk9P6voIqabwc+t1T7z6zWrFRGg0aq
	J+iPz5jH+CG1VRvoqNSXD/Zf/MRlBMfP0SBUN0RMtoiOpQyS7nUwr1qmRlzNqtoPHtX1
	VdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yBCUhDhUUX/BVeMsTLdHvYEBPRtZXUGYZEktbYJveAI=;
	b=ubrFQokGu88PCSXM73SWTDtJiPNnh8UHH+BrrqPDsOX5mp3vlRXUWcERdoD5CTD1gZ
	Xr/qKwDFXG0+lnshlZgaSik24GcIYFcpNhE8P3am8+DS0nAbu/6G5CFh/0ze/uvvdVTW
	bTScAJz8QpUatd03aD5SYOfj78Ag3igyemWEq/GGwRnE8BjqQ8aVU03b9pJHuPCi3hSB
	Akmihl3DqHCdaUtGTFRcbhHF6AC8UELqC91u2gIhal9oFf4tLO+BGE2CPlAvdJRLatFu
	j2iTHEil0MzDqdrzNY87mwiA/id47+g22XQz4+zYRuGrik0JMBcVs/k6e4D/qbTS6TaD
	P0DA==
X-Gm-Message-State: AHQUAuY2K1Lwu8DEJksBAH/M2b7dmb6vKA04mW1/kaZb0nqCeT7r7cSG
	Kh+wn0AO+M7Jr3PMxo6nc/LlfQ==
X-Received: by 2002:aa7:84c7:: with SMTP id x7mr906356pfn.180.1549929194697;
	Mon, 11 Feb 2019 15:53:14 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:40 -0800
Message-Id: <20190211235258.542-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH v3 10/28] target/arm: Implement the IRG
 instruction
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
X-TUID: 3bKrziZijUB8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update to 00eac5.
    Merge choose_random_nonexcluded_tag into helper_irg since
    that pseudo function no longer exists separately.
---
 target/arm/helper-a64.h    |  1 +
 target/arm/mte_helper.c    | 57 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  7 +++++
 3 files changed, 65 insertions(+)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index c88797a922..0f6e78c77e 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -105,3 +105,4 @@ DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(mte_check1, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_3(mte_check2, TCG_CALL_NO_WG, i64, env, i64, i32)
+DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index bcd82a9be0..cd04e4954b 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -37,6 +37,31 @@ static int allocation_tag_from_addr(uint64_t ptr)
     return extract64(ptr, 56, 4);
 }
 
+static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
+{
+    if (exclude == 0xffff) {
+        return 0;
+    }
+    if (offset == 0) {
+        while (exclude & (1 << tag)) {
+            tag = (tag + 1) & 15;
+        }
+    } else {
+        do {
+            do {
+                tag = (tag + 1) & 15;
+            } while (exclude & (1 << tag));
+        } while (--offset > 0);
+    }
+    return tag;
+}
+
+static uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
+{
+    rtag -= extract64(ptr, 55, 1);
+    return deposit64(ptr, 56, 4, rtag);
+}
+
 /*
  * Perform a checked access for MTE.
  * On arrival, TBI is known to enabled, as is allocation_tag_access_enabled.
@@ -131,3 +156,35 @@ uint64_t HELPER(mte_check2)(CPUARMState *env, uint64_t dirty_ptr, uint32_t tbi)
         return dirty_ptr;
     }
 }
+
+uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
+{
+    int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
+    int rtag = 0;
+
+    if (allocation_tag_access_enabled(env, el, sctlr)) {
+        /*
+         * Our IMPDEF choice for GCR_EL1.RRND==1 is to behave as if
+         * GCR_EL1.RRND==0, always producing deterministic results.
+         */
+        uint16_t exclude = extract32(rm | env->cp15.gcr_el1, 0, 16);
+        int start = extract32(env->cp15.rgsr_el1, 0, 4);
+        int seed = extract32(env->cp15.rgsr_el1, 8, 16);
+        int offset, i;
+
+        /* RandomTag */
+        for (i = offset = 0; i < 4; ++i) {
+            /* NextRandomTagBit */
+            int top = (extract32(seed, 5, 1) ^ extract32(seed, 3, 1) ^
+                       extract32(seed, 2, 1) ^ extract32(seed, 0, 1));
+            seed = (top << 15) | (seed >> 1);
+            offset |= top << i;
+        }
+        rtag = choose_nonexcluded_tag(start, offset, exclude);
+
+        env->cp15.rgsr_el1 = rtag | (seed << 8);
+    }
+
+    return address_with_allocation_tag(rn, rtag);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 27ceea66d1..141a03a88f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5133,6 +5133,13 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
     case 3: /* SDIV */
         handle_div(s, true, sf, rm, rn, rd);
         break;
+    case 4: /* IRG */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        }
+        gen_helper_irg(cpu_reg_sp(s, rd), cpu_env,
+                       cpu_reg_sp(s, rn), cpu_reg(s, rm));
+        break;
     case 8: /* LSLV */
         handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
         break;
-- 
2.17.2

