Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1153780ejb;
        Fri, 16 Feb 2024 03:09:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWoPLsE705oC+c94N3a91fuzsAjZNc7BOfa3QvfWPJ4F09Ock+w9K6C2DoHszfUfu1wRnO0NlOr58MgwfujFuNROj7sxNGi
X-Google-Smtp-Source: AGHT+IE0BuCfZ3o5fkmVNybjCpjMChwlc+icZzU2wtqE1qC19Izh4Ap7uc1Y/+5AsH3LlK1VpiWm
X-Received: by 2002:a05:6808:3209:b0:3c0:354b:1559 with SMTP id cb9-20020a056808320900b003c0354b1559mr6215309oib.53.1708081750432;
        Fri, 16 Feb 2024 03:09:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081750; cv=none;
        d=google.com; s=arc-20160816;
        b=y168VuANbfdAqm6o1vHvEpEth0IDxaBA4s/1SEH8vFM4ipukeS9WUvnw1We4NYHMn9
         AVqv+i9WorogN1fuprNqnuSijkHz7LV1UUqTLXrSv4mAvhGtdJdhFJ96s//LgJf6sfax
         2eErDVmQ3jl7tBF6GFux+gCJzSNWxSr1f6J+yoR+cPyoE748bmHs4PZzx5Fl3Bgs4cT6
         dwVVXIAJ5VXmYFuP2pj5Ti4wCRbunSuz+rSUBghshuLw/9gVbifL5hwFQMt0PYvbkA6A
         yz/0cHC2TAuHiMATZf5qZF0BtWO29zKir/Dsmv+hK3t3rPZyIWYe3ZzK/5NOySxbMGfk
         sToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1f6J2H1K9VOhN8YiJnj6i61rwEdmxKhJYj3MwXMwmEA=;
        fh=5Qnrw9e8qimJRC/V5In/+KXUd+bIKApPagk/4KwBjmQ=;
        b=qfqrO3L89Whe7ZXdhV87Ui7WfsViBOe2S8y3wgDf2blTQ6U4qv7ncD8hvcLv9UqW1t
         tCZw47Dh2ZNdsygrTspo1qDbuW2i7QJQBaICzZvHfPGBTAEHX6edVyl2liqoTD4qC6hG
         qQFTK0kUXpVlbo4U7wig2kHCeIAz+zXNIcJ7rdmOzA1qhPeisMmMtEfCyiVlh7wiMqJw
         jihwRo2dJDhFmxUAA70+A9ydNYGmCAP/d9kFwOqL/jVz01iEY2L4VHsocV2rAh62jglH
         5XgxdhWJcdXuO0DSyKBcQX8m0cNYRY3wRMBL5yKYx2G2su6vQCkBppxRZqow7/XDF/Bz
         pFXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aklU6aCR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16-20020ac85c10000000b0042c78302a0dsi459080qti.219.2024.02.16.03.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:09:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aklU6aCR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raw15-0007Cd-BA; Fri, 16 Feb 2024 06:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw13-00077l-WD
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:04:26 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw11-000134-Q0
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:04:25 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33adec41b55so979311f8f.0
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 03:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081462; x=1708686262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1f6J2H1K9VOhN8YiJnj6i61rwEdmxKhJYj3MwXMwmEA=;
 b=aklU6aCRgVVkS4G4qnszjyTTv5IvY/xbh8JwrkXQjUznalKUIvh7LMV/FuwUMv8qwT
 qPyUkgwuQ1RF9CgV5iEKCgtVjtHoPAghDMs3D4pegzbUspx9nnUV+1y/61YUCwFSelVr
 pYLGNo4POjhX1n7amesa143IGUtbKy3rPZOXozLnJ1wT54xkewGPjn4AGxart7IJ8GXg
 T2ErzLyQ8r9ZrxjweRz5e3yAncECGMHnbh60x6qWIIwnqXd0S7t0peR16jF5KOQZmffW
 IXfOV8bFpTjr50/2VFgVdUPx5Zwms1SuF6/KSqE9P0zCo4NisOwo9Vo66QVKuDon7uCd
 QTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081462; x=1708686262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1f6J2H1K9VOhN8YiJnj6i61rwEdmxKhJYj3MwXMwmEA=;
 b=rhEJ+t40W4Oyj6pA9F6R6j3iwy8nAIJcZuGCSWnkwgd7WPEVspqPz8F8AEnmKw4rGK
 3agrchnaxQZjRL4GmmMNwNqmGR2qiSNLoKdKjCqOmb1ovz/p2UdZv9J3oWVbiE6dfZvk
 a94SlK9QHvIFaFUxnO4qiGFgrUhi/ZcaHSSd++ecrbJHTUcjdQLacCIDucgb6B6rFjHl
 3XZTrjtc60kJFb0Ud/b/TY7P59/Z5wRiqclf676ikrBQkVAqK0RbKcYBhlyImop/H6T0
 02KSlpZuk18avFp1p+Fq7T7Ul6WbGDvJQUkfaZa3fAEbOpZv4YD6YPYCsCFYjGAXG+16
 pglQ==
X-Gm-Message-State: AOJu0YwyXUdthl8Oq61dPrr/4BLEZFJ1PtMZjaOugtSt1dFRmHjW1YEm
 fGD9F+mQjmlUU1RSkClF6LuajpZhmWbJtto/Ov3CCw+6Rzj9OKI9cnmW4gfg9NI=
X-Received: by 2002:a05:6000:1e8f:b0:33d:2120:1011 with SMTP id
 dd15-20020a0560001e8f00b0033d21201011mr550180wrb.54.1708081462196; 
 Fri, 16 Feb 2024 03:04:22 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 az1-20020adfe181000000b0033d1f992ae3sm1275770wrb.112.2024.02.16.03.04.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:04:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 10/21] hw/usb: Inline usb_new()
Date: Fri, 16 Feb 2024 12:03:01 +0100
Message-ID: <20240216110313.17039-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b1uHKLs315oE

Inline the 2 uses of usb_new().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/usb.h    | 1 -
 hw/usb/bus.c        | 9 ++-------
 hw/usb/dev-serial.c | 2 +-
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index 32c23a5ca2..2d820685cc 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -500,7 +500,6 @@ void usb_bus_release(USBBus *bus);
 USBBus *usb_bus_find(int busnr);
 void usb_legacy_register(const char *typename, const char *usbdevice_name,
                          USBDevice *(*usbdevice_init)(void));
-USBDevice *usb_new(const char *name);
 bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp);
 USBDevice *usb_create_simple(USBBus *bus, const char *name);
 USBDevice *usbdevice_create(const char *cmdline);
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 148224f06a..a599e2552b 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -329,11 +329,6 @@ void usb_legacy_register(const char *typename, const char *usbdevice_name,
     }
 }
 
-USBDevice *usb_new(const char *name)
-{
-    return USB_DEVICE(qdev_new(name));
-}
-
 bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp)
 {
     return qdev_realize_and_unref(&dev->qdev, &bus->qbus, errp);
@@ -341,7 +336,7 @@ bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp)
 
 USBDevice *usb_create_simple(USBBus *bus, const char *name)
 {
-    USBDevice *dev = usb_new(name);
+    USBDevice *dev = USB_DEVICE(qdev_new(name));
 
     usb_realize_and_unref(dev, bus, &error_abort);
     return dev;
@@ -693,7 +688,7 @@ USBDevice *usbdevice_create(const char *driver)
         return NULL;
     }
 
-    dev = f->usbdevice_init ? f->usbdevice_init() : usb_new(f->name);
+    dev = f->usbdevice_init ? f->usbdevice_init() : USB_DEVICE(qdev_new(f->name));
     if (!dev) {
         error_report("Failed to create USB device '%s'", f->name);
         return NULL;
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 63047d79cf..6e79c46d53 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -624,7 +624,7 @@ static USBDevice *usb_braille_init(void)
         return NULL;
     }
 
-    dev = usb_new("usb-braille");
+    dev = USB_DEVICE(qdev_new("usb-braille"));
     qdev_prop_set_chr(&dev->qdev, "chardev", cdrv);
     return dev;
 }
-- 
2.41.0

