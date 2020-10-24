Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1489498lfa;
        Sat, 24 Oct 2020 10:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCI3iW4cuf+NZ83XmBkD/XLPh/V63LJpw8Lpb+UiyWx0wHsZ7iibekGPjUqPQ7Ib5AVW0H
X-Received: by 2002:aed:3163:: with SMTP id 90mr8750099qtg.225.1603559100706;
        Sat, 24 Oct 2020 10:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603559100; cv=none;
        d=google.com; s=arc-20160816;
        b=ndcgOr3u0JGr7Ua+dNeYux2ljtYnAp6NZwKrqQ1Dn/JM7rKVQjh7knfzmRKRlmYnip
         REGVohOhdPq9+ww6fgTGbO4CoZ9oOrqlYKbq/oLt7q+iHRkOXN5nb1ezi+wo9MpJZ2O6
         06sujFMxT1J9fnZ2HC7OVE1zmg54+hGX7VXe+XFLwrdTrDH+4YkZNSr/PXfMWZ+vxJll
         lbl399p8RnojwI6Y58Z0u8XvYPna9yaAe1vMGcqGY/b5bQQO24AeM3+5DeBK0Gm/bNrt
         hbn2SOkelYnXpa9eHLDx8WVaaeQ9IqtglSPMA10k0ag1bhSNcaZ4faeSzJkg2DorrCR3
         wNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QcjhrFqjAYV+Q6plgNPayGWcmQofCNspcYhj6aIa8BM=;
        b=kOJwXRJxPW8vzIrOz9kI/+V3mnlytXaF8N6FA1YRjWvNWWe/mCnET9DCXDxP7QeV1s
         NyRiYwnQOqXXZhIsiLyqLDdUDoCgZiR8PgyNVr466ucq99C4StLNNFzXbfnMKbipoVaN
         g0Aw4f3vcg+ey3lMb37RBoojGwHSvsWKOjEoTkUIwD0yAO7yJr0xOBLpf0/LRFpeJ6G6
         25Ar4aYRRLGh9ORHCFu53A567F2JevS+NWLw/RBBNBYa1GGbpgASBK88yJ2z0cp2p49k
         lmESIG/iey5zQo6ARHr+Q5ECUfQswo1bXTdCSfzktv5fEuKKPkXzZega7XQUXKGXyMom
         +F5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZYIYVkMP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si2723259qtg.124.2020.10.24.10.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Oct 2020 10:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZYIYVkMP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kWMyS-0001KI-56
	for alex.bennee@linaro.org; Sat, 24 Oct 2020 13:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kWMvS-0007a8-QO; Sat, 24 Oct 2020 13:01:54 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kWMvR-0005id-2Z; Sat, 24 Oct 2020 13:01:54 -0400
Received: by mail-wm1-x342.google.com with SMTP id w23so4615539wmi.4;
 Sat, 24 Oct 2020 10:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcjhrFqjAYV+Q6plgNPayGWcmQofCNspcYhj6aIa8BM=;
 b=ZYIYVkMPDbrK5keb3cAlcb2nrf8PEhG+RWSc4N19AiROSwErtJ+cDpLSG5rxjUbgzQ
 zNHn7aaZ6gLvRzRAnkrGA6pj/Yo9ur4vpTuPBusFgifaR8hDgxegfwUa0i9qgfBepQLB
 y/zkE1qLkye4LNqYm4OTRgo+EppwAJfMUFz6ZyHT0Av38xkY/hjhaGHD1R8d08IVjgsQ
 4v/DeORVuZj8WCdBJ6aS+CBQRFcab8jOM9JRyj4cX0KdVSu7z3Cw9p0vqQtumYzjMPMm
 uGWLeDfwxa1ORns/55MG15eLfrNCviN08+Hsl/fEx2QZWEXA9taW8Ra8OYYVg+16X6G5
 2Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QcjhrFqjAYV+Q6plgNPayGWcmQofCNspcYhj6aIa8BM=;
 b=jTUY2K9TZUQoY/g7u8MLBcxT9/uaO+vY7Sm+PTVm6yoqVFVkcl4IWBtRwjvYkNtGAH
 aAuDfRCWHHfZEnX/gs26TlJd8o1oEIZ3r8rWrfaCwTqpY6HAMitIqc2IVwdLpl6NmE3L
 YCFMc+4x9v8lCCUHVU20Vz4UbVDklivyY662Pc+D9Y5qT0poYobda3OLoxh8SQIZfdav
 NR8NoXrgZv2/ZsdXjCtZYQIdYC0PyBJSWaf4bN+SqbX+zQtyz1E5dALU5GAAXtBp90rj
 xxUqfCt3+qi24liQU6WaWO0bBj9qEbi0AUksEYx2zOZ6Gbrg5qoL0M8KDb8TJpG2YZk2
 xs+g==
X-Gm-Message-State: AOAM531c4hwd3lrochEGXDE2nsecJ8V3WmrmlvfwA47Uabt0Xib1ninX
 V+tESq/llHhPNyrd3k4t7O2cRjfiL10=
X-Received: by 2002:a1c:9d54:: with SMTP id g81mr2961258wme.102.1603558909834; 
 Sat, 24 Oct 2020 10:01:49 -0700 (PDT)
Received: from localhost.localdomain (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id q10sm11731467wrp.83.2020.10.24.10.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2020 10:01:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/9] hw/arm/bcm2836: Only provide "enabled-cpus" property
 to multicore SoCs
Date: Sat, 24 Oct 2020 19:01:22 +0200
Message-Id: <20201024170127.3592182-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201024170127.3592182-1-f4bug@amsat.org>
References: <20201024170127.3592182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 97z0xEx9wT4r

It makes no sense to set enabled-cpus=0 on single core SoCs.

Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index c5d46a8e805..fcb2c9c3e73 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -34,6 +34,9 @@ typedef struct BCM283XClass {
 #define BCM283X_GET_CLASS(obj) \
     OBJECT_GET_CLASS(BCM283XClass, (obj), TYPE_BCM283X)
 
+static Property bcm2836_enabled_cores_property =
+    DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus, 0);
+
 static void bcm2836_init(Object *obj)
 {
     BCM283XState *s = BCM283X(obj);
@@ -44,6 +47,10 @@ static void bcm2836_init(Object *obj)
         object_initialize_child(obj, "cpu[*]", &s->cpu[n].core,
                                 bc->cpu_type);
     }
+    if (bc->core_count > 1) {
+        qdev_property_add_static(DEVICE(obj), &bcm2836_enabled_cores_property);
+        qdev_prop_set_uint32(DEVICE(obj), "enabled-cpus", bc->core_count);
+    }
 
     object_initialize_child(obj, "control", &s->control, TYPE_BCM2836_CONTROL);
 
@@ -130,12 +137,6 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static Property bcm2836_props[] = {
-    DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus,
-                       BCM283X_NCPUS),
-    DEFINE_PROP_END_OF_LIST()
-};
-
 static void bcm283x_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -155,7 +156,6 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0xf;
     dc->realize = bcm2836_realize;
-    device_class_set_props(dc, bcm2836_props);
 };
 
 #ifdef TARGET_AARCH64
@@ -170,7 +170,6 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
     bc->ctrl_base = 0x40000000;
     bc->clusterid = 0x0;
     dc->realize = bcm2836_realize;
-    device_class_set_props(dc, bcm2836_props);
 };
 #endif
 
-- 
2.26.2

