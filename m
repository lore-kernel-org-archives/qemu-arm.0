Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp752608lfr;
        Fri, 16 Apr 2021 14:51:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytCh5/CLIsP4z7CLc7RHau1HAgvt8HvKVq2o6SfsdFBplXhadc2dNSiX+5AhuN9y/D7HfP
X-Received: by 2002:a6b:8fc8:: with SMTP id r191mr5234790iod.145.1618609908556;
        Fri, 16 Apr 2021 14:51:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609908; cv=none;
        d=google.com; s=arc-20160816;
        b=vtJWMaX0ToQHT6v5CO1iBtjEeZ9DHs7Msqrv/+RQy7S8oJOk9o/DmAXYMNrAK1L9He
         62/B/zn438lUokMw07WcTlm4yKYakpom+ujs7sNxavfqtX99SUJ9jS7Mk7jVG8g/O1Ax
         g2KKympIgbt/p1gpvqWM6XmxlVdEQYcddJBfs6Jqh0OyorPluQ1feRD/mSNcvh/9DXFA
         4Of0ypRB4tvcnK6/eGYeIH5HjJ3a8biBb3FbPV5wbE02ZR5HjsY11uLN1piHi1nC1aFt
         7eDgfbL0TM1uXOUYfBOsiZ4oSDpn4mIYxXlX0Gp6gNih4Fht/GnrD8N+sX/YOjDGhWTW
         6JeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SfmJvMQuIYR8WFaI/bEqnt8au8APyoTLP4XYJ+DE47U=;
        b=qwMNg1rhn/na8cMOaAKt9i/0xkObH+cO3drxkPrtuw2n5kzX6wVf66vucDVIlGxGIV
         s+r+NuoCu6wKfFu0HfpEnVmSOujMu/bAAJ4v79n0GYzvlegS7iLZ5Ipqyg3fMDAgpBoG
         BSwoiEypfJ5iHAlyTjpzdhSNsYCsP4wQOtBWNlQmVqElqMa/Mem9E4mZxhlbrm7gPuEQ
         wv1LgCUpXiNQXfwJdcEuU46vQvSbAUCgaBqQEziM9l9mE3NSszJpzmkf3CDu2lIXv2vV
         vPmDrqHk37YnEQDUuAp/Qb4tlN23SLnRvSYv4FxCkOBOW/SUBaSKnJjzxDvHW7LORAvN
         bDkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ayjpxGgE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20si7599954iow.56.2021.04.16.14.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:51:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ayjpxGgE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWNP-0005IO-S2
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVds-0006fW-C0
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:44 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdY-0001nn-2T
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:44 -0400
Received: by mail-pj1-x1035.google.com with SMTP id u11so11011640pjr.0
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SfmJvMQuIYR8WFaI/bEqnt8au8APyoTLP4XYJ+DE47U=;
 b=ayjpxGgEcVrs9WBZnUJ/7ifQMHCzMA2jIKJgJMzAf96fgGY2F/Cjtrhdb6o+RND4sY
 S2mizd7f3BM1wO4OVj7BnR6j+zqRErtc4AJo2li2xEvVeyrVp8Bqrfz1IdyjhENssDAm
 FzZgEqV2rT6Jp3UG0c2WZSYVcBVUyy3hwDjL9sJzWQoHYwVsuS3oytgOB7rli/2CFKe3
 gi+toHiSaxLUwyg6Mw7VI1EDGK9x3Yqd0YRnODjBkYP0ojfKNmJYyfNqCB2uBV+P6anu
 4vdZ1mdh0qyiDq4zdfjiW8UBKuGBk9+9NM62329asvsOdngvuRjCOVNh9kyfuoIXt0yq
 lIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SfmJvMQuIYR8WFaI/bEqnt8au8APyoTLP4XYJ+DE47U=;
 b=Dnxo8SVX+eibWySmCqp8t1dzE1es6f2qFmYQRjbjqj7ex11nHfNZrlFb5P/xCSxn/H
 0BHJttZmJEGCPmBjwF++B2vZb4Shj7P98pL6AXwT8fVde9lmoLEK9ovxbMMKP8cIHEpJ
 NroSXfYdyIzvA+qOloq2wJ8h+QqPCChuVA5+/aK8FzQlXj3iIuABXudLCyIDvod7gVs8
 6dT44L89VZ7V1fUo2hz7No8fCE+LMfFdNiHsbO7b00l3B14Iwe3hmPn3qK/4JxuOq0BX
 cSsiuin2zGG5cL0CVz9vLsQwTLoTCNB92OC+oLzOp9UhIkQAH3EsVLIVBmJb+eJsG1rF
 U3xA==
X-Gm-Message-State: AOAM530buYYFGuVLfDKUk/vBdLGnsa1CgwHk6B1EaIaSr83TRwyYiFt7
 fNXu57MoPkP6Tqb63wVCo6xi/Q==
X-Received: by 2002:a17:902:ce8b:b029:eb:5fd4:51c5 with SMTP id
 f11-20020a170902ce8bb02900eb5fd451c5mr11785968plg.31.1618607062759; 
 Fri, 16 Apr 2021 14:04:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 72/81] target/arm: Implement SVE2 bitwise shift immediate
Date: Fri, 16 Apr 2021 14:02:31 -0700
Message-Id: <20210416210240.1591291-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 33TX262hatul

From: Stephen Long <steplong@quicinc.com>

Implements SQSHL/UQSHL, SRSHR/URSHR, and SQSHLU

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
index 6e9479800d..fa7418e706 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2707,6 +2707,39 @@ DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
 
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
+
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 32e11301a5..cfdee8955b 100644
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
index d5701cb4e8..c5c3017745 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2084,6 +2084,41 @@ DO_ZPZI(sve_asrd_h, int16_t, H1_2, DO_ASRD)
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
index 0cfc90b483..26377b1227 100644
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

