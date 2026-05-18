Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AFDCD4F3C
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 17:49:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wP24u-0005Y9-8r; Mon, 18 May 2026 13:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wP24X-0005S3-2s
 for qemu-arm@nongnu.org; Mon, 18 May 2026 13:48:09 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wP24P-0003lh-S1
 for qemu-arm@nongnu.org; Mon, 18 May 2026 13:48:05 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2bd9c3b550aso17448605ad.2
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 10:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779126472; x=1779731272; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VZ9qc1RIQLlOewW2FMtXm1vHM1G9rLij/r0/5a06Pgk=;
 b=pu6cKtp6XbmvfkMNykO4JfGLn41ZggSgrMTR9VcviHE7JHosZmicQBOZHqkqc07G4C
 En3hqaIhPyS/c8mL/BizpztLzrqKNo/ujGCsNXX++XSvz7a26cNNRqGw0jCGN8EaLlTO
 Os52CoWQmUhhpI6BKLF8qtYG8EgCiWKlGvuytdSG+qrqRYUO71zs/hRGe79XqwS6tJ15
 GphjiyiYdE0yYzZDboLGccZJUhl++AUB2G/VQLG+pvr7rV2QiSjf1Mf7mSaZ56ThQorg
 nQtYqksW5Xbckiq67dRUhZyFAm5fB8MV4x9Kr6h2vNjGhvISmKTdC3unB7mgXva6O2YK
 6XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779126472; x=1779731272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VZ9qc1RIQLlOewW2FMtXm1vHM1G9rLij/r0/5a06Pgk=;
 b=boLH5LaLkVpt5VabEnVXGWnusHIYWB9prbpBCgbSWpBmxkKbsOvVEK8UyWQUwT25CX
 z/dRxBkE4yEM47/9NPyWj3O7pMz6EsqBdzliKcOCVR48BCcChrjc+dkz1VRzFRoc8iuC
 EDRSLj5U3TG6aku0phL/EjOneN8PY5zdERYS4VNb1XwK6tq1I/ufI5Azd7Y2tlNl99ZW
 jHJFJk3igQof7KWt1o4JHUOyWMNJe1yVrvn4cje3pX5diwyzbSPc4svphRD9yo/bqYUs
 1EOXykrrUMSQBZLIvIY2dCStyUWnYDN2QVB6PuRtm86q1aY5mmzj0T2C2t3YNvKTmnXL
 44JQ==
X-Gm-Message-State: AOJu0Yw4do6NYcaS1CODAXSzeocHDcOKoULE6owjP0raUvG653HcLDnz
 VfYxjO2Tlv4dnB7nL/aOkq3ZjF4NGzeg4orZTUCgKZ2fHgkbhJQb4UR9u84/BEAe8x8=
X-Gm-Gg: Acq92OG0zXQUUkXHqf4EoI4++S1GlG0dya1NFO2MIMMH0HuXbbA7Vur0Inozmxx5wZw
 W8Unnf7W9roXijrRziolW8Z3Kuix+/bGtajewE5Q9omzxkTEmuZB5Js73ePTjUV7KRcxWvKgBUa
 vKvNDV+38wqMcvIaDzZsL28rgD0LtIsPGCxNemM6bObo2ePNCDLz9/hc3QT7jGAn4xx+f6wzoK5
 lDZ2BVN1Euq2/GysQQXfhjCIna1LlrdjRUcbsJm3Ywp3yqJr6uKl8F5r2JRoYrEP6Sq7Eiy7EMc
 /qLKX/s3BbkrCykN9h4c0qPBDI08phwRtr9urT5szrPfJgyRSiJsoJVp6PNVqxcKwUhkSV4jPJM
 o8yeIOP9nEUrf6j4hJbacVEgNDMeJVV0skLrZlmQVHztf6iXD1yyhCNuFJCYbDH3GehA/yqr7/9
 WWUzD5nZOCgkcodUQTBsxcY8v9X2nq
X-Received: by 2002:a17:903:8c4:b0:2bd:8fc0:1198 with SMTP id
 d9443c01a7336-2bd8fc01303mr152835705ad.5.1779126471566; 
 Mon, 18 May 2026 10:47:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5d12e38dsm157334905ad.77.2026.05.18.10.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 10:47:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 0/4] target/arm: Implement FEAT_CMPBR
Date: Mon, 18 May 2026 10:47:46 -0700
Message-ID: <20260518174750.660258-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

v1: https://lore.kernel.org/qemu-devel/20250803014019.416797-1-richard.henderson@linaro.org/

Changes for v2:
  - v9.6 to be included in Arm ARM.
  - Reorg CB_cond to avoid argument ordering error (paolo).


r~


Richard Henderson (4):
  target/arm: Add feature predicate for FEAT_CMPBR
  target/arm: Implement CB, CBB, CBH
  target/arm: Implement CB (immediate)
  target/arm: Enable FEAT_CMPBR for -cpu max

 target/arm/cpu-features.h      |  5 ++
 linux-user/aarch64/elfload.c   |  1 +
 target/arm/tcg/cpu64.c         |  2 +-
 target/arm/tcg/translate-a64.c | 83 ++++++++++++++++++++++++++++++++++
 docs/system/arm/emulation.rst  |  1 +
 target/arm/tcg/a64.decode      | 11 +++++
 6 files changed, 102 insertions(+), 1 deletion(-)

-- 
2.43.0


