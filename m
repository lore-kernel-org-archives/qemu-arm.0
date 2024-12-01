Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2149592njk;
        Sun, 1 Dec 2024 07:10:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjKFw6MDxwP6L1KhyOMljN+Gi9N188MtP/v0E8GCVhnuhbWaHco5c/cYgRcxVWa5zVZ8bHtmKmYJ7LsA==@linaro.org
X-Google-Smtp-Source: AGHT+IF+6iKTSGZZf0tJWeyHNnsd6srYJT3aQg2iUK17r6+zx6lhHRLW+Tr3u4qcW/KfwV7CA6D9
X-Received: by 2002:a05:690c:490b:b0:6ef:4ba4:ecb0 with SMTP id 00721157ae682-6ef4ba4f075mr173656437b3.6.1733065848034;
        Sun, 01 Dec 2024 07:10:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065848; cv=none;
        d=google.com; s=arc-20240605;
        b=AzCouafdyKTATtz8wQ2TCbcCOGATbe8XoicWqLE+6F+MsucVq4+E9Eg+qT40DSNHc4
         ZKf4SbJjkpgbRrIViGtHeNlNYbYjyM0BmRfzZ5PxfuHBncRAY+vy2FWSG64CZ7IH19T+
         6gb6WrwrkHqv+EL7as1acLfPBVINCH1nMJO4nAIcYwf6PXL5V2d+Gh6wcXVz44E5ovsz
         0nDGF/3BOW9lPVHf8qhosL2aNr6iX8sJjBHV+sfxQwk42bihBJEBH5fBByQPx0B1Qfvl
         0UKEi9cUWz69NNVgO421xmv2XosPXAUF6+tU7F3Aehr+d0Nv5lDqg4WkmtlbuDa3v4vt
         kQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=U2K3bD/y5P6zAvU+4G/5z3hxC4KhsNKhW8wgn11RzbE=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=YVQrSaXvtp2ezRUcQ46DXXr3duVTeBry76tr/+h5JJOPGH09BWJO5YNjy2iaD1fGVp
         qZYiMg0ee2GWgMphW+gfxOlPg2/8LpTI1gY7grjpUJxbmgx8c6M7uwLK0zfxZm4syjN9
         wo8cyC22WI27SHwoRlgsqqngQ29Vv+ZZ+b5h+OTl6JOr4Px0kByHkmqk3BHPjtvd/yKl
         iZs8HMMmkVapcZhTHUaLn8szcjLQgI8Q/7quzvEgezGcl20UE5ccMLT2nSOp8DpEBX+A
         PzOLDotyNmdvX17IXxrC5Do1z6ixmjW7vZUmLAQ2O3enE/E/aKheuhCfbitH9Nau+JXU
         5lYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=miuMmj09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 00721157ae682-6ef4de03941si60470427b3.487.2024.12.01.07.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:10:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=miuMmj09;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlWg-0001DA-3k; Sun, 01 Dec 2024 10:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWc-0001A5-6u
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:18 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWZ-00043C-QD
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:17 -0500
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3ea47651a10so1256452b6e.0
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065572; x=1733670372; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U2K3bD/y5P6zAvU+4G/5z3hxC4KhsNKhW8wgn11RzbE=;
 b=miuMmj09vjBvS5HZ5LGHA/ukIf82rFQCwR/WSbui1rTmzta+HTvtWcfakEerAwAtcK
 LWA9Z20YA63550g/EhjK6bceYZtz1Fj1HBJC7g8fpQlYHSiZKAjoIyeEdA3FU+4qRW0j
 GQ6x07RZCpFz0stD7zaqhfRYnF4udFPS5u2X8GUewAvX5fdHZw+Wb8vvKjaJhbJ8ICQq
 UsolIXflrek0RPH0eBi+31CLuTJuUWK5v5yGdyXfRX5stod/V+U2XfNHM/HDaxbT+sid
 rfl8Gdrjivgi74LTlWFbokrb7uGx1/p/EdeXFG7b8q4yBWF0+5fNeyS4+/7eYRipuE3j
 dEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065572; x=1733670372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U2K3bD/y5P6zAvU+4G/5z3hxC4KhsNKhW8wgn11RzbE=;
 b=NUWzWl1uzC87DmAYSYFpiu0OD9hKj3gpuWwt2a/G5M94lnKyxSRv+O2X7h/qLSiAfo
 n4Q3WlELBkh5izWdQjfPcEX3N93vuREiH0b0xL74rayrF0z/GV6u2901ogVbpQ7pxL8I
 SBr9na30PapwUZJ36DH67UK61XHXz+Vt9EOUAVHTjrjUMF9hc350l8VfFUNCXxdQI0EB
 3penUCcCjqitaYyNgSk406QIWg8VcfjYOcbVFNxUVqpCZ82fsP2ODLrLb+wjlN4zDpcK
 /mFezB1XDfgbBuTA9PQo0KLClvB0QKG2O3Q5yJ3c/+Trmge4q/4xTDXYM6281+7V3aIP
 r/MA==
X-Gm-Message-State: AOJu0YzTjd/9XLTx0Xzvd6EBRl2waazc8QKJcjR4FtFW0M5p8/Olpplz
 dEzQbQvQh5zO0EJykbWHPBpIEBvEUpgGXD1XSvEkSsxABfz+QfIvLTYpTsoxJvw=
X-Gm-Gg: ASbGncumtVxn9xXsEwZ+8hP7WnsfPEQZCcLaOxdeckeLw+muzhrG3JHOduX2Wptax85
 mbOd9Jw/bJDqrg+75PJQgB8P4Rcvu9wvNuYs1bBAXbNC47YIwqPFaxAg3ILHiRfmWfkYaIViwnj
 qXbtwLMOEfSRTKXIdF2zCckrJ8zMhqa77i8tbzVtqkXOGfdEVAlhQc+HujiAHNBEqd8JPUVsL2J
 MFgVFHq0R0aeQ9wjBoAGTa6D3hibxT43yF6mz0D+5r7aQY2YfgygFWfj6oWeiUeAD9qJ6NHMS0/
 8uF88CLT+6AVHvDjm3Gy/ktLIA/DWMhI0doh
X-Received: by 2002:a05:6830:43a2:b0:718:1160:670d with SMTP id
 46e09a7af769-71d65cf3da2mr14482298a34.19.1733065572347; 
 Sun, 01 Dec 2024 07:06:12 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/67] target/arm: Convert UDIV, SDIV to decodetree
Date: Sun,  1 Dec 2024 09:05:01 -0600
Message-ID: <20241201150607.12812-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
X-TUID: akem/3zaA4au

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 64 +++++++++++++++++-----------------
 target/arm/tcg/a64.decode      | 22 ++++++++++++
 2 files changed, 54 insertions(+), 32 deletions(-)

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
index 197437ba8e..c218f6afbc 100644
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
@@ -649,6 +650,27 @@ CPYP            00 011 1 01000 ..... .... 01 ..... ..... @cpy
 CPYM            00 011 1 01010 ..... .... 01 ..... ..... @cpy
 CPYE            00 011 1 01100 ..... .... 01 ..... ..... @cpy
 
+### Data Processing (register)
+
+# Data Processing (2-source)
+
+@rrr_sf         sf:1 .......... rm:5 ...... rn:5 rd:5   &rrr_sf
+
+UDIV            . 00 11010110 ..... 00001 0 ..... ..... @rrr_sf
+SDIV            . 00 11010110 ..... 00001 1 ..... ..... @rrr_sf
+
+# Data Processing (1-source)
+# Logical (shifted reg)
+# Add/subtract (shifted reg)
+# Add/subtract (extended reg)
+# Add/subtract (carry)
+# Rotate right into flags
+# Evaluate into flags
+# Conditional compare (regster)
+# Conditional compare (immediate)
+# Conditional select
+# Data Processing (3-source)
+
 ### Cryptographic AES
 
 AESE            01001110 00 10100 00100 10 ..... .....  @r2r_q1e0
-- 
2.43.0

