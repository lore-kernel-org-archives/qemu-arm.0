Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1044564njb;
        Fri, 28 Feb 2025 08:25:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXDCvxbirkVAMzO6XYCly2R/kTPgs0nEMn9exSNsr3srR8dgsXFZjt/Pi+L0BXtzJMcM4I09mkMvt/fMg==@linaro.org
X-Google-Smtp-Source: AGHT+IFpVHf1En1GG2DbGL3YBoMIYOcvu8hgU6KOeRkRf1EHUw2P5in8Fqa2KNUSKLqDTksEuKii
X-Received: by 2002:a05:6122:8293:b0:520:9b05:4cb6 with SMTP id 71dfb90a1353d-5235a8ee2e6mr2699546e0c.0.1740759902547;
        Fri, 28 Feb 2025 08:25:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740759902; cv=none;
        d=google.com; s=arc-20240605;
        b=UfwaXtyUCU6j55wvNM2hqxmidKSk9YQOm8Z7glG4dqSn1/bkZICJl/lez8Jh5e4ZkT
         9BVqZMhrZjtSYP7Qn23oDjFvwz8fA+jiIQCpQiMUvzclN20JsRFFpUueeqdeI7PloWXi
         shXG1KO1UzAUYx7Qxzvqn/TKd9bufFQ9fGN39e0pFtFgIQ0iCWoylYVYOJoRbXuthVAZ
         JWAWijXHdwUveQzvYQtEz5XnzS+Og+OQF/6Ze08pk9u25EebqsNyOU2ubTLYM2c5TipO
         dWMi/AWmuu53tAEyzOCzQqBNYYSDqVWrEuB3QK2pNtPCbeP4vcbYU3ay0lkkTTUOB3m3
         XOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=hv5zzt4u5f4vowmmRU23adl9qYXTG9rnBzhDNQshj7Y=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=D0C/DnAl5FRiTol8/k7JNogyBLzQeM++kspULvU/aqLIGerX7YUVvWKlZLGqTCZWc6
         PJXZ9r9uY3GlmRUA7x48dhsUJoZQ0P8+ZAeiMRTmTG8+P0IlwMLSCSNRh6B7C/XcVWRv
         V9571uNRSyIx2pXYeOnxidSHhi5i7+TzXkwU8ncfgJNM+WM69pPoXIrtN8wjMPGlNARz
         VmwOZxbcw5wFjUaQRtuaNnz+XhXbdnSxcPgF9akwO0vXa5HUkQiw6VwrJaunnWya73F/
         IO0Oy5bWfitlOQyaLMJuj2+OD5qjj/6pIOEs5NvHgbuM1QqcntkF/6N6aRd2tz17b3Ow
         ixDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t6TN8gg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5234c030420si1017593e0c.198.2025.02.28.08.25.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 08:25:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t6TN8gg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1to3AD-0001Xn-OH; Fri, 28 Feb 2025 11:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to3AA-0001VN-A4
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 11:24:34 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1to3A6-0002W1-L8
 for qemu-arm@nongnu.org; Fri, 28 Feb 2025 11:24:33 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4399deda4bfso15796905e9.0
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2025 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740759868; x=1741364668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=hv5zzt4u5f4vowmmRU23adl9qYXTG9rnBzhDNQshj7Y=;
 b=t6TN8gg9oGezx94XbIyX6WkQnPZgrF9Yc2ttBzCcIv62VHvTF3HO+3iJqUGshY/bNh
 Kn4VdZVHSU+BF6B+qnm8iTsM7WS9ShNOil0ofPeuDTgm4aF5fDLnuohwshpcUlXZ8Wew
 ystdZGEJ5sPIetX8HDihLa+jdeS023WLc0H7UeTjkjKcHw2OY5aHU1Dj953Ol6JkgiTx
 Qr6zzG+UPm1LhGzZfvG48JseczN3B1jYEAhN1Jzbn1aAYg5UmEBlvCDYec6fTF/0LPS0
 +E26L5GKR2RyZcjm3ZRIsmMb4NlDNxX5KjeuZqCRxp7dj2eB1oSxVgjDPBzddOzOXSME
 edhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740759868; x=1741364668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hv5zzt4u5f4vowmmRU23adl9qYXTG9rnBzhDNQshj7Y=;
 b=VmuuP1ow8I4ikJ0KUP6IGIDEOCRgSiR+qY4mOI3Mvc09pmPBdB/4VVWRo+TGtINebT
 g3QjwEdrG1ElhN5gC1cIkkHKuYpfUiJXUoMbL0ucX3B1IGYZx5vqikwHTl6jJzFj8b7o
 jYHBnWNXh9KI4BMn6jHdbjfrMgHXTI3Utor0Px2J4+2/84GSxnk2bzTHotJqc3N3uGXj
 vf6IoieA7oyxyb49KU6Uf3aheyaDkZMKCdyYHSwvmYJ1exeBg27tVzLlkey8aarckMk0
 BhhdwIYGNcmcppbZa+5jqiCEb0j1LOcL6KgfJKedVXGhRsIUlkhrIFGNh0nFe6rKnu1/
 +A9g==
X-Gm-Message-State: AOJu0YzIecPyR1mlorq07j4XDKIFMYkxcOximifTjIZAPsN08FdODjey
 pOr1bNkPyyIph9H1teJvYLVgP7GMl3uVcWXzfhb5MUW8QAJwv4VxGuJuCpatg/IFQPJ/s9nOa9r
 Y
X-Gm-Gg: ASbGnctf4lRaFQVZCrRxX3k0EHp/5ZqdKiBkzHzPsN12jyAPd8+7JxF7IjwJzymyhlH
 31TMXToW6RD4ic8BlJiLDjorInP9HPg2rmIjnmqG2B6OmpGn5bhcqTl726gtiDzLORCpuuQZXFI
 GwNq21kEcXQyRjYGW+v3XsVg+oAlcZo6+kHbxDj/Pgw+5y0EwwLEOAa39ara37Dbefq3Cg5U1s8
 VLR+4iKgexbiwLNdlJ2Y9HaqS4HeiqsmkNEbOqh0S4+baqzm8a/ffCQE+REBN0r5fcLqCof0z5q
 Zx6Y/b3l7Kj9a37sCoxWhMB0b4pEfY2A
X-Received: by 2002:a05:600c:3ba5:b0:439:942c:c1b5 with SMTP id
 5b1f17b1804b1-43ba66e6fdamr38823255e9.11.1740759866781; 
 Fri, 28 Feb 2025 08:24:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b73704228sm63460415e9.15.2025.02.28.08.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 08:24:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Make dummy debug registers RAZ, not NOP
Date: Fri, 28 Feb 2025 16:24:24 +0000
Message-ID: <20250228162424.1917269-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: eUsauYZSVQL+

In debug_helper.c we provide a few dummy versions of
debug registers:
 * DBGVCR (AArch32 only): enable bits for vector-catch
   debug events
 * MDCCINT_EL1: interrupt enable bits for the DCC
   debug communications channel
 * DBGVCR32_EL2: the AArch64 accessor for the state in
   DBGVCR

We implemented these only to stop Linux crashing on startup,
but we chose to implement them as ARM_CP_NOP. This worked
for Linux where it only cares about trying to write to these
registers, but is very confusing behaviour for anything that
wants to read the registers (perhaps for context state switches),
because the destination register will be left with whatever
random value it happened to have before the read.

Model these registers instead as RAZ.

Fixes: 5e8b12ffbb8c68 ("target-arm: Implement minimal DBGVCR, OSDLR_EL1, MDCCSR_EL0")
Fixes: 5dbdc4342f479d ("target-arm: Implement dummy MDCCINT_EL1")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2708
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is a very old bug (a decade old or so), and Linux doesn't
hit it, so I didn't think it was worth adding a cc:stable; though
it's not a very risky patch so there's no particular problem
with backporting it either.

 target/arm/debug_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 36bffde74e9..a9a619ba6b1 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -1037,7 +1037,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "DBGVCR",
       .cp = 14, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tda,
-      .type = ARM_CP_NOP },
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * Dummy MDCCINT_EL1, since we don't implement the Debug Communications
      * Channel but Linux may try to access this register. The 32-bit
@@ -1046,7 +1046,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "MDCCINT_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tdcc,
-      .type = ARM_CP_NOP },
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * Dummy DBGCLAIM registers.
      * "The architecture does not define any functionality for the CLAIM tag bits.",
@@ -1075,7 +1075,8 @@ static const ARMCPRegInfo debug_aa32_el1_reginfo[] = {
     { .name = "DBGVCR32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 2, .opc1 = 4, .crn = 0, .crm = 7, .opc2 = 0,
       .access = PL2_RW, .accessfn = access_dbgvcr32,
-      .type = ARM_CP_NOP | ARM_CP_EL3_NO_EL2_KEEP },
+      .type = ARM_CP_CONST | ARM_CP_EL3_NO_EL2_KEEP,
+      .resetvalue = 0 },
 };
 
 static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
-- 
2.43.0

