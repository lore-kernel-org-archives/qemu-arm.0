Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1205584ejb;
        Fri, 20 Oct 2023 06:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBt/M+451KcyrybWE6r2p/bF+SHtTAbp0trAlpc03CEOdWTsSE2B6+MkFnX3HdFpszIuCu
X-Received: by 2002:a37:c207:0:b0:770:f1e1:202a with SMTP id i7-20020a37c207000000b00770f1e1202amr1409498qkm.66.1697807104257;
        Fri, 20 Oct 2023 06:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697807104; cv=none;
        d=google.com; s=arc-20160816;
        b=tPGzmCDDpfDyoNpN8qms1IZ0ysZCu+fiWD6QBWhcusr5Zj2qZQFw5lFKDyQPLqhMO3
         IJDt0VmjcoNRDAkGAuKHSD/QqoqQ/B26i8ZmvKmWBS+eVQZMgFC3wg8hB8GI+5Eg3GfH
         y2USE/YuhnVJQPlRHVRj4IRzlDcpHV57JzKTJCm2gppKeLke9sBgpUBc0/oBCiEm4/0i
         saxlqlYRppwrbuhF0jM+0AlbYjGFrAiS2v54wluCZu0UhQXCLAqCdHJjHUMQpgxLoV3V
         sQAplM4mawU+w25geuXI2BSt8xpIZSXggPKzJVTwuCaLF79m19t4gL9oeHfs/+C3kx98
         CJMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RG5zLlWN/LC4pJbPVJoFLnGQz4i0tpH2bVvTXsYTeOI=;
        fh=QWGggua+3ufs1S3QlzhTWcDhlhc7bBCtXi/Y+/UuB8A=;
        b=FWqR+mB2TxPGExXiHysU29uwStlW+7Z3eOLl64o7we+zGMZ/KWxcBQVXcMDZRunZbk
         SIdUMPivyfIBQ8q0mbKU97ANtrBegQ07fdkC3VkMfytPueUTwa1k0EBfrqil7Lqc8EHX
         PzGFCjggl/UyiUNI8CnhDQ2TPURI2V8GfkxdVH8fnrn5V/vqPdoA1p8bcGfpvF1n63kT
         HmSe91Rqkb9FS9yagycd45YfzlSyH684qWxHSViSUQcvglC7292L3LMri3rlqIN0GOtJ
         EjqNgvQIFS5pRiVTT4+4uWKwZYKFCxHufABuT0yO0/is9dH+GwOPNIEveeAM5eNH5Vdq
         v/Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LEz5uXfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl25-20020a05620a1a9900b007789a19ebd6si1253957qkb.514.2023.10.20.06.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 06:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LEz5uXfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtpAt-0001Hs-RW; Fri, 20 Oct 2023 09:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAq-0000vW-Mg
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:04:22 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAn-0005N3-Mo
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:04:20 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9becde9ea7bso411644066b.0
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 06:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697807056; x=1698411856; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RG5zLlWN/LC4pJbPVJoFLnGQz4i0tpH2bVvTXsYTeOI=;
 b=LEz5uXfath7rEbO83c35/Oj3IIKvsGh54n6x23rKD0IQlgkDCWUhS9vFYWejXNP3VX
 n1japTovWUJOzG6NYZBkiAeZKUbPZfTx2wZRZace+8d1Vd2PdcXYrLzc9eHaDwWtLvCR
 hNxmM/gTdd7xQmO48Xl7TdXZzieECl4nFZgh8qekpYRY3jBUhbmzkwjm3NeRcxQ4czq+
 rbMHqABjjAqkMJOADXfKGxrzjB5gpwAgv+h7Th1LBxogLmDxxqKUd2u6AupRCyNzaL1g
 l3kaULXyjAT+Vf8EAZoIkLDqYFIDe5Oto42GzjOiByFo1zvEFl8rpvppGA1xQQqZMSlq
 wF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697807056; x=1698411856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RG5zLlWN/LC4pJbPVJoFLnGQz4i0tpH2bVvTXsYTeOI=;
 b=GVts/JGwP4UZI8njsSNc6iegbyIiE+8KlQs2d7VJIfpTd7P8i/58xwAsCnjH2cb8ra
 HUbmkQ9AhdaGk7Sg7RlyMf0DvHElXT9lG6HaTzcuCREmaEzClqkEV2Ei/NKJx2zHvdHZ
 LxnKNVal/SOiskRx6whGTUtyXw9NNg2Jz1SPYdHEIEInK1TYwbbmlGuOl2+NDQigHaHs
 BjNRojoVrAFIpWcf2b6zCtE+y7f432B7vtiUabiidL1iLTGW7xgiVSs9XN/FlhtYyZHV
 Wqy6C4nTohcJK+BP/EG/WcquH9uL5jsgYomCby9/YTA0tyZYESvwyQORnSaDaCRDtRrg
 sABw==
X-Gm-Message-State: AOJu0YyeIkG9EAsWc7N/CroDDv8GJ4b1loNQ2D6VxYfhi4TcvnqjZtbD
 A/Xud2+tmagGLX0+uSvBtfGZVw==
X-Received: by 2002:a17:907:3daa:b0:9bd:81c3:2a85 with SMTP id
 he42-20020a1709073daa00b009bd81c32a85mr4700129ejc.32.1697807055916; 
 Fri, 20 Oct 2023 06:04:15 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 x20-20020a170906149400b0098884f86e41sm1459879ejc.123.2023.10.20.06.04.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 06:04:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 7/9] hw/intc/pxa2xx: Pass CPU reference using QOM link
 property
Date: Fri, 20 Oct 2023 15:03:28 +0200
Message-ID: <20231020130331.50048-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130331.50048-1-philmd@linaro.org>
References: <20231020130331.50048-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 98w2DJ1X5Dfy

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

