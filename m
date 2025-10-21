Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43113CCD1A5
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 20:59:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBJRg-0001v7-2V; Tue, 21 Oct 2025 16:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJRT-0001cm-8U
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 16:58:52 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJRR-0002Uu-25
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 16:58:50 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso1548535e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 13:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761080327; x=1761685127; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whosNOd1evBb5CN/ykFAtQCNfw3MB+a/2C2jLEAbu3g=;
 b=V9IyRyaEu9M1da8KeOclPPfPOhQlGE+YMSjOfs6g1Sag36H7rzJZtRuPaIOWmhrMs1
 wcEzBZpDBt7JbYVsguLUk6tWRVfpykyxBsP197LaK4V4ijYDqGrpeCvcyoSxtzRbFMKR
 ap2Ljv5fwXaO4dQNHa1qDdI1EeD2DbDOHvYzMbMHJt5HqWrnPelUtTN1Y2MrxQH1dKxQ
 a9cBVLXdOxzdrJ4zGflMp/wjqiFM1MFUx3wUv9DSupnv+ehUxvYov4GJH9z8ZZvxOPat
 +thWManqESklyZIfB0BFgo29F9TlQR2cjNTJci0AiYOPtFPhnytVSQhc2tcty9otQ2N4
 Pwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761080327; x=1761685127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whosNOd1evBb5CN/ykFAtQCNfw3MB+a/2C2jLEAbu3g=;
 b=odneeziH8oOKK17YMIDRkh0We1k6RALogW4Gu6si1NHjb4YXfuAQGn9CRMcWf6YCxO
 4mDObB+H3BtJMzatyXSTq8Ln4p/0HSv0D4nu/CFc8VXNMHqBMHCPUyZL0Cwp9ofn8caY
 oxhq3U4vKoDJ9SyFXoX3mx3h8w4QN4P5JQp6EOJ24VxaV/E92Qr1gUg9LPIzCplWRE3f
 v9Ss19SsKc3NS6BhOFTlTK54v/XE0lBC6Otcy0GnGcU3uTTX2IuSwQedaBkmqru7KeI5
 VHnq3XQ2AoSvtfhD0H0ySo0Z1QltpLxZ5b3Nn6u7vE+cuwMy9WXTU0xML3H6MrK1XcAD
 dBug==
X-Gm-Message-State: AOJu0Yw4xJWFMnDq/X24gTl44W2+nersRZXadzhYrzuoqZ2rQKTn5U0g
 WqoJmLQaTsUpNF68pkMRBcLWxTxnrw4Jfd72TzhXjRmn/rkzc3avYqvWZxP/G1b9/Vs=
X-Gm-Gg: ASbGncswI3fvCOA6W7i/iYxlI0t60q78IkMiYyd59xVRbY9wiHK5A+vnh2Pne6y+XMa
 U4R3uH+SAUunsxwCAbydV5A35lpHYzsnG5BmUQmbXYZw9kK6PLvy3JD9v9Y5HWHV3wGPvQUBK0/
 VOxQ5he7bl0fwnkfW0B8CQ1mckWtY/FIzWQSF36rcbH0/PbSOHWHGsCHR9fo4jiCTQOPBeGmdYD
 ANTODljDZo6lJyV/H7K0NX4XmDD/GyEY7+a/YLwn5LAMPG7kz7CUclwIBdha2JVyzBzK4F6qSPr
 2sXfSBp3lgSPOVMNtBVisLYdL0y2JCBB6zGuVUuGo1n/vzsVeeP1IBrIIfDvxrPBVIDkRnJHm+6
 6hqddI7o7i7p5mpmfYrwtNkqjNC9FPkqD0lAXtg/9OCZc1MjUPWfK+K4W7WlkRwxIHoy3PelH0b
 Kui5KrJu832YXW7xuXssrIm6mA9tBA1jSBxqtIfOo7TClDJ7H+Xg==
X-Google-Smtp-Source: AGHT+IHpqGtzxhLlzJ/8CJcHoSuIpu8z0k+5zMOVhU48guDiApDzEapJg97ybMfj4CPo7dEomB91Lw==
X-Received: by 2002:a05:600c:45d4:b0:471:6a1:26e7 with SMTP id
 5b1f17b1804b1-475c3ed722amr7390225e9.12.1761080326940; 
 Tue, 21 Oct 2025 13:58:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a781sm22333487f8f.30.2025.10.21.13.58.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 13:58:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc.michel@amd.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v7 05/19] meson: Prepare to accept per-binary TargetInfo
 structure implementation
Date: Tue, 21 Oct 2025 22:57:26 +0200
Message-ID: <20251021205741.57109-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021205741.57109-1-philmd@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

If a file defining the binary TargetInfo structure is available,
link with it. Otherwise keep using the stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                 | 1 +
 meson.build                 | 9 ++++++++-
 configs/targets/meson.build | 4 ++++
 3 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 configs/targets/meson.build

diff --git a/MAINTAINERS b/MAINTAINERS
index d4e7fd965b0..e7c99aea3ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2002,6 +2002,7 @@ M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Supported
 F: include/qemu/target-info*.h
 F: target-info*.c
+F: configs/targets/*.c
 
 Xtensa Machines
 ---------------
diff --git a/meson.build b/meson.build
index f4ac0a6e95b..0f27a2a8f90 100644
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
@@ -4364,6 +4365,12 @@ foreach target : target_dirs
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


