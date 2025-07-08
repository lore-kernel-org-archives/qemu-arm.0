Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45228C83F0F
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:13:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFEb-0006i3-9i; Tue, 08 Jul 2025 16:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZDqm-000765-UL
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:19:38 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZDqi-0008AO-LO
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:19:30 -0400
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7d0a2220fb0so665958785a.3
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002364; x=1752607164; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5B4J7cwfIkU9OopnPqIRveaXurIgb8F7x1j5VTGinLY=;
 b=QiolgQ9VtpYtrfn41T0oLyZ9kOizVx1NsFhSM+tTifSNZFdzrQpRse32MEGkX6I2/3
 VP6QdkDnxPck2dPdS6S72aVr8T+xOnZlhbAEjrjv1yqy8O/Slcjr+o2e6f3Cikg+enjF
 ycQXdW8HPMuDcUuY2ptuRz4XZ+zqrKubxStQ7SOl8y4ymlcbb+5X9PK19l0A89W9ux8y
 fP1jDdvVYEbwvSryjzy6QHjWLmw+BhU2ZLDJlBhB0zi4lL+LfMFlW4vSA/0//3IacHfY
 iyuZ/dOVAXMqS6WaWn0hegHJd8kOofcnB8EvaBVdG2uidVpzEc/NI119330Iqk6hXr1k
 lX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002364; x=1752607164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5B4J7cwfIkU9OopnPqIRveaXurIgb8F7x1j5VTGinLY=;
 b=SkHyF6oV/lrx9opA23Ovv3QH4wbuNfumPCV94aYPaJ2hNRDVccqx7RJl/XifISyrcU
 WZAiCF4Q6w4SkRdgLJbLjUNu1/zOG9ksSDyMNNka7B9xnSKqicDm4CTIycmZEk3qLlQU
 42KNnbXi98sNrkKeLMt7X9q/rFa90LGv7zE335gP3jwEmVhvcHhOo8d2IjFuZ//DZrVL
 RQy/gio6j1LgKBicOlbICU++rGOXhaQT5ntTq3Hiq8siE2RDFgiqK4YQwJFBVaV5nizP
 ZfamsumD2OLlG2LyQ8KHiK5ypKPJXrxLOXsEKCo+6+Aztl8BpHYEegNhN8ZDOmL9OuX1
 OrSA==
X-Gm-Message-State: AOJu0YxrL1yDf6QeLO+cgB/vbeG7qanNQBlz7fV0P1XwcO+vK+KjctUH
 d5rRUhiKf5De4MB5cNhaOATq5EE1z/+L2wlK2b3xIIoGd7+iqCBIQ/c0JcpzztG5J6y+uVeL9iE
 /7Ius+sQ=
X-Gm-Gg: ASbGnct59NEpMiiY2JlGQT/kZBjOAOluubFnyVQiGjadwena2a6iO9dhY69UPIhCdws
 iygBvGVPni5cjf2dKBN5QNN5Ov5IJ4R1qyqfapi9yO9xg5NZuxuymiuXD8/y1U7vh8QUiapy5ax
 j3MD+K+d7tFL5T4vdGwfY70i+jcULvNS42g9UX8ejvT9Ntf4+NmAq0SEIyiipbokBE6Gbtm8wO0
 1RzkiJ2SG6YWotJGKyGjtFgdgILnER6/wqYeUXs45fOyZ/YmQR0E9rxGN8ofsslDkNzw0x/vlHY
 Bum06picS3zR9PS9m6oUhS4VffG9Cq+UnOuAQI9fjwtYH7+gl8oOyvEmGKCRRzhDv4Q=
X-Google-Smtp-Source: AGHT+IFIxemT5zTXsvX807OPlqqSJw+6IW0L98Yt7/taekt84gzT9ouA5Ea8ZCgScRnlKT2w5xinJg==
X-Received: by 2002:a05:6214:5016:b0:701:a5d:7e37 with SMTP id
 6a1803df08f44-702c8b7e6a2mr249166666d6.13.1752002363630; 
 Tue, 08 Jul 2025 12:19:23 -0700 (PDT)
Received: from gromero0.. ([189.110.24.38]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-702d638846asm56289096d6.22.2025.07.08.12.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 12:19:22 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [RFC PATCH-for-10.1 v3 5/5] target/arm: Advertise FEAT_MEC in cpu max
Date: Tue,  8 Jul 2025 19:17:04 +0000
Message-Id: <20250708191704.1068604-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708191704.1068604-1-gustavo.romero@linaro.org>
References: <20250708191704.1068604-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=gustavo.romero@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Advertise FEAT_MEC in AA64MMFR3 ID register for the Arm64 cpu max as a
first step to fully support FEAT_MEC.

The FEAT_MEC is an extension to FEAT_RME that implements multiple
Memory Encryption Contexts (MEC) so the memory in a realm can be
encrypted and accessing it from the wrong encryption context is not
possible. An encryption context allow the selection of a memory
encryption engine.

At this point, no real memory encryption or obfuscation is supported,
but software stacks that rely on FEAT_MEC to run should work properly,
except if they use the new cache management instructions, which will
be implement in a subsequent commit.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 1c597d8673..1b47246d2a 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -89,6 +89,7 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LVA (Large Virtual Address space)
+- FEAT_MEC (Memory Encryption Contexts)
 - FEAT_MixedEnd (Mixed-endian support)
 - FEAT_MixedEndEL0 (Mixed-endian support at EL0)
 - FEAT_MOPS (Standardization of memory operations)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 173528175a..2c63940878 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1249,6 +1249,7 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     FIELD_DP64_IDREG(isar, ID_AA64MMFR3, TCRX, 1);       /* FEAT_TCR2 */
     FIELD_DP64_IDREG(isar, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
+    FIELD_DP64_IDREG(isar, ID_AA64MMFR3, MEC, 1);        /* FEAT_MEC */
     FIELD_DP64_IDREG(isar, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
 
     t = GET_IDREG(isar, ID_AA64ZFR0);
-- 
2.34.1


