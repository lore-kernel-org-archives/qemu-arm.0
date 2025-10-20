Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E9ACCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:11:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAy5S-0006uh-2N; Mon, 20 Oct 2025 18:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy5Q-0006t0-JN
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:10:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy5O-0006KD-GT
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:10:40 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46b303f7469so38495685e9.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998237; x=1761603037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Cw/auqPGZF90bg+tsodLyu1anbpQABoi+IFSvgYon0=;
 b=zg80fWayYLrf53HlAa+hgpR5HoBUmtyA1SQZFmoT2L0+In1axfLREYDe59wmjeHuFG
 9gKAyMJBCODxjc8xj/0Pun0b+PxbwFFpr9w3q7YaxoHEfG27pP77herwmXI7uPzuzOp3
 jArbh/6P0c7+f0TO0meu8uyF9o53pGVPoFd8DXD/zgZSzuATHid8snoOk2iKaNXqIML3
 DWGVOGvOVWbDiGtyKbEhwi0cKIkjdgWZGib23GeO67giGHxgYJtn/bY1r/70NeOIN4vw
 9xA5nLQVWNc5s8LiiI98Lby9URo/11hnIZdb713ie+Q3Fl05GnYGH9RGJwsHBCUL7f64
 g8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998237; x=1761603037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Cw/auqPGZF90bg+tsodLyu1anbpQABoi+IFSvgYon0=;
 b=OirJB6YO/69kHkVxftgPRSrAcHFrJqtQQfp6Q76y5Z3H+vLhh/iO2fHwz4TbgptxCM
 FeNNFJLxW4JSn8Ffw14YnMunTV+hw3J/0VBDLGFuROPoymFKjhPxibbGt/MQU8C7nP7B
 uTifA6YQcj0IcLrNlTBe6j4sLE0MF53ctUriAU1loeG+XFtAAWuYxxBpf9xtMFo4OEJV
 YtVnEDnJKwX2Ys4ljjmmuhUB7xK1DYTEF996eOrC3HTn8wbAoQUI2l975C+osCO4141P
 UQuF01Xx9r9GtrnJwGrVcGEvjcGrgzoFr5Nhy1T+A1MOjz0388mYInqwNWRcLC72sfGm
 KwyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd+GwjF+W9ym7JkrEz2ZgrtgEwJFUXN89SmvpNm0bKujuJkM3jf3gpFUjgF8pG1hTQRolqH34qOQ==@nongnu.org
X-Gm-Message-State: AOJu0YxCa2F9DjPj1ATx20BjRxSuCPojsT/4zUnASkSwcSqAG5rbPQcD
 DMM3XsPpLuPhZu+SeQ6QWLNyBMwkstEhCjVhRiY3MfAm9bq6YlJi9jDED6ICNzH5bKg=
X-Gm-Gg: ASbGncv5RH81+dY9lmGfwQHEBylXbufM1/W8KpBYR26lmlPWIVQ1HaqxVRDgKNSv+RV
 j3/Ad1XZY0BIKS1Aw9GC7rOzvrILC85y33hKcvuEA96SzmhbQWVHTAQvZPyCAn70txX+dxmLBvU
 H9U5cRTWDQp9rozy8iYPWgiJrOtq9GQfGgH9uznNq34EQvgByqcMqzCEYg1CaUftFaBTpFgCA/J
 iWV2BQHeStacdOKIQD9LtfBY8T4t9fjnblOHglYwLaan6+sFJaKI1oClwa6HPBS28jmifPksh4+
 swH/A2a3jyBNz/Qzl5pdB2DUPMavMMKL2gxe+IrRfsOrWpADKBfJYPrJyi8MBtQHvhXeIK1VUBx
 ULpXVSD5jTTTD8+E9vXQEIIeGIu0m/CvCps+NeQo0iQnH6W9l6oXo56SJWNH7VslFQkZHPw4lbY
 2dA/bx5AgM+LpY+iLqERZrUP0tuuXQUxJUlODMTN81qS9Wzs9yFA==
X-Google-Smtp-Source: AGHT+IFLJcFed2v1EwRR5nAucAd53PrnYFHH3fMQTblIj5z3+zgKP4Me9HwpmLj11s1hThPxS/p+mQ==
X-Received: by 2002:a05:600c:3b03:b0:471:14af:c715 with SMTP id
 5b1f17b1804b1-47117874978mr106495845e9.3.1760998236723; 
 Mon, 20 Oct 2025 15:10:36 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494aad668sm4570025e9.2.2025.10.20.15.10.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:10:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v6 10/30] meson: Prepare to accept per-binary TargetInfo
 structure implementation
Date: Tue, 21 Oct 2025 00:09:19 +0200
Message-ID: <20251020220941.65269-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
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
index 667acd933c7..17f90230bf2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2001,6 +2001,7 @@ M: Philippe Mathieu-Daudé <philmd@linaro.org>
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


