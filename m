Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp291282lfu;
        Mon, 4 Apr 2022 08:50:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIuI+gGchj8kHOTPKfbKX4jmyDpk8Pns+Y37peyF9GpSPn8UMEI6G8Kl5kgYL64WScZgk0
X-Received: by 2002:a81:345:0:b0:2ea:a8fa:f323 with SMTP id 66-20020a810345000000b002eaa8faf323mr549974ywd.292.1649087420203;
        Mon, 04 Apr 2022 08:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649087420; cv=none;
        d=google.com; s=arc-20160816;
        b=qbc21ysJYEeNk6AIuCN0z1i8bAlXb5ukvPHBsqCYZTFgaWKQME9wLk/Hi/shq7n+sp
         vD3dlg3iB5G102dkWX22SRRAS64iD8X7owAoapEXEMVjAbDmlKJJycwLSjkWxrduteSO
         QIvV7KUsvBkjewibeAGkKBvYRJSQC6ha5mf3S4gb/PvBQOXLRhiid9Pz/F37FmBZFSO5
         PPwUMcvzkPS2j2hmGk8fT15o4JSsOw9VP6f9iMHEExpRQc6TkPuyFvibNjE2RIA0DrvW
         GCsk16bv2Enw7/u4m8jw/rzxvw2vgPp3nbm8grhMlH5Z98W2LO0SPri+N54tIt+HpeBI
         IQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8m9EfK0c68obkrRWOTj5E9nZ54Ec0fZc8cnW0/o32t0=;
        b=YtSWyf52Fz9BQ+/Imq83Dk2W5H4wh9wWZy6Gou3ZlWAk6xdENOmm0QHmw/AvE1qxXn
         1Ubd7MIXrjAWtBhi21YmI7OE6jouzUxsuuGurx4XNsvMN/C4rqiisGW34bFQ7XZbJaAU
         kgYqMX4iFHZ2738U4gwsDqSZ8CYYD6gtnA6RIhXxeF5ASc0GAtPnqS+Kk8I0ZS5FFl1f
         reyckHSDl6HuM2cW5kmbEFfOzBX7rxK7OQSRJHILSvsPqcN8T3sncR2Yi9gTatcNLAF1
         a8z1T3sD7k96DuPR/G8VGw7rPUmodOFrqG+rrsg+sokk36Dp61Vvx6NqjpNVFgU6O6dr
         VzdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwL08n9d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v196-20020a252fcd000000b006346f296b98si9225615ybv.377.2022.04.04.08.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 08:50:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwL08n9d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbOyB-0000C9-Hr
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 11:50:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv4-0004lt-9z
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:06 -0400
Received: from [2a00:1450:4864:20::32d] (port=50745
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv1-0000S9-T8
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:05 -0400
Received: by mail-wm1-x32d.google.com with SMTP id h16so6230553wmd.0
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8m9EfK0c68obkrRWOTj5E9nZ54Ec0fZc8cnW0/o32t0=;
 b=nwL08n9dmoyhwEB1vUP2XKeOtuA1ea+98GolqE0ztVfDsoPRi1OQ2aF4rfjrfDIYjX
 kLSKq2YQttdSlX3d4BxWWEu39ojdbcmF5kEU97V4wk3+Ch7hr3RMI2n9ldwQBkQHyeq9
 MAlLbp3IuHx6/aRGjdfizOoR6egqN5467tLjxVCaQzuSY/n61Dv/Po3MOMzvITdBwjm+
 lWgEYYDKYdj/y0qk0OgQGiqv+EpccoXOLI0i/0qm3e9vCZxLEBCP34c9HPRqq95rrJU7
 JLup02NhV5L2u61o1KLxWWGGtopBtFQnO9gVaNfYRw28YP754+1M7ZvRylqbRsjeU/cv
 v3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8m9EfK0c68obkrRWOTj5E9nZ54Ec0fZc8cnW0/o32t0=;
 b=xpy4XEYbskYZVJzOavLJOD4bAOgSqwNmAXBgY/7Xl+Yz8zVPxeReGm1PHC92GyB1TN
 8ieV/u45BCQKbuyCylaNjXXflVA2V5kKmQ3sppJjjjCeHKlSW1Ctj1NM0PvPTTpe2tcW
 3Zty0brvvXd/aqcQkb3uak1cMlACjHQGvZ5E6R/OeXp7renoTqMhUPrZNtZwG/0wMpHZ
 nNoI7JZKwngrAn3hQ+chmEJP89MaWd/D9MfZVk/gAUDVBMs4XarHEVduHXEccSjMw4kK
 x9WKuelt1S+GG7WV//jUUSK1PwKqrEhWbzu1U4QRkzrx5uvz+PJfBn2JmyohL1smwhFl
 XJjw==
X-Gm-Message-State: AOAM5323QFt5shgzQJB+3uLOk+1oNP0VUOYoUPjT1e42hp1GenrhanUl
 DfkwKllalUOfgLq3UeH8KvBYvw==
X-Received: by 2002:a05:600c:4fce:b0:38d:a58:6d16 with SMTP id
 o14-20020a05600c4fce00b0038d0a586d16mr118052wmq.11.1649087222560; 
 Mon, 04 Apr 2022 08:47:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 02/18] hw/intc/exynos4210_gic: Remove unused
 TYPE_EXYNOS4210_IRQ_GATE
Date: Mon,  4 Apr 2022 16:46:42 +0100
Message-Id: <20220404154658.565020-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oocXqcv8IARo

Now we have removed the only use of TYPE_EXYNOS4210_IRQ_GATE we can
delete the device entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/exynos4210_gic.c | 107 ---------------------------------------
 1 file changed, 107 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index bc73d1f1152..794f6b5ac72 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -373,110 +373,3 @@ static void exynos4210_gic_register_types(void)
 }
 
 type_init(exynos4210_gic_register_types)
-
-/* IRQ OR Gate struct.
- *
- * This device models an OR gate. There are n_in input qdev gpio lines and one
- * output sysbus IRQ line. The output IRQ level is formed as OR between all
- * gpio inputs.
- */
-
-#define TYPE_EXYNOS4210_IRQ_GATE "exynos4210.irq_gate"
-OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210IRQGateState, EXYNOS4210_IRQ_GATE)
-
-struct Exynos4210IRQGateState {
-    SysBusDevice parent_obj;
-
-    uint32_t n_in;      /* inputs amount */
-    uint32_t *level;    /* input levels */
-    qemu_irq out;       /* output IRQ */
-};
-
-static Property exynos4210_irq_gate_properties[] = {
-    DEFINE_PROP_UINT32("n_in", Exynos4210IRQGateState, n_in, 1),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static const VMStateDescription vmstate_exynos4210_irq_gate = {
-    .name = "exynos4210.irq_gate",
-    .version_id = 2,
-    .minimum_version_id = 2,
-    .fields = (VMStateField[]) {
-        VMSTATE_VBUFFER_UINT32(level, Exynos4210IRQGateState, 1, NULL, n_in),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-/* Process a change in IRQ input. */
-static void exynos4210_irq_gate_handler(void *opaque, int irq, int level)
-{
-    Exynos4210IRQGateState *s = (Exynos4210IRQGateState *)opaque;
-    uint32_t i;
-
-    assert(irq < s->n_in);
-
-    s->level[irq] = level;
-
-    for (i = 0; i < s->n_in; i++) {
-        if (s->level[i] >= 1) {
-            qemu_irq_raise(s->out);
-            return;
-        }
-    }
-
-    qemu_irq_lower(s->out);
-}
-
-static void exynos4210_irq_gate_reset(DeviceState *d)
-{
-    Exynos4210IRQGateState *s = EXYNOS4210_IRQ_GATE(d);
-
-    memset(s->level, 0, s->n_in * sizeof(*s->level));
-}
-
-/*
- * IRQ Gate initialization.
- */
-static void exynos4210_irq_gate_init(Object *obj)
-{
-    Exynos4210IRQGateState *s = EXYNOS4210_IRQ_GATE(obj);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-
-    sysbus_init_irq(sbd, &s->out);
-}
-
-static void exynos4210_irq_gate_realize(DeviceState *dev, Error **errp)
-{
-    Exynos4210IRQGateState *s = EXYNOS4210_IRQ_GATE(dev);
-
-    /* Allocate general purpose input signals and connect a handler to each of
-     * them */
-    qdev_init_gpio_in(dev, exynos4210_irq_gate_handler, s->n_in);
-
-    s->level = g_malloc0(s->n_in * sizeof(*s->level));
-}
-
-static void exynos4210_irq_gate_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->reset = exynos4210_irq_gate_reset;
-    dc->vmsd = &vmstate_exynos4210_irq_gate;
-    device_class_set_props(dc, exynos4210_irq_gate_properties);
-    dc->realize = exynos4210_irq_gate_realize;
-}
-
-static const TypeInfo exynos4210_irq_gate_info = {
-    .name          = TYPE_EXYNOS4210_IRQ_GATE,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(Exynos4210IRQGateState),
-    .instance_init = exynos4210_irq_gate_init,
-    .class_init    = exynos4210_irq_gate_class_init,
-};
-
-static void exynos4210_irq_gate_register_types(void)
-{
-    type_register_static(&exynos4210_irq_gate_info);
-}
-
-type_init(exynos4210_irq_gate_register_types)
-- 
2.25.1

