Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2112081ejc;
        Mon, 9 Jan 2023 01:29:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu1ty0qDjVz9aa7xyOgpcdTqOsUTWVCK6ktFZOAVux/D1S4KpWoI1o4SgsEe95j48jsvEI0
X-Received: by 2002:a0c:d602:0:b0:52d:937c:cd7b with SMTP id c2-20020a0cd602000000b0052d937ccd7bmr88423520qvj.21.1673256542557;
        Mon, 09 Jan 2023 01:29:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673256542; cv=none;
        d=google.com; s=arc-20160816;
        b=pqvQQHbEx5ptsZcBrmEu4TVOEJExvG2JsZkdOVCJ0FvBn/2HptbEBmAV0TJwqodKGD
         fO4CdiOgkBatkbcZwgvcwqkplszc7YekS9QL0Dezd5ZBVkwLX+LWvCip8R+W1UxHG11H
         W5UZzMP9lrGBNp4ZAdB24W43jioP+3rDUCsZG7/z4r0al3M20lZcczt8rxjr8SafcFrv
         YggI4UXEVc/EWbXcc2NZECBtpeAbdsLSCXe2aXJKKAS5nic2BEwVRAezdsa/qWOQIkzw
         nk1VJoKxitdb2eowmueyioQ+YKOfT7IwaIC7p1pqn7NVnwT8fdSjKJpxnjAk5UJazMKp
         5PkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=thih3YlnrvTRPUHmxOTOW7cdH3C9pCnefCYP23Vc8Uc=;
        b=lqKMchEYIOczM+vmqONRIMoLpo8Yw3kWB61D2xUk9rr/TX1Ji7BchazywL8Usb2r8k
         2qZiAlSj0icA1smceY3aUVp3Yy1Vr12SwdkM1OsEGmfxSv/tIBMLiHRsTVBzPbpeiCVa
         A+fuPXUvwTOR47U941HAoksHPy8xaEAHH/21HXvrpa2NV9pChT/4svcEB4u8p8Fyg8uE
         ZYrEGFv6cnFNm7JW3VYnM/9Yw2dL2z+B6ayGCn6uxzvJ+NDtpktKC419sRuH3eL+1sSp
         8FvO2JlFbLzqTlzrXmaPvOd+GVoKKEm8mucuRlcLviFXHfWu1u1kY4CEXkSfwU5pC852
         y4Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RMEr4rgO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv2-20020a056214262200b004bbdce26669si4276989qvb.144.2023.01.09.01.29.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:29:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RMEr4rgO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQP-0003vE-0e; Mon, 09 Jan 2023 04:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQL-0003uL-ER
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQJ-0005RX-J4
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:26:32 -0500
Received: by mail-wm1-x333.google.com with SMTP id l26so5778077wme.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=thih3YlnrvTRPUHmxOTOW7cdH3C9pCnefCYP23Vc8Uc=;
 b=RMEr4rgOWLh7fYPLKzNnTIOx9LwcKhfpBIel65eStKXZeXz7TIOhVLwCHNkel0WYOS
 lOGrUznS/LY8QTrGhCuootpuC+JlwK20nm8DQHdgxLgYXuqNfam2D+tFTRAeZWRou44L
 YXA8iVdcQHv/pJi0ic77c1TX7wOz5Vkd3wf3p7gInjDSHzkQ0BI156FOIGRY5vHdvhak
 94iRLUh8ebbpNCdvbMv9ygFuDmPgoNnGbKXq64Hfz7NJ4OMhDHWvsFow22t9gMrRBZAd
 AjuJFnkHD72/5vIJyn4owFfHHw0lU5K0QxAjQ/xoddoCsOqENaIxzaDDq4R44D/h7AgX
 GMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=thih3YlnrvTRPUHmxOTOW7cdH3C9pCnefCYP23Vc8Uc=;
 b=03ex+ss1CxunxWFi7dNPRsOsvzSmUVnPjisGt09ToDyflvwrVeOSpH0NVOXEjGmfMx
 MVq5ONYFtlWxv7n5doZfq7K5sW/0L8682/37ygMAnOiBN6J8eR+r12xExV5XyiPjzUVo
 qxQdMZQXPNVXzcefz2Y1crTTjo4dAZri/dFIO+dVOCfLfdiQKue3ZEvjIk0rbGWt31qu
 /h7GBYeC3Yvn4AJxQd1uM0BzFLbpoX4rE1npgmypFGK0wOtiN4aVe/cSfyPhfnUe4nyr
 wIqMTicztlFvQGgPZk4jn3bGHfD2mopNWhLAe1smSAb9iac9dwXuQTY56mMkCFSaJN6L
 urhg==
X-Gm-Message-State: AFqh2kpxnM6/qUM9X+Lu6HZN9CoaeiN0iVmIFTk+5uo1SPHZkFApMt1/
 Dd991Fr8juafB6i0peUI1nnYRFCjNmIuZt3J
X-Received: by 2002:a05:600c:48a1:b0:3d1:f270:a81e with SMTP id
 j33-20020a05600c48a100b003d1f270a81emr45866631wmp.17.1673256389785; 
 Mon, 09 Jan 2023 01:26:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c1d8700b003d973d4fb28sm15573644wms.4.2023.01.09.01.26.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/9] qdev: Add qdev_create_simple() helper
Date: Mon,  9 Jan 2023 10:26:10 +0100
Message-Id: <20230109092617.80224-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Hc6oqlE7DUOx

Add a helper to easily create a qdev with no (or default) property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev.c         |  9 +++++++++
 include/hw/qdev-core.h | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d759c4602c..4afed2a24c 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -174,6 +174,15 @@ DeviceState *qdev_try_new(const char *name)
     return DEVICE(object_new(name));
 }
 
+DeviceState *qdev_create_simple(const char *name, Error **errp)
+{
+    DeviceState *dev = qdev_new(name);
+
+    qdev_realize_and_unref(dev, NULL, errp);
+
+    return dev;
+}
+
 static QTAILQ_HEAD(, DeviceListener) device_listeners
     = QTAILQ_HEAD_INITIALIZER(device_listeners);
 
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 35fddb19a6..ca6b2b8458 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -397,6 +397,17 @@ bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
  * the life of the simulation and should not be unrealized and freed.
  */
 void qdev_unrealize(DeviceState *dev);
+
+/**
+ * Create and realize a device on the heap.
+ * @name: device type to create (we assert() that this type exists)
+ * @errp: pointer to error object
+ *
+ * Create the device state structure, initialize it, and drop the
+ * reference to it (the device is realized).
+ */
+DeviceState *qdev_create_simple(const char *name, Error **errp);
+
 void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
                                  int required_for_version);
 HotplugHandler *qdev_get_bus_hotplug_handler(DeviceState *dev);
-- 
2.38.1

