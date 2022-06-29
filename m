Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp135748lft;
        Tue, 28 Jun 2022 20:40:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uKQgFQbjReoMKVHZK/341eEah5bjPVQp2pNhTKtslsRFTXzNK81p2Xflr+9BOCf9EEeJAR
X-Received: by 2002:a05:620a:8007:b0:6b1:4911:c5bb with SMTP id ee7-20020a05620a800700b006b14911c5bbmr75650qkb.448.1656474018010;
        Tue, 28 Jun 2022 20:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656474018; cv=none;
        d=google.com; s=arc-20160816;
        b=e42OkqPwwCvUE5Lut3EWPmfFEndSQNEoO1iJl5MgbTlGKuXMHesnG/HP733H6C3KoY
         FfnWyqBgyEaaITNhTo7cmt981qUagHpuMNDMy2e4OeCz+gD6jF9ECZvdYSfyxYin2c50
         1mDPE8jP2LIvZod2K2Un3x+vCDUiZBYqKAqYhUCGaV3Nw4oiz01SxAqqCRDMQhKPq36q
         AaBSDiAzyQ2s3kh5sljRHCNcgOq7VOkOQ/dVcIB7jxTWO1aaBPbUJcRGzFCtzOYr8MSD
         hTf2tTSKNvRKZpQG2wfuK0jZPb61RWGS+tLmoAOFW8D/rjoEpIKzB3ESX3lsB6Wm9ayz
         mYyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=m6HnsM1GE9zfNQZdSDDG8Va3eAhnVI4VwKPZDbWjHfo=;
        b=miyWsaQB1uq+ExVOah2Fp7KfNwCnPSY/IDiZc2vNomCidmNAOBbWNZlk6g0RCDf3Em
         dWtXZS4zbd1rveOOzOohrK1N7p027FFW3+opXcTZyqWQQ7z1hThCtm9gCvB3QGoMLzIx
         rBhVllwmaZdoRQgRZlmRYy4vXqamtxZDxh1s/8U/pV2H0Q02iioFaHKYi9xaySWr4z+T
         cbbXvoiaVPyRKhEoePATrktvWtPGo06lOf8WPFFE7SxrIEVqCGm00nOiMScn5JU38qKf
         rVDJdL/3G1wmjQ7F0Wd7Ib/nvF++keUVgy0dgsFh475ZM3x6Cd70HABIYmhnrKp+ldLM
         vdxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=okSNJfgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k68-20020a37a147000000b006a6aedc4668si8384473qke.749.2022.06.28.20.40.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 20:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=okSNJfgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6OYr-0005ic-D4
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 23:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVO-0007Vy-PC; Tue, 28 Jun 2022 23:36:42 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVM-0006j9-UH; Tue, 28 Jun 2022 23:36:42 -0400
Received: by mail-pg1-x534.google.com with SMTP id d129so14050547pgc.9;
 Tue, 28 Jun 2022 20:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6HnsM1GE9zfNQZdSDDG8Va3eAhnVI4VwKPZDbWjHfo=;
 b=okSNJfgi77udcW2noC+G7jxdCoE7hPF7faV+1AP6u2bcWxr5jSEc0G+UoAMT/2BnlR
 fLTeph3QPc5BTq/7fVnPw6Ua04ZSGR8dzgv1I+PIoJMTkS3D9O7/2WaYUhisxa5x9D82
 1NVT264+UZf60BAlHxq7jwL+NfIR4c9NMLiAFUWOWhWTZ7BOhX53Bvnl2sWO6VrrbPtq
 mapnQTqIDBUEshqqY9Vv+CcI2YL8x0o3/c8UPNHOdlKbgo/LofXFHEsqqKh9o8zUgFem
 RIapzxGgZ2BwPeTtYT9Kbg3kHe5fh6L6CZkujI9Sxf3clJB+hkvkL23TITqaisHjuYRF
 ArGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6HnsM1GE9zfNQZdSDDG8Va3eAhnVI4VwKPZDbWjHfo=;
 b=CcccgOZQzctZxK2bhkiKld0mLinlzmS9m8rMGh8ZZMrr3gaCoqqP3BHe1+HbscuTEf
 YxFKumvhH9fVoOstxP+J5oom5Uhx74q9AIP6DNFtXmmwQ16xNthBIun350O3NyeMU1JZ
 Pjz29hWxxCklrxESt2nE2OsPTBlFI96gPpvwmqYQviqerXhCU5sTS/83HqlZxYvzWQ8R
 IMJA6I0GLsmLhaYshSYUbJQvPEUejVLY+QqHjA8cdmcdAl23Y+K8ckSq261XthQXwye8
 PmK6UzYD0KB85Z2mOh2pSoFZORW7z+sfsX89id2u4jq7jhEC1DLaEIrsMFuYl+sWJURv
 u9Zw==
X-Gm-Message-State: AJIora/enymyMe2L4rAViZ757XciWj3NIKAXa1aK7oLl4sbQTFIlA+CA
 Js95q3gbrgc6/kuW2RZjiFg=
X-Received: by 2002:a63:140e:0:b0:408:a923:1a81 with SMTP id
 u14-20020a63140e000000b00408a9231a81mr1187974pgl.358.1656473799279; 
 Tue, 28 Jun 2022 20:36:39 -0700 (PDT)
Received: from localhost (fwdproxy-prn-016.fbsv.net.
 [2a03:2880:ff:10::face:b00c]) by smtp.gmail.com with ESMTPSA id
 jh2-20020a170903328200b00161478027f5sm10078575plb.150.2022.06.28.20.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:38 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 04/13] hw/i2c: support multiple masters
Date: Tue, 28 Jun 2022 20:36:25 -0700
Message-Id: <20220629033634.3850922-5-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OCh48ava6Z09

From: Klaus Jensen <k.jensen@samsung.com>

Allow slaves to master the bus by registering a bottom halve. If the bus
is busy, the bottom half is queued up. When a slave has succesfully
mastered the bus, the bottom half is scheduled.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
[ clg : - fixed typos in commit log ]
Message-Id: <20220601210831.67259-4-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/core.c        | 34 +++++++++++++++++++++++++++++++++-
 include/hw/i2c/i2c.h | 14 ++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index d0cb2d32fa..145dce6078 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -13,6 +13,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/main-loop.h"
 #include "trace.h"
 
 #define I2C_BROADCAST 0x00
@@ -62,6 +63,7 @@ I2CBus *i2c_init_bus(DeviceState *parent, const char *name)
 
     bus = I2C_BUS(qbus_new(TYPE_I2C_BUS, parent, name));
     QLIST_INIT(&bus->current_devs);
+    QSIMPLEQ_INIT(&bus->pending_masters);
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_i2c_bus, bus);
     return bus;
 }
@@ -74,7 +76,7 @@ void i2c_slave_set_address(I2CSlave *dev, uint8_t address)
 /* Return nonzero if bus is busy.  */
 int i2c_bus_busy(I2CBus *bus)
 {
-    return !QLIST_EMPTY(&bus->current_devs);
+    return !QLIST_EMPTY(&bus->current_devs) || bus->bh;
 }
 
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
@@ -180,6 +182,26 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
                                                : I2C_START_SEND);
 }
 
+void i2c_bus_master(I2CBus *bus, QEMUBH *bh)
+{
+    if (i2c_bus_busy(bus)) {
+        I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
+        node->bh = bh;
+
+        QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
+
+        return;
+    }
+
+    bus->bh = bh;
+    qemu_bh_schedule(bus->bh);
+}
+
+void i2c_bus_release(I2CBus *bus)
+{
+    bus->bh = NULL;
+}
+
 int i2c_start_recv(I2CBus *bus, uint8_t address)
 {
     return i2c_do_start_transfer(bus, address, I2C_START_RECV);
@@ -206,6 +228,16 @@ void i2c_end_transfer(I2CBus *bus)
         g_free(node);
     }
     bus->broadcast = false;
+
+    if (!QSIMPLEQ_EMPTY(&bus->pending_masters)) {
+        I2CPendingMaster *node = QSIMPLEQ_FIRST(&bus->pending_masters);
+        bus->bh = node->bh;
+
+        QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
+        g_free(node);
+
+        qemu_bh_schedule(bus->bh);
+    }
 }
 
 int i2c_send(I2CBus *bus, uint8_t data)
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 5ca3b708c0..be8bb8b78a 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -69,13 +69,25 @@ struct I2CNode {
     QLIST_ENTRY(I2CNode) next;
 };
 
+typedef struct I2CPendingMaster I2CPendingMaster;
+
+struct I2CPendingMaster {
+    QEMUBH *bh;
+    QSIMPLEQ_ENTRY(I2CPendingMaster) entry;
+};
+
 typedef QLIST_HEAD(I2CNodeList, I2CNode) I2CNodeList;
+typedef QSIMPLEQ_HEAD(I2CPendingMasters, I2CPendingMaster) I2CPendingMasters;
 
 struct I2CBus {
     BusState qbus;
     I2CNodeList current_devs;
+    I2CPendingMasters pending_masters;
     uint8_t saved_address;
     bool broadcast;
+
+    /* Set from slave currently mastering the bus. */
+    QEMUBH *bh;
 };
 
 I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
@@ -117,6 +129,8 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
 
 void i2c_end_transfer(I2CBus *bus);
 void i2c_nack(I2CBus *bus);
+void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
+void i2c_bus_release(I2CBus *bus);
 int i2c_send(I2CBus *bus, uint8_t data);
 uint8_t i2c_recv(I2CBus *bus);
 bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
-- 
2.30.2

