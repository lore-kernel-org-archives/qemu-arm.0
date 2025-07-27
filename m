Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE6EC87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:21:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwRi-0004f6-MI; Sun, 27 Jul 2025 04:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPk-0003oG-Ki
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:25 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPi-0004sK-Qn
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:07:24 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-24014cd385bso1443915ad.0
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603641; x=1754208441; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SDylAKOmltNGyLx2E37xE3a+pc0ueuM8z50fDJMoOME=;
 b=XM65+nOcE2uHXZ2YH/JN3giI5/9zZvvLPqigF0PO/ZBv39oVXVhfQ0TBrpqufUYHGb
 BgxRfuT1hySZmwoK/nMZe6sw1XHPYtWRn9wqaYKSlG/G6KBBXLSVOlNxt2ZamT56zUlZ
 Tw0Dzr+VLSYXs0jxNW5CW3rZkHcHXZdIj3/aeXgMsDuwVODZCrfXTCHweAKR97dU+/NW
 6ilYMiRBl13JVKqEG+3L83S245RjMWUNsLP5KvfTVEBg2JNqLTZ3w1b73Qi/DUIy1opU
 Bu7ehQ2yyzVwJY43fEKfuc9ptpVtMFcT2BG64uMysIdt2oSEGj99vP64SM+tdNNTE6wl
 BdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603641; x=1754208441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SDylAKOmltNGyLx2E37xE3a+pc0ueuM8z50fDJMoOME=;
 b=AoUYNp8YBxv0UpzbmxeJAf7NsQbKxs0mTsDmdbQVcr46tzwAq4igdms7cdM61WkTZw
 D61+jCZpYvB0O7T+wS0ZcE3Di0VpFqFx7gbPOSybbTODNcmav9e+MzT8ml/sYUkk0NCS
 Q5virUkZzA3sD1cZNJyVmXvrFXuzjbrAdvTCS9g728OkpVrH4zDYdaouljNzzmnMA4cd
 7YWqfba+sDnwSqC+fhHW844dqIY3Ybd3IXiTPaQTFWqKKNU3rVK6gXsNB7EURa/LPfss
 MNhnQS677L0+0RS0JInZX93dsWCpnQvDl2+VEkwRe+Ip/vNwIUefVoiGipAt3a9DBqVv
 qUfw==
X-Gm-Message-State: AOJu0YxrvHVlI8rpRwTrWgsQvMgyEFJqyjUbQHw+xcPCbMVGmNtoU+a8
 jlxohS9WC6eInr2FZ68/Jr3XeIht2l2vhv/KDVhBnQsoCDSI02O+lJRO/+Dj0h1UKsRUWstRK7k
 LXEcj
X-Gm-Gg: ASbGncsl3l1m5QEipK9ERXS0PFQqM8JMu6U76ntkLO31W6Sl4c6dlcN/7omkGDqHXmu
 EyOx2+1omGHlMmLMa8S9KMIp15GSbzFHsz63H1fN+DJyTSin6kpVIHb3WVbT+pQ0lMiwwXOpoO5
 MRpbytCOkkGATtaQg/J8j9fEa+Enjh5TKsRXfleYiy5eoVg1TTlHsdUwwRNqo0yrn763PauJeYC
 grWc5EJaj49wxdpHHULCHoLQp+WtQzQZY4k0DoFl0xY6Sl+2FfW1iZQ2mRVGrX8+itCmWuJtiy5
 vmjVDE9nZeZypzJkXLAvPIoj0cx+STMBv5AfYKKCtm8Zdo3uXLpYc2u2/mZFx1MR+7q7eOx2qCn
 tx/FkgnwmaimQ8n20IkX6dz81sc4qLjD53tnKyxBFvkYUwbnh1HXNyG81lezvpT4q9vQ3fzt1TQ
 RGw5Es6aqLKA==
X-Google-Smtp-Source: AGHT+IFR4QduveMs1gQmtG9cAKimd6lBjoMXSGruNmr8p5HBIBpWWCixESy6Hd0da+mAMQa3UGhSig==
X-Received: by 2002:a17:902:c7cd:b0:23f:e869:9a25 with SMTP id
 d9443c01a7336-23fe8699c24mr27485075ad.44.1753603641234; 
 Sun, 27 Jul 2025 01:07:21 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:07:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 70/82] target/arm: Enable FEAT_GCS with -cpu max
Date: Sat, 26 Jul 2025 22:02:42 -1000
Message-ID: <20250727080254.83840-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index f4a41c854f..0c3408c0a0 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1205,6 +1205,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR1, SME, 2);       /* FEAT_SME2 */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
     t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
+    t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
     SET_IDREG(isar, ID_AA64PFR1, t);
 
     t = GET_IDREG(isar, ID_AA64MMFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b894aced89..9e3df48e00 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -72,6 +72,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_GCS (Guarded Control Stack Extension)
 - FEAT_GTG (Guest translation granule size)
 - FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
 - FEAT_HBC (Hinted conditional branches)
-- 
2.43.0


