Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp307683njc;
        Sat, 8 Mar 2025 13:39:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUgdPswmhnvM7FthaRIKmqjLegSbGDJIrRjciUMUAoUKb0p4W1bAL16pV6VkDmpego1495fsXo4ZpeQCg==@linaro.org
X-Google-Smtp-Source: AGHT+IGwqoBFqQGhNziaJ8wIQGGH6t1LALMbl4tVWRQy/aqS8LkHm0on8lU5LJADepDqAHjh6bmI
X-Received: by 2002:a05:620a:8908:b0:7c3:ceeb:7d4f with SMTP id af79cd13be357-7c4e6199c12mr1284955785a.51.1741469989086;
        Sat, 08 Mar 2025 13:39:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741469989; cv=none;
        d=google.com; s=arc-20240605;
        b=ZbbtaQovxtO9d6PNgN2bAwGlhz1zuQBIw5KGWcnqcjvGMU3AMYBDZ6DQYYJzn5S9qg
         LAyhcyn6lHaFBwktfmLlGlnp201XzxATbF87KJrgLr8MoQJaz3im5ZRWV5GYUFg4lwhx
         Kp0TCNZxz8AKMdJbcQnYqDlZ5dfD4UgZJBZxGaY+iAglwH7KY+dOtjYW6mdUxm0sm901
         4MleKg8fYEzhsfHHwyDc/xx9cqtOg1zCLEP4c0SW0/ACuNc9fN/QqclK1SD31+nsA6dt
         5IwYV5ZHvR/OsVRCAOgoLFBBsknyTjSOh2x+byxn0jLR41+mi78W1EHSsaWtNJ+Cs0XH
         RdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M76BvQDiEF2f2PItQcUpRY11DWy0Vj4F0agjAvaV/Ks=;
        fh=HAVcgEEjOODY1o353hC9A9lHcvQWHUZN0wdBbOjmyDo=;
        b=ToyAUnaqAZAWD4y4WleFrB/ercelYQay8zvf08rFe6bP2Vnc7LKbv43BUEivAInuOj
         pWjMRh9M5hWWOjVOldsaiknP/zsepkh5p978FksKs2nN7oakXX6CB4HJe1uIPP4Hdc9B
         7RbdPy1Q0iKZGm24HZdAnYZFkcL/BQJBUCMCW12Q8GJ7MZbclYCmmW9MkjZ9UKwPfJJ7
         QI6kl+6+IsLYob3z/tbZduS8ASKa8l9TA0uPKcdxPjJMTy50uRpXFrVVbNDGLTc89+WP
         5EJEwePHfKDq6RNZQ8iAyORbhiFjEpM15f5BkQKRf1ZltcBxHxYEhS/DDp0ZDg1+Gifi
         R7NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ci72cBwx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e54ff4f4si605282885a.224.2025.03.08.13.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 13:39:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ci72cBwx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tr1t5-00006r-Bc; Sat, 08 Mar 2025 16:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1rY-0005hd-0W
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:44 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1rV-0003yr-As
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:39 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43bcb1a9890so25214315e9.0
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 13:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741469856; x=1742074656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M76BvQDiEF2f2PItQcUpRY11DWy0Vj4F0agjAvaV/Ks=;
 b=Ci72cBwx9CrTNogSl7s0Ch6ssFrfRmez7YqnXyaSNXgxCraWrVJOUn8GQ9PMBBYfTw
 wJ2/M9Un8rcR9DxgW492FgNVHmQsSlhruXC7lAeNfmbbJujS23WEQ99wThZ5MTMnnoNL
 GhoPG4FkzdEPv41PSPgGeANkLVoQptI2VTMuNSGo2R2qHoUzkQ9rtxzAbS3xDrtgPMvW
 7i2AJhUa5wmUDNl5IdaTyl5YpNnXuFl+BbMjeNSNyBBtxJWkX09L4OvHTfH9hYd0zyYs
 LYlXIlnZyPlZ3jZeHfzdG1DXBmZLFTYXatK/k7WHqt8ANB/ThijwT/r2VA7Fx64t7jve
 Yc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741469856; x=1742074656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M76BvQDiEF2f2PItQcUpRY11DWy0Vj4F0agjAvaV/Ks=;
 b=lMVrF86fNowOm0QJFp92DzSqyyhlC7KIOK7czCf710s7fKegjPqwy6CuNFy2gaVE4P
 gZTsMJIn0XF1QfVtfGDFuneH4oq1dTcOHG29SKb/fux8s7pUDEmgjkfoHq4BFQwmLFMT
 0fFXsWDrb4lEoopMispLCwtdTele4IksMYT+e2ESbzOpWElr0h9ThQNuDKb/K9oenIOw
 l0rirglO+ywyFf05cWSkmAs9sXOBVbwDdwbz/loUDQu99KYMBUWPdICdeNczuMc5PlVN
 0iEsZY4sEjDueTEAFtxtZbNUnIkLL+klgeozk35knowwAeX6vm1yQ++V+ic6S5QBvdet
 KxDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVbFVYYs0RK7MVoUhAyuilnY5Ow+TeugJb8Ji356Zoipnm+Y+hmWD7jTqQp6VqkfjEfqPmH1qohQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz/rK+9IYB80hDYEygEJOKcTBuv3Xi0pylaU489vw7zWCS+Lkf0
 kRf0ozWr2KY+D40ES5u86gWcUwwDMqgMKue+0oXQ4q+S4lxlSG6AgJaatqORiss=
X-Gm-Gg: ASbGncsaFAwc2bpySkcGoxDAuEhQTZiQPKeB8BSgqMOHxdpGRRwin4gSPSd55+KpbZI
 1zeI6/5bCXFwnqZi406mlUq11sqy+3YXLAtXyecRXsDI7wJrNM7gnaX+Qqv5Jhab1lxCOVroYBp
 dpuYPUJ8Q7w2hWZbNP8dKdGkrbV3zATiDxPKJi6JclB4OVqz8uTtOFYmp9Y/q1SifZoXhdvbqL0
 Y6e55rzfTFjqYJpiAD7NX9LwJNUNcbBZ6ruuePuFz0M0xoU2t3YM/xb2M/jfg3ykbNJsiyB9kIy
 1tonaNZHe7ZB3mC4IsbtRBwfoxhzWUzszBIuX1/smpsKDu3uEWJvB4YiFOH+EHfvQT8ddskYhQ5
 DoQns7sqavyCwdoe4C7g=
X-Received: by 2002:a5d:64ab:0:b0:390:f9d0:5e7 with SMTP id
 ffacd0b85a97d-3913af025b1mr2945488f8f.13.1741469855895; 
 Sat, 08 Mar 2025 13:37:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bee262esm9903118f8f.0.2025.03.08.13.37.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 13:37:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 10/14] hw/sd/sdhci: Convert SDHCIState::endianness to
 EndianMode
Date: Sat,  8 Mar 2025 22:36:36 +0100
Message-ID: <20250308213640.13138-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308213640.13138-1-philmd@linaro.org>
References: <20250308213640.13138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: n0hPcYZKTIGU

EndianMode enum is preferred over DEVICE_BIG/LITTLE_ENDIAN
values because it is a QAPI type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci-internal.h | 3 ++-
 include/hw/sd/sdhci.h  | 3 ++-
 hw/ppc/e500.c          | 2 +-
 hw/sd/sdhci-pci.c      | 2 +-
 hw/sd/sdhci.c          | 7 ++++++-
 5 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 9072b06bdde..c459279f3f3 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -24,6 +24,7 @@
 #ifndef SDHCI_INTERNAL_H
 #define SDHCI_INTERNAL_H
 
+#include "hw/qdev-properties-system.h"
 #include "hw/registerfields.h"
 
 /* R/W SDMA System Address register 0x0 */
@@ -308,7 +309,7 @@ extern const VMStateDescription sdhci_vmstate;
 #define SDHC_CAPAB_REG_DEFAULT 0x057834b4
 
 #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
-    DEFINE_PROP_UINT8("endianness", _state, endianness, DEVICE_LITTLE_ENDIAN), \
+    DEFINE_PROP_ENDIAN("endianness", _state, endianness, ENDIAN_MODE_LITTLE), \
     DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
     DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
     \
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 60a0442c805..a91cda16cbe 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -25,6 +25,7 @@
 #ifndef SDHCI_H
 #define SDHCI_H
 
+#include "qapi/qapi-types-common.h"
 #include "hw/pci/pci_device.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
@@ -95,7 +96,7 @@ struct SDHCIState {
 
     /* Configurable properties */
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
-    uint8_t endianness;
+    EndianMode endianness;
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
     /*
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index fe8b9f79621..e85e000f054 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1042,7 +1042,7 @@ void ppce500_init(MachineState *machine)
          */
         dev = qdev_new(TYPE_SYSBUS_SDHCI);
         qdev_prop_set_uint8(dev, "sd-spec-version", 2);
-        qdev_prop_set_uint8(dev, "endianness", DEVICE_BIG_ENDIAN);
+        qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_BIG);
         s = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(s, &error_fatal);
         sysbus_connect_irq(s, 0, qdev_get_gpio_in(mpicdev, MPC85XX_ESDHC_IRQ));
diff --git a/hw/sd/sdhci-pci.c b/hw/sd/sdhci-pci.c
index 5f82178a76f..49c4f0478b4 100644
--- a/hw/sd/sdhci-pci.c
+++ b/hw/sd/sdhci-pci.c
@@ -32,7 +32,7 @@ static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
     SDHCIState *s = PCI_SDHCI(dev);
 
     sdhci_initfn(s);
-    qdev_prop_set_uint8(DEVICE(dev), "endianness", DEVICE_LITTLE_ENDIAN);
+    qdev_prop_set_enum(DEVICE(dev), "endianness", ENDIAN_MODE_LITTLE);
     sdhci_common_realize(s, errp);
     if (*errp) {
         return;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 23af3958a1d..f2bb612c665 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1437,7 +1437,12 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     const char *class_name = object_get_typename(OBJECT(s));
     unsigned ops_index;
 
-    ops_index = s->endianness == DEVICE_BIG_ENDIAN ? 1 : 0;
+    if (s->endianness == ENDIAN_MODE_UNSPECIFIED) {
+        error_setg(errp, "%s property 'endianness'"
+                         " must be set to 'big' or 'little'", class_name);
+        return;
+    }
+    ops_index = s->endianness == ENDIAN_MODE_BIG ? 1 : 0;
 
     s->io_ops = sc->io_ops ?: &sdhci_mmio_ops[ops_index];
     if (s->io_ops->endianness != sdhci_mmio_ops[ops_index].endianness) {
-- 
2.47.1

