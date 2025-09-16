Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E278CAC599
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:30:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWcQ-0007bL-I0; Tue, 16 Sep 2025 10:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWam-0006BG-VN
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:37 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaU-0008Jr-Gi
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:31 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b523fb676efso3968436a12.3
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032570; x=1758637370; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m0hu6kiQPPC+ffTUWEZf+Bo8Uxcdw7g9TE3KnE/8zz0=;
 b=tmXmaIlmmGC8OpSbzG42wafZ8d+IhQfDJ+ykkdKswNEixxTElEbp+9F5f4VXaUnWLw
 goaacKktpwMT8Y2yZvOlrD8TsH8bRhUBCXR4NRYXpnx0uKFJ+sGLGLVLLXR4qBqBUHC/
 7YL9rLCz2HUM66jcxHLN70SvD5AtUmDsvlNRRO6oO/fVLHdlI+YvtHK4NzTRf3J8RMXs
 3Hy4jQpFA6c5mCWjx24zD8Rk+oukprnOAEGAvt16Dr+QF2TUPtTDXknf9v1oHfalKmTZ
 lG01kt8FdYDt9g2dLz3iseLytxKcF7i/5VkefEbVDsSVx4bhk4ztqTdn53npQqC9qRSa
 xiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032570; x=1758637370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0hu6kiQPPC+ffTUWEZf+Bo8Uxcdw7g9TE3KnE/8zz0=;
 b=hl0y5PN5IJnuZyQCKGyRUHujYvaf5pz2382RE5G/U356SaW8BmM6M0Lcpu3baMenny
 m++BdAUlV6ljq5lwdyX6cfReNTlsnm6rnYqPZz71mDEs6aHuFDizE+gEkmvkL2r5QSOX
 Vk5+mDKYiVZQ9n9Ujv49VE2bU2wWFEoIdP2HhJROaaptLiWzSlG/Md+k6r3oA4MkSK0U
 To1ZpYGpePUVo7EtdfrU1n5/3Mj9tszq70f4hpwKk56blBMtw0Si8dgO5quTOnm4SfAX
 bY1TfX20KGZI+ww3lbksU4vB66dgYJ59vbO/cOhxsEduvGYaVTsnzIhi4KH/SE+rmPho
 O12w==
X-Gm-Message-State: AOJu0YxPTZ/2RQnojXoviLYVIsvXPRUiZE93KOpZ3NoaRaU/Gdp0yn1S
 J84D9TC/heLnxxeDdjgWVx0G7LQQWXaeJY7wMIqOf8fPzSHYyc6qvi//UiLAtLJpU64=
X-Gm-Gg: ASbGncu4SUl4sODdDxb3HXfm9ERz9oeI/iv2Gx/cRhUii6oXT9SIqvFj+HnJXp2VwvP
 mVDa4QzuQlp7EUSCbEHIddagAyaBSSGRxmiDajy2g7r6KWgkQ+Q4qE5Fz51HPYUZSaPrLHqv9A7
 L0WYtfRiBvd9Yoh85Gm2W1zEA/RE3kZg4Gy40ZHic4RuD4jn+KCOowwxgHRNkoLuG5TDQwf7bQ3
 U5JK0K1jOvmgeCpp1EPIbkJklsSpTqDdL3nPllZUjkxy2hzFgaPyICkrz6BGsTR3MnwGry+DFOo
 llGmgdHA55kFFHCk4gKVsw5VXmFzDcJamZsmULHvDwSaIbLYLOs9xPHfwCE4dv0UWE7ERVPEcIY
 ycQHXGrC93zxztqA12HFYuTk8Uxrn
X-Google-Smtp-Source: AGHT+IHrUDacm34/r32qETHk9yafX3YeEVYMMhHMw1ZHAmd7Q0wYtcY8QmXnQA1MnUUVE4sDSCGtIw==
X-Received: by 2002:a17:902:cec6:b0:266:88ae:be6d with SMTP id
 d9443c01a7336-26688aec242mr94409275ad.6.1758032570229; 
 Tue, 16 Sep 2025 07:22:50 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:22:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 13/36] target/arm: Restrict the scope of CPREG_FIELD32,
 CPREG_FIELD64
Date: Tue, 16 Sep 2025 07:22:14 -0700
Message-ID: <20250916142238.664316-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h |  9 ---------
 target/arm/helper.c | 12 ++++++++++++
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index b610716c24..812fb1340a 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -991,15 +991,6 @@ struct ARMCPRegInfo {
     CPAccessFn *orig_accessfn;
 };
 
-/*
- * Macros which are lvalues for the field in CPUARMState for the
- * ARMCPRegInfo *ri.
- */
-#define CPREG_FIELD32(env, ri) \
-    (*(uint32_t *)((char *)(env) + (ri)->fieldoffset))
-#define CPREG_FIELD64(env, ri) \
-    (*(uint64_t *)((char *)(env) + (ri)->fieldoffset))
-
 void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *regs);
 void define_arm_cp_regs_len(ARMCPU *cpu, const ARMCPRegInfo *regs, size_t len);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5bc8fb23cc..b310f52724 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -51,6 +51,15 @@ int compare_u64(const void *a, const void *b)
     return 0;
 }
 
+/*
+ * Macros which are lvalues for the field in CPUARMState for the
+ * ARMCPRegInfo *ri.
+ */
+#define CPREG_FIELD32(env, ri) \
+    (*(uint32_t *)((char *)(env) + (ri)->fieldoffset))
+#define CPREG_FIELD64(env, ri) \
+    (*(uint64_t *)((char *)(env) + (ri)->fieldoffset))
+
 uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     assert(ri->fieldoffset);
@@ -71,6 +80,9 @@ void raw_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     }
 }
 
+#undef CPREG_FIELD32
+#undef CPREG_FIELD64
+
 static void *raw_ptr(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     return (char *)env + ri->fieldoffset;
-- 
2.43.0


