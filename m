Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1877443ejb;
        Mon, 7 Aug 2023 20:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn6ArJU6FFGHmagLvDiOK7EPXsDs3HgZLNl2k9icKUHi0J8pLhV2gNPj5LdEnFXbdtY559
X-Received: by 2002:a05:620a:2415:b0:767:382d:a203 with SMTP id d21-20020a05620a241500b00767382da203mr13359717qkn.36.1691464465701;
        Mon, 07 Aug 2023 20:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464465; cv=none;
        d=google.com; s=arc-20160816;
        b=UFvaeFRmS1onDYjGV5uKomY2n39wBq5+w5RIIqStq0yA8FFcBdlwewqJyx9L4xrfJl
         ALOc4+pjJqPuh7gvQWQ/CX2kguDfghMwrOv7Gw+K1VjXWTMihyyjKT2MmcV2fyM5WkWz
         oZe2wUAAWzlq/nQteJgoEu0WcKI6egXdY6lt5nbErxFpbY8bqZkvAJzXWf8KfVyZdy1U
         Bf8Y+BzuK0lIDbEhp6GWsghuBn4KHV90u6qLInhYzCZLRODpA5sFvF8xAigmoL6tEA6F
         D/XQeBP3Ofio2zrjoThD24DVsjqCHGYAzC7XvglvJNNo2tDBr0gYCDDue/y62n1B9I6D
         O4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nSqKhjdDiCtip+BntZ0GsTzaBi/Ae7dOmQKXIzVgS5E=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=mftIVAG2ol9oNQQ20Os+6FR5Xo9QWSvyc3Yuf054iGx/b3u7RA0+a4XVuu4sIUsVvh
         90lV7j9PdonwxDwj9PO4VDoyrMa9up/cki0ougUIN+RhDZW0rdwUZ25oKUTsPFvWLr0u
         vL1PvISq4V9ZeEP/JsBpAHysJds21gfdpmzCnUKbdDt+ALXb0f0D6DcLT2c0Z7vtBqIs
         Oc5xNhzXk+RtOybUVreANUAm+nTtquIIPtvA8o9Wn69mBNNo+a+nT/T3JweSo7/rkR3m
         COqaRe1GhjbPmzd3jngNrNFYxEOQu8OGyOuIM5Kl6qcqqteP5tR6ySADkxC0jNOszrHw
         8wmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hMUILeGM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19-20020ac85c13000000b00403b2544bb2si5821898qti.427.2023.08.07.20.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hMUILeGM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qTD94-0001uR-04; Mon, 07 Aug 2023 23:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8i-00011e-EE
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:12:08 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8V-0000EJ-Qm
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 23:12:08 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-56c7eb17945so3104472eaf.2
 for <qemu-devel@nongnu.org>; Mon, 07 Aug 2023 20:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464314; x=1692069114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSqKhjdDiCtip+BntZ0GsTzaBi/Ae7dOmQKXIzVgS5E=;
 b=hMUILeGMl+8U5fyDztjvIHibyiPrSe14KuhkaR+0ovQimWBUPyqTHzfNiqglC8kHgK
 b0lzYwBbleV4yGtUmvF9/3pFhEsv/0RgSoy6yUAcX0erRzNdYUHSxtFbDYTItaUFV2fe
 Xf0oXtUuuYmFJas0LxeVufF1RZpMpjR2ksl9xG8Nt48W5GfSHVhTxkBUX14ZGY1fQb09
 IvOMJvekXF43YNg86Y2k+pxMrk6Bi0PNnk4LxfWUDactJsl0/o9mBOfTnbNNjBu6fV/A
 6Hgoi13AdPEb8rzP8o1ITYpEUzRjQ8nzgCOKRSkmyUhKmbrcqiW4I6xzDT2KeB90GUrj
 Z2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464314; x=1692069114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSqKhjdDiCtip+BntZ0GsTzaBi/Ae7dOmQKXIzVgS5E=;
 b=e6Ac6aX4Oz88YykM6nkTuLgApxAMCLrA9Gp2X8H3hGQYIWBW9j+vMqtkbeVktwKbTm
 ufmBINHXMsXftrXyX5HuQeB5YtYWvfh5cfyzDGn9UUvTSM7fzPmYMt2YizEX9UCE5tTh
 SE7ix7+SEbXYBqlG59l//28PduFBTZmILMfG/+KMdhsF0zvkgZIu6ToGEfttJU2Tk+v0
 Dq4JK9Cin5DClm8UtX0agzaSeqZNSoWHiPqIlNkyIr6S1THOYtOMCYUmObP5oI13Q3Ot
 TyJG/zdEMG2fDpbC0d4Axz6GOi9Uq0bsAUwYOrJrEotviRffUNkrEAKqbwlViotNYFZj
 KLKQ==
X-Gm-Message-State: AOJu0YwLalXMPuk7W01FETJWQHd7hLaijYY8G8Xq9JDJYfW9E2sGBF3g
 wbeHZ3V82gGFXlxDJXic0YBDQ83raPoT7orS/yM=
X-Received: by 2002:a54:458f:0:b0:3a7:9666:2a60 with SMTP id
 z15-20020a54458f000000b003a796662a60mr5709506oib.51.1691464314498; 
 Mon, 07 Aug 2023 20:11:54 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 11/24] tcg/ppc: Use the Set Boolean Extension
Date: Mon,  7 Aug 2023 20:11:30 -0700
Message-Id: <20230808031143.50925-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: iusGTtnNfCc1

The SETBC family of instructions requires exactly two insns for
all comparisions, saving 0-3 insns per (neg)setcond.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 10448aa0e6..090f11e71c 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -447,6 +447,11 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define TW     XO31( 4)
 #define TRAP   (TW | TO(31))
 
+#define SETBC    XO31(384)  /* v3.10 */
+#define SETBCR   XO31(416)  /* v3.10 */
+#define SETNBC   XO31(448)  /* v3.10 */
+#define SETNBCR  XO31(480)  /* v3.10 */
+
 #define NOP    ORI  /* ori 0,0,0 */
 
 #define LVX        XO31(103)
@@ -1624,6 +1629,23 @@ static void tcg_out_setcond(TCGContext *s, TCGType type, TCGCond cond,
         arg2 = (uint32_t)arg2;
     }
 
+    /* With SETBC/SETBCR, we can always implement with 2 insns. */
+    if (have_isa_3_10) {
+        tcg_insn_unit bi, opc;
+
+        tcg_out_cmp(s, cond, arg1, arg2, const_arg2, 7, type);
+
+        /* Re-use tcg_to_bc for BI and BO_COND_{TRUE,FALSE}. */
+        bi = tcg_to_bc[cond] & (0x1f << 16);
+        if (tcg_to_bc[cond] & BO(8)) {
+            opc = neg ? SETNBC : SETBC;
+        } else {
+            opc = neg ? SETNBCR : SETBCR;
+        }
+        tcg_out32(s, opc | RT(arg0) | bi);
+        return;
+    }
+
     /* Handle common and trivial cases before handling anything else.  */
     if (arg2 == 0) {
         switch (cond) {
-- 
2.34.1

