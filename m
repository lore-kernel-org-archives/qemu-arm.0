Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4192787njb;
        Wed, 11 Dec 2024 08:36:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVhVL1+fe6Yx6bJzanhMBfx9G784IO3NI+wlXdZ23/QN6PZVaT3y0Z7z9e7jw99/dbe0qMZoySvaShVbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFR1h/lSJtvp9q7kaywoxH4+M7TOXPuiX54y4tC/0R578Xj7Htg0Xrgum043y4AIVhSB7pK
X-Received: by 2002:ac8:5ad1:0:b0:465:2fba:71b5 with SMTP id d75a77b69052e-46789527242mr57143971cf.13.1733934982902;
        Wed, 11 Dec 2024 08:36:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934982; cv=none;
        d=google.com; s=arc-20240605;
        b=MJN2p0ZiX4OlxuqjTk7hz5EzPjqdYXkeosmEdLEVWKHdeinnHR2cwk1bcKxWCVOWFZ
         jeb2Uq+SSzLXLgv0GYPJDPDKrB5MPCv3lpUtjhn7xNsMRm639EO4EnwO7XXqVZ2Uz9B+
         3sHDJXQKx/fhOfAG3KofazBEk/otBJLhp8rx12JqoBAXQi7IoExLBFwrvIqansBwqzRj
         YrHIb8pPpmNKk1W6T/L8B1L4xn8jXUfTNDtUtp2sIPeOYg9ptGfdpwQXy939YLtKAWkE
         VpZKbKD7AFoRy0NO3ntQHsllzTpPRJVqh5aUVChH3f/6TasTMDSf7/7e6mKQYZ1JB4ok
         wJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jketwBKoo02OCAcU1bp5I+NgSnbqc1IWZRElDFeh+xg=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=AQdnue2LV5/PK287jPO4I8QtMP4Iz+GTE/KAjq/2AyfqdMUc1FSTO/W2uNRdzieXiF
         fVL4PyT4sALHtP0cc5xYsfvmjHCqa/mWfxTnfPUXCBHkdDJINMkHg9F0Cgc2uk1A0R9e
         GKqRBdyEeDCZ4hh2RA/YqTh8zOMyMiHEukyrNTRXR7hLnGkM1yGnScnCMFpYOKzrDVpk
         /JMspnoQmI+IZvHl/GMaPFMEVxf1hPBrnG237DrlrbAUZ0qZ4XD6EFPM0H35at8d7vjt
         voBGteKJH1+bO8dXLT5W/Wvi+gFm4QHlO5FAUWqFxDppB8Rr6eJDMhyWVKcCLPxs1MvD
         BuFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dx3btb73;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46790b8ce2dsi13300801cf.64.2024.12.11.08.36.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:36:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dx3btb73;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPcY-0004Bc-Rg; Wed, 11 Dec 2024 11:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcO-0003xV-Lp
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:21 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPcM-0001D1-G3
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:31:20 -0500
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4676f1a43dfso8013891cf.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934677; x=1734539477; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jketwBKoo02OCAcU1bp5I+NgSnbqc1IWZRElDFeh+xg=;
 b=Dx3btb73jPj3pGCoEM6xu/O6LTICxuDmIOnzHZ893aEW3TCLeo+FS4D/rNtxziigHj
 Zpk0/COkB7l0BWOuUQxcxaHvFkup5fBCWC+ncCqqtk2QeUFxudvkrbPhOLuTj+NwuaAk
 XRovxBdlRgJ05efLaaYtzuHzgJcfUP3YLTsDPVyx0Rjm7QMlkiTNvvKdHNDznAeiq5+g
 VTf6lBXJKrAuAAPMyFHWfzDMMlePgBdPukMfpjVRNS7DtusSPJZV11sdnMW+cqCJMxJY
 JlzeRrWgIWrfGPxtMK5N+DxvLwegveOb7C3I7dEh22L/7LEJAkUYcJSQ9O2iGaO38S+r
 vscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934677; x=1734539477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jketwBKoo02OCAcU1bp5I+NgSnbqc1IWZRElDFeh+xg=;
 b=ARI868J8BGdX7PXbDRgkDGNGlqm/e4zr9YZWa3gygbItJRmilF/SlV+O/3DlWdRfke
 UOvvO1fTsz1y3n0NZGrnIQ7xgz3n3fnghz36/Gbca2v4hmrntCKO4DpftKc6Eknkdtv9
 jy30tmOE7rBW/VgYlY5/2n3CcAczNezP3yh6nuekq7GPSrBR9NQ568SfouXCLwU6DPHm
 39s6H2nHKy8XAGuaqVDfOJTNkeionkZP06giXyRJVje/NVwyS3IBUs5Hj2FHjkD2PyDz
 ssYSczrl4vP3wOPIPmh7Ajpe7YBKWxQWNJXiuylLQNSNcon2rn7jUEOI2OlQdyDssDcz
 6YoA==
X-Gm-Message-State: AOJu0Yxt3N+7prz/bDEzY+xnbdRYdBpAfeMg8hXywdmTG4hkim6GwG/q
 lfLl2lV52YSEPciHb7oqcTLt7OUffQ6TP3XaIAzfO8hNqzNkv55IqveRYNqTHJNIwXONNYqKK4H
 Ynho4/dLx
X-Gm-Gg: ASbGncvQcxPWkUgUa55H2dhoy7geGRr4rBFpv4yembFn9JrIqt3YVwOXVNHfP4OxRwZ
 EE3v8JIvniLCReyYYS5GTvHJV1Dpxea5+SRx3arqOKwUxh3iUbVDyPZichMTePGuoBoztkbMLe2
 jMdgoG8Bl9Crr7YDwJ/tgffzG/uYuvkxoUhnkLTey/cmKmC3qwhkOjEkO8h9YRCEHz9aorky54Z
 RkYM4w+w/FRmdVgWWcgjGbr/bL0CXPTxo4TMyHKJhlO4lDQrhJI4DhaszzWbg==
X-Received: by 2002:a05:622a:8d03:b0:460:ffdc:4cb7 with SMTP id
 d75a77b69052e-467894dc699mr58390891cf.4.1733934677116; 
 Wed, 11 Dec 2024 08:31:17 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:31:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 08/69] target/arm: Convert CLZ, CLS to decodetree
Date: Wed, 11 Dec 2024 10:29:35 -0600
Message-ID: <20241211163036.2297116-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
X-TUID: fLRXaIVmQI5Q

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 72 ++++++++++++++--------------------
 target/arm/tcg/a64.decode      |  3 ++
 2 files changed, 33 insertions(+), 42 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1805d77f43..552b45b4e2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7738,6 +7738,32 @@ TRANS(REV16, gen_rr, a->rd, a->rn, a->sf ? gen_rev16_64 : gen_rev16_32)
 TRANS(REV32, gen_rr, a->rd, a->rn, a->sf ? gen_rev32 : gen_rev_32)
 TRANS(REV64, gen_rr, a->rd, a->rn, tcg_gen_bswap64_i64)
 
+static void gen_clz32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    TCGv_i32 t32 = tcg_temp_new_i32();
+
+    tcg_gen_extrl_i64_i32(t32, tcg_rn);
+    tcg_gen_clzi_i32(t32, t32, 32);
+    tcg_gen_extu_i32_i64(tcg_rd, t32);
+}
+
+static void gen_clz64(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    tcg_gen_clzi_i64(tcg_rd, tcg_rn, 64);
+}
+
+static void gen_cls32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
+{
+    TCGv_i32 t32 = tcg_temp_new_i32();
+
+    tcg_gen_extrl_i64_i32(t32, tcg_rn);
+    tcg_gen_clrsb_i32(t32, t32);
+    tcg_gen_extu_i32_i64(tcg_rd, t32);
+}
+
+TRANS(CLZ, gen_rr, a->rd, a->rn, a->sf ? gen_clz64 : gen_clz32)
+TRANS(CLS, gen_rr, a->rd, a->rn, a->sf ? tcg_gen_clrsb_i64 : gen_cls32)
+
 /* Logical (shifted register)
  *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
  * +----+-----+-----------+-------+---+------+--------+------+------+
@@ -8322,40 +8348,6 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
     }
 }
 
-static void handle_clz(DisasContext *s, unsigned int sf,
-                       unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_rd, tcg_rn;
-    tcg_rd = cpu_reg(s, rd);
-    tcg_rn = cpu_reg(s, rn);
-
-    if (sf) {
-        tcg_gen_clzi_i64(tcg_rd, tcg_rn, 64);
-    } else {
-        TCGv_i32 tcg_tmp32 = tcg_temp_new_i32();
-        tcg_gen_extrl_i64_i32(tcg_tmp32, tcg_rn);
-        tcg_gen_clzi_i32(tcg_tmp32, tcg_tmp32, 32);
-        tcg_gen_extu_i32_i64(tcg_rd, tcg_tmp32);
-    }
-}
-
-static void handle_cls(DisasContext *s, unsigned int sf,
-                       unsigned int rn, unsigned int rd)
-{
-    TCGv_i64 tcg_rd, tcg_rn;
-    tcg_rd = cpu_reg(s, rd);
-    tcg_rn = cpu_reg(s, rn);
-
-    if (sf) {
-        tcg_gen_clrsb_i64(tcg_rd, tcg_rn);
-    } else {
-        TCGv_i32 tcg_tmp32 = tcg_temp_new_i32();
-        tcg_gen_extrl_i64_i32(tcg_tmp32, tcg_rn);
-        tcg_gen_clrsb_i32(tcg_tmp32, tcg_tmp32);
-        tcg_gen_extu_i32_i64(tcg_rd, tcg_tmp32);
-    }
-}
-
 /* Data-processing (1 source)
  *   31  30  29  28             21 20     16 15    10 9    5 4    0
  * +----+---+---+-----------------+---------+--------+------+------+
@@ -8381,14 +8373,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
 #define MAP(SF, O2, O1) ((SF) | (O1 << 1) | (O2 << 7))
 
     switch (MAP(sf, opcode2, opcode)) {
-    case MAP(0, 0x00, 0x04): /* CLZ */
-    case MAP(1, 0x00, 0x04):
-        handle_clz(s, sf, rn, rd);
-        break;
-    case MAP(0, 0x00, 0x05): /* CLS */
-    case MAP(1, 0x00, 0x05):
-        handle_cls(s, sf, rn, rd);
-        break;
     case MAP(1, 0x01, 0x00): /* PACIA */
         if (s->pauth_active) {
             tcg_rd = cpu_reg(s, rd);
@@ -8542,6 +8526,10 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
     case MAP(0, 0x00, 0x02): /* REV/REV32 */
     case MAP(1, 0x00, 0x02):
     case MAP(1, 0x00, 0x03): /* REV64 */
+    case MAP(0, 0x00, 0x04): /* CLZ */
+    case MAP(1, 0x00, 0x04):
+    case MAP(0, 0x00, 0x05): /* CLS */
+    case MAP(1, 0x00, 0x05):
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index dd44651f34..410eaa9333 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -696,6 +696,9 @@ REV16           . 10 11010110 00000 000001 ..... .....  @rr_sf
 REV32           . 10 11010110 00000 000010 ..... .....  @rr_sf
 REV64           1 10 11010110 00000 000011 ..... .....  @rr
 
+CLZ             . 10 11010110 00000 000100 ..... .....  @rr_sf
+CLS             . 10 11010110 00000 000101 ..... .....  @rr_sf
+
 # Logical (shifted reg)
 # Add/subtract (shifted reg)
 # Add/subtract (extended reg)
-- 
2.43.0

