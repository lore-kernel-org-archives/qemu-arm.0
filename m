Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAABCCD19F
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:12:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAy56-0006bd-6a; Mon, 20 Oct 2025 18:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy54-0006bF-R5
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:10:18 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy52-0006Hp-R8
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:10:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso34343975e9.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998215; x=1761603015; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9sl5D2OBPAk30ix5XFbA96G64ecqbTuVPaB9Fe4lYaE=;
 b=Jt4nZNglwi8mzrVe7AICukwaap0SA/wBBoRJ5aD8jbuO3dPtNbb2VrGiYN1s1IIEZW
 U2zPsCk424Bp8T0HGBz7FtpUYG+7ZIJBRD1e/4RrIvkeJ0TH64x7vrKS7Ulj9ycQDc5D
 nA07kmb/D+PX15rxa1jBYzl9uK1/0BmuhljFli2/gsp/VQC0Cnj4PQtM8DXT7JhpZarO
 73T5A+g7G3rzgNoxgloTHuyw/Wt+xaynFLcX7uZEizXS5KJi5vTmkHeI0SQ9wyjyETRx
 qx37ExlBNA0nK4xR/pDqPMg/ao9Xlm2pcUfRUqLT/4ut1JO8zHHwO6I/A+EQXaFMxWpR
 oFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998215; x=1761603015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9sl5D2OBPAk30ix5XFbA96G64ecqbTuVPaB9Fe4lYaE=;
 b=Stw+cejLLVW9dEcPsMyAbbZk4Dc8ls5WetEI29mEJ44lPL6VOo+8Ppnh/slyDDeU62
 G7Yz+cHQ9R4TPzCgf22EHdrJ/ScqWTwoilL6srPa8BG7rdApTw3vLgJljcEg3d6tCdIV
 Ez0RO68LQN+viZT4vNSqj4ais4u6ltjfWVgolfj5QVNoF5KCCzrBesWKERrIcqz17u5D
 sESHp7v7hheFKZLiaO3Q8y6+wHMV9gNk7ocBHxq3OeKBCfzuVD0soReClkFH+dteYYUM
 qOVXVLaoVmZTsiKDEeuDopdjV+Yhp0eJzObEFBqDMEYPyN4L3qst6aczxv2DRFeoWM0n
 1xMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7EhwMs6IAugjVKQvM9ONP8Kuj0gd6nmqg7NyaYuQP7OyM6N00Gfzrs5scZOxDKGGHcPOeOsFP5Q==@nongnu.org
X-Gm-Message-State: AOJu0YyEE7ZlyDLi2stUj4QRrBtxl1d0gxYGp+dCWDdJ0c0lu1+SbbpG
 STlemGt/ajDtgBRLQ+BqiuN7Wd+A5h7SYI2CQLw8Xxid97kW0wuF7l/HuRATDBmqn1zSv9EOUN5
 SPxEbRcI=
X-Gm-Gg: ASbGncuSSMpGGq6lBjNfLdo08urQbXBy/B1ogUkosyUFvLh8Vu+O2dh9MyERP3Wcz/H
 9TNYqHsFWajArb9qgITBSnpRs/P/rEth9ap7QEDqdckM/Qb4FHyXuZQGSV6clH4TAQF/151b+1D
 fbU+MaKfF/3dCIz9eZv2yyJLDFEcj6/7vbwF7f6k3glqPqUtG2NhKndRnNOc37L9vNGaR3X47Tm
 EpEYg75g86LsDmyqkD6vArttyJg6lLvNXmONhBnWo3FfavW9sDn0NwZjgO+EQbwm8f0uyHj+8gn
 IoHGPQSSDfbNJohTgqslWOBfAlVl4tSfgip4hVm8zfvy4PbNXkvCdMLrHLBrdU9F/giy5/GXB/F
 osmGKT7Ph3em3hWwV9WWH2BjFF+fH9ogB5d6pq3chL+yNdxuRhkD5DDQLmeDjFGvlyT8p9423Es
 kvaaf94KlG+qsZ0t3hdYRF6W0MuNkgtTrG7SS+jJGJEGcUNQdo1A==
X-Google-Smtp-Source: AGHT+IE+vX4pO5dXERXxNooJDvsEmYVIlONKnJr6ISUfLsDV7Tbejw7J4MCHCnZoj53rT51/Mtwlow==
X-Received: by 2002:a05:600d:1c:b0:46d:e5bd:2ba4 with SMTP id
 5b1f17b1804b1-47109b5f38fmr102660625e9.18.1760998215231; 
 Mon, 20 Oct 2025 15:10:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4715257d916sm158729025e9.4.2025.10.20.15.10.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:10:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 06/30] hw/core: Allow ARM/Aarch64 binaries to use the
 'none' machine
Date: Tue, 21 Oct 2025 00:09:15 +0200
Message-ID: <20251020220941.65269-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

When we'll start to use target_machine_typename() to filter
machines for the ARM/Aarch64 binaries, the 'none' machine
would be filtered. Register the proper interfaces to keep
it available.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/core/null-machine.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index a6e477a2d88..67b769bd3e0 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -16,6 +16,7 @@
 #include "hw/boards.h"
 #include "system/address-spaces.h"
 #include "hw/core/cpu.h"
+#include "hw/arm/machines-qom.h"
 
 static void machine_none_init(MachineState *mch)
 {
@@ -55,4 +56,7 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_cdrom = 1;
 }
 
-DEFINE_MACHINE("none", machine_none_machine_init)
+DEFINE_MACHINE_WITH_INTERFACES("none", machine_none_machine_init,
+                               { TYPE_TARGET_AARCH64_MACHINE },
+                               { TYPE_TARGET_ARM_MACHINE },
+                               { })
-- 
2.51.0


