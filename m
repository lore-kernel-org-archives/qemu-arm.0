Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp79218ejb;
        Wed, 15 Feb 2023 19:11:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/IUC1i1zXPFY/hb2bS0qqDUdcBNPOff5LYDQXSuSnouDEtDE4Q+NYxHzWA/66mOr2cIfXd
X-Received: by 2002:a05:6214:528b:b0:56e:b7a4:be59 with SMTP id kj11-20020a056214528b00b0056eb7a4be59mr7634168qvb.17.1676517066663;
        Wed, 15 Feb 2023 19:11:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676517066; cv=none;
        d=google.com; s=arc-20160816;
        b=YRFoHGMRFG+vd5L9HNbH+TbAaDMhG28qUmL6hBFwyVF0eyNH30zqw6bkEmqwe456KD
         9usMEGmtPDx6GG7om3zqFFxbmQKYGOYc34zlkxvxbdiLh5C7KxPJkKdbgXMdo1KxZZFG
         fMnYczOuo2z+w66ZNU3bfe6r7yq6Fde1G9faJlDm9bk3S+yhQa3RQNXzshTFREsCNXe8
         lWAdW+earfFnrRH8YitZNA07mVZqiJndxrMT9+lqbxCISfoN0IwVS4ZHMAoVXR9YBGuf
         IubuA40EErwa/oDH3xCH3ODPCa+09CVO9ID+3ykNl3aYK79KPF6OYcgVYxWbJ1utWiUq
         lJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=R+SPOBXh2ZkkLG0ahTwSjC1WfDnJ9h6ZheP8kQZQ6+U=;
        b=y/rj9a7SEKwFvpoIfJw+3ERBb5uKgrcXK/n++ilOfp/Uapz8MLlVWdLKu3mXaiFP2R
         L1wjBUCBDZQWWNU/wIWliho8AKZEuHSiY02x4Ntj39pnQkcajag05C2v/FwmrQQpMNEV
         /ntoHu5xwpM6Gss4N4zhxNKbZ9C5LZmKdg2W6/mWYY8FVbkUVv6LZ6GekOI1BIwJB+YG
         8tN/q2yrVnqI4LIET1iv6h4Df1oe10lcdOMhT7im2IwO6DiNz1ZF4S09ttAwUjlVMpVn
         WSZRTQU3M2D/G/33JGJZDnx11rG9fdpYuOd3jePE6pVkirZFvMN35UEiKG6E27eR+Okm
         dGVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=csO5PEdO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i30-20020a0cab5e000000b0056bec3001dfsi100632qvb.412.2023.02.15.19.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 19:11:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=csO5PEdO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUeB-0007RZ-Ie; Wed, 15 Feb 2023 22:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe9-0007Q7-QN
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:21 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe8-0000Br-1C
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:21 -0500
Received: by mail-pf1-x436.google.com with SMTP id bd35so594168pfb.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+SPOBXh2ZkkLG0ahTwSjC1WfDnJ9h6ZheP8kQZQ6+U=;
 b=csO5PEdOROHao7KrXKV/e3e1//f8/dLtgAf5eaigquiYlDNIIlceNlHcTbTzGfgzPB
 dC0VsZbhRiwtfYTNJ7ithEaoSS44fu3p2vyUpH+RLl5pl+lzehs30QZOYfNO+eWFDCnf
 HTrXEQJDbcdayhRBLKxYSX8JXvthVZqUpuOQDqOmHRKTMlORaQHqeZ5dbujfOVdEh09y
 iJoyZxyntehlL4vIultaEVzIUHlqkQaRqEBScpFxuq7fBwAJEnzWJhcWpevAGYf3bNI/
 SQoZGIhLRQO3O6ciXcKuexZxXNSKdKVCB9DrJZuGIyI4S6lg4qpr74uJLNTIkqjZscga
 8oAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R+SPOBXh2ZkkLG0ahTwSjC1WfDnJ9h6ZheP8kQZQ6+U=;
 b=ejbURrq++O6WSI4GlOHdt/6KfN3pvPPn/D/nwe936HkEOBDdCTeXeeCwSevPly3Xib
 8hl76WwNoR/UjfKhWM9zCuH7x7nViR+c2FzGlifqEGi9B+zfLs0LCd0LN00JyEP4/W7j
 fedA7fGwz4uZt30zxWX+5invC8OuY5O2vdEnvuaQUH2Dc//OQBWyRvQwyzjH1yDh3qxI
 f4hZMHLByRwUv2bcya+XcDPad63dLmqlmWiYMFqT04hOz0+tDnPghVFwNKnaZWzVF/rl
 8vWzDtgmnYhrk1FjhDt1QMQQBCbxelcLgoiFptdCJjJlAis7ONIUWZhVtLfiMhGe/ozV
 kyWQ==
X-Gm-Message-State: AO0yUKVrPyUrDmNZDAou4EM9zQaXxfMMjyGVBojmZl6ns8KnLqTIQOVs
 t1w3AX6cqma6m3l1rMZeRj7oXTe4ftpetevB3C0=
X-Received: by 2002:aa7:94a9:0:b0:5a8:ae6a:cee1 with SMTP id
 a9-20020aa794a9000000b005a8ae6acee1mr3678294pfl.29.1676516958540; 
 Wed, 15 Feb 2023 19:09:18 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 14/19] target/arm: Check alignment in helper_mte_check
Date: Wed, 15 Feb 2023 17:08:49 -1000
Message-Id: <20230216030854.1212208-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: g10Gxfbhh77U

Fixes a bug in that with SCTLR.A set, we should raise any
alignment fault before raising any MTE check fault.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h     |  3 ++-
 target/arm/mte_helper.c    | 18 ++++++++++++++++++
 target/arm/translate-a64.c |  2 ++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e1e018da46..fa264e368c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1222,7 +1222,8 @@ FIELD(MTEDESC, MIDX,  0, 4)
 FIELD(MTEDESC, TBI,   4, 2)
 FIELD(MTEDESC, TCMA,  6, 2)
 FIELD(MTEDESC, WRITE, 8, 1)
-FIELD(MTEDESC, SIZEM1, 9, SIMD_DATA_BITS - 9)  /* size - 1 */
+FIELD(MTEDESC, ALIGN, 9, 3)
+FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - 12)  /* size - 1 */
 
 bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 98bcf59c22..e50bb4ea13 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -784,6 +784,24 @@ uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
 
 uint64_t HELPER(mte_check)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
+    /*
+     * In the Arm ARM pseudocode, the alignment check happens at the top
+     * of Mem[], while the MTE check happens later in AArch64.MemSingle[].
+     * Thus the alignment check has priority.
+     * When the mte check is disabled, tcg performs the alignment check
+     * during the code generated for the memory access.
+     */
+    unsigned align = FIELD_EX32(desc, MTEDESC, ALIGN);
+    if (unlikely(align)) {
+        align = (1u << align) - 1;
+        if (unlikely(ptr & align)) {
+            int idx = FIELD_EX32(desc, MTEDESC, MIDX);
+            bool w = FIELD_EX32(desc, MTEDESC, WRITE);
+            MMUAccessType type = w ? MMU_DATA_STORE : MMU_DATA_LOAD;
+            arm_cpu_do_unaligned_access(env_cpu(env), ptr, type, idx, GETPC());
+        }
+    }
+
     return mte_check(env, desc, ptr, GETPC());
 }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1117a1cc41..caeb91efa5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -267,6 +267,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ALIGN, get_alignment_bits(memop));
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, memop_size(memop) - 1);
 
         ret = new_tmp_a64(s);
@@ -298,6 +299,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ALIGN, get_alignment_bits(single_mop));
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
 
         ret = new_tmp_a64(s);
-- 
2.34.1

