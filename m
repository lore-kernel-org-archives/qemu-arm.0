Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3440078njb;
        Tue, 10 Dec 2024 08:21:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXxmU/pxFcjEgEMT7jPYWT6Mj3iOytxMQd5ysGbSzdwjrxbLf4usyMJxdPp3cUDLlUV7NPYjIF8cychbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHMJfM+3tM9/tC/XATHqiFS4Ipnv+cMT83PYqayChu5qRsZkLwD47JYmO9wzl0wBkJA5TrE
X-Received: by 2002:a05:622a:4ac7:b0:467:4395:2ac9 with SMTP id d75a77b69052e-46771fadffbmr87169111cf.31.1733847715178;
        Tue, 10 Dec 2024 08:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847715; cv=none;
        d=google.com; s=arc-20240605;
        b=Du1M2Y7THhof3D/PexWUoXTQ5WxzqPTJT64OLTpp8e809QuD1l5e1dQ8oOtPYsJsZ9
         pWCf8tuL1SN1JmIlrp2iOsox1/kAQDqa+j54VfN8WxI1643BH5jniOaRTs/2hqWU4Hsu
         eJJjsuFLjcObfFybD1SckbOCni1V4DOCXO3DsmCrwO2+/wGdAxFbhX5FhAhhbn7b5Ola
         IV8nl0taN3LPVsfOx4uTJ8QwaUHyx+Df9e6ntQH5LRtVLAKuAooDYDqhrxUp409fjfJd
         KE8tKMZWFf08vgAnk+v6qKrJbdJVr/Sh3+2VOIjsuabazDSFdjYXDvHrRE7ewfAV54k/
         NPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=17GfbZjW6epwa8YFLq0I3cD8ORZgiSit6nkfbKV++nM=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=hni/wQPS3IwfUyspN7LJA4aixPyLNbWoLiQtLtVDHeBjlyhN8nfIXHNq6JD5hE6ge+
         adr3JLO5JhC1oYal3qFbVkj0A5wbN/2WxOB8O7qNe4/Su97qCa3bRfTLiXJnCL44Z1lC
         du3oo2NO5SLvfBF5rxdBRZUW8sfeBR+FmTj2upI4VRcdUzMlA5lhobNlnOveSDOxvY+v
         YcLTa1U7EZf55O3yteZxcdbQCY5Iswi7DjL+zRmzZwHpSM1WlGIevjV6NgRk5d03vIwr
         uRrtUG1yFn0UA6zVr6eoygp6o/aLvUVgUrHnUmkMuDI6yj4IG+yIFQ16PfI9hjAgwPiY
         JZhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OepxT+07;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46760049174si73433101cf.281.2024.12.10.08.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:21:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OepxT+07;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2xO-0003gb-Hc; Tue, 10 Dec 2024 11:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2x8-0002y8-B6
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:19:19 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2x5-0006TV-6U
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:19:14 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3003d7ca01cso33728031fa.0
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847549; x=1734452349; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=17GfbZjW6epwa8YFLq0I3cD8ORZgiSit6nkfbKV++nM=;
 b=OepxT+0755leS2+Il+KLj5I8bZSshiS9IAJ4JS0VNfWyiBJf+SRzeAbBCabXu9EwEl
 bqK8akIJpHCJD/VOK+18svCH7v53k6BA2UChO5an+oJW8h8y22ql8m0FtMc5BFqRm+cX
 N5Ppi1PqjEXnZ4DTDeepezvGfUbPvCrMZvAVKgzgv8TpQvYiEZZmsznPmjTZQ+CCfiL3
 pI3ZrLB7N3dd3StjqeuWtQFeaByfXWV6dJI9jNgsi76ji6yFT8EqVnA4c6xOVCfitEei
 zxH3HArCUuON5+TpQmb2DR7PxZR+oFPP4KF2kzdb7eJum4gPbr0YF3cwfEwVDNcx+dZv
 /ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847549; x=1734452349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17GfbZjW6epwa8YFLq0I3cD8ORZgiSit6nkfbKV++nM=;
 b=KRL2vSLzU/oss6JmnnTFN3ZDuf4s8QsKkRbKnSsnTV66Y8spmMA1EsFfk63AP39JEU
 zl7sKAyHCbGsQm+EDgiIY9+of4ddpExtuiy2ZZpRUaF1d61eY6ai4mj6im+6IvcC2XbN
 I9CQh/YhNFljWixp0dxSX2W4GkT9g4W4rP1JzCjxQvgxydpjPJP+8qrj/BqleRP7Ud0N
 1zNZ/ADlXdsEj6JaXeSAJhhl2rees2yj/PgfP9pHKqNUCOMGNuKecg1/7kIv2G0xWGpo
 2zbr8DNPz4eC35xIGcpQYPmwn4ZnMQxzUhkjSQc/A/p3ooM9D2s67bFHrf4tucsMkCqv
 Phug==
X-Gm-Message-State: AOJu0YxqBBoWlqdYUyFn2FYLrTxKH6IECJUpkbyU3K+tRlePIU+MARKg
 WPGXWwy6qPc+RYiwFSU0yd6VBYBcr6DZoZxyO0t34Br3tCrK+vxwtL4441KUjfappT2LhLFORst
 17a7JRosF
X-Gm-Gg: ASbGncsnyoHuGS0zmWCYVkHlKm5iiyhf4nZTanFyQzUtSnWnAqqGQVOTgkrXysaqNzh
 Rxl7IIBN7zO+NbBp0sqaJR4uJUDGT2bwSYosRIyyZ0Fq+CbP6KH5TRcX0sZ5qM4OS/jpkirXMVo
 EdzNZNrzP5cBzmujY77DB5VbuScjCTmgS2Cc8yTWFfUC6slc9Sg8SS6iDWgXVw0jNR/DcOvlp00
 QrzQJz6LbSaOfbvJ8gOm4NFUrM9EIpncmPLCZn1/Mjg2YeJgBNF9AyKCgo=
X-Received: by 2002:a19:5e1a:0:b0:53e:2f9d:6a7a with SMTP id
 2adb3069b0e04-53e2f9d7be0mr3975966e87.46.1733847549316; 
 Tue, 10 Dec 2024 08:19:09 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:19:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 22/69] target/arm: Convert FCMP, FCMPE, FCCMP,
 FCCMPE to decodetree
Date: Tue, 10 Dec 2024 10:16:46 -0600
Message-ID: <20241210161733.1830573-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22d.google.com
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
X-TUID: fmaj9ppP770w

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 283 ++++++++++++---------------------
 target/arm/tcg/a64.decode      |   8 +
 2 files changed, 112 insertions(+), 179 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4611ae4ade..a99f3d0d13 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6888,6 +6888,106 @@ static bool trans_FMOVI_s(DisasContext *s, arg_FMOVI_s *a)
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
+    int check = fp_access_check_scalar_hsd(s, a->esz);
+
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
@@ -8183,174 +8283,6 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
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
@@ -9107,16 +9039,9 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
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
@@ -9127,7 +9052,7 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
                 break;
             case 1: /* [15:12] == xx10 */
                 /* Floating point compare */
-                disas_fp_compare(s, insn);
+                unallocated_encoding(s); /* in decodetree */
                 break;
             case 2: /* [15:12] == x100 */
                 /* Floating point data-processing (1 source) */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 5670846768..7868b1cb24 100644
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

