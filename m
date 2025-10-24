Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0AECCF9E0
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:43:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCNgs-0000eX-2Q; Fri, 24 Oct 2025 15:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNgm-0000da-7X
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:43:04 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNgk-00038v-7Y
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:43:03 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-475c1f433d8so20143595e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761334980; x=1761939780; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=769iWgY60OlZK01l+9XhxEq7r89R7EBa1iwDi8rTPRg=;
 b=Chld+oy/m6QQ3IJTFlAYwJqBj468NnB+ZUbzV8qWtc3o44GfLLCGLdpBNIbnyh8s0E
 cFCnK/H1b4R/zUOODW8/U0ZNhZH3Dph3G3sdwnewatpFKF7ndeFHdGdHZw/bxH1Lj63G
 qp5FqbQ8BirKtdu7GWY5UqYjE1QdDvjK2/dODTqhZML0rEFtlb7+S3OmUaqd1vsKbgcu
 rVp8mV1EVSEsNrujT9L8TqzR4BXCEgM+1Yeq6b+Y1ijoI8hoe7/aA1SaIPOHL8KWfItr
 SuatA/5lM/0trDA+DUfC6xQXsxh9oRW78EOhYwlGZBaJMzsF4aQHQA6FPuIMdkbUMtD1
 tw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761334980; x=1761939780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=769iWgY60OlZK01l+9XhxEq7r89R7EBa1iwDi8rTPRg=;
 b=bgwlLQ9aTJFT/FKkTSXr8cLQTkKZl52dPT/y7+Ql4fXMwIOJfuenrTBxIVh04IiTXh
 QT49zbnovgnqk7IdBI6iJCEecKQLweJeVrEUJxkABUQw9DQCcvz5Mi0dsXu5W7hNLI69
 S7YkEnqjpoFUGS67bLDnzq/QdrL8AgQk3st7pHp6EV0rQumZA1emsTtO4+TC7tRzYm+h
 n//cXLXDrkqe/mwigVCIO3j4BRed5P+XLEq63aS59pmEvVUwp1wsEFW77Im5OH7GaFqd
 MOX9DhURJhsEfiLe0gFPGcndpvReJE0zOjSJxaa4b6vuzN5G0VF8iwxOCTnt+tw7h89x
 7rmg==
X-Gm-Message-State: AOJu0Yw+b0QMOSXP0Bw93yEqpQw+W0wg6l7hzByyaKPEkJthyAVocTve
 QB9ebBe5nZqICEIeaRJ7e+dCyiWluA7udZTFDtL1aG3b3Xkbywt+iDGyu2Vsl3Yb7QQ=
X-Gm-Gg: ASbGncsdE8+2qJSj6YrQ4Ifmpb6DveJ3mp8JMlzMVl3xnDFSdJJuwpP8cRhgraDps+x
 SOGMqkf+UUPG7nn5RUyfSujD0Rgy/m5BIAWgq55Oj1T+Uu+b/b6oBMWC2FruzdQisCxUt3aYXzU
 /zyOzGTtelbKworfPMHX8Gg9hZh+WfWbByLLPu0oYMxTcRBiGJJenxCUw94enJ13tHVmXiqE4Xe
 pjs9euo0hViyJLFhyQre54nHIaMSUpyC65mlQSoeWzcqCJ6qHsyFGBQ/ZJdDgkbDLZeAPqZRRJL
 Q03lotem5irUl1M0aOC4chNDoCbjaOO9AP6AVQT2AfwK0mixClWXwqq5grBTuGyQY0y2lGx9hnJ
 AyUa3821kBpDWpLkDLP4eGfEwypCwcgHpmBHj39fjigdFqgHJm/8fErJdIdabkUQQO59ExEod8i
 F/p2ARG8QwLTI/KCe7RrxddQrqRPmw4GE6q4O+g3Xu4wl9JVu7iw==
X-Google-Smtp-Source: AGHT+IFWb29gcfQca/ER+BJPqO7aaqpfQSFwUlsK9eveXaILCnQc1djGh0p3zJ6qYEW4EAd1XFXiAg==
X-Received: by 2002:a05:600c:470d:b0:471:a98:998d with SMTP id
 5b1f17b1804b1-471178a4ac3mr203706195e9.12.1761334980264; 
 Fri, 24 Oct 2025 12:43:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf2eb9csm105240475e9.14.2025.10.24.12.42.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:42:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 25/27] hw/sparc: Include missing 'system/memory.h' header
Date: Fri, 24 Oct 2025 21:04:12 +0200
Message-ID: <20251024190416.8803-26-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

"system/memory.h" header is indirectly pulled by "hw/sysbus.h".
Include it explicitly to avoid when refactoring the latter:

  In file included from ../../hw/sparc/sun4m_iommu.c:28:
  include/hw/sparc/sun4m_iommu.h:36:18: error: field has incomplete type 'AddressSpace' (aka 'struct AddressSpace')
     36 |     AddressSpace iommu_as;
        |                  ^
  In file included from ../../hw/sparc64/sun4u_iommu.c:29:
  include/hw/sparc/sun4u_iommu.h:38:18: error: field has incomplete type 'AddressSpace' (aka 'struct AddressSpace')
     38 |     AddressSpace iommu_as;
        |                  ^
  include/qemu/typedefs.h:27:16: note: forward declaration of 'struct AddressSpace'
     27 | typedef struct AddressSpace AddressSpace;
        |                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sparc/sparc32_dma.h | 1 +
 include/hw/sparc/sun4m_iommu.h | 1 +
 include/hw/sparc/sun4u_iommu.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/hw/sparc/sparc32_dma.h b/include/hw/sparc/sparc32_dma.h
index cde8ec02cb6..46ed0a20d88 100644
--- a/include/hw/sparc/sparc32_dma.h
+++ b/include/hw/sparc/sparc32_dma.h
@@ -5,6 +5,7 @@
 #include "hw/scsi/esp.h"
 #include "hw/net/lance.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 #define DMA_REGS 4
 
diff --git a/include/hw/sparc/sun4m_iommu.h b/include/hw/sparc/sun4m_iommu.h
index 4e2ab34cdef..dd09a72c525 100644
--- a/include/hw/sparc/sun4m_iommu.h
+++ b/include/hw/sparc/sun4m_iommu.h
@@ -27,6 +27,7 @@
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 #define IOMMU_NREGS         (4 * 4096 / 4)
 
diff --git a/include/hw/sparc/sun4u_iommu.h b/include/hw/sparc/sun4u_iommu.h
index f94566a72c9..fad71264408 100644
--- a/include/hw/sparc/sun4u_iommu.h
+++ b/include/hw/sparc/sun4u_iommu.h
@@ -29,6 +29,7 @@
 
 #include "hw/sysbus.h"
 #include "qom/object.h"
+#include "system/memory.h"
 
 #define IOMMU_NREGS             3
 
-- 
2.51.0


