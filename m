Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D532110F284E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:48:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AJs-00074z-48; Fri, 27 Mar 2026 12:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AJ3-0006ea-Aq
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:11 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AIz-00038m-FB
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:09 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2b0c30b517aso8739075ad.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774629898; x=1775234698; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2jhG0JdJkpzPMpSo2GG9wEa3WbWFhcOQfxGH9DnApU=;
 b=zAzmJm0V2T8Gz/bPfqtsoEEBaGwx0nBVgTx/vv2I+zixhtoj3+CyUEFDHSSLAmpize
 t9UBA4wG7YtlQuRK4LA5whnnFv3X3Q778Pxw+f8YenhV0slVhC+tqYTAga6cfUaTnLd6
 vko/C7+QHTqfo1DlqLtJs8kH1kXjncbB25WdK3kvG3Do+I7rkaHf2lPoNf0MQH4N+DCU
 vy54hQRqj95jamhRxsUytEUgHUm4sNAvjhFAMrA08USEOijIxiFSLl4nDJYvXaliltXA
 8P8Eja/eFBvMXoWBXoTpocbfG2irAn1MplhIgpcPYIjvLz956PewKLHrR7/2ImlRg5tX
 C/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774629898; x=1775234698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r2jhG0JdJkpzPMpSo2GG9wEa3WbWFhcOQfxGH9DnApU=;
 b=HIKu+3EY2R5JFfsdCj1eWgOkGPyGfohu9YpzcwxAHIQzX9M4iHnv4TANWtSNDxg55j
 HHTng/zHAi2UJMhPtobyt1am8rDaU2P92w/tp5IgC5NhFEdyRyL+UnLEs3Y0bHO5S31y
 VedHYO2p0tmaaLrLsxS3gg/WxOueXuZrrdeLesmRs1K2lVCXciTEQbho3RYZkjtGM2rX
 mildo0otd46fq/IYhaCQBg3c5sgfPgRIKD9FtS/F7b3/yci5h6CvP9IcGUcFQG4bcik+
 TmzM7/BrtAgY+fmVUlMtigapCKeO4WnQHNqtM5vfvW3W/JRh7AkgPM9m2jy8z8glLBFP
 Ok5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU61DBuj+O5Bg1ZP0Za4U22Iu7RdZFhdbUQtGzQUpg3RQXOaUTrZA53lBzgTaKVGD+BVJlJ5x7nqw==@nongnu.org
X-Gm-Message-State: AOJu0YzdjQPSAMKR1CtZIIkCh/Bg/ZW4fbB+KEQyPG+rOZaFAB7bzIJk
 kCXUCQoUNB//vSKVqI3WcFd4F6rj4+4KjvEnD6ZkoAOOmdHwSp69Wiq5Y6u0pkFe99qVFDosZIV
 3HlBxpfE=
X-Gm-Gg: ATEYQzxRN0gMJvn1EkpurN14fiDzFShIgEvl5SNq+c5fpnMmziadPAzDZwN9VwAmJHq
 kmtqlUbeoimBCt/0EkoxdCMmNabp8G/R8rTX9jNsCbf2kfYbfRKDgBMRaQ0M/7AW0stmLb6QYdC
 9EHCBLX+G+CPNW/tNvslp/y65ouZOAECbVEjkT8VR3p5xVu+uvn+3Z2BqlV1aik9IxCuc3ONjFV
 81m/qOzQSq3H0RF5Gy6ePrpqiGMeEsj/CvylOgz4ncnogzN8C9I7+PHlPX2TNyDgXzqGxC0ExrU
 1xAS0Zq0/kTUpbaVj0tcKcxcwrWjnCzKEqX3PXY3ZayLfabkTYplqiGoCjydXqSh5Lmu1dm+Y+9
 WXJM9Juxn9DYIr8D2lPae1bYZqQ3deFrfMgYeIatNuLiiRVWmMqXT9BiDJy+zwrpt4Wxhd7EbJ1
 UElIccX16mgNOv8Wb/ZDusIt48J5BLHDj1LlLFevGjstK9u2x1roDwzIuFVGXswoLSyptigq35o
 R90
X-Received: by 2002:a17:902:da83:b0:2b0:bed1:46db with SMTP id
 d9443c01a7336-2b0cdd97682mr36381145ad.45.1774629898181; 
 Fri, 27 Mar 2026 09:44:58 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc882339sm63890655ad.43.2026.03.27.09.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:44:57 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org, philmd@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 03/12] target/arm/tcg/translate.h: remove tcg-op-gvec.h include
Date: Fri, 27 Mar 2026 09:44:40 -0700
Message-ID: <20260327164449.596767-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
References: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x634.google.com
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

Include tcg-op-gvec-common.h instead.
No target/arm code rely on target specifics for gvec ops.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 6d52606f9b7..e28eac54afb 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -3,7 +3,7 @@
 
 #include "cpu.h"
 #include "tcg/tcg-op-common.h"
-#include "tcg/tcg-op-gvec.h"
+#include "tcg/tcg-op-gvec-common.h"
 #include "exec/translator.h"
 #include "exec/translation-block.h"
 #include "helper.h"
-- 
2.47.3


