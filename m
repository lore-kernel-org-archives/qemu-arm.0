Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446B8CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:51:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE4x-000668-1N; Wed, 29 Oct 2025 17:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE4v-00064t-LT
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:51:37 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE4o-0007o7-FA
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:51:37 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-475dbc3c9efso2164575e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774684; x=1762379484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VF6T+XLbTiLYka39LvghXibf6nOWNgxaucYWDHScU80=;
 b=fJ/s+Gehu+q+SbRgZG9QndGgNadqbenu6zxbCP13ZTesILHJgSfIScobluCW/Qav11
 EEMRpi7x3WPI52ESEV9SCZ/5pOjI3zD5lPqo1hQqQPcAlProdLdxCXUPNzbAtUiWElYC
 eNsnjB8s/PQF8l4X1E9+/9fubalQlBH4bl8B3tYbdMIXUPPtuLRcgBou5S4VzQ1il8SN
 4aE+3ZxWIzyvA9GR0nvx7S/A0YOg+wI1hH1wxibmfPSp9rGxvQtwG4IO5e5z+ZjyOtnJ
 D8MGol+gRPUgHPEhJthhkmIid9xrxK8n4wj3tl2p61ZPcmIaMzVWo2qNiTXpzGQK+5M7
 p/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774684; x=1762379484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VF6T+XLbTiLYka39LvghXibf6nOWNgxaucYWDHScU80=;
 b=RYdhilTiO0xVaNk0g1O2VI1jthkmPUM0ZpRNGPlUVKXTCtX4NxZ0+fegfEs4BCTB4m
 2Y51eWmjrvNPd0Ef0ZCeg2GZ4GdDEaFd1t1a2QulcrYDcM3x+h2sYeZnE7wCz8gNISu4
 dcbhRM476IJ+WogoCqzJkTZvfD7G+fXdtWLKhLTYnqk5EGWnUnbMcYg609EII6Bf8KfI
 O5p747aLa4el0jDcgAKAj3trTs0VBqlZsxHWO7p4Gma5U4TU5oMRFIi4UvkFu9lWlxmh
 Qw1g4SphWubbAS29TEQkEFV/NKldnxx9jr5WNgNFOQmrNC2Xh4+AOPudll4N3k02tClx
 AxfA==
X-Gm-Message-State: AOJu0YzvAIxuhtOLb6JT6dDnGugSC7eYjoxi+c+ZW8MXaL+zmgBQtSD/
 mmDjbMDUP7swEswNZihQcClEb6rQDbkewmA5CAWVZKcrAFjg19IafzWbSr7eKes6tmU=
X-Gm-Gg: ASbGncu/pJNj2X1mv7ECEstdMQqMaiv4hdCeVoMDah1KErEit6CG28QLfXZeP8/aBeS
 MAfa7L+4+lwB7FL4DIm1/x2VT/m3mt4CvTGnBxqroOQfR1W4zbnaA7vo6kCBsI0uBfIrQ13QzxH
 I9aXhgVqFd3RTYs64qAYYa6F4aCFspcgCpHevLj2GH8QZTT1he6ok6Ddf+y72+BEitCaSsIZOgJ
 jpiyMiNfn8pf0IKNuOnxR+X+mNdS8Cr5Fd10LNPsbLy2L7ElN99kGe/ehdW8El/v7jYPAMvUKgc
 JrTD6uQESJdesrQudRv7HrojI4ZCPuJrNlE0Acowuozbs87sCEO13OzAavoWcGWcigZ3+JpCvHw
 JPTGzzeLO2c7mFpwFKNa7tbZFLyuNCcb4WRVGPs4ZuRMxZ4uuCyctWO1C6U1hXDU1maXXEd9mpM
 L1CWHMq9RQpygMqnTIGsRaA+3ZdApWZizhjt9joec/WQ+YADAcZg==
X-Google-Smtp-Source: AGHT+IFiKaVhur9fLuRyMkLTbTbioPhvuTbUKvoJM274VHjz6E/+phYwnKoizGiLlN6cqpMB0N1o4A==
X-Received: by 2002:a05:600c:1ca5:b0:471:6f4:601f with SMTP id
 5b1f17b1804b1-4772686efeemr9424655e9.19.1761774684231; 
 Wed, 29 Oct 2025 14:51:24 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289e7ceasm4510895e9.13.2025.10.29.14.51.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:51:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 11/23] qemu/target_info: Add target_base_arm() helper
Date: Wed, 29 Oct 2025 22:39:48 +0100
Message-ID: <20251029214001.99824-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Add a helper to check whether the target base architecture
is ARM (either 32-bit or 64-bit).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021210144.58108-3-philmd@linaro.org>
---
 include/qemu/target-info.h |  7 +++++++
 target-info.c              | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index e8fbdf19d53..62359622232 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -50,6 +50,13 @@ const char *target_cpu_type(void);
  */
 bool target_big_endian(void);
 
+/**
+ * target_base_arm:
+ *
+ * Returns whether the target architecture is ARM or Aarch64.
+ */
+bool target_base_arm(void);
+
 /**
  * target_arm:
  *
diff --git a/target-info.c b/target-info.c
index e567cb4c40a..24696ff4111 100644
--- a/target-info.c
+++ b/target-info.c
@@ -53,6 +53,17 @@ bool target_big_endian(void)
     return target_endian_mode() == ENDIAN_MODE_BIG;
 }
 
+bool target_base_arm(void)
+{
+    switch (target_arch()) {
+    case SYS_EMU_TARGET_ARM:
+    case SYS_EMU_TARGET_AARCH64:
+        return true;
+    default:
+        return false;
+    }
+}
+
 bool target_arm(void)
 {
     return target_arch() == SYS_EMU_TARGET_ARM;
-- 
2.51.0


