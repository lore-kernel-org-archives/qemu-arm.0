Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4192803njb;
        Wed, 11 Dec 2024 08:36:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWUGpr2rLlVc7ueHrbx5sIxgQcnBVf77ahD12E6BU43MEnX2to4EwVQwIza1cs0VVvfeZHaXWj1piWSWg==@linaro.org
X-Google-Smtp-Source: AGHT+IELunY0GXdTuc6SGekcgEVG9MkR+sHBTaFovfZ9Pepwqc94gu3lqCIKQwES6mHgpzHnaVRq
X-Received: by 2002:a05:6214:2aad:b0:6d8:8a8f:75b0 with SMTP id 6a1803df08f44-6d934aee40emr59110306d6.14.1733934984201;
        Wed, 11 Dec 2024 08:36:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934984; cv=none;
        d=google.com; s=arc-20240605;
        b=SE22ycxEJS6SmX0fhym2cBUioC6/0cPOrtGMiQu2bFkHyBOIkQG43Ahu1YEHcraLyW
         3Qp2LvZ7LWifADIFYAfsNd7Ff3hEZ02I/5Llfj0YVXKuUv6kOzidnzRIJvCrAle6Cyl1
         tBsJHI7LLdaT+2bEdRWloRZH8ggV+SUuouLRDFKeXjKqr2ZbkAv7Ljk5b2akwhn5J137
         2vphyEC2p1Jf5iiSyY4gHdOrv0QlfQUoYLWl50Ajnvj66ROevEwtCyzjZ/jZ9vJcZnhJ
         8KgHzXeQ0cqmU1TPMNAwfIDE/+/iH6+QH1zO5iN2QSuX22ravVd0Qjnp3/9kytbZjbNf
         5ahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XlraVMJV+QICbAoWHNIxUyq3rj5apVKNQP4YDSIMpEQ=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=es3grOKrYh/xiJwJbGiA1aBKvkABWWZWXas+74yfyk9z37BFi5P3u70ArwWxKHpu/f
         N6B57Fu2UL1YqZFUfOhNFqy0sx5xMKXt4mdMhaSRyyrXhTvmG8Qmtt7WeTjQBtnmxkkg
         1ojAAW9ofLW2uoPclzo1yf/2RG6InwPw4PXiuEpQJHCMSl9tiVNt8vAy6W3tXKDMgpdh
         tKA7tqmSE6dzaiCCApy7/wegRFtb1GFJdKpEOM2lcE2bI6ezsRs5iMxGPoqnTZRthLWH
         xbp2jmtjJk4ka79dSisiudy0olWvLm/4oYDX2RjbfryO+Q2tVu1PtGa1RoiC8HGGRv6b
         hFdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cf1o+xml;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8f4361755si133778286d6.120.2024.12.11.08.36.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:36:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cf1o+xml;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPcc-0004Jc-DK; Wed, 11 Dec 2024 11:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcK-0003rE-E9
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:17 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcH-0001BF-AQ
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:15 -0500
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-4675d91ea1fso33280401cf.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934669; x=1734539469; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XlraVMJV+QICbAoWHNIxUyq3rj5apVKNQP4YDSIMpEQ=;
 b=cf1o+xmlbqzoJNYL3iPFRt2SOcjfGCwsznJtXUSvt0MqgkprAq4SmU9OB/JiRmvACh
 wH1wtyAU3aPeo5rsWloJR5ppP4hBs3rHLecn+mROtd3fSge81AZk3sczTTjLLy3MYIuS
 Y3WfTFIeITMcLhMBt07DGzWydU7Y0rm1TZvvJKXY3lpbo5a+zcNfUiiT/zE7MktdcYDD
 hvMAQ42bimCp8HA9fac9kbZ7Uv0FzUZ5WHDXANZlQ1j4V3NdM6KFwHqHocNs05+WbI3F
 9WdvfP8OdbG4XJ5638FD28n7biSxVApH8m+RB5UkDMibY47KKBPLbO+S5he67uVNsr+6
 RmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934669; x=1734539469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XlraVMJV+QICbAoWHNIxUyq3rj5apVKNQP4YDSIMpEQ=;
 b=AR0oZdelTKVvTYCE6thAlV1/W3EXVOL2q1ofI3ePTpnEQzTi+vJqAi4zelGc5veRBV
 vnvd7M1s/8l3VdQnKz6od0vErDcEYOdkvc+2pARHcVE6fJsUWeOU2McXQekQyUWwEGub
 xgey0nY8eJUqcA08gM7fUq5RK/XYXym4mv0ocXp53EIoAPr/INTrmTAnDORhwiwxHxUj
 J36iUPblFBgifXkck7HGDD9Cm0blAxiM//H36G5joIncjQ+jTsciaX7ujjRaktEF1qDf
 2oI6Mukk6v91ZJY3sbFrSbbzaWM7ytDFQnU1JaGnCboUwBaXjNYTzWC22eSIhluyBMt8
 KO9Q==
X-Gm-Message-State: AOJu0YxoyA8U1sBxM5PuzPLY3O0trGmP3vbKG7UDbqhd1kUQRfu/XlzC
 GdH9wFBGOkOWLzJDwytLEMayTQVxlvf8BiEhLL+yiDpixbnq+hOrMQ6CEpZnbzk=
X-Gm-Gg: ASbGncspMF0+HeyoVzP/JxDDutwMUdMatSXraJpJOf2A3OyPVwTVzTgcJX7mQ6IwDjU
 9YhFD1erJCBYuZ2ShEpN2UGeK6R3dnX8TghSDpo+GDQU8RJHiIfRCzoqAVGlXmeJadEJktfab19
 AEWLTm1I0gosRbzEWjK728V6b/+VmuQLmf8jRqBCg3GEr/cp96dkxD0yliR9a3M2hq7mG2k8RSW
 Bw5QkzvpSqZa89ELtuHYXGd/oSl00MjSQZJ3ci3uu0EjF3IZBBRAV4GtslSIg==
X-Received: by 2002:a05:622a:1789:b0:467:86be:faff with SMTP id
 d75a77b69052e-467893c666fmr78509821cf.55.1733934669603; 
 Wed, 11 Dec 2024 08:31:09 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:31:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 05/69] target/arm: Convert SUBP, IRG, GMI to decodetree
Date: Wed, 11 Dec 2024 10:29:32 -0600
Message-ID: <20241211163036.2297116-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hXIAXHd292Cv

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 94 +++++++++++++++++++---------------
 target/arm/tcg/a64.decode      |  7 +++
 2 files changed, 59 insertions(+), 42 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 22594a1149..00e55d42ff 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7625,6 +7625,55 @@ static bool do_crc32(DisasContext *s, arg_rrr_e *a, bool crc32c)
 TRANS_FEAT(CRC32, aa64_crc32, do_crc32, a, false)
 TRANS_FEAT(CRC32C, aa64_crc32, do_crc32, a, true)
 
+static bool do_subp(DisasContext *s, arg_rrr *a, bool setflag)
+{
+    TCGv_i64 tcg_n = read_cpu_reg_sp(s, a->rn, true);
+    TCGv_i64 tcg_m = read_cpu_reg_sp(s, a->rm, true);
+    TCGv_i64 tcg_d = cpu_reg(s, a->rd);
+
+    tcg_gen_sextract_i64(tcg_n, tcg_n, 0, 56);
+    tcg_gen_sextract_i64(tcg_m, tcg_m, 0, 56);
+
+    if (setflag) {
+        gen_sub_CC(true, tcg_d, tcg_n, tcg_m);
+    } else {
+        tcg_gen_sub_i64(tcg_d, tcg_n, tcg_m);
+    }
+    return true;
+}
+
+TRANS_FEAT(SUBP, aa64_mte_insn_reg, do_subp, a, false)
+TRANS_FEAT(SUBPS, aa64_mte_insn_reg, do_subp, a, true)
+
+static bool trans_IRG(DisasContext *s, arg_rrr *a)
+{
+    if (dc_isar_feature(aa64_mte_insn_reg, s)) {
+        TCGv_i64 tcg_rd = cpu_reg_sp(s, a->rd);
+        TCGv_i64 tcg_rn = cpu_reg_sp(s, a->rn);
+
+        if (s->ata[0]) {
+            gen_helper_irg(tcg_rd, tcg_env, tcg_rn, cpu_reg(s, a->rm));
+        } else {
+            gen_address_with_allocation_tag0(tcg_rd, tcg_rn);
+        }
+        return true;
+    }
+    return false;
+}
+
+static bool trans_GMI(DisasContext *s, arg_rrr *a)
+{
+    if (dc_isar_feature(aa64_mte_insn_reg, s)) {
+        TCGv_i64 t = tcg_temp_new_i64();
+
+        tcg_gen_extract_i64(t, cpu_reg_sp(s, a->rn), 56, 4);
+        tcg_gen_shl_i64(t, tcg_constant_i64(1), t);
+        tcg_gen_or_i64(cpu_reg(s, a->rd), cpu_reg(s, a->rm), t);
+        return true;
+    }
+    return false;
+}
+
 /* Logical (shifted register)
  *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
  * +----+-----+-----------+-------+---+------+--------+------+------+
@@ -8528,48 +8577,6 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0: /* SUBP(S) */
-        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
-            goto do_unallocated;
-        } else {
-            TCGv_i64 tcg_n, tcg_m, tcg_d;
-
-            tcg_n = read_cpu_reg_sp(s, rn, true);
-            tcg_m = read_cpu_reg_sp(s, rm, true);
-            tcg_gen_sextract_i64(tcg_n, tcg_n, 0, 56);
-            tcg_gen_sextract_i64(tcg_m, tcg_m, 0, 56);
-            tcg_d = cpu_reg(s, rd);
-
-            if (setflag) {
-                gen_sub_CC(true, tcg_d, tcg_n, tcg_m);
-            } else {
-                tcg_gen_sub_i64(tcg_d, tcg_n, tcg_m);
-            }
-        }
-        break;
-    case 4: /* IRG */
-        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
-            goto do_unallocated;
-        }
-        if (s->ata[0]) {
-            gen_helper_irg(cpu_reg_sp(s, rd), tcg_env,
-                           cpu_reg_sp(s, rn), cpu_reg(s, rm));
-        } else {
-            gen_address_with_allocation_tag0(cpu_reg_sp(s, rd),
-                                             cpu_reg_sp(s, rn));
-        }
-        break;
-    case 5: /* GMI */
-        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
-            goto do_unallocated;
-        } else {
-            TCGv_i64 t = tcg_temp_new_i64();
-
-            tcg_gen_extract_i64(t, cpu_reg_sp(s, rn), 56, 4);
-            tcg_gen_shl_i64(t, tcg_constant_i64(1), t);
-            tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t);
-        }
-        break;
     case 12: /* PACGA */
         if (sf == 0 || !dc_isar_feature(aa64_pauth, s)) {
             goto do_unallocated;
@@ -8579,8 +8586,11 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
         break;
     default:
     do_unallocated:
+    case 0: /* SUBP(S) */
     case 2: /* UDIV */
     case 3: /* SDIV */
+    case 4: /* IRG */
+    case 5: /* GMI */
     case 8: /* LSLV */
     case 9: /* LSRV */
     case 10: /* ASRV */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 1664f4793c..f0a5ffb1cd 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -26,6 +26,7 @@
 %hlm            11:1 20:2
 
 &r              rn
+&rrr            rd rn rm
 &ri             rd imm
 &rri_sf         rd rn imm sf
 &rrr_sf         rd rn rm sf
@@ -656,6 +657,7 @@ CPYE            00 011 1 01100 ..... .... 01 ..... ..... @cpy
 
 # Data Processing (2-source)
 
+@rrr            . .......... rm:5 ...... rn:5 rd:5      &rrr
 @rrr_sf         sf:1 .......... rm:5 ...... rn:5 rd:5   &rrr_sf
 
 UDIV            . 00 11010110 ..... 00001 0 ..... ..... @rrr_sf
@@ -675,6 +677,11 @@ CRC32C          0 00 11010110 ..... 0101 01 ..... ..... @rrr_h
 CRC32C          0 00 11010110 ..... 0101 10 ..... ..... @rrr_s
 CRC32C          1 00 11010110 ..... 0101 11 ..... ..... @rrr_d
 
+SUBP            1 00 11010110 ..... 000000 ..... .....  @rrr
+SUBPS           1 01 11010110 ..... 000000 ..... .....  @rrr
+IRG             1 00 11010110 ..... 000100 ..... .....  @rrr
+GMI             1 00 11010110 ..... 000101 ..... .....  @rrr
+
 # Data Processing (1-source)
 # Logical (shifted reg)
 # Add/subtract (shifted reg)
-- 
2.43.0

