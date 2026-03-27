Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F7510ED65C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Dv-0002PT-7i; Fri, 27 Mar 2026 07:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Cb-0007o3-6V
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:18:09 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CX-0000Hx-Rt
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:18:08 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43b4f48c47cso1441204f8f.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610283; x=1775215083; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EDzfZGwv6v+8VJK0QWkKKZpbO/PDYJBzFKBjYptKlhY=;
 b=jBJfJM+cdsS+djCG/pTKKCu+KlCme/vky/2zMcZGqCqHt3fBKW8+yidO9bow/GAQim
 TfAiV3I9edLOcWuPMAIuA+0Lt3driiIl65FYmP/UkXbgEm655zndeqhKc8P0B+o6Iiok
 W+cs1kCJFEX34m1S9dLAijIBfQYKap4qZOUcoyt/rVzfpQtk1cYOrM5Yn/H2ONjXX0ci
 gVDqpf0SlS5ILVzhBiwVh0r6qwAlhlH8pzQVGQmFjrkbxghFX0TrhpsiVbgw6OOTZRGI
 yx8aAetRHH23+4uH9zaQotolM6obuNnyAmY6d1WfQvfBYXBrljVEJl2q16nAusqZP6dn
 8OgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610283; x=1775215083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EDzfZGwv6v+8VJK0QWkKKZpbO/PDYJBzFKBjYptKlhY=;
 b=imu7uMg5NBdkiDPfvXseDgO7Ga87/x82IuDjo+nd3Qiawd7RAMjVOh9b38G+ZPw6bQ
 vgLjcPxJe0uzJSbSzutKfrXA4oZkESpZ3UbD14c/Mmb8addllWvLtbJVZSLUZfP8GWtE
 k4Frbi5bWBeLXFVt0slrABMoxvIgGgPHAdYtfaOUBMAAhAics9WdxLgLkWHlIjHw+8fI
 c4t8gHy8kU0DcsQhyuStC4wBpjm/iTWZsNeJ+Ht8VjsC4PzI7JmlQrQArX9tDK3QpZpe
 oNm7EFYFllOJZ88jTAzskN1pq1+jCbS7yDnxBzxrnLt1nTpXfR9yt3YiHDxgrryoEAJG
 d8GQ==
X-Gm-Message-State: AOJu0YyjahklqCUFS90cEjSwYecbcXYfDvNBNCQDK081TWvPeB8GIsYj
 C5r1SKaoAt0jar3JhUhw88TZ209/0IHvqnhPpIOd3UwAef8jj2hjH8fWhoe5TNp/eY+uCZIArd+
 MOYO0Bos=
X-Gm-Gg: ATEYQzyn2JCg3E3jO+yAbr2DBdgPC/wn8x1PoLYeycUWY1nprZSiM+11UqFhyv2yLcv
 GfVxnW+CJyi5kbjS37xExU2rRPBDjrEpZWptgc2BiSag8TvZJMMuWVVjylalbbHNXySGNwul09N
 8XUb3zrygu1wjAnwVN0Mws1ERynDVK677L0S9vMu6dllc6QqTxSIyumZuRy/FUQCNGbDDEJpFP+
 MfypkRONVhsEs0nOpWMgeNxGAKlX4k7KP10Zryzr/OGYR4QCYrBXlGaOK04e+Nzik4nhMDwH/9+
 yHcR4dt2zk0GSP11w2oNaAd0BqCn32ku1UcDedCO4dkGH4xjVFvj0MJssbdedV34oWd6cTnKrCp
 tNu5TITw0bAbGoGsoVI13r21YJIbO+oo3w/bM08BZftPhq7CDzcGoXDTWpe7c+n/5n7n3QEZCb4
 qntCoM+oSRGb+tOeDd8/0sp2jwASu50TtoU3pjDjMzpac/9GJe2BCVkhXt4izM0fBGARBsFIwP5
 j7ntOyBM8ZDSLWUrGyNdg6pkfQV0Kc=
X-Received: by 2002:a5d:5f96:0:b0:439:d769:ec56 with SMTP id
 ffacd0b85a97d-43b9e76a760mr3065581f8f.0.1774610282995; 
 Fri, 27 Mar 2026 04:18:02 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:18:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 64/65] hw/arm/virt: Enable GICv5 CPU interface when using
 GICv5
Date: Fri, 27 Mar 2026 11:16:59 +0000
Message-ID: <20260327111700.795099-65-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

If we are using the GICv5 in the virt board, we need to set the
has_gcie property on the CPU objects to tell them to implement the
cpu interface part of GICv5.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/arm/virt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 15d833ad8f..0aff58bc3c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2675,6 +2675,14 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "lpa2", false, NULL);
         }
 
+        if (vms->gic_version == VIRT_GIC_VERSION_5) {
+            if (!object_property_find(cpuobj, "has_gcie")) {
+                error_report("Using GICv5 but guest CPU does not support it");
+                exit(1);
+            }
+            object_property_set_bool(cpuobj, "has_gcie", true, NULL);
+        }
+
         if (object_property_find(cpuobj, "reset-cbar")) {
             object_property_set_int(cpuobj, "reset-cbar",
                                     vms->memmap[VIRT_CPUPERIPHS].base,
-- 
2.43.0


