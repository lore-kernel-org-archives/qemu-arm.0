Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2959837ejy;
        Tue, 4 Jul 2023 07:52:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGHF0lqdAC+aGRzSWWkUEo22aCQ7MCnv8u/qyQoxpQd0cQRt3XQtVKfPHXRracxReBrcKAB
X-Received: by 2002:a05:6214:400e:b0:634:fe71:de61 with SMTP id kd14-20020a056214400e00b00634fe71de61mr15358807qvb.44.1688482358064;
        Tue, 04 Jul 2023 07:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482358; cv=none;
        d=google.com; s=arc-20160816;
        b=WsowOKzLFjT49OUr21fzbA+h9Yygl7RkM6bsXTxANIkaL0vCbFyGaKKxbMVeMVTSx0
         4wA5SCXwGLdIaAp5kD4JoJDmhzlcn9/OOg3a/eq13A9/1l7ELMy2+FoG4jxO/HdKgtfJ
         BtyLvTk8Q1/p2b7SERzzG7TR4wYS9b6GLUWjOcLbles0DEm2LGpIrtsf4U8p7Mj0Ce73
         eKAhddTbvjVYIbbw7r+2H7D8VTyfexu6NrUn6SYWxueljLyDK3we40WYvxwICX77Nsrl
         Y+QTGaNbNaUI20D6aqIv+iBt56Bsq7aokAIk39uEKFDcripPtLdgpcNWthho/MdgLmxi
         izhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TCPWCNW3sULrKOxLX0GNQbm2gqBGrznr8P5ALvlpdo0=;
        fh=Lngrjms14biHE1uwg3hJItOsHUc/fKOP3kWz84zgU0I=;
        b=B1cplej6rI4t00UBlJKhH/wED6bc+k8m2gLTpqceYnRihE4iCtDmry/yUsBb5HEdpq
         eZXIOXRhwq+l0y/O4p5MJLit6CAOpWDlrRxSP7xHeCCNvw4qtQlaLyGdAB2LRDZi4rq6
         opfhHo+bryav6jdKKQEUwJHtMIcWeZ9+GVpjpFgNl/3zIHQSQ42H+M9A5rMgmrwt19DP
         4ncb9r/d8RlOysYpVJgf5h4haf89lwPs6sjNhHx4bqzbc2B9n0eLFykYj5whZ8VKKp4D
         wVP0d6NccOHUwpDIzj6OFv1sbf0nrYLYhGeUs+EpDyBIMpvn4eTsJXlV9tL8SYz8G0Eg
         kAOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gx+eoLAz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a056214202900b006300b838254si13356270qvf.38.2023.07.04.07.52.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:52:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gx+eoLAz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGhNT-0005kN-Bt; Tue, 04 Jul 2023 10:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhNP-0005ME-Nh
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:51:36 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhNO-0003Fg-3l
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:51:35 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-313e742a787so4906812f8f.1
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482292; x=1691074292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TCPWCNW3sULrKOxLX0GNQbm2gqBGrznr8P5ALvlpdo0=;
 b=gx+eoLAzdCaf2mFU71JLWi4Vszd+vOyUX62jA1rtmJsj1QOhsMhmegoflCkqq+ARel
 049ZkE412nzx5Erpi3pt+A7nnS7ILZxJnrHQ2qJcSVQy1LU9Ex7qWhJM29oDM4FiOiWy
 1+HVMbV9rptsCAm/oZ217opeW5Owt431wVOEy0NhLNvOoKt66Njg3LX9Ig2Dd4mEagr3
 01BBpbzyLFSfnJj5Ohn79QcuMdZXGCHfHMrwNtNwRgsANR/GVpD7wzgyr1KuIXp2bYkE
 4YDANPQxjPCEat75RUdNf8ZDxBzN0Ud8ZK4zeOezTYtU+lGVcuGT7lnnvBqNnGoNq6T4
 UQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482292; x=1691074292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TCPWCNW3sULrKOxLX0GNQbm2gqBGrznr8P5ALvlpdo0=;
 b=eKwtXlmONGX2o8fm6W4bIF1Hyqf7Dy9plhldQJCAUggvCnbFpfF4Xv213XYkszIgi2
 Iu4cdV5vu0SFMDGIamQpYS0+pj+1a1m/kApnY0W+hYjFehFxCEUTxA9XtqwwUH+dAL1S
 H47VI1XqpAKKSq9z6/TCVw819TvJ0ZkRsrwHvAxIl4o072uvmCmH9kqxGq2Lc0VzuRIs
 OynL11OjSdFThUbUgIqgBBalzkVx1Aq3VA+3+DpvyReynTmlfjrjgsAcJWDXz1fr+zpI
 B6VPMDrBtnxKNaunt5/G+9MdJMZqee1FaXBHJdyRP3YlPM8Z/1Bt1a3gJQ3AToNICLJc
 YllQ==
X-Gm-Message-State: AC+VfDzZeHJ4J+64TSFCmUWAQjfy38qChUC+StE4bKPP+bi1o8UWgCiw
 m47bpyLLgG81m452S66oaoYgXg==
X-Received: by 2002:adf:e3c9:0:b0:313:ef28:d3d6 with SMTP id
 k9-20020adfe3c9000000b00313ef28d3d6mr16845550wrm.6.1688482292605; 
 Tue, 04 Jul 2023 07:51:32 -0700 (PDT)
Received: from localhost.localdomain ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 g5-20020adff405000000b003143cb109d5sm2883604wro.14.2023.07.04.07.51.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Jul 2023 07:51:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 15/19] hw/timer/arm_timer: Fix misuse of SysBus IRQ in
 IntegratorPIT
Date: Tue,  4 Jul 2023 16:50:08 +0200
Message-Id: <20230704145012.49870-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230704145012.49870-1-philmd@linaro.org>
References: <20230704145012.49870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: NlJOlMlYR6SP

SysBus IRQ are *output* IRQs. As some sort of simplification
to avoid to forward it, IntegratorPIT misuses it as ARM timer
input IRQ. Fix that by using a simple IRQ forwarder handler.

Note: sysbus_pass_irq() forwards GPIOs and IRQs from a container
to an inner device but only work with an entire set of IRQs, so
we can not use it here where we forward a single IRQ from each
timer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/arm_timer.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index f6bec28884..aae7f3cf9d 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -344,6 +344,7 @@ struct IntegratorPIT {
     MemoryRegion iomem;
     ArmTimer *timer[3];
     qemu_irq irq_in[3];
+    qemu_irq irq[3];
 };
 
 static uint64_t icp_pit_read(void *opaque, hwaddr offset,
@@ -383,6 +384,13 @@ static const MemoryRegionOps icp_pit_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void icp_pit_fwd_irq(void *opaque, int n, int level)
+{
+    IntegratorPIT *s = opaque;
+
+    qemu_set_irq(s->irq[n], level);
+}
+
 static void icp_pit_init(Object *obj)
 {
     static const uint32_t tmr_freq[] = {
@@ -394,9 +402,14 @@ static void icp_pit_init(Object *obj)
     IntegratorPIT *s = INTEGRATOR_PIT(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
+    qdev_init_gpio_in_named(DEVICE(obj), icp_pit_fwd_irq,
+                            "timer-in", ARRAY_SIZE(s->timer));
+
     for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
         s->timer[i] = arm_timer_new(tmr_freq[i], s->irq_in[i]);
-        sysbus_init_irq(dev, &s->irq_in[i]);
+        sysbus_init_irq(dev, &s->irq[i]);
+        sysbus_connect_irq(dev, i,
+                           qdev_get_gpio_in_named(DEVICE(obj), "timer-in", i));
     }
 
     memory_region_init_io(&s->iomem, obj, &icp_pit_ops, s,
-- 
2.38.1

