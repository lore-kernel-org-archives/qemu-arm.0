Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6652CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:11:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXdC-0002a7-C2; Thu, 14 Aug 2025 09:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXcg-00025p-AV
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:04 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXca-00057K-Gq
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:02 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-76e2ea79219so1116728b3a.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176628; x=1755781428; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=17nAzkO3yEHAvK6PxJmaLfoSw+fDYNwVzEXoZ0CbSlE=;
 b=stKtHv4j14UsOj6/Uq52DqvklYuSfkVHzE9oIYq4QbQA4doZH4Flxxbg4NQbODtiPR
 RPCdDpTfB/F3PFoucdt6HkfEIUSlxd6RPLeCUfro1982Ezzfw8z2AiaUWntTCqCCEET1
 8VuxlU6gCzT6TdXzc7JLhKs4iGulTpev19kTfj46zU0hhqlaSgH+gjJ2wmc2poOBMws7
 E+1k8nb/N+eD0UUfP1mR6cZOQhweU52J/UEvHNV2e42exeH5x7pE/kFYaTdB+wiZuwYH
 QKy05Ux4ZKjkiJ4gyEcXLuITsLpeAnFK2OLeKiC3/YjS57EUgIFox3DlmMr+ZDYeb27G
 OQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176628; x=1755781428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17nAzkO3yEHAvK6PxJmaLfoSw+fDYNwVzEXoZ0CbSlE=;
 b=pJiMvBXLrO84v5IuIOlHjsFEux8/i2O8j0VNKXFZ8+G8oYBhAgro4ixessdBt0yNoq
 ijkteBRGVZuMtgdCNoysKfkYd0wrg9UFwuijFVoJfyZ6jZjHK5PE72+pYO/Vx6db+5FH
 uYcwszCtjvF8H9FRekInM3tpSYnz7zamVUuTQzYBugKInPUseiM5WDyqPT6rFl5kJbah
 zJLSLXrwZcpnPwPgcsCQZVEXcR5VtWm+3uw0JSyn7atJ9cIttGmtJ8gRofSHOa3WDcln
 DZjzZUjVNlBoCJo//ybse7WELMZSCHO19q6RfuqyQFZPJ3CIfQXHLZY4XW96Tyfq3IG2
 pCug==
X-Gm-Message-State: AOJu0YwC6vJnTEwpaMRMID2aaIQfNHW98Yj9bXBTkp5VJcFeTX8hqj6I
 6tEPSQdYLkE5psSYstW9mC7KHYYDYbbqNZb+P0OY626aPvEeNMibAGiGOIoL/b3oN/c=
X-Gm-Gg: ASbGncsFRbfBbdismwZA/J2taaDqHbNBWBLxBDsqvcL8Aapd2m7BLaG/l7+gPUDl+GC
 mMa6FVV5UJKS/60WYeiCqnWud6qjtQPFBlhVPLPMAb/wFc0UmMNuRWNTnPasFYmdyF5iZIWf1SW
 2cPfPYVteNOfcaHFepuHnvLDKOPGBjG/RUDRfJm4hHTUcvv15H8BJsmJUumru0zqFz5xAIpqnmh
 +Buf0J8yIT1ygODQFQlQtCCU+x0bHjLia8TXJrL76lT9uVnrkIkrlcIz8gOw9jMrBrz2yjJws15
 1xkItONxykCThwMwAt2qS18W0AaJ6Jk90FJgmr5w4s2bAm5B36GHnDORNRLQBbGEqnam/Xf3yLn
 jU914mCeaVzcKfuJseeS5dXKu6QNd4m/avPezPm5sgYCYJq8=
X-Google-Smtp-Source: AGHT+IEKMCY41tVjXnLGo5opjsqBfcU55L8MLOLvEE40XxwRC0FAIae+MuZJvCBDQZcNcGZScikipg==
X-Received: by 2002:a05:6a00:9a7:b0:749:472:d3a7 with SMTP id
 d2e1a72fcca58-76e2fd6fa9bmr4595414b3a.18.1755176628021; 
 Thu, 14 Aug 2025 06:03:48 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:03:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 49/85] target/arm: Implement FEAT_CHK
Date: Thu, 14 Aug 2025 22:57:16 +1000
Message-ID: <20250814125752.164107-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This feature contains only the CHKFEAT instruction.  It has
no ID enable, being back-allocated into the hint nop space.

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 14 ++++++++++++++
 docs/system/arm/emulation.rst  |  1 +
 target/arm/tcg/a64.decode      |  1 +
 3 files changed, 16 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 7831b3dab3..34d22cac8a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2124,6 +2124,20 @@ static bool trans_AUTIBSP(DisasContext *s, arg_AUTIBSP *a)
     return true;
 }
 
+static bool trans_CHKFEAT(DisasContext *s, arg_CHKFEAT *a)
+{
+    uint64_t feat_en = 0;
+
+    if (s->gcs_en) {
+        feat_en |= 1 << 0;
+    }
+    if (feat_en) {
+        TCGv_i64 x16 = cpu_reg(s, 16);
+        tcg_gen_andi_i64(x16, x16, ~feat_en);
+    }
+    return true;
+}
+
 static bool trans_CLREX(DisasContext *s, arg_CLREX *a)
 {
     tcg_gen_movi_i64(cpu_exclusive_addr, -1);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 6ebf9c9ce9..b894aced89 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -28,6 +28,7 @@ the following architecture extensions:
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
 - FEAT_CCIDX (Extended cache index)
+- FEAT_CHK (Check Feature Status)
 - FEAT_CMOW (Control for cache maintenance permission)
 - FEAT_CRC32 (CRC32 instructions)
 - FEAT_Crypto (Cryptographic Extension)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 8c798cde2b..4315ed8dab 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -246,6 +246,7 @@ ERETA           1101011 0100 11111 00001 m:1 11111 11111 &reta  # ERETAA, ERETAB
     AUTIASP     1101 0101 0000 0011 0010 0011 101 11111
     AUTIBZ      1101 0101 0000 0011 0010 0011 110 11111
     AUTIBSP     1101 0101 0000 0011 0010 0011 111 11111
+    CHKFEAT     1101 0101 0000 0011 0010 0101 000 11111
   ]
   # The canonical NOP has CRm == op2 == 0, but all of the space
   # that isn't specifically allocated to an instruction must NOP
-- 
2.43.0


