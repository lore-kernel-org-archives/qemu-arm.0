Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2061969ejb;
        Mon, 20 Feb 2023 00:13:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8vpKH2W3/I8vD/OqJHfN6ZjAwjARik9d/GZi9UuIcd+Da94OFmRWoKTMYRFMNJllsz2dRl
X-Received: by 2002:ac8:5c92:0:b0:3b8:6442:2575 with SMTP id r18-20020ac85c92000000b003b864422575mr16086472qta.49.1676880810161;
        Mon, 20 Feb 2023 00:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676880810; cv=none;
        d=google.com; s=arc-20160816;
        b=HLT4XEWFtGMELewV2ayEoQTVIp6f3dvGKLh9GllzW23nlPv+bKbCbqmhr2fy/CO6Dr
         vipaBccymVxQhyLw8vIMNDIlSkfq1FY8TzlynnWvDHpjF1qzgTjwWNmYElMbtw8nMFsn
         syycE5dCsiciKdmq/OfXsLQbtnNAfZKRmOI0KLTFlEueIzMWzky+/tgYy/8jwEKSTrnP
         g46RSLyQsbmS9L2hVvQUbrYpOj/TlWzElSWbbJa6jKlRfguPcIvn3U5NhVwOOe3GQDPG
         6L8m6Xcf2qQ/2neTHVRScCWb1SSaQPw9jJcQY5KmeikKNKbbw3hSgWXxJLy+jKMMTKa6
         3Cvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W8oseXLLoGmg6ep9d/aMwd6HC+YABeP2tHYrtdkhkk4=;
        b=WnUNehAISno+7uwZ3nA+g3iZR4c4Nm3nbpEyQO1zdOdzZfNJ7dr+bkiLHvX8Z9vf/p
         ykiXQXU19VnN2LiPN0M8aG2+1YVjp+o1hT9oCRRVv6YkKMp2xuMgj+w/31EGOJ931dNy
         qKl7PjJX+h0aeAtmtOzc46dQM7+F7UX+L4j0GYRcTUR5cHGHjF4bU5SiQbb+ACloyAM7
         O+ZLpJ3r3XpwYn9L2OOyMLpTBdyhN3aAVBRYsFkLadrKgu7K2HklFyhaHzatsJyjQEU+
         VBHXGRnXh8HsW7x4wI/dd050HgblYS8P0XQkGwQ5au7MGTaCqqSsXun4AHayGmPGlksf
         Ijkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=ohAa7LQi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s64-20020a372c43000000b0073b7761b271si8451554qkh.724.2023.02.20.00.13.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 00:13:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=ohAa7LQi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU1IV-00028z-Qs; Mon, 20 Feb 2023 03:13:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pU1IU-00028W-0M; Mon, 20 Feb 2023 03:13:18 -0500
Received: from m12.mail.163.com ([220.181.12.198])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pU1IQ-0001Nc-HI; Mon, 20 Feb 2023 03:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=W8ose
 XLLoGmg6ep9d/aMwd6HC+YABeP2tHYrtdkhkk4=; b=ohAa7LQiIqyZWS7ptb9pr
 fnA21EDWonHq6gAurDSixsD3WAF9Gsqs2KQG7HkaE/1oQOgdjUZ7xJyV95tx/7Xr
 DfZ2LspzPsBUvGP47SaAtgRZVQtXVQ7AnVkAGZAKJKVPoOfUEsKwMxDwv5xpokah
 NWXBM1r1/CXtzoKwOJADCM=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.20])
 by zwqz-smtp-mta-g2-4 (Coremail) with SMTP id _____wCnPYyDK_NjSU3yAQ--.59158S3;
 Mon, 20 Feb 2023 16:12:52 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v2 2/3] hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG on SUN6i SoCs
Date: Mon, 20 Feb 2023 16:12:51 +0800
Message-Id: <20230220081252.25348-2-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220081252.25348-1-qianfanguijin@163.com>
References: <20230220081252.25348-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnPYyDK_NjSU3yAQ--.59158S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFyxCFW3KFyrAFWUWF43Awb_yoW5Kw4rpF
 Wqgr45KF4Yqa97WrnIqFn8GF18Jry8C3y8Krsa9FyIvFnrW3ZFqr1ktrWakrn8GrWrJw43
 tFs8tFyxWFn0qaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRcVy7UUUUU=
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiGgYc7VaEEUbKKAABsL
Received-SPF: pass client-ip=220.181.12.198;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RULEVCb2ks0X

From: qianfan Zhao <qianfanguijin@163.com>

TWI_CNTR_INT_FLAG is W1C(write 1 to clear and write 0 has non-effect)
register on SUN6i based SoCs, we should lower interrupt when the guest
set this bit.

The linux kernel will hang in irq handler(mv64xxx_i2c_intr) if no
device connected on the i2c bus, next is the trace log:

allwinner_i2c_write write   CNTR(0x0c): 0xc4 A_ACK BUS_EN INT_EN
allwinner_i2c_write write   CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
allwinner_i2c_read  read    CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
allwinner_i2c_read  read    STAT(0x10): 0x20 STAT_M_ADDR_WR_NACK
allwinner_i2c_write write   CNTR(0x0c): 0x54 A_ACK M_STP BUS_EN
allwinner_i2c_write write   CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
allwinner_i2c_read  read    CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
allwinner_i2c_read  read    STAT(0x10): 0xf8 STAT_IDLE
allwinner_i2c_write write   CNTR(0x0c): 0x54 A_ACK M_STP BUS_EN
allwinner_i2c_write write   CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
allwinner_i2c_read  read    CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
allwinner_i2c_read  read    STAT(0x10): 0xf8 STAT_IDLE
...

Fix it.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/i2c/allwinner-i2c.c         | 26 ++++++++++++++++++++++++--
 include/hw/i2c/allwinner-i2c.h |  6 ++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
index fa650e7e02..819638d740 100644
--- a/hw/i2c/allwinner-i2c.c
+++ b/hw/i2c/allwinner-i2c.c
@@ -463,10 +463,16 @@ static void allwinner_i2c_write(void *opaque, hwaddr offset,
                 s->stat = STAT_FROM_STA(STAT_IDLE);
                 s->cntr &= ~TWI_CNTR_M_STP;
             }
-            if ((s->cntr & TWI_CNTR_INT_FLAG) == 0) {
-                /* Interrupt flag cleared */
+
+            if (!s->irq_clear_inverted && !(s->cntr & TWI_CNTR_INT_FLAG)) {
+                /* Write 0 to clear this flag */
+                qemu_irq_lower(s->irq);
+            } else if (s->irq_clear_inverted && (s->cntr & TWI_CNTR_INT_FLAG)) {
+                /* Write 1 to clear this flag */
+                s->cntr &= ~TWI_CNTR_INT_FLAG;
                 qemu_irq_lower(s->irq);
             }
+
             if ((s->cntr & TWI_CNTR_A_ACK) == 0) {
                 if (STAT_TO_STA(s->stat) == STAT_M_DATA_RX_ACK) {
                     s->stat = STAT_FROM_STA(STAT_M_DATA_RX_NACK);
@@ -557,9 +563,25 @@ static const TypeInfo allwinner_i2c_type_info = {
     .class_init = allwinner_i2c_class_init,
 };
 
+static void allwinner_i2c_sun6i_init(Object *obj)
+{
+    AWI2CState *s = AW_I2C(obj);
+
+    s->irq_clear_inverted = true;
+}
+
+static const TypeInfo allwinner_i2c_sun6i_type_info = {
+    .name = TYPE_AW_I2C_SUN6I,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AWI2CState),
+    .instance_init = allwinner_i2c_sun6i_init,
+    .class_init = allwinner_i2c_class_init,
+};
+
 static void allwinner_i2c_register_types(void)
 {
     type_register_static(&allwinner_i2c_type_info);
+    type_register_static(&allwinner_i2c_sun6i_type_info);
 }
 
 type_init(allwinner_i2c_register_types)
diff --git a/include/hw/i2c/allwinner-i2c.h b/include/hw/i2c/allwinner-i2c.h
index 4f378b86ba..0e325d265e 100644
--- a/include/hw/i2c/allwinner-i2c.h
+++ b/include/hw/i2c/allwinner-i2c.h
@@ -28,6 +28,10 @@
 #include "qom/object.h"
 
 #define TYPE_AW_I2C "allwinner.i2c"
+
+/** Allwinner I2C sun6i family and newer (A31, H2+, H3, etc) */
+#define TYPE_AW_I2C_SUN6I    TYPE_AW_I2C "-sun6i"
+
 OBJECT_DECLARE_SIMPLE_TYPE(AWI2CState, AW_I2C)
 
 #define AW_I2C_MEM_SIZE         0x24
@@ -50,6 +54,8 @@ struct AWI2CState {
     uint8_t srst;
     uint8_t efr;
     uint8_t lcr;
+
+    bool irq_clear_inverted;
 };
 
 #endif /* ALLWINNER_I2C_H */
-- 
2.25.1

