Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAD3D116E2
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Nov 2025 16:23:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vP1Fh-0000z0-Oh; Fri, 28 Nov 2025 11:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1vP1Fc-0000wD-SZ
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 11:23:19 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1vP1Fb-0001Sq-FG
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 11:23:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42bb288c1bfso1214082f8f.2
 for <qemu-arm@nongnu.org>; Fri, 28 Nov 2025 08:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764346992; x=1764951792; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pr5yp29H0V4IUQeiIEA/B9+K+4Dm24CaDsEp9vyABNo=;
 b=MHK+xcXaV7w1fXnp9MkUdg+BfEz2cMWFjR3fLGla+eoYMDD0LURoOacMIrLAbbqaJ0
 iODbQsonCmdHPNxUPP4Wlf7oNsn17nvti0KUR/b2b4S/+lLwf4WylNqlw4y92Yh5BtsA
 4gEtXXSxU0Jd0+9b4XOW+lrW+D+udlkcDOzhdQL6ZzEklP+JvEVqLAVMBQJJ4qz2y0Fz
 ug1BqLrPspWVT4SMML6LZlydUoSjeq/NS96r884j6l0m1Odc7AMPwA8SO7mbI2jRDH9c
 66smGvNQbWb4zaM7Ovr+NTmf83wNZpiLjBR5+PU8yqSKH0KB2N39pn05aKtgnvJPBnCe
 qfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764346992; x=1764951792;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pr5yp29H0V4IUQeiIEA/B9+K+4Dm24CaDsEp9vyABNo=;
 b=ZL4gV+738Mi6EvyKuAFxNocKykGwMfsgQh6Z6c9u9/s9/REeMJ+tc88tJeukpgQxdr
 zxWIZFVUGBZFprPkBjwujLqc/6Korn60iUm+bcKHm3pmeI9qEQRtJcXtwZb5v9pyu5SS
 XBD2tttcw39537DbvC2Sycnk8oC8W6o/wgOTiEfGgvLz6O3cBz2lP9/4GpBIn/uAREtZ
 mGLXEJka3Ua9vm4Rpt3W3zxrQa6CLboiVdc+AO3ZDRgT4HFDLRKODHk2cbe839hBT5PC
 Q1j9fBQKZhjmcxbeN4eZ37Pq+q1aa8GEn6tiygK7Lsrh96t/D0vjo69SM03eKAd66Y1n
 eOcQ==
X-Gm-Message-State: AOJu0YxN3YC+U3tBt9NPzwPm36j2VbtZwpyazmdATWXpZtyG7WUQrvxq
 Gv74HC57dg+qBYg9HaofUOhDNmdKRCmkO+XKHq4qb3F0qqATm/l5W8W4
X-Gm-Gg: ASbGncvV6PO3kc/9xhGRURU0PCmv3hkqGkhU1QVydGr5xbd2i/X9A+mMrVqPZvB949w
 /HBlc+FHC8tdfzm6LrGLrWVaHhBvGKjnlJurJ0uUv1D8IXvgjIujkF/NK8ek6+1gGtvlsi/zYrv
 cCcg6aRuxTMbGlGeN0Kl0fil4If15eAcBWs01nPTQHOuPfURkZDWlATEInkZDDLgxfyNP3x+VNQ
 IXrf/6ymmxuopps7GCe3yL3WUN0zwIQ7rFJXBJ1RB5ZJOy1DuggqPr8GAIrZvzo0+2+uOQo+/cA
 uJiGO+/6WOd7TSwPJZeURVG9EF2MEbjI3OjcNI+JCrRNrj02ZMb3XTgOvDItHiXsM71ValH4POi
 aIHqrJwI0JFOutybzDu87B6m5PVvCUVRdE4mCJoAb3/cKW0MSplUWGh7k20YEsBixV8guu/cRRa
 ZHd3yz95R1eS8UAQ==
X-Google-Smtp-Source: AGHT+IGcJxj+MvTPHPjIhAjvMTzHqqsd8NMWcrN2hnQyCTuWEq36aOkVmFYeTxFQzNBrYjuGDWqWUQ==
X-Received: by 2002:a05:6000:401f:b0:42b:2ac7:7942 with SMTP id
 ffacd0b85a97d-42e0f1e3433mr16953347f8f.5.1764346992326; 
 Fri, 28 Nov 2025 08:23:12 -0800 (PST)
Received: from osama.. ([197.46.139.116]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a303sm10953167f8f.27.2025.11.28.08.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 08:23:11 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: peter.maydell@linaro.org,
	philmd@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] hw/arm/raspi: remove duplicate include
Date: Fri, 28 Nov 2025 18:23:06 +0200
Message-ID: <20251128162306.13701-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=osama.abdelkader@gmail.com; helo=mail-wr1-x436.google.com
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

hw/arm/boot.h is included twice

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 hw/arm/raspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 81d2fa1b67..bc723dd7d6 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -24,7 +24,6 @@
 #include "qemu/error-report.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
-#include "hw/arm/boot.h"
 #include "hw/arm/machines-qom.h"
 #include "qom/object.h"
 
-- 
2.43.0


