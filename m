Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp139100lft;
        Tue, 28 Jun 2022 20:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uh5lCwVxihFkiNERhDnQVaZDEHOAjuvT8v7GkfFZtjZxOBnAJCM2gVjSi3EDJP3NJ9luZf
X-Received: by 2002:a37:630a:0:b0:6af:4a97:ab85 with SMTP id x10-20020a37630a000000b006af4a97ab85mr693287qkb.1.1656474520653;
        Tue, 28 Jun 2022 20:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656474520; cv=none;
        d=google.com; s=arc-20160816;
        b=UEnGpFEcJBdnNbg/i64+2Zu+Dwupzqr6kmpviINeu5mK4IWQoRfmFpZBrSp0sryMET
         eZX76nWAX9enZK+c8UWSFQJs6FcKGd/m8PWqZBaTJco5eMrkX9UiGcA59WCxYo3FZOor
         UCYYqTf+XHFOeprXW+4HVN4IFwG9TdBKUXIpHP9vuphf1yZeqJgeVIQVO7KItz2NvWDT
         pzTt/nZTMCVDUEq5HuCq1Ptq7m3ChhAyYcpf1QhtNuBrIYihq/0gWaT+/kjfPVmmq41q
         pXAZXgfafoxBXY78y9Hu7MGjXiNzT0awrbdv2OHA9y6Bh/WDsM0Mv7QNoZJmVEov//Dd
         iKGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3q1s4ScM99S1u0cq6BdjiWyx+aQVAgBUoJiRzkTlxxA=;
        b=eu+DGwlqeY0QKk7/XMKJM0mezdLqGWS1XbfGrkz2ZSTAtFnU6oCF//3uIVWiZlAlpg
         1AmdHuNab6se/8U0ikeaMUA+XCz6W7ralLreyPSpoZKabBKhhmII2FCQ5sJZdcqIVDcm
         G9MOxFu2zXmmJlf0mJSWnpeOZ9bhlw91lIaTRlgv6pDUZn6ext9LAp2DVqSDkp3ptb18
         ZNGht8fVoY+4o/F7TzRKakzUG9qa4UN881AS/UAy0k4LJguA5hWy91QlO0VCYuHFGME9
         RkIMJid6J8eBG3e+XZzfxt98StU0NewwvpSCZ+239i/+rsj2dpeV8cj7i+Ix/mCAbX9r
         70sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=RLTZf3LB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020ac87f4d000000b0030502f99d02si9068708qtk.456.2022.06.28.20.48.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 20:48:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=RLTZf3LB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6Ogy-0007uJ-1p
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 23:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVS-0007jK-HO; Tue, 28 Jun 2022 23:36:46 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVQ-0006na-NY; Tue, 28 Jun 2022 23:36:46 -0400
Received: by mail-pl1-x62c.google.com with SMTP id r1so12855363plo.10;
 Tue, 28 Jun 2022 20:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3q1s4ScM99S1u0cq6BdjiWyx+aQVAgBUoJiRzkTlxxA=;
 b=RLTZf3LBfDlUxcvInSRaxt6fCMETPUQ9eFsxaKM1k3wL4kT1cqmikUJapn9tYgmuUr
 +U5rYnmYR3+fLkRixUOVQvJJCSBx/ZS8cjqrT8iew42xZn0DO6uC4uD5oCTw009HCKTs
 taoIIwudhN+phLsBuorcYra+3W7265TnvWW12vBCDDzobhEtHChEKe/9rmREYdRXv9a9
 lXaoUnXlIUOap0T+8jxBFz2LKd6ZNpLJwt31rZ1EhQlo8pghTtv+toxby+eqCXBatUY0
 FMzXX+tx5AGbj0neLhOrSw3tfY7XZXGkouHvOlKN7UpvRRocs0qP4+AkvhJLd8gfq9qI
 qYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3q1s4ScM99S1u0cq6BdjiWyx+aQVAgBUoJiRzkTlxxA=;
 b=zTAnlyYcxfflwmgboHpwtJKBDNbcjE6Or5KctugYU+FcYYudK3a26nvD1adYu2MN5R
 OT5zIbyBJIwMB9eI13a9G4DHxOIl54/G0PR2UH/mo/6XLAPQsHWGmKWnlf7KATtC/8sX
 N5pSLquLywnP8ZfIBwqaRhkO3LqTKw/Lk634A6AWOnoTwfZMuAs6rXQWJFU/qytjGEbr
 G7/GrMdqJUDhT7Uja0gysMNH/Agnh2Qb9m9rF0ihlE3jgSsXdN50XLDJS/W9FR23DjAO
 +28pMrSQPwL0oRoeVvDrgydolkkmMEWt/GwkViECCtPEUAmNDePV2phCC8Ye5BlwRat7
 GUiQ==
X-Gm-Message-State: AJIora9x4S9Zl2eO4r2MndBjuhxoH/Zwv14cfI4hRy8r79XPkGo1l6fC
 TTuBbHwOB6R6uoqIwGah03A=
X-Received: by 2002:a17:903:124f:b0:16b:8167:e34e with SMTP id
 u15-20020a170903124f00b0016b8167e34emr8220677plh.52.1656473803585; 
 Tue, 28 Jun 2022 20:36:43 -0700 (PDT)
Received: from localhost (fwdproxy-prn-008.fbsv.net.
 [2a03:2880:ff:8::face:b00c]) by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00165105518f6sm10081261plb.287.2022.06.28.20.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:43 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 09/13] hw/i2c/pmbus: Add read-only IC_DEVICE_ID support
Date: Tue, 28 Jun 2022 20:36:30 -0700
Message-Id: <20220629033634.3850922-10-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DrnoZinXOBEn

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/pmbus_device.c            |  5 +++++
 hw/sensor/isl_pmbus_vr.c         | 31 +++++++++++++++++++++++++++++++
 include/hw/i2c/pmbus_device.h    |  1 +
 include/hw/sensor/isl_pmbus_vr.h |  1 +
 4 files changed, 38 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index efddc36fd9..82131fff85 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -984,6 +984,11 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
 
+    case PMBUS_IC_DEVICE_ID:
+        pmbus_send(pmdev, pmdev->pages[index].ic_device_id,
+                   sizeof(pmdev->pages[index].ic_device_id));
+        break;
+
     case PMBUS_CLEAR_FAULTS:              /* Send Byte */
     case PMBUS_PAGE_PLUS_WRITE:           /* Block Write-only */
     case PMBUS_STORE_DEFAULT_ALL:         /* Send Byte */
diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
index e11e028884..b12c46ab6d 100644
--- a/hw/sensor/isl_pmbus_vr.c
+++ b/hw/sensor/isl_pmbus_vr.c
@@ -218,6 +218,28 @@ static void isl_pmbus_vr_class_init(ObjectClass *klass, void *data,
     k->device_num_pages = pages;
 }
 
+static void isl69259_init(Object *obj)
+{
+    static const uint8_t ic_device_id[] = {0x04, 0x00, 0x81, 0xD2, 0x49};
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+    int i;
+
+    raa22xx_init(obj);
+    for (i = 0; i < pmdev->num_pages; i++) {
+        memcpy(pmdev->pages[i].ic_device_id, ic_device_id,
+               sizeof(ic_device_id));
+    }
+}
+
+static void isl69259_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->desc = "Renesas ISL69259 Digital Multiphase Voltage Regulator";
+    rc->phases.exit = isl_pmbus_vr_exit_reset;
+    isl_pmbus_vr_class_init(klass, data, 2);
+}
+
 static void isl69260_class_init(ObjectClass *klass, void *data)
 {
     ResettableClass *rc = RESETTABLE_CLASS(klass);
@@ -245,6 +267,14 @@ static void raa229004_class_init(ObjectClass *klass, void *data)
     isl_pmbus_vr_class_init(klass, data, 2);
 }
 
+static const TypeInfo isl69259_info = {
+    .name = TYPE_ISL69259,
+    .parent = TYPE_PMBUS_DEVICE,
+    .instance_size = sizeof(ISLState),
+    .instance_init = isl69259_init,
+    .class_init = isl69259_class_init,
+};
+
 static const TypeInfo isl69260_info = {
     .name = TYPE_ISL69260,
     .parent = TYPE_PMBUS_DEVICE,
@@ -271,6 +301,7 @@ static const TypeInfo raa228000_info = {
 
 static void isl_pmbus_vr_register_types(void)
 {
+    type_register_static(&isl69259_info);
     type_register_static(&isl69260_info);
     type_register_static(&raa228000_info);
     type_register_static(&raa229004_info);
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 0f4d6b3fad..aed7809841 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -407,6 +407,7 @@ typedef struct PMBusPage {
     uint16_t mfr_max_temp_1;           /* R/W word */
     uint16_t mfr_max_temp_2;           /* R/W word */
     uint16_t mfr_max_temp_3;           /* R/W word */
+    uint8_t ic_device_id[16];          /* Read-Only block-read */
 } PMBusPage;
 
 /* State */
diff --git a/include/hw/sensor/isl_pmbus_vr.h b/include/hw/sensor/isl_pmbus_vr.h
index 3e47ff7e48..d501b3bc82 100644
--- a/include/hw/sensor/isl_pmbus_vr.h
+++ b/include/hw/sensor/isl_pmbus_vr.h
@@ -12,6 +12,7 @@
 #include "hw/i2c/pmbus_device.h"
 #include "qom/object.h"
 
+#define TYPE_ISL69259   "isl69259"
 #define TYPE_ISL69260   "isl69260"
 #define TYPE_RAA228000  "raa228000"
 #define TYPE_RAA229004  "raa229004"
-- 
2.30.2

