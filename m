Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4199012njb;
        Wed, 11 Dec 2024 08:45:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWRTTarRBjAbipMRWvm6rumoR/p4zgty1Ho/Ld5Uvx/btUhhMZpOm8T5YJ8hISVNK7wg78Mx3jJ7XXJpA==@linaro.org
X-Google-Smtp-Source: AGHT+IE1oEFYgxj9SJl5yLuVYthN7ULv2sSVKC+niaMgrTKhWxmwTX9/NsVVDADxIoc4PU95Yzq4
X-Received: by 2002:a05:6214:2684:b0:6d8:821d:736e with SMTP id 6a1803df08f44-6d934be4f1cmr55885466d6.36.1733935540905;
        Wed, 11 Dec 2024 08:45:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935540; cv=none;
        d=google.com; s=arc-20240605;
        b=TAeLHhInXOTiDagc+IYprum5cEWU3U+DjUig5h5pPNFWinJlFssavUk210ub7Y7nJM
         vF26TO/3QYiArhi1+GF2cNjPbV08UUWBIVVHpg1uH17TWH2uzM8spOe2p5xfWWmeoyQb
         LrwJuNuXhD89TaMCEbh2DsAhQU//sD515oligvyKzl1lGr4lLq5YsOfo3jfClVmTpDYf
         Vl6qgSi9bPGVIuT6zgsg4z9zvaW3M6NXwfXktmSkucDIen0stAtakvfbvSfmrj+8/pr7
         ga2+qlQi2G95x6D9R0XX9koxTdoueZvXIEUbOWkz+GjAUHqTsi6GQKJkpUqPukDthwbx
         mqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CqOTQiwXcBvssNWF61NfJfcgW9KkFmSxCssu4290Mqg=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=dmyw52+xPDLzqBdMrHZnvehk4p8CI0yqccj3A9X5fToOPjXZ5/L/QDMZVdTijYuji+
         sWdIF7cOIzcQgN2SUeoZ7nvnbLiyFIULuoNvEjF7dIWsngZsKaixcoVH57dghEExeK18
         ydkoj+mo8ciTXpfDsM0goMv8+PXjdWBHPK9fxwMXMMoTnRxgfzTQll65aqTGRn/x1e0g
         KiUVJlZBAx24U2BZOvDp4RRsZghdXHIwQ43fkC9qW4gE2erRWowidCoWVSXI3908r4QD
         A5e88//4xyQGLGDCxjT9y+HOwxQIAqT3mPybbKJdCqjy4FhLapbfmr9VN1Wx83Ip4fiX
         naVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZWfjqN/T";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d92e752f57si38275156d6.106.2024.12.11.08.45.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:45:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZWfjqN/T";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLPgG-0004Xm-Bb; Wed, 11 Dec 2024 11:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPde-00070L-8t
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:32:38 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdc-0001UT-DH
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:32:37 -0500
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-467918c35easo7242131cf.2
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 08:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934755; x=1734539555; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CqOTQiwXcBvssNWF61NfJfcgW9KkFmSxCssu4290Mqg=;
 b=ZWfjqN/TDX/NLJ4QkoKopMOB3pPze5PKmBqZRrKMR4IsZGZKNRhoddepdG1LpSSQRl
 yzVsYpyG5cZx+0Si/Fw87BUUEWpE8CwWX358uSFD40n59sUqXeloFqILUzzYv2K0t+Yr
 EzzReTMLOmvZCzoYxG4vN2vomEv2smAYkFwvMlufsTCMYuEX8ZPJl8NF71uccIt6Zh/K
 Tn+cXm65mbOlQF6aGWhNIl7HnPU63c5lgaoDUyorxQ27kukqyBnwYWrGlUSMfairOtZq
 outSZDhVfnCCuUuqJwsB/YjwZZlKw/YUyxiLaFE6dFdJMulIeXzTc01XrgstviIL7mE7
 +0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934755; x=1734539555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CqOTQiwXcBvssNWF61NfJfcgW9KkFmSxCssu4290Mqg=;
 b=Dvan3it44EmPUS0Q0+0qXTGBooHL4udARPD7zPudmyX0c1jhbLo5MZ2eueptv3r4Gn
 2tlsALVPGTjecgl5OXHq8wcOZLq7nx4WuR+xdBppDHpEOeMgExc25r1zjYiSHYhf4LPf
 LM8QtUsT7us30ZrgZMIK61hz4lhOATeDUP68lHbxw328wUvZRbIqyLPQAyNy6BTLQt6Y
 JqJ2EK3fMxIcgrG0WgEGQ1YpaG/NvB/XTLT8+41soV0CH8+NgkzVnBJF2qJcxIgmmpvU
 pIn2nUUq7eoqk9sjkQEBPL+FoDnSpTIE7fd5JGJjqDhFI8zQd25/rEsLBywygegTK87F
 15LQ==
X-Gm-Message-State: AOJu0Yzlbbtg/fbduuf91mdXPb34YnqVBP74mbdFbljQztPERXpo7Wr3
 764kEpkPoVJYY9PEsdzQdhkSYMd5WlJOzunPUte3tDSeNr9JrS4kLFf/ptFSCJLs/s/YM90XjmO
 4N3SNvjS2
X-Gm-Gg: ASbGncsM1/VStfeNP+V8+CuQkD3oMAthcTgDMc+ed2xMsqZUWN0QvyQmAnRmcmtcQ2V
 qPZ6Gx7UUuI92vRKMXvJcYMVAP3yAXO2UJk0Mssh811ijG6k3v1K0GzzmeVYpwxo6W5NEFYfleg
 Y0tJ0mwypD1bqvN2zUgpEH90xKTRuUo67HloHAIW4do2k/MTxK4dGufj9U47gMiE53AtiI1OaFR
 RYZKrxhfDQReCck7wLX7ubXkfWmZs5vo+5RQ7JMl7HSmZGgVC1yLTK1sErFpg==
X-Received: by 2002:a05:622a:15c2:b0:463:648d:32 with SMTP id
 d75a77b69052e-4679600f3e5mr510391cf.0.1733934755420; 
 Wed, 11 Dec 2024 08:32:35 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 38/69] target/arm: Convert CLS, CLZ (vector) to decodetree
Date: Wed, 11 Dec 2024 10:30:05 -0600
Message-ID: <20241211163036.2297116-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rH9NA6BdXMwK

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 37 ++++++++++++++++------------------
 target/arm/tcg/a64.decode      |  2 ++
 2 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 387bbbf906..ecb4578998 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8916,6 +8916,20 @@ static bool do_gvec_fn2(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 TRANS(ABS_v, do_gvec_fn2, a, tcg_gen_gvec_abs)
 TRANS(NEG_v, do_gvec_fn2, a, tcg_gen_gvec_neg)
 
+static bool do_gvec_fn2_bhs(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
+{
+    if (a->esz == MO_64) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        gen_gvec_fn2(s, a->q, a->rd, a->rn, fn, a->esz);
+    }
+    return true;
+}
+
+TRANS(CLS_v, do_gvec_fn2_bhs, a, gen_gvec_cls)
+TRANS(CLZ_v, do_gvec_fn2_bhs, a, gen_gvec_clz)
+
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                                    int elements, int is_signed,
@@ -9215,13 +9229,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     TCGCond cond;
 
     switch (opcode) {
-    case 0x4: /* CLS, CLZ */
-        if (u) {
-            tcg_gen_clzi_i64(tcg_rd, tcg_rn, 64);
-        } else {
-            tcg_gen_clrsb_i64(tcg_rd, tcg_rn);
-        }
-        break;
     case 0x5: /* NOT */
         /* This opcode is shared with CNT and RBIT but we have earlier
          * enforced that size == 3 if and only if this is the NOT insn.
@@ -9283,6 +9290,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
         gen_helper_frint64_d(tcg_rd, tcg_rn, tcg_fpstatus);
         break;
     default:
+    case 0x4: /* CLS, CLZ */
     case 0x7: /* SQABS, SQNEG */
     case 0xb: /* ABS, NEG */
         g_assert_not_reached();
@@ -10089,12 +10097,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
 
         handle_2misc_narrow(s, false, opcode, u, is_q, size, rn, rd);
         return;
-    case 0x4: /* CLS, CLZ */
-        if (size == 3) {
-            unallocated_encoding(s);
-            return;
-        }
-        break;
     case 0x2: /* SADDLP, UADDLP */
     case 0x6: /* SADALP, UADALP */
         if (size == 3) {
@@ -10299,6 +10301,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
     default:
     case 0x3: /* SUQADD, USQADD */
+    case 0x4: /* CLS, CLZ */
     case 0x7: /* SQABS, SQNEG */
     case 0xb: /* ABS, NEG */
         unallocated_encoding(s);
@@ -10321,13 +10324,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x4: /* CLZ, CLS */
-        if (u) {
-            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_clz, size);
-        } else {
-            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cls, size);
-        }
-        return;
     case 0x5:
         if (u && size == 0) { /* NOT */
             gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_not, 0);
@@ -10351,6 +10347,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     case 0xa: /* CMLT */
         gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_clt0, size);
         return;
+    case 0x4: /* CLZ, CLS */
     case 0xb:
         g_assert_not_reached();
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f112951df7..32355ee633 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1641,3 +1641,5 @@ SQABS_v         0.00 1110 ..1 00000 01111 0 ..... .....     @qrr_e
 SQNEG_v         0.10 1110 ..1 00000 01111 0 ..... .....     @qrr_e
 ABS_v           0.00 1110 ..1 00000 10111 0 ..... .....     @qrr_e
 NEG_v           0.10 1110 ..1 00000 10111 0 ..... .....     @qrr_e
+CLS_v           0.00 1110 ..1 00000 01001 0 ..... .....     @qrr_e
+CLZ_v           0.10 1110 ..1 00000 01001 0 ..... .....     @qrr_e
-- 
2.43.0

