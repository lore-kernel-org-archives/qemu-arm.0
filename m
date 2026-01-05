Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CEAC79FAF
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 18:21:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcp7Z-0001A5-JO; Mon, 05 Jan 2026 13:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vcp7T-00017I-Ht
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 13:15:57 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vcp7O-00037C-NI
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 13:15:53 -0500
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-4f1b147eaa9so1426641cf.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 10:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767636940; x=1768241740; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=udHcpN8ZZZt21zmciD7G8BASxGfZmLICDSByJJQKjAw=;
 b=VViVQYq1/5eOSa2IUEdWOvF5imujBC8PLtJfF6ibqMalmjYQm1JXpMRU6j0xV91APS
 RqKxTsHueCq6OpbhroQlxjtV+s0Kn33PrDUljnH7Mf4406iD953mPUrJF47a1hYseEY9
 g9NcqO4dcST7oU/x7ZOywNeCFuMv1EC60IsNRFpSE956uC2wgZwm4xy54rfl63eGPoyv
 LYChPrmDVsyjtA6omZ6IMa7KV3DgKo/HWQ2hPpYTqeKiJZ/TSopkSyFsOPh8a2HT35/k
 rOR5v1dfgT3tSl+J2WHf5q7/cBZmV5n15rHqxXiIxb+RC/+kXMwqkmvi7+v7SncGiHQw
 f6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767636940; x=1768241740;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=udHcpN8ZZZt21zmciD7G8BASxGfZmLICDSByJJQKjAw=;
 b=CsE8Znt+0cohzzyZlcmIj2RvYBAB1tX2ZH6o3m7l3NRJz8SgaEYtRcrk395R7zpJPh
 JZ4hKoUsm2/VmEBnbtHNiy1fnYrIsmWSy9ThcvL7nMJpLv3rca3fS8dnUTZX/HnGQ2d3
 YDdKyhwkE2wydqasj3F//ncFxbJH6lsoRJaXAGeCPs2NdUnlAw56+XoxklI+6xndswFQ
 9zjf2oMSW5M8wO8L0wLr2R9hQjuwkXTQvCdTqWBuQpK4HkPwICz9Umo0U7hfSO1iyI9Q
 ulZcRg7lU38XtB8/b6LJhfxbJv9rYQg7nuNo9h2SPib+qfR6V+K/bqoM2Gkapf4W9fZo
 e15w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmDZMzz3gjvkzN7yVeyGvE1677sQrChbxtOj1t6lBTdQ1YBUls8isP2Zhfjo4jpxlh0VfkLhX5HQ==@nongnu.org
X-Gm-Message-State: AOJu0YzrvkPibSdhhHVpOwPKIMOjcSMeHbp4nbYGr1DtE0j/6vDbAe36
 GgyOG8E6O41yCcmo3i1LW0DIvnKJI6f+1w08GIMu6POVIPLMU5U3hTSJ
X-Gm-Gg: AY/fxX714SXgVwbbm13ma9/wu4BO+pRWc0zzUvumHN9oeZ7ILAx6MamwGHS7pKE8KJd
 cyd3I6h/7Mx7LR9orLoFPos3owOyxxwTo/n/690UGEsyQqwKi0SRe4+1keVHHLJ4j5GLtN40hH6
 0lVgiIMxydWLLyxcgxu3sQDkgMM9oVaGgYaRuUR0gauWpNc3muY9tUZuxebMckL4w8/BcoBBUMw
 0/LIdLuzjmPrPPc2B2iC45HiSOqgdjYc5HW6QNvAdSqkX9yDBYRbr4i9XP+YjLBG+Jp5RHTIWIQ
 zwcYbztSYMfGt7nImWvEPlC+5au5e1+ibZw3oT2IXc226PrTTY1XH1hzAy0f8FMFxKRKtNi/5lp
 njH0bfxtcbJ7f3GZEwH5fgHk46Q2JlvmNMYDfhnUAlu0kHMEB/vDAunV+9z/Zslb3QXMgeI+SKr
 SRWErKTQUAmerxLcXW9zhXTPAd
X-Google-Smtp-Source: AGHT+IEH1q73W2xEmNCuPVoyRXFU7CwblIqnnjCeffn+13De9y7qMnrq+Z1Usj1DLFFk8Oq3949RtQ==
X-Received: by 2002:ac8:5e0d:0:b0:4ee:24b8:2275 with SMTP id
 d75a77b69052e-4ffa769a0a5mr6418201cf.1.1767636939776; 
 Mon, 05 Jan 2026 10:15:39 -0800 (PST)
Received: from [192.168.1.204] ([185.213.193.254])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8907540e24csm3855706d6.25.2026.01.05.10.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 10:15:39 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 05 Jan 2026 11:14:59 -0700
Subject: [PATCH RFC v3 10/12] docs: add MTE4 features to docs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-feat-mte4-v3-10-86a0d99ef2e4@gmail.com>
References: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
In-Reply-To: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767636923; l=2273;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=DsmbxIwUBXC/gS0c7G0YS6d9ziseoKdUCW31wFQg4u8=;
 b=7hq6iEvTw/7SdRedRqlvPiN7gXImWHLziKMoojuFus0lGNbf1qb1QAjzwnRwFSfrvYKkEVybz
 ixarxY83VGVDFVqdLBO1SeR2wLoDOvp2mHrJqMq0OfkviO3gECE5gVO
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The implemented MTE4 features are now present in
docs/system/arm/emulation.rst

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 5 +++++
 target/arm/tcg/cpu64.c        | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 31a5878a8f..12662189fc 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -106,6 +106,11 @@ the following architecture extensions:
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
 - FEAT_MTE_ASYM_FAULT (Memory tagging asymmetric faults)
 - FEAT_MTE_ASYNC (Asynchronous reporting of Tag Check Fault)
+- FEAT_MTE_PERM (NoTagAccess memory attribute)
+- FEAT_MTE_TAGGED_FAR (Full address reporting of Tag Check Fault)
+- FEAT_MTE_STORE_ONLY (Store-only tag checking)
+- FEAT_MTE_CANONICAL_TAGS (Canonical tag checking)
+- FEAT_MTE_NO_ADDRESS_TAGS (Address tagging disabled)
 - FEAT_NMI (Non-maskable Interrupt)
 - FEAT_NV (Nested Virtualization)
 - FEAT_NV2 (Enhanced nested virtualization support)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 917db5bb09..4ba126f4f8 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1281,8 +1281,16 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
     t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
     t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
+    t = FIELD_DP64(t, ID_AA64PFR1,
+            MTEX, 1);   /* FEAT_MTE_NO_ADDRESS_TAGS + FEAT_MTE_CANONICAL_TAGS */
     SET_IDREG(isar, ID_AA64PFR1, t);
 
+    t = GET_IDREG(isar, ID_AA64PFR2);
+    t = FIELD_DP64(t, ID_AA64PFR2, MTEFAR, 1);    /* FEAT_MTE_TAGGED_FAR */
+    t = FIELD_DP64(t, ID_AA64PFR2, MTESTOREONLY, 1);   /* FEAT_MTE_STORE_ONLY */
+    t = FIELD_DP64(t, ID_AA64PFR2, MTEPERM, 1);    /* FEAT_MTE_PERM */
+    SET_IDREG(isar, ID_AA64PFR2, t);
+
     t = GET_IDREG(isar, ID_AA64MMFR0);
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */

-- 
2.52.0


