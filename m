Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8337376wrv;
        Thu, 8 Aug 2019 13:27:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwazjDuyAtGGt5ZxUwn56mE5E/+MHykAjqW46z8iKC+pWkn2RpeX/VrPj+BgeGmUGLbZyyf
X-Received: by 2002:aa7:c98c:: with SMTP id c12mr17755553edt.225.1565296068439;
        Thu, 08 Aug 2019 13:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565296068; cv=none;
        d=google.com; s=arc-20160816;
        b=FV1rlQ/6WJnlgvrl1byOr2w2jW1QRb4qdYhqHoZCOlCaFzW8KsTUXx7Y/Jo2dRjxGE
         bSh/14+7ReAtRggjFRuLW870ah2JNUaRqqb91euYRXmQu7RYl3OZQs940u7WZURNLiIW
         fEJhDDZL6/xwN5PnLAwXOVKxPnDbW9BF2mlMsV0anCq/X9ye6qaTS/oqWHhj10YWejk6
         XR1DWbFwJopK7eT+O3/DUUWkvS4S9X5PHORjnWPf2IGn4Uqjq4Nn7YQeSky0Z7370tgt
         sHprMawTd7fzyKSfWp6qmKwLaKVziObfZx2j0Ry/uyVe6YHtV0D4XyqvUGX7z8pDYeZl
         CHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=AcVFjfcusS5dLWT70g3h9t3XMQa4NwJ2WZoNCoEA3tk=;
        b=gTlXqG8vyp9V/FkiMoBe/NLigo9FWXh8W/PmOk+7o8O3eHNcO+C6/Jd5WYto/0MwoQ
         Hs+PjYpvjohDIOEOBDEsUzrAzUN5LdAAFZWukEAYL2VoU8t1GcxcaXAkH1GcANDfd7aP
         S9HCpueg9mNdxmpW+C9ftiwOvzQn5dkQf72rS25cNpG5j8X1f2UH49ueKcVrfncEi608
         i0jn/d2BlJ2iNg6h98zec58u2l5Py2jjzr9LkVKfkWSXnJ0s1m0oVTwZvTnkDVSGPzdX
         9llQQSl/E9yzAXqFR1eZfdvT6r6kqI7qjrJxHf7jo1LezWY/k22zs0hSrEMHIgwOj108
         qNVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zTL5AmxU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qp11si2168318ejb.186.2019.08.08.13.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 13:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zTL5AmxU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvp0l-0002Hd-Hv
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 16:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59922)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozW-0007IN-5a
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozV-0001Lb-1u
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:30 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37746)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvozU-0001Kx-R6
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 16:26:29 -0400
Received: by mail-pf1-x443.google.com with SMTP id 19so44713194pfa.4
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2019 13:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AcVFjfcusS5dLWT70g3h9t3XMQa4NwJ2WZoNCoEA3tk=;
 b=zTL5AmxUG1HAJtBxREkWCohQIuU5e/eWoOKXPgWm7cdi0Cbss+jzaqR6Cg1inkf3SO
 sq2EDEt4l/rv1s2oe38z8PvIGuDlQzmmbCBBA6QzAG9SefWWPADeq1INm7dLYBdJX4HC
 vBG4ppvGAaHNRbitrkMJ4PvW+990yBCMyS8loSTnCkZ1z+9ebmINaItqXl1bBP2Qi+mN
 DMKzOIJ8TvW7ga4DCdH8KgiLAcNKqv/vZ/vUtdOF5Uz3uyAdgLZw+Qgi0ri5JfkejdpF
 Bif9+rNE+1wwVHlzmHM0IihBf+GGLDXnhAl5a+NZvLtkTPXkKuNpdhyoeprGe7H9E+eZ
 GSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AcVFjfcusS5dLWT70g3h9t3XMQa4NwJ2WZoNCoEA3tk=;
 b=P96ZacREBEbtWOEdBF6fLtJA2fE1mYU/u9iaJmXJqimIDM8mcXEaWi920D1saX88NL
 +VPPvckJWzEmaUdXVzVbPkfYr5JMUvjoyVdzRoAITarqYiMNUgrN2CmNB/dMWgv/RKEb
 C18FPmQyJ/UBhLDUuRf1zt3V24f4QETctCQlfwP3MNhPfhEjdMhA6uvWy7HPBBQv1Cct
 iaJW1wdrHh7gosNIL8KIG47e10COVUDcOAqlbApSQFfFpLFaClJnrobwi9Oa8pVpJHRY
 7UxFbyhfeDmGjXfTy1og4MbVSMc9edIISXT9T+bMYeJUsyzrAnmvhD5pzYSGXA6xO5F8
 gCig==
X-Gm-Message-State: APjAAAXXyX/faeamGONF4MkONJ15q4ZpHulzBABrQQf2U7mIoZsv4wTA
 H8Kz449hsXt1Fwj5sBAte4Sg3w==
X-Received: by 2002:aa7:8b51:: with SMTP id i17mr17664848pfd.33.1565295987980; 
 Thu, 08 Aug 2019 13:26:27 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v12sm2850146pjk.13.2019.08.08.13.26.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 13:26:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 13:26:16 -0700
Message-Id: <20190808202616.13782-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808202616.13782-1-richard.henderson@linaro.org>
References: <20190808202616.13782-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH 7/7] target/arm: Use tcg_gen_extrh_i64_i32 to
 extract the high word
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x3glJHA9mJ0Z

Separate shift + extract low will result in one extra insn
for hosts like RISC-V, MIPS, and Sparc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 77154be743..9e103e4fad 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1761,8 +1761,7 @@ static int disas_iwmmxt_insn(DisasContext *s, uint32_t insn)
             if (insn & ARM_CP_RW_BIT) {                         /* TMRRC */
                 iwmmxt_load_reg(cpu_V0, wrd);
                 tcg_gen_extrl_i64_i32(cpu_R[rdlo], cpu_V0);
-                tcg_gen_shri_i64(cpu_V0, cpu_V0, 32);
-                tcg_gen_extrl_i64_i32(cpu_R[rdhi], cpu_V0);
+                tcg_gen_extrh_i64_i32(cpu_R[rdhi], cpu_V0);
             } else {                                    /* TMCRR */
                 tcg_gen_concat_i32_i64(cpu_V0, cpu_R[rdlo], cpu_R[rdhi]);
                 iwmmxt_store_reg(cpu_V0, wrd);
@@ -2807,8 +2806,7 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
         if (insn & ARM_CP_RW_BIT) {                     /* MRA */
             iwmmxt_load_reg(cpu_V0, acc);
             tcg_gen_extrl_i64_i32(cpu_R[rdlo], cpu_V0);
-            tcg_gen_shri_i64(cpu_V0, cpu_V0, 32);
-            tcg_gen_extrl_i64_i32(cpu_R[rdhi], cpu_V0);
+            tcg_gen_extrh_i64_i32(cpu_R[rdhi], cpu_V0);
             tcg_gen_andi_i32(cpu_R[rdhi], cpu_R[rdhi], (1 << (40 - 32)) - 1);
         } else {                                        /* MAR */
             tcg_gen_concat_i32_i64(cpu_V0, cpu_R[rdlo], cpu_R[rdhi]);
@@ -6005,8 +6003,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                                 gen_helper_neon_narrow_high_u16(tmp, cpu_V0);
                                 break;
                             case 2:
-                                tcg_gen_shri_i64(cpu_V0, cpu_V0, 32);
-                                tcg_gen_extrl_i64_i32(tmp, cpu_V0);
+                                tcg_gen_extrh_i64_i32(tmp, cpu_V0);
                                 break;
                             default: abort();
                             }
@@ -6020,8 +6017,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                                 break;
                             case 2:
                                 tcg_gen_addi_i64(cpu_V0, cpu_V0, 1u << 31);
-                                tcg_gen_shri_i64(cpu_V0, cpu_V0, 32);
-                                tcg_gen_extrl_i64_i32(tmp, cpu_V0);
+                                tcg_gen_extrh_i64_i32(tmp, cpu_V0);
                                 break;
                             default: abort();
                             }
@@ -7254,9 +7250,8 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
                 tmp = tcg_temp_new_i32();
                 tcg_gen_extrl_i64_i32(tmp, tmp64);
                 store_reg(s, rt, tmp);
-                tcg_gen_shri_i64(tmp64, tmp64, 32);
                 tmp = tcg_temp_new_i32();
-                tcg_gen_extrl_i64_i32(tmp, tmp64);
+                tcg_gen_extrh_i64_i32(tmp, tmp64);
                 tcg_temp_free_i64(tmp64);
                 store_reg(s, rt2, tmp);
             } else {
@@ -7365,8 +7360,7 @@ static void gen_storeq_reg(DisasContext *s, int rlow, int rhigh, TCGv_i64 val)
     tcg_gen_extrl_i64_i32(tmp, val);
     store_reg(s, rlow, tmp);
     tmp = tcg_temp_new_i32();
-    tcg_gen_shri_i64(val, val, 32);
-    tcg_gen_extrl_i64_i32(tmp, val);
+    tcg_gen_extrh_i64_i32(tmp, val);
     store_reg(s, rhigh, tmp);
 }
 
-- 
2.17.1

