Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3444460njb;
        Tue, 10 Dec 2024 08:27:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW4G/HqhjSqLa3WELFD8DhFMoqqQWH2hIjfgNFD+EWUp83i18MqwhXcXiWh8nyJ607lJ/g3yAo0sJTUZw==@linaro.org
X-Google-Smtp-Source: AGHT+IEdcIrT9VUwKSVWRme8V+IW11NaOOd2dp/BZWjCoxGNg55vSpbovKGNg/39ebaETgmCDXLb
X-Received: by 2002:a05:622a:50:b0:467:6833:e30c with SMTP id d75a77b69052e-4676833eaf7mr100262241cf.30.1733848072819;
        Tue, 10 Dec 2024 08:27:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733848072; cv=none;
        d=google.com; s=arc-20240605;
        b=Tcovl/QZeBFBFmxuOi750hjCBUKbEDLeKiJcbYUQ2NqcRIlXAw8STyBoQAsLWz+F3D
         txaXnWuVCfbN7tcsnguxvNcrC7xadjep4nE3R8FxMrKyvZvMRnUseFC9rN607SYpSL3a
         ZcndFAJB839gPFylAZ0pdOIJl9nbPGffaWWs91inZU6HCuZgdv7i/oVjcXb6NzfNzG3h
         z2cv6TBvVeJKiFqOYrYBl+f3W+KCKQkYzRfA5K4lmqP6d0tTEsKUnyNAwp1Q0JM2aeRq
         +mrKyUvM/OImAT/Nn4suQ1XX0NBg4MYlN3F2advgZ2S8SByq418sK262Giyz2pOV1vJQ
         FZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c7yOIgCfYAXIlxzBS7Y/cffRsUFfY+7qJLLPOfonFXk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=PeDvAgKGiIJPdD0o/ADWOEUzeXimgY9vWK/Gb7lnuS1pPit4VD3Oh9/uCHVjADUT0t
         2UMTGIsmmwmPRViNDFor+bj7OGpRjpzEOJjF7KVh5by9/m1d7si2i9EG5/bNe4huYryT
         TCR289gSSsq+CEhYNoEvLDA+yDuld+UmCSyL8IhjY3fwU1/eYMs5j3pDkvrJBTx3X1Bz
         XgKb6JfLVx1wboUwiy8iuVIv5DRLrjXhQJXFXv33bZ5IQ0z50l0Bt5aF3Y10N/HLew/B
         m/X9khryqKSa1QxJMMkCB9Rly3yx7yqnNOgrcEdAIJ0XJqaxap23/kdN82cRNq5k1zfi
         XIow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=arHEQ+pN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467297bb2a3si153530791cf.259.2024.12.10.08.27.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:27:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=arHEQ+pN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL33I-0002de-Kj; Tue, 10 Dec 2024 11:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32R-0007uT-Ow
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:24:45 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32N-0007Xv-0y
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:24:43 -0500
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so2263397e87.1
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847873; x=1734452673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7yOIgCfYAXIlxzBS7Y/cffRsUFfY+7qJLLPOfonFXk=;
 b=arHEQ+pNMcgYHKTwz+sUdsfCqG8ZE3f8iPRRaKEmkDloURKVliDQbBE+5V7jHVyWYX
 er4lTNP5cJSYCWZtKGEg0HoPwUGWUOlH8tw23Li+a76l9YWPDLTpPh8wq7t9NZLt4HIt
 iwTk7InnqkTZozMsiddGYbIQXoOvP9Fleixdbfmy0yG9Bd+hMnq0YSw2ZhbV227KByQy
 AeB4kLT8tJul6o/OM9HTU5k0lEK9q6PBn2mSvx0GzGsS8wg0HvpehxeVaJb+b7ULv2Qj
 wLEv7uXhTu00V+23DAc4pYkfuOQ9FNhK00fDDyle/ig2pSyICA7OMf3/5mOJAwMExzW9
 pv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847873; x=1734452673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7yOIgCfYAXIlxzBS7Y/cffRsUFfY+7qJLLPOfonFXk=;
 b=vO0j2bSjs1+IHN3AfE8PJr2RaHOKQkUM4SmiRGj/Q9K0mQaUB0t7xqNPjlt4euImim
 +PKSnbPcOyTWCir89RNWU/3YOymgqeq+CZMow9a1zhi9SufZ8Cv/oq6Abpz4zmy21f3n
 bYuvp/QULinf3s2NHVKy2CA7Um8mt9IhY2k8WthpHBebMNUvG9EcpZvIRC+GzXGQjgzu
 s2+ZqmW2Fd4w/d6yVKOYeGcKO5J3hnZFzHWGVs1Ornrou95MTeuhUZiocEd6ETu5FrxB
 TvqaeMv3yMztmpphpdX/m5jnzpBuo+mnKqVrmNCDagSCvWMxPDSglrBEGBX9pIFTEqRd
 FNTg==
X-Gm-Message-State: AOJu0YxOD/Bu45Q2oVmrxqj7EkVgdpPctv/SHvQOGjzcKs1Btd4zL5cS
 jm19NQrAA/7bmeBPFyGP2PcpG12iqtohnDGfWG6meBpRLrIgoeFe882BywTADPpAeAfP0IawH1b
 pPaQChYOP
X-Gm-Gg: ASbGnctwzWbkW/ZdJFfSiVcQiQgrtcK8ZYwLBRE7DB0PaEHJGDg5tt33MzbArt5qoWb
 xozUIzqu3FXMuHkx1E6ONN93D9XNwAOIStt6mvz1yO4MJ9v1wIKbsJvf+Vdx1RcyZUyGZ2Z5AKg
 OWF8LOuPConnA5vAMDOVoSi2cTLZR/EhXCrA1YAD4h+0Y3OEi+JBzoctvZ4TPeZJf6S6bIT0Dsf
 1SQG4ufwZbcNSXp+6OAw12IaE8APKIN21F1M9YbE7Ks9gR61UMi00bGzdY=
X-Received: by 2002:a05:6512:402a:b0:53e:39c2:f02b with SMTP id
 2adb3069b0e04-53e39c2f164mr4545331e87.42.1733847873052; 
 Tue, 10 Dec 2024 08:24:33 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5402960b0absm26024e87.102.2024.12.10.08.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:24:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 57/69] target/arm: Convert FCVT* (vector,
 integer) scalar to decodetree
Date: Tue, 10 Dec 2024 10:17:21 -0600
Message-ID: <20241210161733.1830573-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12e.google.com
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
X-TUID: k6owuLv7pzFm

Arm silliness with naming, the scalar insns described
as part of the vector instructions, as separate from
the "regular" scalar insns which output to general registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 133 ++++++++++++++-------------------
 target/arm/tcg/a64.decode      |  30 ++++++++
 2 files changed, 86 insertions(+), 77 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0f924b07dc..71f1d6f778 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8674,6 +8674,16 @@ static void do_fcvt_scalar(DisasContext *s, MemOp out, MemOp esz,
                                  tcg_shift, tcg_fpstatus);
             tcg_gen_extu_i32_i64(tcg_out, tcg_single);
             break;
+        case MO_16 | MO_SIGN:
+            gen_helper_vfp_toshh(tcg_single, tcg_single,
+                                 tcg_shift, tcg_fpstatus);
+            tcg_gen_extu_i32_i64(tcg_out, tcg_single);
+            break;
+        case MO_16:
+            gen_helper_vfp_touhh(tcg_single, tcg_single,
+                                 tcg_shift, tcg_fpstatus);
+            tcg_gen_extu_i32_i64(tcg_out, tcg_single);
+            break;
         default:
             g_assert_not_reached();
         }
@@ -8717,6 +8727,42 @@ TRANS(FCVTZU_g, do_fcvt_g, a, FPROUNDING_ZERO, false)
 TRANS(FCVTAS_g, do_fcvt_g, a, FPROUNDING_TIEAWAY, true)
 TRANS(FCVTAU_g, do_fcvt_g, a, FPROUNDING_TIEAWAY, false)
 
+/*
+ * FCVT* (vector), scalar version.
+ * Which sounds weird, but really just means output to fp register
+ * instead of output to general register.  Input and output element
+ * size are always equal.
+ */
+static bool do_fcvt_f(DisasContext *s, arg_fcvt *a,
+                      ARMFPRounding rmode, bool is_signed)
+{
+    TCGv_i64 tcg_int;
+    int check = fp_access_check_scalar_hsd(s, a->esz);
+
+    if (check <= 0) {
+        return check == 0;
+    }
+
+    tcg_int = tcg_temp_new_i64();
+    do_fcvt_scalar(s, a->esz | (is_signed ? MO_SIGN : 0),
+                   a->esz, tcg_int, a->shift, a->rn, rmode);
+
+    clear_vec(s, a->rd);
+    write_vec_element(s, tcg_int, a->rd, 0, a->esz);
+    return true;
+}
+
+TRANS(FCVTNS_f, do_fcvt_f, a, FPROUNDING_TIEEVEN, true)
+TRANS(FCVTNU_f, do_fcvt_f, a, FPROUNDING_TIEEVEN, false)
+TRANS(FCVTPS_f, do_fcvt_f, a, FPROUNDING_POSINF, true)
+TRANS(FCVTPU_f, do_fcvt_f, a, FPROUNDING_POSINF, false)
+TRANS(FCVTMS_f, do_fcvt_f, a, FPROUNDING_NEGINF, true)
+TRANS(FCVTMU_f, do_fcvt_f, a, FPROUNDING_NEGINF, false)
+TRANS(FCVTZS_f, do_fcvt_f, a, FPROUNDING_ZERO, true)
+TRANS(FCVTZU_f, do_fcvt_f, a, FPROUNDING_ZERO, false)
+TRANS(FCVTAS_f, do_fcvt_f, a, FPROUNDING_TIEAWAY, true)
+TRANS(FCVTAU_f, do_fcvt_f, a, FPROUNDING_TIEAWAY, false)
+
 static bool trans_FJCVTZS(DisasContext *s, arg_FJCVTZS *a)
 {
     if (!dc_isar_feature(aa64_jscvt, s)) {
@@ -9776,10 +9822,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     int opcode = extract32(insn, 12, 5);
     int size = extract32(insn, 22, 2);
     bool u = extract32(insn, 29, 1);
-    bool is_fcvt = false;
-    int rmode;
-    TCGv_i32 tcg_rmode;
-    TCGv_ptr tcg_fpstatus;
 
     switch (opcode) {
     case 0xc ... 0xf:
@@ -9824,15 +9866,8 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x5b: /* FCVTMU */
         case 0x7a: /* FCVTPU */
         case 0x7b: /* FCVTZU */
-            is_fcvt = true;
-            rmode = extract32(opcode, 5, 1) | (extract32(opcode, 0, 1) << 1);
-            break;
         case 0x1c: /* FCVTAS */
         case 0x5c: /* FCVTAU */
-            /* TIEAWAY doesn't fit in the usual rounding mode encoding */
-            is_fcvt = true;
-            rmode = FPROUNDING_TIEAWAY;
-            break;
         case 0x56: /* FCVTXN, FCVTXN2 */
         default:
             unallocated_encoding(s);
@@ -9851,59 +9886,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         unallocated_encoding(s);
         return;
     }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    if (is_fcvt) {
-        tcg_fpstatus = fpstatus_ptr(FPST_FPCR);
-        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
-    } else {
-        tcg_fpstatus = NULL;
-        tcg_rmode = NULL;
-    }
-
-    if (size == 3) {
-        TCGv_i64 tcg_rn = read_fp_dreg(s, rn);
-        TCGv_i64 tcg_rd = tcg_temp_new_i64();
-
-        handle_2misc_64(s, opcode, u, tcg_rd, tcg_rn, tcg_rmode, tcg_fpstatus);
-        write_fp_dreg(s, rd, tcg_rd);
-    } else {
-        TCGv_i32 tcg_rn = tcg_temp_new_i32();
-        TCGv_i32 tcg_rd = tcg_temp_new_i32();
-
-        read_vec_element_i32(s, tcg_rn, rn, 0, size);
-
-        switch (opcode) {
-        case 0x1a: /* FCVTNS */
-        case 0x1b: /* FCVTMS */
-        case 0x1c: /* FCVTAS */
-        case 0x3a: /* FCVTPS */
-        case 0x3b: /* FCVTZS */
-            gen_helper_vfp_tosls(tcg_rd, tcg_rn, tcg_constant_i32(0),
-                                 tcg_fpstatus);
-            break;
-        case 0x5a: /* FCVTNU */
-        case 0x5b: /* FCVTMU */
-        case 0x5c: /* FCVTAU */
-        case 0x7a: /* FCVTPU */
-        case 0x7b: /* FCVTZU */
-            gen_helper_vfp_touls(tcg_rd, tcg_rn, tcg_constant_i32(0),
-                                 tcg_fpstatus);
-            break;
-        default:
-        case 0x7: /* SQABS, SQNEG */
-            g_assert_not_reached();
-        }
-
-        write_fp_sreg(s, rd, tcg_rd);
-    }
-
-    if (is_fcvt) {
-        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
-    }
+    g_assert_not_reached();
 }
 
 /* AdvSIMD shift by immediate
@@ -10391,30 +10374,26 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         TCGv_i32 tcg_res = tcg_temp_new_i32();
 
         switch (fpop) {
-        case 0x1a: /* FCVTNS */
-        case 0x1b: /* FCVTMS */
-        case 0x1c: /* FCVTAS */
-        case 0x3a: /* FCVTPS */
-        case 0x3b: /* FCVTZS */
-            gen_helper_advsimd_f16tosinth(tcg_res, tcg_op, tcg_fpstatus);
-            break;
         case 0x3d: /* FRECPE */
             gen_helper_recpe_f16(tcg_res, tcg_op, tcg_fpstatus);
             break;
         case 0x3f: /* FRECPX */
             gen_helper_frecpx_f16(tcg_res, tcg_op, tcg_fpstatus);
             break;
+        case 0x7d: /* FRSQRTE */
+            gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
+            break;
+        default:
+        case 0x1a: /* FCVTNS */
+        case 0x1b: /* FCVTMS */
+        case 0x1c: /* FCVTAS */
+        case 0x3a: /* FCVTPS */
+        case 0x3b: /* FCVTZS */
         case 0x5a: /* FCVTNU */
         case 0x5b: /* FCVTMU */
         case 0x5c: /* FCVTAU */
         case 0x7a: /* FCVTPU */
         case 0x7b: /* FCVTZU */
-            gen_helper_advsimd_f16touinth(tcg_res, tcg_op, tcg_fpstatus);
-            break;
-        case 0x7d: /* FRSQRTE */
-            gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
-            break;
-        default:
             g_assert_not_reached();
         }
 
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 5e02144f65..f7fcc32adc 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1652,6 +1652,36 @@ UQXTN_s         0111 1110 ..1 00001 01001 0 ..... .....     @rr_e
 
 FCVTXN_s        0111 1110 011 00001 01101 0 ..... .....     @rr_s
 
+@icvt_h         . ....... .. ...... ...... rn:5 rd:5 \
+                &fcvt sf=0 esz=1 shift=0
+@icvt_sd        . ....... .. ...... ...... rn:5 rd:5 \
+                &fcvt sf=0 esz=%esz_sd shift=0
+
+FCVTNS_f        0101 1110 011 11001 10101 0 ..... .....     @icvt_h
+FCVTNS_f        0101 1110 0.1 00001 10101 0 ..... .....     @icvt_sd
+FCVTNU_f        0111 1110 011 11001 10101 0 ..... .....     @icvt_h
+FCVTNU_f        0111 1110 0.1 00001 10101 0 ..... .....     @icvt_sd
+
+FCVTPS_f        0101 1110 111 11001 10101 0 ..... .....     @icvt_h
+FCVTPS_f        0101 1110 1.1 00001 10101 0 ..... .....     @icvt_sd
+FCVTPU_f        0111 1110 111 11001 10101 0 ..... .....     @icvt_h
+FCVTPU_f        0111 1110 1.1 00001 10101 0 ..... .....     @icvt_sd
+
+FCVTMS_f        0101 1110 011 11001 10111 0 ..... .....     @icvt_h
+FCVTMS_f        0101 1110 0.1 00001 10111 0 ..... .....     @icvt_sd
+FCVTMU_f        0111 1110 011 11001 10111 0 ..... .....     @icvt_h
+FCVTMU_f        0111 1110 0.1 00001 10111 0 ..... .....     @icvt_sd
+
+FCVTZS_f        0101 1110 111 11001 10111 0 ..... .....     @icvt_h
+FCVTZS_f        0101 1110 1.1 00001 10111 0 ..... .....     @icvt_sd
+FCVTZU_f        0111 1110 111 11001 10111 0 ..... .....     @icvt_h
+FCVTZU_f        0111 1110 1.1 00001 10111 0 ..... .....     @icvt_sd
+
+FCVTAS_f        0101 1110 011 11001 11001 0 ..... .....     @icvt_h
+FCVTAS_f        0101 1110 0.1 00001 11001 0 ..... .....     @icvt_sd
+FCVTAU_f        0111 1110 011 11001 11001 0 ..... .....     @icvt_h
+FCVTAU_f        0111 1110 0.1 00001 11001 0 ..... .....     @icvt_sd
+
 # Advanced SIMD two-register miscellaneous
 
 SQABS_v         0.00 1110 ..1 00000 01111 0 ..... .....     @qrr_e
-- 
2.43.0

