Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED6110F9969
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:26:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYW6-000683-SU; Wed, 08 Apr 2026 15:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAY6T-00075W-0e
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:58:17 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoL-0000lz-Bu
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:18 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2b2ae8a0103so8862585ad.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600536; x=1776205336; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bt74HgDQm6QWm4ci9bJjS4WKY7nrk6DWez5uAlhy+BI=;
 b=DHOorklYPP6rXqVpoJYrlHG+tJxrVct4yXPLrrsMestDRXNE6rRJN4ExbI5lzHKYtN
 qkMlytGs9ODbhRuhax2YDx4kQkWdPgUP5aKdXJjL6jtSC9oGddhV1YoxqVI1Kz/Uav1g
 FkutHvht07NfzdEsvTVpMrM0d3FhFIZhnMFQHvjqLaj3Se8l8KuvdkKghA4xpaKH2cfL
 x2qxB9CJQAiQcFU2uOIbMkFyLiYx9DWutgUe6+99y4OEDDgIxRjTpTbVYuTLd0qLPyfo
 8GF2J7x+vvg8eJiaLZRIkQ2GLd9VfJChL7ulCIdIsEeH+2smaHEv6wUh4wMAi+uQL5DA
 QpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600536; x=1776205336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bt74HgDQm6QWm4ci9bJjS4WKY7nrk6DWez5uAlhy+BI=;
 b=TjR6EQxhPAMDWfd809Av8Uxt7WUoz/qYc/Fx7Dxdy1yIEZ3Of2AiD5qKRWkfguE8Pk
 UF2JGT/NV6ir+hzuxtMe4wWA76b5bwkga0HPSDU64wRMu+ADTLteXV30kCWtpIkNsqyN
 n43zNi9J4OKYTZER0c4Kptba09Ku+2co2RLluoaBSYUH0bFrNT2mZCDc1lT+mHFdLrrK
 5lBui2YheP3++3dj5HgB9Etf5EYlzqATIpE12sDfJKHdPOFUBqJdqKnwjhLtSPQR9qIJ
 iVsTzYv5zG/Hw4n4GvmQkz1+wCaDCQgVbNl76j/MwpnRSLGGEPsWrtC15B87TeyVg6Wj
 /XsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq+UTESeAIAHABdAGbMjAk/L0b69///7XnvYBDEJlFPxyVcHHQQugZCg62ElJ0Ibo+HHGfKHWCug==@nongnu.org
X-Gm-Message-State: AOJu0YyB+Mop6N6IXa3Ftjstc6SHsuw4iWk+gNAcxCtO/Y9hsyAYLhA5
 4WoFGTn1Z+a8X4LSfa/qM7Mb403oOkpw78BTREqiN11LROsOeRhC2KePT4uey/POIZJJKBKJYuw
 xxm2JzeA=
X-Gm-Gg: AeBDieuSwSlMV+nlpey4w2TnTJnDx7MdeBLms4aPRagC0mdBS1R+Jy/osJ+biXnSmdm
 UAS8Ls08jc+8QF+Jx9oLFDdBwQbk9qwrQT9ca4HISe1sw5r2fmov933THCUguW7BhH3A5jgProZ
 wpcJEXU3FNHAnk+jXpjd8NxjLZZjPa0QG1VfdQU5Vw5yyGMiUartsL9HnCTfCr0vSmZze7Wo+2K
 SIlpg37bPXvMriw/Evy+5lrgniYGoeivagaLGKjGjLjkbBKEdqtdkRvjXfIY+UfmHHeqeAWVDG1
 DjFXK0AP6YEI0Yx8CvCWWrOixuvhm0yzbcbqntC/hOAjZjqHk7SMNx56xLtlg3I0D4i93lILbGq
 mW6FhfJnyrXeRbmTR6PhzZQ8mOYpYoxSRo/VdbaE72WKdmpQpdW+6o7eIpCOdXuJ3jcmqP1z5EV
 EMsRvJBz3LxqCb3wt4NqmRrwsN6/xly59atPKFRDtuwqLTWc4vZjI26uIALyqJ4ZTkic9sM71CB
 zUa
X-Received: by 2002:a17:903:984:b0:2b0:62dd:3a93 with SMTP id
 d9443c01a7336-2b28164de77mr199607315ad.7.1775600535844; 
 Tue, 07 Apr 2026 15:22:15 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:15 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 02/21] target/arm/translate.h: remove tcg-op.h include
Date: Tue,  7 Apr 2026 15:21:49 -0700
Message-ID: <20260407222208.271838-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x634.google.com
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


