Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4842380ejq;
        Fri, 12 May 2023 07:42:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7tYWfg3NfMKcfA+sCzjoieZySXKjTwPEA7Mc7MjI6Zkb35nDbuc/1GmBqAAJbvZX/VAWTx
X-Received: by 2002:ac8:5a0d:0:b0:3f3:640b:48b0 with SMTP id n13-20020ac85a0d000000b003f3640b48b0mr38853787qta.47.1683902565164;
        Fri, 12 May 2023 07:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683902565; cv=none;
        d=google.com; s=arc-20160816;
        b=izfB+s7BoldvPQt6H00r1WmjYHK/MjP3eq+6tCSU51GdVUWP6uxnoWaQk+In9S+3ME
         dEQopT0KvVPfiANK471Eg3258LnNR5/36qUXki5pa1H8r6cKDDXeUL6Q6shNqJb4Id7T
         L5UKlkffnWWNh1LYzQ0qn5NeZPK08wyLCfoQ6vQbiCJBb7+6+ISGeKLWVQsA+S1XCqNS
         OUZrhe6kKsmKPkD5V7BX+wNBOzm6tFSFYOHZhCT8xACbA15O04Ht7J5dWjiTlqmw+lyY
         rk6zhggcFSVCbffww4JiVDwg7lOl1eqvvmNIy0XoEFfISt8t8rSnXCKd8IoQpO1KBFJY
         G4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7akZCgLrkYKZD7/0pb1eqcMpMk4KlEV9ol5sKLINuho=;
        b=M2pWSj9XKTE8os0lKykMCIy3D6abxe+1bYexsGuH5etA9rphyDRNudvBlVaKHUCGwN
         7D8F2b4Ol+O8NDKa0gSPkYqGvCm83oCI7/moEzJz3yZOKP391jX7xvER4DmJ/UwbnqEM
         p78WtkG6qoesXq6kYlFU/h+1sxLv9m3lA05+JiD0zUSnWVphbg2OeYCQBWHngnYjubk4
         E8iDSuejC5+rR50itQ8Iuu3SeerVnWVyI9TgLCPjms0mCf51DNnmjCPTBWBXFOCnfzOB
         Sz4MA5du3Z0hjL9redQGoxc1ToM+CwCS7cp5nDDQH7HgKS212asifQ/WNB0Rt/NsOQTt
         8grA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4Bit7qz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020a05620a110800b0074df5455b37si4415658qkk.217.2023.05.12.07.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4Bit7qz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxTxp-0007Nq-6X; Fri, 12 May 2023 10:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxo-0007Mq-59
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:44 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxN-0004kW-Oi
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:41:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f435658d23so39602385e9.3
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902476; x=1686494476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7akZCgLrkYKZD7/0pb1eqcMpMk4KlEV9ol5sKLINuho=;
 b=S4Bit7qzbXrjHGHTQyzbgMvLjId/Yfp3+3xhmGJkAAZt3e1JLcUPST27Zx5365U4B9
 TNVGgDwDUsRnt4BdKXNTWTadhJWvt6FYixZRGwO0aI7bYuZcVJeFMfqIWJHrUczxz38n
 ljEq2uidVHv+Yx23P+oppeZOg3T1ze2a/nadwchcGwWjW5fHhO+y8VmMX1+gcTGUnroq
 sXa9PBS8UMjVMO/Am8YsWaMAUpH5DVJgP1+zbXzyH2rNyVxoQhC+33aIf7a7ByroZDz/
 AI3QWUGaTaZjIsdPfBfXuoNIbudA/PUXIq1+H8Gyw50hzl7FRffWy95K67zq6lk+8lRO
 HNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902476; x=1686494476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7akZCgLrkYKZD7/0pb1eqcMpMk4KlEV9ol5sKLINuho=;
 b=FHvscI6b27DduUuTwrECIyP+UuW9SWr1pArbnHU7VpnT9o+XjKBF+bSkJYzSNMKToD
 ir2FxZxMVKRdv2bVy1qnAPY1zdnopcpxxcBiZkwVpD/vqV0CweHXwRb1QJB3siHEW00z
 bXzCkQ2YFGbWBa/QK5iPynszb24FTcKF1puawG41pAZtgTjkA1Ynq1qerg17c57RXlf+
 8pYdOPcDLjgHvFaTztvig1hFFg2NQefnDJnXEbQ6w3N7631R+IHShxPOUcTHjnPiBsty
 RUnk2Ip9gy7Bvu4UJaWQnMkVxjFUnlnLafqgWByHMi6HTHKnBrSwOK49FGzEa+Ks+w9V
 IiUg==
X-Gm-Message-State: AC+VfDzefAIttweUYSPA87DKXXQQ4E2kG0Pdmz6TYTa05dViWxSjWZQR
 jcTXXRTFe3d8J+6SHILgBAw6F/kk2BndtLqaBu8=
X-Received: by 2002:a7b:cb46:0:b0:3f1:82a1:122 with SMTP id
 v6-20020a7bcb46000000b003f182a10122mr17709755wmj.21.1683902476493; 
 Fri, 12 May 2023 07:41:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 17/20] target/arm: Convert BR, BLR, RET to decodetree
Date: Fri, 12 May 2023 15:41:03 +0100
Message-Id: <20230512144106.3608981-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: B5Vc2En9XiGa

Convert the simple (non-pointer-auth) BR, BLR and RET insns
to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/a64.decode      |  5 ++++
 target/arm/tcg/translate-a64.c | 55 ++++++++++++++++++++++++++++++----
 2 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 8514235a723..aa035f39558 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -19,6 +19,7 @@
 # This file is processed by scripts/decodetree.py
 #
 
+&r               rn
 &ri              rd imm
 &rri_sf          rd rn imm sf
 &i               imm
@@ -130,3 +131,7 @@ CBZ             . 011010 . ................... ..... @cbz
 TBZ             . 011011 . ..... .............. ..... @tbz
 
 B_cond          0101010 0 ................... 0 cond:4 imm=%imm19
+
+BR              1101011 0000 11111 000000 rn:5 00000 &r
+BLR             1101011 0001 11111 000000 rn:5 00000 &r
+RET             1101011 0010 11111 000000 rn:5 00000 &r
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 724dca8c579..853a01ac5be 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1388,6 +1388,53 @@ static bool trans_B_cond(DisasContext *s, arg_B_cond *a)
     return true;
 }
 
+static void set_btype_for_br(DisasContext *s, int rn)
+{
+    if (dc_isar_feature(aa64_bti, s)) {
+        /* BR to {x16,x17} or !guard -> 1, else 3.  */
+        set_btype(s, rn == 16 || rn == 17 || !s->guarded_page ? 1 : 3);
+    }
+}
+
+static void set_btype_for_blr(DisasContext *s)
+{
+    if (dc_isar_feature(aa64_bti, s)) {
+        /* BLR sets BTYPE to 2, regardless of source guarded page.  */
+        set_btype(s, 2);
+    }
+}
+
+static bool trans_BR(DisasContext *s, arg_r *a)
+{
+    gen_a64_set_pc(s, cpu_reg(s, a->rn));
+    set_btype_for_br(s, a->rn);
+    s->base.is_jmp = DISAS_JUMP;
+    return true;
+}
+
+static bool trans_BLR(DisasContext *s, arg_r *a)
+{
+    TCGv_i64 dst = cpu_reg(s, a->rn);
+    TCGv_i64 lr = cpu_reg(s, 30);
+    if (dst == lr) {
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        tcg_gen_mov_i64(tmp, dst);
+        dst = tmp;
+    }
+    gen_pc_plus_diff(s, lr, curr_insn_len(s));
+    gen_a64_set_pc(s, dst);
+    set_btype_for_blr(s);
+    s->base.is_jmp = DISAS_JUMP;
+    return true;
+}
+
+static bool trans_RET(DisasContext *s, arg_r *a)
+{
+    gen_a64_set_pc(s, cpu_reg(s, a->rn));
+    s->base.is_jmp = DISAS_JUMP;
+    return true;
+}
+
 /* HINT instruction group, including various allocated HINTs */
 static void handle_hint(DisasContext *s, uint32_t insn,
                         unsigned int op1, unsigned int op2, unsigned int crm)
@@ -2186,12 +2233,8 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         btype_mod = opc;
         switch (op3) {
         case 0:
-            /* BR, BLR, RET */
-            if (op4 != 0) {
-                goto do_unallocated;
-            }
-            dst = cpu_reg(s, rn);
-            break;
+            /* BR, BLR, RET : handled in decodetree */
+            goto do_unallocated;
 
         case 2:
         case 3:
-- 
2.34.1

