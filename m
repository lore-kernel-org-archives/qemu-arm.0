Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7660AC87FD1
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:15:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwO9-0004rg-6s; Sun, 27 Jul 2025 04:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLr-0005Jo-Fo
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:26 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwLp-00046d-5G
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:23 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-23fd3fe0d81so8010005ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603400; x=1754208200; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/H+VBjLr5/lNaQTqOOTzzKgeKFHDBsmPau28iTb4mI=;
 b=gihswkdc1yG5zWDmxfP3qPRO3JMzQCb77ovU0Vja85xvReliclYePA/yW1SwEn3UXF
 5kay344Otb+igmvZfU1kxKLPL/84iTfZ173TVN8cx1PIq42sfdluzxRTNcUFkeeMudgy
 ot8vD9dTgIeinoIn6QbnVLFcdMPyswbhqJQVWjyseIq5E6jaje2op+4+rae1I2OGaaB9
 sJE8bQrBSHq9h5GCbLgXaO9lkiDPp1JWhJDc/uCto1sKWMhtAjrsfhHSYd5J1+hrl2+j
 DAAy/ZS9ktt/0GW6EnHxt16kGdtrFEPkARo67xEmcxicYCKb0ywI8S1PA0wvnf8UtrHU
 zFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603400; x=1754208200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g/H+VBjLr5/lNaQTqOOTzzKgeKFHDBsmPau28iTb4mI=;
 b=K2etJk7I8n+9FwtA8pn7N00sAqsICDy2xBNRyxTsyjpoubQQfUV6XulVvRbdpGpcK+
 yORGTBtU1WXbbzU2J4ayJ2/AeFeWcDFvwc9MG5NEeMDGgoA9HDDmMVPhneNp+jzxpPvQ
 mq/UdLKvtD4b0xxYFR7zyP81NY1+sUPn35Ov/JBC2wPbREbr+9kdKLeXQwcFhSpK6enT
 xmDatbjlbAj401eKdUoo1nCTeePmrw4o3pEi0N5tqyidb7WnkJtocdlgY3v9F7uH6FRV
 aqIHNa33oEqz3EThpeXWU0DA1o4gtRm/3Wti0ozRneV7uH0pPZqp5TNE1TqmGRswjUTP
 EENA==
X-Gm-Message-State: AOJu0Yxff7M/OrEsZ31jtoLGLAiSRus2/0+O89oKBWAUC1Sufmuc0t6z
 eMiMQ1fF52ONWg3iHonyCMS2DBUl44TbI26jaWQg5dju+5o8qfaoNciSw23pk9jLdjk=
X-Gm-Gg: ASbGncuhvcujBugpCWuf7A9Xd0EXaSCKkOUDf/6rDKwV1Bqk3sm1VXhQYUbPWPSZCWx
 /3nGDPt5DnOLzh+QitrpuVmEqBg9JSlaqEaXteFvAYpuA1XgQdOswBwDNEfe6RySe4cWBgDMUj5
 iuWHk6WNzOFDIQNF1lbEFOABGebUTv5rzut5/V0+gS5OVabEYtvrVMkdlUoBq9YyMo3zsAsL/hj
 nU5WAcFjyAElXxG30Gi4UveCRxQumxiwQdrlR22W0tDqSn0qJuV58J47rldPpSxEyS0xPF3zY+y
 P2TO9PP6X506qVJexgm//OMKZdMqjWbn1JV5IMLvgdizgv/cLz0x7320/Qd2fyP5xiTZSuGylMQ
 Iqaw35gOyn2Bm0rWGYGsuWG7v9HR5IFVmWFWIdpDBPoWzxx0IwWoJfZSSXeifhg296Z93yVOpIM
 3jJGdL6UFnmA==
X-Google-Smtp-Source: AGHT+IFWl3mYtL4BVjPxu7XrjmhNtAST6JwW8VgxkFgsUafWT5AcS3A379PaQEj7JzojeSE0JE6NBw==
X-Received: by 2002:a17:902:cf12:b0:235:ecf2:393 with SMTP id
 d9443c01a7336-23fb313a940mr108350245ad.53.1753603399873; 
 Sun, 27 Jul 2025 01:03:19 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 19/82] target/arm: Expand CPUARMState.exception.syndrome to 64
 bits
Date: Sat, 26 Jul 2025 22:01:51 -1000
Message-ID: <20250727080254.83840-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This will be used for storing the ISS2 portion of the
ESR_ELx registers in aarch64 state.  Re-order the fsr
member to eliminate two structure holes.

Drop the comment about "if we implement EL2" since we
have already done so.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 7 ++-----
 target/arm/helper.c | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fb87fcc3e6..4940bd6a45 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -644,13 +644,10 @@ typedef struct CPUArchState {
      * entry process.
      */
     struct {
-        uint32_t syndrome; /* AArch64 format syndrome register */
-        uint32_t fsr; /* AArch32 format fault status register info */
+        uint64_t syndrome; /* AArch64 format syndrome register */
         uint64_t vaddress; /* virtual addr associated with exception, if any */
+        uint32_t fsr; /* AArch32 format fault status register info */
         uint32_t target_el; /* EL the exception should be targeted for */
-        /* If we implement EL2 we will also need to store information
-         * about the intermediate physical address for stage 2 faults.
-         */
     } exception;
 
     /* Information associated with an SError */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ecce93fb97..154bda3cd4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9438,7 +9438,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                   new_el);
     if (qemu_loglevel_mask(CPU_LOG_INT)
         && !excp_is_internal(cs->exception_index)) {
-        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
+        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx64 "\n",
                       syn_get_ec(env->exception.syndrome),
                       env->exception.syndrome);
     }
-- 
2.43.0


