Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp289247ejb;
        Fri, 9 Jun 2023 03:48:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75g+5+fMX0J/8wiGFPcNYySMpn+KHqHiaDBYQ/coHSNu+0XrEsIc0S7etaDG98+rrUSpTe
X-Received: by 2002:ac8:5ac9:0:b0:3f6:af5f:29a6 with SMTP id d9-20020ac85ac9000000b003f6af5f29a6mr1446697qtd.33.1686307702332;
        Fri, 09 Jun 2023 03:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686307702; cv=none;
        d=google.com; s=arc-20160816;
        b=DAXawyxeYWHQtCve+BEFKSc+5Qw10locaEgSZ5i591Ox0sAukSCCOQMIjKjmgEiEgE
         H2Th684/0LmnuH9+kEP2IsNgxVMKC96xAQxjkHWgWU62bvdMXUTr6I80lN14eBZJ7bWy
         B6gaz6RieQ+ZAeMNOw7NypzwReqKdfr7uH5utgXlTRfSSGGg+60Ft8U4+5p+kd2n5FoJ
         ouGKIYiH3Kl8Wt4sSDYa6WiQqZXLC9FzOmIuXVKPDVYKMRW6BITu22Mwpp6mViBICo64
         VZbGoymInH4JF9GoWWPM2hm4pFcy2wBLf6gnjiSeoJQGggUqzQ5ilYarC534qFunmfw0
         QBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tKweUm+um7BdrfNBLJAXxXtSgHD1qY+FtAWIpdBpZZk=;
        b=sQTiOfAuBMnaElOUQJXWvP6vitZ/r6TaBPctAzRjoH3TalEJK4SJC5THT/Y55oevLP
         N+0C1vQjT3809qnbGHzmnERercSjYgtHrA9in9Er6lPmXdwfEhf9qoB3y/j0YgCU58ww
         Tp3Dox7jZI4R5921SqJFMx4KZBydAOBkhBgoFAekJ+ZpyMNzRp186V+B7xD01NzdaIxE
         unwtfZaiYMvPrPz9UWNeUOGQfXcrKWSY4vnju285m3XWsjrEI+xcIsqHfvfV/N7Q4MGM
         5uTEGjGk+me1+cTn5t+hTXCT80+TL1vD5lm/RC5Lh3AGo/n88NQVXuvGaUoahOlC1PTn
         flKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rCGC2gTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020ac85888000000b003f9ac4d2729si1981369qta.507.2023.06.09.03.48.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 03:48:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rCGC2gTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Zei-0000pm-6N; Fri, 09 Jun 2023 06:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zeg-0000pX-Q3
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:47:42 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zef-0001Cm-AK
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:47:42 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30ae4ec1ac7so1100953f8f.2
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 03:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686307659; x=1688899659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tKweUm+um7BdrfNBLJAXxXtSgHD1qY+FtAWIpdBpZZk=;
 b=rCGC2gTU/9KGtVjglyjTAQ5nPPQ8YdLm4D2P9KMDJ9H4vFAuYWLJBclc/P8BwZ1s10
 CMtsMI94BtkKlPaauJ9zHdaj0zxRpNTmLEghgJHE4ihbl+QJ3v35+ww+21PoH36Ymxk4
 LFg4vNEjeGGQrB/wxomzArAXH/W6sNu+p9vPMnnXH/T6WC8JjfnoRTCQUaBneKpCviPJ
 AqirFrIdBBSFbthkW7PC+7gT54MxSsPkApj3cSzqHyhaeKRojpnnp0OTyxDngwiJ6LAf
 F3ZovC9yjrQqwXZy1L7I+y06qg+JZlIZrduAh8hfmHylRE0bF1FYLP9FviHFB/r5vkBf
 MrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686307659; x=1688899659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tKweUm+um7BdrfNBLJAXxXtSgHD1qY+FtAWIpdBpZZk=;
 b=SWZN8SOxYzqTnWGNo4Zc3n8oHJoyAy7CKPqsoSw92mNJIumzlqeGLyOCaKMC5gsDOT
 AmybE5qeRnEEc8y12TxKzlOJdnTshYWbRqCmiVPuftMHzljRVebHmGet2wsRY20811Mj
 lla3aHcsboQZBeuxBjw6ejzkv/p0bFntPAyEVaxbT+CoeAoiZi4xpnpi/Q/u+U99X2Pu
 f6NSC2AKDvRfoEmI710rthkU/levoSNVhCWXRpi8iTVRHnI4f2pZM6TO637jfC8OduNu
 3kOUuVlH2J9JbKzuObYvQGLSgF4QulWpgi1Q0F/9flFQec0i8oGGj+Kjylx1hyAE8WRE
 YB/Q==
X-Gm-Message-State: AC+VfDwEokBsp72i4WdmrvAd7g+gBB8TLZP8o5efxMjFeyIjiSlSHeQb
 QK0DWbhKnKhTa9P0ffRJRWTB+Q==
X-Received: by 2002:a05:6000:1941:b0:30e:3dce:c49a with SMTP id
 e1-20020a056000194100b0030e3dcec49amr636763wry.2.1686307658956; 
 Fri, 09 Jun 2023 03:47:38 -0700 (PDT)
Received: from localhost.localdomain (23.171.88.92.rev.sfr.net. [92.88.171.23])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a5d6dc8000000b0030aec5e020fsm4066472wrz.86.2023.06.09.03.47.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Jun 2023 03:47:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/22] target/arm/tcg: Remove CONFIG_TCG #ifdef'ry check
Date: Fri,  9 Jun 2023 12:46:58 +0200
Message-Id: <20230609104717.95555-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230609104717.95555-1-philmd@linaro.org>
References: <20230609104717.95555-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: qSWZF8UkmfV+

CONFIG_TCG is always defined within target/arm/tcg/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

