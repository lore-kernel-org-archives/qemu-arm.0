Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2959759ejy;
        Tue, 4 Jul 2023 07:52:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6CKYcrYRkTYqC2MtX1MZV99suHedfXhtv6szwh71YddvN68+F7ITCR4wq4eBWsi5KGEoxC
X-Received: by 2002:a05:622a:15d4:b0:403:2761:9e6a with SMTP id d20-20020a05622a15d400b0040327619e6amr17076986qty.1.1688482347385;
        Tue, 04 Jul 2023 07:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482347; cv=none;
        d=google.com; s=arc-20160816;
        b=u0pJSF/eEgikJvBDN3USINGbibNnhW+TM80XQ4sxHQNx9X4QzWhN1SJbp3N7mALZVo
         zY7Yco8AWLjrpGx3Ngwa8gRD5bJB85HR+t3GR0VYLkFEPcqlrQzWa2cDPm79O4RT6Idm
         3u3RMrbtEwBfpNhJrZFn/pjMlzWgjFlly9JcxslDfLiHwl0YTcnhwmTMkhZBmCLsSz1j
         4Oa2KfyqEaVX6J61tPvihAtvWGGqFX819YWWcQOAOhaFl94r84y88j9MtPHFPSaQPKCG
         p/ACy0erqKB9GMy1/iusu3SiYn4q0Ej2teF6R/MwNIf4BlGkjXsPgZy6eer/DWmHBFmu
         /I2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b+zARDWiYMa2zugIyhbA2CbxSW+PpQ6qM0E0b9gZz88=;
        fh=Lngrjms14biHE1uwg3hJItOsHUc/fKOP3kWz84zgU0I=;
        b=kzJbm4OWRBW9fNvykzePg3hQ69TWbbS33r1ilplrNITCf5cH5VksiXOZxFwKwyy7KV
         dmH97hXG+u4xuzqWWXeB8KIDaerLrpgJvuyax7k4M3+QXt/Qi7djSVxD0Iao1RbTqGPJ
         aeBnEF0hQnvFXB+cfaDEi/sB2pVUYPPDZaPdQLZUy53HcY2IYI0K4XU3pjJjJCBXxgiM
         jEAcPyTIfrWSxI+SpgUR0HZ9UqEVRNUnkrK+sSelLpP699XwdcSmljHBqiP+/otCCzVt
         wk5mwtCGVjEW/56edt67LdUPEXfwzxj1c61Mk9SnWVzLANT4qEu7LIGFZ7p4IZdkOj67
         RiBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kU67izzl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020ac85c09000000b004034944f9e1si5946285qti.458.2023.07.04.07.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:52:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kU67izzl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGhNQ-0005Sh-W5; Tue, 04 Jul 2023 10:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhNL-00059A-ON
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:51:34 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhNJ-0003EL-H7
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:51:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbc244d386so62178915e9.2
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 07:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482287; x=1691074287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b+zARDWiYMa2zugIyhbA2CbxSW+PpQ6qM0E0b9gZz88=;
 b=kU67izzlgoXrC7euI1YdCWpidyIYfhKlX2LloXcpixbhbnfZ5TaN6EFZjVhkKxOK91
 dkhKIl/s6QyWgidUU4C0e7K3RwUCpYrMjHXv5xoAGzqqEx7mAOo/Qn1H4uLovCQ9RMfx
 Vlo82LLn38SU7tzuEPteIssjt/6dySXu9oGjM9iVu+GWTnzIKYRlDQrd0GrBSHAz8EWk
 Q3c7qp9qI4m9miHPd3MWeSyHS1vMifZrpj9VzuYJfZb2lAEIwtKE9Uyeb5n8DIMkcUnm
 AOOCLsazU9Am1qxdYv9iDHWizznTllD1hjUO3roJzeZq4ZQrTY5aqHLE6KEmEbbta2jx
 S5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482287; x=1691074287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+zARDWiYMa2zugIyhbA2CbxSW+PpQ6qM0E0b9gZz88=;
 b=WKu+JIW3O7ZsySt1s017xI25FyOXdbFeaSkLcJowan2+AhYm3g4Yu44xjtCh1NYRj4
 v6V8rmIx6KsaB8EPIf+JrkA20+k8NJqBqbX6s2iM9EEPLu6qhWp+BreCwjmvSBDemNN5
 LaNTdo+vp1ecxjuX9zMZri4M7kPhmKlFGM3jnWItbW2KKQPCdprhm0dqABxFfzxFtls1
 AO9ZhZ9dzForWkt/X+GiF+sPBmC98yY3TUEfYga+B86YEv/mRnemP6EVwpMVbSn32/UA
 tHdAALym6vXFNIBaZ9dxOAnZBZWUujwH7JUU7Qz5XZeCg0J9mt+O/1P3mC3KdWsIs61e
 pkdQ==
X-Gm-Message-State: AC+VfDzwQDaOtWYK5Hqj8WndA8YxBAuGa8bVZoXUXQUGTZsUaAUI2BzH
 fS3eoOfGTF3CYHCn8YvNURRU6A==
X-Received: by 2002:a1c:cc16:0:b0:3fb:404c:15e2 with SMTP id
 h22-20020a1ccc16000000b003fb404c15e2mr11246156wmb.41.1688482287277; 
 Tue, 04 Jul 2023 07:51:27 -0700 (PDT)
Received: from localhost.localdomain ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a7bcb8d000000b003fba97b1252sm20393533wmi.1.2023.07.04.07.51.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Jul 2023 07:51:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 14/19] hw/timer/arm_timer: Pass timer output IRQ as
 parameter to arm_timer_new
Date: Tue,  4 Jul 2023 16:50:07 +0200
Message-Id: <20230704145012.49870-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230704145012.49870-1-philmd@linaro.org>
References: <20230704145012.49870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: xoj/KflUYNd9

Both SP804Timer/IntegratorPIT peek at ArmTimer internal state.
This is fine so far but we want to convert ArmTimer to QOM
where peeking at QOM state internal should be avoided.
ArmTimer's IRQ is just a pointer, so we can pass/set it via
argument, avoiding accessing ArmTimer internal state except
from the arm_timer_*() methods.

Once ArmTimer get QOM'ified (in a few commits), it will
inherit the SysBus API. This IRQ will then become a SysBus
IRQ within this ArmTimer object.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 68cd50314f..f6bec28884 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -179,7 +179,7 @@ static void arm_timer_reset_hold(ArmTimer *s)
     s->control = TIMER_CTRL_IE;
 }
 
-static ArmTimer *arm_timer_new(uint32_t freq)
+static ArmTimer *arm_timer_new(uint32_t freq, qemu_irq irq_out)
 {
     ArmTimer *s;
 
@@ -187,6 +187,7 @@ static ArmTimer *arm_timer_new(uint32_t freq)
     s->freq = freq;
     arm_timer_reset_hold(s);
 
+    s->irq = irq_out;
     s->timer = ptimer_init(arm_timer_tick, s, PTIMER_POLICY_LEGACY);
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_arm_timer, s);
     return s;
@@ -209,6 +210,7 @@ struct SP804Timer {
     uint32_t freq[2];
     int level[2];
     qemu_irq irq;
+    qemu_irq irq_in[2];
 };
 
 static const uint8_t sp804_ids[] = {
@@ -311,8 +313,8 @@ static void sp804_realize(DeviceState *dev, Error **errp)
     SP804Timer *s = SP804_TIMER(dev);
 
     for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
-        s->timer[i] = arm_timer_new(s->freq[i]);
-        s->timer[i]->irq = qemu_allocate_irq(sp804_set_irq, s, i);
+        s->irq_in[i] = qemu_allocate_irq(sp804_set_irq, s, i);
+        s->timer[i] = arm_timer_new(s->freq[i], s->irq_in[i]);
     }
 }
 
@@ -341,6 +343,7 @@ struct IntegratorPIT {
 
     MemoryRegion iomem;
     ArmTimer *timer[3];
+    qemu_irq irq_in[3];
 };
 
 static uint64_t icp_pit_read(void *opaque, hwaddr offset,
@@ -392,8 +395,8 @@ static void icp_pit_init(Object *obj)
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     for (unsigned i = 0; i < ARRAY_SIZE(s->timer); i++) {
-        s->timer[i] = arm_timer_new(tmr_freq[i]);
-        sysbus_init_irq(dev, &s->timer[i]->irq);
+        s->timer[i] = arm_timer_new(tmr_freq[i], s->irq_in[i]);
+        sysbus_init_irq(dev, &s->irq_in[i]);
     }
 
     memory_region_init_io(&s->iomem, obj, &icp_pit_ops, s,
-- 
2.38.1

