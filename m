Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4029589lfm;
        Mon, 24 May 2021 18:28:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymbnuJCjyflBOI+VepBbSDA1tAn7ecAyo6rgHyxmnoDZOlbkBFBoKWzF18Qq3/wDFg9d3S
X-Received: by 2002:a92:c54a:: with SMTP id a10mr18333741ilj.140.1621906111308;
        Mon, 24 May 2021 18:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621906111; cv=none;
        d=google.com; s=arc-20160816;
        b=Wmnz2pxxnKFvj88KOs0xforljjEESR+WzfutcV/AXKo+i149Y5Nn4u90321tLsRiYs
         f9ZZHek/Ftq+WpSEG9k7WDlyMISs3dZ0u2wrq/PoQShVPOVldH5uUfvbGMK66+SOLMxM
         qUjb60qGA9v6RuvubFLfxAeixlRd6m+WDzMtE03wGvU+Y+r8stxJnttP9zw59HEzmxem
         YugVudX5kZBPMdAEU4AlLIr1HQVaJtTbzs+GKfzXtY3nafWRK46GwNSXem92pxwbAJnF
         zRZwA6sUn83iPoPtbDpJF+P2RmgTdYTB4W1sKScrDJ+axNA+8xA8Ny/X0YZQbhFbKxwe
         8E5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/gvD7a8f2BNOsA9JJLwFLYTrDJciHubXEtbSMNmmysw=;
        b=hCRzlRxYtuRQQnKZ1ktc59JtBO1pP2FYVqY/7GYP/kOWda/W5rLlU+evSYYZmiQZL4
         DMgLy8kRjBNrFMhhTLqJ5nlsut9Ha+cHmBkLp3cCdK2hfaD84zYsUTmX35rXue4ql8di
         gqqpSwbyyuoaXwQ24I3C+ZCFfZQIWMDRkDk9FyrG31QoAZWrgNraNfjHCTE/3vLPJPix
         y4dbtA8hvvb4YvSelijqVorueBmdWaYmcpLuG/nv01B1LBWAT7m3yxAm7T/PMn9jhJDZ
         bh8WaSlygt8DGiK4ucGAtdqgBKYrSYOuIkXWRSdNGLu6guBFz0V8ZBzvW6ITRJEVxUbT
         HZWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="oXCiNl0/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si17717270jat.35.2021.05.24.18.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="oXCiNl0/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLry-0005P0-Lj
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLV7-0002Fw-0G
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:53 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:47082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUZ-0001rx-TT
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:52 -0400
Received: by mail-pg1-x534.google.com with SMTP id m124so21379507pgm.13
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/gvD7a8f2BNOsA9JJLwFLYTrDJciHubXEtbSMNmmysw=;
 b=oXCiNl0/8NVueEswb4jgV0nkBTcU0a3QmZ4pibtx/uvEUD2rMtN7Z2o4AYQ1biBQlH
 87rlWrQTww9+I0RD9J8nYxHpQwmtp9nz0fce1KXNZzptZ5nEKeXrb7WU+98AvjoEzWEf
 Q0d3Krx/lU/Az+IVbiYoL6KfsONJqRj6cRj1YkqtB3dDDWnxp8CrWf1d3tGGe7iFErav
 aNSQxRmIZQFg1nP5NYHHvQNY8K1QjzzlZXHaKrecxW5tI476qPF/0eJu0IFSsmU4sp8m
 XHEz0jM539gL91TSsR1Aq9WKkkYmD+nebESGppli7lKd/7FGoTZoVn97LiThZiPODlL+
 lAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/gvD7a8f2BNOsA9JJLwFLYTrDJciHubXEtbSMNmmysw=;
 b=beyix75d6HAlZ8GjYl/RngLvP5g5Zpvgcxze8hrutcwntuZ+mSuZZrr/XZRG5+cTHq
 yPJ2RPG8Awds5QY46aBUqiDPSzIvLGOyM3qPbOq7v2EAVirAq9NSvZDs2NfbIxOoM3lM
 My57Ap3+MS7lDQPPNLuwIxaTgF2WoyBMETvVd5zTt80MlCDFFm2twe3s7YocYKug5gur
 ISO1E5pBr24/PCjUYlyAoJ6DRY5iESvkl3HNcl25sLuV5x/altVHs/+z40NFPSPhJ5Ef
 VhqlQRzYn/No72QAyCNZZBHIwnJqFIfKZ7ObDiuUxK8Wx3Na8nroJdXz/Ny1z1gTLSJb
 KKtw==
X-Gm-Message-State: AOAM531lSsjoT4Tvoc7uCabtWVNMZFHcH17lTx9lKFt6+QxhhPbGSQNT
 1GKJLA6HShn8ocKs+PNnfHm5Q5/ahDehYg==
X-Received: by 2002:a63:104a:: with SMTP id 10mr16326557pgq.66.1621904658524; 
 Mon, 24 May 2021 18:04:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 31/92] target/arm: Implement SVE2 WHILERW, WHILEWR
Date: Mon, 24 May 2021 18:02:57 -0700
Message-Id: <20210525010358.152808-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zk36/JDXkVzI

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix decodetree typo
v3: Fix iteration counts (zhiwei).
v4: Update for PREDDESC.
---
 target/arm/sve.decode      |  3 ++
 target/arm/translate-sve.c | 67 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index ae853d21f2..f365907518 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -702,6 +702,9 @@ CTERM           00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 # SVE integer compare scalar count and limit
 WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 lt:1 rn:5 eq:1 rd:4
 
+# SVE2 pointer conflict compare
+WHILE_ptr       00100101 esz:2 1 rm:5 001 100 rn:5 rw:1 rd:4
+
 ### SVE Integer Wide Immediate - Unpredicated Group
 
 # SVE broadcast floating-point immediate (unpredicated)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a55e747514..64aecc2db4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3218,6 +3218,73 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     return true;
 }
 
+static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
+{
+    TCGv_i64 op0, op1, diff, t1, tmax;
+    TCGv_i32 t2, t3;
+    TCGv_ptr ptr;
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned desc = 0;
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    op0 = read_cpu_reg(s, a->rn, 1);
+    op1 = read_cpu_reg(s, a->rm, 1);
+
+    tmax = tcg_const_i64(vsz);
+    diff = tcg_temp_new_i64();
+
+    if (a->rw) {
+        /* WHILERW */
+        /* diff = abs(op1 - op0), noting that op0/1 are unsigned. */
+        t1 = tcg_temp_new_i64();
+        tcg_gen_sub_i64(diff, op0, op1);
+        tcg_gen_sub_i64(t1, op1, op0);
+        tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, diff, t1);
+        tcg_temp_free_i64(t1);
+        /* Round down to a multiple of ESIZE.  */
+        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* If op1 == op0, diff == 0, and the condition is always true. */
+        tcg_gen_movcond_i64(TCG_COND_EQ, diff, op0, op1, tmax, diff);
+    } else {
+        /* WHILEWR */
+        tcg_gen_sub_i64(diff, op1, op0);
+        /* Round down to a multiple of ESIZE.  */
+        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* If op0 >= op1, diff <= 0, the condition is always true. */
+        tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, tmax, diff);
+    }
+
+    /* Bound to the maximum.  */
+    tcg_gen_umin_i64(diff, diff, tmax);
+    tcg_temp_free_i64(tmax);
+
+    /* Since we're bounded, pass as a 32-bit type.  */
+    t2 = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(t2, diff);
+    tcg_temp_free_i64(diff);
+
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
+    t3 = tcg_const_i32(desc);
+
+    ptr = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
+
+    gen_helper_sve_whilel(t2, ptr, t2, t3);
+    do_pred_flags(t2);
+
+    tcg_temp_free_ptr(ptr);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+    return true;
+}
+
 /*
  *** SVE Integer Wide Immediate - Unpredicated Group
  */
-- 
2.25.1

