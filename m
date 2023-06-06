Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3518810ejb;
        Tue, 6 Jun 2023 07:14:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6nMqIG1qBWIOYSWaH58AAIm6btgQxBIb6WhbyVBpDG/ET34+dsbmMm4k/A4hXRB9jUp/7I
X-Received: by 2002:a05:622a:202:b0:3f6:b1e9:8444 with SMTP id b2-20020a05622a020200b003f6b1e98444mr2181688qtx.41.1686060894768;
        Tue, 06 Jun 2023 07:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686060894; cv=none;
        d=google.com; s=arc-20160816;
        b=yedpZt9/mMNz8Gh3XeHooYOOZQX7xRCyVd0igYyZlqe8Pi5eQ2Nj9jeX5IhPtqYFpw
         6Nef/5Wqistpz13WI4XsDQ6+WGx0PiEnCCML+Xv1mhcEixXjT1SMePvNTffPDXj3aobt
         LlRXC1Jo5rYijSZkqhRRDfbz/697dddilHrE2TQle/y01IxljcUPqAByZf6vnzx5rxzf
         siEV0Qy4z6fZuVLveZsrTrhrYBjVZbeYTHCD+pJYACgYLLmcI2aDoPldHRNgMDzLBEY3
         BtiP+ejPBcbDEdNSv3dwvv/Tqch5A0r0WcagD6P7vNwfxN5I45oMScE62naKhQC24W9I
         kujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+/gBSuOm/dFGi2epbWaHBWKZe3zw4iREVEHEqpm1U0s=;
        b=KhSPwTqcOWUywZZ+pc0iYr8MDydFM4yR2vaFSgSIXZZ2Ql3S2/duwHgSve7Qj5d8wA
         iavFk9s0DCS+t4Sl4KRgIkm4AQCJqCOVUTFARjdCJ7WgoH/vh0w7Bq2s8vl7tHJlgqfo
         d9d5VwkQyBCSDdjv9wWxXEpPWR0L/FmPt9vb1bxSn895vfVFvPUcoxk+tRQnB0YjqEkQ
         dfUWmYSDksBIEcVIvgZ3RmH83mqJ44wJheBizYSDsZCHnPyrWSHrkHyFr8bJ78r+o1nf
         9JomjKZjgZu0gi1USxvj3MEfpcwBYupJ6f/sdC7JWf/5CXzG6QgR/04ub6EVSdKSTce1
         fYHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HtWZOuq9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7-20020ac85f47000000b003f9ac1a3849si1744532qta.722.2023.06.06.07.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HtWZOuq9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6XR1-0003y0-1E; Tue, 06 Jun 2023 10:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQy-0003vw-S9
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 10:13:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XQw-0005Yk-Px
 for qemu-devel@nongnu.org; Tue, 06 Jun 2023 10:13:16 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f7368126a6so24975865e9.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jun 2023 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686060793; x=1688652793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+/gBSuOm/dFGi2epbWaHBWKZe3zw4iREVEHEqpm1U0s=;
 b=HtWZOuq9IEoz3D7QgupgOQRLv/coATTCH+ymBFfBMjTngHXl/elW8/oxGj4WxvsYnw
 ozNfv7QVThuGmSeOh3QfNc7afbd/ty6FLtNuIN+Qln88oheNYhnkKcwoHTc3iVvjUsP7
 5c6VHPAqFSJCxKJgfTAlXQ8NerXZIiSisSP45iltciHbnj5Mi3uEc7h6ezp+TlzJmnjI
 e0cuXlrwKzRT99WuswzblU4poU+hiOXHn7OC+VRqnXWZJketyHRPA/awxf+WaEMR3aBH
 oHrC09WJ44aL2UMu5z/6HqgRq1+vS2dfi4cYFnmfwdpFgGIhzN89xDzB3hE2+uVb/K9S
 SOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060793; x=1688652793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+/gBSuOm/dFGi2epbWaHBWKZe3zw4iREVEHEqpm1U0s=;
 b=A0+Jbyr6wJs2bc7GBniJGuuusO4oUwxOO4CkEsKZ35idoToc/nNOKjbA4HtVGjtuDk
 q5ktjkr6l4QFFLtVH5I+mgQI5R6ZsW6zsdNOOblkFdsLwW99x57EO2obUl9uWcm7nOns
 Yf6+ZH5WPvbES3tqsBIriDVvZtKns6vSVsAA9Qo2paTt9n5GcbaHiIiT3PpQ+4CpODZ6
 qfn+RC4NcGwytxJ3n7iYPqgWWDe6qauXuS5p6B1Bang6bRIXHOL7A3vQeNoy/RkG80kJ
 ski4Symnlq5J8Hp4nVKzjYSr2J+kL8vAvuOZcPr8h29VY9Px8IhJ9cNYAk6xV6PZERSv
 0aHA==
X-Gm-Message-State: AC+VfDzSvVTgf9CPV5vKMCsUuPoTtE+Zl8AJTmTdmlSNfwO4z73UJmTg
 f2VgL7eCBmKEYG/rL9wdcmNlTYnxZtcAMf3nNkQ=
X-Received: by 2002:a05:600c:2904:b0:3f7:26f8:4cc0 with SMTP id
 i4-20020a05600c290400b003f726f84cc0mr2121358wmd.17.1686060793269; 
 Tue, 06 Jun 2023 07:13:13 -0700 (PDT)
Received: from localhost.localdomain
 (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr. [176.184.50.104])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a05600c219500b003f736735424sm9072246wme.43.2023.06.06.07.13.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Jun 2023 07:13:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] target/i386: Rename helper template headers as '.h.inc'
Date: Tue,  6 Jun 2023 16:12:50 +0200
Message-Id: <20230606141252.95032-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230606141252.95032-1-philmd@linaro.org>
References: <20230606141252.95032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gSvUeZSrRKgS

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename the included templates as '.h.inc'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/helper.h                                      | 6 +++---
 target/i386/{ops_sse_header.h => ops_sse_header.h.inc}    | 0
 ...hift_helper_template.h => shift_helper_template.h.inc} | 0
 .../{cc_helper_template.h => cc_helper_template.h.inc}    | 0
 target/i386/tcg/cc_helper.c                               | 8 ++++----
 target/i386/tcg/int_helper.c                              | 8 ++++----
 6 files changed, 11 insertions(+), 11 deletions(-)
 rename target/i386/{ops_sse_header.h => ops_sse_header.h.inc} (100%)
 rename target/i386/{shift_helper_template.h => shift_helper_template.h.inc} (100%)
 rename target/i386/tcg/{cc_helper_template.h => cc_helper_template.h.inc} (100%)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index e627a93107..e972e1cf36 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -203,11 +203,11 @@ DEF_HELPER_1(enter_mmx, void, env)
 DEF_HELPER_1(emms, void, env)
 
 #define SHIFT 0
-#include "ops_sse_header.h"
+#include "ops_sse_header.h.inc"
 #define SHIFT 1
-#include "ops_sse_header.h"
+#include "ops_sse_header.h.inc"
 #define SHIFT 2
-#include "ops_sse_header.h"
+#include "ops_sse_header.h.inc"
 
 DEF_HELPER_3(rclb, tl, env, tl, tl)
 DEF_HELPER_3(rclw, tl, env, tl, tl)
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h.inc
similarity index 100%
rename from target/i386/ops_sse_header.h
rename to target/i386/ops_sse_header.h.inc
diff --git a/target/i386/shift_helper_template.h b/target/i386/shift_helper_template.h.inc
similarity index 100%
rename from target/i386/shift_helper_template.h
rename to target/i386/shift_helper_template.h.inc
diff --git a/target/i386/tcg/cc_helper_template.h b/target/i386/tcg/cc_helper_template.h.inc
similarity index 100%
rename from target/i386/tcg/cc_helper_template.h
rename to target/i386/tcg/cc_helper_template.h.inc
diff --git a/target/i386/tcg/cc_helper.c b/target/i386/tcg/cc_helper.c
index 6227dbb30b..c310bd842f 100644
--- a/target/i386/tcg/cc_helper.c
+++ b/target/i386/tcg/cc_helper.c
@@ -58,21 +58,21 @@ const uint8_t parity_table[256] = {
 };
 
 #define SHIFT 0
-#include "cc_helper_template.h"
+#include "cc_helper_template.h.inc"
 #undef SHIFT
 
 #define SHIFT 1
-#include "cc_helper_template.h"
+#include "cc_helper_template.h.inc"
 #undef SHIFT
 
 #define SHIFT 2
-#include "cc_helper_template.h"
+#include "cc_helper_template.h.inc"
 #undef SHIFT
 
 #ifdef TARGET_X86_64
 
 #define SHIFT 3
-#include "cc_helper_template.h"
+#include "cc_helper_template.h.inc"
 #undef SHIFT
 
 #endif
diff --git a/target/i386/tcg/int_helper.c b/target/i386/tcg/int_helper.c
index 599ac968b0..05418f181f 100644
--- a/target/i386/tcg/int_helper.c
+++ b/target/i386/tcg/int_helper.c
@@ -448,20 +448,20 @@ target_ulong helper_pext(target_ulong src, target_ulong mask)
 }
 
 #define SHIFT 0
-#include "shift_helper_template.h"
+#include "shift_helper_template.h.inc"
 #undef SHIFT
 
 #define SHIFT 1
-#include "shift_helper_template.h"
+#include "shift_helper_template.h.inc"
 #undef SHIFT
 
 #define SHIFT 2
-#include "shift_helper_template.h"
+#include "shift_helper_template.h.inc"
 #undef SHIFT
 
 #ifdef TARGET_X86_64
 #define SHIFT 3
-#include "shift_helper_template.h"
+#include "shift_helper_template.h.inc"
 #undef SHIFT
 #endif
 
-- 
2.38.1

