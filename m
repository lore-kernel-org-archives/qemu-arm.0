Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp514141lfg;
        Fri, 30 Apr 2021 14:33:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp7B87EFsOgOB/yu+mxKMJ9jZOp2LqWKKOJdkvmQgV3bC38+sR5jhXMfj1ViA4UMnbcSX6
X-Received: by 2002:a05:6808:b3b:: with SMTP id t27mr5525510oij.131.1619818394786;
        Fri, 30 Apr 2021 14:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619818394; cv=none;
        d=google.com; s=arc-20160816;
        b=FS8Ura8pzetbDhAcq8avIuVs26Z5s+8amc4NaMwTYgcJmULfcwqN0VFLdKOhYcxKQV
         S0yxIPL0FJxuma7TMZb+YiZ5CRUt2P8QjNtv1SvoEMNDUYBWVMwRhb9FtWhwyBJpoTWX
         P08A4fS834PBHUUmQRLyYHdIFekQJgESi1pY1PZqpUvk4gFtsXcP09VCCc56Scq/mScI
         QfC8/oUjbib3qi/vg5x1O3fxPZxIufO/PR61qNZZ8bEjUEiiZYdhzDc7niyyMT8zApJb
         CdY2Kw17vrs6lTak+O8muAFeRAMFnxiNlSihNrIvzlL63CENh0vhAJdDGCZkBQGKmyoW
         NhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ux7AjIofl30XpVNkB5THnEw/ARFu5PvhGsc0ueXu0yU=;
        b=aAjtubpbQ0j0bjAmVzcH/Kge8eGU5yo8XW14wEyb9gHtnEGgY0j1zAi8X0YH8r8Xjo
         ggzIwZioLXIC0ssYbVHLpDe34PhmxFPaLzs1my7+l8+E7RVxjqkOaG3QC89EkQlbxl2n
         JJeXvZJWo1J0KEG2Y5Yy23A84vVGpRF5E0PXFzlZ+yKCoDe2x1wWfLs5ucED9LLO0cVJ
         bocNBlbvrOjkE4y+/FzKc8lSTf5bo1uKcq4MSuI9pjUe8kS2wH+ek1QPk5xyvNZjAP3s
         ChRmlOwCgPIex/kz8e38m0NHIFClswsMQC/gSfrq8LSZ1UFVEByhuUEav+nAbjCj/Ckq
         Fvrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="einjk/rK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l185si1038358oib.76.2021.04.30.14.33.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:33:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="einjk/rK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcal7-0004YA-Sn
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmz-00059g-Dk
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:31:05 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007nC-Fj
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:31:04 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so2343482pjn.5
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ux7AjIofl30XpVNkB5THnEw/ARFu5PvhGsc0ueXu0yU=;
 b=einjk/rKQ//C6rXCR9DuqbowPFXRvBt/PkA9pqn85xTQOe3BG1ohM9ltLqw0gGRotM
 Wksw5+kTJFM4y+tca6vgpSymeX6gyZwSGu2qaUE2HoGTht8UGLqGecCoCbGejzlpIcTp
 5Eb9pG008ZR6D8DafXssfYzQQKs2g23rzSeUkVuvYaLJuSgHRlXtImIn8m+xC/4BIH4V
 VKEn965apV1/YrfaCN8vg3D68WZPzvNZkN34c8Zd/AR4GSPhGKqbJfribeNz5mpbZCNw
 xCCvsUf1juuDtJmjfbubd4gu0VoM7mxwuO2EwHlAKQP32W9eyJK8uore53RGlWKUj8mA
 N5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ux7AjIofl30XpVNkB5THnEw/ARFu5PvhGsc0ueXu0yU=;
 b=CBqCXGhejlv84EREw2SZDI5F4VtGL3EZHNs8UJKxoyz2uCGTmpnSXoPz4B1OQbuMPB
 jV6qB04ybgpBQAbtXMdL8S50i4ybef+9kc//HhdtMjeYHlxPxgfbp0Mfw8papyWwjn1y
 wKtPmAkv2yzpKJQjSJsrl0Y4vP0QyQevyz7ZegTPoZWFPjHnxumjkfq2YP+m58pnLFLq
 lbJIy9t31mqpk9QC08VgZtNaE4pURkHoZKmsp/pVaGfyJPkB3upny5rJWTN/9vslh4Hi
 tII5hUfQTq/qXBUcZ4QVcPztFA5ppJUFjM50RGcKyfVkl3HSz/PSurbIqoMG0nYDVUlp
 +Y9g==
X-Gm-Message-State: AOAM533PSBnz83SR3B5DKNm4YOo5/us2OeWT8dpL8Dg49QmVH+huP/ZD
 Jo/sRKIW0gJRsM38u64wDbtNSg==
X-Received: by 2002:a17:902:82c3:b029:ed:64b9:6119 with SMTP id
 u3-20020a17090282c3b02900ed64b96119mr7104892plz.20.1619814592305; 
 Fri, 30 Apr 2021 13:29:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 66/82] target/arm: Implement SVE2 FCVTLT
Date: Fri, 30 Apr 2021 13:25:54 -0700
Message-Id: <20210430202610.1136687-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
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
X-TUID: x9R8dB0lD2FR

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
index 537449cbfa..f5bf122204 100644
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

