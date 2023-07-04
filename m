Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2959302ejy;
        Tue, 4 Jul 2023 07:51:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XF5wS5rK86vxp8XJTCDYbNp1TWMtlkufaYiNHzGewscWVmTr9Gmmw9QsxTD6HlW3ZUJ4K
X-Received: by 2002:ac8:570d:0:b0:400:995d:6a3 with SMTP id 13-20020ac8570d000000b00400995d06a3mr17059600qtw.49.1688482291213;
        Tue, 04 Jul 2023 07:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688482291; cv=none;
        d=google.com; s=arc-20160816;
        b=xjvUasg1nwV7WoAXa4wcSbNoV77heFi1hYZVJXCBJvqY/GIAOW25GEDf41GjZn/OFN
         NQ1XSySfjtsoyB07E4xr2UKzwwO51wDFEeW8v8PIwLtpq9nxLYn0NXf0Y0QOW77xCE6t
         AiNJMuXU6EGp07preyRQmr60KA2xyOpmkKQ0VniNIZiMg0y1vWSSevvAQJTZPhlbhfws
         0gTko9Fvwa77zejomULN7uvSOET2r+mSGK7XR8soW2HvmOc2GwtJvPCOseiQZKiy+eWN
         ZBjZHjBjKyXvE9Od/BvEiyjaGne7x7JbOpH6UEBOkDPXwtdBBmBcAWQqSZkj4qL7GAiS
         7kgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oIwsdI/cQgkg0mdSj90u8YDrX9ZsJjYV9q/7uRRhEe8=;
        fh=Lngrjms14biHE1uwg3hJItOsHUc/fKOP3kWz84zgU0I=;
        b=VCKrXReRmTfz83sCUBfRjDskJUbyIkWEh3EiZqZMDm6AnDOVjoySF0GuKUCxw0e9/I
         JiBIu2BQczzIm44qASHqCTthtB5J7Z6yia6veWsm/T8ao7MrUzxVFftnFT6R1pf7O3uv
         i4kTzcmAdHj38/ePJoHbSDfBstRs+I1ZoLOrQGv3In7hdtXgQmNQ2Kbdex0u7IQrtXf7
         4Y6CpqBhXMxTrJaiEYESn6VMDS71972S8ru0s0CPbZb6yNOIgYJvbNx7wviBDjI+G4rJ
         zOvUthQWE5htvF3U/pLTY+06H7nJItprzrxOgmj+GeG4DcxUpWyj12cZbUdkISu+OVSO
         h8kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PL2Bvkq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020a05622a13d000b003ff46b1caf0si11334885qtk.551.2023.07.04.07.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 07:51:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PL2Bvkq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGhMz-0004Cg-0R; Tue, 04 Jul 2023 10:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhMh-0003v4-4J
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:50:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhMd-00031q-Jt
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 10:50:50 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8ceso69423445e9.0
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688482246; x=1691074246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oIwsdI/cQgkg0mdSj90u8YDrX9ZsJjYV9q/7uRRhEe8=;
 b=PL2Bvkq4IL2H79ISndXuECgIemX9vXMX7SsYfKC+RgfClIumNdJAv8F09o8HePBjc0
 hL3LwHHG96EKsFz/TF2wc1J2d7vU7WFY0HwEk44RBaWFmi9IC+Y8vfOqUoAWnX/TK2qN
 h9dqrjtLWIp8FflrzHVzsxAqDdWOK83Lp0hXvkfD4kRUWlKlMxEwZdNbFgRfZa9hQBWD
 PKohkGgOyIVo7fvpddGwHHVE2Ib+z5GfFwhnKLHZOi8ZO0Wtuz8JnRinEfh1khvKhNXO
 l2GZDcurbmAhpYd6Nrw6zEnod3Oia3IUd36HE+s/Djtoz+YeOm9Utt52KHxCtUef2KBw
 l07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688482246; x=1691074246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIwsdI/cQgkg0mdSj90u8YDrX9ZsJjYV9q/7uRRhEe8=;
 b=F2w1kAzCU45ZUW7UkRMOHBMT93/XGcegy7hl9rD6Uph/HODhLSQl7arhloJ+tzkDHv
 Hhu9euPHzt05VIXm4BGj9krNBcF3u5I/j8qBdtyDDxKLH+zl0z9eUqCEg8JwO0eODpWs
 4A3prn2W0ZRosjj/j4ljmrM/bmZgzUKpScF71uUFOuG7cgRBCncrDY0KWB7ggix3OfbV
 J78s0xanWvVnM8FvtrBWL7efsXzObmw8zEIdQYnacXk70dGEjyVkjw9N7cDUT3xf2PoT
 qOEc31WgdR19lsYRO4e0rBs9z9v2g+NgJE4vyuBrHcjLrTGX7qnx2o71hdmegMOXKQDh
 rVnA==
X-Gm-Message-State: ABy/qLYsxpHlwygMmvMgjEXwGr4Nbvi3WUM8OEKGM7Mj0P1TJnWcbspI
 bfLMSQKwErwLKf0zVZuH9YhdQQ==
X-Received: by 2002:a7b:c8c2:0:b0:3fb:e189:3532 with SMTP id
 f2-20020a7bc8c2000000b003fbe1893532mr1693571wml.20.1688482246078; 
 Tue, 04 Jul 2023 07:50:46 -0700 (PDT)
Received: from localhost.localdomain ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a7bcd97000000b003fbb2c0fce5sm17802986wmj.25.2023.07.04.07.50.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Jul 2023 07:50:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/19] hw/timer/arm_timer: Rename SP804State -> SP804Timer
Date: Tue,  4 Jul 2023 16:49:59 +0200
Message-Id: <20230704145012.49870-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230704145012.49870-1-philmd@linaro.org>
References: <20230704145012.49870-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: ZHACY1IiZ1MI

Following docs/devel/style.rst guidelines, rename SP804State
as SP804Timer.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 8a2939483f..41045de8ed 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -192,9 +192,9 @@ static ArmTimer *arm_timer_init(uint32_t freq)
  */
 
 #define TYPE_SP804 "sp804"
-OBJECT_DECLARE_SIMPLE_TYPE(SP804State, SP804)
+OBJECT_DECLARE_SIMPLE_TYPE(SP804Timer, SP804)
 
-struct SP804State {
+struct SP804Timer {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -214,7 +214,7 @@ static const uint8_t sp804_ids[] = {
 /* Merge the IRQs from the two component devices.  */
 static void sp804_set_irq(void *opaque, int irq, int level)
 {
-    SP804State *s = opaque;
+    SP804Timer *s = opaque;
 
     s->level[irq] = level;
     qemu_set_irq(s->irq, s->level[0] || s->level[1]);
@@ -223,7 +223,7 @@ static void sp804_set_irq(void *opaque, int irq, int level)
 static uint64_t sp804_read(void *opaque, hwaddr offset,
                            unsigned size)
 {
-    SP804State *s = opaque;
+    SP804Timer *s = opaque;
 
     if (offset < 0x20) {
         return arm_timer_read(s->timer[0], offset);
@@ -255,7 +255,7 @@ static uint64_t sp804_read(void *opaque, hwaddr offset,
 static void sp804_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
-    SP804State *s = opaque;
+    SP804Timer *s = opaque;
 
     if (offset < 0x20) {
         arm_timer_write(s->timer[0], offset, value);
@@ -283,14 +283,14 @@ static const VMStateDescription vmstate_sp804 = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_INT32_ARRAY(level, SP804State, 2),
+        VMSTATE_INT32_ARRAY(level, SP804Timer, 2),
         VMSTATE_END_OF_LIST()
     }
 };
 
 static void sp804_init(Object *obj)
 {
-    SP804State *s = SP804(obj);
+    SP804Timer *s = SP804(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     sysbus_init_irq(sbd, &s->irq);
@@ -301,7 +301,7 @@ static void sp804_init(Object *obj)
 
 static void sp804_realize(DeviceState *dev, Error **errp)
 {
-    SP804State *s = SP804(dev);
+    SP804Timer *s = SP804(dev);
 
     s->timer[0] = arm_timer_init(s->freq0);
     s->timer[1] = arm_timer_init(s->freq1);
@@ -310,8 +310,8 @@ static void sp804_realize(DeviceState *dev, Error **errp)
 }
 
 static Property sp804_properties[] = {
-    DEFINE_PROP_UINT32("freq0", SP804State, freq0, 1000000),
-    DEFINE_PROP_UINT32("freq1", SP804State, freq1, 1000000),
+    DEFINE_PROP_UINT32("freq0", SP804Timer, freq0, 1000000),
+    DEFINE_PROP_UINT32("freq1", SP804Timer, freq1, 1000000),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -405,7 +405,7 @@ static const TypeInfo arm_timer_types[] = {
     }, {
         .name           = TYPE_SP804,
         .parent         = TYPE_SYS_BUS_DEVICE,
-        .instance_size  = sizeof(SP804State),
+        .instance_size  = sizeof(SP804Timer),
         .instance_init  = sp804_init,
         .class_init     = sp804_class_init,
     }
-- 
2.38.1

