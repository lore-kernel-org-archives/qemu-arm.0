Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D894CD4F5E
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:47:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLiE-0007s8-2F; Tue, 19 May 2026 10:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLi0-0007ps-Dn
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:20 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLhy-0007jG-Oy
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:46:12 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4893940bb5eso19980905e9.3
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779201969; x=1779806769; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9/EN5KK+nl5d6BIRkDfVqDEaOJypmF4gAousWcjTwio=;
 b=FeAd2WIVQ5H52CqnyFMrL05eKQZ/E+BvagZ0qfJgc64BaHA7BVIbb9MkO2qF2lQiSf
 O0DJSUZiKuyn66CtMd2WTjtdW+OXeyn4JlHksbSJ4QDeShf4Kzwt9GDROc0BAUatUYuU
 sJqQXVLwXpHAOpZtUATjNBio2iyUPQb64G+6lCC25NC/1pUPv3DSUdoLpHvXC1wKjnhl
 yyykvO6xMWUbC06D9udpZXnLbqB38ySltX6Ut9GdEWuqDKsPwRRtAnERzy/poIEg1VtG
 n3CQrXItxYG4WOMqpq2/BFm+0rnb/4VQhAPB03XJciHeI/4n5S4SpB48agHXQpEy/fhC
 4aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779201969; x=1779806769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9/EN5KK+nl5d6BIRkDfVqDEaOJypmF4gAousWcjTwio=;
 b=Id54q/liZf4WGvchKgJZZ7nWmJMEyvwYbijbbX0h4bAZNkA5UntXwYDuMc9i253dWX
 6ce628IrjIKjNiS5rioiJLLNApAjaQyONziQ57U9wGs09V2UM0+cwg7dks9yp+q2KtPQ
 kxMjVXc88sP6crvWH//HrqCeERWkL8RjcMgf+8Z/EEGetReCoG2Fz8FF2m9+ZJDCaHQd
 FpQMu0DVwaYnU1bvheiSm2haBwdmVgpVmnsP19oMHNz+iMQna7MOc/00zHx4eQB5kYWW
 7cnT7DXQHq6ta3flEcdHbDcO14XRXeQfgsoY0ZTm323o18ZwvR7zWsxnyeWs0ree/etU
 ZmuA==
X-Gm-Message-State: AOJu0Yy2jCIboywBU8q9zAtXLufy78UbRr1dXnXwdmkvnGhPt8SPnHAa
 VGffdSKcyGLhrUy6nnD021xnUlHfn53kXLzNK4jDnxVSOdx88YfDLoXOieA1jmmt8VQ=
X-Gm-Gg: Acq92OEmCLZwo7yI7hBaH/IWSo2gwv7FViCKVjhb46vILlI3Ez1RSuxrPtRPA4w0Lep
 FowU2euckcJkWe9ComaqQjz41mlbbHicmj187f8xbzIjwnekVLKvxrcPww7u/NJKlfrm2NYzlJu
 Mr/aJlZJ1K1EiV8FbsvR6qqXY3PUSblJpwRz+kZb2atDDdMDfOMzZhV9Urv0Ilr2o5xChYe7R5g
 dgtEdFzhpMaHbu1mi5u8RK95mnPlIWOHozzjONQo0PIRA6y79XXfbEZyxURWrkcNsoW2ujr8Zxy
 UN7glAa2E2KWFjjiDDmr5VgokE6uRAB9pcYRqq5Cvt/TpiTxzoGvOmEtuk7wARseReyAuc4+C+M
 0uiysXctqMuOH4z2/zc8rhZBykxcrOiWCSngcdcS4FJr2PRIy57X5l0eN8lBGJQ8MVkF1ppzSM+
 UtX101gI/2ldINfpYspIkVqdm/dBn9NlERqpakGABZ06B7votDPrph4Dul5zKf4MMB+zJTgbKp
X-Received: by 2002:a05:600c:858d:b0:48f:e230:80a3 with SMTP id
 5b1f17b1804b1-48fe6514c31mr243194305e9.33.1779201968986; 
 Tue, 19 May 2026 07:46:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe81b2dsm109154185e9.34.2026.05.19.07.46.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:46:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 02/18] hw/arm/raspi: Initialize 64-bit CPU types during
 DeviceRealize()
Date: Tue, 19 May 2026 16:45:37 +0200
Message-ID: <20260519144553.91483-3-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
References: <20260519144553.91483-1-philmd@linaro.org>
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


