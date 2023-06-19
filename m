Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2878006ejt;
        Mon, 19 Jun 2023 08:43:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6daIhtPjotKZ3aboKt4ENGG5lqWUK5oWCyTY0MBHwVMLG5WpKvzN/ZZX9Nwj1ROeNc0MYi
X-Received: by 2002:adf:f5d0:0:b0:30e:52de:9ccf with SMTP id k16-20020adff5d0000000b0030e52de9ccfmr8287093wrp.68.1687189423599;
        Mon, 19 Jun 2023 08:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687189423; cv=none;
        d=google.com; s=arc-20160816;
        b=YOscvKrU73mgxmL4oybSbINT6Qjsu72ULnnmtGBBy/q4M9m0MW0cquUQgK6Qas8QhO
         ELKLidUC51m8R8b+2gFIcOpX7XDPglMXVLXuAVp+eT43E6csoP18TsS0XgqKHerjAkxQ
         lGtxNoYYKr/tdCvI6LrecCMu+LlmU/0AqJwm7tlFqGWyhTwKy1qiR/onNKb5tQrb2urs
         lbpNngQ+/3TvGNoIC7jCCK+EGvFGuKctqEw2UPTv2+7QMLL6R2S+AkfwsdyAIrFEAgl6
         VGeJJDhjAjcOMYMUmwYl7X2BPkMS69i0rw7e85AFagBa9AXql7eox7zWxIy6P4NpSvn+
         eo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8mp+80uEQkt8/jSa2bwpDOFe4dhC6+cPTb9ADdk/0oE=;
        b=OMOwzXCImYAa11CvvU5vp4mMsyIgEnuseMI9p4mmJyQSZ8XE5ATy5Thp3MeqKQByBc
         lc+oPrPuH5lV9x7uag/R+73nfyidDBnCh3RP6Ru44i2DoIZsREtKLm1rb/7bc8xnRmpz
         jpHH/mYM+xqz0KO+fejLM+HmSi3m8IP2xjWVURJhXe5Iqv8wCMJzyhR4YjO0IxsYzFPF
         V44nbIZ2e0x0tiLdyVzY7dWKMQT6+3tIqU948S44rl9bglQCT2160KPlDkTU08ACEeV8
         bYmAW0qmU5yAjR0zanB/Bu1GVPhGOyKmEIMbTz6gf64Iqlhif+6f0cUHpEjqF1kL2bI2
         ipGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5Ol5hrv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020adfe80a000000b003112f1dd96dsi2950183wrm.1053.2023.06.19.08.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5Ol5hrv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBH2V-0002LN-G3; Mon, 19 Jun 2023 11:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH2S-0002HH-Kw
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:43:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBH2Q-00011I-Tt
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:43:32 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30fcda210cfso3341916f8f.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687189409; x=1689781409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8mp+80uEQkt8/jSa2bwpDOFe4dhC6+cPTb9ADdk/0oE=;
 b=A5Ol5hrvszPQcwYBiIexbrSjN6hrfe8g5dZMa7rudjhOjqIqVs3oph7L56ul+PPqpU
 pHr+J4swS1Mn8DFbyVyJ5/ZB2BpZqciCTRVI1hvOQ+jf9XJjK00f6KXGh9IRqIEfMrFs
 IRck3/IU9Vld9qENJqRh41We70beNJN2oYETfEOvUetJP15W0TpIItTbZWmMg2qFDdkl
 wnPfaXsHGy9wtXUhPMcMyE3u+oYXXPim9NnD+QcM/4wJHW1CRCabzJhein+IQXsYhxG5
 wJL31u8DXoyvw10/i9wU1xWj8xfgx1jMnMQWO99E2z9qUyf+wFmcvACF/1FrjUst2shC
 DIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687189409; x=1689781409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8mp+80uEQkt8/jSa2bwpDOFe4dhC6+cPTb9ADdk/0oE=;
 b=lPy6Fw+P6+9dOZkargusGfKsuhgTGTPK06BspydtPg3h80TZrB0QGcHoYrW0nFJImo
 6fLiMdhLnGfrk8aFMAYYJMMZKDHVXic7/k32YcB0gI2MB1CcCnX+/YyG0wXLlGYZEelx
 n9Ht+ys7IggFSsl1KifKzsOqaMeUTwaObGKRliVfNN0Nv7T2/lUNrW8cWkAdQLokWa34
 XA6U6xOz/czCYJdjcWtoUp1PXbQZBY6R2566icbgh200fkTSOtV7HmOL32a5HV8VVE0a
 SBUoSImDylERkaCne9a7cgewKpeZpn5vp3W3FVa1XOneHtkX3OPxaOTVBrWh6oe/tgbh
 v7vA==
X-Gm-Message-State: AC+VfDyUqfkPo1R/4RhnbG61Md0rQ0x0JkqkpBnA3//VV/E+uwgDiTxX
 YLQwZLQ2CRkd43PauXzeSOp+zw==
X-Received: by 2002:a5d:664d:0:b0:30f:cc22:d832 with SMTP id
 f13-20020a5d664d000000b0030fcc22d832mr8216193wrw.11.1687189409343; 
 Mon, 19 Jun 2023 08:43:29 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 s1-20020adfea81000000b003111a9a8dbfsm11417924wrm.44.2023.06.19.08.43.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:43:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 01/34] target/arm/tcg: Remove CONFIG_TCG #ifdef'ry check
Date: Mon, 19 Jun 2023 17:42:29 +0200
Message-Id: <20230619154302.80350-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619154302.80350-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: CMfpkUHWt+2+

CONFIG_TCG is always defined within target/arm/tcg/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu32.c    | 4 +---
 target/arm/tcg/m_helper.c | 6 ------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 47d2e8e781..0672519b89 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -13,11 +13,9 @@
 #include "hw/core/tcg-cpu-ops.h"
 #include "internals.h"
 #include "target/arm/idau.h"
+#include "cpregs.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/boards.h"
-#endif
-#include "cpregs.h"
-#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 #include "hw/intc/armv7m_nvic.h"
 #endif
 
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 9cef70e5c9..0891acc29c 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -15,10 +15,8 @@
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "exec/exec-all.h"
-#ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
 #include "semihosting/common-semi.h"
-#endif
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/intc/armv7m_nvic.h"
 #endif
@@ -2345,11 +2343,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
-#ifdef CONFIG_TCG
         do_common_semihosting(cs);
-#else
-        g_assert_not_reached();
-#endif
         env->regs[15] += env->thumb ? 2 : 4;
         return;
     case EXCP_BKPT:
-- 
2.38.1

