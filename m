Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5080487ejc;
        Thu, 31 Aug 2023 06:08:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD1VTfG+OKqU1sI2ckjywawnU6DnqajTaPFShAT5ExE+DYuGiAlQNQOSApmvZgIO61isnc
X-Received: by 2002:a05:6214:20ad:b0:651:6e04:820 with SMTP id 13-20020a05621420ad00b006516e040820mr2946797qvd.58.1693487293929;
        Thu, 31 Aug 2023 06:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487293; cv=none;
        d=google.com; s=arc-20160816;
        b=koVFgPXhn1Qg9CpRn8RwCx1Gs/2kjBpZ9TIGeobEXq/JQ63FxDMSYhlo0OYEVCVjgS
         jmsgEvKSdV9Q0errSJtgCwrjrPEzfToy2s0L6egnfZnk9TrxSGdW2+S/OgbXVlYO5RIf
         FEopVJsvtz7ZkJc/ApsztOv4Tvzdy+5n4Nqe3WPDO+MAsKBHUwx4rTYFDPpiwk3yAOOJ
         cYhnr3yFVT5dyUAeaiJIPjKV2o4LPzHmOFWgoQXV3nYE6vsRh6OeB+LRdTJB6I4/FFYj
         4i5Apn+ngTMoD6XAwOIcKjuRLX2MQ7TBh9TRIDSk2AKvZxpx4HVhIFLa5Yqs8HpCMCQl
         wAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EWFG4EongnTwNm4gc3SaYrZZrKAf899rD48bNs5phBA=;
        fh=YSseXhaASgT14RYDeqdxM3B3Tn9CQf6fAO7oyEFtT3s=;
        b=Im7am1ob6wNNhUGZoe30ixRNieUJnTlWKr0SzUUYflTYepLZ190MNio7J41LOXRXA5
         u6Ql8CGHYApK4jm/+nSDz9spQ2yf1pLiqYPLIObTjZnYfe9TbWaQn7i9dYV7fRVkndPq
         FvOlyASwzUmx4WtlXQ0FMRGZ1MGl1BZGpNaFP72wCNzdAXXGxfgSIftixwHpIK7MyCjd
         kYFGF5E+APdXr7A7Nj4Kf88fnapUecbHmRLefQDl0kkV/GW2gKr/uBz9G8bIRsYK3bzZ
         OKoBptaObqBQXq9nmV5Sj4TPY9+QQGwlCiedJ0P6cShDAu9sOcLn6IFb8KC1WoHxPPVx
         BasA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jX/FUq1O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5-20020a0c8d45000000b0064f4c7c2dfesi834409qvb.75.2023.08.31.06.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jX/FUq1O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbhIy-000340-AS; Thu, 31 Aug 2023 09:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFK-00036U-NY
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:58:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhFG-0005QS-1D
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:58:02 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31aeedbb264so650277f8f.0
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 05:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486674; x=1694091474; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWFG4EongnTwNm4gc3SaYrZZrKAf899rD48bNs5phBA=;
 b=jX/FUq1O8cVMqN4lk9eTKpzdYY4Cq5uh7c+rnkz6M1llJmbnXIt61glTJnw755byiZ
 l8Lcn+M4H9dU2Wm3YEzTU5nuH9Edb9ZWbmz3HkHPmH8lyJMHr2jw5lwRYlER0apypElL
 GTOoIm+4NIi+XcZJmjVnnXjCX5/H6vvmVe4mSFhSWRxtSLDsXG1/eey9sTiJn1xL1lpD
 zJoMBqDwuLTBt//sWlJ2X0BO1Kxrj152SwwV2jCgT47pbGMKnljumfSCoGK01tGQD/KM
 I715LKPdYuh2w+hLaYnOHr9rO+Ve8g5odmteul3TV6yKK5ELM2aQHrA6HarMRdMK7yG8
 8O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486674; x=1694091474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWFG4EongnTwNm4gc3SaYrZZrKAf899rD48bNs5phBA=;
 b=IPlq0g64ANRKi0G0PLZfEjg7ekX03qJyxhIsArmR+u06Z7QEb428reh9p4W5wqpbyS
 7yUUeDT7nI/D2jSBko6wgs4QGKO84K4m6/3CYu/NArf4SMKAYVQMjQ1XG54Na81g9uZo
 c6GTzqOxoH/RwulBpvYKNvAu5I1NA2cssbbf/wSdH2LBduNzDThqTm8BglSLhCOkDG5t
 0jswZiXb/I25JQL9Z4Vwtza/a3Q8BFBp2kmjaoyG498QWZWpia/+u2YLfGW4oZqT8Qag
 t09U+LWmTF71/ryPEWui6pFpA1lShWBPGzhpfnkbLmG64fX11QzuiiCr6/JeJxdB3nDB
 BVGQ==
X-Gm-Message-State: AOJu0YzqpzNc2J1es5to+u7BP+z6Lvjs1oyGwnHhiAw39b8GEt/APSC1
 EddgRfHRBnfl7mnn6tQtdyry9Q==
X-Received: by 2002:a5d:5242:0:b0:31a:d2b2:f29d with SMTP id
 k2-20020a5d5242000000b0031ad2b2f29dmr4355231wrc.8.1693486673944; 
 Thu, 31 Aug 2023 05:57:53 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a1ced03000000b003feae747ff2sm5128839wmh.35.2023.08.31.05.57.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:57:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <bcain@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 11/41] target/translate: Remove unnecessary 'exec/cpu_ldst.h'
 header
Date: Thu, 31 Aug 2023 14:56:13 +0200
Message-ID: <20230831125646.67855-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nBF0JIIFBk48

All these files only access the translator_ld/st API declared
in "exec/translator.h". The CPU ld/st API from declared in
"exec/cpu_ldst.h" is not used, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230828221314.18435-5-philmd@linaro.org>
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

