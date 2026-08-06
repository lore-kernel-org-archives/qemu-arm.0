Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9606C5AC7C
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:27:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws1sL-0001YN-RE; Thu, 06 Aug 2026 13:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1sF-0001UV-Hf
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:19 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1sC-0000d0-8N
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:17 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-8485ef63b68so3577385b3a.1
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786037235; x=1786642035; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0wHYbbkdOoFYbdpgMj/qbIRNrnm0zPtM0VP+Mji/HqQ=;
 b=oyBCmCleHs9Ol2U/jeeP/iWTVZ0JjqrQdu6bCxQKfuO3fPzYvROFGJAytkFwinRV/0
 sSY6mAKGhpfNi6qUlsNhT7Ks9ZuM/b4yZDFVvlVY5eq3hk8o8LBcYcRek/pifUyUzDOR
 nB5H4mBq2V7mz5CZWEEUbUanEBFnJ6so/RvYYObABl29Ew62i28/ydIIElL+IOene0Gl
 TNywN2PwSb4IF3BFisCM/mchmNMJ2ZiMBrXVWbAoBfCQIERmrmoxxs/esoE3T1FUIo0v
 7Wt8Zr43W47Tyau7xYcrpoVuFqo2M2sx/tLXYgLVp68gfk3DLrReeDgYkwiAc5QF9LlM
 7HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037235; x=1786642035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0wHYbbkdOoFYbdpgMj/qbIRNrnm0zPtM0VP+Mji/HqQ=;
 b=s8KSurxH3GvHuAsmkmDFJm7dba9B9M8pP6FJS1MVbV3CBteZoD3bigLUclMnrbgTq9
 ag+TrP3jeZZ38/MjKRzWGWm38A1TVaSZea2B29s8PMFK1y5mcJ9nyrZITfwvtMB6ANsn
 qqxHfvDZcALWYBLiknWT0pJ/oBwXEnAD04jMi6teSk64WE4OpOGhClZb5NdMMzg7m9OG
 c4bFZ3A1LULuAgXEgRxLG+ICWpJNnnfIGbQF3u5W4Ue1B/g1i3pzxrrc1fHo0T4jxYlM
 t609lmblaUkByGdBF14ZqWziGD1fEjzwy4n/0y9CqWW3cjAMcZnMVcmnDAgorLZmvu0g
 q0LQ==
X-Gm-Message-State: AOJu0YxwSoWbkFl0MZaNAxLwZVlMZXIW0PsZRwR8a849+lsDbZZdNSB1
 g9BsPOoSuR0N+8SftZjSUwHFcQGipu22YEK+Z0ESydWLBmOJBATwE8eK0lzrfOfAI3E=
X-Gm-Gg: AR+sD12vSkR8hjFXZBdpZgRnpzEGQ9juHWUdvWggNR9K8rv4I5rUyyx0H+mteKn0sc3
 T/EoksRFVFdslSSqsbmkhIrGrTA28iPTNvdgWsTKLFcksaDuCRZRbtskj4ZX9NIcGraMSXINNNA
 j8BOZMAX3xbCNISkWtMxZ7Nqk5z1AXZsMJngExM87jbnuqw3IWb4F1jj4vGTTetDc7J8IdtwRaa
 W9DnO9j5lBP5wuU+zHyroB8jTz7sd2VhNzJ3qx+GQgTw8LkW7wJYLBSrkefBvoxEquK48RqPCRh
 1T9FhXLRbpxVT7TUiYstZHG+lpNKpNdENiZZiLuPYi7UHdgU8fS4AJEpTaWHMvrPpKqlaSEz8ih
 H8QwHWgJubucGxCUFebJeByuUjq6eEQwz2eT4yTKNMBuh1sjx3TGQgOok3m9iGEoQH+tTM1lf4R
 o7xhu8VGMBb5u6cBXZpV3cgFLkw52U/DiTGYU5SxtHoYyIx8hFDzNGM/+j4EsZYXJ8Hzugg0f3w
 Ti6+IDNdVTafjHJt5hW
X-Received: by 2002:a05:6a00:4288:b0:847:83bc:d2a4 with SMTP id
 d2e1a72fcca58-84f2dfc8c42mr19799997b3a.2.1786037234552; 
 Thu, 06 Aug 2026 10:27:14 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84f45389e68sm1803272b3a.4.2026.08.06.10.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 10:27:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/6] target/arm: Add FGWTE3 FGT bit definitions
Date: Thu,  6 Aug 2026 10:27:06 -0700
Message-ID: <20260806172709.333300-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806172709.333300-1-richard.henderson@linaro.org>
References: <20260806172709.333300-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 2c9927b1d9..9f2532fe66 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -728,6 +728,9 @@ FIELD(FGT, BITPOS, 0, 6) /* Bit position within the uint64_t */
 #define DO_BIT(REG, BITNAME)                                    \
     FGT_##BITNAME = FGT_##REG | R_##REG##_EL2_##BITNAME##_SHIFT
 
+#define DO_EL3_BIT(REG, BITNAME)                                \
+    FGT_##BITNAME = FGT_##REG | R_##REG##_EL3_##BITNAME##_SHIFT
+
 /* Some bits have reversed sense, so 0 means trap and 1 means not */
 #define DO_REV_BIT(REG, BITNAME)                                        \
     FGT_##BITNAME = FGT_##REG | FGT_REV | R_##REG##_EL2_##BITNAME##_SHIFT
@@ -787,6 +790,7 @@ typedef enum FGTBit {
     FGT_HDFGRTR = FGT_RW | (FGTREG_HDFGRTR << R_FGT_IDX_SHIFT),
     FGT_HDFGWTR = FGT_W | (FGTREG_HDFGWTR << R_FGT_IDX_SHIFT),
     FGT_HFGITR = FGT_EXEC | (FGTREG_HFGITR << R_FGT_IDX_SHIFT),
+    FGT_FGWTE3 = FGT_W | (FGTREG_FGWTE3 << R_FGT_IDX_SHIFT),
 
     /* Trap bits in HFGRTR_EL2 / HFGWTR_EL2, starting from bit 0. */
     DO_BIT(HFGRTR, AFSR0_EL1),
@@ -919,10 +923,37 @@ typedef enum FGTBit {
     DO_REV_BIT(HFGITR, NGCSPUSHM_EL1),
     DO_REV_BIT(HFGITR, NGCSEPP),
     DO_BIT(HFGITR, ATS1E1A),
+
+    /* Trap bits in FGWTE3_EL3, starting from bit 0 */
+    DO_EL3_BIT(FGWTE3, ACTLR_EL3),
+    DO_EL3_BIT(FGWTE3, AFSR0_EL3),
+    DO_EL3_BIT(FGWTE3, AFSR1_EL3),
+    DO_EL3_BIT(FGWTE3, AMAIR_EL3),
+    DO_EL3_BIT(FGWTE3, AMAIR2_EL3),
+    DO_EL3_BIT(FGWTE3, GCSCR_EL3),
+    DO_EL3_BIT(FGWTE3, GCSPR_EL3),
+    DO_EL3_BIT(FGWTE3, GPCCR_EL3),
+    DO_EL3_BIT(FGWTE3, GPTBR_EL3),
+    DO_EL3_BIT(FGWTE3, MAIR_EL3),
+    DO_EL3_BIT(FGWTE3, MAIR2_EL3),
+    DO_EL3_BIT(FGWTE3, MDCR_EL3),
+    DO_EL3_BIT(FGWTE3, MECID_RL_A_EL3),
+    DO_EL3_BIT(FGWTE3, MPAM3_EL3),
+    DO_EL3_BIT(FGWTE3, PIR_EL3),
+    DO_EL3_BIT(FGWTE3, SCTLR_EL3),
+    DO_EL3_BIT(FGWTE3, SCTLR2_EL3),
+    DO_EL3_BIT(FGWTE3, SPMROOTCR_EL3),
+    DO_EL3_BIT(FGWTE3, TCR_EL3),
+    DO_EL3_BIT(FGWTE3, TPIDR_EL3),
+    DO_EL3_BIT(FGWTE3, TTBR0_EL3),
+    DO_EL3_BIT(FGWTE3, VBAR_EL3),
+    DO_EL3_BIT(FGWTE3, GPCBW_EL3),
 } FGTBit;
 
 #undef DO_BIT
+#undef DO_EL3_BIT
 #undef DO_REV_BIT
+#undef DO_TLBINXS_BIT
 
 typedef struct ARMCPRegInfo ARMCPRegInfo;
 
-- 
2.43.0


