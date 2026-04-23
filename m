Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA5DFDEE2B
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 17:04:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFxTd-0001ve-7o; Thu, 23 Apr 2026 13:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxT0-0001IT-Lk
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:03:57 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxSv-0005iO-J9
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:03:54 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso42240625e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 10:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776963828; x=1777568628; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zd/YFz6QaH8XwfH3yB/TOjWNiK07VelK7idPnaaUGxk=;
 b=AKPUZKx6dwoeDfixfaux0xF0b0qLAnEXxaSw6RALUHeyx0oY7ZGwBZIVdMZzT1FPSW
 TjlPE+PTjt1zYuVEsTJii4WROdxJH0JhEQ9sf+M+9bmS4MkUuzTn+7uZASwK8nLA/3YA
 hqRIUxk53rV4dNTjgmaiV9fjfYJRpQrsjj+W1AKGtjFp8neJ5RzsUPyAhRwNOilMvKs0
 2cXKM9wRKRmCKAwX58SS/qUrGhJfKXkUnQjT7/l/KT4Y+r5N6RzqfDv53jesuAXptFfM
 uIdS7GAOhWLEFHc6gr9/29U8K2gKnGHGucTEILvU5NH/tw341EePlCp71WRKLAZxOKcU
 GVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776963828; x=1777568628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zd/YFz6QaH8XwfH3yB/TOjWNiK07VelK7idPnaaUGxk=;
 b=jvsXmVA+hJVwnycGBCTQgTj0uF2JvbXgdCWBZr/37ZuBEcNNbx3JGht7g7+gwOZgRt
 ZRQFjVAoVhkz+7KUdBqprloovfIBN2+YC3Ddc8U96WAFKCCb9veRPdJQ0NTrjvuPW56l
 Uar/3gV5LpCqbCoGgC5E5bc9nwUtkMWvBI4kgHawGU0MqswxdlpZ7rxTjygkaHpArmvE
 Tlbc2uXrK872mOD90DMwWidgrO77GYwTS6pGKQ0c7ewQfvVZsL5exATIAJPgMW21o6Ny
 m3lpuVpFCO8gCrEuhjY6t/Uqksl19DudJeAEneHdpdtG59jLxEg/cu1QRZDDFYLuw1pu
 vn/g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/KWpWW4Wv1IAmwFYfd+wSwAjBNxskzYEQ8GP/JMTjdRRqak7fzyfk7K9iFY+h3oUxs+ZjC7+chOQ==@nongnu.org
X-Gm-Message-State: AOJu0YwUR67VI/kl/hf2As2iSk1W3+uC1keKotsBs7joxmfs9p6le3yT
 0eZ0IL+tUQiHVWh4pslzBKBVjcbLn+AhS5r8ZvfemUJ8J9yJokZ9OaOAMqRZqkllROU=
X-Gm-Gg: AeBDieuVr7z1yt7wdLItHYlmeetuAWbdvMfNQSOIcBatHyFjnsD42KR/6FvERaFfkgD
 4gvhA1zC/SRkxSCYClKOa+Z61Fa/VTHVoTFSx4U0LS4vfcgYeOlK27X1YmLzPVhAmYFHmjKiSjf
 4RwGQH0m1cITMGHIfXp0zr61Z93x0VkAv202t+8BGnBVCncW/UbKGBFZXT7wUOf+ThmVz1thCRs
 hbIxhMp8Je2cCuy39kFlbyC7r8E8xNch10MCKpgScEWLC9tbIX+J5osrD3LXwuXsCzLmyGMV9+H
 pHr/bYcop/BjMrBCdKy4TXjMZTIyxL5MXHigXRcXVH7yneKf5gprc3r7Yb44XQiYSQHqHJIRWYK
 AxI5/o8FmXqqqBJ4GKG4egLsVwGnt05fa/VsD2grkVtAb5fQeGzuQ5MIT6Lo9O6ghg2afg3ZqAi
 F4IPQoqU7nXcsZbXgXlrKCLB+/B5Iq5v4rD5mNBTPq0Z6qHe0Dcki9/MdPGEWXxkDvUE6a4qbgG
 V9Ck6saE5wWodfeM7Yjig==
X-Received: by 2002:a05:600c:8b38:b0:485:39b2:a47c with SMTP id
 5b1f17b1804b1-488fb796fa0mr383690255e9.25.1776963827997; 
 Thu, 23 Apr 2026 10:03:47 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f8193sm485631935e9.1.2026.04.23.10.03.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 10:03:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/16] target/arm: Use generic hwaccel_enabled() to check
 'host' cpu type
Date: Thu, 23 Apr 2026 19:02:22 +0200
Message-ID: <20260423170229.64655-11-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423170229.64655-1-philmd@linaro.org>
References: <20260423170229.64655-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

We should be able to use the 'host' CPU with any hardware accelerator.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/arm-qmp-cmds.c | 5 +++--
 target/arm/cpu.c          | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 83ec95c290f..ee17261c9fe 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -31,6 +31,7 @@
 #include "qapi/qapi-commands-misc-arm.h"
 #include "qobject/qdict.h"
 #include "qom/qom-qobject.h"
+#include "system/hw_accel.h"
 #include "cpu.h"
 
 static GICCapability *gic_cap_new(int version)
@@ -96,8 +97,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
         return NULL;
     }
 
-    if (!kvm_enabled() && !strcmp(model->name, "host")) {
-        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
+    if (!hwaccel_enabled() && !strcmp(model->name, "host")) {
+        error_setg(errp, "The CPU type 'host' requires hardware accelerator");
         return NULL;
     }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ccc47c8a9ad..4f98121be0b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1629,8 +1629,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      * this is the first point where we can report it.
      */
     if (cpu->host_cpu_probe_failed) {
-        if (!kvm_enabled() && !hvf_enabled() && !whpx_enabled()) {
-            error_setg(errp, "The 'host' CPU type can only be used with KVM, HVF or WHPX");
+        if (!hwaccel_enabled()) {
+            error_setg(errp, "The 'host' CPU type can only be used with "
+                             "hardware accelator such KVM/HVF/WHPX");
         } else {
             error_setg(errp, "Failed to retrieve host CPU features");
         }
-- 
2.53.0


