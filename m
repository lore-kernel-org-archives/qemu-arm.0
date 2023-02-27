Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4290321ejc;
        Sun, 26 Feb 2023 21:31:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8OF+LbTIdiXHQWHgktVMBTjLWYXrFUAMH5hIhlQUhPMWvkez2XI98jB7CG0SH+ztCSlmoN
X-Received: by 2002:a05:6214:5011:b0:56e:b427:819b with SMTP id jo17-20020a056214501100b0056eb427819bmr41940264qvb.16.1677475862755;
        Sun, 26 Feb 2023 21:31:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475862; cv=none;
        d=google.com; s=arc-20160816;
        b=yeXkzAUht6BOr/657AxWxLm3Z3XhBzGgEzjzQGoztQ3zhlUjvk6GXmJGQkK8NXzaST
         TWGFLO8No76t/ZJHVRfkp8mPi4n2VbxmRH+H2KVJOsjya6qrd7RYmEfFJjNoG0db9v5Q
         cid0k5DUSDxuNSkE8bsIQ49SxPDEhnNFv//n6ZSPxP2vw3WLj1dOqbGcPS+5tyxi0F6Q
         VGsZBhCJnPmIwvYmGSH+nGeA2UJ2UX02spQNLSEuWGKUbi2PEjns7n7oPTfe5ECZNFzx
         yVFkeeC1407/H3+YgzhtSUlcK5THxkhCW7SHSn44wSWK7Euz4Vbg2rItnn6kzUO6YIho
         Uvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PZT9JzGqWNeNM4srg9HjjFaakIhKs3s8GuAgd6TYYaQ=;
        b=VVIjQyJfXEj/cnkVvei5q40BWlZ6PJiAIAnbpVn9J7Vn//jkvAdWs23a2CIvBb933r
         dXI5gztbTes0N1mAkE5W22JcK2sw03GAqxG7NfzWG0SG/z0XsMiHMciYvHGlvQPo353N
         8YXLJzcRcyZpTCHjynprw7xNzMrnYJZbULscrif30gxkhAOSKYiPPYRMOEbRDC5hglWf
         rZ3740sL71Igm1zZEzrCPUYSkF9yToZAhblYC0dlzFjbzQlmz9mndP2c3KK3/nkLTgVb
         UV+9nvo/bZ0V8YxC1uKeo86m7RCPJgSTZLx+X1CE9/HRr6sGUcWVFCdkPJ4l1tSVahTL
         WDYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qbim//ou";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020a0ce209000000b005376d8a8e5asi5382278qvl.433.2023.02.26.21.31.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:31:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qbim//ou";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW2a-0001qS-Vc; Mon, 27 Feb 2023 00:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW29-0000GP-3h
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:26:48 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW26-0007v4-3i
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:26:44 -0500
Received: by mail-pl1-x631.google.com with SMTP id n6so4146294plf.5
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PZT9JzGqWNeNM4srg9HjjFaakIhKs3s8GuAgd6TYYaQ=;
 b=Qbim//oujTqfuRONSlXfVji0kPeSbYsrURvV2V1SdFx6VOZI072Gn1sITztlpn3mUU
 h/smZopUdtRDzE7vhzzjBy76s583oiaolQGN2r9Q9cdsiCAQDSEZsE1nB4nTTZVgkBGr
 /FfCBKOPUuCq7GjJDeNvcY2gzeZN1NbVuVGZgP1yjOIKmWzNHAijpYjS8exHoion3e4K
 6js0cghUQSAsk6ffHPfhGJZsJnG7LRcIn8Mj5hSGudRl+U1S+RNzZweAfwSofVxpgCSN
 B7muJGwMCmaMG5mxa5b2XYJ5QwfR8OlXKYzC5IptNuymvl2YEze0YoCg33yoR9qsnKi0
 g70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PZT9JzGqWNeNM4srg9HjjFaakIhKs3s8GuAgd6TYYaQ=;
 b=vP/SHYocA81j8k8NDX7INVbC+TlmwhfjOhI26y260ZEEE/WCKvd8aN2y5UrVH9n2ew
 HAFx3trBp+EuTU804d3tRNBOvL8gQWWrGtSHmIEWY/O7MoYXD+Yb5kfdhO7sQgvT1STE
 D9VVNKjPdvnJ6wjaodp6K4LuXEdBBB2jqsu6VmPDVJsIl0/1f/ALFVRcFAUHRvBqv3+4
 IRMUPQzjhvPPpu/GcMu8BHQL5jQcUMTkZSax6OIT1Negw4U/HMJVdA/Z58SueE9wCGf6
 0KndGhcx+3BuJp+PKRB20pV5+u72FjR1JYKrJJOeUHdlFciZOY7R1mKmodD38q8H/ng2
 Tuaw==
X-Gm-Message-State: AO0yUKVuRfKSw34dDmDyZHbtLM3YO0941dhu95Mon78mXymOR1/Y7sn/
 tQFykyVIY0IUUB3ebsfNxVeDcA==
X-Received: by 2002:a17:902:dace:b0:19d:c9f:44f3 with SMTP id
 q14-20020a170902dace00b0019d0c9f44f3mr3452349plx.21.1677475600708; 
 Sun, 26 Feb 2023 21:26:40 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 33/76] target/m68k: Drop mark_to_release
Date: Sun, 26 Feb 2023 19:24:22 -1000
Message-Id: <20230227052505.352889-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /if9JFYO3e1Y

Translators are no longer required to free tcg temporaries,
therefore there's no need to record temps for later freeing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 55 ++++++++++-------------------------------
 1 file changed, 13 insertions(+), 42 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 157c2cbb8f..b3cd3e87e1 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -121,35 +121,9 @@ typedef struct DisasContext {
     int done_mac;
     int writeback_mask;
     TCGv writeback[8];
-#define MAX_TO_RELEASE 8
-    int release_count;
-    TCGv release[MAX_TO_RELEASE];
     bool ss_active;
 } DisasContext;
 
-static void init_release_array(DisasContext *s)
-{
-#ifdef CONFIG_DEBUG_TCG
-    memset(s->release, 0, sizeof(s->release));
-#endif
-    s->release_count = 0;
-}
-
-static void do_release(DisasContext *s)
-{
-    int i;
-    for (i = 0; i < s->release_count; i++) {
-        tcg_temp_free(s->release[i]);
-    }
-    init_release_array(s);
-}
-
-static TCGv mark_to_release(DisasContext *s, TCGv tmp)
-{
-    g_assert(s->release_count < MAX_TO_RELEASE);
-    return s->release[s->release_count++] = tmp;
-}
-
 static TCGv get_areg(DisasContext *s, unsigned regno)
 {
     if (s->writeback_mask & (1 << regno)) {
@@ -396,8 +370,7 @@ static TCGv gen_ldst(DisasContext *s, int opsize, TCGv addr, TCGv val,
         gen_store(s, opsize, addr, val, index);
         return store_dummy;
     } else {
-        return mark_to_release(s, gen_load(s, opsize, addr,
-                                           what == EA_LOADS, index));
+        return gen_load(s, opsize, addr, what == EA_LOADS, index);
     }
 }
 
@@ -491,7 +464,7 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
         } else {
             bd = 0;
         }
-        tmp = mark_to_release(s, tcg_temp_new());
+        tmp = tcg_temp_new();
         if ((ext & 0x44) == 0) {
             /* pre-index */
             add = gen_addr_index(s, ext, tmp);
@@ -501,7 +474,7 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
         if ((ext & 0x80) == 0) {
             /* base not suppressed */
             if (IS_NULL_QREG(base)) {
-                base = mark_to_release(s, tcg_const_i32(offset + bd));
+                base = tcg_const_i32(offset + bd);
                 bd = 0;
             }
             if (!IS_NULL_QREG(add)) {
@@ -517,11 +490,11 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
                 add = tmp;
             }
         } else {
-            add = mark_to_release(s, tcg_const_i32(bd));
+            add = tcg_const_i32(bd);
         }
         if ((ext & 3) != 0) {
             /* memory indirect */
-            base = mark_to_release(s, gen_load(s, OS_LONG, add, 0, IS_USER(s)));
+            base = gen_load(s, OS_LONG, add, 0, IS_USER(s));
             if ((ext & 0x44) == 4) {
                 add = gen_addr_index(s, ext, tmp);
                 tcg_gen_add_i32(tmp, add, base);
@@ -546,7 +519,7 @@ static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
         }
     } else {
         /* brief extension word format */
-        tmp = mark_to_release(s, tcg_temp_new());
+        tmp = tcg_temp_new();
         add = gen_addr_index(s, ext, tmp);
         if (!IS_NULL_QREG(base)) {
             tcg_gen_add_i32(tmp, add, base);
@@ -676,7 +649,7 @@ static inline TCGv gen_extend(DisasContext *s, TCGv val, int opsize, int sign)
     if (opsize == OS_LONG) {
         tmp = val;
     } else {
-        tmp = mark_to_release(s, tcg_temp_new());
+        tmp = tcg_temp_new();
         gen_ext(tmp, val, opsize, sign);
     }
 
@@ -802,7 +775,7 @@ static TCGv gen_lea_mode(CPUM68KState *env, DisasContext *s,
             return NULL_QREG;
         }
         reg = get_areg(s, reg0);
-        tmp = mark_to_release(s, tcg_temp_new());
+        tmp = tcg_temp_new();
         if (reg0 == 7 && opsize == OS_BYTE &&
             m68k_feature(s->env, M68K_FEATURE_M68K)) {
             tcg_gen_subi_i32(tmp, reg, 2);
@@ -812,7 +785,7 @@ static TCGv gen_lea_mode(CPUM68KState *env, DisasContext *s,
         return tmp;
     case 5: /* Indirect displacement.  */
         reg = get_areg(s, reg0);
-        tmp = mark_to_release(s, tcg_temp_new());
+        tmp = tcg_temp_new();
         ext = read_im16(env, s);
         tcg_gen_addi_i32(tmp, reg, (int16_t)ext);
         return tmp;
@@ -823,14 +796,14 @@ static TCGv gen_lea_mode(CPUM68KState *env, DisasContext *s,
         switch (reg0) {
         case 0: /* Absolute short.  */
             offset = (int16_t)read_im16(env, s);
-            return mark_to_release(s, tcg_const_i32(offset));
+            return tcg_const_i32(offset);
         case 1: /* Absolute long.  */
             offset = read_im32(env, s);
-            return mark_to_release(s, tcg_const_i32(offset));
+            return tcg_const_i32(offset);
         case 2: /* pc displacement  */
             offset = s->pc;
             offset += (int16_t)read_im16(env, s);
-            return mark_to_release(s, tcg_const_i32(offset));
+            return tcg_const_i32(offset);
         case 3: /* pc index+displacement.  */
             return gen_lea_indexed(env, s, NULL_QREG);
         case 4: /* Immediate.  */
@@ -958,7 +931,7 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
             default:
                 g_assert_not_reached();
             }
-            return mark_to_release(s, tcg_const_i32(offset));
+            return tcg_const_i32(offset);
         default:
             return NULL_QREG;
         }
@@ -6287,7 +6260,6 @@ static void m68k_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cc_op_synced = 1;
     dc->done_mac = 0;
     dc->writeback_mask = 0;
-    init_release_array(dc);
 
     dc->ss_active = (M68K_SR_TRACE(env->sr) == M68K_SR_TRACE_ANY_INS);
     /* If architectural single step active, limit to 1 */
@@ -6314,7 +6286,6 @@ static void m68k_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
     opcode_table[insn](env, dc, insn);
     do_writebacks(dc);
-    do_release(dc);
 
     dc->pc_prev = dc->base.pc_next;
     dc->base.pc_next = dc->pc;
-- 
2.34.1

