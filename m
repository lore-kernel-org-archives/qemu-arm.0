Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCF9CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:36:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPu-0000JH-Jc; Sat, 16 May 2026 20:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOz-0007JJ-QN
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:44 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOy-0005Fu-5w
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:41 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-8353ca0f1f1so430688b3a.1
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977837; x=1779582637; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QG3SAWZXTLSfeqfkLdTcj+WQldu34LGY3+/Bb5YVXA=;
 b=UX3xPEFu1k26ViTsdrTlND7Og9TQd/XjkXIFja4ziSw4knkYKHd/rLHsTqzKQ5sYac
 R2B/YOSjN/4j0KjMHC0jrlRIlWhMX7wiH+dmw3PMyrGnMjpHsX61nBxhNkAv4MWGR5rl
 rc0GqSfRH5/QEjPtRZ9M1h+bA3GpITk42axZYYAX35DIGu4h8nqB7Nh/t6tH2c52rF/f
 6VN0CdApK8nib8R9Vo84rrAZaWDJfBiT8XvDXCvD5n5wGgEON7QozWbpBiJ+xOg3zB11
 w98IYngfbCcaSxnN8xmMWveMi8UGLhrU5vAS9Idlnb4PdZhQG/JRtWDVbK31bojQAbR4
 /WVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977837; x=1779582637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7QG3SAWZXTLSfeqfkLdTcj+WQldu34LGY3+/Bb5YVXA=;
 b=l9yrcmIOry8mEtWPn2tyXpVeQkyowMJjYhzo4hCOuXwpPeo7b+QL39vHgqWo4KoyR6
 DAfeh7SKpRR1DAH3dRmUlIQEKe5e1d9Mb5w6me8HC4J+JzCjRNwFroWjTkeM1xEuTzzM
 zoR54Gl745Ody98kPaezmO5dCIr7KGFZ+g9C3KgPVjyetNWy13j4Ha3OeSA/tAL1ywdl
 xNZCQv4KqxGZs2xI1u8v3ZIjGvh1IhatgUwLOlMryxWRbfsy6rjlJdhK4yZS7+qdNk3f
 DG/I8RElT8Iwk2jNJDd76qcxv3Y9ZazCMUFKETzIN6Obee+dllqvxXue75vwSqrqBTx8
 Ojfw==
X-Gm-Message-State: AOJu0YzLK5YraOwwWLVaxk5H1ohk7MFePGA6qhKEeiTwJYk2xLyeWnnl
 4OraZdZxVVpwMG3pPb2DxzCZMqlGK955iqMaPK1mz4EjBCfzXq3XvA2Y9bjKbHpKcPg6iyIBrNM
 FTXJh
X-Gm-Gg: Acq92OEkji+WdCMjRvumUZQGXhXLvhWG+DeNS+n8ZES3ciAunyZ+gfIQoamDTRwVGeH
 u9HuNBFgEWSDz580diTP3xU8Uu5VP7w7RH+8H3SKrC2GIPuY4t7ymufF/mm+QTv11VrKGb72g7B
 GMAmYw32Q2ZUsTuVXTvkBIuh/i/Q5gg8Tqj7DOGou/SWvshyjmFxXUrIi12RLDsXZhupPZTmpyO
 eRdh9pdkBqt2QwOnp61AOAq3f6gvgwNZs7dlGCqP0aa1fYkyO4R88DMcDec7QfE6YfzOMO4LuKZ
 c8DbcRdjbfqLFrhVlpbJMzIH+leQXUQBgyqQRAjOAiTaPbxXOTfATtMXzADHaNiJ0EIO4PNufk3
 hDJEXW5dBlaK5FSwQ7SM8BENO2UTuagjLm+JiiTjZ08cJEH28/PSu8QsQIUEikH40cmvR6QmQiO
 kOqcloLXRD4ThBC1zJsRo45S16n+Tx
X-Received: by 2002:a05:6a00:1146:b0:836:6f2e:bb6d with SMTP id
 d2e1a72fcca58-83f18dbd9c4mr10903925b3a.14.1778977836984; 
 Sat, 16 May 2026 17:30:36 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 39/63] target/arm: Enable FEAT_LUT for -cpu max
Date: Sat, 16 May 2026 17:29:38 -0700
Message-ID: <20260517003002.321430-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index a377f67b9c..bc866c5a67 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1263,6 +1263,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
     t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 1);     /* FEAT_CSSC */
+    t = FIELD_DP64(t, ID_AA64ISAR2, LUT, 1);      /* FEAT_LUT */
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 44c7196d09..cf8771d541 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -101,6 +101,7 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LSE128 (128-bit Atomics)
+- FEAT_LUT (Lookup table instructions with 2-bit and 4-bit indices)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MEC (Memory Encryption Contexts)
 
-- 
2.43.0


