Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp371866lfu;
        Tue, 26 Apr 2022 09:56:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/zPJTefXQAtkU+eXhjDm/BUPqicNl6IN41d3JDZtmh/oV8+Rxto5FmVl4uXKvUgRCLAqb
X-Received: by 2002:a25:bb0f:0:b0:61d:60f9:aaf9 with SMTP id z15-20020a25bb0f000000b0061d60f9aaf9mr20816892ybg.199.1650992207494;
        Tue, 26 Apr 2022 09:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650992207; cv=none;
        d=google.com; s=arc-20160816;
        b=J93G0VBcVGdXGVot3EhOFinD2SoGqQ+mUVZaUl6jyHbANGalGCU0Crx3xFTzKWWSWh
         iASgu2hVtq6+0m0dTuoV5FI0SMBGNH1ppUNg4r+hzNhAW7tsqhRvXnq/vdnZJByRSUpA
         heQJraNj86cXIJJvuprNDBjrlrqylK3Nfuh2ahJPrhF0wEX2n9ui4Sg1m2tOkRGFIZTf
         i+7PW8fjGA/0tIds5qfeQLbDO3ttYAhShwtg7E4gG80pwNgPn1mZHZDXMJkq6e2wIbr1
         nrpJ70Alxmu+/S4n/gj00/QP1fr5L2MKb4aykCBuX3iY1G/KFwmMIxax6n4Ta1Nwt2wV
         bGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lbs3KJK7K3c2itFwMrF6zlwFkUuhQKPhP0rTJMiuIOk=;
        b=vIche2WB6leFq4rmvlRdQvWNVgZiXIFiOtCeQG/iqJHUENQrHJYLzCv9clOAi2Sx5o
         eW7/gxLc9SXaeVpIeveJSDAWNNUW0wUVHuANUfy+Lq9ViDo1qR4oB9KseWhmdiIdofJD
         kasos4qkn/QixmI0anr/t5GNHJRbr3zqcZlZ6d4Xg+5XUZCELFcEmfeeNpg8FIIAJ5DN
         deMyAugQzl7tdGPEJsjUyX3dRsqSKk50LP4oD8bESZ7qsyXSIbWX0b3iO5gcEe/Dx0r7
         rkzOKDxcmIhMb5RBWyVyTujcx7r4MVkiURa0AbsUbWhhGbyGotDpVamAIHe2P8a9wEfx
         Csvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rma344yO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a250108000000b00648a5e01769si2330592ybb.277.2022.04.26.09.56.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:56:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rma344yO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOUY-0003An-Qx
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO62-0003B5-1p
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:39 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-0003yK-5U
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:25 -0400
Received: by mail-pf1-x42a.google.com with SMTP id t13so4794713pfg.2
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lbs3KJK7K3c2itFwMrF6zlwFkUuhQKPhP0rTJMiuIOk=;
 b=Rma344yO0AWoZRqmX1snpseo0Dj3xLhpKcDEcV7812Z9WuQxH8OpfqKYsXs2HYnmbL
 A1zvRuTqbl/KqpUlAtF2iQD5z0zDfWFH6e4O6zLBEG48OTXLfDcvD+SSDmDsObUBEgQj
 xe3WMwHdx4/BPki0xxfMRVDftXIXquje9w/o4QMUBtZWDJq0n0TORQ11zbhFh5PrTrYE
 aUqcahEaC+YOgJwZqDlODT0z1BFHZZkY2wly6beOuu+P7oqmHS+Z4H1kT+8bgmviTRlC
 WtaD7I9tDQCYJ/t5/kDCo4DMl2UHbQCMzsbv1rrU0WX2RyYXN8zvkduoH8WJTKiGGv2B
 TdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lbs3KJK7K3c2itFwMrF6zlwFkUuhQKPhP0rTJMiuIOk=;
 b=FK+4vvOKTBt+ymVEueAQsaYN1bSNq0LvRNhh/tkhE4lwQb9FezTOlQUwLJT3Vp9cgE
 swMopEaLs+BmLBK/xlSQ02JksJd9ToQL5RC0DS4eDU/I00j6bp8mZ4Nhqq/XenPKDI5p
 x9r4bFObTOBPykJ7xYZKOd3kazAA45p2z8osA709ZnN9Hvz1Rl4laNTnWnPVRyOdAVMW
 c1WYeUkMbygU5oajAuJthKQqH40QH4a3/KijTaMvDXsMO+RYY1ElCRta/LnwzkstZI5u
 8NOQXep1j8O9U27cz/dKWrXCyXz7gKZC2xB286UQh/TEhnYp0z72eb4NHAs8KXeiPZAT
 0sYA==
X-Gm-Message-State: AOAM530N/p5rvIF2uFUdkSEN/HEmNmpgNPhdRTwTR5iBbfV/g2vB/qh4
 IunPLkMCzj05NINDkI2Y2BfOqA==
X-Received: by 2002:a05:6a00:198c:b0:505:c18b:3184 with SMTP id
 d12-20020a056a00198c00b00505c18b3184mr24929206pfl.82.1650990679444; 
 Tue, 26 Apr 2022 09:31:19 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 37/47] target/arm: Use tcg_constant in SINCDEC, INCDEC
Date: Tue, 26 Apr 2022 09:30:33 -0700
Message-Id: <20220426163043.100432-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eu1KUukQc6Z7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8b173f5c4a..9321457f31 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2103,9 +2103,7 @@ static bool trans_SINCDEC_r_32(DisasContext *s, arg_incdec_cnt *a)
             tcg_gen_ext32s_i64(reg, reg);
         }
     } else {
-        TCGv_i64 t = tcg_const_i64(inc);
-        do_sat_addsub_32(reg, t, a->u, a->d);
-        tcg_temp_free_i64(t);
+        do_sat_addsub_32(reg, tcg_constant_i64(inc), a->u, a->d);
     }
     return true;
 }
@@ -2122,9 +2120,7 @@ static bool trans_SINCDEC_r_64(DisasContext *s, arg_incdec_cnt *a)
     TCGv_i64 reg = cpu_reg(s, a->rd);
 
     if (inc != 0) {
-        TCGv_i64 t = tcg_const_i64(inc);
-        do_sat_addsub_64(reg, t, a->u, a->d);
-        tcg_temp_free_i64(t);
+        do_sat_addsub_64(reg, tcg_constant_i64(inc), a->u, a->d);
     }
     return true;
 }
@@ -2141,11 +2137,10 @@ static bool trans_INCDEC_v(DisasContext *s, arg_incdec2_cnt *a)
 
     if (inc != 0) {
         if (sve_access_check(s)) {
-            TCGv_i64 t = tcg_const_i64(a->d ? -inc : inc);
             tcg_gen_gvec_adds(a->esz, vec_full_reg_offset(s, a->rd),
                               vec_full_reg_offset(s, a->rn),
-                              t, fullsz, fullsz);
-            tcg_temp_free_i64(t);
+                              tcg_constant_i64(a->d ? -inc : inc),
+                              fullsz, fullsz);
         }
     } else {
         do_mov_z(s, a->rd, a->rn);
@@ -2165,9 +2160,8 @@ static bool trans_SINCDEC_v(DisasContext *s, arg_incdec2_cnt *a)
 
     if (inc != 0) {
         if (sve_access_check(s)) {
-            TCGv_i64 t = tcg_const_i64(inc);
-            do_sat_addsub_vec(s, a->esz, a->rd, a->rn, t, a->u, a->d);
-            tcg_temp_free_i64(t);
+            do_sat_addsub_vec(s, a->esz, a->rd, a->rn,
+                              tcg_constant_i64(inc), a->u, a->d);
         }
     } else {
         do_mov_z(s, a->rd, a->rn);
-- 
2.34.1

