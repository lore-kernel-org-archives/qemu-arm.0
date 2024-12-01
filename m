Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2146632njk;
        Sun, 1 Dec 2024 07:07:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX3lu/LWe4wuZAHHf7Pj6XGp+g8bj22C0ASDqNM4WzU0LzUEQONk1ph+ImYj9vs2FMCR+oW8kN49U79jg==@linaro.org
X-Google-Smtp-Source: AGHT+IFsp69E1tkTLVnhAOf51pFbCrlaK0bZl3vwkV1i2TPhQjpkPOF8aoW/OSABkqvRIEVN5P20
X-Received: by 2002:a05:620a:1b98:b0:7b6:701c:9e3 with SMTP id af79cd13be357-7b67c4491c0mr2761234285a.45.1733065628010;
        Sun, 01 Dec 2024 07:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065627; cv=none;
        d=google.com; s=arc-20240605;
        b=bt5HTxKMWWcT1aQlEsXtnuo54lZnArXR0yzsj+gyAfwfanVaTEqZlh3Pdl2QOFqx7s
         ArG0GMxzmICvQBh73NjpisNrvoG0zrwqDDty7S6c5nT+8YWpJYyehcEY7FND+egU90zh
         bvNfVrM6qbMh3wnM0kRpM+w66jemkucbkMKQlm+X8rAY5dS2eKCwAF0L9wmNtYqHGw6k
         OgqyWGH1SgndK+GOYCPt+SBFRL595V7CgPtnPNZiO/ZDS+W/wyt+BHBYS+vH6b0YQnOO
         kOWyfkAv1ray2cjvh8NwLlYiwYREuBexJjpwGhPSGon/ZtvPfkjOoM2W4+B3Ff8llAAD
         0Abw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PRWtrYSiSJQgzSgTc/b6lhmlDw1xagT8Y+Nf8NxJVEA=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=HwamckfmmpUXqP737WASHwhlyye/4rsr54kGhzomhZJoGop5bSQD2C8Bt0GTrUCRC4
         rEniYzF1ZjzP8XJD8t1DBCx+0jWdh79YuDain1vuERckAD4oianyk1bEGIlLhO0Nlxhk
         AOn+s3tBnQgs3IycsNt19HjKHI+iY7hqkPeySl4435bB2FHqZy1wArDEV7cQnKVJVFjG
         CaNUPYvcCaEkQC0p3myrwJdG7m7XEh/NheiELmJ2xnujvv+E5WXT8NsERw5a5rFO5L00
         pCeOed/qUe+kvdFVHPnvqb5yNp/F1xM1z1O9yzWyH5vnbGQ8KGvO5Yi+fa7sNJcfTBvg
         LGJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pAwsQj27;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af5936835dsi1782037137.491.2024.12.01.07.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:07:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pAwsQj27;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlWk-0001G1-0X; Sun, 01 Dec 2024 10:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWe-0001B0-9z
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:20 -0500
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWa-00043y-SG
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:19 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5f1d1fdb328so1122891eaf.3
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065575; x=1733670375; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PRWtrYSiSJQgzSgTc/b6lhmlDw1xagT8Y+Nf8NxJVEA=;
 b=pAwsQj278B+4olUz2F3fURLrPrgprguzFTRKZcW27K9Mq0XVSoUeffHlKpzzVuC2v8
 +M/ocirJeAdJxa7G7oiNAMqNc7wClm8AbajqK024c3HanlCkxdZkejN+FnpWvdF92l5e
 1Qud/G9m/lFBRNYvsSTq4eIuaCgVCOSH2OpgLq41OlI58xYqajXSr08RYglUVWUYwGF2
 bAJxQEfSBgf4P87WJKL/Bdh8ZySXH8eVMzbBr31AGCvJ9W0n/RtGqvBndFErEhJ533PU
 GdT2QRa386+mzOW0raik+ow09dTHtVEtCdAFNKLye9keOmHsMd+g/6HWdjp6oVsveh01
 2rHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065575; x=1733670375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PRWtrYSiSJQgzSgTc/b6lhmlDw1xagT8Y+Nf8NxJVEA=;
 b=DCqSp+EuMvHKVCwSznlFzMimYTKfs4Yzq2hg5rXpuhnM7fRLxEd8uzGPNHplmg7Uav
 UF06/ScQkBl0+0GFVOwZlVHKyfZfSLVSD/zSRZdI8ChM578RCA7Fe+f1JgFoxc3aikyG
 3BdpUFCi7Z4KqMozWomo8PiRJvsWr+1sJcfHApCmmuQckbMzuhumTJd6FOcFvRB4DPYL
 VzrhgoStnNDLfuZr0HHMim4iZ2zAp45QD/x6auK/BdnUPgsf3TNUNRIAlrfO+/ssD7g6
 Jou/CHJRdhOxWLs6NyC+vHAbftMHLLkclUTv3mGsQ9tXwnK2htPaRk84Ln6UJz3rxdKv
 q5oA==
X-Gm-Message-State: AOJu0YwQ6gK3BkU9qRbRLwamEQ+R+X9he2vId2rTMYfpLA69QkNdeTyl
 Qz1Bf+OlXPj37GGsehfXHhrME19k4wBBiS34Spi0ohgb+YdzcgvTUIJdtoFX9HCYgf1FYcMZxLn
 B5Gc=
X-Gm-Gg: ASbGncuKlkLirXpy4SuZ6K2H/5WTnDVjp0wdiyBQJASg7Evbz17bjPyrxCONwjfG8Mf
 bvg4xEA8An3hh7DIhm0nWpkywb7TG3smnxIdeVjyKLVwVVAlXEgaO1tR2kEUT8hVAJ9EJHkyoTH
 GBMQzfVVK1Asrb9z0oZqIL7EwzYKjj99Pr7mf7KzzYxUo57GMvrl1ZKzrL1hMqNnqlQAXeq/EJT
 KtOL6/mXgVlDFn1oy8bX5JvfyfA0EDrtreLsePkaHtRjsT77ZgWuFA6m8UNHUpd0TWGRYkb16dM
 23o+tzEdYx+vjecoOKAJ6T5ApsodyzrlqAl9
X-Received: by 2002:a05:6830:3143:b0:717:fe94:4089 with SMTP id
 46e09a7af769-71d65cf0f0dmr13794441a34.19.1733065575444; 
 Sun, 01 Dec 2024 07:06:15 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/67] target/arm: Convert SUBP, IRG, GMI to decodetree
Date: Sun,  1 Dec 2024 09:05:04 -0600
Message-ID: <20241201150607.12812-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc30.google.com
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
X-TUID: GS4ba1MhAP1F

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

