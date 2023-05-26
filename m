Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp812891ejb;
        Thu, 25 May 2023 17:25:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Ouxm/tQN0RMHIYb26L2bLfBKOBjgJkq1KZhwVBWNb9iTOtRENxNNA7IairieoI1q2oNiD
X-Received: by 2002:ac8:5795:0:b0:3f7:fd1f:9e4c with SMTP id v21-20020ac85795000000b003f7fd1f9e4cmr304316qta.2.1685060750541;
        Thu, 25 May 2023 17:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685060750; cv=none;
        d=google.com; s=arc-20160816;
        b=iEucNv7JuehwPZwBjxAHE4R/tGeLI0AN5iHwCCGBrU7mGG3BzFwZMaYu5Ng72W4WEP
         J6r4gYjQp3pvY8djGmqerfrtI5bfFxWfxy3yNR51SjaPS2wO6/J/LALBpZ+Fa/trAmDB
         T1ppPUJ3zS4CWFF/u5qWogAdgzgfW0nW95aPnKhvtnhqwtqLSIbbALigxsMjBNBx0g99
         +Fp8H1RrC/efeZWnkhsqhTUQ92WFAufxD6CFl8P5tg6c8u89HMCA9JjMcEAUbaZ0u/oM
         X3Tl+u+o1m8eotE0AizDgYiJ89gyZxW+rKSJlosp/5sU2UdrZ/QKBYLMCodIyDSnpChs
         iMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8PelXVvmbJtXORMvHTpXHymW8juD44eXP1zIzDNEopo=;
        b=DpfgH2IRejRNmcx8bPmyQ9eNljS5MHUlu2WYd9JwtKHsyDVpzVVWXeSgJlA3rvgNrp
         gytHvvllg7iSqRuQx/KskoZs32+cFxqN51hcsK3YAQHvc09CpICFlz5kMrDVVaDYaC7Y
         wrFPnlsK7nx13xwe26hWZjUT5OC4pr45pxiL3MZnlzcESrmiQj+VM3W7dw/yydZrTFZ8
         8XWQnNcseXxbQ0BwQij4V0Mq3FAg3hoggU7L1EnOXAZTIvHK43t7mBqvtAy/8oVZLKkA
         DvOgwv5ufcSZWnUVGe3zVoW2yvg1LBM9aHEWdqdrtslElVbnt9z2JrATkQMX88O9AkWc
         bZBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQY8ejxP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t32-20020a05622a182000b003f43703e2c2si930113qtc.400.2023.05.25.17.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 17:25:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQY8ejxP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2LFP-0002fy-Oh; Thu, 25 May 2023 20:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LFN-0002er-UB
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:23:57 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LFF-0002Ck-44
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:23:57 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-64d2467d640so451632b3a.1
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 17:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685060628; x=1687652628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8PelXVvmbJtXORMvHTpXHymW8juD44eXP1zIzDNEopo=;
 b=TQY8ejxP1hQn2OBtZ9M8n2clES6hnmTmDM+Po+iGq/3X7lHnhOkwIvdpFefgKIaokP
 RhWHHgDtPcuNa9gggpTFRjmpqSrV/zaat++QNHWlY+UhKeBQFDZEiFlRiSnn+wIf8UrW
 PZ8z32ALQg6Pxr079xIjgGMprbZxcNc+eOKZ0tjpcV0BiBw1fDNJv6RyQX6tZxsAT+2W
 fLeXTyhZHuMnoGaLcn0RA+q8UzwXsVoAAQEq7bnuJNf4Cg1LoRL+sO+sOwvZvpxrjk0E
 S4QKkcXZKxomrdF3ixxh2/r/Luv9P91JbJmZ8TEKr6d+7i4L1ElpbE5VdCVhorLvQd83
 lC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685060628; x=1687652628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8PelXVvmbJtXORMvHTpXHymW8juD44eXP1zIzDNEopo=;
 b=bdu4NLj59Do5K1Kx6WTBo1aN+qa26+DUIB82PJWh+IF1+aR5sX+8l/satG+G2syOkU
 Y0zI6cx7q9JeGhgHnNK0LSKoTqPxZ8cNAty5vP6Cysv7snh9JBmIhXeKmBbipHuxbP8i
 g3akAJ8tPgVsWeQWyJV3X4MV61ncJIGXPZvF6Np7FVc9umklAD/OxYfIoXpbgF6Y69gq
 y40WRZE/lS9EDVvdbCxqvFFc/6mp1T8EWenEYLeeaKVPLnYz/pbH3GeijuZniyBw6vZ8
 zKp6KR7ivqGXIeJk82gPFQjO9C/1KruzxzXT48n1caUBy7NNZAuRnjLgvOCY9Q73K2hc
 gJCw==
X-Gm-Message-State: AC+VfDzL0d4i3NERBn4X23KtiQ/dop/rlXXJi4M/+GPk5JzO72Zi3lod
 Yf7DtNfhO/a/5SoG51QmcSY64g==
X-Received: by 2002:a05:6a21:796:b0:10d:b160:3d4f with SMTP id
 mg22-20020a056a21079600b0010db1603d4fmr6246334pzb.38.1685060627890; 
 Thu, 25 May 2023 17:23:47 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s188-20020a635ec5000000b0053491d92b65sm1675593pgb.84.2023.05.25.17.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 17:23:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 15/16] accel/tcg: Add aarch64 lse2
 load_atom_extract_al16_or_al8
Date: Thu, 25 May 2023 17:23:33 -0700
Message-Id: <20230526002334.1760495-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526002334.1760495-1-richard.henderson@linaro.org>
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: qDI86xysdJfZ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .../aarch64/host/load-extract-al16-al8.h      | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 host/include/aarch64/host/load-extract-al16-al8.h

diff --git a/host/include/aarch64/host/load-extract-al16-al8.h b/host/include/aarch64/host/load-extract-al16-al8.h
new file mode 100644
index 0000000000..bd677c5e26
--- /dev/null
+++ b/host/include/aarch64/host/load-extract-al16-al8.h
@@ -0,0 +1,40 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Atomic extract 64 from 128-bit, AArch64 version.
+ *
+ * Copyright (C) 2023 Linaro, Ltd.
+ */
+
+#ifndef AARCH64_LOAD_EXTRACT_AL16_AL8_H
+#define AARCH64_LOAD_EXTRACT_AL16_AL8_H
+
+#include "host/cpuinfo.h"
+#include "tcg/debug-assert.h"
+
+/**
+ * load_atom_extract_al16_or_al8:
+ * @pv: host address
+ * @s: object size in bytes, @s <= 8.
+ *
+ * Load @s bytes from @pv, when pv % s != 0.  If [p, p+s-1] does not
+ * cross an 16-byte boundary then the access must be 16-byte atomic,
+ * otherwise the access must be 8-byte atomic.
+ */
+static inline uint64_t load_atom_extract_al16_or_al8(void *pv, int s)
+{
+    uintptr_t pi = (uintptr_t)pv;
+    __int128_t *ptr_align = (__int128_t *)(pi & ~7);
+    int shr = (pi & 7) * 8;
+    uint64_t l, h;
+
+    /*
+     * With FEAT_LSE2, LDP is single-copy atomic if 16-byte aligned
+     * and single-copy atomic on the parts if 8-byte aligned.
+     * All we need do is align the pointer mod 8.
+     */
+    tcg_debug_assert(HAVE_ATOMIC128_RO);
+    asm("ldp %0, %1, %2" : "=r"(l), "=r"(h) : "m"(*ptr_align));
+    return (l >> shr) | (h << (-shr & 63));
+}
+
+#endif /* AARCH64_LOAD_EXTRACT_AL16_AL8_H */
-- 
2.34.1

