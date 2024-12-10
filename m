Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3439153njb;
        Tue, 10 Dec 2024 08:20:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJaHWVhCpNETcc2wUFbfryRrPcIrXwicVjP93NFzQFVQs0p+7MXtANT2mTduSE8t0gUisWjsnDuU5HTg==@linaro.org
X-Google-Smtp-Source: AGHT+IG6Kr5iF6R4sGnOtwUVTfLIKYixukHtHxBI/WaDp3UD58GdFg6w4aBRdd312ubECpN2oM7m
X-Received: by 2002:a05:6214:3016:b0:6d8:7db7:6d88 with SMTP id 6a1803df08f44-6d91e38cc48mr97939676d6.28.1733847642129;
        Tue, 10 Dec 2024 08:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847642; cv=none;
        d=google.com; s=arc-20240605;
        b=F4Y0AtQ4BJu+u5ppIePI+A6+cNNR1HQpqXH0xfIPvee4nD+BytoNyC4JMIERWMtUQh
         VHclwzrrP6N3c0vWL7irYnTSGSz+Mfvn5E48+g6GOZwebU1u3Hx0IrBWN/0alzM4HGXF
         4sKOGIW3uyanMvZzoOINjUQ/aPJLxRNt4PCHttWO3dS+2Aki5M9im6Zgw8YDGwlkClHO
         h9AQbZOT6m7rjZxShl4DCLDR0otFRscH0io/yFrQjsKa24ugcdbltZSGl+0/JnlTPYNn
         pwJlLnLsepIotlDCev3pZm0v6UlpAkf6D3oRcG0GYAHiyBGjbZCTO9tx6Qp29szzFwpy
         KA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EWe0cS5erMqHnf9Y4yFydHawcmr3E5Sxjh2zbuzMCj8=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=TFpDoYK1Lx6QUEn7bXrXPhGXcOUU+zVtaek7SrSmv+mUyIg9G1QGXjtShWRdKYU+e/
         JHG3SINEVF7thwj4Syqs2iWlpr6c7ByyqR8nhyxmyyk2h0ML4saNmFmbSH1Jy61d70mR
         IpQltAJdaTgXjbcjs2p80MubDiHmJ/iLYuGvU+hpCItGqBOVBtvvq/g2K4LLg08Kv9iJ
         Mj5vpfQc55BgMWjGa9OafwX1Tj1vwNClnbdwO5ojddp0B55HGgU05L/WRTmrQFOWGlG+
         QYpwJe8IjGvuBiRSHFlUJdsgA+WYpmv1IF+rWoezZVJ6pPbnx9D+Dz95bZQHvUkqG/3Y
         8I6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzAAlujc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6de8aa406si263010085a.154.2024.12.10.08.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:20:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UzAAlujc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2xs-00066E-RC; Tue, 10 Dec 2024 11:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2xr-0005u6-3V
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:19:59 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2xp-0006ah-AC
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:19:58 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso1237154e87.0
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847596; x=1734452396; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWe0cS5erMqHnf9Y4yFydHawcmr3E5Sxjh2zbuzMCj8=;
 b=UzAAlujcLfKwstqxSOMYgvizPbXBqk3SzqnhJCgLk302PaFkSrQlcsv1wOTA1JTcKF
 5/9+D6XVLUsSzWhSJgFy9mzvqeVA4cpgM2AnFRNeBcvO4pZoD8rjtypGZHfd13PIC8TG
 dCV8IvyIL3tnBmlJcgaABidciLqMEbIFXaVYP+keJKssl4UIhCEd838mZu37P7wxOvkV
 YJGgVq0aQVLrAegHRTjnJJ6Zsb/zhyNCwrEhqO3rHJI5FMelwZW8xGJSZy0r9871oEzJ
 3HhP+uNOCrR3JEJs5OjeVAJ1uZt0YzpZtLHBRJG8gPM+cfsrAaTosKJkHUp0AfbkSBl+
 sFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847596; x=1734452396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWe0cS5erMqHnf9Y4yFydHawcmr3E5Sxjh2zbuzMCj8=;
 b=kk3XfBtOw4jMOp9Ug4nN6J1toKgvUDiAaFUpmQ+KoWiyTCw+/9Hv8cSR2bF7xZmqcv
 e/KtAvfMUGJnK/XwDFNx+f5pYQ730P84d7YKDcMR0xwgxM7Q/QtVc7SyRp7wOX8XzW0K
 PT5mJzg4rGZUc6hAAz6Hs5gj2J2cjqr3zINDpO/fhvofqChyf2O7dCoxIog/g28oeLx8
 R1DpLagh1rCNJphUuzI1fqFKSxhw4kadEA3s3ULwIrhHag0ob0WAYsI5nem5HB5TU8nl
 OwAkwtbyk2v+GTRf/4cdALtq49hfQpjoS8BW1rpQD3ntDVc9y2thibhw7y+B9EjVxWA8
 0UtA==
X-Gm-Message-State: AOJu0YxmV5lPBPTQIssTWn083XmK+3jkFIXqk7L/Y4UutsC/vKT10Uof
 /nju4xc0tPlnSXcW13eo65rFCr4ovbOMKOJyx3QBv3H+7o7ZkKHUveyDtFnvlXg9RdGdhquYb35
 uLJxgFUcz
X-Gm-Gg: ASbGncuFFSJMEZdH4rjJ1IS40JF1cpqom9VrR3TBJFVB98lsB+JSxSyFFMk3dfBjvzM
 baRJX0tSUIMQV7VSUrlvQg/fLDc2X/6lp26Fylqn7EeNauzezgxC+A76Uaoxw9Id80/5HHuoHf2
 gUbvX6+qUOWrXtwtvUu77HA3PlKifSc309E/WYMIaNTwfH8Lit77JLh5/l2vGslefPzjAFg3Zjs
 q7lEoRzaFlcnIoNwXia0Wyg509f+4nBTa5qZREQzp/Ljqw9bCgg1gCIWbk=
X-Received: by 2002:a05:6512:23a2:b0:540:20f5:be88 with SMTP id
 2adb3069b0e04-540240ae6afmr1862193e87.5.1733847595607; 
 Tue, 10 Dec 2024 08:19:55 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:19:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 33/69] target/arm: Convert FJCVTZS to decodetree
Date: Tue, 10 Dec 2024 10:16:57 -0600
Message-ID: <20241210161733.1830573-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
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
X-TUID: Sb10ZaGUlUB/

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 41 +++++++++++++++++-----------------
 target/arm/tcg/a64.decode      |  2 ++
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 628def6c7c..152bb4b1b3 100644
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

