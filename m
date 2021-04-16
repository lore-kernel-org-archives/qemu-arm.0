Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp654771lfr;
        Fri, 16 Apr 2021 12:08:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4gYbDrdkZ7hrhiUGbfVLADaUm4kBA7gcVgh8nJ3Sou5MJZ98UHDnrjQ+FIt76pqZsPDse
X-Received: by 2002:a92:7f08:: with SMTP id a8mr8387878ild.87.1618600127517;
        Fri, 16 Apr 2021 12:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618600127; cv=none;
        d=google.com; s=arc-20160816;
        b=S/9HrsyIK1Tyx+wosC2NeA0LVhQuynyPam93tV5/UdBe2K4x58qyaOPwBnFOT0uAEA
         9KdzvWd+wvDcKGieOjUOFJBwHOQwDP0K7bMUUynX7FhCR3TnV9hFuvffBep5VTUDOdrs
         hMj78eCQCIxt5pCHnYNDD+psydb4kMcXbHq1YePt7vqV9D80GKxMvrZ6eOyOlKcxlEZu
         OfkbYkuBVAO6TBANhqKYt869CsH4bMXA0kqjyi+IewhicKXoQ+2DUjy/+mWCFulDBJ8Y
         3q9Se6eu3rzywVPNHY2exaxkJIJJ3kUaU+vLx+SxPR18scgjOcdFBNRYixNN1eocxB2A
         XUpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4JYXrsziQJ+2kkGBxoTfc1nhhgeCmFg+itswQ++dMS0=;
        b=HyhOzPqGEIhdjJVLi624tEIaWjCUfd5Ecpn0+QCCU1AG9x6cfqTvnx/9MGZ/WW1V33
         eR0hM2LIVY9q7gTgZDcR2SkLu7MimHFsV5ZlVwS85AVEZnrbUd9W5CopjI9oRZGzGUeB
         tIHhmMtbJXYOCucRCio2criuHvLslqDT1nFhOXHM4pIUlDSB3+9akCuQU//5ewWmo4Dv
         iffanBrzsjLetm5DQoV76NncnbAEHKJnNLZsBw0JILelb+eFAix1NNh8SNSlDF9MkUTB
         hCfxepGdJbuaeIkgwHiDKxYUUEtYTITs/lxh2+s7q7h9ctF7gFUhog+wNpx9jqC2y1x+
         4+RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MMXATsoT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si2513388jap.69.2021.04.16.12.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:08:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MMXATsoT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTpe-0004ey-Qf
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThf-0003bq-Rs
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:31 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThP-0004Ke-34
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:31 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q10so19811987pgj.2
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4JYXrsziQJ+2kkGBxoTfc1nhhgeCmFg+itswQ++dMS0=;
 b=MMXATsoTqhVtFU/Z+UvY//C4A0uGt6ec7aguA5lEu7IbdJt6zRnP2KqrYQQYdaQHN2
 +AUks5fcaGEyoLgKW97iRMRkskzLzrmuJmYy0uwRMPtgaF/jvu5bAt9iJokz7P936Eel
 Wt8MngAmP6zsg1Pm5q4NUJ9igeO8aVcE2cFWcn/8gkce8HslWsgKjy+IQJtaAwEjg7D0
 GIMHoV5eoG4x6rWYWKnTRWSWNYek5/hVmyU13eeNW9eQBMX9mUh62LZGc205N2Y1u64/
 hBN4X8993EzPQuggOiE3ihsCiPW9zd7i9+AUwKQ0hYFfPKsO5QnadQF/L3L4ujTOGR9O
 IhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4JYXrsziQJ+2kkGBxoTfc1nhhgeCmFg+itswQ++dMS0=;
 b=trNEZBQbY2uzUAHwnkgkUr6gOJ619CYlRW+1P8b5hdF1Nqx41wRHpAecB1XV8eAE3R
 hqsujJQix/7XmyQXnv4BwSjm3BxMFORiz1JT6irKy+3nTJMLkrgsEGrbY1AdLi3Ogunk
 /UXjKA7ZSZBInK9hsi1qmgbb5jdZPHZvh+MEoL+98P7C6U9hbz46YK4rs1U+7CiUof22
 XIBLn03LBbPX5JhPnC1E/AbFjxa6E3uZve2zmiMdIWzpMQEN+Z/fsOjUdZZnCGFXBc5E
 OZe8R+OiM+WAdNWmb7DylQucrAWx/QOlJMaB6MHS4kxLcMEHSuNG1hrCth+x2PbAkENy
 mA3Q==
X-Gm-Message-State: AOAM533R3ifF57lEzhF5HKdFYtN2L05bb81aiGsEdHykqwoJcdfpHB9u
 iog880jaaNUkdZ0ETnXKU4jZ6A==
X-Received: by 2002:a65:6095:: with SMTP id t21mr456207pgu.383.1618599613146; 
 Fri, 16 Apr 2021 12:00:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/30] target/arm: Adjust gen_aa32_{ld,
 st}_i64 for align+endianness
Date: Fri, 16 Apr 2021 11:59:42 -0700
Message-Id: <20210416185959.1520974-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /eGKvy7OnegF

Adjust the interface to match what has been done to the
TCGv_i32 load/store functions.

This is less obvious, because at present the only user of
these functions, trans_VLDST_multiple, also wants to manipulate
the endianness to speed up loading multiple bytes.  Thus we
retain an "internal" interface which is identical to the
current gen_aa32_{ld,st}_i64 interface.

The "new" interface will gain users as we remove the legacy
interfaces, gen_aa32_ld64 and gen_aa32_st64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c          | 78 +++++++++++++++++++--------------
 target/arm/translate-neon.c.inc |  6 ++-
 2 files changed, 49 insertions(+), 35 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 52b9ca502e..7472e98f09 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -949,6 +949,37 @@ static void gen_aa32_st_internal_i32(DisasContext *s, TCGv_i32 val,
     tcg_temp_free(addr);
 }
 
+static void gen_aa32_ld_internal_i64(DisasContext *s, TCGv_i64 val,
+                                     TCGv_i32 a32, int index, MemOp opc)
+{
+    TCGv addr = gen_aa32_addr(s, a32, opc);
+
+    tcg_gen_qemu_ld_i64(val, addr, index, opc);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
+        tcg_gen_rotri_i64(val, val, 32);
+    }
+    tcg_temp_free(addr);
+}
+
+static void gen_aa32_st_internal_i64(DisasContext *s, TCGv_i64 val,
+                                     TCGv_i32 a32, int index, MemOp opc)
+{
+    TCGv addr = gen_aa32_addr(s, a32, opc);
+
+    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        tcg_gen_rotri_i64(tmp, val, 32);
+        tcg_gen_qemu_st_i64(tmp, addr, index, opc);
+        tcg_temp_free_i64(tmp);
+    } else {
+        tcg_gen_qemu_st_i64(val, addr, index, opc);
+    }
+    tcg_temp_free(addr);
+}
+
 static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
                             int index, MemOp opc)
 {
@@ -961,6 +992,18 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
     gen_aa32_st_internal_i32(s, val, a32, index, finalize_memop(s, opc));
 }
 
+static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                            int index, MemOp opc)
+{
+    gen_aa32_ld_internal_i64(s, val, a32, index, finalize_memop(s, opc));
+}
+
+static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                            int index, MemOp opc)
+{
+    gen_aa32_st_internal_i64(s, val, a32, index, finalize_memop(s, opc));
+}
+
 #define DO_GEN_LD(SUFF, OPC)                                            \
     static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val, \
                                          TCGv_i32 a32, int index)       \
@@ -975,47 +1018,16 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
         gen_aa32_st_i32(s, val, a32, index, OPC);                       \
     }
 
-static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
-{
-    TCGv addr = gen_aa32_addr(s, a32, opc);
-    tcg_gen_qemu_ld_i64(val, addr, index, opc);
-
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
-        tcg_gen_rotri_i64(val, val, 32);
-    }
-
-    tcg_temp_free(addr);
-}
-
 static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 a32, int index)
 {
-    gen_aa32_ld_i64(s, val, a32, index, MO_Q | s->be_data);
-}
-
-static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
-{
-    TCGv addr = gen_aa32_addr(s, a32, opc);
-
-    /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
-        TCGv_i64 tmp = tcg_temp_new_i64();
-        tcg_gen_rotri_i64(tmp, val, 32);
-        tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-        tcg_temp_free_i64(tmp);
-    } else {
-        tcg_gen_qemu_st_i64(val, addr, index, opc);
-    }
-    tcg_temp_free(addr);
+    gen_aa32_ld_i64(s, val, a32, index, MO_Q);
 }
 
 static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
                                  TCGv_i32 a32, int index)
 {
-    gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
+    gen_aa32_st_i64(s, val, a32, index, MO_Q);
 }
 
 DO_GEN_LD(8u, MO_UB)
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index c82aa1412e..18d9042130 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -494,11 +494,13 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                 int tt = a->vd + reg + spacing * xs;
 
                 if (a->l) {
-                    gen_aa32_ld_i64(s, tmp64, addr, mmu_idx, endian | size);
+                    gen_aa32_ld_internal_i64(s, tmp64, addr, mmu_idx,
+                                             endian | size);
                     neon_store_element64(tt, n, size, tmp64);
                 } else {
                     neon_load_element64(tmp64, tt, n, size);
-                    gen_aa32_st_i64(s, tmp64, addr, mmu_idx, endian | size);
+                    gen_aa32_st_internal_i64(s, tmp64, addr, mmu_idx,
+                                             endian | size);
                 }
                 tcg_gen_add_i32(addr, addr, tmp);
             }
-- 
2.25.1

