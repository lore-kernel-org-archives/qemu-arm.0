Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp528836lfg;
        Thu, 25 Mar 2021 08:37:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGkMehNjjgT82We2Samb10OS7ajvyYMuXer10mHucOxTYNXH/JSfw2ZtJ1kRFR0N6UpYRu
X-Received: by 2002:a02:cd33:: with SMTP id h19mr7987858jaq.88.1616686632632;
        Thu, 25 Mar 2021 08:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616686632; cv=none;
        d=google.com; s=arc-20160816;
        b=guGVMLKzugx1+WH35uXwv2slAZOqaYY+CqGggSqwBPe2rboVC7aJmMRd+TDhCJQ1ZI
         3HF7nm5hVpnZHiGS4n73fQmHONuze/a9Z9vkc7jxqNg7R29Lg5o5QU9zvkmtiVFZ8ogl
         Cl+5zS8yQcwuhh0bf4qRM2s/9dF6fk3saWFR7upGOEpbi/XlkTlQszcHG+I3gREffXB/
         t0xx0zH0HuoZaNdU0s430XPN/pfTjFO/CFHH4lCJCifrMkBmXMyehu6AbXT+/1yBb2sI
         UD3voOyXYloPnxTsC8r4XHLvYud5sliV6VzeD6eieOlyKcZWsigeler6t2+NyXhYRBj+
         0lGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qsbZ3WwBIAsRBGcGHbyvNlewlN2P0E/qqzYZ7ye59xs=;
        b=Y6424IM9M3HyTFdyEe2TtD0MertzMw8SKH+RhcdQSA7Hbl3qOpGQIVXwsQd8N9ycII
         Vq1byOhdoQzk7K4tO/zMTT5YmiCWbs5m7H9lJ7ZB9zZfz24QqobIH3su5bnVsgcky85t
         aZ2i+qIjtFHRKtISoXG+QRPc6VCkteGd4/V6d/ff+UHEqdRTmynd6JQ+KCge0BoBhxfI
         /PTTQb2Vm8d/eUQRyBxsPc+BH97C3f6Ztddun8iyGyQS+OqvmUNu0UYsNi0Dw/cSDm8a
         V66flKWcRU6/bsSI4KiPuwCpOGvfdFSuXmOAfLdWvjVJzJgoM68TVozM8YhXxloCHg6k
         qAIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z0PnyL0O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si4448476iop.38.2021.03.25.08.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 08:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z0PnyL0O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPS2p-0000IC-TD
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 11:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRzB-0005E9-CJ
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:33:26 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRz5-000564-Pw
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:33:25 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so3333747wmd.4
 for <qemu-arm@nongnu.org>; Thu, 25 Mar 2021 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qsbZ3WwBIAsRBGcGHbyvNlewlN2P0E/qqzYZ7ye59xs=;
 b=Z0PnyL0OgB70hT+woVqg8D4e8BzLbvaOplIzx5NzFRWKMNMXNkyi1rGkdwoVRoDhah
 7knOo1YMezs1xVpXEogcqE9SKrrrznUtYpxV7hKXiMrpAHz4FgQepNvaiq3vImXE/ZD9
 g+LVxaRZpTza4yvxWL4oGem8y9Hc84FcYiC9Ouw6zBRTupTEXaeh3OqvCthYccj/IHC0
 0dRThM/QyxnAc9O3pnYodMJ45XGq0Ga2dk6RXMeLVcyy9knlUFmAfnXHWgvRLVI8LKiF
 OuZsBXnDLkpnUj7YdQx5Ajer4lCH52KiOYpkr32Pb+KbhY8qupdY4YFUyJKeDeJmeRn/
 yvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qsbZ3WwBIAsRBGcGHbyvNlewlN2P0E/qqzYZ7ye59xs=;
 b=kSNgeidyXvCCYgTZKWe+FKls1ZgX/Xjp7lCD1ts8mOfMwN9UE+sBI+qn57UXzgStlQ
 jQXUf+5C/JHYtbSYGW8Z5ST83UKkMuoGaAH50JcwDYHkUXLLzk3qhpGpAeEW+C6GQAMC
 +/SKO9aITasPLVxYPMtez4CQl4mu7Zxt/F4yyVIbMPfTretjNb7N6kuwoYpJfgBNxl26
 c+o4Qx1EHFRI67tfBWYjrvZIAVUZqxj0CJ/bq0tylBqZRb8LQNjArNYS44Y46kVUw+Xu
 ch4z2RyNdlcwezTCEQBEXu2yIdsbQ1AGAGFIayQBMFa2ApgNjMjczGc0SOF5IprkQZ65
 puKA==
X-Gm-Message-State: AOAM5322i6w1xlyQXPW2ZllLMLy7fBAcgeBfohQhca43KEYt3EdQmiwr
 8w7cUzVwM5LW3zc5NpVZuH6jRLG7ob0t3S3f
X-Received: by 2002:a7b:c04d:: with SMTP id u13mr8489521wmc.83.1616686395042; 
 Thu, 25 Mar 2021 08:33:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g11sm8004580wrw.89.2021.03.25.08.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:33:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 2/4] machine: Provide a function to check the dynamic
 sysbus whitelist
Date: Thu, 25 Mar 2021 15:33:08 +0000
Message-Id: <20210325153310.9131-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
References: <20210325153310.9131-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DFWhu8MJXo7/

Provide a new function dynamic_sysbus_dev_allowed() which checks
the per-machine whitelist of dynamic sysbus devices and returns
a boolean result indicating whether the device is whitelisted.
We can use this in the implementation of validate_sysbus_device(),
but we will also need it so that machine hotplug callbacks can
validate devices rather than assuming that any sysbus device
might be hotpluggable into the platform bus.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/boards.h | 24 ++++++++++++++++++++++++
 hw/core/machine.c   | 21 ++++++++++++++++-----
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 27106abc11d..609112a4e1a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -51,6 +51,30 @@ void machine_set_cpu_numa_node(MachineState *machine,
  */
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
 
+/**
+ * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
+ * @mc: Machine class
+ * @dev: device to check
+ *
+ * Returns: true if @dev is a sysbus device on the machine's whitelist
+ * of dynamically pluggable sysbus devices; otherwise false.
+ *
+ * This function checks whether @dev is a valid dynamic sysbus device,
+ * by first confirming that it is a sysbus device and then checking it
+ * against the whitelist of permitted dynamic sysbus devices which has
+ * been set up by the machine using machine_class_allow_dynamic_sysbus_dev().
+ *
+ * It is valid to call this with something that is not a subclass of
+ * TYPE_SYS_BUS_DEVICE; the function will return false in this case.
+ * This allows hotplug callback functions to be written as:
+ *     if (device_is_dynamic_sysbus(mc, dev)) {
+ *         handle dynamic sysbus case;
+ *     } else if (some other kind of hotplug) {
+ *         handle that;
+ *     }
+ */
+bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev);
+
 /*
  * Checks that backend isn't used, preps it for exclusive usage and
  * returns migratable MemoryRegion provided by backend.
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 9935c6ddd56..8d97094736a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -529,20 +529,31 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
     QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
 }
 
-static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
+bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
 {
-    MachineState *machine = opaque;
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
     bool allowed = false;
     strList *wl;
+    Object *obj = OBJECT(dev);
+
+    if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
+        return false;
+    }
 
     for (wl = mc->allowed_dynamic_sysbus_devices;
          !allowed && wl;
          wl = wl->next) {
-        allowed |= !!object_dynamic_cast(OBJECT(sbdev), wl->value);
+        allowed |= !!object_dynamic_cast(obj, wl->value);
     }
 
-    if (!allowed) {
+    return allowed;
+}
+
+static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
+{
+    MachineState *machine = opaque;
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+
+    if (!device_is_dynamic_sysbus(mc, DEVICE(sbdev))) {
         error_report("Option '-device %s' cannot be handled by this machine",
                      object_class_get_name(object_get_class(OBJECT(sbdev))));
         exit(1);
-- 
2.20.1

