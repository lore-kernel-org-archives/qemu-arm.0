Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDA2CAC5B8
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 01:04:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3lGH-0005aa-74; Tue, 30 Sep 2025 21:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@opnsrc.net>)
 id 1v3lFe-0005OQ-3c
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 21:03:26 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <salil.mehta@opnsrc.net>)
 id 1v3lF4-000869-VS
 for qemu-arm@nongnu.org; Tue, 30 Sep 2025 21:03:24 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso43359105e9.2
 for <qemu-arm@nongnu.org>; Tue, 30 Sep 2025 18:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=opnsrc.net; s=google; t=1759280562; x=1759885362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k9fDeb8+ggS1YDDck/5nKVP/FJk0yCNkZrkXIxC5GuQ=;
 b=Ct+mOKJD1WP/L0Kx2uoNv2ZJAVyn2LzileatBLrtHgKXuQTXVr9RN9zuN1s7uz9S2v
 fqaYoJxd+EWM++aCxR1AeFrGzuVmnOKEZ4HyEt+L6tJ4DVMX6Dodth1C39vINUunjlxG
 E6ovFO3WdFKBa4MCAEXnLlmJmbcqQdjvxGSdwGA64rqLoM2M+dg2tVKgzSbB7WDJPLFR
 tlF3JKX7OeZP43L8tAz4PBHlAbbAyORF5PfmucmYb6oLjeF034Mj8dnQcNIHPe8E5kID
 bp7tmi4unbyo8wJiXkGcWo6lW6fb0Vh4mVdNa4xMy/DN+rAy9Z5dPjowtAMhkP11tvTC
 HYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759280562; x=1759885362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k9fDeb8+ggS1YDDck/5nKVP/FJk0yCNkZrkXIxC5GuQ=;
 b=BoVVgjj/RXu32p7wRuAkVFhBSCyj/NhkH/A0+LehEr8AHSnxC+AFNQEhrtIwTnNcft
 llvX9IwOZ+OLb6AWoZeN3no9xp+TAHdyyXvkF/zmqmp0VOUSckIU5EOZFSKVIB2SPZAu
 41DRXl/KpnhuArmfrbZ609ny6XvygGwroNYnSaOzbIvTu/PtfDvIpBwelJoO+1AodTNw
 DjerQz7G1sKJtYXVUbyHGT2PfaGQzjHHSfNVtO20ZzxGodOBCDfyu911W+j0MLgmwUr8
 Tqw3Z3KVsxnU+UzQ6SC299YhFYWx0+pf0gr3y1TdRtF9VbgXadix3m1jkB2aVJuD7yjW
 oaVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGZZsN6nKU+RvPU38m+2sPKs2oz9I1mzkdFbij/YK5QvhNIwI9RTFFaJC9ztWUJ+aQJxf8iTidSw==@nongnu.org
X-Gm-Message-State: AOJu0YwgqZ51rBQGpm4/OTA+cF/X7l22vFFXzoYH2E9R9gDDjbHcYNqb
 UIURmQQi25ZWUqAv9cEDqaQ5XIJ26Iq/sDPVPoTHXwZq+ZjPBjJk17rBOjaTogaTg3w=
X-Gm-Gg: ASbGncs31/qaaCnlcX9EF2khD//UyLQ6yhVFa2AMPi4cNiS4niSwALttXIO1NSTahE/
 8srUJQJI0b90cHeK9KonYKOx7IPB1N6+Vs0SAVlK5/pWCy2qaaN+qym9iNCrzRj4qe4r3RW1aOF
 sFz7Lo8FzBk5jYUr4Nc6iU7BlUPwfp/GCLtThwtwep0UFmlttO1t4c0Fy0MVj8/CuDhCnAXeerE
 CyFlV8lr960FA3X7UIbEEq8iJaGFLIatBT6Mb/qmfmpB8+EHwQ3uiny/CsYDJ7qHTrRS7as/fNY
 lYKr5N7HTvkkZd2YClJYYo26z1W/Hab8SAKoqW6VM0EOUvIQeB4rCvVCTSj0UeaQQLoE21mBhH8
 Bs85kf8UcJMWDO+Pglxo3KOt5j51Lyn2lJxcptRjR/RHaYVIK6/EruWfwUpmYH+i684l/nQhtCf
 hLLm/UMZ9ZHzEhDirV54GOsmnMpXEwHtBpad5o4S+IZ9k=
X-Google-Smtp-Source: AGHT+IEnd2PaqW6xu2ucnLxNykBidkIjmN42qSgNnmmcJo0aFvhgoqz5Kf6BhzlGTK++4h4Q5DSzog==
X-Received: by 2002:a05:6000:2c01:b0:3ec:b899:bc39 with SMTP id
 ffacd0b85a97d-42557a1b40dmr1064969f8f.58.1759280562511; 
 Tue, 30 Sep 2025 18:02:42 -0700 (PDT)
Received: from localhost.localdomain ([90.209.204.182])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb985e080sm24587426f8f.24.2025.09.30.18.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 18:02:42 -0700 (PDT)
From: salil.mehta@opnsrc.net
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	mst@redhat.com
Cc: salil.mehta@huawei.com, maz@kernel.org, jean-philippe@linaro.org,
 jonathan.cameron@huawei.com, lpieralisi@kernel.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 imammedo@redhat.com, armbru@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 will@kernel.org, ardb@kernel.org, oliver.upton@linux.dev,
 pbonzini@redhat.com, gshan@redhat.com, rafael@kernel.org,
 borntraeger@linux.ibm.com, alex.bennee@linaro.org,
 gustavo.romero@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 gankulkarni@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, wangzhou1@hisilicon.com,
 linuxarm@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, shahuang@redhat.com, zhao1.liu@intel.com
Subject: [PATCH RFC V6 13/24] qdev: make admin power state changes trigger
 platform transitions via ACPI
Date: Wed,  1 Oct 2025 01:01:16 +0000
Message-Id: <20251001010127.3092631-14-salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=salil.mehta@opnsrc.net; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Salil Mehta <salil.mehta@huawei.com>

Changing a device's administrative power state must trigger a concrete
operational transition at the platform layer via ACPI coordination with OSPM.
The platform is responsible for actually powering devices off or on and for
notifying the guest when required.

Some machines can coordinate transitions asynchronously with OSPM using ACPI
methods and events (e.g. _EJx, device-check, _OST), while others cannot or
may not be ready when policy flips. Without a defined linkage, admin policy
can drift from runtime reality, leaving devices active while 'disabled', or
disappearing without guest notification, and migration metadata out of sync.

This change establishes that linkage: administrative DISABLED/ENABLED requests
first drive the platform's operational transition via ACPI (prefer OSPM
coordination; otherwise fall back to a synchronous in-QEMU path) and only
then update QOM state and migration registration. This provides uniform
semantics and a reliable contract for management and tests.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/core/qdev.c          | 68 ++++++++++++++++++++++++++++++++++++-----
 include/hw/powerstate.h |  6 ++++
 include/hw/qdev-core.h  | 17 +++++++++++
 3 files changed, 84 insertions(+), 7 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 23b84a7756..3aba99b912 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -326,6 +326,30 @@ bool qdev_disable(DeviceState *dev, BusState *bus, Error **errp)
                                    errp);
 }
 
+void qdev_sync_disable(DeviceState *dev, Error **errp)
+{
+    g_assert(dev);
+    g_assert(powerstate_handler(dev));
+
+    /*
+     * Administrative disable triggered either after OSPM completes _EJx
+     * (post Notify(..., 0x03)), or due to lack of async shutdown support.
+     *
+     * Device may still appear in ACPI namespace but remains disabled at
+     * the platform level. Guest cannot re-enable it until host allows.
+     */
+
+    /* Perform operational shutdown */
+    device_post_poweroff(dev, errp);
+    if (*errp) {
+        return;
+    }
+
+    /* Mark the device administratively disabled */
+    qatomic_set(&dev->admin_power_state, DEVICE_ADMIN_POWER_STATE_DISABLED);
+    smp_wmb();
+}
+
 bool qdev_enable(DeviceState *dev, BusState *bus, Error **errp)
 {
     g_assert(dev);
@@ -705,6 +729,7 @@ device_set_admin_power_state(Object *obj, int new_state, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
     DeviceClass *dc = DEVICE_GET_CLASS(dev);
+    DeviceAdminPowerState old_state;
 
     if (!dc->admin_power_state_supported) {
         error_setg(errp, "Device '%s' admin power state change not supported",
@@ -712,25 +737,54 @@ device_set_admin_power_state(Object *obj, int new_state, Error **errp)
         return;
     }
 
+    g_assert(powerstate_handler(dev));
+    old_state = qatomic_read(&dev->admin_power_state);
+
     switch (new_state) {
     case DEVICE_ADMIN_POWER_STATE_DISABLED: {
+        if (old_state == DEVICE_ADMIN_POWER_STATE_DISABLED) {
+            break;
+        }
+
         /*
-         * TODO: Operational state transition triggered by administrative action
+         * Operational state transition triggered by administrative action
          * Powering off the realized device either synchronously or via OSPM.
          */
+        if (device_graceful_poweroff_supported(dev)) {
+            /* Graceful shutdown via guest coordination */
+            device_request_poweroff(dev, errp);
+            if (*errp) {
+                return;
+            }
 
-        qatomic_set(&dev->admin_power_state, DEVICE_ADMIN_POWER_STATE_DISABLED);
-        smp_wmb();
+            qatomic_set(&dev->admin_power_state,
+                        DEVICE_ADMIN_POWER_STATE_DISABLED);
+            smp_wmb();
+        } else {
+            /* Immediate shutdown within QEMU synchronously */
+            qdev_sync_disable(dev, errp);
+            if (*errp) {
+                return;
+            }
+        }
         break;
     }
     case DEVICE_ADMIN_POWER_STATE_ENABLED: {
-        /*
-         * TODO: Operational state transition triggered by administrative action
-         * Powering on the device and restoring migration registration.
-         */
+        if (old_state == DEVICE_ADMIN_POWER_STATE_ENABLED) {
+            break;
+        }
 
         qatomic_set(&dev->admin_power_state, DEVICE_ADMIN_POWER_STATE_ENABLED);
         smp_wmb();
+
+        /*
+         * Operational state transition triggered by administrative action
+         * Powering on the device and restoring migration registration.
+         */
+        device_pre_poweron(dev, errp);
+        if (*errp) {
+            return;
+        }
         break;
     }
     default:
diff --git a/include/hw/powerstate.h b/include/hw/powerstate.h
index c16da0f24d..b35650bac4 100644
--- a/include/hw/powerstate.h
+++ b/include/hw/powerstate.h
@@ -168,4 +168,10 @@ void device_post_poweroff(DeviceState *dev, Error **errp);
 void device_pre_poweron(DeviceState *dev, Error **errp);
 
 void device_request_standby(DeviceState *dev, Error **errp);
+
+static inline bool device_graceful_poweroff_supported(DeviceState *dev)
+{
+    PowerStateHandler *h = powerstate_handler(dev);
+    return h && POWERSTATE_HANDLER_GET_CLASS(h)->request_poweroff;
+}
 #endif /* POWERSTATE_H */
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 855ff865ba..3e08cfb59f 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -8,6 +8,7 @@
 #include "qemu/rcu_queue.h"
 #include "qom/object.h"
 #include "hw/hotplug.h"
+#include "hw/powerstate.h"
 #include "hw/resettable.h"
 
 /**
@@ -589,6 +590,22 @@ bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
  */
 bool qdev_disable(DeviceState *dev, BusState *bus, Error **errp);
 
+/**
+ * qdev_sync_disable - Force immediate power-off and administrative disable
+ * @dev:   The device to be powered off and administratively disabled
+ * @errp:  Pointer to a location where an error can be reported
+ *
+ * This function performs a synchronous power-off of the device and marks it
+ * as administratively DISABLED. It assumes that prior graceful handling (e.g.,
+ * ACPI _EJx) has already been completed, or that asynchronous mechanisms are
+ * unsupported.
+ *
+ * After execution, the device remains visible to the guest (e.g. via ACPI),
+ * but cannot be brought back online unless explicitly re-enabled via admin
+ * policy. This function also removes the device from the migration stream.
+ */
+void qdev_sync_disable(DeviceState *dev, Error **errp);
+
 /**
  * qdev_enable - Power on and administratively enable a device
  * @dev:   The device to be powered on and administratively enabled
-- 
2.34.1


