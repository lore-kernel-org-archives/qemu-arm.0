Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4048582lfm;
        Mon, 24 May 2021 19:02:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydwvnFPnEhJ0VK2shOzRYlnSm5wvdJc/l96yWkgJmgo4YKaK/Ldy9GJtfsF8mNmvpll+UO
X-Received: by 2002:ac5:c8b1:: with SMTP id o17mr23597334vkl.6.1621908154332;
        Mon, 24 May 2021 19:02:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908154; cv=none;
        d=google.com; s=arc-20160816;
        b=SStcCYpY1xuZAO8WI6jrb4WUSNfH+Jpjhj17RLlTYd84AomkqFJXekw1sqqqlhiB1u
         R/E55XcVboun3qaOigSJ9DD6v7lacG84EKL6ujVHbbp9UEt2otVMUb42zDJdewuEqWHO
         Oo4APBH2v+Nv+Veck0Zv84G5ilpgcfy1nfX/QbpionnqFdPjTy3pljRbRIO+c+FMZwV/
         +Fux5O96TVRcGu1sqdIHidamuh1vEgNEAjAgieWPZaB5aJT0bJtGXRtsYlJzEDcT8ioU
         kAfIBxYQwQo7Bva3aIyk5Rj/gLL3W0ijJLN0A16AA+qiLEKQTdi1L9qefcmJ9zKl3XRG
         nxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rAh+mrtYdjW28/Wa1av2YPet2GepPpehSKaS9Nt7Pu8=;
        b=fJ2Km9/D641ZFcNSCT9lbf4UNMd6vKzXh5EadaERPq3KxpgmxVY+dxSf84z3xwPopY
         nQ7KvL2axcwwDZ2gN3HGtPNbjmaSDxU+mdnVthsmGplRMMv5a5xtAoIhLvjyiTHMsSdX
         T1cfnKtqTbdIFA9FPuEJaIjh2Thsi26ur3ES2fS0MoOSD0JNkbs5HfKEZGKNu/S/woP1
         jfDFDGwFCCMQBNYWcMZoyv3xbsRLxINrLXkZrQ4rZjY3rm9Oi9aig7gFPXas1+QE7+7s
         q5TFs/TGPjsLsmgVqobU1Bat+G2Me0lXdmM7TBSlGZKOVcMHrNC7p7UuYZlPspPK3rXy
         f4Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R8HtKb18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k47si5968538uae.93.2021.05.24.19.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:02:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R8HtKb18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMOv-0000KO-J8
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLaz-00065o-Lx
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:10:57 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLas-0005qQ-Dy
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:10:57 -0400
Received: by mail-pg1-x52a.google.com with SMTP id v14so18688512pgi.6
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rAh+mrtYdjW28/Wa1av2YPet2GepPpehSKaS9Nt7Pu8=;
 b=R8HtKb18aRFL8VyQZCw6nFmEI3g01SqMuyJxDXs2KS5YitcfDmILsWZjCjtjCb5RL9
 98rl4Ddt6H4HDjg5kSxyn4+7cNoVHF1Bjo7UetE36Rfylk0ud/1IsGx13kGrNdi9RF6u
 xbquI/GwZRAY1+P/wnCFqRBrpDBDkA7BYK21Ia1ZRBY604SWNWTjPUFxk/MM1AJmXqg2
 CoHQg7UTh0V2/0ch/JGyVgCk+zOQc5mc3hXb1WfV9jak6Jk+IBfRnFqlyfz3LpVkDpxU
 njaBuUyv2gX/lxwxneWTLqIu0BBSauFPS6aT7U3PjfX7Rkv7++pVSZ/GCF8uc7/AFs+S
 yniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAh+mrtYdjW28/Wa1av2YPet2GepPpehSKaS9Nt7Pu8=;
 b=q40zwWhVbCubf+B6m6U/RhCbbhMQdKYMriEeX3MbDzarKrB3Q2blxLZr9nTKoznlOo
 VbmITmc2p039CicSeC+/gWoAX7BPChulPpfihDztQpsV2RoYgxLkny5Sli/UK3XIkj9I
 iBT4KuI9h0UTUayftBcSUHo8e/dcr0zlDveQIX7ucDa73EdAtFmWReZ33r5j3pnL10Zd
 dRZFBMFclIgutEJ0UBZGK+HZV2naXu0+lOmozNvIxZTU7k5P9yqSFAIJK4UMVYZpjS7A
 m6mU3EuI3LMW+ZB1o3UkgCieTfYd6ydZLswNK3ucDuJqKhQoFwb1FWeaQq8dca2XdB18
 nYuw==
X-Gm-Message-State: AOAM531gKiFTCxLr4kugeETUhOU6VvwTgMXntLVbUa2tJDhWHOkzDvqe
 WPxpA0PM7o7wrURlrle/m5ZJ6A==
X-Received: by 2002:a63:6cd:: with SMTP id 196mr16089384pgg.417.1621905049153; 
 Mon, 24 May 2021 18:10:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 80/92] target/arm: Implement SVE2 bitwise shift immediate
Date: Mon, 24 May 2021 18:03:46 -0700
Message-Id: <20210525010358.152808-81-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +EJA5iPdiSey

From: Stephen Long <steplong@quicinc.com>

Implements SQSHL/UQSHL, SRSHR/URSHR, and SQSHLU

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200430194159.24064-1-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 33 +++++++++++++++++++++
 target/arm/sve.decode      |  5 ++++
 target/arm/sve_helper.c    | 35 ++++++++++++++++++++++
 target/arm/translate-sve.c | 60 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index b43ffce23a..29a14a21f5 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2761,3 +2761,36 @@ DEF_HELPER_FLAGS_5(sve2_fcvtlt_sd, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(flogb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(flogb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(flogb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshl_zpzi_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uqshl_zpzi_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_srshr_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_srshr_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_srshr_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_srshr_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_urshr_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_urshr_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_urshr_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_urshr_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqshlu_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshlu_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshlu_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqshlu_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5469ce0414..ea98508cdd 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -340,6 +340,11 @@ ASR_zpzi        00000100 .. 000 000 100 ... .. ... .....  @rdn_pg_tszimm_shr
 LSR_zpzi        00000100 .. 000 001 100 ... .. ... .....  @rdn_pg_tszimm_shr
 LSL_zpzi        00000100 .. 000 011 100 ... .. ... .....  @rdn_pg_tszimm_shl
 ASRD            00000100 .. 000 100 100 ... .. ... .....  @rdn_pg_tszimm_shr
+SQSHL_zpzi      00000100 .. 000 110 100 ... .. ... .....  @rdn_pg_tszimm_shl
+UQSHL_zpzi      00000100 .. 000 111 100 ... .. ... .....  @rdn_pg_tszimm_shl
+SRSHR           00000100 .. 001 100 100 ... .. ... .....  @rdn_pg_tszimm_shr
+URSHR           00000100 .. 001 101 100 ... .. ... .....  @rdn_pg_tszimm_shr
+SQSHLU          00000100 .. 001 111 100 ... .. ... .....  @rdn_pg_tszimm_shl
 
 # SVE bitwise shift by vector (predicated)
 ASR_zpzz        00000100 .. 010 000 100 ... ..... .....   @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index d088b1f74c..4afb06fb2a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2238,6 +2238,41 @@ DO_ZPZI(sve_asrd_h, int16_t, H1_2, DO_ASRD)
 DO_ZPZI(sve_asrd_s, int32_t, H1_4, DO_ASRD)
 DO_ZPZI_D(sve_asrd_d, int64_t, DO_ASRD)
 
+/* SVE2 bitwise shift by immediate */
+DO_ZPZI(sve2_sqshl_zpzi_b, int8_t, H1, do_sqshl_b)
+DO_ZPZI(sve2_sqshl_zpzi_h, int16_t, H1_2, do_sqshl_h)
+DO_ZPZI(sve2_sqshl_zpzi_s, int32_t, H1_4, do_sqshl_s)
+DO_ZPZI_D(sve2_sqshl_zpzi_d, int64_t, do_sqshl_d)
+
+DO_ZPZI(sve2_uqshl_zpzi_b, uint8_t, H1, do_uqshl_b)
+DO_ZPZI(sve2_uqshl_zpzi_h, uint16_t, H1_2, do_uqshl_h)
+DO_ZPZI(sve2_uqshl_zpzi_s, uint32_t, H1_4, do_uqshl_s)
+DO_ZPZI_D(sve2_uqshl_zpzi_d, uint64_t, do_uqshl_d)
+
+DO_ZPZI(sve2_srshr_b, int8_t, H1, do_srshr)
+DO_ZPZI(sve2_srshr_h, int16_t, H1_2, do_srshr)
+DO_ZPZI(sve2_srshr_s, int32_t, H1_4, do_srshr)
+DO_ZPZI_D(sve2_srshr_d, int64_t, do_srshr)
+
+DO_ZPZI(sve2_urshr_b, uint8_t, H1, do_urshr)
+DO_ZPZI(sve2_urshr_h, uint16_t, H1_2, do_urshr)
+DO_ZPZI(sve2_urshr_s, uint32_t, H1_4, do_urshr)
+DO_ZPZI_D(sve2_urshr_d, uint64_t, do_urshr)
+
+#define do_suqrshl_b(n, m) \
+   ({ uint32_t discard; do_suqrshl_bhs(n, (int8_t)m, 8, false, &discard); })
+#define do_suqrshl_h(n, m) \
+   ({ uint32_t discard; do_suqrshl_bhs(n, (int16_t)m, 16, false, &discard); })
+#define do_suqrshl_s(n, m) \
+   ({ uint32_t discard; do_suqrshl_bhs(n, m, 32, false, &discard); })
+#define do_suqrshl_d(n, m) \
+   ({ uint32_t discard; do_suqrshl_d(n, m, false, &discard); })
+
+DO_ZPZI(sve2_sqshlu_b, int8_t, H1, do_suqrshl_b)
+DO_ZPZI(sve2_sqshlu_h, int16_t, H1_2, do_suqrshl_h)
+DO_ZPZI(sve2_sqshlu_s, int32_t, H1_4, do_suqrshl_s)
+DO_ZPZI_D(sve2_sqshlu_d, int64_t, do_suqrshl_d)
+
 #undef DO_ASRD
 #undef DO_ZPZI
 #undef DO_ZPZI_D
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b2aa9130b6..92c0620bc8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1044,6 +1044,66 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
     }
 }
 
+static bool trans_SQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqshl_zpzi_b, gen_helper_sve2_sqshl_zpzi_h,
+        gen_helper_sve2_sqshl_zpzi_s, gen_helper_sve2_sqshl_zpzi_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_UQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_uqshl_zpzi_b, gen_helper_sve2_uqshl_zpzi_h,
+        gen_helper_sve2_uqshl_zpzi_s, gen_helper_sve2_uqshl_zpzi_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SRSHR(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_srshr_b, gen_helper_sve2_srshr_h,
+        gen_helper_sve2_srshr_s, gen_helper_sve2_srshr_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_URSHR(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_urshr_b, gen_helper_sve2_urshr_h,
+        gen_helper_sve2_urshr_s, gen_helper_sve2_urshr_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQSHLU(DisasContext *s, arg_rpri_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqshlu_b, gen_helper_sve2_sqshlu_h,
+        gen_helper_sve2_sqshlu_s, gen_helper_sve2_sqshlu_d,
+    };
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpzi_ool(s, a, fns[a->esz]);
+}
+
 /*
  *** SVE Bitwise Shift - Predicated Group
  */
-- 
2.25.1

