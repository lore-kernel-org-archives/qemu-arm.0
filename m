Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E95FF46C6D
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:26:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oeY-0007Kh-Ld; Mon, 06 Apr 2026 14:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeV-0007Ie-2J
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:23 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeS-0002Ki-Rs
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:22 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-35d971fb6f1so3701053a91.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499979; x=1776104779; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bt74HgDQm6QWm4ci9bJjS4WKY7nrk6DWez5uAlhy+BI=;
 b=Yt+TFOndbOhGQ1tNkbotV7j6ix4qCTeKOC3hgWTPpklKQNHC+ennOL14FcLUuBbSmx
 Dtd6lDkXq0W/jFR22uCMgCuAz2A+8FDK+JJtMn2nEJWtYzK/eb58VvzDZXKhLM9Xfmqi
 /Mxi93L12FFoOQG8S7CXZmLqnVzWXDAi4EvlbK8EDZH2iBWdeKbqukWMxTyT7XYAgEKD
 wGRg9OoC+PgJbAMOT5hFJ9aYLk0UW4lbq3+HHiFyTLQ/N7ui2n7GvazrbLf6Xh6S14ib
 +P9i4U4rfCxHLKUZk0HiXm7NRXmFqJrcXZQvnTTx1NJ+N8s02Nr5Ti2SKf7awZ7kC/Iu
 kHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499979; x=1776104779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bt74HgDQm6QWm4ci9bJjS4WKY7nrk6DWez5uAlhy+BI=;
 b=il9RpzwDtIACYgosAokAG9XKh9bsC87iAEte3B8jzx8WEQZq/b4PBOSDHnKVkdEC5z
 AO2QGE9MFrwKXrywjclQuFkB/rHbu2AwHqm66BBtAYVvZpc+T7m13i1sOZAIwaMrTfMv
 aZbM3oke0uwnO4RzeGo/GPLb/23S102e0vajPZArA0XXsnAupMiM8OPgWcSo2/5C8tAf
 +RODOzMhKUmjBtunsiRoRbvhAUqJJG6zx+AneKJYS6AhpnZqtVz+zvsyawd/FDH2uyK2
 Y881tlsyXNh4AyiK3sFBgX/uhIK5u63w0Z1fi1Ihzwa5Vyf4ZdoCI2FZ9jOjDmy9YN/h
 HM1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCaGN2WYMk2wqkH/wWy/XdHnIaI+C3KPUXqYPPspPr8pFOyD+64reulGDPXVzkzuC8IHNGM4cVhw==@nongnu.org
X-Gm-Message-State: AOJu0YxdY+qJJXxWa/2Q0Y2g3NFeh+BMuZu/TU5fJ1W24CTqgsURj9Pf
 faVR8vQM9XadZ42F9tUx2p+aijXoqdBCLPmOJiD9TQEW2wMoRIhxvRyB9knZqSs0c68=
X-Gm-Gg: AeBDievUL46C8fCUUIlfDmiAYb66g+eI2KtpU3byhCLZu14vU++K2NeY8am1HNvQsRh
 nLF+vBKKmLu3t8AHFrwch+qkdi07maknxl1qCL6KlpzlmHfSJ6nLFtED9JNocKkAb1MxEbA5ROI
 K/0Ui1GZoenoGvVHK693yOIzqQGBd/nDx4jqbSpS22S7x/QoE3MUjr9cOV0pRJsvIN3ltJOYO8V
 g+yROH++nf/SUoH9nRHBSzPJP8GirE+TyVjJ9LEjl6Ykni2RXMgUzUJqpAhESZhtT5sYEhULnvy
 jRDWcvLXsUA38/y4POkg2VIYv9gSUETuqVEfrfdTB6xbx2yFrTVD/38R1NdUr98Dp5EcOmVXpku
 TyBdjLdW5oKwZnmpyxFUe2pQX18NEEwYj6o9gtKc5iCELO+wZ5v7PfX4zMwoWWfsEeL5W7FqWQy
 7xDll64VG968co+tCFG3QsG5BGxK6IGBvq81mMhpHXyG6Kl0cR/mmWppEhBJDPmCOYF3XRZKztQ
 1Qkw7Heu7xrUBk=
X-Received: by 2002:a05:6a20:6a08:b0:39f:794f:94d8 with SMTP id
 adf61e73a8af0-39f794fd24emr4650413637.29.1775499979083; 
 Mon, 06 Apr 2026 11:26:19 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:18 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 02/20] target/arm/translate.h: remove tcg-op.h include
Date: Mon,  6 Apr 2026 11:25:51 -0700
Message-ID: <20260406182609.193886-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102e.google.com
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

Include tcg-op-common.h instead, and include target specific tcg-op.h in
files needing it. This intermediate step allows to clean up every file
(TCGv, tcg_gen.*_tl.*) in separate commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.h     | 2 +-
 target/arm/tcg/translate-a64.c | 1 +
 target/arm/tcg/translate-sme.c | 1 +
 target/arm/tcg/translate-sve.c | 1 +
 target/arm/tcg/translate.c     | 1 +
 5 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 3e3094a463e..6d52606f9b7 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -2,7 +2,7 @@
 #define TARGET_ARM_TRANSLATE_H
 
 #include "cpu.h"
-#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-common.h"
 #include "tcg/tcg-op-gvec.h"
 #include "exec/translator.h"
 #include "exec/translation-block.h"
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5d261a5e32b..35ad7530c4b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -23,6 +23,7 @@
 #include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
+#include "tcg/tcg-op.h"
 #include "qemu/log.h"
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 7d25ac5a51f..08254b088ed 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -23,6 +23,7 @@
 #include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
+#include "tcg/tcg-op.h"
 
 /*
  * Include the generated decoder.
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 5bace3fda1a..aa7d72a35ef 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -23,6 +23,7 @@
 #include "helper-sve.h"
 #include "translate.h"
 #include "translate-a64.h"
+#include "tcg/tcg-op.h"
 #include "fpu/softfloat.h"
 
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index f9d1b8897d2..56ef1e0eb59 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -22,6 +22,7 @@
 
 #include "translate.h"
 #include "translate-a32.h"
+#include "tcg/tcg-op.h"
 #include "qemu/log.h"
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
-- 
2.47.3


