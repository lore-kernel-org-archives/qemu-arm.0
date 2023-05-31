Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp230433ejb;
        Wed, 31 May 2023 13:38:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5mKlcxdozcHuJQDX6HRq4CFBSp/dHPzLrCqrQucJ3BR/ZLs/YpwMICR6nCJMqrWdE9Tllb
X-Received: by 2002:a05:622a:486:b0:3f7:fa00:3e5a with SMTP id p6-20020a05622a048600b003f7fa003e5amr5962000qtx.65.1685565530856;
        Wed, 31 May 2023 13:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565530; cv=none;
        d=google.com; s=arc-20160816;
        b=CmJ/IFlsqKF9UY1A9T0JMpzz4C2eg8mhV1pjTjXAqD7G6ns1hzbqL0Afummk1XWNcu
         6xkP9leZCyXjZQ0xAQvwpKhroor5B7DS086mOuGTHNDb3oDoLMjimVTBxyc+6503Hd+a
         +Auc1CfJ/4SzjMAcu+MErGLqRJiqruhlK3kT32V8irvCj1UI1iSLBzCrmqbEzTs8HePM
         tKREzN3L2EaS+BhmUsjoao7E1cu/c25Q5a3tpROhJSoDxLlHFm8wtu+os7VRjeFIHoBg
         h9eW9MiGsgKB/hNK1caX8Rtv5BBjamITGj8QVWUiqv7843UYWtacKxDlkGctzhmDqq/3
         j50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0MtX4o0Ye6nhZ4tPfz5ErTCUaJJiVijCKFgjVroPJbY=;
        b=KulxoNzKHfgV7McIgropn86X41pLKX73DL4+WlCTZe5PaSBMeyutfFNHRD7AyYTJ8I
         nrMNJDf8bIYxX9WOnrIhJIchzQlmHYTXvW7rbVhVNz1sITS0hMAJQ7Z9Wk1/TRxtadMs
         gn1fP+hAUIgvOykxFNmuIYNpcXZeGgwTO2MI2jPZ4kK5Cgc69U/y+QwvKBfRIWwex0KV
         4no6SNZfkFG8eCMwyDKvsqYdqtuEVhcQBffMMn87kF8UpwwPJb675G8vbQQMR0ViXsb0
         wkFOdlT2MExwmnMuPCaXmCPSKU6DiXxPiFniF/xC7ak5kEkJ03NnN5D1c8wV6pwLHf6c
         6fRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WHWopqF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05622a054a00b003e4dcda2644si8724156qtx.12.2023.05.31.13.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:38:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WHWopqF3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4SZf-0001aj-7F; Wed, 31 May 2023 16:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SZK-0000u1-OT
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:37:20 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SZJ-0003Qk-69
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:37:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3078cc99232so44509f8f.3
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565436; x=1688157436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0MtX4o0Ye6nhZ4tPfz5ErTCUaJJiVijCKFgjVroPJbY=;
 b=WHWopqF3gbrH3Y7TxEodIal/tG9Zffcq4zvwmQyh6Nyg7ozxfG8hs6Eo9u64wCRJUV
 bZXjnQFbbPbMAA9EHStCXlWksjNP7OSo4+jMfCv7VG443S5As9ri3JretN2bhD6vTeGB
 JyZQ49S7L8spp7VsgRXQdz0Qw6qZDKQTI1Pu0C7RLqUPivpvnMIae0tnkMMZ9kklj5B1
 fINrWBd7htY80RpSMkLdxFmW+uauouGypaqdEa2y8+v0iqts8pbtRNqjYB1506nj1kLh
 TpOKq3UYkZ9oLGv3TuBIhWetg1e/Evi5RjUgyzuWu7uZKWDE4upZJmzo5xpgPuJ/Guyh
 nEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565436; x=1688157436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0MtX4o0Ye6nhZ4tPfz5ErTCUaJJiVijCKFgjVroPJbY=;
 b=PoKu83aQstGeBio1hkvMD04yyOejnvhJiSDDfgDmgCmBNX3q1gqkh6UsR14KCycDD3
 ANB9lal/RaVrSWDugsWEbxfC6eminc8WB+OXpX5Roctupc+H0G3XsYFazH6+YfpkRwaC
 E8OF0jupVrUcgcdhdctxKKPN8tXuTThxK43ncRZ/oTeBPkHCMdndqPLtY/wZmcIcBtoe
 L6LkaRu9lrUfuYyfsEgCG0UQ55i2NbyB7dbX2OTAm8tRtu8HQUt91yfypJV47hvy7Nji
 59A2pESjTwMXiuPWDcFZnEjq8mgOEfUg0/Kjb2j5D/cHnJKaNJh0WTS+hRoipLrvbPub
 04Lg==
X-Gm-Message-State: AC+VfDz1Ns9HIcxzjUFNXgjHoKx2RUU9DAQQEFdji7yby/wNoVwWK0Je
 Gq6fHW9O3vDRNBOSwi8DTK6fqQ==
X-Received: by 2002:a5d:62cd:0:b0:304:b967:956f with SMTP id
 o13-20020a5d62cd000000b00304b967956fmr247819wrv.8.1685565435846; 
 Wed, 31 May 2023 13:37:15 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d4bcc000000b003062b2c5255sm8009613wrt.40.2023.05.31.13.37.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:37:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/15] hw/timer/arm_timer: Fix misuse of SysBus IRQ in
 IcpPitState
Date: Wed, 31 May 2023 22:35:57 +0200
Message-Id: <20230531203559.29140-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531203559.29140-1-philmd@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: F3qkukGCPREn

SysBus IRQ are *output* IRQs. As some sort of simplification
to avoid to forward it, IcpPitState misuses it as ARM timer
input IRQ. Fix that by using a simple IRQ forwarder handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 6f444e1789..874f9b63bc 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -352,6 +352,7 @@ struct IntegratorPitState {
     MemoryRegion iomem;
     ArmTimerState *timer[3];
     qemu_irq irq_in[3];
+    qemu_irq irq[3];
 };
 
 static uint64_t icp_pit_read(void *opaque, hwaddr offset,
@@ -391,6 +392,13 @@ static const MemoryRegionOps icp_pit_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void icp_pit_fwd_irq(void *opaque, int n, int level)
+{
+    IntegratorPitState *s = opaque;
+
+    qemu_set_irq(s->irq[n], level);
+}
+
 static void icp_pit_init(Object *obj)
 {
     static const uint32_t tmr_freq[] = {
@@ -402,9 +410,14 @@ static void icp_pit_init(Object *obj)
     IntegratorPitState *s = INTEGRATOR_PIT(obj);
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

