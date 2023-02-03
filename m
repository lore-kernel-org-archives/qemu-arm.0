Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1462688ejb;
        Fri, 3 Feb 2023 06:56:47 -0800 (PST)
X-Google-Smtp-Source: AK7set/vfyyzRMj+9vJyj3z7q3ethFryW81b+nwmpBdqzdPC2lP1qPb2nk7lVT0uAKjLk+6hO+EB
X-Received: by 2002:a05:622a:588:b0:3b8:2edf:33a1 with SMTP id c8-20020a05622a058800b003b82edf33a1mr20150938qtb.6.1675436206821;
        Fri, 03 Feb 2023 06:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675436206; cv=none;
        d=google.com; s=arc-20160816;
        b=iA+QoebmSi50l8FLjzKpnsKgBdYequPqeTUl8mZimhhxfVLZaFK5e27hTGCxnWdb8Q
         k2wpe55+EnL6ORXNJTlXKu1nHqVn7Hgs5KmplsjqifheJeJJgPtgMLV1iiA/w32b4KG7
         H7sxTIsT9YanfUrgFKitx8AHfmlgBCsLqZesUsgl1+gVSGR9EC5WVozX+MiU2Auz8Oei
         OIqevhWDH6sthv/BF050tLWoSyKnoM1X6M8Uwlwr/jkRHOD3n72I5wIfFAO4aPo73kcH
         XTgfDhx4hv1rUIBIyt4A71B+K+sPMIUhpZXXWevnku4YMbSfgF+1FIGLMAqLGfEOF9km
         3Puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VmSnSD01/Tl/o5f4h6yNnxoegZSIU5/24i6LDQ+aBqo=;
        b=QH/hocggYo3QNDk+f4SlIv1/OuEArqiLWDV2PWvylkS1JtSlS9+z0ZU8zyBjJNDcdH
         RYsKLv4c5TZUCE0UNKov01WhdOt+g12khpT3xvIT6hdvB3saNnxkV1UkJ4waVoWyz281
         OXZR58sKVYcS2/I6SM32ZAj9fQ/FCukP/YoQuOWGPmS54zUhCpoN3DUuQEYhPzN6bqtk
         xd85Eqf/qjjq/y6Cpg2bbgZWQ9aTapO+jp7ZIO5l8/qrPq7oT29458nS9uNmz/wSghbm
         F6Ujrs63O27F4i68lZHRXCatnSMN1Nh2gSC5erK849AjEuY4dPahvHUn2xg/J/z7Kn5n
         9YYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UuQ+7F8J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020a05622a15d100b003b8681d0a1dsi2104675qty.404.2023.02.03.06.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 06:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UuQ+7F8J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxTl-0001pt-AJ; Fri, 03 Feb 2023 09:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTj-0001ow-QX
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:55:51 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTi-0005sq-77
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:55:51 -0500
Received: by mail-wm1-x32e.google.com with SMTP id q8so4058175wmo.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VmSnSD01/Tl/o5f4h6yNnxoegZSIU5/24i6LDQ+aBqo=;
 b=UuQ+7F8JTJaNCBvK0caVlsRKIND5qixPlQemm3ezQnSLNOpw7t/kIWpRuXEj8WMylX
 V7U9BE8cvioEF9ts4AMNpt4WKvrejRAtdYNTIVdbMxkSCyX4e6NKxmeoBbTiPjI8nmky
 R8dOsTs4eQo4EWFoadIq0IwOn7122cgHPvUqEZ5TGAm8vLUit9LyutoHwwm44D79uHfr
 lXmWeSgioW8kiZ4JnELMHXN5jIfbd9JtimYbkf524wr0zPE/+LIBW+ufNzJ+QVhV+8Yt
 Hj/oQGQ59trO3czVUbc1PCE/l6A7AkROapbtKOCm4NMHx4s/kYmiUEMGGu+Y0Bv4LizY
 SKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VmSnSD01/Tl/o5f4h6yNnxoegZSIU5/24i6LDQ+aBqo=;
 b=AGJ7kT5JTIxl+FOl2qPZwgvI2Z0ytwsUgh6H/+EpfqLFLqe6+AkSfdHuPCHWeCTvOf
 HBSf2av/umEn2SAOGVMiT4DsrbSJ07KhA2O2ug14FxZBZ/IghUFs/tUtD9+6Qjq94MSC
 OsPwlYdicY7dNiJuUxq8PZlwaZWgi9OikBWWtOmL4KWxlTTZrWjLN/ym/DXV3L3Ybw/h
 k/6hLrDI50HQ4pLLtUHRthpnkiDxadoDgNKqm/4SjshvZAdFtNCwwYpOUOi8s1f4NEMq
 ua/C5dM3GKenZiz4F0p61l9ClznAVGkpZ3dggmZ+Vgby4nXe79DY49+WSxdjs2zr0Shp
 tbIQ==
X-Gm-Message-State: AO0yUKVzJDJIJZC3bX+7qYjmZVKENv6pHPy1axUljSSbc8yo0iXenCfC
 LuE1pAr9YqLTGSHyTYpZy9qsjNMo6U8z5MYk
X-Received: by 2002:a05:600c:3d9a:b0:3df:e8c3:c612 with SMTP id
 bi26-20020a05600c3d9a00b003dfe8c3c612mr2213485wmb.7.1675436148715; 
 Fri, 03 Feb 2023 06:55:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b003dc1a525f22sm3048705wmq.25.2023.02.03.06.55.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:55:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 02/15] hw/qdev: Introduce qdev_unrealize_and_unref()
Date: Fri,  3 Feb 2023 15:55:23 +0100
Message-Id: <20230203145536.17585-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: WZsuSnG0q2sp

Inspired-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev.c         |  9 +++++++++
 include/hw/qdev-core.h | 20 ++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d759c4602c..b9ef793d51 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -306,6 +306,15 @@ void qdev_unrealize(DeviceState *dev)
     object_property_set_bool(OBJECT(dev), "realized", false, &error_abort);
 }
 
+bool qdev_unrealize_and_unref(DeviceState *dev, Error **errp)
+{
+    bool ret;
+
+    ret = object_property_set_bool(OBJECT(dev), "realized", false, errp);
+    object_unref(OBJECT(dev));
+    return ret;
+}
+
 static int qdev_assert_realized_properly_cb(Object *obj, void *opaque)
 {
     DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index fd11e9a82f..20b9220023 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -374,6 +374,8 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp);
  * for the only reference to the child device to be held by the parent
  * via the child<> property, and so the reference-count-drop done here
  * would be incorrect. For that use case you want qdev_realize().
+ *
+ * Returns %true on success or %false if an error occured.
  */
 bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
 
@@ -397,6 +399,24 @@ bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
  * the life of the simulation and should not be unrealized and freed.
  */
 void qdev_unrealize(DeviceState *dev);
+
+/**
+ * qdev_unrealize_and_unref: Unrealize a device and drop a reference
+ * @dev: device to unrealize
+ * @errp: pointer to error object
+ *
+ * Unrealize @dev and drop a reference.
+ * This is like qdev_unrealize(), except the caller must hold a
+ * (private) reference, which is dropped on return regardless of
+ * success or failure.
+ *
+ * Warning: most devices in QEMU do not expect to be unrealized.  Only
+ * devices which are hot-unpluggable should be unrealized (as part of
+ * the unplugging process); all other devices are expected to last for
+ * the life of the simulation and should not be unrealized and freed.
+ */
+bool qdev_unrealize_and_unref(DeviceState *dev, Error **errp);
+
 void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
                                  int required_for_version);
 HotplugHandler *qdev_get_bus_hotplug_handler(DeviceState *dev);
-- 
2.38.1

