Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1371630ejb;
        Sun, 11 Jun 2023 02:02:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6av9cXEVQwuxjPKSHDsQu9XpogNuNjgDxmJZXuEPNY91Jk5RkOTJewmmMHIQ516gYa9qkT
X-Received: by 2002:a05:620a:25ca:b0:75d:d1e9:ec01 with SMTP id y10-20020a05620a25ca00b0075dd1e9ec01mr7548932qko.68.1686474132188;
        Sun, 11 Jun 2023 02:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686474132; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/L1o0wIE4elz4iq2tBQ3qdXJ1J2+N+R3+7uRYhiaKuXPaW57rMnrePayzVhYoLXLf
         7nexx5vdtKgmzwDgqVPCjJjRStookgXmSXowiVBWe6pmZVRSiu6XqliimzURzmo2hFHI
         Aikw6A8bWzzTcLj8UMYlpns0eI5ZDN55J1icnKQTz49D7pjCEjDrbDkLrCyXqU07oTkj
         q6f5cAbmtSfVn3vqYb+3jPocwlQkqbD6COV2lEsXp8YCH4SxI48dtMCVoIGNKYP/LjqY
         rrK6ZRE+ZgBXi1qdvDHslTGHJ9xnKieDw8qShz15Wfykf6xZPUAVOT/IrzubHcgc/yGG
         78Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3c5LLgM8zqCm+VTMgGqUz6vtedxBGV45kgOdre73KRM=;
        b=p7RqnP25Z5SveaWtFXETAynWwz8avrhBI3dvF+rIccjPhjhKP2XEDYFYYXxe5v3nsc
         lTvYmD5J25VkqQNeOEP1lttg9GU1u/8XVNsZx33pzkxy0dLpABeC4Oug18eOojHBYM1W
         jl0drm/VPNE2YyypUEGQyGVzQC6uYKekEO9+XWsodjwFiWLKGKKcZYx53+714QgxH006
         OMUJxRPzMXBlWByfK6EFns0ziPqM6Zru3Wh7pgybbaT65STdGh3x5kYCknvtu8EZqb/B
         Md1JUD2sZzADJqle8dmLOR62XlfY2cl15J/8XGHFPY3ukoT2d1n7ubTGDTXOKeA/fzlG
         fXmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tv7At1gm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8-20020a05620a126800b0074e0144148fsi934675qkl.763.2023.06.11.02.02.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 02:02:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tv7At1gm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8GxY-000583-QK; Sun, 11 Jun 2023 05:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8GwB-0003Kp-TT
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 05:00:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gw9-00048g-Go
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 05:00:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30ae901a9ffso2970224f8f.2
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 02:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686474036; x=1689066036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3c5LLgM8zqCm+VTMgGqUz6vtedxBGV45kgOdre73KRM=;
 b=Tv7At1gmt7VmV/BILMQQibm6etqqfIHfsQNL8jOqLkgVeMYpjdHmOqqESbyWFSxie8
 pFV39qhZzQOvE4XdyBAokoIv35DlGiOxl5zraIgLguvKxHKOefeYjwDTNvbJxB29d8IE
 pj9Mhcs2a8ol/JlqzUyUYOg7onC+cRnFub0Io6FN7E27pKD9W+d5uuraWuOyGkj9an5f
 CJPND+lcOMjLsM6AQVDweOsy43w7+9LKyMp1C5g6qFvzQGoJBHL+5+zxkNvxBGCGo+2A
 dhm3+pnZNoGlfU4c0E7trdjHpa74u6rOc1fZRU2hIdFWHDBbTR8UCHKwvpflZRpmFR4Z
 DUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686474036; x=1689066036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3c5LLgM8zqCm+VTMgGqUz6vtedxBGV45kgOdre73KRM=;
 b=WawKL0nGnwMglJokR9pkClgX2f5+XvL0bAUujQWZEM5t4W3ssttirCF6BgSGxTMpjW
 R32yZ5sS6DX4Lqemwklr4ilzheAQHP+T1TAKnq0r6zKfE8GdFNQkkBlbLm4qC3rRQfEF
 jEMK0RdvZ7eVdR30cFpEYwpujVZIkvNbtOqFe0sUGC8M/hvAv/C950r9Uh9VTBjTs0yv
 bSJiAkp9MoO/G1cHSfOlbWXBo9qR8ElIkuVFBsn72KwLdhqHIse7qS4M8IMZIGwUeZ2k
 sLqy+zViLI7Xj23XIcn2nz3NrLLWk3mt1dsiz61ihKku37YVxrdKi/lz2BW5gp9vWx5W
 nXKg==
X-Gm-Message-State: AC+VfDyoCYrOJYJbKJwJHR9OvcKa/OpxuZoNoAqAjpjcDYj/CoSJXgF1
 SG8914M55wmA/acySWeXYJATGw==
X-Received: by 2002:a5d:5543:0:b0:304:b967:956f with SMTP id
 g3-20020a5d5543000000b00304b967956fmr2723982wrw.8.1686474036139; 
 Sun, 11 Jun 2023 02:00:36 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 e7-20020a056000120700b0030af8da022dsm9093350wrx.44.2023.06.11.02.00.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 02:00:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 25/26] target/arm/tcg: Rename 'helper.h' ->
 'tcg/helper.h.inc'
Date: Sun, 11 Jun 2023 10:58:45 +0200
Message-Id: <20230611085846.21415-26-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k5xxEUBnsR1y

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename 'helper.h' as 'helper.h.inc'. Since this file
is TCG-specific, move it to the tcg/ directory.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/translate.h                | 2 +-
 target/arm/{helper.h => tcg/helper.h.inc} | 0
 target/arm/debug_helper.c                 | 2 +-
 target/arm/helper.c                       | 2 +-
 target/arm/tcg/crypto_helper.c            | 2 +-
 target/arm/tcg/helper-a64.c               | 2 +-
 target/arm/tcg/hflags.c                   | 2 +-
 target/arm/tcg/m_helper.c                 | 2 +-
 target/arm/tcg/op_helper.c                | 2 +-
 target/arm/tcg/psci.c                     | 2 +-
 target/arm/tcg/tlb_helper.c               | 2 +-
 target/arm/tcg/translate.c                | 2 +-
 target/arm/tcg/vec_helper.c               | 2 +-
 target/arm/vfp_helper.c                   | 2 +-
 14 files changed, 13 insertions(+), 13 deletions(-)
 rename target/arm/{helper.h => tcg/helper.h.inc} (100%)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index fc6357eae8..940347b6bd 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -8,7 +8,7 @@
 #include "exec/translator.h"
 #include "internals.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/helper.h b/target/arm/tcg/helper.h.inc
similarity index 100%
rename from target/arm/helper.h
rename to target/arm/tcg/helper.h.inc
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 31165b92a5..b32852e947 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -15,7 +15,7 @@
 
 #ifdef CONFIG_TCG
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 523f7b7765..2bdf7b0d4e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -26,7 +26,7 @@
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 1b6b105527..15faa7455e 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -17,7 +17,7 @@
 #include "crypto/sm4.h"
 #include "vec_internal.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 56c2f01532..b8ee45074f 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -34,7 +34,7 @@
 #include "fpu/softfloat.h"
 #include <zlib.h> /* For crc32 */
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 83a1aa08e4..e75cb0100e 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -10,7 +10,7 @@
 #include "internals.h"
 #include "cpregs.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 1991eafe05..4100161775 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -24,7 +24,7 @@
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 24205074cc..e1aadd63f0 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -24,7 +24,7 @@
 #include "exec/cpu_ldst.h"
 #include "cpregs.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c
index 2822a6b96a..e00b9b1493 100644
--- a/target/arm/tcg/psci.c
+++ b/target/arm/tcg/psci.c
@@ -24,7 +24,7 @@
 #include "internals.h"
 #include "arm-powerctl.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index e663aef2fd..3f8cb358a6 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -10,7 +10,7 @@
 #include "internals.h"
 #include "exec/exec-all.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index fc7a2804f7..f44b9415ec 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -41,7 +41,7 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #include "exec/helper-info.c.inc"
 #undef  HELPER_H
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 325a231de9..46f347a8c3 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -24,7 +24,7 @@
 #include "qemu/int128.h"
 #include "vec_internal.h"
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 51f8e92ff7..38faf99073 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -31,7 +31,7 @@
 
 #ifdef CONFIG_TCG
 
-#define HELPER_H "helper.h"
+#define HELPER_H "tcg/helper.h.inc"
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
-- 
2.38.1

