Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90424CD342F
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 11:20:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKDp6-0007Dx-Hh; Tue, 05 May 2026 07:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wKDp6-0007Dg-3g
 for qemu-arm@nongnu.org; Tue, 05 May 2026 07:20:20 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wKDp4-0005op-8R
 for qemu-arm@nongnu.org; Tue, 05 May 2026 07:20:19 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-48d102471a4so18063835e9.2
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777980016; x=1778584816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RsPS9jH4wqzZMo8K63vD2xS0qPk68eIqWMM62PQ4Kyc=;
 b=zdRSeKTdP8UvICeFCnwjcAfkL+LdkwoqeWMorlp+VYWQ63NV43fbMAhY4SuEJv5mVq
 ezsFqK2GrkodvnueGcUdc/vOhStVHmKzov4FAg6+Ow35ZQbqmtVJG+2a0erkDW2F2a1C
 7/ym0OXhPzcvEzYi3Xd2XZSNknibucvyPp0VKUij4GAnomn+Rx70/TL2vtDWNFmyH6Rw
 rFu+08a6vReJd0ZaePO+mdVlAoyzKDbA/pSI4dGmVxsqtXwinX6+1Fs3Y2Y7ZqERQa+B
 ZabYC5aVGVIKjWcZxYSQgkKhHgqLAP9ovbvlwrvGjGVHrZf7gYLoAk4UwaQPkTEgYIUJ
 oggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777980016; x=1778584816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RsPS9jH4wqzZMo8K63vD2xS0qPk68eIqWMM62PQ4Kyc=;
 b=rkhlT+DKebdsktDHcz/vpl0tVfHc1oSs1oPJM5+edizq5t9FWkqrDhLBpo9LX/Dcr2
 KZ3JuQI8vQVNMjLq8pk+3hmuz+MYHpQ0En77I4FJWHBXM0zBSlS9LnBe9PM5X68YHJ53
 to8cnnZ94bG48rEomfrM53w4GmWUGM3BuSch6IiE+woOcoKFS1BO+uSslj7sP10XDjkj
 k+L93Iayt4IT4PqbjeDcNnpwLbAysV56eOC+Wd2PHRwNpZE1mWEJ55/7AJlDAhTEAR+p
 Vaa8eNf+E81VacolxhwDYe402zTxsY1Nv1JirVPVYno/wuaLF2LA7ntMw4gFJ1d3nAsP
 t6Cg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+sY4DldHG1kx5u0M20+nY5qLlzp9zXmRj6ab0rGLyNwsoNvk6NXU+T6mhmUJwvtGplKMc9xQYIaQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzpro+JzAoG33iy22ikuXRT6CFFQqms0oSkfjnEU2t1l7hZWHck
 fu1bhnIGAnJVJG2cwdSZs/QDtmTsfU+lIvR7g6m66Ujnf0aWBgVE1HyeW+paU9wLvd4=
X-Gm-Gg: AeBDietOUykFzjtZ2RZ26OBJGc5asKvyKVwFWvhXCSN/u0SiUp4chD1hElEvv0kM1QI
 7ESzB5Y82Am6/f25MAsPA9pWGjJV7+M/gIdMR/aT8yp6t0t2HnHovYsxmX82K2dSvitcf/2/NMC
 J8R4ZpuDzegdtF/X6R8VarcntaBuHEDlwVagv2s+CFyq0NwIVx8OBxO+kbHdAcMQI91QZ7bBZzK
 4Gk1nTcZWHYo9irlkDyoV+Yrrcyj/7chiCRgZT/TIPjQXhXBKsVa55O9W6W/enQI8wiKNcifz6l
 mNDNKaiP4GhR4G88PLlle8jo1z745TX4j6Dmy9pq2k+Xvu/c8b2dMH0rzMkz1uJWYZRuHd6rwMD
 4RT7Bc4GUvjZVNt0oycXDwqumk042NBGcrKa5lIWpuGjxwn29Rv54EPG4T2qBWwhYWmfu4m+05x
 vbIa6zpPhCBzUMz4iHvEgsMkAuoH7cRtuFiA==
X-Received: by 2002:a05:600c:8710:b0:489:1cd2:610a with SMTP id
 5b1f17b1804b1-48a9887194dmr215435815e9.9.1777980016036; 
 Tue, 05 May 2026 04:20:16 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48d17ff628esm39906375e9.1.2026.05.05.04.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 04:20:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7F83E5F94B;
 Tue, 05 May 2026 12:20:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 2/7] target/arm: redefine event stream fields
Date: Tue,  5 May 2026 12:20:08 +0100
Message-ID: <20260505112014.102993-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505112014.102993-1-alex.bennee@linaro.org>
References: <20260505112014.102993-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

The event stream control bits are the same for both CNTHCTL and
CNTKCTL so rather than duplicating the definitions rename them to be
useful in both cases.

We will need these in a later commit when we start implementing event
streams.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/internals.h | 11 +++++++----
 target/arm/helper.c    |  8 ++++----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4a1ea5465d7..24423a200ff 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -269,14 +269,17 @@ FIELD(VSTCR, SA, 30, 1)
  * have different bit definitions, and EL1PCTEN might be
  * bit 0 or bit 10. We use _E2H1 and _E2H0 suffixes to
  * disambiguate if necessary.
+ *
+ * The event stream bits (EVN*) are in the same position for
+ * CNTKCTL_EL1/CTNKCTL.
  */
 FIELD(CNTHCTL, EL0PCTEN_E2H1, 0, 1)
 FIELD(CNTHCTL, EL0VCTEN_E2H1, 1, 1)
 FIELD(CNTHCTL, EL1PCTEN_E2H0, 0, 1)
 FIELD(CNTHCTL, EL1PCEN_E2H0, 1, 1)
-FIELD(CNTHCTL, EVNTEN, 2, 1)
-FIELD(CNTHCTL, EVNTDIR, 3, 1)
-FIELD(CNTHCTL, EVNTI, 4, 4)
+FIELD(CNTxCTL, EVNTEN, 2, 1)
+FIELD(CNTxCTL, EVNTDIR, 3, 1)
+FIELD(CNTxCTL, EVNTI, 4, 4)
 FIELD(CNTHCTL, EL0VTEN, 8, 1)
 FIELD(CNTHCTL, EL0PTEN, 9, 1)
 FIELD(CNTHCTL, EL1PCTEN_E2H1, 10, 1)
@@ -286,7 +289,7 @@ FIELD(CNTHCTL, EL1TVT, 13, 1)
 FIELD(CNTHCTL, EL1TVCT, 14, 1)
 FIELD(CNTHCTL, EL1NVPCT, 15, 1)
 FIELD(CNTHCTL, EL1NVVCT, 16, 1)
-FIELD(CNTHCTL, EVNTIS, 17, 1)
+FIELD(CNTxCTL, EVNTIS, 17, 1)
 FIELD(CNTHCTL, CNTVMASK, 18, 1)
 FIELD(CNTHCTL, CNTPMASK, 19, 1)
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7e7677a584d..dfdb77a9fe2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1746,9 +1746,9 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint32_t valid_mask =
         R_CNTHCTL_EL0PCTEN_E2H1_MASK |
         R_CNTHCTL_EL0VCTEN_E2H1_MASK |
-        R_CNTHCTL_EVNTEN_MASK |
-        R_CNTHCTL_EVNTDIR_MASK |
-        R_CNTHCTL_EVNTI_MASK |
+        R_CNTxCTL_EVNTEN_MASK |
+        R_CNTxCTL_EVNTDIR_MASK |
+        R_CNTxCTL_EVNTI_MASK |
         R_CNTHCTL_EL0VTEN_MASK |
         R_CNTHCTL_EL0PTEN_MASK |
         R_CNTHCTL_EL1PCTEN_E2H1_MASK |
@@ -1763,7 +1763,7 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
             R_CNTHCTL_EL1TVCT_MASK |
             R_CNTHCTL_EL1NVPCT_MASK |
             R_CNTHCTL_EL1NVVCT_MASK |
-            R_CNTHCTL_EVNTIS_MASK;
+            R_CNTxCTL_EVNTIS_MASK;
     }
     if (cpu_isar_feature(aa64_ecv, cpu)) {
         valid_mask |= R_CNTHCTL_ECV_MASK;
-- 
2.47.3


