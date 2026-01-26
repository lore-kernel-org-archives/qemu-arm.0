Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B3FD19502
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 17:48:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkQcx-0001Tl-Op; Mon, 26 Jan 2026 12:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQce-0001JP-OI
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:34 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQcc-0008Tz-AD
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:32 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so3364283f8f.1
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 09:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769449407; x=1770054207; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXP99FUoDu1z98GAyOTe9kejbBFJAL0eQ2bvmghE1tE=;
 b=OCL2yfnpl32GOrvPijfGuzw5AC4OO+wvInHhRvPYGxaQh7iZMyf4SsracRrNGO8xK2
 gWzRR/fRufhTO8UkzwXe1n0WTMC5A05slFw+Y8Yi8yMvwenCDLpCu3FZr6oATKcbor0G
 HVSZmPLc4klNa5HjmIdWucz77mmJmYkDq381eFHNqPNYBmXWICCHzJMxNs0ecdAP6N4X
 CvBy9hA4Acj1r1CvkkL9pHLhdJyC6jV/QIyXXKM/7elGI/mGkMEBGxS0TJbsDOGtvJ8W
 KZyzfsYNjdhslxORbPczRYZ77P0090IOMcAhfCjqK+/t28ekd1FkuRagOh+A4vnXaEK9
 oG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769449407; x=1770054207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sXP99FUoDu1z98GAyOTe9kejbBFJAL0eQ2bvmghE1tE=;
 b=npjQj5wyOlz7FOfJ8LucQOSmUFisQ5pIm5CS3+Q1hWiGhSh5lW+PUT4bLKkT6qSN6Z
 NcKJ3afrogBZKBgFWvIxbEPSf9Pqw8oYk8Qi2RJDdBM/7jZHLGrBpgtkPO4K3SnUePAZ
 bCwHTwib8xIZddkbGbgdWpX/531Qbc3586+Kn06ru96StemQQRiGKACDtXYnke9wTY7o
 PO/t/HxUVsU1J8p/UUIbzahUhLS5SNK3vEMWnNHTt+jSf/1fx4FjyIM1ELeAF3agMO/D
 q63Cp6sBMK3t9H6mo6lvqeR1jHLhEP9VgSsZGyQZOIG9yi87sufHxJOtD6E3sXXfDaL/
 pHVQ==
X-Gm-Message-State: AOJu0YwosbXdr1s4oq3UG/BlTA6T6LZhrLFo8cAn160UTN9yU5DHQ4BL
 9tzIKw60mNKg2ATs1JhFbtne9bCf6ZiBNAH/rG0gRZIe5ZTNSLSBfcpoHPs8Z6Vh
X-Gm-Gg: AZuq6aLzry0kvM3DzCig2BOercIJ/U6pptA2upjmkm7b4EKBh+VoeysTa2bj1oWHCV0
 Srchpyw5IL3h4QHpdbd4r+7OZ0n9MDP0F0q72bRchTARjpFEzTtuUZo37to45lekQI68ZpKmfZs
 w5HPYSe1d13zaUwBH8NxT7Zr5xHC/3zwA8YiFKXyzhTZ6tEwTzRUEYwzgHoE26o1UIuMzzVBKgd
 XJEMXxkuBkT9NjVm6DPN0y3bVan65cwsVoTrzF44HIxJpBPy3hMOI2UJLeUvzzCmmdw4FUyXlw/
 WOb3673si7gJHukWSaWaPcrQ1oRfCZfQzPns7EZUdtVrszjW3v/5dx5XhfLjqDGh2fv18nuGQdR
 0AVXbm5iNuHnR8JVgprNYeZ3pr6K7lzhqkDHOfl0fUATrsGdK06VdjyTtdIcTyGtfaZUONK6MdC
 NlSVeY4YXvvfemCU9H8bt2S6DutsgtODf945v/nIEL5HrwYs83G3tQfX5n703Vnpyj
X-Received: by 2002:a5d:5849:0:b0:435:9950:edc with SMTP id
 ffacd0b85a97d-435ca051d61mr7956562f8f.2.1769449407308; 
 Mon, 26 Jan 2026 09:43:27 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-71-105.adsl.net.t-com.hr.
 [93.143.71.105]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71730sm34199603f8f.26.2026.01.26.09.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:43:26 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com
Subject: [PATCH 03/27] util/log: add log entry for fdt generic utils
Date: Mon, 26 Jan 2026 18:42:49 +0100
Message-ID: <20260126174313.1418150-4-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x429.google.com
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Introduce dedicated log mask for hardware device
tree processing, to selectively enable diagnostic
for FDT-based machine creation.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 include/qemu/log.h | 1 +
 util/log.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 7effba4da4..984879fbd3 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -38,6 +38,7 @@ bool qemu_log_separate(void);
 #define CPU_LOG_TB_VPU     (1u << 21)
 #define LOG_TB_OP_PLUGIN   (1u << 22)
 #define LOG_INVALID_MEM    (1u << 23)
+#define LOG_FDT            (1u << 24)
 
 /* Lock/unlock output. */
 
diff --git a/util/log.c b/util/log.c
index c44d66b5ce..c8310ddc58 100644
--- a/util/log.c
+++ b/util/log.c
@@ -523,6 +523,7 @@ const QEMULogItem qemu_log_items[] = {
       "include VPU registers in the 'cpu' logging" },
     { LOG_INVALID_MEM, "invalid_mem",
       "log invalid memory accesses" },
+    { LOG_FDT, "fdt", "log Device Tree info." },
     { 0, NULL, NULL },
 };
 
-- 
2.43.0


