Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3284332ejc;
        Mon, 28 Aug 2023 15:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3jjB/7F2r8c9kYwjRJR/pJ32rcSUE8kayj2Zwui9nH+XT2VQiDr2pAPiJ4zvCJoiApdms
X-Received: by 2002:a05:620a:3954:b0:768:1572:e9af with SMTP id qs20-20020a05620a395400b007681572e9afmr35067858qkn.8.1693260883741;
        Mon, 28 Aug 2023 15:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693260883; cv=none;
        d=google.com; s=arc-20160816;
        b=nMLruFZsTlxM1+G8ODzAAQkf2DSxdQaM/h+i8QElWWeNAUIXXEQ6xoYSDE8X7pLn6a
         lQyK/pqlOaJyTZZYETgyHKTSPK4Ayp0448f0KKCxISGDfkNUCANp1jl9PBlIvuNuOzra
         2ZrkoI9e6EQrm8JFkjcsTxP392TCG1LI6pf1TIJVFgcya9ys3IPUALA41TO59KvvxPmx
         UNb2xetA1TQ1J/mvqjnfor2oKvj2znAOLRGlKdQM9yNj4eW8aA3A+XYLCnU7sei3Wejj
         sOMRUWazV7GZzK7k3HSzja6lMSXJ5PS6IpsjX5/VdYsrU4bV0I0nddqHgTEfcs242yHi
         o6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IN4el0RliSrzkh7KHsSv/rXBGURrc4tnh8maqpcPsQs=;
        fh=dbvxcF+wv/s0W/vbgiEajIQqQ0tE/CJz29MvQ77T3zI=;
        b=P4PHDzHLwrZOIrq5+zVOvpBny02XgK1Bt75Q2WB+Gb2zpL2JtYe0MaS1/Xy8pdwyKp
         sM3YJ4yW0MMUeVzqbDoEyfvYzwZGmB+vXHXLw2oSjPDOdCkfTUpPWNV1y29e0hgbYeYW
         j7a2PGSBEt03xCE4dpXgo1gQA8ERB9XNsW2GxmYXoFU2x9GbbFCNP39JaW2uQK7PCDiZ
         Gq04Rc15lSBM4ZRv4tfkfFOAiGygPcGzoAJb8s8rmYItjMqJ0ZSeEbizIU+dkbTt13oC
         oY/l7juvmnkGBRWuwXe6nBkeLYwyU5owMJH38dhqPkV3oiZs83/CwNbGW8fi/I473Dwe
         COJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoA0P07C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05620a280100b0076d7b5e3834si5758910qkp.339.2023.08.28.15.14.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 15:14:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoA0P07C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qakUb-00060o-9Y; Mon, 28 Aug 2023 18:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUW-0005yM-1P
 for qemu-devel@nongnu.org; Mon, 28 Aug 2023 18:13:48 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUR-0004BD-LU
 for qemu-devel@nongnu.org; Mon, 28 Aug 2023 18:13:47 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-401d10e3e54so6481995e9.2
 for <qemu-devel@nongnu.org>; Mon, 28 Aug 2023 15:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260822; x=1693865622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IN4el0RliSrzkh7KHsSv/rXBGURrc4tnh8maqpcPsQs=;
 b=SoA0P07CJHcoBlo+OVKtKcmWcbeJo1xzdqqXYAbEldUmDBslirlyE15F+kOrbIhktr
 Gflu+46j1WuzxmYHOp1Mgl4mI2USNeEIhrrKTWMrXDslSm3wnooQbhJBsHb0QvQ9Cd6m
 zHRy75mKmNSCG6sy6Mbxsx+PP8+fGNqSV+bZ/1fBC1WzFpdiNtuJxcyP6Bzu8xWcMRDM
 iiZoi/HFdFMiLFPG58trqNbUiBWLSeDOTbJkHNNWxXwrGNr5ApCgnU3idCINPGrXk0h4
 3/8XXlYVQo4YplvWath/3L4nWe98JcUCVOuVCoZXHu9x1FvVkEA7W9zA4rkV4lPlGs1k
 pH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260822; x=1693865622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IN4el0RliSrzkh7KHsSv/rXBGURrc4tnh8maqpcPsQs=;
 b=MR1egpFtjACM3JISIQYud31IiPQAmNqiHjtcnlN99GQvjY+gHqGg7F8MUBNARZb2Zo
 SkhwIrciXhW4Nl/nwHGNbP7rxXPpdmnKJaeH2OiBnZl45SiUsMH80WNKu0tAyIzRD6tL
 AEZSLehzEhbf13hzZ7zDS/Em+XUaM/xIsY/Vx94/VnkQ51SbddkHf2NaQaH8lvE9iEy1
 YQO36nOvEEaskiaTPNx86Xspkw+cudfjMsezX37Q21UeGrMRpizP5ucO+PwsS1nLRq3+
 uQBrRJoltJyzH7KOoaWphfcVfpDFf4oxdSfsd8L1QFpdXALpIsXLiqUOKfmQws5HxaGr
 JgAA==
X-Gm-Message-State: AOJu0YyUO82iEuFpa5tx6/ISRLLazTA7JDN5qZJpatY0gSWQBRACvxzU
 izw0v2AI1oyRYuCZUIWeStS4Ax1aCOxhEQ1/UBw=
X-Received: by 2002:adf:cd0e:0:b0:317:67bf:3376 with SMTP id
 w14-20020adfcd0e000000b0031767bf3376mr20406896wrm.57.1693260822226; 
 Mon, 28 Aug 2023 15:13:42 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 y3-20020adfe6c3000000b0031c5ce91ad6sm11720207wrm.97.2023.08.28.15.13.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:13:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 04/11] target/translate: Remove unnecessary
 'exec/cpu_ldst.h' header
Date: Tue, 29 Aug 2023 00:13:07 +0200
Message-ID: <20230828221314.18435-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fBL7VIWJlF5s

All these files only access the translator_ld/st API declared
in "exec/translator.h". The CPU ld/st API from declared in
"exec/cpu_ldst.h" is not used, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c      | 1 -
 target/hexagon/translate.c    | 1 -
 target/hppa/translate.c       | 1 -
 target/m68k/translate.c       | 1 -
 target/microblaze/translate.c | 1 -
 target/nios2/translate.c      | 1 -
 target/openrisc/translate.c   | 1 -
 target/ppc/translate.c        | 1 -
 target/sh4/translate.c        | 1 -
 target/sparc/translate.c      | 1 -
 10 files changed, 10 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 0839182a1f..9be912c50c 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -24,7 +24,6 @@
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 708339198e..c00254e4d5 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -23,7 +23,6 @@
 #include "exec/helper-gen.h"
 #include "exec/helper-proto.h"
 #include "exec/translation-block.h"
-#include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "internal.h"
 #include "attribs.h"
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index e3af668252..c04dc15228 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -23,7 +23,6 @@
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 15b3701b8f..9e224fe796 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -25,7 +25,6 @@
 #include "tcg/tcg-op.h"
 #include "qemu/log.h"
 #include "qemu/qemu-print.h"
-#include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 
 #include "exec/helper-proto.h"
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7e7f837c63..d02c16296a 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -24,7 +24,6 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-proto.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 4264c7ec6b..dfc546d3bb 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -29,7 +29,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/log.h"
-#include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
 #include "semihosting/semihost.h"
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 7c6f80daf1..d65758449f 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -26,7 +26,6 @@
 #include "qemu/log.h"
 #include "qemu/bitops.h"
 #include "qemu/qemu-print.h"
-#include "exec/cpu_ldst.h"
 #include "exec/translator.h"
 
 #include "exec/helper-proto.h"
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 74796ec7ba..49b6a757b7 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -27,7 +27,6 @@
 #include "tcg/tcg-op-gvec.h"
 #include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
-#include "exec/cpu_ldst.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 49c87d7a01..c1e590feb3 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -22,7 +22,6 @@
 #include "disas/disas.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index fa80a91161..3bf0ab8135 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -25,7 +25,6 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
 
 #include "exec/helper-gen.h"
 
-- 
2.41.0

