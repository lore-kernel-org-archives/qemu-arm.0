Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68874CD6E50
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 14:36:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSyKJ-0006Mw-IP; Fri, 29 May 2026 10:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSyKB-0006Id-R0
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:36:38 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSyK8-0007T4-Og
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:36:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-441209fb77eso8653583f8f.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780065391; x=1780670191; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v8hnt8QTR0m3dsrSXtppaehwSCPzuZgau1gE20XoQoc=;
 b=cdMcGbEpkeRoZEx+3Vb+1T5vVs4at9j88fabbENveiakmSiJxioqpK7QxAjCmrSbHU
 USn94MjZVbvKhKGiSHS8eoXluwnJixTVfRfYH46yGibasaVmjyPhdAbIm596VjKec28z
 uvLx7++CgpM8PlIFdyze79oEZ1Opz9Q9jvisrioCXgeueMegkdjWMzL7s45MZx7d7Muj
 h4TyiCIAOJ+hu8jg1d+P5Bn32z1Jh5WZJTmsauAZxYXjOwCFt1ZPE0QV5gDTw7KIR900
 6TPbWeaksWw1XCynlBVJ0VgPOJfxTsj3osPqp/6oa+DOZ3mwg65yU+4nkbpi5zDfZqht
 ZpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780065391; x=1780670191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=v8hnt8QTR0m3dsrSXtppaehwSCPzuZgau1gE20XoQoc=;
 b=fjHofuFKK09j0CWtIrua2q7oJvjxLiFAwHLj3ZCpv/ikYP7J/4URI2xtG7HZMZ176j
 1BQg9fm10Gpi1OtPcR+CT+UJSLAl9YyKx+OHUUOTLrbZgpPOQuFYOb8qwxkhDoT2IAzd
 M79F0Y+Q0v/KsoZ+ySOvT1j+ciDoTBbMTi7UB/HxrzrkaGHvZybCQ4RHw72dLZuuLHqa
 pYiikncqasu3owYVCMa6ltJyAbj+db6fGYajjzzOV1MMKhEFJbb40jMxbqf3Cq3S1xRU
 hZ7MgunH3H6zA8dEtmmVfCy25+ySAezQdEj3Fo5xw/2+zyQfJHWIvdlQ7Ha0LF8GvVSR
 W5Hg==
X-Gm-Message-State: AOJu0YxTf8a6+TPzmC3G7LF7M8QcN/KWyucxvA4RQ3zhmy31B3Od/o2G
 GicJu9nERM7itYgmexqmimW9R7T17BhpLIAEldoeiw84gC0fvydCFgndTokcl0xvrew4QHFZxQp
 JUJwm
X-Gm-Gg: Acq92OGuXJ+VWHuG9TGlGbIeBO0kIiX15+oedla3mZVRjjqmzstUVjwzrlSTErzebuD
 9sAaiHLQMRdw1izRIWRmFd7mI6SJBijvOE16QMDLJhP/o3sU3V6P0Udq0nyZnhtfa+3JTd69Fzd
 KrZZeLulf9zXF7NqsN/una1Q1Io56lars9zZlxpvoSq5WC3KJ1WKKzrGs/pF/zTysCVjWCgNuiU
 g6VYHqQCbspF6Eojqir3IQZIn4Klle4DjYKFrBtdgW4rdO9MHljxnbIO9OOhP1jLjxJMEB3Q8Ey
 KGRAoY5Z7j84eFvBY1mPVLlkT/QZODOcvTYw2tA5LqVdlGbE9lSTTEm6KBxRbGiC6DM+gBmssH9
 i4zpMVsXe+iPYNs7Xw6632hp6b8BgK1XtpHxDRZ/ZrJqHCUwhSvnz5l2IhcLpo6yZwu0gegUXxA
 h1mrGDAuWG5UbTNeMECdS4LsMd9PTonmxEdp6YAK3Ke8KSDMoVNFdY00qC0baSTl3mEMETkFHlX
 4BPRpEeujC/GHlUrpiYjkUuZMi1gmt4Vta1bUmQ83o=
X-Received: by 2002:a5d:6684:0:b0:45e:739b:2750 with SMTP id
 ffacd0b85a97d-45ef1447483mr3640431f8f.9.1780065390603; 
 Fri, 29 May 2026 07:36:30 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef356a4c4sm4180675f8f.31.2026.05.29.07.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 07:36:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/dma/pl080: Don't use hw_error() for unimplemented
 features
Date: Fri, 29 May 2026 15:36:24 +0100
Message-ID: <20260529143624.158935-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529143624.158935-1-peter.maydell@linaro.org>
References: <20260529143624.158935-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

In the pl080 device, we don't implement "peripheral flow control",
which is where the DMA engine can be programmed to transfer data
until a source or destination peripheral tells it to stop.  We
currently call hw_error() if the guest tries to use this missing
feature, which prints a register dump and aborts QEMU.

Change the hw_error() call to the LOG_UNIMP log-and-continue,
which is how we prefer to report guest attempts to use
unimplemented features these days.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3409
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/pl080.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 4a90c7bb27..f9f1e3e931 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -13,7 +13,6 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/dma/pl080.h"
-#include "hw/core/hw-error.h"
 #include "hw/core/irq.h"
 #include "hw/core/qdev-properties.h"
 #include "qapi/error.h"
@@ -132,8 +131,9 @@ again:
                 continue;
             flow = (ch->conf >> 11) & 7;
             if (flow >= 4) {
-                hw_error(
-                    "pl080_run: Peripheral flow control not implemented\n");
+                qemu_log_mask(LOG_UNIMP,
+                              "pl080_run: Peripheral flow control not implemented\n");
+                continue;
             }
             src_id = (ch->conf >> 1) & 0x1f;
             dest_id = (ch->conf >> 6) & 0x1f;
-- 
2.43.0


