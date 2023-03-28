Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2652493ejb;
        Tue, 28 Mar 2023 06:31:03 -0700 (PDT)
X-Received: by 2002:a5d:55c7:0:b0:2d2:ab47:3ef4 with SMTP id i7-20020a5d55c7000000b002d2ab473ef4mr13230160wrw.70.1680010262910;
        Tue, 28 Mar 2023 06:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680010262; cv=none;
        d=google.com; s=arc-20160816;
        b=lqJzaQo9EsonZXfmVJhhKG9NC3N6jkUktTUihkZu9ed80V4TRxTCgF9YpGynXEW97p
         z64fhQd2gSbz6YtEuBJFYzILn4UnjWVarPg4PzkcJ1SxeGSTfJH5ICh7YsMCH6R7XWOO
         S7vQ0OqybS6TDfeNre7BYbqo0cshb1B7HEoz1A6Jgi3HlMuOBT1hLYCdtj1wU20XsK4h
         f69UaG9pVy+mcCgV8E8xx9IxStjGmz934MeN43xCavjklDz24BAwbAlvuLS7FLBE16u0
         +dG7NjAg2tBdFtunbIC7wICQTGJTn2m6EJjUXa2LYBTvyIUyUMLjNq86He/FYjrIr6Ox
         QFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZgZN2Srx1PApQn0cW7r82/IW9IYA4I9jqu3/I/uULBo=;
        b=PRQEr5svyuzZzMP129e4cyeSn0zIIP/txbYB0W6c4IDZnmOtZYPxM6YLphmbntSEC6
         i+ilNR2jtRZDuhjO7idVOZGJmqGeunKdYaH+ch24TalAYdJmghf8fxPxgCT2o4BwUds4
         GoQqJNerFBTYUqvse9thHXajsS+kiFDqD3bfuUVPMCGVdzDv0S0EWJsF88X+jc7Mu77t
         ss8u5yHrULknOY355oXvgBvM94U0snhoVbUiVGXluGJ1s+t80LoYQ0Nm3GEZT6D+Dwiv
         8GK2FNt3o2+ATnCzhuLCtIUcGY1ppr5UZq7P923rQn5u53nmHgvWpUA97cPPv9bfqGld
         3XJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w17saQKH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l13-20020a5d526d000000b002d8b59dbae0sor8575493wrc.45.2023.03.28.06.31.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 06:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w17saQKH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680010262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgZN2Srx1PApQn0cW7r82/IW9IYA4I9jqu3/I/uULBo=;
        b=w17saQKHrOFywkpGzdXUOvACuhJiXlOXQrUuWzzZ1nHX4SIqTcV50zfXt4toiGuCYO
         wARwfXMroePVxqYCiJqrykXIxDvY+wKgTTKkR50Frit7R/W8gmepd1hbYC8wkzca1UgY
         LVRwulXdcbrOwLt3LDGQ5t+gbymXZjpCwDN+3Ls8MCpfPxrBlouiOVmji7ArSp8eO4/f
         MWZcVdr57vEidWa7/aI9sG94+e49+5Ik+l8ZGei1/ROVD8bPivOG53vVf4FnlMVR9us+
         sHvPAYgO/lU7aeEg1vj+OduMhGjCJ4Ra1HBYi8BGjDStCv7rjWnkpJ6svPnruaUkPz+U
         jPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgZN2Srx1PApQn0cW7r82/IW9IYA4I9jqu3/I/uULBo=;
        b=Up2sFVMkLHBqqbM+0FuypCVX7FJianoFoLtHvFObST23RhlE3fgSRvRcwfdVha2ftn
         mXuz5pL9kRE5NioIf6pePj176K6wx6vjrLcWvHGCS3jNYBWdUjLB86pmTEr4r8t2/4GW
         wKUv3nbuUfIndaD4HP2dnZdfL/jfV0tB05prRZGEREWIUpmDMy2wI+HNjsvXnnNSnGKc
         knh9uho2KonHfkDDRLm3azD+FOmeDwftN7dGyDz++MNu/0qlMZPyVTzVnM/ZY6hE+9Me
         avMwco6lAMd3yhdJ76tJFsVGNoggugNvNy8PZGPuKfTeYj0TmzyampbxJDQ0/eNd7/rI
         UZEw==
X-Gm-Message-State: AAQBX9cw3VpWjCrFeeKdMSCg/kYTSsyaqlhZG6nknXKpTAH9ERnhAi8m
	HxUkVLvxn7TJi+gBQoR7IZJXwIz269vKQebQBAiTxg==
X-Google-Smtp-Source: AKy350bYw0apj/2HjGjpm3eyvVw1EgyzKtaAOTBPNkxQXeaHlyZu5A+D+tWkcEkS/UuHsB7ZMcwdTw==
X-Received: by 2002:adf:e4cb:0:b0:2ce:bd2e:1fea with SMTP id v11-20020adfe4cb000000b002cebd2e1feamr13667172wrm.26.1680010262577;
        Tue, 28 Mar 2023 06:31:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.210.212])
        by smtp.gmail.com with ESMTPSA id t3-20020a5d6903000000b002e105c017adsm4207620wru.44.2023.03.28.06.31.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Mar 2023 06:31:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Claudio Fontana <cfontana@suse.de>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v2 1/2] target/arm/gdbstub: Only advertise M-profile features if TCG available
Date: Tue, 28 Mar 2023 15:30:53 +0200
Message-Id: <20230328133054.6553-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328133054.6553-1-philmd@linaro.org>
References: <20230328133054.6553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zaRXzAdom0hS

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/gdbstub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 3bd86cee97..13fbe9b0d7 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/helpers.h"
+#include "sysemu/tcg.h"
 #include "internals.h"
 #include "cpregs.h"
 
@@ -553,7 +554,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                                      2, "arm-vfp-sysregs.xml", 0);
         }
     }
-    if (cpu_isar_feature(aa32_mve, cpu)) {
+    if (cpu_isar_feature(aa32_mve, cpu) && tcg_enabled()) {
         gdb_register_coprocessor(cs, mve_gdb_get_reg, mve_gdb_set_reg,
                                  1, "arm-m-profile-mve.xml", 0);
     }
@@ -561,7 +562,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
                              arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_regs),
                              "system-registers.xml", 0);
 
-    if (arm_feature(env, ARM_FEATURE_M)) {
+    if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
         gdb_register_coprocessor(cs,
             arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
             arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
-- 
2.38.1
