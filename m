Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B77FCA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:52:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0ldP-0006ZH-MO; Mon, 22 Sep 2025 14:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lcM-0005IL-ES
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:39 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lc3-0004SZ-OG
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:30 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-77f41086c11so1129599b3a.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567009; x=1759171809; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uYZVHQlk4d6HnzzfYjRHoTWH8habiT3aFxflfmcItEk=;
 b=rbCrY69zejy/6oHU0Gw/Ugz25+YC2rav6oYt4ytD3V6n6EPKHXz1q+clLJlDIjH+5e
 ryzepMyFrq3jhJN9Scm6//p1x50XSON9G3mnP8GELfAZzjrzuKN5cw5hvp2nnOaywo5a
 mJcMSys25urYyvVlMRSNEwfZ0I0Fu+KvRQgTZnBHdQiFqaN4ug/mFuWgxY48bsiEPOG2
 04tXhmLbvbXs892ZlQdLfcr5vUeNe4qC37k2n+se1dKSM0hXSti9IaHqeT95u6toXEn+
 vMYCKpeA61aZ+mcmdCh945wD3fCx03I4yXnFCalE0cE1QB7K0TTlj9LW1m0Q7aV2DqxB
 aHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567009; x=1759171809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uYZVHQlk4d6HnzzfYjRHoTWH8habiT3aFxflfmcItEk=;
 b=Yvm+bVyCNxR4M2OmPSh5MP5NnYjw07igz5U3JiK5GUCxe6Si3yvNilFdEoI+EwWJN8
 eqkspxwJmLfsUEUBiwZtPFrm4yXQHOP5K+6WOucAuWddX3J13RQa141oUHu9EDocw3af
 ejW+y71XeasgO9O9ZJBFTMS1ola1RbwDfCcoK8XsCzlkE+PRJF3Nhcxj1rIlJFxhUWoU
 BzxXL9uIkEhUgUJCSokaFQLD6l0zcpE5/2oyeNp/SrHWTQrMbEHQany697AROlY2/z2h
 swr8GunqCABZSeJYwgRWd1QpK9W8NQCVXJPCY9tdhX6tsj2SS6KrB9G8cb9e1cwnKCuS
 T6qg==
X-Gm-Message-State: AOJu0YyEtE138HhtpagzKYBQVXKME6eyQ9zTHU5hpmYpQUsjbFA8raSo
 YykiDy/1Ebh02gILSCT2MXsTVSyLQqzIBnCwTcg0X+b5FqKnGvibbA/pJ0h4FfTUDFM=
X-Gm-Gg: ASbGnctgOFUtVVMZv8+Jy4kF6AHBDZalPwJTpSTXzaS6Vy1B9e8FybQURjzgYp00IGf
 +e5f7Utm8XU7iTeajWCdVpAZbtJ3eaYABj7tAIiaSA+f5hnAIFO5ICgiHNYteIfRnPNOMZfVzwk
 /1HMM3Jar+IHTH3w/nuR1a62MZU9Z7M/tRxymD33o+6D2fP8aYObZFXHFEKmUrHo+uOuA6UrXNK
 y/dZWiLnLIOm0UW3S6+OIvoH/VtI7qRdrcO91Vo6O42QOp1P//sPFcrNNJQpVOtBskLgH25/YHm
 u8FTPj08vh68oA2xe9f05FfWQtOU2Avnd9NbjNjaf77MKq/T/r7wywK6ECCullJ49FJziuLBcAK
 f8bjpajuD9tjqvJRy8cqHFrqenu92
X-Google-Smtp-Source: AGHT+IHeCYVE2fKIw3lDFjoSLtDVbfyu3rBP9/LY5YhAbRcsSgiBt51+kURs+rCZKMcgL3qscD3K+w==
X-Received: by 2002:a05:6a00:2190:b0:77d:52a1:ac6e with SMTP id
 d2e1a72fcca58-77e4eac6e2fmr16200123b3a.19.1758567008874; 
 Mon, 22 Sep 2025 11:50:08 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:50:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 36/76] target/arm: Implement FEAT_CHK
Date: Mon, 22 Sep 2025 11:48:44 -0700
Message-ID: <20250922184924.2754205-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
index d5c41fbb3a..9dfcf4f993 100644
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
index 94a6192fa9..4b07af9eac 100644
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
index 55ff6c504f..8283a9c83d 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -256,6 +256,7 @@ ERETA           1101011 0100 11111 00001 m:1 11111 11111 &reta  # ERETAA, ERETAB
     AUTIASP     1101 0101 0000 0011 0010 0011 101 11111
     AUTIBZ      1101 0101 0000 0011 0010 0011 110 11111
     AUTIBSP     1101 0101 0000 0011 0010 0011 111 11111
+    CHKFEAT     1101 0101 0000 0011 0010 0101 000 11111
   ]
   # The canonical NOP has CRm == op2 == 0, but all of the space
   # that isn't specifically allocated to an instruction must NOP
-- 
2.43.0


