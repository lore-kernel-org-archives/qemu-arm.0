Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45733D74960
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Dec 2025 07:06:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWUXe-0003pW-K2; Fri, 19 Dec 2025 02:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CflEaQYKCGAWS9GLXEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--yubinz.bounces.google.com>)
 id 1vWUXd-0003nf-5v
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 02:04:45 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CflEaQYKCGAWS9GLXEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--yubinz.bounces.google.com>)
 id 1vWUXb-0001Yx-I3
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 02:04:44 -0500
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-2a0bb1192cbso27524385ad.1
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 23:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766127881; x=1766732681; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/qqf5+bwzclxk1ILtr6MR3xBusLE6u4kKKSubpiajjE=;
 b=ym0WvSSNw+Ig7gOWjcv3P6YO+S7ZkcGxsjESyaqxD4qukT8ehVSOqw4Kb25sgVLmot
 KbTJjhQgemAWAMjTz8iq1PUgAfgDxiVHddQXOZCG3w3f8rPmN1MpRvfUfdRPCeMsw/JR
 yZ+aJP6jySVtzxUrHGMRfxOMXFoNrSuL2/LuGWRARn0xsnkpZYXww4cur3m4TBKpu/99
 DiCnIVbJjMQQZZsZlgzbON0/EXMvMYMOl2VD26Lpflq/YGgmMNqfcjRxKhZaT5FMaxCs
 N7dJ4OXdEYcdrNHeNQx5JEt4zR+EZxsMJuzW+8De6+fdiCI96CBOYcMyE/YZ6LaG4NF5
 XbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766127881; x=1766732681;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/qqf5+bwzclxk1ILtr6MR3xBusLE6u4kKKSubpiajjE=;
 b=ouBvDy/7zL7Bp7+dXKKtIpKZdRVE+STRaKlePC1uVReh3IELmHxFHMqPoGA5f+RyFI
 g4Ox6Oc/H1roJXSz9CRxqn1Jm87oac0goMYDbUTyTU27FFnHOjdhIBve/MYKRzAMHB38
 QOGmeair+xsrNqQcHVHa0de1Xp0wdmzHfM7OluLNb58niMXPQI9W7Y9PbVbMLl+vJDfv
 cnU3qHjqy9C73BT99RTJqEEK22+7Tz6hN2iL2Od2IH/wq7aYNm30wj4W0wSmxBCtBfzX
 c27ggN4lr4oDtadWoTzDsIiZZu6VF32fpqucWYQnQN+807FSyAQ84hkp3y4g6coDCPQS
 gOrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXkvFcNkrnX5hnW4gKELI7Qhclc1IUMv5SdDSA/gtRzIHZlw3pysGXIBYwe/eTwmikjCS4vrKjHQ==@nongnu.org
X-Gm-Message-State: AOJu0YxsMiCKGDQQMb9wVQD1hf2pY27xxRPPtUOiXDOiYwyE+GcTVMWJ
 xXxAMdtvn10pxJFvUpYg1zfK35Z9uXZnmdHYvI+QlX52Uo9gn3M71TlgQQd3tzQoVWXHssPrnYL
 g2VHJSA==
X-Google-Smtp-Source: AGHT+IHWHAgGN4JmRn3r9yaFEWteE3bUnOyeMcedfZozH1aAn6LnBb4zNlAafZIs5GpHIMnZ9eaz/9KFyJc=
X-Received: from dlah7.prod.google.com ([2002:a05:701b:2607:b0:11d:cd2a:4c1b])
 (user=yubinz job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4287:b0:11b:9386:a3c8
 with SMTP id a92af1059eb24-121723018d9mr2541572c88.41.1766127881370; Thu, 18
 Dec 2025 23:04:41 -0800 (PST)
Date: Fri, 19 Dec 2025 07:04:15 +0000
In-Reply-To: <20251219-aspeed-sgpio-v5-0-fd5593178144@google.com>
Mime-Version: 1.0
References: <20251219-aspeed-sgpio-v5-0-fd5593178144@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251219-aspeed-sgpio-v5-2-fd5593178144@google.com>
Subject: [PATCH v5 2/6] hw/gpio/aspeed_sgpio: Add QOM property accessors for
 SGPIO pins
From: Yubin Zou <yubinz@google.com>
To: qemu-devel@nongnu.org
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>, 
 Nabih Estefan <nabihestefan@google.com>, qemu-arm@nongnu.org, 
 Yubin Zou <yubinz@google.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3CflEaQYKCGAWS9GLXEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--yubinz.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

The `aspeed_sgpio_get_pin` and `aspeed_sgpio_set_pin` functions are
implemented to get and set the level of individual SGPIO pins. These
are then exposed as boolean properties on the SGPIO device object.

Signed-off-by: Yubin Zou <yubinz@google.com>
Reviewed-by: Kane Chen <kane_chen@aspeedtech.com>
---
 hw/gpio/aspeed_sgpio.c | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/hw/gpio/aspeed_sgpio.c b/hw/gpio/aspeed_sgpio.c
index 167a72c41e96c67bd1867a19e2b1706f5bd074e4..927c711cb3aef889c47c9a9156fe4241981c5efa 100644
--- a/hw/gpio/aspeed_sgpio.c
+++ b/hw/gpio/aspeed_sgpio.c
@@ -51,6 +51,8 @@ static uint64_t aspeed_sgpio_2700_read(void *opaque, hwaddr offset,
     reg = offset >> 2;
 
     switch (reg) {
+    case R_SGPIO_INT_STATUS_0 ... R_SGPIO_INT_STATUS_7:
+        break;
     case R_SGPIO_0_CONTROL ... R_SGPIO_255_CONTROL:
         value = aspeed_sgpio_2700_read_control_reg(s, reg);
         break;
@@ -82,6 +84,73 @@ static void aspeed_sgpio_2700_write(void *opaque, hwaddr offset, uint64_t data,
     }
 }
 
+static bool aspeed_sgpio_get_pin_level(AspeedSGPIOState *s, int pin)
+{
+    uint32_t value = s->ctrl_regs[pin >> 1];
+    bool is_input = !(pin % 2);
+    uint32_t bit_mask = 0;
+
+    if (is_input) {
+        bit_mask = SGPIO_SERIAL_IN_VAL_MASK;
+    } else {
+        bit_mask = SGPIO_SERIAL_OUT_VAL_MASK;
+    }
+
+    return value & bit_mask;
+}
+
+static void aspeed_sgpio_set_pin_level(AspeedSGPIOState *s, int pin, bool level)
+{
+    uint32_t value = s->ctrl_regs[pin >> 1];
+    bool is_input = !(pin % 2);
+    uint32_t bit_mask = 0;
+
+    if (is_input) {
+        bit_mask = SGPIO_SERIAL_IN_VAL_MASK;
+    } else {
+        bit_mask = SGPIO_SERIAL_OUT_VAL_MASK;
+    }
+
+    if (level) {
+        value |= bit_mask;
+    } else {
+        value &= ~bit_mask;
+    }
+    s->ctrl_regs[pin >> 1] = value;
+}
+
+static void aspeed_sgpio_get_pin(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    bool level = true;
+    int pin = 0xfff;
+    AspeedSGPIOState *s = ASPEED_SGPIO(obj);
+
+    if (sscanf(name, "sgpio%03d", &pin) != 1) {
+        error_setg(errp, "%s: error reading %s", __func__, name);
+        return;
+    }
+    level = aspeed_sgpio_get_pin_level(s, pin);
+    visit_type_bool(v, name, &level, errp);
+}
+
+static void aspeed_sgpio_set_pin(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    bool level;
+    int pin = 0xfff;
+    AspeedSGPIOState *s = ASPEED_SGPIO(obj);
+
+    if (!visit_type_bool(v, name, &level, errp)) {
+        return;
+    }
+    if (sscanf(name, "sgpio%03d", &pin) != 1) {
+        error_setg(errp, "%s: error reading %s", __func__, name);
+        return;
+    }
+    aspeed_sgpio_set_pin_level(s, pin, level);
+}
+
 static const MemoryRegionOps aspeed_sgpio_2700_ops = {
     .read       = aspeed_sgpio_2700_read,
     .write      = aspeed_sgpio_2700_write,
@@ -105,6 +174,15 @@ static void aspeed_sgpio_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
+static void aspeed_sgpio_init(Object *obj)
+{
+    for (int i = 0; i < ASPEED_SGPIO_MAX_PIN_PAIR * 2; i++) {
+        g_autofree char *name = g_strdup_printf("sgpio%03d", i);
+        object_property_add(obj, name, "bool", aspeed_sgpio_get_pin,
+                            aspeed_sgpio_set_pin, NULL, NULL);
+    }
+}
+
 static void aspeed_sgpio_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -134,6 +212,7 @@ static const TypeInfo aspeed_sgpio_ast2700_info = {
     .name           = TYPE_ASPEED_SGPIO "-ast2700",
     .parent         = TYPE_ASPEED_SGPIO,
     .class_init     = aspeed_sgpio_2700_class_init,
+    .instance_init  = aspeed_sgpio_init,
 };
 
 static void aspeed_sgpio_register_types(void)

-- 
2.52.0.351.gbe84eed79e-goog


