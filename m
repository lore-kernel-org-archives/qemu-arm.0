Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1876716ejb;
        Mon, 7 Aug 2023 20:12:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE79ycvDbJiNunHpfkew09SwBaGpE3MBFXsYCrSE2nnrZykilXHax2t7sbpvx6HY8+/+Epd
X-Received: by 2002:ac8:7f41:0:b0:403:c8c4:fd42 with SMTP id g1-20020ac87f41000000b00403c8c4fd42mr16300071qtk.20.1691464358091;
        Mon, 07 Aug 2023 20:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464358; cv=none;
        d=google.com; s=arc-20160816;
        b=u3JvfX0oFFK3Q4d0HdyXZYXCJJLqS2EkXabtOmpG9UEQ3SiVWzNip2dye6mgK22aix
         BYZxvHT+SxXbX8KY58OfS2ugcaGB+r4Q3fbOkgmCYNaW6/J5RJVG4vtuKgofaXg+7GAW
         zwxi+m5dYWgSIfZaJcYxofiFRY8OUsnCQRU3nJYSIQYWBBKie/KYE9MrJ4rSSDa8LYvS
         rEk2YCoOvftcmIMoyP9uDkdxbyo3Xu1IskTe78Y9do9K7aCg+9VhoxgN1ooiB/OaA0Ym
         EwcLAfIicgbR+ZySHXOEYemkGDv4KoOCrx0buIKVXBxNONJNXMwJgBEp+l+QZmo+8bno
         jGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2j5vEpa4xN9aVYYq+cztOssEG+ehvNVdIB8DhEEWJso=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=iix1jKOOwK4eI+rxo/t5IbwqZRUMdvmJAgHnbx1ozcxD5DRHQ2HPAbjoviGpJjokBr
         9/GWwYMOXFAgv8jBl+eLQD9d3A/EJeaToQhJigh1Oddspv3Per/dGwYy8jw8leGUI9Ns
         bmNgPovmLp0x8XGXBwi6s4jCr1hoxZsMQRQi54QdNmlGTbMvuiLw+QLVuHRtfaB0LKyQ
         uDlmddLrK5GspYFUzQN6ZnJBZ9YdGC9muzHCYLlsWZCMg52F888se9dtl6G7iEG4f6fo
         AAcs4uXjIWJWxN6hhggk2XKsq/J23XqujtoEKa0t+/4afUhiaaPxKcCggZyBtHR+Xu0j
         AZig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6y8J+x4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17-20020a05622a03d100b00403a8dc3c5esi5747819qtx.390.2023.08.07.20.12.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:12:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6y8J+x4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qTD8n-0001Wg-QZ; Mon, 07 Aug 2023 23:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8m-0001Pd-86
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:12:12 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8Y-0000Gb-DX
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:12:11 -0400
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-76c8dd2ce79so505796285a.1
 for <qemu-devel@nongnu.org>; Mon, 07 Aug 2023 20:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464317; x=1692069117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2j5vEpa4xN9aVYYq+cztOssEG+ehvNVdIB8DhEEWJso=;
 b=a6y8J+x45T/GJSP+QVTjToVBBt/vIB6dLqiU1eFRwcSLJLh4+okoLgca3S2+XeO+tk
 HxGXEZxKj3VcQ6l5Roc0J+bPa9ilOZI7HyUmRtsz+RvN2OBHPJGnGHRJLZSggtDyAZkf
 D0o7EFwLwb8zi1WEN7Mvph7sqAFVSSRv+Fn3v2WrtycW9eUFf61PrsMrC29uX+M4Ydsg
 nGzxgvYdngdcrcByLlyr8YJmGdB3EE+tL9/J/LFAmYWmPV+A5Ql02KGZGY59fB00CLMh
 K6DxnfkOI9mUcQBlVpcGN+nijMG34d0ZEf61UgnVCstyiQNUR9ToN0SfEZYDGxuc9Syx
 25zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464317; x=1692069117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2j5vEpa4xN9aVYYq+cztOssEG+ehvNVdIB8DhEEWJso=;
 b=i+kR5rHfEDFEuA8VKPWJdgQK6YVzmf1GA/VmzsORBmT0Ae1s82j1VFFnKE1pn0zWkO
 ecjsC/64/ELEgxg5+LFJZ+h/BpjPF6YKhGxc8XasMQVSlv1U1aaomS8VwGJyyS4V3n5J
 JOzTaWFTPr2qq/q56pLU9uwAO4iVyoBC11QruhKOXE0As4E1b1u3Tss7jBdRJNQuJKk6
 XKMExWhkyoaHyZzC1cP/Yfdi++1y5fcyBeXX2KbEjQC4ZRihJ0T5G2UG5u/vwu6nyTYw
 HTX4tqv2QCD2Y2qfCzjgnniixTgB/0vPlEcheyigQZQ6UGPME/kJv7m1WdsGi+rskQaT
 wv5A==
X-Gm-Message-State: AOJu0YzikYjujpl/QXFqoBZ9venULRnD7+z+PSnLQ3/2p4hJtXWKdMz1
 y6Pvy0jramSEdenM8V0rX/QOHcMpnqTbPyV6Kz0=
X-Received: by 2002:a05:620a:2493:b0:76c:9610:95cc with SMTP id
 i19-20020a05620a249300b0076c961095ccmr17384156qkn.33.1691464317232; 
 Mon, 07 Aug 2023 20:11:57 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 14/24] tcg/riscv: Implement negsetcond_*
Date: Mon,  7 Aug 2023 20:11:33 -0700
Message-Id: <20230808031143.50925-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UBgmryDgA2Mw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.h     |  4 ++--
 tcg/riscv/tcg-target.c.inc | 45 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
index b2961fec8e..7e8ac48a7d 100644
--- a/tcg/riscv/tcg-target.h
+++ b/tcg/riscv/tcg-target.h
@@ -120,7 +120,7 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_ctpop_i32        have_zbb
 #define TCG_TARGET_HAS_brcond2          1
 #define TCG_TARGET_HAS_setcond2         1
-#define TCG_TARGET_HAS_negsetcond_i32   0
+#define TCG_TARGET_HAS_negsetcond_i32   1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_movcond_i64      1
@@ -159,7 +159,7 @@ extern bool have_zbb;
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
-#define TCG_TARGET_HAS_negsetcond_i64   0
+#define TCG_TARGET_HAS_negsetcond_i64   1
 
 #define TCG_TARGET_HAS_qemu_ldst_i128   0
 
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index eeaeb6b6e3..232b616af3 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -936,6 +936,44 @@ static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
     }
 }
 
+static void tcg_out_negsetcond(TCGContext *s, TCGCond cond, TCGReg ret,
+                               TCGReg arg1, tcg_target_long arg2, bool c2)
+{
+    int tmpflags;
+    TCGReg tmp;
+
+    /* For LT/GE comparison against 0, replicate the sign bit. */
+    if (c2 && arg2 == 0) {
+        switch (cond) {
+        case TCG_COND_GE:
+            tcg_out_opc_imm(s, OPC_XORI, ret, arg1, -1);
+            arg1 = ret;
+            /* fall through */
+        case TCG_COND_LT:
+            tcg_out_opc_imm(s, OPC_SRAI, ret, arg1, TCG_TARGET_REG_BITS - 1);
+            return;
+        default:
+            break;
+        }
+    }
+
+    tmpflags = tcg_out_setcond_int(s, cond, ret, arg1, arg2, c2);
+    tmp = tmpflags & ~SETCOND_FLAGS;
+
+    /* If intermediate result is zero/non-zero: test != 0. */
+    if (tmpflags & SETCOND_NEZ) {
+        tcg_out_opc_reg(s, OPC_SLTU, ret, TCG_REG_ZERO, tmp);
+        tmp = ret;
+    }
+
+    /* Produce the 0/-1 result. */
+    if (tmpflags & SETCOND_INV) {
+        tcg_out_opc_imm(s, OPC_ADDI, ret, tmp, -1);
+    } else {
+        tcg_out_opc_reg(s, OPC_SUB, ret, TCG_REG_ZERO, tmp);
+    }
+}
+
 static void tcg_out_movcond_zicond(TCGContext *s, TCGReg ret, TCGReg test_ne,
                                    int val1, bool c_val1,
                                    int val2, bool c_val2)
@@ -1782,6 +1820,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_setcond(s, args[3], a0, a1, a2, c2);
         break;
 
+    case INDEX_op_negsetcond_i32:
+    case INDEX_op_negsetcond_i64:
+        tcg_out_negsetcond(s, args[3], a0, a1, a2, c2);
+        break;
+
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
         tcg_out_movcond(s, args[5], a0, a1, a2, c2,
@@ -1910,6 +1953,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_xor_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
+    case INDEX_op_negsetcond_i32:
+    case INDEX_op_negsetcond_i64:
         return C_O1_I2(r, r, rI);
 
     case INDEX_op_andc_i32:
-- 
2.34.1

