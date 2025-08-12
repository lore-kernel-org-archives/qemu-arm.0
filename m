Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9FFC87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 17:33:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulsrp-00009O-W2; Tue, 12 Aug 2025 13:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsro-00006r-2c
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:32:56 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsre-00041u-MD
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:32:55 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b7886bee77so4089432f8f.0
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 10:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755019958; x=1755624758; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5eXiZ5bUkWxn9g1iSl0pweK9buhzmmZuq6RlEEEEhs=;
 b=hv39cmQ3avRvn8j4Vltgvcr4U+Lu9MoLCuNX3JEIzcV74zWcQ5HFuDoADTMW08aIUa
 zJcTIVd9SS7Qhzw2qeid7my2ptOjSfEM7G08lOpNgjRX+OBoCXEq8wVXNqfqo3JK2N5s
 q00N4LKCe5T8KsD5hopHnZoMBCLZohiRFduDTHI9e1tS0xrLMG5mRbPhuHbTG8tHUM37
 bP5WkWIa3w9nXpXtyugEOsN08DxnDgZmBRPJ0lIWjXpVFiEJFVpNSIbGlb8Oq5ZExVnJ
 2VohEM+/yeI9WuyeOKFsLTwlLZ24ExDFjm4njLGDlxHhckWtFR5/8d0Ho3VArpewB1Cf
 NZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755019958; x=1755624758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z5eXiZ5bUkWxn9g1iSl0pweK9buhzmmZuq6RlEEEEhs=;
 b=iOe/uFoFdHjl+zenHsiHbo0PPmJEzg2UKdbhMZ///yN9gVTEO0Nz7CuC2VwzPtDBZX
 0kG8QZMx3Bibf/yDGACv2qej7/2XcFFj70DdftXLMluUlDYb3yAI7JNeRHF5zY5olwR+
 SL95x0cGuoxYClloP0ja1qxS1cob9Y6tpTVD3A8enxxud2TwEaY76rm93Spct58yo9nk
 Bja7QrGpmxtb61nSVkGWzuoOpWhoS6Xgtna2JEr2KgPGj/+C6CFOQOOOeGPNvCt6TW46
 9+SyDQvuCwMkn+rj8GhGVhJAqQrYdQDxFEayUtsuDYnk83VCZ0x27U9kixTlQVxhD0cx
 HTqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvFRCOvaLGTD9QjvA15YZhwBkMii3DbNT9tMfeJB2bByZkTsa9vMOrl4Tvrrr+WCEeLLGMywVOuA==@nongnu.org
X-Gm-Message-State: AOJu0YyabA+6C2GeEckJ6ub2eaVi9ZwctRnU3etnvQ29DOFV0UASCzhd
 Puj+bpP9nRhxxEDHDZSka9iQeybYBHxoM7DyhEg+5KhpCQprUvy1kGZHHJy9lRlrtRI=
X-Gm-Gg: ASbGncuKmMsY+F8+2VNs5BhzVCsUI2tMDumEeNPnRyet65Ixu98KpzmiQ1/F3CGrim4
 33LGzDsRKzTbH4Erc5O3AuKGdFfVqPIiFKnRwkZBUzhypR93rzUvE9DCK2uQVBeGqKGjHApdV2R
 FLcREAiPmBUw3zB+Yc8ECl2N/XGkVdx58WYIOJq3X0fEhOpImB00u2+wJp4dAWEQuQnUdZXDkAW
 zSWHsGF0UdZHB3JpiiCqv+7KW5ese96n1VUd7u2fhKO5aeGRxhvZVcfbSwT/pHe1VGogm87J36e
 BVBIZGG8/HYIlFDWpXM6Ll/Xl0jYKs/1ttYxv71nDHsf5na3IuBy7OVQMRA/GF980yh+yW1ARfd
 rfVQ2J8VSZEspI+BjM1WTeo9Ly8euHeseuy49cGsTL1pSQWJ3oRROsMTyEnSbxF45KCR4GVFZ
X-Google-Smtp-Source: AGHT+IFGx5zQ625lglNAX3SUghhR3SCg/Q+RQ+KvhIEwPgE/2jGLjAJPz5he0g4tOaoPan89v16jiA==
X-Received: by 2002:a05:6000:24c4:b0:3b8:d4c5:686f with SMTP id
 ffacd0b85a97d-3b9173166b4mr195004f8f.39.1755019957996; 
 Tue, 12 Aug 2025 10:32:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac158sm45805210f8f.4.2025.08.12.10.32.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Aug 2025 10:32:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [RFC PATCH v2 10/10] target/arm/hvf: Allow EL2/EL3 emulation on
 Silicon M1 / M2
Date: Tue, 12 Aug 2025 19:32:34 +0200
Message-ID: <20250812173234.86970-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812172823.86329-1-philmd@linaro.org>
References: <20250812172823.86329-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Another API PoC.
---
 target/arm/hvf/hvf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 84c0c0275d6..df63584f456 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -17,6 +17,7 @@
 #include "system/hvf.h"
 #include "system/hvf_int.h"
 #include "system/hw_accel.h"
+#include "system/tcg.h"
 #include "hvf_arm.h"
 #include "cpregs.h"
 #include "cpu-sysregs.h"
@@ -585,11 +586,14 @@ bool host_cpu_feature_supported(enum arm_features feature)
     case ARM_FEATURE_GENERIC_TIMER:
         return true;
     case ARM_FEATURE_EL2:
+        if (tcg_enabled()) {
+            return true;
+        }
         ret = hv_vm_config_get_el2_supported(&supported);
         assert_hvf_ok(ret);
         return supported;
     case ARM_FEATURE_EL3:
-        return false;
+        return tcg_enabled();
     default:
         g_assert_not_reached();
     }
-- 
2.49.0


