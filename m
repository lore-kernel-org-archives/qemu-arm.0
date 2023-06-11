Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1372948ejb;
        Sun, 11 Jun 2023 02:05:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6TXPcufv+CYOw7pKCD2/zf/N/RYXzLp3xqFEVY8/CzhTeWh3qCct+eoq1zul/kHUVkGNCb
X-Received: by 2002:a05:6214:2582:b0:628:474b:aae3 with SMTP id fq2-20020a056214258200b00628474baae3mr9218811qvb.56.1686474345706;
        Sun, 11 Jun 2023 02:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686474345; cv=none;
        d=google.com; s=arc-20160816;
        b=fcK2fZisZxMe0rLBbyhVrB7tuLNzLzQh2iQdqCU1MwUql+NFM23uPfjzHQBFhv+gzO
         K6TzxvSgh2M+9MSmqG7Aznyggwpgkjv9CGrs4z3gqaK9oiSP30+nj+YVY18m+jKI2XSg
         glCPf+94TFG9s0MOOcvvfzYpG26k4l+ALVJwDd/r7k3KilENQpCb8DmXWNB1IV4id6YE
         s1KFmGjp5uZjOjC+6fJPYvUMvnM9DidEdYi24NbWb8CXU2BLGXZoY6rj9r1q8LJU1rE1
         +MY5Chw/sXbT2b+CM5MZwVgpZCdqNzhUY0ExA/0LDoi4eCzOG6eYM+hTHniT4qGE4ef7
         OIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jPnCvSZ0LTnP+mwyCnVM/2nlrxmNit9JdtgjWZL7/t4=;
        b=xstoAYYAwuZ4Gb89mcXUNL6LEaRIYhvvrjYju+ew5/UL9/hvhW9j9uHvEC6Uu9z6F8
         3A94Z1XxDI2QSefuTJDLQTMzjBaBIc4qz3VKw3NiCjtz9vvPoIx5lf5BB3Ji5iRvjxLj
         qKPw5Vka/FM1KQeAtC+/NKWXhF/NKWOoKEbhwhyvTJU56EEEmwiNqYSrm/LphqHafzq1
         tf0YcP2GHCU9ski8933L04TuQilUyzeJWY3mmIU7ZjnXHqXFVTU6dw0XmND4ZwAdn4YU
         cA3y8KWTcdQ9Hx+qVo5h9yr7veGbU4s4FWlBylClh5o+lsXiiGUfY9QA7mSuc8dAUdX2
         KvPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lfGxV1Ki;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7-20020a05620a138700b0075d58266299si4308002qki.404.2023.06.11.02.05.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 02:05:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lfGxV1Ki;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8Gv7-0001eI-Cq; Sun, 11 Jun 2023 04:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gv5-0001Vm-4M
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:59:31 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gv3-0003g6-3u
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 04:59:30 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f6e13940daso34033175e9.0
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 01:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686473967; x=1689065967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jPnCvSZ0LTnP+mwyCnVM/2nlrxmNit9JdtgjWZL7/t4=;
 b=lfGxV1Ki566549IaAA8d17ENQY4Dm9s/xfwMlcTMXHWycuhGkqRcZw/0wjxHE8I21k
 KvgCnLB0t0hHPkjLBt6ZJVvzchW1d1ELvChP021VkjbqmbKyQcP+3ISKEgofNd/RMxWe
 FprnTmIJjy/gowU1Kz0zq+SpyjKUsWyRDkQxnnmpxgCsmqemnguKVoMiZlaGX1u5g87B
 cr5NKYagDZgggiQZrZm9hV+oT28SuW23sBaZ/Koka4vHsKiOL9xQXcHhsjrnm+JE2fSb
 EBom5Luw95/YTxGbQm0uLIKe6pVEwvcAlsPK6zqy4La9voBNRWz96UQTbwBrpzv1pVho
 Ic3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686473967; x=1689065967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jPnCvSZ0LTnP+mwyCnVM/2nlrxmNit9JdtgjWZL7/t4=;
 b=YSNP2b4ejmZVi9+qU0csceHtjcJkKT+t0vvsXFRXTXJaAnY30y4zYyGB621DbfYGzZ
 zlKZhO98i3sZhaEIDllo2wyu9kK7Vv/5KZFHrhV2piawI3vZOLouPNZZ9F+BoALKpBMy
 ax37ENqbtDfbLmsfrrJseO7E5MmliBD8oD5hVCiRxqmEffp2hwe8BgAldx26noNJNHd0
 OU0cC5tcbueZliG0PyqAN2eIMiQORJ1sHYNtFBifrPvMVyMyj2aUdrnclxbK0p+FBXFz
 n5Dq8Pt+RQx8+Mjh85NtN1oPwvWGq4j21cJF9NxJsK5oD99oHm+NtKga4Hr+FNB/5nL5
 HdVQ==
X-Gm-Message-State: AC+VfDwXiFIbJdkRHOnx/F4OrwB+B99L/mL1vKYr3EkXF6/EKOBr2FXa
 nz/FKf90+zayl/GTD0TT+NNaI2f46CfD7aWG7xo=
X-Received: by 2002:a05:600c:2297:b0:3f7:f544:4993 with SMTP id
 23-20020a05600c229700b003f7f5444993mr5236269wmf.20.1686473967732; 
 Sun, 11 Jun 2023 01:59:27 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 f10-20020adff8ca000000b0030fae7129e7sm3791910wrq.42.2023.06.11.01.59.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 01:59:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/26] target/arm/tcg: Reduce 'helper-iwmmxt.h.inc'
 inclusion
Date: Sun, 11 Jun 2023 10:58:29 +0200
Message-Id: <20230611085846.21415-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: 1Q68OU1Cyuk3

Instead of including helper-iwmmxt.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h               | 1 -
 target/arm/tcg/iwmmxt_helper.c    | 5 ++++-
 target/arm/tcg/translate-iwmmxt.c | 6 ++++++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index c4a321c0ea..dd12fee107 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -949,5 +949,4 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 #include "tcg/helper-sme.h.inc"
 #endif
 
-#include "tcg/helper-iwmmxt.h.inc"
 #include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/iwmmxt_helper.c b/target/arm/tcg/iwmmxt_helper.c
index 610b1b2103..ee607a3d3d 100644
--- a/target/arm/tcg/iwmmxt_helper.c
+++ b/target/arm/tcg/iwmmxt_helper.c
@@ -22,7 +22,10 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "exec/helper-proto.h"
+
+#define HELPER_H "tcg/helper-iwmmxt.h.inc"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
 
 /* iwMMXt macros extracted from GNU gdb.  */
 
diff --git a/target/arm/tcg/translate-iwmmxt.c b/target/arm/tcg/translate-iwmmxt.c
index 57a924c578..9f6d717ee0 100644
--- a/target/arm/tcg/translate-iwmmxt.c
+++ b/target/arm/tcg/translate-iwmmxt.c
@@ -12,6 +12,12 @@
 #include "translate.h"
 #include "translate-a32.h"
 
+#define HELPER_H "tcg/helper-iwmmxt.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 #define ARM_CP_RW_BIT   (1 << 20)
 
 static inline void iwmmxt_load_reg(TCGv_i64 var, int reg)
-- 
2.38.1

