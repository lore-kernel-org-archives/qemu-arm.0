Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp157420lfb;
        Wed, 8 Jun 2022 20:14:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRIyo4L7NkYp/H2BK9Ok1Kq86lg/v4nm2UPFNqUYKkf8JbxkLrQtVahOEuExoyL/NQIdw2
X-Received: by 2002:a05:6214:d0f:b0:46b:af12:e20b with SMTP id 15-20020a0562140d0f00b0046baf12e20bmr12046720qvh.104.1654744477215;
        Wed, 08 Jun 2022 20:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654744477; cv=none;
        d=google.com; s=arc-20160816;
        b=W66ZR/vevgpkSrmde2k4RrF3NugZ42Tv+m9ZqMw9c9UnYI8F9pjAE2lxoGEE2tQu22
         tQ4HZ5Bd1xadVtKHBLhubVq+SBUKDPcqMlvKQ99wmQMSBlinN18I3VemLiZ4tT4wdZNK
         /lJuVjgLzGDLEkIqa4HlXhiW+1M/qM79KaADoJ0vaLNWmREmXMR01FCD9pNV4nEk0ae8
         DvEZXNjIAq5jsiEVuXB/OvofgIK03pUA/Yn0ZxuxA2gA37REz8HRf/Gdurv7ak6OwONh
         1ILI8xK5B6ZNKGtK9Mp9QioV6GGoF+DUin5OCDs2Qe3GYBSoA+iY0ReJ1HG3AXL2j/Fw
         KReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=s6jr7lODa+qV1vA7xxgh9eVRrhwFQSBDYEerh9vNvWI=;
        b=wb3Bl6CLQvO7m+/G3GIPkev+mqG73YJbcdq/BVkVYPMfkB2cXk3VhyBHy5aX9e0X6B
         1kqYTleSeVXmUSMCLomOrwy0c7fRg6fjME5ZecTmIzVAIW/8RlWFuHOtzMcQLrJQljmo
         3O5wvVRHVPX0gRK3S5qotOcRmNhnz1uQtm66AU3T7jOIzF5W1FSKQsrHyN2iJ4AxvKZE
         m3CO52V0e4mQksNHqh/qztznFLL5HMwTsp5hIKyFDZucJtFAWoXVnHTV/ITjprW8KcpP
         qcNmYER5TyvHPAwdZ/CeTk7EEUuOxv0o0v2JVN2LUsVKE/Act2WpzsdAzCN4dsfTJPf4
         0noA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=gfqAMpgq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05622a14c700b00304f0d08374si5147256qtx.210.2022.06.08.20.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jun 2022 20:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=gfqAMpgq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:33586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nz8d2-0002mw-Nh
	for alex.bennee@linaro.org; Wed, 08 Jun 2022 23:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71593e3617=irischenlj@fb.com>)
 id 1nz8cM-0002lx-0c; Wed, 08 Jun 2022 23:13:54 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:52906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71593e3617=irischenlj@fb.com>)
 id 1nz8cJ-0004O8-Am; Wed, 08 Jun 2022 23:13:53 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258Nng66000464;
 Wed, 8 Jun 2022 20:13:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=s6jr7lODa+qV1vA7xxgh9eVRrhwFQSBDYEerh9vNvWI=;
 b=gfqAMpgqZg6PeWl4ZFY60SDls6THa8AO/HC8KTsAcptnLvF5ZNIZVuOlf27GBI7VuCdp
 gnG/L4QX4UEW+0cHZRQSEe6oH4+/bEs9x28zY6V++t9oyLOe6ZLIfEcgoyJhf3Hhjm7R
 3D6BUO/TkHMfOkpVFR6xH55c52d2P2RASao= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gk14tjfmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 08 Jun 2022 20:13:27 -0700
Received: from snc-exhub201.TheFacebook.com (2620:10d:c085:21d::7) by
 snc-exhub203.TheFacebook.com (2620:10d:c085:21d::6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 8 Jun 2022 20:13:26 -0700
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c085:21d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 8 Jun
 2022 20:13:26 -0700
From: Iris Chen <irischenlj@fb.com>
To: <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <clg@kaod.org>, <patrick@stwcx.xyz>, <alistair@alistair23.me>,
 <kwolf@redhat.com>, <hreitz@redhat.com>, <peter.maydell@linaro.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <thuth@redhat.com>,
 <lvivier@redhat.com>, <pbonzini@redhat.com>, <qemu-block@nongnu.org>, "Iris
 Chen" <irischenlj@gmail.com>
Subject: [PATCH v2 1/2] hw: m25p80: add WP# pin and SRWD bit for write
 protection
Date: Wed, 8 Jun 2022 20:13:19 -0700
Message-ID: <20220609031320.2212468-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:108::4]
X-Proofpoint-GUID: vqV38EPJhHQcP1B2X2816iIzWV04s2tU
X-Proofpoint-ORIG-GUID: vqV38EPJhHQcP1B2X2816iIzWV04s2tU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_05,2022-06-07_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=71593e3617=irischenlj@fb.com;
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
X-TUID: O0jwwmV4BweC

From: Iris Chen <irischenlj@gmail.com>

Signed-off-by: Iris Chen <irischenlj@gmail.com>
---
Addressed all comments from V1. The biggest change: removed object_class_property_add.

 hw/block/m25p80.c             | 37 +++++++++++++++++++++++++++++++++++
 tests/qtest/aspeed_smc-test.c |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 81ba3da4df..1a20bd55d4 100644
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
+    bool wp_level;
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
+         * If WP# is low and status_register_write_disabled is high,
+         * status register writes are disabled.
+         * This is also called "hardware protected mode" (HPM). All other
+         * combinations of the two states are called "software protected mode"
+         * (SPM), and status register writes are permitted.
+         */
+        if ((s->wp_level == 0 && s->status_register_write_disabled)
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
@@ -1484,6 +1505,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
     return r;
 }
 
+static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
+{
+    Flash *s = M25P80(opaque);
+    /* WP# is just a single pin. */
+    assert(n == 0);
+    s->wp_level = !!level;
+}
+
 static void m25p80_realize(SSIPeripheral *ss, Error **errp)
 {
     Flash *s = M25P80(ss);
@@ -1515,12 +1544,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
         s->storage = blk_blockalign(NULL, s->size);
         memset(s->storage, 0xFF, s->size);
     }
+
+    qdev_init_gpio_in_named(DEVICE(s),
+                            m25p80_write_protect_pin_irq_handler, "WP#", 1);
 }
 
 static void m25p80_reset(DeviceState *d)
 {
     Flash *s = M25P80(d);
 
+    s->wp_level = true;
+    s->status_register_write_disabled = false;
+
     reset_memory(s);
 }
 
@@ -1601,6 +1636,8 @@ static const VMStateDescription vmstate_m25p80 = {
         VMSTATE_UINT8(needed_bytes, Flash),
         VMSTATE_UINT8(cmd_in_progress, Flash),
         VMSTATE_UINT32(cur_addr, Flash),
+        VMSTATE_BOOL(wp_level, Flash),
+        VMSTATE_BOOL(status_register_write_disabled, Flash),
         VMSTATE_BOOL(write_enable, Flash),
         VMSTATE_BOOL(reset_enable, Flash),
         VMSTATE_UINT8(ear, Flash),
diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index ec233315e6..c5d97d4410 100644
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
-- 
2.30.2

