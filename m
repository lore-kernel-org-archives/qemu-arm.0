Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7988EF45A0A
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 20:07:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBI8k-0003bC-Dw; Fri, 10 Apr 2026 16:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI8e-0003Rx-FW
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:07:37 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI8c-00009h-UE
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:07:36 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso26735945e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775851653; x=1776456453; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W2vRHiJbej126NbiS5zPSIz+zk3p9OdpjvnZSWOVICA=;
 b=PHKbxTVjlg7Bcc0evQ4KAEQ9X7e1R2TQMz8T1LbaA8BAjk8OReAkbqBvNKIT6ijQjl
 wI2lGGquiFp6sPy2uIoPq/pfuc0edCLz5RAeJ09N2unNLwgkAiDnf1QdrqUTghu8Sbh4
 8y3M/itessbYZ9SR28x+PxrdL+nzYUROmqzwBZtOWOb06xmKgyEgpN7sm+yBpkvcFxYR
 LlD7x0BWCReNELn9U3Saqi15zLKvxaixBLrhFFLZFIoTBCWgkWpt7ZNR9kfIJ/I6+NGG
 5zjbNh69shSF4pZ/B1MDqVCXawe52I6NPbYBT28AKHC/P2LpW7tned7y7UyYLKXxgurq
 eMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775851653; x=1776456453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W2vRHiJbej126NbiS5zPSIz+zk3p9OdpjvnZSWOVICA=;
 b=hehk5maej6P7aDmUsl/pAV1ZfKom9JUV6ww6Q/5O5c9VVXiNArqp9lhJQ+5qDSe/Ml
 JHTkuM28rv0+N7AxdoRSlCYPBzekBGsDblwlCA50RTA0QllpnVfdvxaTz542o6E3DeBy
 +dmEvNIIWpWDpZbbfspVSzIv/H9MzbwZYbuQgZwi6xLHTP8wLIGRRf591VeFRW/L9Kps
 8UlF/VospJebAgkO1EQHv9e1Egvr5TnooZvJsrYoY0/jbGk1LsO6t/uvjsAGfiJhyexY
 PS0uor7tUVDo432dW2cNNZIoaYo8ZXvN0JCIi/SGVxjr2G2VxTp3ZfrvhKFXGuU8k051
 hHag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOGqARoXt5kA3Uui/LoJkxv4LGMd4kywn11kVgkrxl9ubW5paof5IhnNLU+IM2Z4/ZVBtBJpWZaQ==@nongnu.org
X-Gm-Message-State: AOJu0YyFQ2g/Dgq8FTI1gAU+OF74sQd2mKzCSIzX0jWVkXPIYsPoPCAl
 qxuK2YY4hF/Lo9RPcc3dhYkEglriaZscl6TzP7ZyBT/qSmYDXYDsIRlY5sweTxSZ69s=
X-Gm-Gg: AeBDiet3Yd9arRZbQ6CeT85KLvLqaZoaFuk7GZCab+T0IQlbH+8mh8Pk97+EFD/Pn0A
 3lizjGRe33OO5fA880PGycQplnCAa3qtJZk78NU3YhhP2tHmGRd+9Ks5hHO7e4sfHTo65/p4xQ+
 J51Kk9P29fkBYJNrNvL4of7bJGFviGBXV+tsQVU3bRLjAkaBESGzAiQbzazzv7brpgTMDLxn3DZ
 uMfrNEUkTDiyvu5crwpK9Q9lsI6cvslPJ1QlX14+axYN/ymXi273YhFSjXk7hvQBWwvHe6mCSUJ
 cIv6AoqdUtjcsE7SOqKSQvfigVR0G7fMOTA2T5AqvO2kqAdkC1ELzcnWbBJWnxa0u1BcOqLZ9Sc
 n0SRgrqaGpRAjojcgrmMWWmAa7PzM0ayvatrT+A4Re+vpKOpEEZMCpZzjsc4mE0En79vepeOb4l
 P2s+kgLTiqb69r9VMuLZDUMitrnjtmg/efGpJc5JATHuOpWbv8+cCnbE5pg5/w+geT3NwNd30/
X-Received: by 2002:a05:600c:698d:b0:487:22ad:403e with SMTP id
 5b1f17b1804b1-488d6ac9ce5mr60035575e9.14.1775851653320; 
 Fri, 10 Apr 2026 13:07:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d681edc7sm25603175e9.17.2026.04.10.13.07.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Apr 2026 13:07:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 9/9] target/arm: Compile m_helper.c once
Date: Fri, 10 Apr 2026 22:06:28 +0200
Message-ID: <20260410200628.19378-10-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410200628.19378-1-philmd@linaro.org>
References: <20260410200628.19378-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/m_helper.c  | 2 +-
 target/arm/tcg/meson.build | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 1bec8e9aea3..f2059ed8b03 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -17,7 +17,7 @@
 #include "qemu/log.h"
 #include "exec/page-protection.h"
 #ifdef CONFIG_TCG
-#include "accel/tcg/cpu-ldst.h"
+#include "accel/tcg/cpu-ldst-common.h"
 #include "semihosting/common-semi.h"
 #endif
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 95e9da151e5..02774409e56 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -32,7 +32,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
-  'm_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
@@ -70,6 +69,7 @@ arm_common_system_ss.add(
   'debug.c',
   'hflags.c',
   'gengvec.c',
+  'm_helper.c',
   'mve_helper.c',
   'neon_helper.c',
   'op_helper.c',
@@ -94,6 +94,7 @@ arm_user_ss.add(
   'debug.c',
   'gengvec.c',
   'hflags.c',
+  'm_helper.c',
   'mve_helper.c',
   'neon_helper.c',
   'op_helper.c',
-- 
2.53.0


