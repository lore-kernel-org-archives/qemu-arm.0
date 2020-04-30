Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2216480lfm;
        Thu, 30 Apr 2020 11:32:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ2/AuiZVs2Dvx80j4JG+TLt2+NmHgKtXmdZ9csJx6QQkMzQfSU52S1IXwm6ogamHnjHZO2
X-Received: by 2002:a37:7786:: with SMTP id s128mr5067972qkc.497.1588271571305;
        Thu, 30 Apr 2020 11:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588271571; cv=none;
        d=google.com; s=arc-20160816;
        b=r/NBCjbmZvxHqdRzo59wkrmZL0DKdBVPvN4t0N7CsSk1kIrP7+7/VZw8I7Li1lA7aC
         kZgSDUcbChhAAncI6yvKolcPY4QmuQ5h0yMGEBB26u0iD75caZm3aaWzgiVx0j6iLLUP
         A1VvoZg2VFgLeROGWNB8tWOJP7w7g5MTvkf5YcOJIXhAFRwuDaSQAAZKkKOPpD0G7JeX
         jD21uT5k82pkkAlEhX4VHaaO15xXy4QapMni2ifJdQ7mR8QtU2hr56Izjd47tMI/Nai0
         rQ7+gWb4vsmRTV57QOWcG7DVOFmjXTnUMU+uM/DmYsNHegVnQUIS8CMFePQ6K+WEi6Bl
         +cbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZIjWH/BMWn1aPzoUWlcba5rXgD9JHAHjoL2L71Jcs1E=;
        b=g9NKhiyTylKCEflpqC7aCMg27+6ZwGiRwPAcb3/D5f/bTzy/7WPVmRkmvbEWd7cMyO
         xOlOz+ZvmIHq0R0CkSJXqJCH09BxHIT7iP7T3sx0H5USjkChW/neIJsB+xjtiG1ZmLTM
         QzN0jA2qnwsZhxoKY977POObUad2qkBMrQKjiro97SpmlkqZLMmwaLCfis9RyXlKjC+Z
         RVt1G0WMzw3jz7vKvcGEGsVibdUEC9UeeN1YhR2vXLJPUzwfTc3puZFwTRSLG2qcKiff
         rez6dmwo/czzpD6h8X2G6UeFZxkVbyeCSf+Zy6LrN6NbMn3Fol0qqZ5grQyrvheOP9OR
         IpyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYPoP52P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id a73si213799qkb.188.2020.04.30.11.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYPoP52P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDzO-0003ji-Hc
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDed-0002lt-O0
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDe5-0001MM-2C
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:11:23 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDe4-0001LP-Gw
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:10:48 -0400
Received: by mail-wm1-x342.google.com with SMTP id r26so3082735wmh.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZIjWH/BMWn1aPzoUWlcba5rXgD9JHAHjoL2L71Jcs1E=;
 b=cYPoP52PhNL2As4lE55S+uUDA0T1Xtifgl6+37FDoRNCHP1rulxDpHotQ2UseUU1Cp
 ejxC1+hvS+pSJXYwBqZEOAXxQDC02TtekQs5tB4ctl/qNviBXsVjykLDgRDdejg24jsO
 qxa/jrzilA40w3QobOpowc/co3oKoGTpkdRsZVjdqBsaMxKjJDQDr2803Htc1dRS6+8B
 O3LK4LQXXql+JdTQqwO4rBDewJvJi6pSAgT84/P3zvl9SOH9aXUJ386JOkmlovRX/sOT
 Jq6xpt35ahygrJKdJOE9eVIg4xRWIMHazk9AHw8Al+VMUiy7SAilgCLCJzx3G/DgY+95
 23gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZIjWH/BMWn1aPzoUWlcba5rXgD9JHAHjoL2L71Jcs1E=;
 b=oyD0m4Y3VvIjZLq0cYsVU4ghFagOBQJck36nj1TR4qXLsCizCfTbCN38yno8h/ymLL
 vHuguhiZ4XLsya5CKpWe1CAgfoONLx/fOK4NRMg+n9gD/1/PKDWa1tef0AcILDWwK0An
 fTvdiEUs1A36iDnVdHbLbzOGUKpaMksY69Hl4zhG6C9D2OFf0puq9J7NCeyT5h7pFL8l
 1Wa8lQVoJ/I/MPCFNepPV1ZG6/DBwda1NV5irvDqoMGM6EjA3pqqcWdpkSTrMqVgSTtj
 IWiygmp2tYlm9KzYUH4ichaKILlPtPHfYB+7K6xzYQdHMHn4G6kDvMkXvwmGzLa6plch
 MBeQ==
X-Gm-Message-State: AGi0PuaKxYuLHV+esQf14g2OzHU9QNgXIeGx2ltD+ZPTxucMmitv28Tv
 0OUn8QSwOJqvsh2AxsiUlW0uP9Msz8Ekeg==
X-Received: by 2002:a05:600c:210:: with SMTP id
 16mr4148549wmi.57.1588270244911; 
 Thu, 30 Apr 2020 11:10:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 31/36] target/arm: Convert Neon VADD, VSUB,
 VABD 3-reg-same insns to decodetree
Date: Thu, 30 Apr 2020 19:09:58 +0100
Message-Id: <20200430181003.21682-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XYdRW8bCfxP+

Convert the Neon VADD, VSUB, VABD 3-reg-same insns to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 54 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 10 ++----
 target/arm/neon-dp.decode       |  8 +++++
 3 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 2fab547840d..6a27b7673c2 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1321,3 +1321,57 @@ static bool trans_VQRDMULH_3s(DisasContext *s, arg_3same *a)
     }
     return do_3same_32(s, a, fns[a->size - 1]);
 }
+
+static bool do_3same_fp(DisasContext *s, arg_3same *a, VFPGen3OpSPFn *fn)
+{
+    /* FP operations handled elementwise 32 bits at a time */
+    TCGv_i32 tmp, tmp2;
+    int pass;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vn | a->vm | a->vd) & a->q) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    TCGv_ptr fpstatus = get_fpstatus_ptr(1);
+    for (pass = 0; pass < (a->q ? 4 : 2); pass++) {
+        tmp = neon_load_reg(a->vn, pass);
+        tmp2 = neon_load_reg(a->vm, pass);
+        fn(tmp, tmp, tmp2, fpstatus);
+        tcg_temp_free_i32(tmp2);
+        neon_store_reg(a->vd, pass, tmp);
+    }
+    tcg_temp_free_ptr(fpstatus);
+    return true;
+}
+
+/*
+ * For all the functions using this macro, size == 1 means fp16,
+ * which is an architecture extension we don't implement yet.
+ */
+#define DO_3S_FP(INSN,FUNC)                                         \
+    static bool trans_##INSN##_fp_3s(DisasContext *s, arg_3same *a) \
+    {                                                               \
+        if (a->size != 0) {                                         \
+            /* TODO fp16 support */                                 \
+            return false;                                           \
+        }                                                           \
+        return do_3same_fp(s, a, FUNC);                             \
+    }
+
+DO_3S_FP(VADD, gen_helper_vfp_adds)
+DO_3S_FP(VSUB, gen_helper_vfp_subs)
+DO_3S_FP(VABD, gen_helper_neon_abd_f32)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9fec1889613..c944cbf20af 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4797,6 +4797,9 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         switch (op) {
         case NEON_3R_FLOAT_ARITH:
             pairwise = (u && size < 2); /* if VPADD (float) */
+            if (!pairwise) {
+                return 1; /* handled by decodetree */
+            }
             break;
         case NEON_3R_FLOAT_MINMAX:
             pairwise = u; /* if VPMIN/VPMAX (float) */
@@ -4853,16 +4856,9 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         {
             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
             switch ((u << 2) | size) {
-            case 0: /* VADD */
             case 4: /* VPADD */
                 gen_helper_vfp_adds(tmp, tmp, tmp2, fpstatus);
                 break;
-            case 2: /* VSUB */
-                gen_helper_vfp_subs(tmp, tmp, tmp2, fpstatus);
-                break;
-            case 6: /* VABD */
-                gen_helper_neon_abd_f32(tmp, tmp, tmp2, fpstatus);
-                break;
             default:
                 abort();
             }
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 8ceedd8b8d8..9d6a17d6f04 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -45,6 +45,10 @@
 @3same_q0        .... ... . . . size:2 .... .... .... . 0 . . .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp q=0
 
+# For FP insns the high bit of 'size' is used as part of opcode decode
+@3same_fp        .... ... . . . . size:1 .... .... .... . q:1 . . .... \
+                 &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
 VHADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 0 .... @3same
 VHADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 0 .... @3same
 VQADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 1 .... @3same
@@ -154,3 +158,7 @@ SHA256SU1_3s     1111 001 1 0 . 10 .... .... 1100 . 1 . 0 .... \
                  vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 VQRDMLSH_3s      1111 001 1 0 . .. .... .... 1100 ... 1 .... @3same
+
+VADD_fp_3s       1111 001 0 0 . 0 . .... .... 1101 ... 0 .... @3same_fp
+VSUB_fp_3s       1111 001 0 0 . 1 . .... .... 1101 ... 0 .... @3same_fp
+VABD_fp_3s       1111 001 1 0 . 1 . .... .... 1101 ... 0 .... @3same_fp
-- 
2.20.1

