Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A15CCCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:16:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyAZ-000062-H9; Mon, 20 Oct 2025 18:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyAY-00005g-69
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:58 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyAW-0006ra-E4
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:57 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-471076f819bso38566875e9.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998555; x=1761603355; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eo3UgtAdEdwyjKyHbEK//0VcKmTQS/OavLgbol+Y870=;
 b=R/EuSD+dqIwCjULXCZ0WqbForVywPU25ys8jsh8FlJXqS9V8zzaKIhEligmnn50v0N
 2sdmxFSBnkByfN0GifzJrG/RLTH4pUcDNjx9YGsY1f5iVksKAGkPTnhoBhjpNe9bUbn0
 Eskp5Zz5+AQwCfD84F36L46/r70CJ8gATW2qi0ka03XTGAzpb2hagaJi2QXnBC7L+bnL
 b810/UGlgpiB2qMdhdXI1J/VRsHbnpTmz4NHYY5DuYoYEoJaYmfHaFmFtDcAn2KWv+7I
 pKhOEQ4INm+JcwS8TOv5+a7awU8eAPP9d9SKFzcjdFI4Pa+B2HAFh3tM3Z3kbJwnLI/k
 UimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998555; x=1761603355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eo3UgtAdEdwyjKyHbEK//0VcKmTQS/OavLgbol+Y870=;
 b=RNCpz/jCQJVb+DY1XgPSnqndkDbALOfcXCu4fP0zxdRQEmxI6G1xDQL6knQBrH7Ya4
 CD9BpxldJFl1A3rQA+Z0b7c9x6DPybcC7qXQ4gFV6+imd5VlQqVnZufAR02EmwAEkgqp
 USGzmwouT447hpTsjp1j4kc/YjOLncC/vJXrFfR2pLLHsgMILMXyB058aEZ+0ut0hmZI
 95wfx4GaDRVaqPCatvsEv1gSaOPnLKylrSbNQ9/6uEHyAlp4oV+ipUkXZnZDK6d6zrsT
 PLdVxdmVlpQt3WTsTQk2aYxT9oLdSTDCYiIyQVMyyiCEJ7ffzw+OEUN85fC6r44Ag/pG
 nElw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqOLvAYpgB/cKNEH/gos6kuNILPNgKYBQWR4cxyTxam+lim9FGY/+O5qAxygDkQzFyzLfCZG+jsQ==@nongnu.org
X-Gm-Message-State: AOJu0Yyfdw1diorv+Idec0pwumyyT/kYS1Xd97BKyzoqkysqNMps98Uk
 utTZzrQe6yl1j53pp0SPcjzaU03Y+oJIR4RYgX2ON742tzOKhSda91eU6CLsxo3omnM=
X-Gm-Gg: ASbGncuCNcGQX4VyPzTRLtiNLq+dYeoHq0VcEXmtGvOmoDQ8W7NnxU2FjxwAZPDCUnl
 1H0JtKsmvo3Ty7KC6mSKPNmye5wXQCanypwFOkiy+aIkdMMQSfegFoWVSbftjDTaiXrPH8GKnPX
 +cetm1XmfNW2K5ghCUlN0dqX7oK5SPZfORp2UMSizwR/eSHTPJIj2dpQzRg0KMMGWwh7kv1I0z7
 TaiVraEsmicY6LyStMfzP0nd+B5Om79TkMowSrkdnuSLhXq9Vq2bk/gFXDN7OrEQR45c/Vm0vgy
 L9Uk3wjqKPCW82bm0Tg2FRez+OWHsPUzccALplWccrU1a5t7X+smixSlWGcOiYMeIDxobwDRxpm
 fTX597sCqQ7I3y/ZTyKbXAG0JyClSCK+T9IJVtX8Wpj2t6Gb6A14sTytBHaZBc6b+XiR1uB48GI
 0gYJSpdJRBHP0ZW/oxq7c6WmZtW9Va7CjLGneYui4FYQpHhFmQxf1dpEeS8IU/
X-Google-Smtp-Source: AGHT+IGK7h/o1pZ/D+WCHruL3RMbEn2pOzxxEMW5kyzhfZ3E/SNwhZ1IAYXYYyqtsP4hVXEC+jWqaA==
X-Received: by 2002:a05:600c:34d0:b0:470:fe41:a93d with SMTP id
 5b1f17b1804b1-47117874cffmr107922985e9.4.1760998554809; 
 Mon, 20 Oct 2025 15:15:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b9f71sm17264792f8f.37.2025.10.20.15.15.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:15:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
Subject: [PATCH v6 24/30] hw/arm/sbsa-ref: Include missing 'cpu.h' header
Date: Tue, 21 Oct 2025 00:15:02 +0200
Message-ID: <20251020221508.67413-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

"cpu.h" is indirectly pulled in by another header. Include
it explicitly in order to avoid when changing default CPPFLAGS path:

  hw/arm/sbsa-ref.c:162:25: error: use of undeclared identifier 'ARM_DEFAULT_CPUS_PER_CLUSTER'
    162 |     uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
        |                         ^
  hw/arm/sbsa-ref.c:163:12: error: call to undeclared function 'arm_build_mp_affinity'
    163 |     return arm_build_mp_affinity(idx, clustersz);
        |            ^
  hw/arm/sbsa-ref.c:746:25: error: use of undeclared identifier 'QEMU_PSCI_CONDUIT_DISABLED'
    746 |     sms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
        |                         ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index cf6e6eb208a..2205500a8da 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -52,6 +52,7 @@
 #include "net/net.h"
 #include "qobject/qlist.h"
 #include "qom/object.h"
+#include "target/arm/cpu.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/gtimer.h"
 
-- 
2.51.0


