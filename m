Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E77DC531D0
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 03:06:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn6F0-0003lF-A7; Thu, 23 Jul 2026 23:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Ex-0003jR-7n
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:06:23 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wn6Ev-00084Q-BL
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 23:06:22 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-38e3efab7e0so942118a91.0
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 20:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784862380; x=1785467180; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bwPG9t04ibTJDps/kXXr2hpINI5O+Pu2KZP9VOuyAAc=;
 b=fuVjNYkYzXI0C3wYcr5/UWuNKlBz4++txOOXznhf5N4BD9gtzJI8yVp6hiibw9BekL
 T0kHfEeGNABjdaXTC0agKe/mwz6ExlexzKpGzniSA4SQitXnbzc2OlWjlyp8cKObe58W
 eJW5XELdU0SRlR31MnEt0z8dUIfYioDVuuQTV1jhoXRvhZ0K3fqn7zi1W+slmclxXJ8G
 xvkwuYfQyyldstg8kXaGYPIL7ipRsM2bynC6USHT4fAuDR1b5Rg8UJPP4vieTbY60X7M
 1oJ8C2ILNWzgN8dz+naCnZLBUM549ek21OOtVTDSFvHmEXe3xTRZYKcTiVc6zt78+FPG
 Cu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784862380; x=1785467180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bwPG9t04ibTJDps/kXXr2hpINI5O+Pu2KZP9VOuyAAc=;
 b=E1beyHD67J8GvQ+yJ46DX0Wyolua0pQCMTfEQbw3KmssTIV6lhRcT6oHAasB1dexOh
 /GcaY0c2YcaDv2C8hBVo8yHpVTaekrVDFiq/wED4lKagwhlb+p/0fKbSF4NAPKDwIzCg
 U4O+fnE36h+SYOREkE2F6VW45Gt/jjQSfeAX14i0N1cv8ZBIXvS+8w2jJJQltArehIL8
 IGV2xqhYl7dRUsrlVcOcWEKZ4vwioukrArMKxbqK8Q283XRjleuwDk6Ze4FLbmMrj70A
 QF+/vg0E8LePmx8ndkAC+g8MgE5hG/57De4nK7RbGptD/HKgJxywAQwRge8UVScJVHJF
 3XuQ==
X-Gm-Message-State: AOJu0YznAKBBIcr1niTwZZipDd7luGA/yQrChdxedHWCdhtZHQaeg7bn
 KrxLW9Mt8VyxRjRJlWSfjS1b250lmJY6qPLqnwGnMvjfunzy5k/J6DHkwkc3uUnC66k=
X-Gm-Gg: AR+sD13vvAfLRHML/7oTBOw3xHYandk7kQpezS0R85wlwDuI9QBsJItmb1mnJ7VxWyL
 /re+7RRsx6h18Cl4lXnzHLl3YjHOx77zhvJX27iWU9XOgKBK81Gl7T7RxSGHdWHRyns56uTEm5y
 HIIciC4pai79YOwNo0ek5m1kfk3RLv9KD1z4uVAt8vPALwO5mmW8OlqLX2DrffwvE0e1/Uniaeh
 UsZXbABBiCEmo+znFkSvR475FFknF2htRPD/zmlhl/C62lKVkDRo46aAvndkufd5lxUlzCMWuFn
 rZkM3Ppt+ZdHv6Mc6DIE+l2Lijy7a1mCOk74jVwkqAUj4uEoMLew3z56oFmaQvaZSBmcCrxM8XK
 mX335jawpg/pX/Hpnkq6AC8GGEiosWWfvt0X+XobUy+Zg9+22sfXd47H0kCdcI4iIFmF635KhIu
 GlIftG/VoYH1L1kMdJEz/hIPtH4RGEsgDB5g==
X-Received: by 2002:a17:90b:3804:b0:386:ca4b:16a9 with SMTP id
 98e67ed59e1d1-38ec8494be6mr4219775a91.16.1784862380010; 
 Thu, 23 Jul 2026 20:06:20 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03ad0e0csm750777a91.7.2026.07.23.20.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 20:06:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 3/6] target/arm: Add FGWTE3 FGT bit definitions
Date: Thu, 23 Jul 2026 20:06:13 -0700
Message-ID: <20260724030616.76180-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724030616.76180-1-richard.henderson@linaro.org>
References: <20260724030616.76180-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


