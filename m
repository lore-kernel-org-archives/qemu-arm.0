Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp847409wrt;
        Sat, 16 Mar 2019 16:11:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyb8ee3boQWkXAZErbWvl0zCljet1ikHE3Bhz4hHKAVTjGeh/EA8U5u5/7NaQYcI0nsKJ+I
X-Received: by 2002:a1c:e2c2:: with SMTP id z185mr6105722wmg.84.1552777906065;
        Sat, 16 Mar 2019 16:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552777906; cv=none;
        d=google.com; s=arc-20160816;
        b=e6lX39GdCk8clHyjzXGBwHHCPgwRI3iiS0/CNWOQVCunziVN6A0/aEFeM4NddVoSGY
         I+p6kFrc2zmEHPDG2OhdLqVS7qZhK11X43g8iqsaNBb0o3b/039gAlVHGAMHb6Yh//kf
         rDobAezsauyyWIoCa6rghL95vNs97q4rtdFvlLufprQeKr7zL7DfcJjA5Ujqxbp6+D6n
         hJ0+np69+T0IzBUtklqsa31PjCEKXc0ZH5b1HzYqhb8VRK8ni8wbPxgtpw/0vm3thz4m
         dC1THQboKBuXqp9TbQOP1kX93OovquILbup6unCBBSFgyHWlNAakWobZC6V9JLlSNCD8
         uPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=K/YFy18Glb5v6AsH4S2u6gJa5/EIX+e/vyAZ7Y828w0=;
        b=XrvumlBaZEplbJtpd8KJJOS5LoNKN/EN2UTBCnnMzM21vuHJsmaHjgJYssKyuHlZZU
         P+LVvjj7yvehlGyzzenH9fEEiTQQDp6Fwwrs09xKakudNwIU7XF0t5BaaEomT1S+RPZI
         bgg12w0dhtBPlAgcZFGvsWT7216o9m09A0br8q98jCMtYuMmajnAsmK3Prlmb6aJlF9j
         sGoOcnBzi++j9Jqk39SwgMkdnjbXZMXeOZ+y5NBJD6G0pyFDX+FQuAWLxBscnqYJhOEm
         aa+lvPzrH4cl+Lx4yJVDI3qdzHQE20gboI5aNYcFKGJNUuO6v7Fz0kpSuFdNWFeDwml4
         GXCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="t3/oPc1t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si3947507wrp.231.2019.03.16.16.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Mar 2019 16:11:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="t3/oPc1t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:47645 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h5ISv-0005OI-6Q
	for alex.bennee@linaro.org; Sat, 16 Mar 2019 19:11:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1h5ISk-0005Np-2a
	for qemu-arm@nongnu.org; Sat, 16 Mar 2019 19:11:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1h5IFk-0005hZ-SJ
	for qemu-arm@nongnu.org; Sat, 16 Mar 2019 18:58:09 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34679)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1h5IFj-0005fr-Ey; Sat, 16 Mar 2019 18:58:07 -0400
Received: by mail-wm1-x344.google.com with SMTP id o10so11677378wmc.1;
	Sat, 16 Mar 2019 15:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K/YFy18Glb5v6AsH4S2u6gJa5/EIX+e/vyAZ7Y828w0=;
	b=t3/oPc1t+pbtEORaHoH0Teq5GLOuw4JBjhDySG9gBkz7V5QIlnIbZdv5Zw5U0aVMoZ
	RdFyWFHu65HgOwNuh2gED+W8a3FdPle29TaJIfm0bmd+XW863C0pMgTYsnvJYXIucOkW
	8cMCbKrpLni/8HLpOBk+D4sW9JYizZdp68higt3jWJZQwLtpiLniCF1toWSOQwD1SCTZ
	40S6Fczub0NMDFSIhFrJPxoK0a0Z/TdKEUSnr1EP1MtTiyKgdx+aBrEaIowZa/TAu/qQ
	OlHJN1F1eswAklBh1qZAtoBt9G0RXjmKT0JjIVR5uG7FqOUBe+Sic0AXjhJX8UNfaF7U
	cpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=K/YFy18Glb5v6AsH4S2u6gJa5/EIX+e/vyAZ7Y828w0=;
	b=K/w+te7b6FDadUvaxVPGoTHnk4gEglqQ1J7IjbC2kMcN4k8FWwwKBAWZlM8PHlkGoh
	LZP3lGfxAkLMYe2L1A2aUCVusrehmWNQch6eirlJL7zk8/OcE+5WqU3xPqOed5lg8Vy4
	7V2Ff7BGefDZivjVc9jeS3nMpPqoK2vazxzgQFmbEwg2q7vhJVnb8oaosx/aCyjj4CpL
	P1cz1L7MYFfORCJoTMyfRH2eHmI9mAJQr/shomsSFQEYD3JwjDAg9t/RqdjzN8Mp713e
	guWMi9PeOoQr98Z5Yy7s/l0rKPvIhnSP24kPSKBWmNI04ZiI2/ygfJbc2RwhsJvfZhT7
	4n7g==
X-Gm-Message-State: APjAAAVAkibUPsMzYE/Y9zXPQ4hgQpN9VeU/JhTahu1eEAS52HdQAFdc
	E8ioelCgIIDvxDF6L9LlIsm36Yad
X-Received: by 2002:a1c:4d02:: with SMTP id o2mr1244281wmh.134.1552777085266; 
	Sat, 16 Mar 2019 15:58:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:b1a4:2744:46f8:7c46])
	by smtp.gmail.com with ESMTPSA id q24sm2505848wmq.5.2019.03.16.15.58.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 16 Mar 2019 15:58:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 16 Mar 2019 23:58:02 +0100
Message-Id: <20190316225802.15236-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH] nrf51_gpio: reflect pull-up/pull-down to IRQs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: contrib@steffen-goertz.de, qemu-arm@nongnu.org, stefanha@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PAfBoxkVevUc

Some drivers do I2C bitbanging by keeping the output to 0 and flipping
the GPIO direction between input and output (see for example in Linux
gpio_set_open_drain_value_commit, in drivers/gpio/gpiolib.c).
When the GPIO is set to input, the pull-up resistor brings the output
to 1, while when the GPIO is set to output, the output driver brings
the output to 0.

Implement this for the nRF51 GPIO device model.  First, if both input and
output are floating, and there is a pull-up or pull-down resistor
configured, do not just set s->in, but also make any devices listening
on the output qemu_irq receive that value.  Second, if the pin is
driven both internally (output pin) and externally you don't get a
short circuit if the external drive goes through a resistor.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/gpio/nrf51_gpio.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/hw/gpio/nrf51_gpio.c b/hw/gpio/nrf51_gpio.c
index 86e047d649..ffe28a6390 100644
--- a/hw/gpio/nrf51_gpio.c
+++ b/hw/gpio/nrf51_gpio.c
@@ -43,6 +43,17 @@ static bool is_connected(uint32_t config, uint32_t level)
     return state;
 }
 
+static int pull_value(uint32_t config)
+{
+    int pull = extract32(config, 2, 2);
+    if (pull == NRF51_GPIO_PULLDOWN) {
+        return 0;
+    } else if (pull == NRF51_GPIO_PULLUP) {
+        return 1;
+    }
+    return -1;
+}
+
 static void update_output_irq(NRF51GPIOState *s, size_t i,
                               bool connected, bool level)
 {
@@ -61,34 +72,31 @@ static void update_output_irq(NRF51GPIOState *s, size_t i,
 
 static void update_state(NRF51GPIOState *s)
 {
-    uint32_t pull;
+    int pull;
     size_t i;
     bool connected_out, dir, connected_in, out, input;
 
     for (i = 0; i < NRF51_GPIO_PINS; i++) {
-        pull = extract32(s->cnf[i], 2, 2);
+        pull = pull_value(s->cnf[i]);
         dir = extract32(s->cnf[i], 0, 1);
         connected_in = extract32(s->in_mask, i, 1);
         out = extract32(s->out, i, 1);
         input = !extract32(s->cnf[i], 1, 1);
         connected_out = is_connected(s->cnf[i], out) && dir;
 
-        update_output_irq(s, i, connected_out, out);
-
         /* Pin both driven externally and internally */
-        if (connected_out && connected_in) {
+        if (connected_out && connected_in && input && pull == -1) {
             qemu_log_mask(LOG_GUEST_ERROR, "GPIO pin %zu short circuited\n", i);
         }
 
-        /*
-         * Input buffer disconnected from internal/external drives, so
-         * pull-up/pull-down becomes relevant
-         */
-        if (!input || (input && !connected_in && !connected_out)) {
-            if (pull == NRF51_GPIO_PULLDOWN) {
-                s->in = deposit32(s->in, i, 1, 0);
-            } else if (pull == NRF51_GPIO_PULLUP) {
-                s->in = deposit32(s->in, i, 1, 1);
+        if (pull >= 0) {
+            if (!input) {
+                /* Input buffer disconnected from external drives */
+                s->in = deposit32(s->in, i, 1, pull);
+            } else if (!connected_in && !connected_out) {
+                /* Floating: pull-up/pull-down is visible on the bus */
+                connected_out = true;
+                out = pull;
             }
         }
 
@@ -96,8 +104,8 @@ static void update_state(NRF51GPIOState *s)
         if (connected_out && !connected_in && input) {
             s->in = deposit32(s->in, i, 1, out);
         }
+        update_output_irq(s, i, connected_out, out);
     }
-
 }
 
 /*
-- 
2.20.1

