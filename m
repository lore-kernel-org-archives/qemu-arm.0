Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1371656ejb;
        Sun, 11 Jun 2023 02:02:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5xgLq3AgPzMF1r3FZwCsJYHf3tYNgMMo3fG7dN5hwrfwNSIr6NlQcdx8ulMK20jZ+jrdz/
X-Received: by 2002:ac8:5745:0:b0:3f6:c348:3fc6 with SMTP id 5-20020ac85745000000b003f6c3483fc6mr9374243qtx.8.1686474137332;
        Sun, 11 Jun 2023 02:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686474137; cv=none;
        d=google.com; s=arc-20160816;
        b=vdf6AkaGPnozNukb0k3WAP8+7ufUBsQwMCj5YeQTsakDCt58dyoZB2u5jv2HWPOoK5
         6G30H7Yif7hlPf0eIg1Cfe79jUK3xqb7It4U3SQKqCHf+c/RM3W/uANLTI78KANFex8h
         kElYzamBRGEttlAvegq+6khFPsqceheuNWYkxHahMUZo7tppicIJkc7QTGACPkTNvnoB
         vPRdZuM/j2FsZjsWozcOoapH23HQf852HRwAkJHp8h3xg8MexfZNZ9Qx4pMzw0abJKMN
         BX35wVCH5zX9MmHFIlQuvpZeuWH/d9wo/x6MU5EXk4yWbb3wFhtcwhDb9tFCIh0g8Xj4
         8qMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6fgvCMeWGWtzi1ogVNS3n2ceF5EfOYaR43hCpswXEso=;
        b=zgeIyYF9Vjkr2uc6vm4XVaAdZiqydB3QgpHtTBPnp3W774/Xrxx33EOlCT7syV11XE
         Tdq+ZDAh8hhgBllof34GdS9z0JuJLz8QyAOl4qYLEAShUaxLqPsn9XMbKXOYfpTr2q+0
         LmWBNJimQgIeslZDdjDpAWI9BvYb+Gx/7bv4/yiJ8W4e3iH3kQWOYxAtxdlFSFQj/hB6
         CN81dTmUhB8YqoaUwVCwu2sl6knBP8KMjQju7LPv9xFMzvVXe/OI4Tgu8ovl8/8ieAEm
         e6WsGRil6Q4HiH9tdwWib8Kom8PRTmFk3BE1htXYbgmu5CtcG876wsAqOyr8VvEA2yGA
         psGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j/qXLV/9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020ac85b02000000b003f9ac43ae02si4723471qtw.12.2023.06.11.02.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 02:02:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j/qXLV/9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8Gw6-0003Bi-LG; Sun, 11 Jun 2023 05:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gvi-0002hm-AT
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 05:00:18 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gvf-0003zz-PS
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 05:00:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30c55d2b9f3so2108212f8f.2
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686474006; x=1689066006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fgvCMeWGWtzi1ogVNS3n2ceF5EfOYaR43hCpswXEso=;
 b=j/qXLV/9sVhsCh+/pKikW540b9dVvIF3Gz9WWELqLKNQlKcGmEF5gPf7nAgeWOgq47
 XoXJP28L1REftwOig/rwqZGN8S0/Wu172rPjgq4sllTA6cpMDWLhAjS5GItSRC3N/gTt
 SstZ5wQhZtF6QGFoEvIhbcsWfnqDAT0UzPDZL4jz+Bfqnx9URfWKFvayiIdZg+/EPAXN
 ZIFAhK2cBbJ9X8/UdCquuy4MkCyavks7G8IDoLu9EDB2BoEb0L27vGpMYv8NLTG2hLNu
 h1/+QAe9Zhk8KrGMCfVz7end6nU3woQqAh+QmD6Q38wyDJv2kJIohIzdNtFwSwa274lg
 ewug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686474006; x=1689066006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fgvCMeWGWtzi1ogVNS3n2ceF5EfOYaR43hCpswXEso=;
 b=L8buHpM+lthBBkVXNcGiSMkCjJTgdfQmsn+k3xdfPp5TuU6L6/i4kuAdlzBVy/xw2+
 pgJNZIkIqIufI4r5zve6CmFsggacKZvKS8OS4ZAh0rqHoOn5//DzHgM1ZO1HTZcnG5YP
 UdFG/HDg3NmunYRzrEP4ifeFGn1L+TjpXGPBIYqk1e2cni4jZmq3NaamSUYZPsLgCqPC
 RTzdruASO/nC4dvvJw1tSbKTgmsIOzuSyPvEx0DcP9eU5WzV/bRPC3DDs03NwiUggQax
 yK81SlsGu3pm8AhybGHhKfsdDYU/dJgG0a/SFpReBpMuEnvDUlWtqlMjGjDAFMci4uUd
 gDxg==
X-Gm-Message-State: AC+VfDzAq2+ImK01AFA+OFcI3e2ryvyrYLMOAEtQq9/Bg38ouzMnHA0w
 g6NT4Zc6fPqJiXcR7Mkw3lnz8Q==
X-Received: by 2002:a5d:5491:0:b0:30f:bb97:37e8 with SMTP id
 h17-20020a5d5491000000b0030fbb9737e8mr916769wrv.47.1686474006262; 
 Sun, 11 Jun 2023 02:00:06 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 d17-20020adffbd1000000b0030fb4b55c13sm3028336wrs.96.2023.06.11.02.00.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 02:00:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 18/26] target/arm/tcg: Reduce 'helper-sme.h.inc' inclusion
Date: Sun, 11 Jun 2023 10:58:38 +0200
Message-Id: <20230611085846.21415-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: GQlSYKmZGUxe

Instead of including helper-sme.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h            | 1 -
 target/arm/tcg/sme_helper.c    | 5 ++++-
 target/arm/tcg/translate-a64.c | 4 ++++
 target/arm/tcg/translate-sme.c | 6 ++++++
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 61cd8fd21e..b7201eb89c 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -539,5 +539,4 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 
 #ifdef TARGET_AARCH64
 #include "tcg/helper-a64.h.inc"
-#include "tcg/helper-sme.h.inc"
 #endif
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 1e67fcac30..04170ad18d 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "tcg/tcg-gvec-desc.h"
-#include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "qemu/int128.h"
@@ -29,6 +28,10 @@
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
+#define HELPER_H "tcg/helper-sme.h.inc"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
+
 void helper_set_svcr(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     aarch64_set_svcr(env, val, mask);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 22caf89bb0..d1ab1edf6d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -34,6 +34,10 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sme.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
 
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index e63b9883a9..fa0dc20bf2 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -29,6 +29,12 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sme.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 /*
  * Include the generated decoder.
  */
-- 
2.38.1

