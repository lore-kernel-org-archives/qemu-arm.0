Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp755726lfr;
        Fri, 16 Apr 2021 14:58:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPAMldr69DMnO9yXeYgDvbhNnLP1IA/VVcXVAY4oVmVaZo9mNWE/1oOIWtUvvAcIS0F+IV
X-Received: by 2002:a25:c08b:: with SMTP id c133mr1813673ybf.67.1618610306805;
        Fri, 16 Apr 2021 14:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618610306; cv=none;
        d=google.com; s=arc-20160816;
        b=nxToW9Sc7Iuuimnu6x1rxpof/dvivuwO1R/o/idtbghTD3Qhcg+0vYmzX4F/Ypyju8
         MadlGCl2ReuSyi4rOp+DqyxYJQL9S5fweoVEjdmPreSNkn8VCj+dguSkrPBslJIj1s4t
         dmceavl7SIHyjMLtrIDwNqqLt2VkqlArqv8D1eIzpmDu3FYGmZWulo+HsUyOTyiTUqPv
         Gr6QwrVTcmCfBw/yTCz9wquxyzNUwU5Xf61Rw06+fvLzMVGqLUG1DvXWKBX+oyNxyqH8
         +/suxIAvNcJv9eo7VrF9xfMbtUE12Dxoq4terbBXBhnNvIhqszS1hKaeziVntaDY9nT/
         jysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TefYznISTQm0pzCtVV51Stsil3QGM04wAsqxqTtOHyw=;
        b=bLz7VqBZ4WeJvEaPU4c0m36ZDWe2I+5ibXGf1ZzdJf7WflEyqRIk8j6VFos+QJKLE9
         v4kGzQrFp6XIKqowFZb/6zUC2xl3p6YBqrthlPQQCXVI0BeeEPoBdDvPzMv1rsju+2bs
         jLXQIubo1UVqP3BaozaWVDjktQI7wGVEPbsCdyE8R8aRD3pUxLionVkeD/6zD89/6wpE
         xvNDGnDvh3J3rfbNQr0FNNiQbVVytEM5XqJ10BkPM7SmFnHONjWSDZJugANNlnESM8GV
         ZNkLajrandZDlbsBIdJ2cmyhVJg96lOzIxM13D02g565bY9aikoNK9RnzkkXi3eLlI34
         VYEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eG4pzepR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si6768745ybm.452.2021.04.16.14.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eG4pzepR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWTq-0006yB-48
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdj-0006Hq-Fm
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:35 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0001li-H3
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:35 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so17052602pji.5
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TefYznISTQm0pzCtVV51Stsil3QGM04wAsqxqTtOHyw=;
 b=eG4pzepRDHVzSW5X9CaoqwAj58daoondH8PQJAwJaGYMskbG6QR7x3fL3LCSC5BXBJ
 f8kGzQJQWA6i+mauQLcvVrt16AKfIFl/+SZCymaWuJ4S8RL6ZQp9oOv1p1dlgHQOUZ5G
 3KNEHFej7yUg8unc6YO4EMhGHVDzfLo+oN7htcSRenzudH6xP6kZEVAPRafCnSlMQlal
 VbBV36nbggRoJ7FdERd9ZV73tX+hcCnyaJzB5zl5wj+lfjtPw+Hf68WlCKiG+rxE1kdp
 fgmq674OI85+C1Q72ntN+BW8o9JHh4k0sWzanVoT7ucCy23FPUBaHKHJDeWAS256AO8s
 yJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TefYznISTQm0pzCtVV51Stsil3QGM04wAsqxqTtOHyw=;
 b=r+Ib7fn3dVBop8VDSZsHCPO8zY1eqEM18zo0YnUKGUqLGoxLQ7YMAzKaeoAi/99Q2W
 T5EQUF75k9RR8r1iIyXnBtXqmdqqXfo+6JbuOSTQyVklcJhZLRHTlQOUvHQFWmO0R+Xl
 SJ6ylDElgCYXzSKHHJsGWH/nhz6cTx20Nx8rAMY49X/nmCYPmVw3Kdk9ZKj2uOlB1bTU
 F80wiYPvzYoD9vEZDt53pXH+21OhOx6hVVB0PtoxVo6DVxugE8wblwyc3w5jcMTTifsE
 WU4TLPyg/i8YbH2xP2fK37wEVbFVsr+hEblRtg0cF4+ZrXf43bp4uXdkb5F273l0lcwO
 cAlg==
X-Gm-Message-State: AOAM533oNVfgfX+BRXhYe0q86GGSuerJgjhqkqG/0y8G4cg9hiw506Rc
 HoKA+IjOXHXx1lrfNh612I+g2A==
X-Received: by 2002:a17:90a:288:: with SMTP id
 w8mr11793103pja.163.1618607057008; 
 Fri, 16 Apr 2021 14:04:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 66/81] target/arm: Implement SVE2 FCVTLT
Date: Fri, 16 Apr 2021 14:02:25 -0700
Message-Id: <20210416210240.1591291-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: vX22/0FsSgg6

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-3-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 23 +++++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d6b064bdc9..30b6dc49c8 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2708,3 +2708,8 @@ DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index afc53639ac..fb998f5f34 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1534,4 +1534,6 @@ RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6164ae17cc..2684f40a62 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7468,3 +7468,26 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
 
 DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
 DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
+
+#define DO_FCVTLT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
+{                                                                             \
+    intptr_t i = simd_oprsz(desc);                                            \
+    uint64_t *g = vg;                                                         \
+    do {                                                                      \
+        uint64_t pg = g[(i - 1) >> 6];                                        \
+        do {                                                                  \
+            i -= sizeof(TYPEW);                                               \
+            if (likely((pg >> (i & 63)) & 1)) {                               \
+                TYPEN nn = *(TYPEN *)(vn + HN(i + sizeof(TYPEN)));            \
+                *(TYPEW *)(vd + HW(i)) = OP(nn, status);                      \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i != 0);                                                         \
+}
+
+DO_FCVTLT(sve2_fcvtlt_hs, uint32_t, uint16_t, H1_4, H1_2, sve_f16_to_f32)
+DO_FCVTLT(sve2_fcvtlt_sd, uint64_t, uint32_t, H1_4, H1_2, float32_to_float64)
+
+#undef DO_FCVTLT
+#undef DO_FCVTNT
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index df52736e3b..9cad93cb98 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8186,3 +8186,19 @@ static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
 }
+
+static bool trans_FCVTLT_hs(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_hs);
+}
+
+static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_sd);
+}
-- 
2.25.1

