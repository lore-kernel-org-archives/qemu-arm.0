Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6574837ejq;
        Mon, 15 May 2023 08:03:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tjCQ+GGvZcc4eFSMiZ747Rh1J4bl1OEnpVQRVhPaKZtKJ3vFPhJ9ny4tPV8ZZYYT/W+ca
X-Received: by 2002:a1c:f209:0:b0:3f1:92aa:4eb8 with SMTP id s9-20020a1cf209000000b003f192aa4eb8mr22569947wmc.16.1684163036061;
        Mon, 15 May 2023 08:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684163036; cv=none;
        d=google.com; s=arc-20160816;
        b=NvTv1gUALCCLKebfvczO1J7UyblJiTMRVQQJZjwA35UG1Plc4EW9bg0AfEwGRE9bdq
         0nxaVMdEb4duU+y4jd81Iwu01bn5fTH5PSQw1KCDBdGaKOwWj5S/blLeAMNURXmztipx
         8HUe501FiZwzkRJBM2FFc/TtPhaHPJ+CuihPFAnAyI4jYdZQU5mU3sjSUgN1ozhps+iP
         J+Ba5cRRY/8ettYhOLmI3un4TFg7gelZgcoSzeNDa5kiu+YlvZ3TSqH8XjHJnMJpv9dd
         Y7XP34EjhfAIaS6tb8XaGdRXb96rNYjWzPrr8Ac+WByUNgk5zwa7b6eRRgmqTe80rydn
         OlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kNGmF8W7v6Sxbzk1GnBwY+ErFtp6C+F1QfXFPbibcyI=;
        b=OJJDY9/IUT+wXMNDeBmEjjOTNhybhKVAqG1/DIUTHe28rGYrwKRTAL51qlPBg/gP22
         PDHG7t/qBx7uFt0y+BcBHM1qmxapqFxNqQ5w4eelzqVz1J0ktAKLaDzzX9ZTjqTUHwwK
         lvr86FtbMEhMTps3yXn3v1gNef5XvyHADRD+/3yvM6Mh7br6CKDvZ5+YVxkQlcVqFZRo
         tTSAQBvXfAl438V+RG/s5biOEBMbFfZsq1/RIH+84xnIFxFDymvujuYvaRuFusVuOqgP
         5v7aYP9Ar6KM4A5xV5Cy99Xle2jP9dt05IugYH4JH9FH1LaZMnCXo1Q5NbwuPL5m4n1q
         0ecQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eQt0RcAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020a5d660a000000b003073c30b0cdsi15009wru.457.2023.05.15.08.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:03:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eQt0RcAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZIy-0002EW-7K; Mon, 15 May 2023 10:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHc-00077u-RP
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHY-00053V-2y
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:38 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ab032d9266so118754595ad.0
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161226; x=1686753226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNGmF8W7v6Sxbzk1GnBwY+ErFtp6C+F1QfXFPbibcyI=;
 b=eQt0RcAWhzyW2Wopvg07MsRwJi1ZEuf6nPyHHDqUfCSAcNYMq2343bqW2PeRl1uKlz
 m8QY53+nzWBJCub/B6y2gc5xJfl773zXd1YE8mgSqhG+DmuhuMK8gSXnOjvJojvAevMp
 i6QUhrwpQRIFgVKtkdMpRRrMzG/ossiX/eist+TN1WV4Qn9Jl6I+FFRIvI5XFx3l5+0K
 q4DaEjHHok+EtMSr/WvlDbyY6JImSnh7II8Rx9/cOkdIhFTHgkA6YnNIHnRNLdhCKoWE
 bVuxfEb7TzQUPmbYLY+SaaZSltbXkSOQwFO+GnNAhIazJI8sXCK9EqF6rZTddth+SYXi
 JRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161226; x=1686753226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNGmF8W7v6Sxbzk1GnBwY+ErFtp6C+F1QfXFPbibcyI=;
 b=AL7txlpfXfivKlahqSgEeM3pBgyGFtorJ6sbgszoTwc7af9e2y7OlXLH5dOaDuF6B2
 S9azmt+QGHK9/dXH3mpJOIZwp0LqBror0t5p57y+iaqFT/mJ6fZRMY8qo/i/B473ZPNs
 1M//hBFcpt6mqO5WEyYm5dZUKXx+meTCUyXFmaw6StM/TR9zdnBDH+9ZGSs3b14Xjb8Q
 +3kr0FnPb8YbtIHic3ho6+l8NZK6NCqFgNTPS+KLnZfjIVBal54ffMZhpizpI/Sb97Wd
 R99kNP95Dpb+CvhnO3QezHxAnBTKVQ+11Aw89Twz/9BtH5Gd4l+8FqHdeb+lxfXM9gDP
 NOhQ==
X-Gm-Message-State: AC+VfDzAGRmIfLsJ3Gf7sp80GnZDpwe2/z1OK0vjvM9p1Hb3u7ZbbAio
 gXKYpTf6baTitAlD49D+ht1rjKxTtrpbm73Kuqo=
X-Received: by 2002:a17:902:c94b:b0:1ab:14f2:e7e6 with SMTP id
 i11-20020a170902c94b00b001ab14f2e7e6mr42088614pla.65.1684161226395; 
 Mon, 15 May 2023 07:33:46 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 37/54] tcg: Merge tcg_out_helper_load_regs into caller
Date: Mon, 15 May 2023 07:32:56 -0700
Message-Id: <20230515143313.734053-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d6NXnKdiPZr/

Now that tcg_out_helper_load_regs is not recursive, we can
merge it into its only caller, tcg_out_helper_load_slots.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 89 +++++++++++++++++++++++++------------------------------
 1 file changed, 41 insertions(+), 48 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8688248284..ff7aec23e7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -5223,12 +5223,50 @@ static int tcg_out_helper_stk_ofs(TCGType type, unsigned slot)
     return ofs;
 }
 
-static void tcg_out_helper_load_regs(TCGContext *s,
-                                     unsigned nmov, TCGMovExtend *mov,
-                                     const TCGLdstHelperParam *parm)
+static void tcg_out_helper_load_slots(TCGContext *s,
+                                      unsigned nmov, TCGMovExtend *mov,
+                                      const TCGLdstHelperParam *parm)
 {
+    unsigned i;
     TCGReg dst3;
 
+    /*
+     * Start from the end, storing to the stack first.
+     * This frees those registers, so we need not consider overlap.
+     */
+    for (i = nmov; i-- > 0; ) {
+        unsigned slot = mov[i].dst;
+
+        if (arg_slot_reg_p(slot)) {
+            goto found_reg;
+        }
+
+        TCGReg src = mov[i].src;
+        TCGType dst_type = mov[i].dst_type;
+        MemOp dst_mo = dst_type == TCG_TYPE_I32 ? MO_32 : MO_64;
+
+        /* The argument is going onto the stack; extend into scratch. */
+        if ((mov[i].src_ext & MO_SIZE) != dst_mo) {
+            tcg_debug_assert(parm->ntmp != 0);
+            mov[i].dst = src = parm->tmp[0];
+            tcg_out_movext1(s, &mov[i]);
+        }
+
+        tcg_out_st(s, dst_type, src, TCG_REG_CALL_STACK,
+                   tcg_out_helper_stk_ofs(dst_type, slot));
+    }
+    return;
+
+ found_reg:
+    /*
+     * The remaining arguments are in registers.
+     * Convert slot numbers to argument registers.
+     */
+    nmov = i + 1;
+    for (i = 0; i < nmov; ++i) {
+        mov[i].dst = tcg_target_call_iarg_regs[mov[i].dst];
+    }
+
     switch (nmov) {
     case 4:
         /* The backend must have provided enough temps for the worst case. */
@@ -5269,51 +5307,6 @@ static void tcg_out_helper_load_regs(TCGContext *s,
     }
 }
 
-static void tcg_out_helper_load_slots(TCGContext *s,
-                                      unsigned nmov, TCGMovExtend *mov,
-                                      const TCGLdstHelperParam *parm)
-{
-    unsigned i;
-
-    /*
-     * Start from the end, storing to the stack first.
-     * This frees those registers, so we need not consider overlap.
-     */
-    for (i = nmov; i-- > 0; ) {
-        unsigned slot = mov[i].dst;
-
-        if (arg_slot_reg_p(slot)) {
-            goto found_reg;
-        }
-
-        TCGReg src = mov[i].src;
-        TCGType dst_type = mov[i].dst_type;
-        MemOp dst_mo = dst_type == TCG_TYPE_I32 ? MO_32 : MO_64;
-
-        /* The argument is going onto the stack; extend into scratch. */
-        if ((mov[i].src_ext & MO_SIZE) != dst_mo) {
-            tcg_debug_assert(parm->ntmp != 0);
-            mov[i].dst = src = parm->tmp[0];
-            tcg_out_movext1(s, &mov[i]);
-        }
-
-        tcg_out_st(s, dst_type, src, TCG_REG_CALL_STACK,
-                   tcg_out_helper_stk_ofs(dst_type, slot));
-    }
-    return;
-
- found_reg:
-    /*
-     * The remaining arguments are in registers.
-     * Convert slot numbers to argument registers.
-     */
-    nmov = i + 1;
-    for (i = 0; i < nmov; ++i) {
-        mov[i].dst = tcg_target_call_iarg_regs[mov[i].dst];
-    }
-    tcg_out_helper_load_regs(s, nmov, mov, parm);
-}
-
 static void tcg_out_helper_load_imm(TCGContext *s, unsigned slot,
                                     TCGType type, tcg_target_long imm,
                                     const TCGLdstHelperParam *parm)
-- 
2.34.1

