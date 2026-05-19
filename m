Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33A6CD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:47:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLix-0000Bz-Dr; Tue, 19 May 2026 10:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLif-0008CC-8X
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLid-0007qm-OK
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45e7c636e74so1639745f8f.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779202010; x=1779806810; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUuTbzCBsTPa5fDwZzVMcoJRytIYgj0mVcNOroys3ic=;
 b=JJ8XKrMdrNT3I3nhJrW7GXQHsf2Wm0WM+SRCXT21TpQ2oMVMA3L3WGLx31kHKPwMLG
 QRiKnNaxRuuowXcAL91f3L+ofRbGoe0185bKJSKuQbS48Bgou5fffN1Uwp4GV8NZJgwp
 Ju4Y6r7T85MrUK853NXUA+y5eCmzzm+EUrSn3loLz+Mc1ook4VyVQX8T/q6GU0sFN00i
 bJQFMkCuFRcCs+PVBr5PpQpq01ZEYRvqVfQn06egxlG0N2ky64VxxrVx2RWP50rE6Iw6
 866q7DMklMU5NMPQZ58i5VgizL+4SGHj45nKyHKyMBs8C1ot2jw0iexPBAjpid1nBHZd
 VDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779202010; x=1779806810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dUuTbzCBsTPa5fDwZzVMcoJRytIYgj0mVcNOroys3ic=;
 b=bnJ6L7x8OgGijOgxi8DlJ1EML3hoKMFgR+5faobOqn+Rk9AkP5V2e8BWZWahzNUTLP
 mVio1ioUge0eyiU2TCfl4fT1yFHisaRN13EnuO/WlyXCi56zPZJRk05h+6j+Wh6vF18z
 M4bcKoWdH5StPd0KCowtTnn5vpnquPUEVAyh0sCRbYaYOWnI5R/pNEZj8JIHYsnowaYL
 chUUq28Ji+txTskpxzRLGzcL4krZ3NKd5i6/rY1fA+7+5ZI7OSSK7gszxn3MBS6hS2EU
 EKxxzWL8c16P6TPDDC5w+598G5oNwDC4g+6I3wZ5pn4JsS47699Ri7nJsoda4EuzJ1Vs
 mnsA==
X-Gm-Message-State: AOJu0YzVUuWOsO4b6Gt6fEpTUFhKhBps1BW+YH7wncAuQG5R7Qh3K3pb
 Y0XxbZn3qOFNPSAWSXBLyr5pH1I+5YPCFLhe3QSJZqoYy9cUnYcGBfOSMSSklDJ9RtP73bpcJX4
 izwMR4N4=
X-Gm-Gg: Acq92OHSNwp2i2BrLTy+8R2nM2N365ypyXD67T5HUSZu1HX7KSJkL0SAQQTAs4hr+70
 tYINjBR51Mgjvoi03GzUedGqPL8rrZKzItNeoakhBDYRexZy9LvdsZNehpe+y0CUeRRAtS7ZgMO
 PAr+r4ZNkrKXoN6L8iUtGq9ORR/6MBmllwKmIqPIMMuVcv7YjUIm1WciY74weRcZ4y7DgFLN2KN
 iXyDL27BAsTjTb1OsezyXwJlLSlGpCNMgdnyA6zxVczhKNn/XbH2OfDBj0kOwfET0KoacGcO1cP
 AzkZILWKuatN9Laiz2gZGcI5XZon8FxJhpFojNqFXyWo72fqW5KH1qE63S+ofkMmMj+LjP7cRgI
 0WEScCgth2TadMpuXtwg10jzNJCMJX5E8onGiG3ndoq73zi8YcEJKrZ081wM+pTnLyRWwTXJZBK
 zW7h4jxuM1a6U7L3X+PMvikTyUvbvE+yfOg5nWtynx2fhC1Vhn5GVwQyF5EZG7TdC74LoY4M8+o
 b5wpHZsHEQ=
X-Received: by 2002:a05:600c:3b27:b0:48e:6275:27e1 with SMTP id
 5b1f17b1804b1-48fe6516b49mr286700015e9.26.1779202010036; 
 Tue, 19 May 2026 07:46:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5e9d5d9sm386449315e9.15.2026.05.19.07.46.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:46:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 08/18] target/arm: Build gdbstub64.o as common object
Date: Tue, 19 May 2026 16:45:43 +0200
Message-ID: <20260519144553.91483-9-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
References: <20260519144553.91483-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

While gdbstub64.o is already built once, build it as
common object, reducing target-specific set in arm_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index e56fc943bdf..5376be2e3bc 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -11,7 +11,6 @@ arm_user_ss.add(files('gdbstub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
-  'gdbstub64.c'
 ))
 
 arm_common_ss.add(files(
@@ -24,6 +23,9 @@ arm_common_user_system_ss.add(files(
   'helper.c',
   'vfp_fpscr.c',
 ))
+arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'gdbstub64.c'
+))
 
 arm_common_system_ss.add(files(
   'arm-qmp-cmds.c',
-- 
2.53.0


