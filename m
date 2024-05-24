Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1994960ejb;
        Fri, 24 May 2024 16:29:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVd1x3vvdFwHTg8LbhTY3EASh/iRMNEebhKK7uOm+ert+Cr3p7+v9Zyez4xHvfrKSmhzFSJIsfc41cMwx86g5yzEXR3x0et
X-Google-Smtp-Source: AGHT+IEZGqo2kmD3Dp8GlkK5Ce2ekMD7xOWn7ZOvAOK1YhUtz8OjRRb29VbpFvW13wrJzicG6+va
X-Received: by 2002:ac8:7fd3:0:b0:43a:a0a3:61c0 with SMTP id d75a77b69052e-43fafb4e883mr57109171cf.26.1716593358520;
        Fri, 24 May 2024 16:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593358; cv=none;
        d=google.com; s=arc-20160816;
        b=BlK1SRu0EG0h8qOWTK7JrkV/TxmOfAYSWnDPOfZqccOQ9YqphXlD5NSXqcEc42uFe4
         UZNk2XKTH+jknA644OAznbvbIKp3GBetx0pPbxCJ3XqdjAriid5L2hF+eMGH7nqOuehO
         N6K85XW7LU4tCMZRxIXuWwCseJ4R8t3Ettei9E66wYrD57+TlbB2vgd8i9OROGijTR7l
         CH1gBmI24fxUwikBRwgEGkFlu5cPXcDLLsa4SUcOBCD+qSuKKI7xnpMGLygnkH+qRUJb
         bua8TiMB8m5V6ImMjkq0TenDshwdVSVFlERQQISPeQdaqF8Zai9K3Y0pbLPtqe7ZxQM2
         KzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4y0c3xhRmUQuoyoD+KpuLG+Oeo/1XM2y/5M67hpS/L0=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=yMYTvYeF1Z6qYPY4YfHugo+XJd95QfIerf79wn1yu0KqYKsWnmnPzLNbnBj9qPaIFs
         5Zro7AOKUTdco2igVOSlxwdk1OGqrS60HKNFidiDAwkpL1KQe31ahglkL1G3Gd3/YouU
         kThbNO+J/gF3rS0V757a9ftgrkJlHNYrT7GVRQNAblXdEdlmfQNa5e5ZzwaMFzz/ujVB
         DqpPyEgmyr0Mr6gnJyRKickHo1q99sNxzrbn6rNMsFjQRxXqezV6y9w29gREcl1As2IF
         Al3wVDz3lRlAi62N65SJSjEhWX3L7ALpBII0jxuMlAYI5QLYtKEo5AKDS8CluopIMaGC
         Z6sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v8vh9YLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18a6326si27963771cf.390.2024.05.24.16.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v8vh9YLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeJ8-00034F-N7; Fri, 24 May 2024 19:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeI8-0008DE-O0
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:40 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHv-0006wP-AV
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:40 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6f4ed9dc7beso2815250b3a.1
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593116; x=1717197916; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4y0c3xhRmUQuoyoD+KpuLG+Oeo/1XM2y/5M67hpS/L0=;
 b=v8vh9YLROjhygyae/RA0yn/lYz6wwilr3jA9/YCbl7PJVVK+8eva4De7CviKnIaFL3
 lVhcO0zXeSa/HxoMdRDYSAhfm7ck/OTYtyKKPrnpMuC9wiVFmBsNwFnjslOpz/vltkbv
 zYs2q85/vY6F6buSUHx+2rE9Oq/RIgq0DeRSIoYj14TLt0E10pYNdpIqpvudqUqv6/HX
 0U5kRXEsp6e1NSy62N2IBp28SPKynpY2Peh4JJDcFRs++qru/5M5oghpUK9ydEPlLcuj
 JDX1IHaBBzzdw2D3vs+BSZGyBQLAVs0FA5wbz85c7vQAcPteW+vUhY3DDpAmdtwkoWP7
 7A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593116; x=1717197916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4y0c3xhRmUQuoyoD+KpuLG+Oeo/1XM2y/5M67hpS/L0=;
 b=cbgi6GYBNMfgfVzFCD05D5BGID/UbHrF6SdvctLMtR5/cjpvio+N0VhI8FHC2LzhJR
 UeUf/3CgpjJ9TzC8pJ3jPgC1Awa0zuR/Qr7sE65/WycFY/nSJPucNyfCigq4j2RP/p59
 2oH4ATfKEW3S1e4Tjhr871s3m4EQDipe2kyWDgRSWrJIffi7re53zXnTnhck4JAy9qal
 jkGUGGz7v6IHpbQxNpB0z5mMsciJAkv7Yasnw7ZQXCGw7xUPkrguTYmHQMXAKSowDpF/
 tarXmT/kRxYM1ey05krV21cwTIjQI390GGlEbAWYCr0Ie5NF6m5JgghsfNYSv/Gu68oO
 FcNQ==
X-Gm-Message-State: AOJu0YwP3LQv6SuJfEzolTVHN7FR2GqMp3iRm/WA19uxHwpbEAeF45aV
 1USMAkVsIhmf1ui681J6dGjRt26Or36FINuW31a6otcAndfY9y79xiAOaK5Fm3M=
X-Received: by 2002:a05:6a00:a0a:b0:6f4:7113:5d0a with SMTP id
 d2e1a72fcca58-6f7727bdd7bmr11700037b3a.11.1716593116063; 
 Fri, 24 May 2024 16:25:16 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 61/67] target/arm: Convert SABA, SABD, UABA,
 UABD to decodetree
Date: Fri, 24 May 2024 16:21:15 -0700
Message-Id: <20240524232121.284515-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
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
X-TUID: JFeD1LhFZ6Zr

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 ++++
 target/arm/tcg/translate-a64.c | 22 ++++++----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index bc98963bc5..07b604ec30 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -922,6 +922,10 @@ SMAX_v          0.00 1110 ..1 ..... 01100 1 ..... ..... @qrrr_e
 UMAX_v          0.10 1110 ..1 ..... 01100 1 ..... ..... @qrrr_e
 SMIN_v          0.00 1110 ..1 ..... 01101 1 ..... ..... @qrrr_e
 UMIN_v          0.10 1110 ..1 ..... 01101 1 ..... ..... @qrrr_e
+SABD_v          0.00 1110 ..1 ..... 01110 1 ..... ..... @qrrr_e
+UABD_v          0.10 1110 ..1 ..... 01110 1 ..... ..... @qrrr_e
+SABA_v          0.00 1110 ..1 ..... 01111 1 ..... ..... @qrrr_e
+UABA_v          0.10 1110 ..1 ..... 01111 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index db6f59df17..61afbc434f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5464,6 +5464,10 @@ TRANS(SMAX_v, do_gvec_fn3_no64, a, tcg_gen_gvec_smax)
 TRANS(UMAX_v, do_gvec_fn3_no64, a, tcg_gen_gvec_umax)
 TRANS(SMIN_v, do_gvec_fn3_no64, a, tcg_gen_gvec_smin)
 TRANS(UMIN_v, do_gvec_fn3_no64, a, tcg_gen_gvec_umin)
+TRANS(SABA_v, do_gvec_fn3_no64, a, gen_gvec_saba)
+TRANS(UABA_v, do_gvec_fn3_no64, a, gen_gvec_uaba)
+TRANS(SABD_v, do_gvec_fn3_no64, a, gen_gvec_sabd)
+TRANS(UABD_v, do_gvec_fn3_no64, a, gen_gvec_uabd)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -10929,8 +10933,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             return;
         }
         /* fall through */
-    case 0xe: /* SABD, UABD */
-    case 0xf: /* SABA, UABA */
     case 0x12: /* MLA, MLS */
         if (size == 3) {
             unallocated_encoding(s);
@@ -10963,6 +10965,8 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x0b: /* SQRSHL, UQRSHL */
     case 0x0c: /* SMAX, UMAX */
     case 0x0d: /* SMIN, UMIN */
+    case 0x0e: /* SABD, UABD */
+    case 0x0f: /* SABA, UABA */
     case 0x10: /* ADD, SUB */
     case 0x11: /* CMTST, CMEQ */
         unallocated_encoding(s);
@@ -10974,20 +10978,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0xe: /* SABD, UABD */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uabd, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sabd, size);
-        }
-        return;
-    case 0xf: /* SABA, UABA */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uaba, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_saba, size);
-        }
-        return;
     case 0x13: /* MUL, PMUL */
         if (!u) { /* MUL */
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_mul, size);
-- 
2.34.1

