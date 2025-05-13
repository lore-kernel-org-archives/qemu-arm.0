Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp688574njb;
        Tue, 13 May 2025 10:48:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFgfyf47hEyYkTH/StNaLIzL7PU3Ngd9TYQ9lOX0Rv/jYU6akd3lAxu2qm8+S406VVEzbARx2R6wxIzA==@linaro.org
X-Google-Smtp-Source: AGHT+IHCJCDpiNsl7u9lXv/F+EIYKVTNo8llUUpnQVmB4hIwbJ7GTUs1hZT4Zk2kpK7ite55ihf1
X-Received: by 2002:a05:622a:2506:b0:48b:50ea:85af with SMTP id d75a77b69052e-49495c61d89mr6112141cf.8.1747158512194;
        Tue, 13 May 2025 10:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158512; cv=none;
        d=google.com; s=arc-20240605;
        b=VZAreAgkqkEp31g39r+4l3oGEsy1WHOzb1LLLMjVNX5r3imJq9CHNXAbjrt6ISd4h9
         N1a6TS3wGr3mipbMDT/OqpYAUxz1D3+AN21T/OijuOjiU2xqXAHaFpk1va9q0yjFrzSD
         cCKiIyWYXcG6OBzatvIlciPnDS9wh1JPHuWZUCvvpxVQiCNGhC6VNbyBS99nvBbegbqi
         NxGtwnjKLJ1sQrXU1+qWbxGB6G8kN4aP5m+LQv2hNWhk9O3akn1zxQupQyzAUKFQ1Jun
         ToZmR7J6UWu4Ejqk6KZRDNLp//bQAEwy2av0VxTfxx3gtxKwb0BfGOxlBvgfERIBkhHM
         WVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Mc5S9P/50U+uOhuImq7ntWk/pRQZs10UmelyfyrMZ/I=;
        fh=WZiIPrTY25yc5HYtJk8nfPrAY3f2/uNkYS7+okLXM9k=;
        b=DW6tNtAiJPPEaS7yt25gF+nOMmYzR/xGeOSPp+1hVx7drO6soVzhE4ooNt3AmjXWJU
         2JYwgqai7GgS+ms6EN9XzzqpUBUWi8PUbuNTI6S49WZBBxWQ8zt845QD29ejn1VjaAn1
         ZKhZUJmSPNz+T0pfR31r+sicoZ7ewMVIfrRYXyMCmLn9pQoml7XzUMdHWE3d3nGDw+cC
         RJo/8ceE4mifkMzs2qkobkF+qDyQLF8n81NK8/3HNuROG9HE0fLaeQBEAPRtQvzGSLfT
         4hgzih8gGrze+qG//IJMNIPp7XpBUmNva6Xye35HLtV9klTwC/q/QszfrTESWKbaEYp8
         Ibrg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XtMiMzbi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452554d1fsi119536301cf.332.2025.05.13.10.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XtMiMzbi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtg0-0003c9-DL; Tue, 13 May 2025 13:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcp-0000u8-9i
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:41:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtck-0003RZ-TR
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:41:05 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-441d1ed82faso41445345e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158055; x=1747762855; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mc5S9P/50U+uOhuImq7ntWk/pRQZs10UmelyfyrMZ/I=;
 b=XtMiMzbiW37jSEUA7c/VQb+J1gZozMwDIkBcgt5URMFBmPyzIdkkmhlQzPA8P4buWm
 1b/BTe7GSaLNACC9+haMtbu5paHvtEa2yRuDTUC6lTX2Uhh7fuVBC4r/p87PCINFZBP0
 sLm252opMS9OVXy+0kCMT+VTBkZ2MBZt9JOwIJsTJtpg1b4H0Fauh2S0Ih7xp+DfSr/+
 OUrZb1A8otzlgKN0M3DKoV5xR4wATJw0MG46n0usKHrHB2HaKEIl4ZiE2RzUT9etVOXj
 f62VbZ7L5RaJHP2ZO2lhaLgHiz0FdA2nYrrSewiTLobYVm9xLRyj2rfHLhjZVuyVmy+X
 5f3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158055; x=1747762855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mc5S9P/50U+uOhuImq7ntWk/pRQZs10UmelyfyrMZ/I=;
 b=JABkyqYMdVzXMHE9fMtS9IUQKuiax0X++XRjUGAIFeHh7/FYkblyADPVtcII+1gE2U
 f3yxPqfltYgpavhMD+9212LvczUwh9HPFsOdQvmBlBzN0ApaEi9Yi+XaAEb3+GH5cXbH
 QOq0jRZmpahD8T8XHw76t64V/eEXmMtj/D97MVTQAmtrT+1rBwIcFr4HkMU6Ze+dYrcJ
 osA23zDE200mtKh/Q1hX/8gyoT7a3L7ND8rO0IIvFWrex1PinPgZOgwRfH39s7FtqaAh
 YHHuLH6d6F4DoDFN4eW2B/z2efssPxpN5dKS5TQXvBrW+7CBjhTP8U8e8Qik1/x2A8fZ
 Y2sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz7Adp9ZdcodCLl5IhXlFnn0LLQa6Rk2d4/OMY7Abw3G/TKQXia3mzOW+ubAjKfqkMj06sZyXKgg==@nongnu.org
X-Gm-Message-State: AOJu0YzOAg/HpCn6HHOi1R/23eNbEIISNwVWPZ8USF3fAm5q5dJCGNd/
 RZvb7CJY26QjMpF40hNN4+8/BP/KrJaVNFAbmfJ3nXvMpgO6bJFLBQqF7xWgR2I=
X-Gm-Gg: ASbGncsAn0X+kRQSpzF9Y2I0rh68k4I7xlkEoN0XselBgDY/jPiKWbM4tZ8IetMfABJ
 SS1B/sbPAB3SKP1KjpiGSK+yDBV9l5TL+ak3FH1VpxOMUGojQdLr1zThx+783x1QIXvY7LZIEpu
 Of2jGJ587FI3sIGJoYQp63j6RO7Oad/684HgjgNyn4I6k5lx1qyvzy8AhrxiPMsjSC3Ergor6ak
 Br6YJ/W5ksAbSPOeRoAJdygrisktS6mLXGfvOFZX2YKeJC3fu7h3zuRYlLCAp8IUPM/A74D38Xp
 mVEv3FHCtSl2zd6eGBIijTm/L4uqnEBTGBnhWsGiydp2Oqp+SP2zierVi6B088nRRVUH8rKHZgI
 ggsrnyXvgtG1oAOegw2802LfoPNv2
X-Received: by 2002:a05:600c:6308:b0:441:b3f0:e5f6 with SMTP id
 5b1f17b1804b1-442f215dcc7mr1737495e9.25.1747158054951; 
 Tue, 13 May 2025 10:40:54 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67d7795sm181970525e9.8.2025.05.13.10.40.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:40:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 17/19] hw/arm/realview: Replace arm_feature() ->
 arm_cpu_has_feature()
Date: Tue, 13 May 2025 18:39:26 +0100
Message-ID: <20250513173928.77376-18-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: d6YkfsLKsqDx

By using arm_cpu_has_feature() instead of arm_feature()
we don't need to include "cpu.h" anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/realview.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 5c9050490b4..4c0a8b42709 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -9,7 +9,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/primecell.h"
@@ -31,6 +30,7 @@
 #include "hw/sd/sd.h"
 #include "audio/audio.h"
 #include "target/arm/cpu-qom.h"
+#include "target/arm/cpu_has_feature.h"
 
 #define SMP_BOOT_ADDR 0xe0000000
 #define SMP_BOOTREG_ADDR 0x10000030
@@ -77,7 +77,6 @@ static void realview_init(MachineState *machine,
                           enum realview_board_type board_type)
 {
     ARMCPU *cpu = NULL;
-    CPUARMState *env;
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *ram_lo;
     MemoryRegion *ram_hi = g_new(MemoryRegion, 1);
@@ -138,16 +137,15 @@ static void realview_init(MachineState *machine,
         cpu_irq[n] = qdev_get_gpio_in(DEVICE(cpuobj), ARM_CPU_IRQ);
     }
     cpu = ARM_CPU(first_cpu);
-    env = &cpu->env;
-    if (arm_feature(env, ARM_FEATURE_V7)) {
+    if (arm_cpu_has_feature(cpu, ARM_FEATURE_V7)) {
         if (is_mpcore) {
             proc_id = 0x0c000000;
         } else {
             proc_id = 0x0e000000;
         }
-    } else if (arm_feature(env, ARM_FEATURE_V6K)) {
+    } else if (arm_cpu_has_feature(cpu, ARM_FEATURE_V6K)) {
         proc_id = 0x06000000;
-    } else if (arm_feature(env, ARM_FEATURE_V6)) {
+    } else if (arm_cpu_has_feature(cpu, ARM_FEATURE_V6)) {
         proc_id = 0x04000000;
     } else {
         proc_id = 0x02000000;
-- 
2.47.1

