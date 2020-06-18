Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1260469lfm;
        Wed, 17 Jun 2020 21:29:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHABYA9reKXmdc/ukv5b4/lg/lUqfnCh19s36SVNT63bo2R9hpeJ8kiQAHDusd9KipkeIW
X-Received: by 2002:a25:c304:: with SMTP id t4mr16975ybf.26.1592454555144;
        Wed, 17 Jun 2020 21:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592454555; cv=none;
        d=google.com; s=arc-20160816;
        b=MZ70CcAM5ytaJOVfSjtU5/y7g4bOOkVEIuxtCNdOgR+VXMDdXqSwTeafz01ubrbrxV
         zwWRddzAAPNR2DpZBkdGoh8mTgCGvrGc4XmJTQ7LGnzAKFWXje68aQTfnW/pT2BfCq//
         3/Tw9NFG+4u3yTYXAALyTm+3G5bd56DIhqd7ROr7AymMko8/Egj4BFpuaF0AAA0xzeb8
         WmrcKysuFR1U7hnpm5f+uEamxn486IkDRl+lNqpknLHwHnrs6cabOd4bHiubZ/w6NYqK
         EbbsNkFT6GnENXxL/PkKTVNdCS2ioKvari2+NnRtZP8Y5g1GgjtKXSLu5X98AZ9uKy52
         eYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YQT2lykC9j0XvNzXk1cacc8eLU/nCOsDG3gfH9CfOaw=;
        b=txzOgoK//03gmYgo1qVGr48Z0NS/nmtkhx2R2h7/7dADhFkS64MCIpn/tFmgWAqcE+
         f35cGR4rpMFyjlqBot6UYsZlxx+xCCsBx4XZFt9Msb1O/nRBbeZqNBi8txfBVD8LCr2y
         KaBpxBCOiJIiXzIcyOxL0IMB3zhaxxXFqN7foOiocb3gn4VZo1FgF0OPEguwc4EnyMdR
         rK4Pc1EQgFtjXIC3KtaMmZu0dWhhEPVbdRPkDICI2DGlKdz67vXXcuha/u3sbhQMIjD0
         XwGDvw07B9cXCsFl/rH1XnSG6UbbE5SCyZjwbcyqF7rUc2aFfhMxoepm74aEVuay4Ieu
         u5Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CSYU8Rr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q82si1509368ybc.377.2020.06.17.21.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CSYU8Rr4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmAs-00068w-Cw
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8i-0001yd-If
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:27:00 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8g-0002Ho-TJ
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:27:00 -0400
Received: by mail-pg1-x541.google.com with SMTP id h10so2319057pgq.10
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQT2lykC9j0XvNzXk1cacc8eLU/nCOsDG3gfH9CfOaw=;
 b=CSYU8Rr41A7Ji/+sJysXjdq6sahwavipxOLdglB/D186VXaz+DyAMdwtkYwVKfNkBe
 9rRcuOwpICyDnk9itl1h9jr0nL1DgzFhHxEk2pLYG3VAryE0IC5BaRnbeoqjPAXjQQnR
 NzrRPDeIVUlfTPw6mA3BHr7Hjs/Do8dFrm7sDZMgRD+tvwHzlGTWpxOaGaSGGyTa61yQ
 7+N1qfETL6IcsiOYa746jbbOrpEw5jmSMVs9VUiN6znNafRI8QziPKLokGY33DcXnnQb
 Q5oQn5AipHHwvJ5fcvmHBJCqX194enXumIlz1uokbrvrrKAnEjLnGvWlY6AA6aIpU1A5
 a2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQT2lykC9j0XvNzXk1cacc8eLU/nCOsDG3gfH9CfOaw=;
 b=AKnW+i4gkAXVpfJNXeGOWfgZZyzvKBzmIzbuWOLpeGqiYB/7pJF76Rn1h241JTO8WB
 PDKYXeIFOwv7hPNdimmOS1++EP1UNoKE+sN7vhulJaMWESfborgZha0k/D9cg8pwtY6m
 md8U944+UGm9+ZGgoHm0c+ujsFrQjL4wtVbsB3ixFpUm71oSof0StnRae3ZcLq7Z2ISL
 zXdySX1hBlqy3QCt5kwL88H5WxWD4QJhXqz0ymUZH4XsS2KtBdy0ISZdVT86/bLwWqAD
 kbfTseebOmjIuWPI3IUW5Wl4VgjvDIemTLlOuzPUCCmgb4JF2YaYV9PfgyWIopTTUW53
 u5UA==
X-Gm-Message-State: AOAM533JKuQzTFPrIMeWcHsDS9GC3bXrT6KdIRZz6eiDha3n7TQd4bwb
 a5B4xJZ+SakP8jMEcxJ7i8396g==
X-Received: by 2002:a63:f711:: with SMTP id x17mr1845839pgh.79.1592454417654; 
 Wed, 17 Jun 2020 21:26:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o16sm1162035pgg.57.2020.06.17.21.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:26:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 008/100] target/arm: Use tcg_gen_gvec_bitsel for
 trans_SEL_pppp
Date: Wed, 17 Jun 2020 21:25:12 -0700
Message-Id: <20200618042644.1685561-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NOzavU/Fa9aB

The gvec operation was added after the initial implementation
of the SEL instruction and was missed in the conversion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6d1a69c365..741f4d8b32 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1188,34 +1188,19 @@ static bool trans_EOR_pppp(DisasContext *s, arg_rprr_s *a)
     return do_pppp_flags(s, a, &op);
 }
 
-static void gen_sel_pg_i64(TCGv_i64 pd, TCGv_i64 pn, TCGv_i64 pm, TCGv_i64 pg)
-{
-    tcg_gen_and_i64(pn, pn, pg);
-    tcg_gen_andc_i64(pm, pm, pg);
-    tcg_gen_or_i64(pd, pn, pm);
-}
-
-static void gen_sel_pg_vec(unsigned vece, TCGv_vec pd, TCGv_vec pn,
-                           TCGv_vec pm, TCGv_vec pg)
-{
-    tcg_gen_and_vec(vece, pn, pn, pg);
-    tcg_gen_andc_vec(vece, pm, pm, pg);
-    tcg_gen_or_vec(vece, pd, pn, pm);
-}
-
 static bool trans_SEL_pppp(DisasContext *s, arg_rprr_s *a)
 {
-    static const GVecGen4 op = {
-        .fni8 = gen_sel_pg_i64,
-        .fniv = gen_sel_pg_vec,
-        .fno = gen_helper_sve_sel_pppp,
-        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
-    };
-
     if (a->s) {
         return false;
     }
-    return do_pppp_flags(s, a, &op);
+    if (sve_access_check(s)) {
+        unsigned psz = pred_gvec_reg_size(s);
+        tcg_gen_gvec_bitsel(MO_8, pred_full_reg_offset(s, a->rd),
+                            pred_full_reg_offset(s, a->pg),
+                            pred_full_reg_offset(s, a->rn),
+                            pred_full_reg_offset(s, a->rm), psz, psz);
+    }
+    return true;
 }
 
 static void gen_orr_pg_i64(TCGv_i64 pd, TCGv_i64 pn, TCGv_i64 pm, TCGv_i64 pg)
-- 
2.25.1

