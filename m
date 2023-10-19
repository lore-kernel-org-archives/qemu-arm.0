Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp503502ejb;
        Thu, 19 Oct 2023 06:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbicv5v26ok0eLBSXtkNOZyDFxfIG6BedLxOyn7snh0vMlvA2BUxZ4IjSVrWpWrAGOToWL
X-Received: by 2002:a2e:b889:0:b0:2c5:52d:c9ff with SMTP id r9-20020a2eb889000000b002c5052dc9ffmr1488529ljp.10.1697721107696;
        Thu, 19 Oct 2023 06:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697721107; cv=none;
        d=google.com; s=arc-20160816;
        b=Tqdcmn0Ti6H57KdwYLzY9xydLoNNY3jfE0zVoYsYq5FG9Qp90Xr3Q4OOelupsy3FWG
         0hs7FuGNOHoLc2O0RwnWZwKyTwXgR/eQtxgCVFIJglSd7s6eQLDbrIHMXFSAH/7lQu5k
         OASgak+P0QXcSVvWQN3teGsd5aS2luf3EC3ewih5Or3vTDN0oiIL/JhKDcz4hx/B/G2v
         CHBvEClwBY64vBcQ0OLwNFKNHdszKCM55ulRPMMX5Ctjmvg8JRM3gUeJ8WmSt9CNv01G
         VS4m5kM7JEZBsHFmc15sVzQGrIYRGEm+budL3l56Pr5su+jHC2BKcl8hyDYcxqhOcDl5
         fudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RG5zLlWN/LC4pJbPVJoFLnGQz4i0tpH2bVvTXsYTeOI=;
        fh=rYBZhAJdgCvxZRRcO2tKw9iXjHkAG8ZfVdmqU/2KeAE=;
        b=s5OkaAWmNv5KWXGHM+BBmx6YGdyU5g/S9IOf+FlPokOxQNidQh3rj5WTkbxPuBXC2U
         rOXkNvA/OvBVKzYjF3jtWCp6t3yjx9xpTbbZiQnijs8jC1gMW0MbEb/WmAx6r9pfIqQ2
         EHwbQK1+NFq0kzQaSNhoS+Ym7dfwHVONtwFrVCw/oNL1HDgRtBkVL6MBNDH9hE/kBzQq
         jnLSDsg1SRq4XSMcU1J4pBjX7z1zG/FzNo5AA4bWt3onGpdl8ylrGdK58B20DUI4Zhkr
         UE60N5jFhagTS+ldW3wS4VcxqbNhf+FQwhqtHBgCVPKdytsvd/+4PVz5nKj/I5/tvgrB
         FPTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RWD6Xe2o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020a05600c3acf00b0040500475492si2482490wms.25.2023.10.19.06.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RWD6Xe2o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtSn5-0005eS-Rx; Thu, 19 Oct 2023 09:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSn0-0005OF-45
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:10:14 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtSmx-0007z5-QW
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:10:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so73090995e9.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 06:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697721009; x=1698325809; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RG5zLlWN/LC4pJbPVJoFLnGQz4i0tpH2bVvTXsYTeOI=;
 b=RWD6Xe2o+7QqJPE/q0O/ioZ6oa6/FeioX42H3ci+ZkC0xlXqvGcWUdZPtG6DohKyMM
 4YXeJ/ZyYJcXuxV6Y5ANEfh1Sw/qDjFkvcpMk67/FfQDC29D31VHzpnFrGCfowrKI7BM
 DdVxZEetBnixBT1MLTp7waEkZ218k9hZACsybrywvFrjReWYGhNVTjjirNJWU6DUzwQ3
 iKjj1szTRt7THElIGZYDXPxe5vRSjNRY34IDpCFGQIasITr6uWGtlX5mAbcxhrNe7/Si
 IJKKSscCj/qxnuJ71sudOtkctqbuaozrYKo7eFD1BYlxu1kibz4mggJMFNgu+5ltpHSK
 Ch3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697721009; x=1698325809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RG5zLlWN/LC4pJbPVJoFLnGQz4i0tpH2bVvTXsYTeOI=;
 b=aII74PfI5HQ5oYxKQZKf/g2oXCA/ASm+XxZI8RB8qckkiJ1aFHFiRo7J+H3pwzRskn
 C7AdmJza7oRg6TOpncwzoX8s3x4qt0maWW2H0BcefW3ItFUdOLjJnfH3uyzJiMLugE8l
 +43WaoL2vTawOHaFoEhoQ7vFe1xIR6Xs9PEX6QMoUsjPFzp1WAvl8VIFzmKCrG3OA8em
 8C7FaJUctyoYeWjN6JoUQYX+o6sNlgPyTPWHM2Pc8mFSf59cFfB4AZXDCm7XtQMbjXZy
 3B5aiXJ68VWK7T10tGIvGtLNNydhTbo4yUrG4jIVX4h3k+n8d0tAAkJG+txkZG7icsvh
 y0vw==
X-Gm-Message-State: AOJu0Yw0NNGBtjxwVEaHvD1MZaDccJOb+u1G5znH9Xfok4XNrvxA9Cm3
 1YZ1P9s+ZYS1ANmUaM/W6TaW/w==
X-Received: by 2002:a05:600c:a07:b0:408:3f64:6553 with SMTP id
 z7-20020a05600c0a0700b004083f646553mr1746777wmp.16.1697721008600; 
 Thu, 19 Oct 2023 06:10:08 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c459000b00405391f485fsm4456618wmo.41.2023.10.19.06.10.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 06:10:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 7/9] hw/intc/pxa2xx: Pass CPU reference using QOM link
 property
Date: Thu, 19 Oct 2023 15:09:22 +0200
Message-ID: <20231019130925.18744-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019130925.18744-1-philmd@linaro.org>
References: <20231019130925.18744-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +1fgriBA0jkO

QOM objects shouldn't access each other internals fields
except using the QOM API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/pxa2xx_pic.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
index 2eb869a605..7e180635c2 100644
--- a/hw/arm/pxa2xx_pic.c
+++ b/hw/arm/pxa2xx_pic.c
@@ -15,6 +15,7 @@
 #include "cpu.h"
 #include "hw/arm/pxa.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
 #include "target/arm/cpregs.h"
@@ -288,7 +289,8 @@ DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
     DeviceState *dev = qdev_new(TYPE_PXA2XX_PIC);
     PXA2xxPICState *s = PXA2XX_PIC(dev);
 
-    s->cpu = cpu;
+    object_property_set_link(OBJECT(dev), "arm-cpu",
+                             OBJECT(cpu), &error_abort);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -321,11 +323,18 @@ static const VMStateDescription vmstate_pxa2xx_pic_regs = {
     },
 };
 
+static Property pxa2xx_pic_properties[] = {
+    DEFINE_PROP_LINK("arm-cpu", PXA2xxPICState, cpu,
+                     TYPE_ARM_CPU, ARMCPU *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pxa2xx_pic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
 
+    device_class_set_props(dc, pxa2xx_pic_properties);
     dc->desc = "PXA2xx PIC";
     dc->vmsd = &vmstate_pxa2xx_pic_regs;
     rc->phases.hold = pxa2xx_pic_reset_hold;
-- 
2.41.0

