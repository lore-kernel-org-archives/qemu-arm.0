Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1372501ejb;
        Sun, 11 Jun 2023 02:04:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5xU3RCZI/KVIRXldsBp79EpiSw4fqufT0m4yDGaMwBqP+V7wGKG9eMJk6SqQ8iDNAsxg6w
X-Received: by 2002:a05:620a:2b2f:b0:75b:23a1:8e64 with SMTP id do47-20020a05620a2b2f00b0075b23a18e64mr6425309qkb.53.1686474273011;
        Sun, 11 Jun 2023 02:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686474272; cv=none;
        d=google.com; s=arc-20160816;
        b=AcI707e5jCobd5muC5qGLHpgdpAVhDac6HjJyBYIgW2PXImhsuwXf6dxzwXD5xftcM
         tLw4mfDE+tWNzUsbODQMXz+SYn94hI37ioB2Zwye/TeSTuC5Iljh4VYh5Vh1GfVKmRUw
         U1t13HoebsdMwbkWPcJyBFhq37Ftk1X3AvKtol/A0JK/F3R9JhHUmU/VUQsDLy6Tcm/H
         EEGtLBakKncELOL+0XAu7seC68dILwfx0/qhdu5hM3tRglTkqxkHR/0OygIZH45FaTPX
         w5GEBom39XXi2+Y7Oa4m8CRf7GBql4V6nu7SzomdDTpYPP45hCT7vFQMSziOmk8ErqQ1
         x/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dviO6n8wA4yJsaVpJ1+rfxPOtVuyVvqQ3eDo42v2ZSU=;
        b=kcyHzhsBbt/UDLiJUF/FvF3Qu1pFxHUPIuFGSPQcuhWA1Y1sG8gZT90+Yeck5VPqZz
         nOutMhEKole3iIWQR5M9MgdBYpWp00soq8Vz5QvMtvI3/eD+Vw5OHyz+ZC+aTVN0jITc
         3/zFtH13KtHX3Eh0ekuL+KdRFz4uvjwKcAAmuNRWS4Z9DDqPH/9WXAdxSk83USJ8QSSZ
         H0Flej2vCSUKqNxHDyEeVgAcn0znMDGJWKGh7nGEmbyEqQDy84A544RJnJay7A4xjQ4+
         89MM+G3WDqzxcQ+Kdbc/48mc2rPVxnZARaTVigPdFRc4mRlvDlq0uIaZzzfx25XilEdq
         PvUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FzYjyNIZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a05620a16a100b0075ec68c1bcbsi4292298qkj.245.2023.06.11.02.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 02:04:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FzYjyNIZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8GxH-0004JI-Vi; Sun, 11 Jun 2023 05:01:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gvd-0002eI-82
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 05:00:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8GvX-0003ix-Db
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 05:00:03 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f7fc9014fdso23748285e9.3
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 01:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686473997; x=1689065997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dviO6n8wA4yJsaVpJ1+rfxPOtVuyVvqQ3eDo42v2ZSU=;
 b=FzYjyNIZ89jTf4B24vWsducejgSoVidmsAWdRaMygMznHXqyaFDP0uj69dI2Axh7GO
 zRm/pWmzW2WEZrCkfiVRV8a43pYNLmpayWl7QmiRGyk+CyTMpkglYdEmyDggp6lZty4d
 b30dPyAGEHUSVkjDlY8/GemwEMffcASa9h45sfqC3fAe18Y5G3rVBJNYUGxoYw6kJPS6
 HUsDXfEfdxRibps3oJMgFObmyWzmuA4G11dd8GdBlO8Q5RcIYG+uHVgn5FnY+28jRK/W
 /wfg6K+LO5Re32dHdQ2iiSMgqkTSCsPXtloslkh/iS6blG5106zXc0ur6spJbak+5rWD
 C+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686473997; x=1689065997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dviO6n8wA4yJsaVpJ1+rfxPOtVuyVvqQ3eDo42v2ZSU=;
 b=gPAOZSrJXAfyb72Owep1UhhR3uvVU/C3SVdnGyhyp+jXDAqKY49IWA7Neq3AN5IkhY
 +hdAmfUrckjJwWPr5iFMgM+2U0jAGzJJeXpet3FLQYFTEOIpezbkpkLsJzROB1NuzJkt
 7rBTe9id0xVn83FMdGBQCacY69WGyapTpGlqRt5BhdYlcEv8elmYUPzdBYGOSaASPLUl
 9sN6GAcamJOROSkZuOIncSzHRu/9NOlSt5dez7Rt+calD98ICxg98P+xiYz5RfsQuqk3
 gK2H7E6ihLA87HqqEBv1VJLnUygxdhFQN99YtUCgQhZM1jd4yCki3Ve7B9wZn+LbUiAZ
 0iuQ==
X-Gm-Message-State: AC+VfDzYNjXXmuFQLwBPsdaOLz/dtH91rP3KdXw3yBk8lyMD97XUAuS9
 Feqt5X+dXmbF5XER1RASpV/ZLg==
X-Received: by 2002:a05:600c:2212:b0:3f4:23b9:eed2 with SMTP id
 z18-20020a05600c221200b003f423b9eed2mr4821369wml.38.1686473997621; 
 Sun, 11 Jun 2023 01:59:57 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 w25-20020a1cf619000000b003f7f52c9988sm7877641wmc.21.2023.06.11.01.59.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 01:59:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 16/26] target/arm/tcg: Reduce 'helper-sve.h.inc' inclusion
Date: Sun, 11 Jun 2023 10:58:36 +0200
Message-Id: <20230611085846.21415-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: 4uPmVCn43iTZ

Instead of including helper-sve.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h            | 1 -
 target/arm/tcg/sve_helper.c    | 4 ++++
 target/arm/tcg/translate-sme.c | 4 ++++
 target/arm/tcg/translate-sve.c | 5 +++++
 target/arm/tcg/vec_helper.c    | 4 ++++
 5 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 444be99c96..134d428175 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -539,7 +539,6 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 
 #ifdef TARGET_AARCH64
 #include "tcg/helper-a64.h.inc"
-#include "tcg/helper-sve.h.inc"
 #include "tcg/helper-sme.h.inc"
 #endif
 
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 8a0d966aae..79a42af591 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -33,6 +33,10 @@
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
+
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
  *
  * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 24796e5d9e..e63b9883a9 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -25,6 +25,10 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 /*
  * Include the generated decoder.
  */
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index ff050626e6..45a36760fd 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -22,6 +22,11 @@
 #include "translate-a64.h"
 #include "fpu/softfloat.h"
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
 
 typedef void GVecGen2sFn(unsigned, uint32_t, uint32_t,
                          TCGv_i64, uint32_t, uint32_t);
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index af325577f0..d93960198f 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -33,6 +33,10 @@
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
+
 /*
  * Data for expanding active predicate bits to bytes, for byte elements.
  *
-- 
2.38.1

