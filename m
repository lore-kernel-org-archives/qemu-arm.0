Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4A5CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 22:03:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEEG9-0006W3-Np; Wed, 29 Oct 2025 18:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEEG4-0006Ps-Rz
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 18:03:10 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEEFw-0000YO-IB
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 18:03:06 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso1023073f8f.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 15:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761775371; x=1762380171; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5WTJOJ90ouZPZfgirhdorA0+I+5S3/ChJi6dZ472hg=;
 b=PuyAoEVQ15i+ouXuayMQEpjoRQureHrf85jWjPVFGzYaXv+OtmAIw8+gihmPcfNVuP
 qBoZGd5U8Td9Q1pa0CShYl37Q5/tS6mOcWb/LFKh5na3E+4xeVo1WXBzHS+4wF0v8qzQ
 BPy0WxWwyxpBRZ8XOFE3yl4eXo7fO5IGT9DS51hqNMx/glo0T8V97kzXvf/VHRTg4qYT
 MPxxlnZaI6uxdh8YPbusaELQtAtJ0LZYIA/1Oyo+uIhT8RPWb3DdgS7lWcbZZVW+Ovk3
 sz+EMbZqKhUR/cL2okbiaYhDVvLddbWhC01RTv4vT+Bm8xEYYgngLPj3FGD4auGzP9Bs
 DgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761775371; x=1762380171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5WTJOJ90ouZPZfgirhdorA0+I+5S3/ChJi6dZ472hg=;
 b=Ur3XDnhHO7tzFM6w0QEQ9DJ//Z6cPSMc7nn2zRMmuxv97bdV/xvLcQGSYdzapIzyir
 7eyusmxGCLPFGYFz+kAf7BM3exomo11f1EHxceK11/XPzdPk/ich2xADahysk1Ae5EbT
 FCPnNIMVoMcOvHC7bmQABEHCX0rANHkaA2714hqPHI1dSWpB9jhW3f1CgZu+5ep2LFAp
 JaPQQXWpA9Kw4Szs2nFaZAHVHzttjszz/jUvkz5RJBDOQIweDKO2RU7YkKxYEI3WNqID
 J9HjBjoCcnB1rURZ3mEgSVlf/qHZLhrTEqxa5xl0+RKvZKg33HYtbL+gS6YoScxBYK75
 rwnQ==
X-Gm-Message-State: AOJu0YwnHHaInVkwuhXfZyFEabl8KKH6IMjT8rA6clWIlCkAsUA4qdip
 iNpAbMTV/hrV/Wz+TdLpyd7nugspC1Sr/7q14gE1N/mI9kpY+fomjZ6lTIyyjcq7jXzZlzFeQzE
 dTcn34Qw=
X-Gm-Gg: ASbGncsbSQrrNJxqrQaGrdfm3uPoT6DU85XvK0VjALAcn6R4Kh3TV6oaboZVjyM/BQP
 9nW+jEVBIAGHSgTTP1bHoBUgL7lU89YqUJGVcOpniAC5xl+xXyFjIbsewzrcPWDDDMGM4j5Y2GQ
 2ltVwYKZXK6yFQESkFIcpfogJYG7dF7gM7rm8VmRXglGsRSKImE1vo06LBhWDNj7rjCFmvfFnVP
 S+tfqyrgcKdKVChzq6wZUzV2Qix9oudCu9ZfCC+o9Hg5ms11xUalV8nm87tXTiSXRRCyJ+54jMZ
 UuxIUJYSmfHQzWTkQ9xi/WpnqE23a3LJRfe4yNMkkFuElMnVQvBy/sR5ZI9NH+z8hVajbZhRXKB
 TX0iZ6qL6bc5zl95G7Mjuj4rjUY64gXUcStFtwFrcQIHkuNqYQ/jAJX75NmK+oPtE2ghT5drtyR
 UQnENyaTPJqWPQ93SUl4OlSTZQq2I1EGQniXwSRWVp+15E/QWdVw==
X-Google-Smtp-Source: AGHT+IG55gEW4cTyrKappFPyhD2OJeyPRoKdvjjfZ7jhh54rR2ddxZavvlHcLaQuPUhm2TYFyHyuvQ==
X-Received: by 2002:a05:6000:1843:b0:425:86b1:113a with SMTP id
 ffacd0b85a97d-429b4c68afamr1090786f8f.16.1761775370842; 
 Wed, 29 Oct 2025 15:02:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728999a4bsm4832635e9.2.2025.10.29.15.02.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 15:02:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 21/23] hw/xen: Replace target_ulong by agnostic
 target_long_bits()
Date: Wed, 29 Oct 2025 22:39:58 +0100
Message-ID: <20251029214001.99824-22-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

Both are equivalent:

  target_long_bits()

  sizeof(target_u?long) * BITS_PER_BYTE

Prefer the former which is target-agnostic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Message-Id: <20251022140114.72372-3-philmd@linaro.org>
---
 hw/xen/xen-hvm-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 258014370e1..b40ae0b3af0 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -2,8 +2,8 @@
 #include "qemu/units.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
+#include "qemu/target-info.h"
 #include "qapi/error.h"
-#include "exec/target_long.h"
 #include "exec/target_page.h"
 #include "trace.h"
 
@@ -455,7 +455,7 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
                        req->addr, req->data, req->count, req->size);
 
     if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
-            (req->size < sizeof (target_ulong))) {
+            (req_size_bits < target_long_bits())) {
         req->data &= MAKE_64BIT_MASK(0, req_size_bits);
     }
 
-- 
2.51.0


