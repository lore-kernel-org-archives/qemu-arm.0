Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6878DCD4F21
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:17:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIcK-0002Ne-TY; Sat, 16 May 2026 13:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcD-0002LM-FI
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:15:55 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcA-00080v-Rp
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:15:52 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso390742f8f.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951749; x=1779556549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9/EN5KK+nl5d6BIRkDfVqDEaOJypmF4gAousWcjTwio=;
 b=Hhq0eejZDnIqfbHUarw6LN0F6GiNDVrNgweAvNBOczsNzN795HHsyElGWG1Zk5hTCD
 Cx9IbTTqf9dBDTUPkhBGvAJzqeltExUjk0Fv+as+n7W2Z095bDTCB1avU5TYnZpzodE9
 Rn6LeJVOxOkP3jp/YSerJwiZ32Qefffdntn9zq6scSDqHY4Ji7RWMFf0bXUDhPoox6M+
 pRdDa86ajwnwFB3p3xVMVEk5fripG1DMCAg0eYY73j2atEZR4MjuA/5UxrN2OQS8dj9j
 3Z0Hxt6V7DWfKSrCiuKNBnk159JEfUl+syB5goOk06Ie0UAOMw6UvRlwSKRq23ni1g0v
 tYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951749; x=1779556549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9/EN5KK+nl5d6BIRkDfVqDEaOJypmF4gAousWcjTwio=;
 b=RtvUs4nGIz+0C/vm2AUMKOGOv1O9JHxl44PzgXwPInRbvSK4X/vOYKvPmnK8GtWJaQ
 JD50xs5WTzelwrk/0nWUeK4kIO/QdiKy+G1mehnnjhKC02GjCqSM0+lCxg2JQCYnyMyv
 ulQjb4CqjDlKmDgBA9d7MR0UD7RCkZtT/NnpXxMXuYmDq6TKU+lGyEvnQxsZT5O8wA7J
 5aIZvG1+A+7zPhO/rOpPcEY7lfqdf180rbh8IgSDqKi9+wLGLXS05/OmgHzSdykFzIC1
 X42tQe3Och8PZF2R+qOnyfURa2/UN60ZtVFeAZi3VnZqTGAg5oL8mWpesADlDj8Mnzti
 rYbQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8eXUxNDSKGXL4nlxuIYBsajeMVMfijhN05xz248kjNhCSIYMd/boHU6fH3j4MjyI6b+GVclMoW+g==@nongnu.org
X-Gm-Message-State: AOJu0YyDVEXw2WZeYfVCMD6S2N1TIBxq5TY9ru30OmGAk67c5MxRG0qC
 T3x/mbd3K1LBd4Wp74MgEgPd2NnX09wIr2yhf6yBCqMDYbHpghu+2FQEKE8JTjqwjhc=
X-Gm-Gg: Acq92OERvhGRvwZ4wVKfjX2Qn8hdsozsRCQZND74rqCDiw51qhk2YrE8fmwRC7DQyF5
 js0nve1FukV/vBANFIG5zs+ynPBtV71g1wAahB4VdE09d+NjdWgrtXP24JVS0wFnfiKfCcZOozv
 znAYuXYtsATFYQoVv5NviIf4OFIXK4Lg0bzlechYyKTRxAhOuPW6PFic2qS0s0FEbKFDnUuBbC5
 41q5dYHkESnflTAfM3Ntj/6QkK85/YEm1KhNB4OS0P5VubjgtNESa0jgtFONkGroLF6I7BuhJZ+
 MDRP3p6k5QJQoPk/QsNm1KIpI73p5GXe6TbDRcrGwGRifcqHxm/2YoHDlIoE1oWY1romgzVJQ1q
 GdITTRWeOX6YOp+JkNEiY6zZXk5g3gUyTJpWBaIvq679khvAOfBkwW9/jskpzw8jGgm5OlrFjLW
 Jn4zZPU96Y19QapIAquazW4Ubpp+D9JjmNxwKcIbELPC8Gh/LpI8WDXjhhsESm76LS3/2LRfGF
X-Received: by 2002:a05:600c:c10b:b0:489:1c2d:211e with SMTP id
 5b1f17b1804b1-48fe5fcdedemr91035025e9.5.1778951749102; 
 Sat, 16 May 2026 10:15:49 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5ab3977sm154920995e9.9.2026.05.16.10.15.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:15:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v7 03/21] hw/arm/raspi: Initialize 64-bit CPU types during
 DeviceRealize()
Date: Sat, 16 May 2026 19:15:05 +0200
Message-ID: <20260516171524.19184-4-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

bcm2836.c models 3 similar SoC: BCM2835, BCM2836 and BCM2837.
The BCM2837 is a 64-bit only SoC (Cortex-A53), only available
in the 64-bit binary.

If we build this file as common object, all BCM SoCs become
available in both 32 and 64-bit binaries; however when running
the introspection test on the 32-bit binary, the BCM2837 init()
method tries to init the Cortex-A53 type -- although not
realizing it -- which is not available. This can be avoided by
deferring the CPU type initialization to the SoC DeviceRealize
step (this is safe because nothing uses the CPU type before,
only the GIC access them, just after their realization).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 hw/arm/bcm2836.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index ee2f44debd1..03825e69d06 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -25,12 +25,7 @@ static void bcm283x_base_init(Object *obj)
 {
     BCM283XBaseState *s = BCM283X_BASE(obj);
     BCM283XBaseClass *bc = BCM283X_BASE_GET_CLASS(obj);
-    int n;
 
-    for (n = 0; n < bc->core_count; n++) {
-        object_initialize_child(obj, "cpu[*]", &s->cpu[n].core,
-                                bc->cpu_type);
-    }
     if (bc->core_count > 1) {
         qdev_property_add_static(DEVICE(obj), &bcm2836_enabled_cores_property);
         qdev_prop_set_uint32(DEVICE(obj), "enabled-cpus", bc->core_count);
@@ -65,6 +60,11 @@ bool bcm283x_common_realize(DeviceState *dev, BCMSocPeripheralBaseState *ps,
     BCM283XBaseClass *bc = BCM283X_BASE_GET_CLASS(dev);
     Object *obj;
 
+    for (int n = 0; n < bc->core_count; n++) {
+        object_initialize_child(OBJECT(dev), "cpu[*]", &s->cpu[n].core,
+                                bc->cpu_type);
+    }
+
     /* common peripherals from bcm2835 */
 
     obj = object_property_get_link(OBJECT(dev), "ram", &error_abort);
-- 
2.53.0


