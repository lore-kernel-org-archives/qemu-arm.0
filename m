Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F51ACCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:43:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEDw4-0005fY-1p; Wed, 29 Oct 2025 17:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDw1-0005dz-7Y
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:42:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDvm-0005og-7c
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:42:24 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b90so269675f8f.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774126; x=1762378926; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EB/+K+U50LOMq4VatDY59V/9bRPr5YkwDU8U96E3AE=;
 b=GGg64D5+sN98dXSmJVCWZwKILv7Im/MUjjsK9lulwSqP1yafWQYOFwfqpGDsp3V95h
 +v2Mon38suxs5U5QeWlqjtZX9WkHe3B51yetUtldp5+VHvwC36cChCNksth3vWEb6HhV
 LuJD9YZUHEV/pTzr8AZSu2B+/UvGAOG6ensPIJ6kI6tDRMFFd4Y0YkfABJcBCwMWBhpH
 NxePnjZ+y7qW+stNlZJo1lKOP3BBhhgvLInjLHADfB67g0Dd7E58aKwqWjwaycOIT17d
 Zc7SuVTmejFL2y+1pCzmJg8+Hsiad4lEl615QdgEW2SSgMx23TnaEuCgju57ROKrdtk9
 6NrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774126; x=1762378926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2EB/+K+U50LOMq4VatDY59V/9bRPr5YkwDU8U96E3AE=;
 b=rH4B9FiNGIl+OKUchSj6npIsTRkTjGgfAxxrdyZs8ZEaYlWgdU/exKgRLXPVZNUSO7
 2segJfXxd//8LxrPgBl+98RYFPHLaSXg609HjNC6dnghSE82Z7MW/9xXALigAYRkjDUh
 6FKuVvuz5tA0j/LiftmzoqIjxln/N1LBFDJa3YlmXLKpAVksO6bIUin/8HNwHp9n2YcW
 kjFLiKvTdcPXTmrT/CsBq2bo7l696wXxRBDBggGYq6IVK8mPJa98+fp3esPAZ87nAYfx
 iL/4puPDDnC9j5BDFmW3006pZgywuFP6alpk4R3UWvDr54Fe0V5pIV3NQ2tYYB3E03oJ
 H66Q==
X-Gm-Message-State: AOJu0YxoFBslrwfCzoJdmGElNnbcwUwoqc7U/iwgGHrNd8QlPJcVWBl9
 cvvGGHG8qPMaN13QLN/eMUqLYrfu9NT2HlQKmpiY8O1y3eOdRceSJikkE2qbEFv7wAirPNiZ3VA
 xU5bzgGY=
X-Gm-Gg: ASbGncsmmXNzgG0mCrXAmjm3dZeOvwpWzdatyKGPRH8rEzIzqPsknIlU1B7XEtHWoPH
 184pMNiRv8PiPU/cPacgZwR9aXnThWoIjC3VpoEVA4klp5C6bY1jZYTzWJAoZz3b0JbGTg+qWee
 KIwgXtRzsbMfJIQISzm1PEAVyH/o5wCJE1j0lpPVU2pILKTlnsbhvOeAn9lMaA2IMVo+nJzSCQ+
 Vt3lwiuDB0pxtMXU78fmd6pmC2ilpJWgU/BieC0bAmih4/z79pFwZ4nmOKL0R1b53CW2CVFOTr4
 /P47OJZV1rcNnZwRv+HQD10VaXqgb2gl/4E8v7A45dOilf9kR6w6IwVZwWx0jh0fqBxcYHJLGSK
 kfQQVWW66RILGXsa9xA/37hLmssuIqhIkQ8bX60yv4rN9sMIcZP8M2h7qMGLnWSwlSSN77gKzHm
 G8fC98viG55HOdQorxXK+nSN2yBxtVP9cv8s4TtLUK86q20YDyUg==
X-Google-Smtp-Source: AGHT+IFgdRC+dWjPAYj7IlPWt837fcvkUI8b6+SA4PZQBAwhyXnhAYEqH7ph7TKI5k6QGpOx2FC2tQ==
X-Received: by 2002:a05:6000:4211:b0:429:8c31:84b7 with SMTP id
 ffacd0b85a97d-429aefd6aa2mr3655666f8f.39.1761774126313; 
 Wed, 29 Oct 2025 14:42:06 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772899fdfbsm4216885e9.4.2025.10.29.14.42.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:42:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 02/23] hw/core: Allow ARM/Aarch64 binaries to use the 'none'
 machine
Date: Wed, 29 Oct 2025 22:39:39 +0100
Message-ID: <20251029214001.99824-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021205741.57109-3-philmd@linaro.org>
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


