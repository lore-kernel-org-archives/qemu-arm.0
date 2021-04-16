Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp753072lfr;
        Fri, 16 Apr 2021 14:52:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVXEvdvcwllFPBNV/2+C/pVaWLJ/D5Pe5rmxbuF/+mjPVvECNVLpezZrJhkmWW8jJOOc9T
X-Received: by 2002:a05:6602:1689:: with SMTP id s9mr5090876iow.171.1618609967070;
        Fri, 16 Apr 2021 14:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609967; cv=none;
        d=google.com; s=arc-20160816;
        b=EpEWQ7ApALT0H55bGEqGigL2U1e55A0ZawiFnnLTH5YobwOi8pB1KaCOYVTQwnpXsz
         vcOoAMgWLR6BXe/scNR+RazWpXe92F0AUfCpCFKvILSJsv1jDC27+Xn9zD3dRaJkQyW6
         KaUZGktweRqHj+ZavK1vHoOIH8JX+sNztJ+Cco26VRz0dKn/WK/gouZgq6UT9VSNtEF2
         E0mc85vUadKpxIHJyuvjsEEkNdGjn/fnWss7A5bubqLTGZ8i7OuNWqLwdG22fdlA0oAX
         /u7H6Wtzv6FYC3yneQ4bM2kHirOqkbnKC4t9tw9Fp4VL/m2+CUVp0nQmeS68FLwIisIg
         xYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Qi7ydIxfQkB8AeeB+foEIc9co/N1EA+zUALSSBLM1Ow=;
        b=r9A3zMmy4ztBvx4TI8zhDQdqNep48T8ss8CslQLz2R1BrlWPMjlU7TcMBbPZFEr269
         Ig72N+gKwqJT5LiB0MywkZY+B8CYoISnSkWOE0d6+ZUI2MGloDy1GmRmlDl9zQFpKL7R
         GL8jzY6bFm1p7NBXJc5F0h4N1i0fV+NXgZkBcQtsrO7efp3+2NXeIkQatuoSxDEI+H5B
         9yrbOIyHfSbE6WvqdxPQ3bktBV5ues55oYOiDej3ng9xMd4QBCc1iXHKR76t4j5PWY8K
         //whdiOCWyGgIKKHEKIdbY0smyr8DagUlULczxnVHCKyKsVTPo9EKaIK+s94cAmusj/d
         4DCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bw1Eqvjv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si7669755ilg.18.2021.04.16.14.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bw1Eqvjv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWOM-0006QJ-7o
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdp-0006ZE-PW
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:41 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0001kv-L2
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:41 -0400
Received: by mail-pl1-x630.google.com with SMTP id m18so12423922plc.13
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qi7ydIxfQkB8AeeB+foEIc9co/N1EA+zUALSSBLM1Ow=;
 b=Bw1EqvjvPJ0YtYg/G0keZJoxkkzLy+sSCmtZ+tv+NHKVw5af/oCY5L3AmiL+ELi2Vc
 TUREsVlMlifP+K8WxmhPN4cntub79ulGPXULNmsV06RdV31kGICU+UcIxc7S+7ZxP6xv
 YQNe0CS3DNdrHgUkC0AIgBHCO7A4PSUrTy2BeWuBe78I+kjNY3GuP9p8I5YTKEWD8Kcy
 FFiQ2J3iARWH435FHCuy0q+9ATGBOdtYItdcsqApQiD8gWr/J047ZB26QdGNSlueLyYi
 EGseMT3w69boMgulLmWtsCKmY+ru7sw1U7JH6CEHXJGez/OcSx8TqBjAq6hUxUd7u7m1
 hwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qi7ydIxfQkB8AeeB+foEIc9co/N1EA+zUALSSBLM1Ow=;
 b=lGIms2+8a5RI6R4niYZblLzfIDhKS8QfdLPfRU4zs8GsbiVgMNTQf8qHBKVJwoCM/R
 PzhKgncx5t5DQOVjRhQHtzwcE6y7Ra/2rGSijX+sKwWPTcQEnuug9w5Rbr8ifARXpqJE
 AGNJde3YYIcuBynBzpnAxgzCBuw+zY/vj07TzkF5dG1Wa/gpTZ6Cq8beEftojjqtYGBd
 e5xD5NUQivo+7ZzI1Wv+iLCmCSnHVxByyQaGbWu18MkS0zT9nxw1btvCfALvnSRyaOmu
 oWrfS6oqgpY583fOzOk3FlfGbNZaM3vZ63ewoB1ni4XrzACv8xd7ZvounPY70Q2J79EL
 3ukw==
X-Gm-Message-State: AOAM533ESotFW5GVorbnGUycEb3uG5JyB/aUcvqSlINZrcD2j0sn4kP1
 PzxdsN0yhfb0inxKgwkLViD6Cj8wz0z5Ng==
X-Received: by 2002:a17:90b:4a52:: with SMTP id
 lb18mr11556556pjb.1.1618607055985; 
 Fri, 16 Apr 2021 14:04:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 65/81] target/arm: Implement SVE2 FCVTNT
Date: Fri, 16 Apr 2021 14:02:24 -0700
Message-Id: <20210416210240.1591291-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M3v2v2odY6oH

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-2-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 41c08a963b..d6b064bdc9 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2703,3 +2703,8 @@ DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 38aaf1b37e..afc53639ac 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1531,3 +1531,7 @@ SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
+
+### SVE2 floating-point convert precision odd elements
+FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8dc04441aa..6164ae17cc 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7448,3 +7448,23 @@ void HELPER(fmmla_d)(void *vd, void *vn, void *vm, void *va,
         d[3] = float64_add(a[3], float64_add(p0, p1, status), status);
     }
 }
+
+#define DO_FCVTNT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
+{                                                                             \
+    intptr_t i = simd_oprsz(desc);                                            \
+    uint64_t *g = vg;                                                         \
+    do {                                                                      \
+        uint64_t pg = g[(i - 1) >> 6];                                        \
+        do {                                                                  \
+            i -= sizeof(TYPEW);                                               \
+            if (likely((pg >> (i & 63)) & 1)) {                               \
+                TYPEW nn = *(TYPEW *)(vn + HW(i));                            \
+                *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, status);      \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i != 0);                                                         \
+}
+
+DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
+DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 63e79fafe5..df52736e3b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8170,3 +8170,19 @@ static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
     }
     return true;
 }
+
+static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_sh);
+}
+
+static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.25.1

