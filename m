Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4197737njb;
        Wed, 11 Dec 2024 08:43:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5IvC7Hps845ghCsxbZ5+FtBa6bEC0xBEfayVLG9vCzsAVoL70OeFYH4Jr14BcCbe6SC/dFCnf4wuUyA==@linaro.org
X-Google-Smtp-Source: AGHT+IEg/MPbyMe+WxAhrYIGL3xyGQ6k7GE2ZT6OZ5zTO4lucI8NjT9T1TxDAnSd75olYYqGHZxe
X-Received: by 2002:ac8:7d07:0:b0:467:5642:5917 with SMTP id d75a77b69052e-467961d7d09mr277851cf.32.1733935430334;
        Wed, 11 Dec 2024 08:43:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935430; cv=none;
        d=google.com; s=arc-20240605;
        b=Fo9Lg6oP5dEmaNaj0zoifSqMa9MZR+0Lcb/RanEsRmUkSY1WqlXI1xGvWtB45WO/oh
         /fRdVsMcm0Uza+71QHzKjQMhJDTpCj6G7UrxUhb4rL4OpdZFBF1Bg6pvSrBBIaDSdtc2
         +/iO1jgAQlxCxX3YWPUR0wQGYCYT8KLQFvLltyjty8Zudt9rkxpbGLErBz7AsTKgdiew
         8ANg0gtR2rYf7Do/NyT1JBfrWI0TWQyYTKg9y5CNLlXphmx/Kq4AF/h0tw+Hnok3txjr
         6eXVpDOimQppsO58kHAXppaqNFLQll1jzP5A/1/9PjShULuVeABUUcJ4XHqRm1Uom+mH
         U97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=F2ENayoApwQgHueuvDfyYv5kDSTUxHtmNfYBpEtIZmY=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=LBGm+K9FHsHhY+Gmpg9FSG+fJ8S6T4zh4xgv6u/+im5vt9OQYGymw90Pwvv/62gHUi
         xqQ27YDjdbnf42VdUhKlMbsY3B/Fh1v6GJ+ky2mNa94xGml28VLQEK8fHC4xuNi6l95P
         YJouJB5tLC0No87+iS68kEqIyffyiBFjOvEf3K6x3korlQXdQdcpJBzUdDYtLNi38lSJ
         RIA/FD8fX3GrZhUsuhNYM7T7950+B5rl9cRLrbEulyx7qj31EPgsAjS/yuB4Uwx5MRUx
         REl4+biJoVTX3GRcTrC7+haCEnaXEXIWkClOi2hr8occQO8ryEM/9BwRMLbzCt6OvFpH
         hDjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsaEtbcZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4678730df99si28688291cf.53.2024.12.11.08.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:43:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EsaEtbcZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPdp-0007ZD-4Q; Wed, 11 Dec 2024 11:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdT-00067k-Gf
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:29 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdR-0001Rm-Pb
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:27 -0500
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-46792996074so4219071cf.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934744; x=1734539544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2ENayoApwQgHueuvDfyYv5kDSTUxHtmNfYBpEtIZmY=;
 b=EsaEtbcZfnCvm7sJ9cVPYJLtrK183grJVdygFUcS7rLJpPEkTuKwvG9djW4VOVwbTX
 lfNqFzvU0nqRa0DelDlPI7f1F6N8yIpzfMQ3krW6pal0rabrjfj+8jyUt07rnFXeV4pE
 9KQPpI46C+C4Yg2XoIVMq9IyCABEDELfHpQFNkI6ProNK6ExkpCzKn4UzyNa2yn5lNWP
 W3a2jf3vSEorTuGbCh+5wnxppGhHAqT94VEXz1pVM0oIDXCAXS3VbQmVKaY0AUpTWbeR
 o0tkygvEE1tJ0M07AwpglbJVF+dXDpFZyTo2J9sqlvOJWWpeBXnPRg7AeLMx71/tr9wn
 c9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934744; x=1734539544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2ENayoApwQgHueuvDfyYv5kDSTUxHtmNfYBpEtIZmY=;
 b=ioNk0YUeHOOKf3R88xildDu3O+GXO/d0oh9YE3PKarIVkriqa+rzolVQIP5sIyjO/+
 ph8N6bTVUubYFp42SJ45YoMKEeBUybeZH4LAFt/j1ZfHsIX7YlYfBAVqpSAKCR9Z6avw
 EpKKjTKtJVUE78iWhGJvjeKLXMZpL0okgWn4IUYIiY42NSKOliBigMfqKswFgO5f7biN
 BrAu//Hu6cbuQbW85tuTHytiiEDMzil32escjER+abyIBTnzPQRLPMJZ3eIWcSlfdlZ5
 5IsztOWUgHynYNeoXpFbiT2pAAf4p+yy1ygiL6m35qNOya6QGjfv5gGIPf/+nJR0yTUF
 efWw==
X-Gm-Message-State: AOJu0YxZVm1mEuqZFY5fKxK2ZQNY19le+bxpt+K1piiefIMYLnqCA6lj
 KeNbfkXZFxfpouX0nyH6jlkPyqpg3jkH6hjYhpLJWBfzRGuy22whyCyTAf/Yx8g=
X-Gm-Gg: ASbGnctRWzcdAB8Ag1cdIgtLi96SXzK6OxjchxvDsq6D4Y3ffc0A6NpN3dAUttFJetw
 /4cd6+p+HIcev9lXaHLYzpIUM9ziBteq6xdDBairPmoKlwAEveT0Fycz+wHhjo8/1Rgx9RIT18p
 abyrxUYSwjZivzU3aCjSNXIan+q5mtt84nYA4O/E6wy10UPzxOxqniC7ZqT32Q7peYf/2R9iw9Y
 Oz6AWGAG+611BYU+EZi6rHv6RDPO4QPbeF2/0n6ni3UlJn2asEEc3fCty/BYQ==
X-Received: by 2002:a05:622a:5448:b0:467:5642:5917 with SMTP id
 d75a77b69052e-4678930a459mr79076701cf.32.1733934744228; 
 Wed, 11 Dec 2024 08:32:24 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 33/69] target/arm: Convert FJCVTZS to decodetree
Date: Wed, 11 Dec 2024 10:30:00 -0600
Message-ID: <20241211163036.2297116-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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
X-TUID: UESwObYlygvC

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 41 +++++++++++++++++-----------------
 target/arm/tcg/a64.decode      |  2 ++
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 67227e2676..d260b45ddb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8714,6 +8714,26 @@ TRANS(FCVTZU_g, do_fcvt_g, a, FPROUNDING_ZERO, false)
 TRANS(FCVTAS_g, do_fcvt_g, a, FPROUNDING_TIEAWAY, true)
 TRANS(FCVTAU_g, do_fcvt_g, a, FPROUNDING_TIEAWAY, false)
 
+static bool trans_FJCVTZS(DisasContext *s, arg_FJCVTZS *a)
+{
+    if (!dc_isar_feature(aa64_jscvt, s)) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        TCGv_i64 t = read_fp_dreg(s, a->rn);
+        TCGv_ptr fpstatus = fpstatus_ptr(FPST_FPCR);
+
+        gen_helper_fjcvtzs(t, t, fpstatus);
+
+        tcg_gen_ext32u_i64(cpu_reg(s, a->rd), t);
+        tcg_gen_extrh_i64_i32(cpu_ZF, t);
+        tcg_gen_movi_i32(cpu_CF, 0);
+        tcg_gen_movi_i32(cpu_NF, 0);
+        tcg_gen_movi_i32(cpu_VF, 0);
+    }
+    return true;
+}
+
 static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
 {
     /* FMOV: gpr to or from float, double, or top half of quad fp reg,
@@ -8775,20 +8795,6 @@ static void handle_fmov(DisasContext *s, int rd, int rn, int type, bool itof)
     }
 }
 
-static void handle_fjcvtzs(DisasContext *s, int rd, int rn)
-{
-    TCGv_i64 t = read_fp_dreg(s, rn);
-    TCGv_ptr fpstatus = fpstatus_ptr(FPST_FPCR);
-
-    gen_helper_fjcvtzs(t, t, fpstatus);
-
-    tcg_gen_ext32u_i64(cpu_reg(s, rd), t);
-    tcg_gen_extrh_i64_i32(cpu_ZF, t);
-    tcg_gen_movi_i32(cpu_CF, 0);
-    tcg_gen_movi_i32(cpu_NF, 0);
-    tcg_gen_movi_i32(cpu_VF, 0);
-}
-
 /* Floating point <-> integer conversions
  *   31   30  29 28       24 23  22  21 20   19 18 16 15         10 9  5 4  0
  * +----+---+---+-----------+------+---+-------+-----+-------------+----+----+
@@ -8843,13 +8849,6 @@ static void disas_fp_int_conv(DisasContext *s, uint32_t insn)
             break;
 
         case 0b00111110: /* FJCVTZS */
-            if (!dc_isar_feature(aa64_jscvt, s)) {
-                goto do_unallocated;
-            } else if (fp_access_check(s)) {
-                handle_fjcvtzs(s, rd, rn);
-            }
-            break;
-
         default:
         do_unallocated:
             unallocated_encoding(s);
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 5e170cec7a..cd10961618 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1363,6 +1363,8 @@ FCVTZU_g        . 0011110 .. 111001 000000 ..... .....  @icvt
 FCVTAS_g        . 0011110 .. 100100 000000 ..... .....  @icvt
 FCVTAU_g        . 0011110 .. 100101 000000 ..... .....  @icvt
 
+FJCVTZS         0 0011110 01 111110 000000 ..... .....  @rr
+
 # Floating-point data processing (1 source)
 
 FMOV_s          00011110 .. 1 000000 10000 ..... .....      @rr_hsd
-- 
2.43.0

