Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp5356936ejb;
        Wed, 22 Mar 2023 07:29:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set++6GODcdzZlc4xBez9lk2+BmHkTvtkm5+jfrcxbxdKu8pEFcKD1arEIF7skX8SsCT1tvNC
X-Received: by 2002:a05:622a:1191:b0:3e1:5060:5c92 with SMTP id m17-20020a05622a119100b003e150605c92mr6619193qtk.16.1679495382238;
        Wed, 22 Mar 2023 07:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679495382; cv=none;
        d=google.com; s=arc-20160816;
        b=kaoY1/Oq3/BJD20ugrQTCGIQphlaUleWYcSscBuPcqvCpa99046azA9RpZLGq5re9P
         LpglYDVw5HfiwPeoc/uqJXc+McHYxrpkaUaGGMYmBrOd56kgnaZRmVIAX+uWslDiuhiv
         4aJtq7bQAxY0jyR8jEui3EDOVFWaOfOmXmvjPrxh9wbIhxFGz8rkSr4+qz2oCYejWogr
         jp2KxYP3GECGGmfCrhmfV7E+BKD7WGZDwit+4IsyWzbSl8YgpbGNa4ses/9s0x5OqQUF
         woWJNzFTgPyChlmriWd/yLAAguQYf2KVy+1JtkXZi0I9hp8AkTYgke++0qnF5s+3PWco
         HjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZgolkMT8PMDnGL6LNTapds6VAVWk4DJsX2jjIB/I6WQ=;
        b=O32QjJC0r43pZDH0SY0yIyJhdiay+0L65VZQ2dhDJRqMg/YP4BmCxu1aDs8n43UxgE
         tqGIvvPu7GWfHURh5C3vJnnFpJTSSVN2Xk8VDNpObsSRbJ2sEz3exMTZUCpgWXt8ENjL
         2AbOZeSe328Prcm43i9Z9Kjf3y9es8Li4cTHnUk41ctOg7ekXAHUYYmlYzfN+iM0faih
         Yc5fN0ZtgE4b3hL8sZEUInO1IvRmW6O3fTv42MfL4mfnb6/6CIUdjlsKxXcjWoHCInPD
         osCPfPZN08cFl5h7W1YorND1NCw469k7rg+uPRZAaWm1FGMpeL/ec3GmOqS41aOlgJ3y
         bfFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LP2p3qVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 191-20020a3707c8000000b00746a64c81c6si2248309qkh.12.2023.03.22.07.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Mar 2023 07:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LP2p3qVf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pezSp-0003y9-5Z; Wed, 22 Mar 2023 10:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezSo-0003xc-Bs
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 10:29:18 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezSm-0001zz-LA
 for qemu-arm@nongnu.org; Wed, 22 Mar 2023 10:29:18 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m6-20020a05600c3b0600b003ee6e324b19so859140wms.1
 for <qemu-arm@nongnu.org>; Wed, 22 Mar 2023 07:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679495354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZgolkMT8PMDnGL6LNTapds6VAVWk4DJsX2jjIB/I6WQ=;
 b=LP2p3qVfMxVxXcZIq+YLF5GKgjZAUvfQyvARZOAVyhjsi5tPB4A+DRnxBT0+qEgDds
 /AJ470NbnOrs2wnTkRIoEtuE68VWkK0hpVU1/zzmsP0HZrNTVqLMQAUCqf52vKeWtrje
 IKfQC9yhLeKdog0/ztD4YDQa17Vk3gN+ECaDUEWPeMLCxLNLsCSg9nFLVYwN0mDD6L8Q
 gMDGzQgo0SNpm/3VEscyXsrpXQCVirxP9LsJQvg20VR/KhRFk8yHl385l3kTdbYk2srS
 Im2O9yGKTp/b3R2M3SEr2oVSYleGlrvsCJrU3AG0HpzSOmOW4xwIjcSPuRlvf3l4PwgD
 IbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679495354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZgolkMT8PMDnGL6LNTapds6VAVWk4DJsX2jjIB/I6WQ=;
 b=rozyDaNlQABYMz3XJDCOSeSa6obbSieDCICAS/fo0AdfCHrVW27LollEaD+vFbl6jI
 3K12fNQ4R6EkLzwPy6nPrIDnYG28h+OvCOnh9oS0RCqE++IrC17/jc6RLojM12F8HNvT
 w9jiGpUQvyPRf3SV0pkc8V2xZOAUp5QhIydSl9uLAlDjRG1sqjXvGBZN0OpZNi7YbQwV
 A4qIgg0YY8XsbAnFMLmFoGOfxajCVe5LCAnUMakkckDZmzUcRdbkAL4hL01dpkPS43HT
 x/sXDPa27+SWYSq1mlhRPyQ7vP2CcLDT1jAjzDIb9EEtqWr1DSmYJnWuRZEEHFlAZl2y
 d8lw==
X-Gm-Message-State: AO0yUKWu81+nODfGLmjSTvd0yH81XxV7IGeA+IVnOn2NABiFYkXHtN4B
 q/cqa3DC4ZFP7/YG1EqSrJCdtQ==
X-Received: by 2002:a05:600c:cc5:b0:3ed:2346:44bd with SMTP id
 fk5-20020a05600c0cc500b003ed234644bdmr1893510wmb.19.1679495354633; 
 Wed, 22 Mar 2023 07:29:14 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a7bcc8d000000b003ee1acdb036sm6775207wma.17.2023.03.22.07.29.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Mar 2023 07:29:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 2/2] target/arm/gdbstub: Only advertise M-profile
 features if TCG available
Date: Wed, 22 Mar 2023 15:29:02 +0100
Message-Id: <20230322142902.69511-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230322142902.69511-1-philmd@linaro.org>
References: <20230322142902.69511-1-philmd@linaro.org>
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
X-TUID: wFaTYL0F85I/

Cortex-M profile is only emulable from TCG accelerator. Restrict
the GDBstub features to its availability in order to avoid a link
error when TCG is not enabled:

  Undefined symbols for architecture arm64:
    "_arm_v7m_get_sp_ptr", referenced from:
        _m_sysreg_get in target_arm_gdbstub.c.o
    "_arm_v7m_mrs_control", referenced from:
        _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
  ld: symbol(s) not found for architecture arm64
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

Fixes: 7d8b28b8b5 ("target/arm: Implement gdbstub m-profile systemreg and secext")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 655369dc74..2986ed6fc8 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -554,7 +554,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      2, "arm-vfp-sysregs.xml", 0);
         }
     }
-    if (cpu_isar_feature(aa32_mve, cpu)) {
+    if (cpu_isar_feature(aa32_mve, cpu) && tcg_enabled()) {
         gdb_register_coprocessor(cs, mve_gdb_get_reg, mve_gdb_set_reg,
                                  1, "arm-m-profile-mve.xml", 0);
     }
@@ -562,7 +562,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 
-    if (arm_feature(env, ARM_FEATURE_M)) {
+    if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
             arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
-- 
2.38.1

