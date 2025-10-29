Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE405CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:55:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE86-0000TM-BP; Wed, 29 Oct 2025 17:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE83-0000So-Gi
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:54:51 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE7p-0007xn-QN
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:54:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47114a40161so3447605e9.3
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774870; x=1762379670; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a651872IckFxyI4zFPyEsBWF3frcPZiE7HAcMIqgSHY=;
 b=Xd3k857WNl0FVoyH3w8zVoyzGCa83YL/gjsEz0yzD7i4GK7zGBWrfV/XhXEvpJ2F1k
 juHcQXgAfNt1hTs6B2lbrC93TiMIWeHSxnSl+XUiWS6x/c1s9xYFKmbl1Q5YPnRxrNVj
 3Cenhqv+Ba9OegZEsi3dE1IjS7xHTwuqK7aou4rMBwqGI8hZs/LGGXYFfWsvz7Xw6JIW
 lPUfYDG3kG9QEL1reUBnW/DVa/E9iYu1LX6h4sZ7YIh8KNDNTBPNDo4KPjgwdagD8A07
 UjN+/jXrWE/+xDWE3YbTTSgia+atpsb2Rsk7wRWlvQF0vOFDMHu5TjpSA4uYiIUgLxW5
 LEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774870; x=1762379670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a651872IckFxyI4zFPyEsBWF3frcPZiE7HAcMIqgSHY=;
 b=ZapZCiXabsufKiYH25SyhgMiSWvw0/tMrw0pvUHdioahShXiCODImqZLcK7o/HHTOP
 ddaFSxDJ0SC0xKh94Rosu0QW1BSwIjfSV2cHpAhX0+lTfJmhQiDfYcXB6Bo/YAalezwU
 7MkIV6AqhCiGUhEzOaX/7ebol1GIRuM69HSewNhoB2Z1BNg0x4o89tvoBeEkrBLO2ady
 w7MhvQc6y4V7EK77lq7NyA5zQh2ISd5KYQERpVFLWkiD1ZJt3oNnqrNoZpOAoQAtmC4h
 ozlCLzwebOUtabcemGE8MpKyBRnxN8Zx5WjdMCibBN21sGAPec41RX1K6vaKzhG6zPXf
 olQw==
X-Gm-Message-State: AOJu0YzNwJnWLVJlz9z77Sxp1qbMogRj4bn2jSC0kXKsrnWYN5Nw4Dx/
 orbBMSzO8yEzgV6GU23uXZy6BUdXqmUocKn4X4eaPf6yI+ZJ0wTo6UUXGUu5FOBrmkT/xEEJjLm
 54e6chKc=
X-Gm-Gg: ASbGncuyYwtJrtCFSJr/YtHMB3w/N4OVL6rRauKiEseDR1UCR3XzN4K4TpZO4g9xQ8+
 o8ZU2jeH7vaBoz1IcT+8iAt0cs36TbwLWKcCRHGY0W09UeCcMwNmMXvEBKw7IiIbyLagWLhEDKI
 9FfIYfYPLAMbalQ62SHDJbjc5xKnONGr4Np0CGDWFo7YhQFLVOdFntvjfutPjmY4/E5chtHurKe
 n7s4rnkDZZIZaSO89KskU9smxkQ2SXjSExlkBbI1ky2frG1vjSEHdtrNaYyQdE27lSFJ0kcv2CH
 coAyVegZq0rD1cUdaJEeIM265iS0UXRlZqMlTVcGWPzLUuemI3y4QcKTaRf1xMyePLGD5PC/hO/
 wg5K/+Npnym5cfTQjOclO3u9oPuK/qI3slK88gmxu97aZWsSrD4z953saIyUlbR5YoT/nT11aMK
 ANpf8P5zJ+/+7skhg5TBMX3XBFc/dx+1xW2fM6o4HbZp/umrEHfg==
X-Google-Smtp-Source: AGHT+IFHimm9eBbWvD/BAcs81SRDcF7UJ8k+1Hf6mJ2tc24EXAVR9UTMqj5twiCCVEznWQcHT+fGBg==
X-Received: by 2002:a05:600c:3548:b0:46e:46c7:b79a with SMTP id
 5b1f17b1804b1-4771e33045cmr48811955e9.2.1761774870243; 
 Wed, 29 Oct 2025 14:54:30 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718493c61sm52680805e9.4.2025.10.29.14.54.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:54:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 14/23] hw/arm/sbsa-ref: Include missing 'cpu.h' header
Date: Wed, 29 Oct 2025 22:39:51 +0100
Message-ID: <20251029214001.99824-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021210144.58108-6-philmd@linaro.org>
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


