Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1878407ejb;
        Mon, 7 Aug 2023 20:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo61ohhzBKBBrAWNe6ShNscOTsf3SNca+Z1DaCwSzzC0oaekV4tmTs95x7Z7luXNpKW336
X-Received: by 2002:a05:620a:3913:b0:76c:b479:1ad8 with SMTP id qr19-20020a05620a391300b0076cb4791ad8mr14805748qkn.1.1691464603396;
        Mon, 07 Aug 2023 20:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464603; cv=none;
        d=google.com; s=arc-20160816;
        b=DZ4Q1zQTSZ7fk3txLIdAfdyaHKSksNq7BXbaJPrnVdNo3p4GoptU2T/I0H9A6du69H
         46bGEXpH3r+znfWviqZy6LABKBpNWPBOe2S7uu36KuPaK4UJ+0cCxluCp/j+iVXEAKf2
         HLhzMLkZ8N/Iw5H3XoWLgOdgiMLhKThoBCeOBMASH1XEKsbdTZLK87pnjmzUsV7OsFki
         VdWbjMjVV1eUdvR8b7F29D9LjXhQ7PPLpugF8a7qcUpVz2aqPFI4KVLZmRvjc1htdwsh
         FYHBWvph+JctbPUxYbE2PCm3QcgQb49BpIdKms009P9sZ85PB/9zN2Lh/DlYbFQv4aMk
         99aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kot5PEmuPDK/CyGN6ee3rwJzaEBsQpYk5OnUPUMG6UA=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=Vx2xB15MVojSH/550+9NdrRlgZ+QJ/sFZApY0KqxQD82ObajPn+XMUPQOj/mG05C5A
         O+OTBatNsKryVF8ve36sWgp5y9YuoCCknbbfQOxUl4sMDqlJju4RTzdk95XbO2Ko61y0
         9MFGHEYWcuwCVb33MzdYyfiMUjncHekqMa7eTJEKIi0DmqfnYotOAxaY1jsMpIewBXtW
         uFfP8MW8ph3gY44R/W1MvIWQ3sdjHDAQieGMD514ckBoFeieXyBE08PaD57IXGu56g0W
         1DJPC9m/unZFKKpmBKNvsj6KQA+qsKAkh4+o1QRWamKN9lyrkT31eFZFscSMaogjnBMw
         RNmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H0N+6wB/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qt3-20020a05620a8a0300b0076719299db7si5153289qkn.567.2023.08.07.20.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H0N+6wB/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTD9O-0003LM-VS; Mon, 07 Aug 2023 23:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8x-0001if-SW
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:25 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8f-0000MS-JX
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:23 -0400
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7653bd3ff2fso505348785a.3
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 20:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464324; x=1692069124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kot5PEmuPDK/CyGN6ee3rwJzaEBsQpYk5OnUPUMG6UA=;
 b=H0N+6wB/55D91L4PTpoKFT2OnuU5j8OL6wf21rRD7/ElhRhjkxgLZeXS6+lGRXxs70
 8oTmNS7p4OFVSizMFjF8Zch052RgqR4b6vSHzDdA1rRSq05gLWQc/AFvj8uNqmTot5hf
 ypU2YGUn6kIO5jzndI5UjBZvZhE+XP0+6HMWwvobAwVpr59+F27G2uMS7+9PUGB8Df8y
 0s0z+f1ipIn3kV15qx9kOyylWkob8fy89sQBxFEwXCjPVT65k+1+JA8DzfkW6t4gNZqV
 wH4vkTc0i6G4YE+prbsf12FgN/MYTjyi89lql8gNDSGwLm2UwDBGrtVXlbVkUz/kw+0i
 OfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464324; x=1692069124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kot5PEmuPDK/CyGN6ee3rwJzaEBsQpYk5OnUPUMG6UA=;
 b=GeRky0BGmTqxFSz2cbUMyPrghZTnBzxzEb8c9gDskXmYSPXL0EDNOdWO0d6rPFSz8X
 tt6WWP1qmRjYo7JD9VdtJKbHoAAC17xw9DHAPLilGw8MtzA+vz9kh98nTQAAeUxhuR/S
 AYCegaNNi1H3mjT6hNjcJVknseV2Jq8bkGLRHzGVFIhBaXnX6Sc4o6XLOVwXIA3KuKee
 vG+bWiFDjyZJ/9NFKUtE66jGr+G3HB9AycAHDWXM1Mo5dhYwfRcQGeRJGtdZD5yRqmF6
 9b2XAtpyYS5hnwtjRMNaqZGE+ErGMUghPcR7SOsgTH8WFU/NHrHzIUhS4R9aKQN5r2a4
 bLBg==
X-Gm-Message-State: AOJu0Yw4WXAtMqxRQ5LpmdG95S+4LU5ptmGLwd5ofLlfy6BrcbAhejJQ
 ui6GML2m+v3qdv3N81FyrESyqx2od0HuM7AUH4Q=
X-Received: by 2002:a05:620a:28d1:b0:76c:95a5:b86b with SMTP id
 l17-20020a05620a28d100b0076c95a5b86bmr18046091qkp.47.1691464324226; 
 Mon, 07 Aug 2023 20:12:04 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:12:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 22/24] tcg/i386: Clear dest first in tcg_out_setcond if
 possible
Date: Mon,  7 Aug 2023 20:11:41 -0700
Message-Id: <20230808031143.50925-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: Jg2jwO+Ib2r8

Using XOR first is both smaller and more efficient,
though cannot be applied if it clobbers an input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index e06ac638b0..cca49fe63a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1529,6 +1529,7 @@ static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
                             int const_arg2)
 {
     bool inv = false;
+    bool cleared;
 
     switch (cond) {
     case TCG_COND_NE:
@@ -1578,9 +1579,23 @@ static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
         break;
     }
 
+    /*
+     * If dest does not overlap the inputs, clearing it first is preferred.
+     * The XOR breaks any false dependency for the low-byte write to dest,
+     * and is also one byte smaller than MOVZBL.
+     */
+    cleared = false;
+    if (dest != arg1 && (const_arg2 || dest != arg2)) {
+        tgen_arithr(s, ARITH_XOR, dest, dest);
+        cleared = true;
+    }
+
     tcg_out_cmp(s, rexw, arg1, arg2, const_arg2, false);
     tcg_out_modrm(s, OPC_SETCC | tcg_cond_to_jcc[cond], 0, dest);
-    tcg_out_ext8u(s, dest, dest);
+
+    if (!cleared) {
+        tcg_out_ext8u(s, dest, dest);
+    }
 }
 
 #if TCG_TARGET_REG_BITS == 32
-- 
2.34.1

