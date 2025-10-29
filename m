Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1D7CCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:46:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEDzN-00006W-SQ; Wed, 29 Oct 2025 17:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDz2-0008Pf-SU
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:45:35 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDyp-0006Fs-Sv
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:45:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4770c2cd96fso2342205e9.3
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774312; x=1762379112; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KyYtKOwHSiL8zG4F6RP7X5U6pXWzdyE6rU1IyLJB564=;
 b=EBLl8U0AWwrMQsgQ8hhARODVV7DFfO9YnYCVmSHZG4cxBI7lRWIjtdZ4ZVqnHIlbos
 phZgY+phFe3eEGXnWFSZam5U21ZeVplpGJzGj4h63mXgPIrWmwhCeBsXPwjKp2d0oO7i
 Qtbq30OwIWgdvX2HCXOtU7Yv6uB3d5vHvM4+eS6rJ9+kaTJYhGImbeM9qEO6O/aANtzF
 +nDjYHu+RTJL8VWlE83OvK0q3/OeCqKX8ST3wNJUlPtk0vyEi915eu//vMfzjcWg+fdw
 BVQg6PZz4Xgvx1KykXMx+8i2+qLclQvIjA0l35ztUU+Cwh1S5eqH9DIhQ8+EO/epe5bw
 FTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774312; x=1762379112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KyYtKOwHSiL8zG4F6RP7X5U6pXWzdyE6rU1IyLJB564=;
 b=eSw2ZjVasw2Hn6OdQ78ADdYf+dvf6pdkEA9vlZyi9GBwXLNzS9C+i2dVCmRKWFqi2G
 cWtepuYuLHqtKKFcfgVnhONVt8nm/bJLQD2hdmvEZv7yaEqNgEH4lNzjBn4HV/Xt7pZD
 lmkws6Q3pxeetOE8EK143PH+SKpC5ufHQVmGjuW7HE9NxslwpggQiBeIG4YcA7WmTzxu
 0SRnabUDL164NamzznbH43HwB2ZXndW33VnY54Gqj+23U5CRz7KsA9xJeX/liK7VHnAf
 a/HJy1WUQGPVTF98KyQhASI5dtU9QSAmIfR2raw9dQ3WpyB6o+pefYP1P2Nj7JVUDvcF
 WmEg==
X-Gm-Message-State: AOJu0Yx1B0Hct4xuB5cBDuED5QLElZvitLXvnK+S4D3bntgBQiIekKW/
 UIRxRC/jqHfn3dT0WPR7BmERgGqjlbAmdv6ttLyacHbG8HbUlfgGemDEvLspD0dFGkHLCflO2qU
 P9jiv2Es=
X-Gm-Gg: ASbGncvyDYLNE1Xo3eOjd8rTVUwbQnRWLwaCTDB4FKvup3hE6bXACPpRkOvFZ7loFkT
 c0PRDItRZ02dUFreE04ftuuVv/yuA7YFevSryVlO/mA+/b7IkTFbEg3FmyqHkEZtpiS22qBVju/
 C4tIE4jyKtxAXmPHXyDzZDQmGSMIiagy4Zgls5AO8owmk2HOruikjIQA3Sjf4riOy+U2BDqKdE1
 Uo4DYyeHBg7pTSsozECVxOQHWJ+Getm4J5DTfW9AwApCCoabJYRtRNnWqTaEN441CValTKdI+kc
 G4byTSksRL7PGD8gROyyvdke7piCCz/oPFc9dzCIBUWBeVl/1HCr3QY6hIITkEMDqUYaWkNwxFb
 ghyOhKPMfAnAKcvDtyjf49bRShk+lbGgqtpgLnUVkxbN6U2RLEj/FRGTEP2Dx+ORpcDCUZn6fSD
 wfNbXFI6yXxJjtB8zTX9HkKdHNKBCghQ5UbNyd+BSXpqjK1EED4Q==
X-Google-Smtp-Source: AGHT+IEAOZ5VfCCKWi0odXrscMhJ4+9p3lgqTEO9tjC7BoKxs5E3q0lBlme4LomOfKdGsZEe2fDT7Q==
X-Received: by 2002:a05:600c:4709:b0:46e:3f75:da49 with SMTP id
 5b1f17b1804b1-4771e406a5bmr41437155e9.37.1761774312043; 
 Wed, 29 Oct 2025 14:45:12 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477184251c4sm55622275e9.1.2025.10.29.14.45.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:45:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 05/23] meson: Prepare to accept per-binary TargetInfo structure
 implementation
Date: Wed, 29 Oct 2025 22:39:42 +0100
Message-ID: <20251029214001.99824-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

If a file defining the binary TargetInfo structure is available,
link with it. Otherwise keep using the stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021205741.57109-6-philmd@linaro.org>
---
 MAINTAINERS                 | 1 +
 meson.build                 | 9 ++++++++-
 configs/targets/meson.build | 4 ++++
 3 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 configs/targets/meson.build

diff --git a/MAINTAINERS b/MAINTAINERS
index 64491c800c2..c7faa5672a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2007,6 +2007,7 @@ M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Supported
 F: include/qemu/target-info*.h
 F: target-info*.c
+F: configs/targets/*.c
 
 Xtensa Machines
 ---------------
diff --git a/meson.build b/meson.build
index de95da32699..df876c72f06 100644
--- a/meson.build
+++ b/meson.build
@@ -3312,6 +3312,7 @@ config_devices_h = {}
 config_target_h = {}
 config_target_mak = {}
 config_base_arch_mak = {}
+config_target_info = {}
 
 disassemblers = {
   'alpha' : ['CONFIG_ALPHA_DIS'],
@@ -3912,9 +3913,9 @@ specific_ss.add(files('page-vary-target.c'))
 
 common_ss.add(files('target-info.c'))
 system_ss.add(files('target-info-qom.c'))
-specific_ss.add(files('target-info-stub.c'))
 
 subdir('backends')
+subdir('configs/targets')
 subdir('disas')
 subdir('migration')
 subdir('monitor')
@@ -4365,6 +4366,12 @@ foreach target : target_dirs
     arch_srcs += gdbstub_xml
   endif
 
+  if target in config_target_info
+    arch_srcs += config_target_info[target]
+  else
+    arch_srcs += files('target-info-stub.c')
+  endif
+
   t = target_arch[target_base_arch].apply(config_target, strict: false)
   arch_srcs += t.sources()
   arch_deps += t.dependencies()
diff --git a/configs/targets/meson.build b/configs/targets/meson.build
new file mode 100644
index 00000000000..a9f6b24ec01
--- /dev/null
+++ b/configs/targets/meson.build
@@ -0,0 +1,4 @@
+foreach target : [
+  ]
+  config_target_info += {target : files(target + '.c')}
+endforeach
-- 
2.51.0


