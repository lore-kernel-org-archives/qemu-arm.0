Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2154795njk;
        Sun, 1 Dec 2024 07:17:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQnXicAQRT1kCqjFgRjMxNXYfFA76ZBF/gawlh9Gl/hngPwZZ+hkkbZ9eHBXx+E6TggBvUbIt+IjadKw==@linaro.org
X-Google-Smtp-Source: AGHT+IGepf+A3odDV+d8AdAohQIRNxgNnn5Chki558+Gt9DahDL3ikHSDGT71h7x7JpPwztXM660
X-Received: by 2002:a05:622a:296:b0:466:886f:377a with SMTP id d75a77b69052e-466b35560b8mr311613121cf.3.1733066263905;
        Sun, 01 Dec 2024 07:17:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066263; cv=none;
        d=google.com; s=arc-20240605;
        b=ZuRrI+0LjbEjAu79FGmToUxdIkqonOwojZl4rW9JNHdADkQQ5cEeNG5OdHMBpq0PMj
         P1YpGvJlGFc12H7qPrlQWwoBF8rbql8PnMmm3od8TH5SOL2NP4e0ryu1Ee3X35WYNC6e
         UFMz919pdqx6zvIJ9/ETVCmJt7/dZyZ5M72tfJna2G6pqyMTMdSCYx/g2p3waubmvzm/
         ipWByNFFjoVQibrEc+hRmr6GVnr656A8Y+iXvJlIlw695c+7r0JIugG7/ufR0Quk4yLa
         xcatPWhI94L5QQ087/QiNbsvbDVbxdRAaSNzQkMpPnA+p2KTu+2cb/kxn3A6DFjx6hwg
         6HEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LhcI9CHWaJnBplFy/u43VHAC0yxtJNM95MVoOzb1/F0=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=TwuJ6JM/Gcbp5f+SgVspIP8XF4N/bcPUQtweK1FfkaaaZ+p7QWlPpsxVvuXh5GkPvb
         /YOXJYqJXODRxrpJ9/N76KL0L+ATewrOBfIxuFdPUoTrQPifEygCL3sIH30JSt2ekFz6
         Q3Dk329cOr3IcHU2tYglDW4qzzWXSnCf+EZh1gSMouUQRgxJ0TrvfMaujB9fOBf7Lnl6
         N9mCMZc7B/LJvT49tD9/lbBjsku4lsEe/nutcC/K5bdm8En4sP1f1reeiKAuMCyPiyRl
         QF5GTEl84iCOMauw4bLEwb3h91U+FXsrvrh1qjOwEiNtsj4c1RvRtYxeAS12qmNaPn3A
         ltJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TikZLvL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c425bae8si90663961cf.573.2024.12.01.07.17.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:17:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TikZLvL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlX0-0001UC-DZ; Sun, 01 Dec 2024 10:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWw-0001QU-H7
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:38 -0500
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWt-0004Ge-Ro
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:38 -0500
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5f1e7639391so1051862eaf.0
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065595; x=1733670395; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhcI9CHWaJnBplFy/u43VHAC0yxtJNM95MVoOzb1/F0=;
 b=TikZLvL24MH4YlgB+UFKlX8+BCTXZWHMZGiPZSpzHTemz2E/JT7P/lelkGCTViZh1b
 f+cIai1904X189vQ94KUB0iRGQCZKTPgjEkWtPuFBYn2OdaZiM3j+WUJTsBmZI2+4VgP
 yR/9VylY2tlJwoQ+17hgyWGVDaxVTcRIbWDNzpzmect3M4a3IKiZ85BT+hZrvFuvEs0W
 3ZoEhknCxjXlwjQ5hCef9uxviRZOPPuLonZOYKQeGpFsf25EF/09p0GCZc6X1bhlyKfz
 vyzRCCD6Ouv2g28vbn9aAzUBzf1PBRxZBZEfnnm7FIxilXgoztotqP1eV4FpYKD7OpMJ
 A02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065595; x=1733670395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LhcI9CHWaJnBplFy/u43VHAC0yxtJNM95MVoOzb1/F0=;
 b=TKcgcCYswSehq/FT5lppIw/BZUiHguA4+2H7xKkRzLfjsBc1h27RFEXHdyEEvI0ZC9
 71DYh23qKxe9x1AiAGltdWle4WIfy8L08cmYcMyC24UjQvz7ZZWqvKG0nC0J/DjxulGB
 SxCj7oo8ZBLE3V91uRIMUgMJugPJkJXUimqVNBEYksqsqk5Yt/lqMDeQt1XsTbp/9FRP
 eaiIbmIJ+WPoJ5a/dCI2ZVrsrryagpQkuOmIO4qQ9MpV3vDjXAhTCqIlgcvcWJU1cZ9L
 pI7ci5b6kKG4xGnosxvAqRRwjJaXDxr3TMFjCaZeG/miZbCUD+sjIk3C0KVxuk0BiH9R
 7u4Q==
X-Gm-Message-State: AOJu0Yy4YNj6pcSb0fsvzfNNih+GeYmgmh8DV7wD23ez0jpxbsMBEdiu
 4B2nMZVzsN+n9JZnmw9cBZuUVe1sXRVN73960bmLkc2H6Png2486orLPLK8nlOAXOdHdtIgNnLN
 w5Co=
X-Gm-Gg: ASbGnct72paoP4Y5dQk4gWauYKeglZ0C588e/NnqqOYui/DxcP/gFkuLGdkU0EbLKwz
 JBDFA4SS5unLqgwqCLDJCybwKSIlzje9pZkM02IT6Ue0H5/30VXreNmB/RVwum6hfXrCWI+K74x
 Z/pBvR48KIt5Ww/vGsQThp+2AKbG4/lK7teOhNC7h4M2T/pLf74lYmjFUfyCNPcCpJege5N4Rq4
 HbxYlSVvFXawwwgkh3iKzQVI+7vCxT0HwlxiLzXGBCXronNqZjlTf1llK4+kdeSC7S8fte/wQox
 fKPxyL2WNrm/VNg7CgAO/eHyDHvk4c8NgqpP
X-Received: by 2002:a05:6830:44a2:b0:71d:5b13:20e3 with SMTP id
 46e09a7af769-71d65d034f2mr15914207a34.25.1733065594712; 
 Sun, 01 Dec 2024 07:06:34 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 22/67] target/arm: Convert FCMP, FCMPE, FCCMP,
 FCCMPE to decodetree
Date: Sun,  1 Dec 2024 09:05:21 -0600
Message-ID: <20241201150607.12812-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: sOSsC746SSkL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 287 +++++++++++++--------------------
 target/arm/tcg/a64.decode      |   8 +
 2 files changed, 116 insertions(+), 179 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4611ae4ade..2d3566e45c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6888,6 +6888,110 @@ static bool trans_FMOVI_s(DisasContext *s, arg_FMOVI_s *a)
     return true;
 }
 
+/*
+ * Floating point compare, conditional compare
+ */
+
+static void handle_fp_compare(DisasContext *s, int size,
+                              unsigned int rn, unsigned int rm,
+                              bool cmp_with_zero, bool signal_all_nans)
+{
+    TCGv_i64 tcg_flags = tcg_temp_new_i64();
+    TCGv_ptr fpst = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+
+    if (size == MO_64) {
+        TCGv_i64 tcg_vn, tcg_vm;
+
+        tcg_vn = read_fp_dreg(s, rn);
+        if (cmp_with_zero) {
+            tcg_vm = tcg_constant_i64(0);
+        } else {
+            tcg_vm = read_fp_dreg(s, rm);
+        }
+        if (signal_all_nans) {
+            gen_helper_vfp_cmped_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+        } else {
+            gen_helper_vfp_cmpd_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+        }
+    } else {
+        TCGv_i32 tcg_vn = tcg_temp_new_i32();
+        TCGv_i32 tcg_vm = tcg_temp_new_i32();
+
+        read_vec_element_i32(s, tcg_vn, rn, 0, size);
+        if (cmp_with_zero) {
+            tcg_gen_movi_i32(tcg_vm, 0);
+        } else {
+            read_vec_element_i32(s, tcg_vm, rm, 0, size);
+        }
+
+        switch (size) {
+        case MO_32:
+            if (signal_all_nans) {
+                gen_helper_vfp_cmpes_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+            } else {
+                gen_helper_vfp_cmps_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+            }
+            break;
+        case MO_16:
+            if (signal_all_nans) {
+                gen_helper_vfp_cmpeh_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+            } else {
+                gen_helper_vfp_cmph_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    gen_set_nzcv(tcg_flags);
+}
+
+/* FCMP, FCMPE */
+static bool trans_FCMP(DisasContext *s, arg_FCMP *a)
+{
+    int check;
+
+    if (a->z && a->rm != 0) {
+        return false;
+    }
+    check = fp_access_check_scalar_hsd(s, a->esz);
+    if (check <= 0) {
+        return check == 0;
+    }
+
+    handle_fp_compare(s, a->esz, a->rn, a->rm, a->z, a->e);
+    return true;
+}
+
+/* FCCMP, FCCMPE */
+static bool trans_FCCMP(DisasContext *s, arg_FCCMP *a)
+{
+    TCGLabel *label_continue = NULL;
+    int check = fp_access_check_scalar_hsd(s, a->esz);
+
+    if (check <= 0) {
+        return check == 0;
+    }
+
+    if (a->cond < 0x0e) { /* not always */
+        TCGLabel *label_match = gen_new_label();
+        label_continue = gen_new_label();
+        arm_gen_test_cc(a->cond, label_match);
+        /* nomatch: */
+        gen_set_nzcv(tcg_constant_i64(a->nzcv << 28));
+        tcg_gen_br(label_continue);
+        gen_set_label(label_match);
+    }
+
+    handle_fp_compare(s, a->esz, a->rn, a->rm, false, a->e);
+
+    if (label_continue) {
+        gen_set_label(label_continue);
+    }
+    return true;
+}
+
 /*
  * Advanced SIMD Modified Immediate
  */
@@ -8183,174 +8287,6 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
     return true;
 }
 
-static void handle_fp_compare(DisasContext *s, int size,
-                              unsigned int rn, unsigned int rm,
-                              bool cmp_with_zero, bool signal_all_nans)
-{
-    TCGv_i64 tcg_flags = tcg_temp_new_i64();
-    TCGv_ptr fpst = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-
-    if (size == MO_64) {
-        TCGv_i64 tcg_vn, tcg_vm;
-
-        tcg_vn = read_fp_dreg(s, rn);
-        if (cmp_with_zero) {
-            tcg_vm = tcg_constant_i64(0);
-        } else {
-            tcg_vm = read_fp_dreg(s, rm);
-        }
-        if (signal_all_nans) {
-            gen_helper_vfp_cmped_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
-        } else {
-            gen_helper_vfp_cmpd_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
-        }
-    } else {
-        TCGv_i32 tcg_vn = tcg_temp_new_i32();
-        TCGv_i32 tcg_vm = tcg_temp_new_i32();
-
-        read_vec_element_i32(s, tcg_vn, rn, 0, size);
-        if (cmp_with_zero) {
-            tcg_gen_movi_i32(tcg_vm, 0);
-        } else {
-            read_vec_element_i32(s, tcg_vm, rm, 0, size);
-        }
-
-        switch (size) {
-        case MO_32:
-            if (signal_all_nans) {
-                gen_helper_vfp_cmpes_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
-            } else {
-                gen_helper_vfp_cmps_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
-            }
-            break;
-        case MO_16:
-            if (signal_all_nans) {
-                gen_helper_vfp_cmpeh_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
-            } else {
-                gen_helper_vfp_cmph_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
-            }
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    }
-
-    gen_set_nzcv(tcg_flags);
-}
-
-/* Floating point compare
- *   31  30  29 28       24 23  22  21 20  16 15 14 13  10    9    5 4     0
- * +---+---+---+-----------+------+---+------+-----+---------+------+-------+
- * | M | 0 | S | 1 1 1 1 0 | type | 1 |  Rm  | op  | 1 0 0 0 |  Rn  |  op2  |
- * +---+---+---+-----------+------+---+------+-----+---------+------+-------+
- */
-static void disas_fp_compare(DisasContext *s, uint32_t insn)
-{
-    unsigned int mos, type, rm, op, rn, opc, op2r;
-    int size;
-
-    mos = extract32(insn, 29, 3);
-    type = extract32(insn, 22, 2);
-    rm = extract32(insn, 16, 5);
-    op = extract32(insn, 14, 2);
-    rn = extract32(insn, 5, 5);
-    opc = extract32(insn, 3, 2);
-    op2r = extract32(insn, 0, 3);
-
-    if (mos || op || op2r) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    switch (type) {
-    case 0:
-        size = MO_32;
-        break;
-    case 1:
-        size = MO_64;
-        break;
-    case 3:
-        size = MO_16;
-        if (dc_isar_feature(aa64_fp16, s)) {
-            break;
-        }
-        /* fallthru */
-    default:
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    handle_fp_compare(s, size, rn, rm, opc & 1, opc & 2);
-}
-
-/* Floating point conditional compare
- *   31  30  29 28       24 23  22  21 20  16 15  12 11 10 9    5  4   3    0
- * +---+---+---+-----------+------+---+------+------+-----+------+----+------+
- * | M | 0 | S | 1 1 1 1 0 | type | 1 |  Rm  | cond | 0 1 |  Rn  | op | nzcv |
- * +---+---+---+-----------+------+---+------+------+-----+------+----+------+
- */
-static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
-{
-    unsigned int mos, type, rm, cond, rn, op, nzcv;
-    TCGLabel *label_continue = NULL;
-    int size;
-
-    mos = extract32(insn, 29, 3);
-    type = extract32(insn, 22, 2);
-    rm = extract32(insn, 16, 5);
-    cond = extract32(insn, 12, 4);
-    rn = extract32(insn, 5, 5);
-    op = extract32(insn, 4, 1);
-    nzcv = extract32(insn, 0, 4);
-
-    if (mos) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    switch (type) {
-    case 0:
-        size = MO_32;
-        break;
-    case 1:
-        size = MO_64;
-        break;
-    case 3:
-        size = MO_16;
-        if (dc_isar_feature(aa64_fp16, s)) {
-            break;
-        }
-        /* fallthru */
-    default:
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    if (cond < 0x0e) { /* not always */
-        TCGLabel *label_match = gen_new_label();
-        label_continue = gen_new_label();
-        arm_gen_test_cc(cond, label_match);
-        /* nomatch: */
-        gen_set_nzcv(tcg_constant_i64(nzcv << 28));
-        tcg_gen_br(label_continue);
-        gen_set_label(label_match);
-    }
-
-    handle_fp_compare(s, size, rn, rm, false, op);
-
-    if (cond < 0x0e) {
-        gen_set_label(label_continue);
-    }
-}
-
 /* Floating-point data-processing (1 source) - half precision */
 static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
 {
@@ -9107,16 +9043,9 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
         disas_fp_fixed_conv(s, insn);
     } else {
         switch (extract32(insn, 10, 2)) {
-        case 1:
-            /* Floating point conditional compare */
-            disas_fp_ccomp(s, insn);
-            break;
-        case 2:
-            /* Floating point data-processing (2 source) */
-            unallocated_encoding(s); /* in decodetree */
-            break;
-        case 3:
-            /* Floating point conditional select */
+        case 1: /* Floating point conditional compare */
+        case 2: /* Floating point data-processing (2 source) */
+        case 3: /* Floating point conditional select */
             unallocated_encoding(s); /* in decodetree */
             break;
         case 0:
@@ -9127,7 +9056,7 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
                 break;
             case 1: /* [15:12] == xx10 */
                 /* Floating point compare */
-                disas_fp_compare(s, insn);
+                unallocated_encoding(s); /* in decodetree */
                 break;
             case 2: /* [15:12] == x100 */
                 /* Floating point data-processing (1 source) */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 3bc2767106..928e69da69 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1325,6 +1325,14 @@ FMINV_s         0110 1110 10 11000 01111 10 ..... .....     @rr_q1e2
 
 FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
 
+# Floating-point Compare
+
+FCMP            00011110 .. 1 rm:5 001000 rn:5 e:1 z:1 000  esz=%esz_hsd
+
+# Floating-point Conditional Compare
+
+FCCMP           00011110 .. 1 rm:5 cond:4 01 rn:5 e:1 nzcv:4  esz=%esz_hsd
+
 # Advanced SIMD Modified Immediate / Shift by Immediate
 
 %abcdefgh       16:3 5:5
-- 
2.43.0

