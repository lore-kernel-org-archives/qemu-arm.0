Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp5625058qvs;
        Wed, 25 May 2022 19:13:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3qbCwpOPrA2WzG3wI3xmnKd6N5Yug4WepcIZbg31t0TNgMN/NJMSzQ1lXCo3BUzvrh8Hg
X-Received: by 2002:a05:622a:100a:b0:2f3:c5db:70ef with SMTP id d10-20020a05622a100a00b002f3c5db70efmr27737100qte.334.1653531186695;
        Wed, 25 May 2022 19:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653531186; cv=none;
        d=google.com; s=arc-20160816;
        b=ODNai5mgxIticq5/oO2+RcGUHbNBi9nnFppXOADwLsZ1qjg7qNMAdg8bqR0nN6ReA/
         fcFQVkyFpgGLXJMmoqVTcz7gMQdn+/ReVk/pIQgwLfm5XC9E9Lo2MG2AkRySIRqLjoBp
         5fUR5ZlSFhDarkTVoupwUhok10Io+/gJCgPJ6O22/ze5QBl13x4/RThj9qM0N75nWLNn
         cP0YDiVVo/RBkf715C6KhURTo6Lm1G4dFZoJ/1/D/AcbYSurndP27r3GWbyaH0SXe5GQ
         rcPfEbN3a6S2dzekOES/Q8YtPjzUAsWj6GdPDBq0jw4oSZSLPC10NDgo3uGFZ+m84xTJ
         LYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WSbnnTlds4RsP16cpS/Vp0/pI9z8F1ezgAE8B51dZkM=;
        b=M9vKWLXN0KARQBr8VKmFlSsFHwbNjtPUmFhHtbrS428Ev0+WGSrF4qZAFU+ENLS923
         6Hk1Bu4JgA8tG7G5niGkay034QkSF+EXE34fTOTxSmPKFI5QBfFRub467XneiqACZDEm
         o2PNw6RX9bBPId9LOnTtfpP1lwUkcZSCG/jNqn1tXrOykD0DZkCTBER/4PlkY2h6gyBZ
         lm82EvSr7Q2AX47rtQqx9WRI4gjfSNN3PO0hV5+9zspcVxFZakv7HNBYnkdn07m29zwm
         uk1kFln6D1kSGW7Eaa9dfvzuCaNzr23AxNTy0pv0/n3o9kvI1gZ4KTGaFKDvg8/7Vs4U
         zzoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=IYOBEd+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y186-20020a3764c3000000b006a34c8b5cb5si300419qkb.386.2022.05.25.19.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 19:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=IYOBEd+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:50426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nu2zq-0002QE-7t
	for alex.bennee@linaro.org; Wed, 25 May 2022 22:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6145f87153=irischenlj@fb.com>)
 id 1nu2zQ-0002Jo-BR; Wed, 25 May 2022 22:12:41 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:46210
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6145f87153=irischenlj@fb.com>)
 id 1nu2zN-0005mW-1a; Wed, 25 May 2022 22:12:39 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 24PGtcBj009591;
 Wed, 25 May 2022 19:12:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=WSbnnTlds4RsP16cpS/Vp0/pI9z8F1ezgAE8B51dZkM=;
 b=IYOBEd+VlQ1rLmWfO6CHxgSxXHg/2n0BGHXmlAMbzP+3Aon39q8w0yvhO+H1I3mK8JCK
 kXMXaJAnBF52uVi2zbsa00IpKDJEXuFgm5NMbYL28kJxddVG8FJKeWYO6xukf3wyQwot
 vwTPMta8OudscAmqPvqTR0h6TyM8e4tmGeI= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net (PPS) with ESMTPS id 3g93tx2bkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 25 May 2022 19:12:23 -0700
Received: from snc-exhub201.TheFacebook.com (2620:10d:c085:21d::7) by
 snc-exhub203.TheFacebook.com (2620:10d:c085:21d::6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 25 May 2022 19:12:22 -0700
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c085:21d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 25 May
 2022 19:12:21 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <clg@kaod.org>, <patrick@stwcx.xyz>,
 <alistair@alistair23.me>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>, Iris Chen <irischenlj@gmail.com>
Subject: [PATCH 1/1] hw: m25p80: add W# pin and SRWD bit for write protection
Date: Wed, 25 May 2022 19:12:16 -0700
Message-ID: <20220526021216.1031533-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <irischenlj@fb.com>
References: <irischenlj@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::f]
X-Proofpoint-ORIG-GUID: M50vFdVoJXONlmmHiAL7eRHKA5gSqeVK
X-Proofpoint-GUID: M50vFdVoJXONlmmHiAL7eRHKA5gSqeVK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_07,2022-05-25_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6145f87153=irischenlj@fb.com;
 helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mcucyd7ZJXYv

From: Iris Chen <irischenlj@gmail.com>

Add the W# pin and SRWD bit which control the status register write
ability.

Signed-off-by: Iris Chen <irischenlj@gmail.com>
---
 hw/block/m25p80.c             | 72 +++++++++++++++++++++++++++++++++++
 tests/qtest/aspeed_smc-test.c | 62 ++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 81ba3da4df..c845fa08d4 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -27,12 +27,14 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/ssi/ssi.h"
+#include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "trace.h"
 #include "qom/object.h"
 
@@ -472,11 +474,13 @@ struct Flash {
     uint8_t spansion_cr2v;
     uint8_t spansion_cr3v;
     uint8_t spansion_cr4v;
+    bool write_protect_pin;
     bool write_enable;
     bool four_bytes_address_mode;
     bool reset_enable;
     bool quad_enable;
     bool aai_enable;
+    bool status_register_write_disabled;
     uint8_t ear;
 
     int64_t dirty_page;
@@ -723,6 +727,21 @@ static void complete_collecting_data(Flash *s)
         flash_erase(s, s->cur_addr, s->cmd_in_progress);
         break;
     case WRSR:
+        /*
+         * If W# is low and status_register_write_disabled is high,
+         * status register writes are disabled.
+         * This is also called "hardware protected mode" (HPM). All other
+         * combinations of the two states are called "software protected mode"
+         * (SPM), and status register writes are permitted.
+         */
+        if ((s->write_protect_pin == 0 && s->status_register_write_disabled)
+            || !s->write_enable) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "M25P80: Status register write is disabled!\n");
+            break;
+        }
+        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
+
         switch (get_man(s)) {
         case MAN_SPANSION:
             s->quad_enable = !!(s->data[1] & 0x02);
@@ -1195,6 +1214,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
 
     case RDSR:
         s->data[0] = (!!s->write_enable) << 1;
+        s->data[0] |= (!!s->status_register_write_disabled) << 7;
+
         if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
             s->data[0] |= (!!s->quad_enable) << 6;
         }
@@ -1484,6 +1505,15 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
     return r;
 }
 
+static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
+{
+    Flash *s = M25P80(opaque);
+    bool wp = !!level;
+    /* W# is just a single pin. */
+    assert(n == 0);
+    s->write_protect_pin = wp;
+}
+
 static void m25p80_realize(SSIPeripheral *ss, Error **errp)
 {
     Flash *s = M25P80(ss);
@@ -1515,12 +1545,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
         s->storage = blk_blockalign(NULL, s->size);
         memset(s->storage, 0xFF, s->size);
     }
+
+    qdev_init_gpio_in_named(DEVICE(s),
+                            m25p80_write_protect_pin_irq_handler, "W#", 1);
 }
 
 static void m25p80_reset(DeviceState *d)
 {
     Flash *s = M25P80(d);
 
+    s->write_protect_pin = true;
+    s->status_register_write_disabled = false;
+
     reset_memory(s);
 }
 
@@ -1601,6 +1637,7 @@ static const VMStateDescription vmstate_m25p80 = {
         VMSTATE_UINT8(needed_bytes, Flash),
         VMSTATE_UINT8(cmd_in_progress, Flash),
         VMSTATE_UINT32(cur_addr, Flash),
+        VMSTATE_BOOL(write_protect_pin, Flash),
         VMSTATE_BOOL(write_enable, Flash),
         VMSTATE_BOOL(reset_enable, Flash),
         VMSTATE_UINT8(ear, Flash),
@@ -1622,6 +1659,38 @@ static const VMStateDescription vmstate_m25p80 = {
     }
 };
 
+static void m25p80_get_write_protect_pin(Object *obj,
+                                       Visitor *v,
+                                       const char *name,
+                                       void *opaque,
+                                       Error **errp)
+{
+    Flash *s = M25P80(obj);
+    bool value;
+
+    value = s->write_protect_pin;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void m25p80_set_write_protect_pin(Object *obj,
+                                       Visitor *v,
+                                       const char *name,
+                                       void *opaque,
+                                       Error **errp)
+{
+    Flash *s = M25P80(obj);
+    bool value;
+    qemu_irq w;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    w = qdev_get_gpio_in_named(DEVICE(s), "W#", 0);
+    qemu_set_irq(w, value);
+}
+
 static void m25p80_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1636,6 +1705,9 @@ static void m25p80_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, m25p80_properties);
     dc->reset = m25p80_reset;
     mc->pi = data;
+
+    object_class_property_add(klass, "W#", "bool", m25p80_get_write_protect_pin,
+                              m25p80_set_write_protect_pin, NULL, NULL);
 }
 
 static const TypeInfo m25p80_info = {
diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index ec233315e6..45c0d812c7 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -56,7 +56,9 @@ enum {
     BULK_ERASE = 0xc7,
     READ = 0x03,
     PP = 0x02,
+    WRSR = 0x1,
     WREN = 0x6,
+    SRWD = 0x80,
     RESET_ENABLE = 0x66,
     RESET_MEMORY = 0x99,
     EN_4BYTE_ADDR = 0xB7,
@@ -390,6 +392,64 @@ static void test_read_status_reg(void)
     flash_reset();
 }
 
+static void test_status_reg_write_protection(void)
+{
+    uint8_t r;
+
+    spi_conf(CONF_ENABLE_W0);
+
+    /* default case: W# is high and SRWD is low -> status register writable */
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, SRWD);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    g_assert_cmphex(r & SRWD, ==, SRWD);
+
+    /* W# high and SRWD high -> status register writable */
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, 0);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    g_assert_cmphex(r & SRWD, ==, 0);
+
+    /* W# low and SRWD low -> status register writable */
+    qtest_qom_set_bool(global_qtest,
+                       "/machine/soc/fmc/ssi.0/child[0]", "W#", false);
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, SRWD);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    g_assert_cmphex(r & SRWD, ==, SRWD);
+
+    /* W# low and SRWD high -> status register NOT writable */
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, WREN);
+    /* test ability to write SRWD */
+    writeb(ASPEED_FLASH_BASE, WRSR);
+    writeb(ASPEED_FLASH_BASE, 0);
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r = readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+    /* write is not successful */
+    g_assert_cmphex(r & SRWD, ==, SRWD);
+
+    qtest_qom_set_bool(global_qtest,
+                       "/machine/soc/fmc/ssi.0/child[0]", "W#", true);
+    flash_reset();
+}
+
 static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
 
 int main(int argc, char **argv)
@@ -416,6 +476,8 @@ int main(int argc, char **argv)
     qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
     qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
     qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
+    qtest_add_func("/ast2400/smc/status_reg_write_protection",
+                   test_status_reg_write_protection);
 
     ret = g_test_run();
 
-- 
2.30.2

