Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp484121lfg;
        Fri, 30 Apr 2021 13:51:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMnCDjrthMs9oLpsCfGN6pO4RHipavbxmfTf5C0lf9JvvLIJylOop1wg+AYdyQmLedrgPi
X-Received: by 2002:a05:6e02:1348:: with SMTP id k8mr5600690ilr.124.1619815918032;
        Fri, 30 Apr 2021 13:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619815918; cv=none;
        d=google.com; s=arc-20160816;
        b=JDO7Qlic+nEwJb0g+i8peHOLBySSPzFTtqy0ofG5c8zZ9WYvBjiM3PuENl/Od8N880
         Hy6R0zUKy3g4oynB4ZWoAEjkgGflsnhOKLWPEegvh2SSa/Yun9yov605WahulEo1yAe7
         DjRQkZT9ZJ0RhqtvUeXrShUI+kCXHAdcr29jkb9vahThChWEbjXW99+uXQC6Zmk7YBuc
         frvmRXkY9bT5iRZT0IQnjBIgglO6YLVxoiJZmo5xRR6UTXaPBi0O4iYo1ayhoO7GJOUI
         Gui9qQzkmKbn9Jr6lzPrSJvq6VpKSZHCxjO0HZdGD1Yjj0Ii2fG5wsUeRTdfmPXexg0T
         V0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zvb5+uXwo3ITZTOH3/3hYKLwYLR4lwPy53f9vTvelhk=;
        b=ZOdAnYV86GT6UnwUFxkWyIaqFNK9UoWRUqsz4EfWh+BSpzUug0nFMGqxz3qIWJsbPl
         nEO8OSXT1v+JulYh4zgWLQnok8LdFPKsWSaTb0pBxu9ZNPcNYeVzDNlF27rACriJsZAd
         HHMFZ3YTwVnpMS6x885Ui4huR4qqH32X8msUzDCHS4i9slv4VYU99yMeQAutmXZOSiNY
         glKi4DovwyBXLT7PoHUpLlw6UQCZ1VCFbyxRAjJNTdkrlgxixux4S13PM6rckzQT7uPi
         w+Y2cPGOdMSotykGxZTcU+yaAcdTW+ygId3diHzHprpnQuz61MTjwSinHRdYR1PsaVFR
         66jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EgDCjTgz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si4482467iog.59.2021.04.30.13.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:51:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EgDCjTgz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lca7B-0004kM-B2
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiv-0000cO-3Q
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:53 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiZ-0006A8-Rn
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:52 -0400
Received: by mail-pf1-x42d.google.com with SMTP id a12so6946803pfc.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zvb5+uXwo3ITZTOH3/3hYKLwYLR4lwPy53f9vTvelhk=;
 b=EgDCjTgzHGY9EnajlSErEzUfelodz7q43NajoGuw3DpVGCF5NrfLnb31tKsZiM9LZL
 vibQs3QG6noSxu0k3aA4dwcyUkgICn93cS4GR64qk+ijsvB5HzHQB7pXpVkbGiw8LnNx
 esk8Vmgtv2PtwekTaWsWl1ud6bQa2pr6NmtzCGv47eFTBMJFWbqDypFDvHn9l5epJ9fK
 LZ9dwJKlSrp1dkeLGwK49bja5tGexG7TIt24OW7JPtgRH2Se9Enr0OYTxPQr4F8A4CkP
 BfONbB3EQ0th3rqHW1FudFdOVdEeooMGoprl1O4QTgbKNgtnIVh6ulTxt3QcQ/NXrRNr
 MpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zvb5+uXwo3ITZTOH3/3hYKLwYLR4lwPy53f9vTvelhk=;
 b=eQRXmTu9dyBB4PqgfTI8QfHWFLUGAnC7b3rjtbATvx9vIt7tknxd5SatusWu+aFTk4
 ilQX5Il5LL7P3IOTZ+Uy5Jy9sAMCRh02Suaf7qniR8iFxLYA5PHumUHRx5f2oR16oZaD
 yfG+HQBtKtvXopbP6KGSTSPbo0OLZ7BH6mujh5cGuoj2P1qaYqFHeHdGQxEE+FTcnmG7
 bsKSzNtHJMPzY7wol7wiNYycadOdW6yIlVqtui47Y6TvByS/PjtA5zOj6LyOu6VtmeTE
 HYTwFazcn9KUkJeI+e8RokXzhv8GmPmixp+DIBsFw+KG5e3fkGf3lWqllEc2Ldj3MPj9
 76Pw==
X-Gm-Message-State: AOAM5324nVPR1RzLIud4bCQI7RmoyHAJqsk2Wu6GxRZ8vhtGgmyEfuPR
 7kmDadnrp0F6Puj+X5xDBr96LmRXGhRFqg==
X-Received: by 2002:aa7:9190:0:b029:22d:6789:cc83 with SMTP id
 x16-20020aa791900000b029022d6789cc83mr6865402pfa.9.1619814390583; 
 Fri, 30 Apr 2021 13:26:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 31/82] target/arm: Implement SVE2 WHILERW, WHILEWR
Date: Fri, 30 Apr 2021 13:25:19 -0700
Message-Id: <20210430202610.1136687-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yAkrIJLnTeQ8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix decodetree typo
v3: Fix iteration counts (zhiwei).
v4: Update for PREDDESC.
---
 target/arm/sve.decode      |  3 ++
 target/arm/translate-sve.c | 67 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index ae853d21f2..f365907518 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -702,6 +702,9 @@ CTERM           00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 # SVE integer compare scalar count and limit
 WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 lt:1 rn:5 eq:1 rd:4
 
+# SVE2 pointer conflict compare
+WHILE_ptr       00100101 esz:2 1 rm:5 001 100 rn:5 rw:1 rd:4
+
 ### SVE Integer Wide Immediate - Unpredicated Group
 
 # SVE broadcast floating-point immediate (unpredicated)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index aff85b0220..97e113ceec 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3218,6 +3218,73 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     return true;
 }
 
+static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
+{
+    TCGv_i64 op0, op1, diff, t1, tmax;
+    TCGv_i32 t2, t3;
+    TCGv_ptr ptr;
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned desc = 0;
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    op0 = read_cpu_reg(s, a->rn, 1);
+    op1 = read_cpu_reg(s, a->rm, 1);
+
+    tmax = tcg_const_i64(vsz);
+    diff = tcg_temp_new_i64();
+
+    if (a->rw) {
+        /* WHILERW */
+        /* diff = abs(op1 - op0), noting that op0/1 are unsigned. */
+        t1 = tcg_temp_new_i64();
+        tcg_gen_sub_i64(diff, op0, op1);
+        tcg_gen_sub_i64(t1, op1, op0);
+        tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, diff, t1);
+        tcg_temp_free_i64(t1);
+        /* Round down to a multiple of ESIZE.  */
+        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* If op1 == op0, diff == 0, and the condition is always true. */
+        tcg_gen_movcond_i64(TCG_COND_EQ, diff, op0, op1, tmax, diff);
+    } else {
+        /* WHILEWR */
+        tcg_gen_sub_i64(diff, op1, op0);
+        /* Round down to a multiple of ESIZE.  */
+        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* If op0 >= op1, diff <= 0, the condition is always true. */
+        tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, tmax, diff);
+    }
+
+    /* Bound to the maximum.  */
+    tcg_gen_umin_i64(diff, diff, tmax);
+    tcg_temp_free_i64(tmax);
+
+    /* Since we're bounded, pass as a 32-bit type.  */
+    t2 = tcg_temp_new_i32();
+    tcg_gen_extrl_i64_i32(t2, diff);
+    tcg_temp_free_i64(diff);
+
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
+    t3 = tcg_const_i32(desc);
+
+    ptr = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
+
+    gen_helper_sve_whilel(t2, ptr, t2, t3);
+    do_pred_flags(t2);
+
+    tcg_temp_free_ptr(ptr);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t3);
+    return true;
+}
+
 /*
  *** SVE Integer Wide Immediate - Unpredicated Group
  */
-- 
2.25.1

