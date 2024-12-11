Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4191170njb;
        Wed, 11 Dec 2024 08:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjxCpGplILXL5UVUGulO7rVMoLawBk/WDrLpuF2wkYf7PO8I81N+VP3X968qsKfmgGiQN9m4cHbrzQVw==@linaro.org
X-Google-Smtp-Source: AGHT+IEMS+YnFEZeWJwnxyVp7QdagqQVM5EgAltL8VGbT6vfIj55SNWlxm7tK4QhBbKGOSpEnaBz
X-Received: by 2002:ac8:7dd0:0:b0:463:59f2:1835 with SMTP id d75a77b69052e-46795496790mr5812061cf.54.1733934844858;
        Wed, 11 Dec 2024 08:34:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934844; cv=none;
        d=google.com; s=arc-20240605;
        b=Ind+E8HeUB6GOcz4Aq//06S79eFfTnWGIdeJb1g4oEoxr6ucnYoGXmkdm/g1F7jjYW
         PZui+XcWKQ6w8laS2KR6AQHSgimO9eRHKuWmZByMy0aupSZWlMHAKk6Cm3LYAMBL1GGU
         TbrODy/jk79JDRzglowOZlUxjpxXcoYM/8iVGDGHOPzQlUgfBv5U5D9XEReVbn9r/I/c
         5YhEjxc4P/llc5tddVH5sPqkc7jWnxcjt3TK8oqzooczY2ECNX9osJPho9qhxoVuTF9o
         8OH/2wZczIlybBY28a/JJB+J8pw0OPIJZ8DLIrfwm7nyV8AxN+TOrl4/8SmC+EbQRBoV
         zF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ifcSfCHSTTtxXndi5QQbGHpzoZtEugLsXBXrGvDqkmU=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=Hsix2uFjyE39M0i5bhF6/VHBiwDNDAFJljDLIpf42bFwv5rLJidYRqEh4cv/0kQahf
         CBw6kDHloaqOukUTaO3vzOJ6fxBibtSX+f9cYqq3SekPGeUkWPVzVWuUrXtKlCpwXiGq
         I4bC5ChlwNYQ4FL/C7XGWAKRDTgUhWpRadu7Dq/xOmh6d3e83R+lLOO2kviSMr0LiGsO
         cvY7FUqko2ti9TbWONOCQIzQORI7ctQHKCjK8axUqTr7CzXGlerOucNTFvaiHtXfV6FN
         r6JZ3lEwX0AlEiSdJXYzV5QZBir8mtEvQkzqA2l0SLzD/bkHoQrplQ8PIjQVro/CTXUd
         tO6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFWBMLA4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296bb4f1si191601641cf.130.2024.12.11.08.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:34:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFWBMLA4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPcS-000415-3E; Wed, 11 Dec 2024 11:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcB-0003Hv-El
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:08 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPc8-00018u-Ut
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:07 -0500
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-467777d7c83so20574061cf.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934664; x=1734539464; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ifcSfCHSTTtxXndi5QQbGHpzoZtEugLsXBXrGvDqkmU=;
 b=PFWBMLA4D3f8YLrZ2ikn7HvTKOHB8++C6vAjRuesDA1b4m3bd1rU1Luun6viGtNOgg
 KX9ubPYUUBBQha5z4M+GsebBz1y9CqWcPdIkDcHDGcgbJNYB+r7QXXZFAITR/bNfSTdo
 7hnTLnJtExJfTpGAYXiZnlhMhKb8FNLMLxCK9GhH2Aba6wlrhpoPJAuzxKVsCOd5ypr2
 HDVNw8GUEHqCqTELkXl5HYygxZoTGrqvggpckXzzEsIQ+FhY4JbQEUEnknfSsIBG3PSV
 /ZE6375fiJt9V+9Ix6hCLUCn7+fuDCo8eNNPtsVG/7gS+A6Iqfbsoh89HoNIMqr+l1y2
 wY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934664; x=1734539464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ifcSfCHSTTtxXndi5QQbGHpzoZtEugLsXBXrGvDqkmU=;
 b=CivpdsZN+ItlAExniAgStCWM2ZfzGwUxnTQ18XUDFy/CtYA0d7wUQgENqr+jUw8DfQ
 D3ryB6X0fYdHt2AnEaSlZLS5BMGR0xTGOfBHq7NVhWBZtkBhtvRR3Ib6w8rkMIbiRsP2
 CkZLBs1Zxkda2lrVDvznbov4YVC9Mjpb5mrGUr5ncX8PAE0JZSm/rxNS+U5mnYiIp2Yv
 K9/VHyTR0vFjQTCY0mlvOs1Q6AN44zo0/EP7waDfUrCrdAS1PUiVhPMXjFqqbUC95a+w
 6/QQEmFy/MHWq+E/zXk2Z5YjK6vM6Gr4SkKYcOxqV8mhV9SffukuvClWAnVg5oGORgXg
 ZQpA==
X-Gm-Message-State: AOJu0Ywcq41k/mgyA+YzV9uefOe355XGWX1BAHYaMVe3jIuWoD3nNFer
 NCAy7E9bbeACQftJ89Rk6UZEeHkrN8f2vtlzo9yMb9vzMhRfTHUbMT966spmKnk=
X-Gm-Gg: ASbGnctAIF42h/1zyP7u+beHf969SXqMGjfzuQ/XGOHKGx1xmn4rqXGIzev0FSAMBlD
 PV0wQJtaRMrtmOxmZlrkioVupQ7fx3ydGdgjHEUx0c3Uv+sK7GLa+IK6OBV2kZ497Qdl8PtSMJT
 /uksx+pftN2scXrvU+Tctsbs/TNlpd+JUvmaeYCc77WVVXTDHwpcRo6Apr8f8awXZS+SzkLZmSU
 uhK71ohY5p8SO7ehr9Z+wovxgnJmLqtUnyfCl+1mx7DsimcVk6rYiSGWdVjCQ==
X-Received: by 2002:ac8:5803:0:b0:467:5711:bdb8 with SMTP id
 d75a77b69052e-46795444052mr5950951cf.46.1733934663468; 
 Wed, 11 Dec 2024 08:31:03 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:31:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 02/69] target/arm: Convert UDIV, SDIV to decodetree
Date: Wed, 11 Dec 2024 10:29:29 -0600
Message-ID: <20241211163036.2297116-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
X-TUID: tX0HLelTjvrQ

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 64 +++++++++++++++++-----------------
 target/arm/tcg/a64.decode      |  7 ++++
 2 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b2851ea503..9f687ba840 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7485,6 +7485,36 @@ TRANS(UQRSHRN_si, do_scalar_shift_imm_narrow, a, uqrshrn_fns, 0, false)
 TRANS(SQSHRUN_si, do_scalar_shift_imm_narrow, a, sqshrun_fns, MO_SIGN, false)
 TRANS(SQRSHRUN_si, do_scalar_shift_imm_narrow, a, sqrshrun_fns, MO_SIGN, false)
 
+static bool do_div(DisasContext *s, arg_rrr_sf *a, bool is_signed)
+{
+    TCGv_i64 tcg_n, tcg_m, tcg_rd;
+    tcg_rd = cpu_reg(s, a->rd);
+
+    if (!a->sf && is_signed) {
+        tcg_n = tcg_temp_new_i64();
+        tcg_m = tcg_temp_new_i64();
+        tcg_gen_ext32s_i64(tcg_n, cpu_reg(s, a->rn));
+        tcg_gen_ext32s_i64(tcg_m, cpu_reg(s, a->rm));
+    } else {
+        tcg_n = read_cpu_reg(s, a->rn, a->sf);
+        tcg_m = read_cpu_reg(s, a->rm, a->sf);
+    }
+
+    if (is_signed) {
+        gen_helper_sdiv64(tcg_rd, tcg_n, tcg_m);
+    } else {
+        gen_helper_udiv64(tcg_rd, tcg_n, tcg_m);
+    }
+
+    if (!a->sf) { /* zero extend final result */
+        tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
+    }
+    return true;
+}
+
+TRANS(SDIV, do_div, a, true)
+TRANS(UDIV, do_div, a, false)
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -8425,32 +8455,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
 #undef MAP
 }
 
-static void handle_div(DisasContext *s, bool is_signed, unsigned int sf,
-                       unsigned int rm, unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_n, tcg_m, tcg_rd;
-    tcg_rd = cpu_reg(s, rd);
-
-    if (!sf && is_signed) {
-        tcg_n = tcg_temp_new_i64();
-        tcg_m = tcg_temp_new_i64();
-        tcg_gen_ext32s_i64(tcg_n, cpu_reg(s, rn));
-        tcg_gen_ext32s_i64(tcg_m, cpu_reg(s, rm));
-    } else {
-        tcg_n = read_cpu_reg(s, rn, sf);
-        tcg_m = read_cpu_reg(s, rm, sf);
-    }
-
-    if (is_signed) {
-        gen_helper_sdiv64(tcg_rd, tcg_n, tcg_m);
-    } else {
-        gen_helper_udiv64(tcg_rd, tcg_n, tcg_m);
-    }
-
-    if (!sf) { /* zero extend final result */
-        tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
-    }
-}
 
 /* LSLV, LSRV, ASRV, RORV */
 static void handle_shift_reg(DisasContext *s,
@@ -8552,12 +8556,6 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
             }
         }
         break;
-    case 2: /* UDIV */
-        handle_div(s, false, sf, rm, rn, rd);
-        break;
-    case 3: /* SDIV */
-        handle_div(s, true, sf, rm, rn, rd);
-        break;
     case 4: /* IRG */
         if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
             goto do_unallocated;
@@ -8616,6 +8614,8 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
     }
     default:
     do_unallocated:
+    case 2: /* UDIV */
+    case 3: /* SDIV */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index d28efb884d..c218f6afbc 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -28,6 +28,7 @@
 &r              rn
 &ri             rd imm
 &rri_sf         rd rn imm sf
+&rrr_sf         rd rn rm sf
 &i              imm
 &rr_e           rd rn esz
 &rri_e          rd rn imm esz
@@ -652,6 +653,12 @@ CPYE            00 011 1 01100 ..... .... 01 ..... ..... @cpy
 ### Data Processing (register)
 
 # Data Processing (2-source)
+
+@rrr_sf         sf:1 .......... rm:5 ...... rn:5 rd:5   &rrr_sf
+
+UDIV            . 00 11010110 ..... 00001 0 ..... ..... @rrr_sf
+SDIV            . 00 11010110 ..... 00001 1 ..... ..... @rrr_sf
+
 # Data Processing (1-source)
 # Logical (shifted reg)
 # Add/subtract (shifted reg)
-- 
2.43.0

