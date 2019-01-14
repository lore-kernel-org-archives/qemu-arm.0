Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2534633wrt;
        Sun, 13 Jan 2019 17:18:44 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7Vx1Yppi3E5d22X2W16krngVbUqe972z9gnEbhcf/kMQd1mZMO8YvRIiop64GrWYJrF1T3
X-Received: by 2002:a1c:5a42:: with SMTP id o63mr9668907wmb.88.1547428724373;
        Sun, 13 Jan 2019 17:18:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428724; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCyXQMuKGY4TE9s8otmOhMqimEXpwI/4IrwJcnacE6dKxefQAJvdU1hP1forIk/xeh
         TjL4F4KxlKH7b52dbraf8IKl+i4ix0sjuE6PJLzKP4VOhCTvzY+l3ko61xNp6Xdo8/KF
         QpZo+soNUW/TGL0uWIn+RczVRGCciKV82vz7lAtgHPhCw9M+EgRWF+hmtQCbTv1o+sdT
         EnburFceVtBwWCTdYFxoAS31lsKK+Ax8zjwiZdZ82gFa1Lna3TBv5PmH28kbJcrbX1z9
         xbqhTKyoZ9f9nTdZiGdUhU8EE95/qql84gZdbgg42zjbbCc7QQZ3dvVPMSeQRse0IWgM
         IkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=2PYs5yE9xS8a3r0HkYRgoMY35uJiqcAT1vOz7tayvVQ=;
        b=sAb6pjjfJ2MVgnpOx6wIKjAKhSFntJ6MxrPHLSGbSMcLOBiTR2Ug3I2CWQdqFjO/lP
         QoJ3jDCnSe66MPGoTYJXQcLhnDtJb4Z347cFSdg3LlT9Rx4TxRj3VTqdKCazYUE5hRn+
         HyvU7i3QaS//in0n6iGnY8eBzgbUBkrJUypUyyx0s+CbbK/ja9+sdhSGnmh9dm+IZJyE
         2W03VAIK3DsTrzKTLS+pWNAgJsgzJj8yiOzS7+WDGnakUKg+bwbNSQVXePzyFtIBXTXH
         /X2zc+YZs3leBWsWuDmlwVmarW0jUytC8TtJcPrHbQRo9KOP2L/g+KJ5I4nXAeEbotcG
         jmyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zdq5yMz0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si48123626wrw.413.2019.01.13.17.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:18:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zdq5yMz0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:56107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqtn-0002Ls-Dq
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:18:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnB-0005aO-Ab
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnA-0000rb-Aj
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:53 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37655)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqnA-0000r9-4P
	for qemu-arm@nongnu.org; Sun, 13 Jan 2019 20:11:52 -0500
Received: by mail-pl1-x644.google.com with SMTP id b5so9345094plr.4
	for <qemu-arm@nongnu.org>; Sun, 13 Jan 2019 17:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2PYs5yE9xS8a3r0HkYRgoMY35uJiqcAT1vOz7tayvVQ=;
	b=Zdq5yMz0fqPnb0Qmk/0HWU1unMHGGx4wKioGY+R1wJvPvxLUiEMtnsJsx49pIf/zwg
	tdRPO0AdheJIK7ZBvI8ykfBQUFnPlASXpfC3P6mTeYfqPl3A6yGa6UKMzQQIAQGFG6bC
	JDnQpms8FtMkojFa/4zQtm49WOIjde7lcq4iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2PYs5yE9xS8a3r0HkYRgoMY35uJiqcAT1vOz7tayvVQ=;
	b=d/wiKcWu+tRj7IS05euQTs9O7qdnF50xbWI9EvJsB04nqW0FPUZi1WJbrcefqhwHBq
	VMFd+St3tLqwaeQ3eHmZd4GRlAh6x4M2ktjv+1nPVKRSQYi3FIKuKuSCt1jd5timE1SF
	l7sb5fLLCIoVdQT7zq6zuP+o+ntyRhVterYqvpAhn2DJb2ki203ZSSfKq+StS/mo6dsD
	bDez7S6HLLK7nBPDHJQv5OgNLFp2107YNFoPoq5Mqt4GwzveSGr4BOuJDwm0yVbrrMV2
	807+rk5i798p8AhEZhWateTfQGCawDYV3pFdnujiaH6zoVkJFBYowtrKVCLNxxvt4bUv
	0nPQ==
X-Gm-Message-State: AJcUukdPlSvTdB0vX4BEWqoGT33QR6Y884dJmKG/fsMoIZPFm5uBVm6/
	f7I9KgwxQSQlKvC7Ok7iBZhRWw==
X-Received: by 2002:a17:902:a9c4:: with SMTP id
	b4mr23361136plr.298.1547428311110; 
	Sun, 13 Jan 2019 17:11:51 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.11.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:11:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:11 +1100
Message-Id: <20190114011122.5995-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH 06/17] target/arm: Implement the IRG instruction
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
X-TUID: qgeDzfFWK2n7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |  1 +
 target/arm/mte_helper.c    | 55 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  7 +++++
 3 files changed, 63 insertions(+)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index fa4c371a47..7a6051fdab 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -104,3 +104,4 @@ DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(mte_check, TCG_CALL_NO_WG, i64, env, i64)
+DEF_HELPER_FLAGS_3(irg, TCG_CALL_NO_RWG, i64, env, i64, i64)
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 6f4bc0aa04..1878393fc4 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -36,6 +36,48 @@ static int allocation_tag_from_addr(uint64_t ptr)
     return (extract64(ptr, 56, 4) + extract64(ptr, 55, 1)) & 15;
 }
 
+/* Like ChooseNonExcludedTag, except that GCR_EL1 is already in.  */
+static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
+{
+    if (exclude != 0xffff) {
+        int i;
+        for (i = 0; i < offset; ++i) {
+            do {
+                tag = (tag + 1) & 15;
+            } while (exclude & (1 << tag));
+        }
+    }
+    return tag;
+}
+
+static int choose_random_nonexcluded_tag(CPUARMState *env, uint16_t exclude)
+{
+    /* Ignore GCR_EL1.RRND.  Always produce deterministic results.  */
+    int start = extract32(env->cp15.rgsr_el1, 0, 4);
+    int seed = extract32(env->cp15.rgsr_el1, 8, 16);
+    int offset, rtag, i;
+
+    /* RandomTag */
+    for (i = offset = 0; i < 4; ++i) {
+        /* NextRandomTagBit */
+        int top = (extract32(seed, 5, 1) ^ extract32(seed, 3, 1) ^
+                   extract32(seed, 2, 1) ^ extract32(seed, 0, 1));
+        seed = (top << 15) | (seed >> 1);
+        offset |= top << i;
+    }
+    rtag = choose_nonexcluded_tag(start, offset, exclude);
+
+    env->cp15.rgsr_el1 = rtag | (seed << 8);
+
+    return rtag;
+}
+
+static uint64_t address_with_allocation_tag(uint64_t ptr, int rtag)
+{
+    rtag -= extract64(ptr, 55, 1);
+    return deposit64(ptr, 56, 4, rtag);
+}
+
 uint64_t HELPER(mte_check)(CPUARMState *env, uint64_t ptr)
 {
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
@@ -108,3 +150,16 @@ uint64_t HELPER(mte_check)(CPUARMState *env, uint64_t ptr)
     /* Unchecked, or tag check pass.  Ignore the top byte.  */
     return sextract64(ptr, 0, 55);
 }
+
+uint64_t HELPER(irg)(CPUARMState *env, uint64_t rn, uint64_t rm)
+{
+    int el = arm_current_el(env);
+    uint64_t sctlr = arm_sctlr(env, el);
+    int rtag = 0;
+
+    if (allocation_tag_access_enabled(env, el, sctlr)) {
+        uint16_t exclude = rm | env->cp15.gcr_el1;
+        rtag = choose_random_nonexcluded_tag(env, exclude);
+    }
+    return address_with_allocation_tag(rn, rtag);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ee95ba7165..b0349bffc4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5105,6 +5105,13 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
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

