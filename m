Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC17FCD4F5B
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:48:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLjh-0003CY-Ui; Tue, 19 May 2026 10:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLjf-0002mh-5Z
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:47:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLjd-0008AT-8c
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:47:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-44a14580111so2706817f8f.0
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779202071; x=1779806871; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qVonUyeaGXe0vVGZ9plcAaTFWYP/F7HODdZmRljC+Qk=;
 b=s6MmW/4Tce8gKYku7hm5MEhv8gfVb5JxAxvfBqR/9UkU9wumnhOIfA0A7dDgCLffx8
 /uCYwh12raJQLTRGSm+AYHaMczc1iffOsyviUEHOr45NckjVLxmjkgjPnPNKgV62Q9wT
 8jsGpO5A0FmkRBtDaMnQsKhz39eNuLzqzj9FECLBdscCLoO1PUaNTjHtxAsarCoi9uk4
 C+dAz8w6aDiJ+i4BF7+MbW/0cq1w2P5iq/p+2Gge1oIee0BSX7yfdw92sZXfggGzOJLy
 YpNEp/pqvbIOStI7KjNLzDdSPnSjuU6HQ1vMN1o2qsrzPT1ri90jtgQGY4D05ZP0cGO+
 GIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779202071; x=1779806871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qVonUyeaGXe0vVGZ9plcAaTFWYP/F7HODdZmRljC+Qk=;
 b=Dx35csTA2w8wZnq5s6aj6acyIFzbPuFbY+XVDGOYK4o4/r8qfQf1woR0airB+fp3kf
 5UpVLc4X7dp4IsvAqoSyvM9N/L4HM0ILe41D0ZZT8YLlfMp7JcwiIUm6L1Hn7swTOksp
 O8zvkyAc2KPC0ZlY+GJr3eNSzpaM9yl2dC9Nx8BX6Izb/ewkf1EGv4Fy1Uwxx0GxlBVa
 o2H7wq+ZC1bFMIYDLRvimXdHy6NFh18cKrnCOwzR+Sd7M0/mpjfKChjM0oOpEyFBBpeb
 N5KcUA54BtaNFBv2+PC0B6jsf+2LViYOoT9p2l8RGZYF6g3WjAkJ4cbcPQHVknxRUV1l
 ljig==
X-Gm-Message-State: AOJu0YyFiHh0lDnfblTQz9twaLPRjR3oKc16XFSud89EyPHDCWCZSsoA
 zU2m4AbxGqvxQjZMvqUXRQavfOfeooKnfIKRUbMvPzyDti6CP6RYdY61eu9c7z716KvkckBUtfa
 4n2n5mug=
X-Gm-Gg: Acq92OEOLMuBhix2kj52GiJnSJt0aKciTL3Ppi+V77GUw+APknX9HUnk2ZGcN9ieLGb
 CMG2KGDda7yqvlX4frHQpbUDkB1KYNLMu0vjr9Wjiz9M4XJOkqa3eS56n7MCoPG/qIHSdkS1p7/
 v8Uk1tc9AGf862yx5379HbeNxcZYJqaJifQ3E8RUTCdzadtc8JrElvwWcDDvRyL4p98WVJ0RAl7
 pM535Wi8mv0gCA8RHcU19ofF8ykJ/m+XzGshV39U4V1pUa06o7VXIr35XCTS6KEVYGcYLWgYZ1C
 dGZzaBFSlbembGmJ4M9eOHODBt24hit2asm678aJxcH6ns+kuv/28FxlPivu2SJLBxfG7mEJ9eJ
 RVv5Mbc7ADhjYxi6umxUKXOlw8R/2e1VKcFmbuQZUqokyyc7z8MhXlCCUwfqoEoD7esSy99Ij2P
 sPcCj/UbJ8bh+oJDbx9llighjc1HUSTvUP/Hb1GHxq/a5fkHSu6E/zNCwR3Ncl/vm3aj1vtuau
X-Received: by 2002:a05:6000:d90:b0:45e:5c98:c8ed with SMTP id
 ffacd0b85a97d-45e5c98c926mr24555471f8f.21.1779202071165; 
 Tue, 19 May 2026 07:47:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe248dsm45543115f8f.30.2026.05.19.07.47.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:47:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 17/18] target/arm: Build cpu32-system.o as common object
Date: Tue, 19 May 2026 16:45:52 +0200
Message-ID: <20260519144553.91483-18-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
References: <20260519144553.91483-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

cpu32.c only contains CPU types used in 32-bit system emulation:
rename it as cpu32-system.c; always compile the file but only
register the QOM types for the 32-bit binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/tcg/{cpu32.c => cpu32-system.c} | 10 +---------
 target/arm/tcg/meson.build                 |  5 +----
 2 files changed, 2 insertions(+), 13 deletions(-)
 rename target/arm/tcg/{cpu32.c => cpu32-system.c} (99%)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32-system.c
similarity index 99%
rename from target/arm/tcg/cpu32.c
rename to target/arm/tcg/cpu32-system.c
index 8220d785f5b..6e983900899 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32-system.c
@@ -1,5 +1,5 @@
 /*
- * QEMU ARM TCG-only CPUs.
+ * QEMU ARM TCG-only CPUs (not needed for the AArch64 linux-user build)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -13,15 +13,9 @@
 #include "cpu.h"
 #include "accel/tcg/cpu-ops.h"
 #include "internals.h"
-#if !defined(CONFIG_USER_ONLY)
 #include "hw/core/boards.h"
-#endif
 #include "cpregs.h"
 
-
-/* CPU models. These are not needed for the AArch64 linux-user build. */
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-
 static void arm926_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -746,5 +740,3 @@ static void arm_tcg_cpu_register_types(void)
 }
 
 type_init(arm_tcg_cpu_register_types)
-
-#endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index d5a95bf54f2..9b859892ed8 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,10 +30,6 @@ translate32_d = [
 arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64)
 arm_stubs_ss.add(files('stubs32.c'))
 
-arm_ss.add(files(
-  'cpu32.c',
-))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'gengvec64.c',
   'translate-a64.c',
@@ -85,6 +81,7 @@ arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
 
 arm_common_system_ss.add(files(
   'cpregs-at.c',
+  'cpu32-system.c',
   'gicv5-cpuif.c',
   'psci.c',
   'tlb_helper.c',
-- 
2.53.0


