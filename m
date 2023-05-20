Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276796ejb;
        Sat, 20 May 2023 09:29:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6C2wCGBzDS9S6w3+PEfhykyuJW+WWTkl51RKdmyxZ43oLnYELySadLjRN6KlZLjELcl+AZ
X-Received: by 2002:a05:6214:301c:b0:623:686e:e41e with SMTP id ke28-20020a056214301c00b00623686ee41emr11276985qvb.15.1684600179377;
        Sat, 20 May 2023 09:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600179; cv=none;
        d=google.com; s=arc-20160816;
        b=YPo75Vp6FuKc0aeT8l7HVHubehWSa0xAVxaVQzdlLlc4eCqI3p8EmYee+pvICXwU/e
         07BOxmJfhY5YsQgFxpyJNSN31DeG7PT4rpAUUqs8wJUo2XphydB+EQbnEz8a/StWOBaZ
         3OD60HCNO7rcFsF8fwG2Pq7/pHJFTsEbpw10G7a87cxWifJm4V5dX1gk+p5R+mPgJjJZ
         FfqUVqzl4OBObpbNyz9bzp2jB4GB5S6IyefKw/F5av8hwJ9nh/Fz6T4u3jr1oKTmTKm0
         YtBmf41kukHN7q8e3vAOQEptGk8Q1NGy1kz50XClbKH/4jFNyLbgWu8os8QzApQIY1Hb
         05Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1Plm35dUE66Q3yWg+6SkVizMCgYtBvFECTpZ00ZQ+pM=;
        b=Yr7hj+VsMxFqyDIPUYYeqv9zjxoQ9UNwtMcd8h1TVcSSQQgAgJBfnI5aBymtR/7KH+
         UJ7Hyqt7KU+rfdtnivOJEfK0Suqgj8E9AZtLFZgSb57uMMLjNigzl/zNoAxNWhvOfmsg
         LkBZ6HMXHSnloVrEdmnEIeFSHCKDlx7O9UE5UMfm841FrU6CMcUGbqRhY3BOb/lX15fS
         Hy1A5y0XBLNVRvNJBxShTVC7V6HNyi9+I4+iS5dr9PK+zzwq2HHQB0xVtQu3bwr0rn4/
         DGDrKv4AegpAFnIdGVmGd9tiNC971bwL1O653nmx1kbltpIZywTx5lVh5D47YvE9k9SC
         jN+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qdVu7HsJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke17-20020a056214301100b006215f68b342si1225985qvb.198.2023.05.20.09.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qdVu7HsJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q0PQR-0003vN-OP; Sat, 20 May 2023 12:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQJ-0003mt-9l
 for qemu-devel@nongnu.org; Sat, 20 May 2023 12:27:15 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQC-00034A-Ky
 for qemu-devel@nongnu.org; Sat, 20 May 2023 12:27:15 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1ae8de081ccso9157615ad.1
 for <qemu-devel@nongnu.org>; Sat, 20 May 2023 09:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684600027; x=1687192027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Plm35dUE66Q3yWg+6SkVizMCgYtBvFECTpZ00ZQ+pM=;
 b=qdVu7HsJyKzcF/SXMi+QAjlBa6PoQzAIuj3X/cwjIZ2bCDDd6Dbt1f6IwDulOKnEG8
 HJhBp0T+ARPB4j9nyKtijEzqZc0ZlSFhOXJiOpFElsAbY53arqbsqpoem6l+cnJPwL+t
 EKTH83FlWt++EpGFK0fUQ3ZXhASPaStvhN5azH4UPRKUVTkU0DEpegiJXA1uLElkBbhd
 mqOuHXi4XFHlwVIMilgZtxOXkSg8HYEA0GFUPYn9AOhE46hIrz4vAb2CrGomtY37ZlIz
 Zz0oQrYzltKxtj6wzwDvEdi7UmIxEGfA9cM4J3dvMP73pEBIwcLGwviBz+Mbz6FnE9xA
 ta/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684600027; x=1687192027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Plm35dUE66Q3yWg+6SkVizMCgYtBvFECTpZ00ZQ+pM=;
 b=ghkL37dn19jN/0lj690XYD5HyReBNI39Slo3U6GfIJA09JOL9vHRHeMh+YstZHrpFl
 kmYYGB+n1Sy+uZXrZxT5i58YJsqytnuvYQRZxtW5OX0LeZGsvMWiOBbSKKfoakKkgNIq
 /HusvIpGhlAFjN9iG1M/zemU3+tND5IEdiFPRY12214kJwm8pGHawQh//l1ToKynnFOR
 TaiM1TluPZsEkQve127mXii0hlwDXh/ukCN1ASQajr2TB6OQC+hhBrKGJgvQSrMV5YT8
 zX5hkCVKdlYsLZMN+Pbt9sFLHzfqdh8WuSTeqP1oPm6SLfXNPAkKvmX3Ci/lTBrpBnVs
 j2aA==
X-Gm-Message-State: AC+VfDzxKKDxlPu+efpwEWen9M6g0LprQKQTVktL+7jXO2DZ1AFs1J3q
 ObtEH+uurVAJeYeWwRPMV4+8GrEpf/cTpZuEJ5k=
X-Received: by 2002:a17:903:2287:b0:1ad:ea13:1914 with SMTP id
 b7-20020a170903228700b001adea131914mr10974248plh.30.1684600027284; 
 Sat, 20 May 2023 09:27:07 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:27:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 24/27] tcg: Split out tcg/debug-assert.h
Date: Sat, 20 May 2023 09:26:31 -0700
Message-Id: <20230520162634.3991009-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: meErHO+Hj7st

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/debug-assert.h | 17 +++++++++++++++++
 include/tcg/tcg.h          |  9 +--------
 2 files changed, 18 insertions(+), 8 deletions(-)
 create mode 100644 include/tcg/debug-assert.h

diff --git a/include/tcg/debug-assert.h b/include/tcg/debug-assert.h
new file mode 100644
index 0000000000..596765a3d2
--- /dev/null
+++ b/include/tcg/debug-assert.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Define tcg_debug_assert
+ * Copyright (c) 2008 Fabrice Bellard
+ */
+
+#ifndef TCG_DEBUG_ASSERT_H
+#define TCG_DEBUG_ASSERT_H
+
+#if defined CONFIG_DEBUG_TCG || defined QEMU_STATIC_ANALYSIS
+# define tcg_debug_assert(X) do { assert(X); } while (0)
+#else
+# define tcg_debug_assert(X) \
+    do { if (!(X)) { __builtin_unreachable(); } } while (0)
+#endif
+
+#endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index cd6327b175..072c35f7f5 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -34,6 +34,7 @@
 #include "tcg/tcg-mo.h"
 #include "tcg-target.h"
 #include "tcg/tcg-cond.h"
+#include "tcg/debug-assert.h"
 
 /* XXX: make safe guess about sizes */
 #define MAX_OP_PER_INSTR 266
@@ -222,14 +223,6 @@ typedef uint64_t tcg_insn_unit;
 /* The port better have done this.  */
 #endif
 
-
-#if defined CONFIG_DEBUG_TCG || defined QEMU_STATIC_ANALYSIS
-# define tcg_debug_assert(X) do { assert(X); } while (0)
-#else
-# define tcg_debug_assert(X) \
-    do { if (!(X)) { __builtin_unreachable(); } } while (0)
-#endif
-
 typedef struct TCGRelocation TCGRelocation;
 struct TCGRelocation {
     QSIMPLEQ_ENTRY(TCGRelocation) next;
-- 
2.34.1

