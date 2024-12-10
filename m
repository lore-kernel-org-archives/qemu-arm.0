Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3437617njb;
        Tue, 10 Dec 2024 08:18:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXy0TQE1uLOTF8NuwqNbK20AeAsOBHIBJc6isprB2nshMeDZyAeNFf9DHdJIYiQ5P2A89M1yq/vwe0c7A==@linaro.org
X-Google-Smtp-Source: AGHT+IF3KCwu+pIPa0LkdlH1xxCcV9xjcott/2FIwCJqrSnIsRg3Lvs38c1imqeBlu/BIMKQtpX0
X-Received: by 2002:a05:620a:2b85:b0:7b6:eab3:cdd2 with SMTP id af79cd13be357-7b6eab3ce92mr20612485a.56.1733847517572;
        Tue, 10 Dec 2024 08:18:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847517; cv=none;
        d=google.com; s=arc-20240605;
        b=RhxI6QafB82xVmtiHpc8hMNNailbbcM93S80h5+Ye9OTgGJFnxaA38qoK3l3kbDdyL
         xCLQ94AwheYEOJ7ykjR+nYdSZvaVOG5n56MKrA/czxHuN2iJMBJvJXjXZC/eRYivynZ+
         9sDdefvr9+a0+ZSwtyZaNnmP1JU2XbObk71zrLTVgd9028f5jA4sHtbHKkBS+uZGbvFF
         Z8a0AiFCi7yPodVNVHwEvRELkrbdervIvF5e3zuhlFPXSub2x543pJhSvld7OeWPgsGM
         pf9jcUZZyV95/QXC5HcsN4cmEvPCi7mnhcvK/lsYI49dqwHmhUds7fOoY1NWIY3BbBtd
         gpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ifcSfCHSTTtxXndi5QQbGHpzoZtEugLsXBXrGvDqkmU=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=R4nDLwZYWlDKTkpOVP+3J3BdEll4gY6bjMz/bZd4Ex49RHuIGn3q/NG54XvD0fhGWA
         uFvBUw0mATrynEz/GRgZ9C5hZttbXmi4tfH/WXM497uv+Cg/NoRwmWwIh8hxQtNlvfQi
         NFxKPtYuEroYHaIj2xzwgJzbsRqro7KD+XCZ47Q2kZY1HjvzQOr4/ZH68Gy4IqUAMD68
         h++PoVHKwyH3mKXu4b9Xo9mFFcjv0XHd+ZLCrAzemTNDnI7zTeXrsJXKqJ0+H86MjeyV
         4Z1MuYy3gQptCg3QTh9Xe4qAnakvJlexSDBBGtYprYhtNHCjB+9BtXq4krUxuCzsSaoG
         ZX8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3yHLz2Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6ea9c4dacsi11406885a.339.2024.12.10.08.18.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:18:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w3yHLz2Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2vw-0002QI-JK; Tue, 10 Dec 2024 11:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2vr-0002OQ-HI
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:17:57 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2vo-0006GY-H8
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:17:54 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso2534202e87.3
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847470; x=1734452270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ifcSfCHSTTtxXndi5QQbGHpzoZtEugLsXBXrGvDqkmU=;
 b=w3yHLz2QxsG2UDyAXUuIeXMR0a6SduLCrpnImiKEUe5xCQj4hP3K27vdBaV5W+0gIy
 Eyj1NFgrGB1BsKXPUw8dA0ElzhwxbkSIcAaJJjaCHLWcXInkqyLC5d3lqrJYtsg8b9lK
 lNYWFKD5GmF4azcN1R86wn8dF9JV5olpN70WeF8DYfc640Ujk3J19OvbtTBSSqW/h+/q
 2CaGhb7KzIMO+1T83Y6v2w0iSDJCMRdouYuSfRgXXgtJRAgjV7oUAT3jmh98VQnT2z+f
 eleYmY3YKeAUcJuTMLj+TF725db+X6JBDFWJXIWPYF6PjjYTOUIQ386XiQPa+t4mlgZg
 rVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847470; x=1734452270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ifcSfCHSTTtxXndi5QQbGHpzoZtEugLsXBXrGvDqkmU=;
 b=lqa/OHKHs7s/51t/aiqkqRfl2mFzwamaRPoRY4DMLs5GTDWfvkSXu3mSqkT3P/iSgI
 kl2hMVJGp3ZOtnDZRq6DN0PXLJT5LuDnJyzOEILbKaWMRtOLO+XiZkBRGdaN9YsUlo/0
 mYzfyb5AfFePpeozMrTA7MCbYtuJAb2IhbJML9DiehUr1IrOEBbobz38sw0wR2DM0AZP
 87p+UvqFQdIMDMCBsRC61spVFkrItZqP/K0z5bn0suJBRFFJq1PDj4woJ7No03LSKPHe
 XVHRl3tRUaI8YVXkmMOyEI3a4J7HxU/VdQK5WwVtwTppmO/7ILyqV9LeWP57/MMslM9b
 Xg1Q==
X-Gm-Message-State: AOJu0YxWuWlgeN4aWUxQ3RpZtm1qUDCVIbKF+UvCQ6L+8BRBWWY5V15n
 OAHXUvtrCVJnxHR5W2H5D9fBDvdavcJs3qVJ/Sr3vI6xTy3LJN8wZGvkjIFydcB+6QQWk1AcNIR
 FgztfU1fe
X-Gm-Gg: ASbGncsGpDVAIt0vjBfBzLOQYNSctEZROox5I5bgl0D+Cto70b8ejXbao+9ws2ak9nr
 ruWjIH/ZDMJFODMvpfX0bwvwYuoUNFzlVWI9GT1pkDgHrtSpSezjGKeQc2kzurqvKov6mpEXLHk
 Y6nv5yNDlXyu8LSC+3o8+WeBswMVH0RMqbZaQcnyfYSyoWy9PSub35qq9ioDofVrdlyl7dS73pJ
 CWlVPRTeWNAmv+alaFWyATRXSfxqJuFwqqVRoUK9kaDcIPz1lBNYYiZgiA=
X-Received: by 2002:a05:6512:118e:b0:53e:2789:ffd0 with SMTP id
 2adb3069b0e04-540241048famr2202298e87.43.1733847470303; 
 Tue, 10 Dec 2024 08:17:50 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:17:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/69] target/arm: Convert UDIV, SDIV to decodetree
Date: Tue, 10 Dec 2024 10:16:26 -0600
Message-ID: <20241210161733.1830573-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x132.google.com
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
X-TUID: PbmhAWO+lRzX

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

