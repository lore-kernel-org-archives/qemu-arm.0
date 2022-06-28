Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2891771lft;
        Mon, 27 Jun 2022 21:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vRxsWe+wGQAxX0H7/fmSRw9EQSbVblslF4wDDm963UE1BHnFi2pCWp+wCKJ4Nh9S1BNflW
X-Received: by 2002:a37:4454:0:b0:69f:c339:e2dc with SMTP id r81-20020a374454000000b0069fc339e2dcmr10102177qka.771.1656391392250;
        Mon, 27 Jun 2022 21:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656391392; cv=none;
        d=google.com; s=arc-20160816;
        b=JJQQfmmIgPk1lX98agLa+mDioZMNPOcF+MOTYf2R4jlSQQubVOmo+Btu/V2l3gihfU
         KzS2IijvIy5VJ+OICn8e3kJIicXJ6R7hy1iJS2HIuauAW4lkvagMA5Zd2gtItSmhSsRo
         XgY9jVhs883y58Vs991esGelCqFZrFQtybgywNkmn7cNtUd5cOulVxmGnktZ3yre87ZB
         mAQo8E45vo1TUgG0tMeKdzIpMkBKwH41mYxmwtj6IAXq+y+AFJUUDf9jkXLgctATb1FZ
         tH8tOBY6s9IaWh4mQyh1xAyHCP0hsnH/rtm2KfYQsO7/IIuJueos3HD60HgshPu6OOdD
         0Psw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=28vgYGphhmuIGOQ3NR6EcTiIP3DBoLZHG9GLZrK4ZGk=;
        b=rvyydRMH+dY1SoRWJj+7DNI6d313J4bAeoa+OD3+1ytDKulizNtcLYAb6AS/yLKgLk
         euvokN+NrYd9CvgBnwAi+Nlei/F0j+XrNEqtib648B9u1OJ91osq5IEb2F+d12Y+aHx6
         /PbqiaJ/uvg2WKGwzxrS/iFg6qqMZ379mBKpa6wOXa0CZ8hTHyCX1ddoVdUfFKYgcStU
         yOMJvHfwSPENMo69iUL6Rby1twCzJGe+PzOcc2Ty0rN1Xcf7FFv23eOA79mQGS7wls4X
         75wWBIAgu/4X3kX8ebxBu/sUHsUU6+kn7hQHVn1SYmnkyKHQkOl3KfIeJQ6e11UKflS3
         Fe9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VnZAVHZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc27-20020a056214411b00b00470425fc0desi5805541qvb.2.2022.06.27.21.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VnZAVHZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6347-0007yx-Br
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kE-0002cO-Sp
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:35 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kD-0003sJ-1O
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:34 -0400
Received: by mail-pg1-x534.google.com with SMTP id g4so4113760pgc.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=28vgYGphhmuIGOQ3NR6EcTiIP3DBoLZHG9GLZrK4ZGk=;
 b=VnZAVHZ0nNzEow/Pq92Ft6c66/PHkHX6Yr59H/uaKZMxAYfn/xmCjPvq9MnLA48IK/
 2WTppk4Yet52+E3BI71b+aNSyPvSUC05yO8feWzvbX8MMPYIU/lwf/58X3Yn60fQfiyZ
 VsZEbp4iBjbm82oPf7mYplCaDZnh52iOgUTX9aetUlWiv3LaK05dz2KQMr3HFFz2Kzch
 sPA76ycy56+lB0ZL3nTBi7E/0w346FRm4yIAdFQ1ufDJjh6NxefDkzfny48brxtcgrgQ
 v0e5pynldBIlIVtRyCscEU+tqwoK5+WSvcuxzxwFj3JPSz1bDiTEAG6gtlmqp18o/676
 p7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=28vgYGphhmuIGOQ3NR6EcTiIP3DBoLZHG9GLZrK4ZGk=;
 b=5Puy+JTxSNGdcZDW1sihrnBHUpU/w6aZBZ+eCw1wIld5Hp0tAXlNAAXSItDUc/JVpK
 2s+l72n6A9FSMYmnjgodgn6poMsuUyyifXAhMwDeGKjpq4VBEdOGCyire+vjgDKdhFm6
 lvgQgPluujmRGf9dN7EoFun87zYsuh4bXtvkIa2GgFsfJWagJO9qGX91IAAmWgBWAUZo
 UQWic1zYOLMW1FjkQNz96je5/HRS6OUq3mel851r1LfJr1VnT20sklj8J9ZL+iZLyOpA
 ONBVHX1oVV/Qk+4UyKvt9Ne3VlAkmyqFlS9QsgELuk+S7Q3e3zTSPAw8AduLF+XnWND0
 ZiKA==
X-Gm-Message-State: AJIora/Tmecml6oc0pxOWKsGTR0V8zwcg1Y9Nyowvt0PV+pDAqdpBRe6
 zoANOR2Jj3cfXjkQ6JwA7xDRYlJGRnChlw==
X-Received: by 2002:a05:6a00:8c5:b0:510:6eae:6fa1 with SMTP id
 s5-20020a056a0008c500b005106eae6fa1mr1639483pfu.12.1656390151606; 
 Mon, 27 Jun 2022 21:22:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 29/45] target/arm: Implement REVD
Date: Tue, 28 Jun 2022 09:51:01 +0530
Message-Id: <20220628042117.368549-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8QfcuTFFa+xf

This is an SVE instruction that operates using the SVE vector
length but that it is present only if SME is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 ++
 target/arm/sve.decode      |  1 +
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c |  2 ++
 4 files changed, 21 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ab0333400f..cc4e1d8948 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -719,6 +719,8 @@ DEF_HELPER_FLAGS_4(sve_revh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_revw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sme_revd_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_rbit_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 966803cbb7..a9e48f07b4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -652,6 +652,7 @@ REVB            00000101 .. 1001 00 100 ... ..... .....         @rd_pg_rn
 REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
 REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
+REVD            00000101 00 1011 10 100 ... ..... .....         @rd_pg_rn_e0
 
 # SVE vector splice (predicated, destructive)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9a26f253e0..5de82696b5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -931,6 +931,22 @@ DO_ZPZ_D(sve_revh_d, uint64_t, hswap64)
 
 DO_ZPZ_D(sve_revw_d, uint64_t, wswap64)
 
+void HELPER(sme_revd_q)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 2) {
+        if (pg[H1(i)] & 1) {
+            uint64_t n0 = n[i + 0];
+            uint64_t n1 = n[i + 1];
+            d[i + 0] = n1;
+            d[i + 1] = n0;
+        }
+    }
+}
+
 DO_ZPZ(sve_rbit_b, uint8_t, H1, revbit8)
 DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
 DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 23b051746c..6019dfb53c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2901,6 +2901,8 @@ TRANS_FEAT(REVH, aa64_sve, gen_gvec_ool_arg_zpz, revh_fns[a->esz], a, 0)
 TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
 
+TRANS_FEAT(REVD, aa64_sme, gen_gvec_ool_arg_zpz, gen_helper_sme_revd_q, a, 0)
+
 TRANS_FEAT(SPLICE, aa64_sve, gen_gvec_ool_arg_zpzz,
            gen_helper_sve_splice, a, a->esz)
 
-- 
2.34.1

