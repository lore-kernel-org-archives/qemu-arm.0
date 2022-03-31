Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp226590lfb;
        Thu, 31 Mar 2022 10:01:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLEs5tTH277ftGDQpYcfNnndH9Mht+/uyy9BCgTaCMV8WsvOgyQ+/EZOmMXEwHiqcIMMei
X-Received: by 2002:a05:6902:1541:b0:63c:d852:832e with SMTP id r1-20020a056902154100b0063cd852832emr4829776ybu.622.1648746062713;
        Thu, 31 Mar 2022 10:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648746062; cv=none;
        d=google.com; s=arc-20160816;
        b=g20rW2LjEiA9hW8K4eKv/lnDINeW/aetFzl9+iI3SebjkXDHHMZIY3avwhKNX4bQgi
         glyUeHCK8+e0we61BHDMgJsUOf+M17B3zVbe0NJlymcyg6jmLRCqDkql7QqnjaKeIMtJ
         UgnSs3umibMXtBFbU04/Wjy/Vtd/AJvDXU2aL0yGDPYSKmmcByMJcByKhxHzZGY0TDfi
         C1oqDc5OB/U1YEEGKBzW7o7zF+5g1YjPwJIcGmi7QtU5C7zVsGI1Jg7BnKKEKbLsEavE
         RW/y4SGHnShh9vqdwyGQU0E5c9HiZ5zevjot1A+QP9BwbSaxN0sO9nvWJNm8DJhFfoUX
         LsQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature:dkim-signature;
        bh=UMv+7jwHj3p2XJsH57Uib59UhRoKlgvJ2+efHY1hh58=;
        b=ZgG52d1fFmiBFBoP7jF7HtVfF1ZBuAOrOVOoPk6VK1EQHeZJFYi8c7noRELGdazNR2
         MJqiD3SFfU2CjMur7qSJJeLuMOD0X1/KGL4MZ6WS42rV42jCCo+AthqsRQu/l7z3plch
         qMQQRqT0UfK2S62oU4HRTVknrRFNv3liMj7NbKp5DnFo+Z9OKbK0lwMCL8inhhH5Tl60
         JKyURhzOeXvhVY63uTO3fJtnIIrzYy5HxaDDqqb+9Fgfr/z91267ukpI5F+dAaNAxJFS
         OBR7w7sAW82gYZ2gr88enoMl2edbLKsv4Yz3D/41kDs0FtzdoPRtoW+OYi4NZmNDu4Xi
         rCeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=KYKX3BTr;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Z4dkklGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a81d005000000b002e5bb9dc9fbsi87680ywi.132.2022.03.31.10.01.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 10:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@irrelevant.dk header.s=fm3 header.b=KYKX3BTr;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Z4dkklGY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZyAP-0002YX-VE
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 13:01:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nZy7X-0000hp-0i; Thu, 31 Mar 2022 12:58:04 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:51657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nZy7T-0000uv-9w; Thu, 31 Mar 2022 12:58:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1BB413200F81;
 Thu, 31 Mar 2022 12:57:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 31 Mar 2022 12:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=UMv+7jwHj3p2XJ
 sH57Uib59UhRoKlgvJ2+efHY1hh58=; b=KYKX3BTrpKVKaW3SBDrkNisZAeEm9b
 7zTrbMUSlMX4Jo1mlmFvIbTdBhvJZLOOY40YHWAgcaK5BOgDX6TZbt+j75zvy3BR
 hdcfeihf+Zn3OoqH7ggPIe6Zw5jH/L/BI1zk1sJq+F0kJKWV+o65wLMAwPzCR/il
 SKIdMGYDaVW4nDu7f/CuA38YrhdFaJ4+4YHvknkF/TXCilwFrUnn/k0SqrXi1Tof
 Kiz4VWh1uCckCSkJ781TJqsl1zfFb3Y6p7vJCAJUh0HnucHspNtatXaIVOkaY+6o
 6FE3G0E1fBi4G+n1ZwioN5Zf/1IFWEI3ZRwLtN/pzZ+P35C3b/yRDwHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UMv+7j
 wHj3p2XJsH57Uib59UhRoKlgvJ2+efHY1hh58=; b=Z4dkklGYjsat0mR0rw/R5L
 pAEaRKlXx9DWUR7WbrHp6okm10RVNWS7wx2lQhPGk42fDSJ/tg/ev9li0H//nfoP
 7S5fDJWeMVu4agbNFBI257MlP4VWzSZH1qObmJgASzsVGgVj9Lz0jjynmpchDfon
 wUcKbvk0YT7PsHBEWuT8hZNI4YBqQla5/GkXZX6RpV4DYiQmYcVHNy5tsFeT/cWg
 9Kd/aZc6Qfe/HQ182kgcutmHoEh5hQrIS2cO5fIHyDpPUwJZqneCFVJRJhElLwVK
 SN3A6jOkRkt2+UR0aeiftHV4mcBT2GfNXZhGYfj4z6m16pg6P7eT3iINyWUsvbMg
 ==
X-ME-Sender: <xms:lN1FYtxoUTl-nSFX4qzUUsxNNXepQ5tJ1FPp_r9G61rNUaMECKs_-w>
 <xme:lN1FYtRppUbn6IOXhDnF9zuP8YlYboJhb85luGc9GrIEy-5s3L1ZGbAKIFHqQaRjv
 WcOPUFybdq1J4nSgp0>
X-ME-Received: <xmr:lN1FYnXfUhC44KElX2DYdihSB3FCNAT16NNRvG92Og4i-5_sy70hXSTr8g_iDTyYuHqg85fbE0djQjWmBgoqew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:lN1FYviuyyIOprDONYOCH7NimMh9oouxduKUy3FCnr6Wx5DBV3AhMg>
 <xmx:lN1FYvAT0Gi943w96nCNtb38Qz8IhyNfnH0k0Itj5zaSflTYQh1Psg>
 <xmx:lN1FYoK5qJQYjg88eZ-fi_3WjosOVX1D-o15FxLpMuhEHA2d_xC9kw>
 <xmx:lN1FYj6CI9Z0d83aIu0_M_SjY3PueUKuLnqnRobV34N8vtYXnEN7OA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 12:57:54 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/4] hw/misc: add a toy i2c echo device
Date: Thu, 31 Mar 2022 18:57:37 +0200
Message-Id: <20220331165737.1073520-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331165737.1073520-1-its@irrelevant.dk>
References: <20220331165737.1073520-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wGuaBtSnu/tm

From: Klaus Jensen <k.jensen@samsung.com>

Add an example i2c device that can master the bus. The device will echo
whatever it is sent to the device identified by the first byte received.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/misc/i2c-echo.c | 144 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 hw/misc/i2c-echo.c

diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c
new file mode 100644
index 000000000000..72155d850d5f
--- /dev/null
+++ b/hw/misc/i2c-echo.c
@@ -0,0 +1,144 @@
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "qemu/main-loop.h"
+#include "block/aio.h"
+#include "hw/i2c/i2c.h"
+
+#define TYPE_I2C_ECHO "i2c-echo"
+OBJECT_DECLARE_SIMPLE_TYPE(I2CEchoState, I2C_ECHO)
+
+enum i2c_echo_state {
+    I2C_ECHO_STATE_REQUEST_MASTER,
+    I2C_ECHO_STATE_START_SEND,
+    I2C_ECHO_STATE_ACK,
+};
+
+typedef struct I2CEchoState {
+    I2CSlave parent_obj;
+
+    I2CBus *bus;
+
+    enum i2c_echo_state state;
+    QEMUBH *bh;
+
+    unsigned int pos;
+    uint8_t data[3];
+} I2CEchoState;
+
+static void i2c_echo_bh(void *opaque)
+{
+    I2CEchoState *state = opaque;
+
+    switch (state->state) {
+    case I2C_ECHO_STATE_REQUEST_MASTER:
+        i2c_bus_master(state->bus, state->bh);
+        state->state = I2C_ECHO_STATE_START_SEND;
+        break;
+
+    case I2C_ECHO_STATE_START_SEND:
+        i2c_start_send(state->bus, state->data[0]);
+        state->pos++;
+        state->state = I2C_ECHO_STATE_ACK;
+        break;
+
+    case I2C_ECHO_STATE_ACK:
+        if (state->pos > 2) {
+            i2c_end_transfer(state->bus);
+            i2c_bus_release(state->bus);
+            break;
+        }
+
+        i2c_send_async(state->bus, state->data[state->pos++]);
+        break;
+    }
+}
+
+static int i2c_echo_event(I2CSlave *s, enum i2c_event event)
+{
+    I2CEchoState *state = I2C_ECHO(s);
+
+    switch (event) {
+    case I2C_START_RECV:
+        state->pos = 0;
+
+        break;
+
+    case I2C_START_SEND:
+        state->pos = 0;
+
+        break;
+
+    case I2C_FINISH:
+        state->pos = 0;
+        state->state = I2C_ECHO_STATE_REQUEST_MASTER;
+        qemu_bh_schedule(state->bh);
+
+        break;
+
+    case I2C_NACK:
+        break;
+    }
+
+    return 0;
+}
+
+static uint8_t i2c_echo_recv(I2CSlave *s)
+{
+    I2CEchoState *state = I2C_ECHO(s);
+
+    if (state->pos > 2) {
+        return 0xff;
+    }
+
+    return state->data[state->pos++];
+}
+
+static int i2c_echo_send(I2CSlave *s, uint8_t data)
+{
+    I2CEchoState *state = I2C_ECHO(s);
+
+    if (state->pos > 2) {
+        return -1;
+    }
+
+    state->data[state->pos++] = data;
+
+    return 0;
+}
+
+static void i2c_echo_realize(DeviceState *dev, Error **errp)
+{
+    I2CEchoState *state = I2C_ECHO(dev);
+    BusState *bus = qdev_get_parent_bus(dev);
+
+    state->bus = I2C_BUS(bus);
+    state->bh = qemu_bh_new(i2c_echo_bh, state);
+
+    return;
+}
+
+static void i2c_echo_class_init(ObjectClass *oc, void *data)
+{
+    I2CSlaveClass *sc = I2C_SLAVE_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = i2c_echo_realize;
+
+    sc->event = i2c_echo_event;
+    sc->recv = i2c_echo_recv;
+    sc->send = i2c_echo_send;
+}
+
+static const TypeInfo i2c_echo = {
+    .name = TYPE_I2C_ECHO,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(I2CEchoState),
+    .class_init = i2c_echo_class_init,
+};
+
+static void register_types(void)
+{
+    type_register_static(&i2c_echo);
+}
+
+type_init(register_types);
-- 
2.35.1

