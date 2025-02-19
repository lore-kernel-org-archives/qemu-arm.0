Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1553691njb;
        Wed, 19 Feb 2025 10:48:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWLYHKobkEY5gR7dT2c8jaJE7/FVqXwTWM/4llRIogGshLl7HEMMg6lOEFFJUbcuBSTs1H0KK6rC7iaFw==@linaro.org
X-Google-Smtp-Source: AGHT+IF24i3wkV1yyMRmI/9VLWpHZQ1h6h4MwT81iNd1JysWNEzR3JdPiZ4mN38byvhsBLBo1SCK
X-Received: by 2002:ac8:5d8e:0:b0:471:9820:f66c with SMTP id d75a77b69052e-47208260abdmr54533511cf.7.1739990890657;
        Wed, 19 Feb 2025 10:48:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739990890; cv=none;
        d=google.com; s=arc-20240605;
        b=hO1o3qNBinh0kuOwhCA22CephBweEiLifXbEBKiDRJxJ8cMPsOD5FmELfJ/+NePJJ2
         qTTNoopJA2UVtzp6R+ShNtp+eqatV2+egw9ykG4k3MFg27Ov4LTEhuJT7CD8W/4w/a2Y
         P65aU0gk++/1psv8+CjoTN+jal9zt4XdTLalKuZHYNLZAARa/ke52hhWm6gnkOgcreSB
         lP3ijzOF5SOq7XwuZHDTC674SVEeayjSUI7gKICDzE3fo65UwxaO9eLMMXG/KhHH5w9Y
         6ed/2zody9Sg1F2St0IezWP3cCU6yVzTAUr7IKut3Jx46E/a/3lnaX6jYmIt+aAJatnz
         q21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=z8xVoS50d7e+ciafSSflJFcc3kwT94nPrc7QEj/k7Ig=;
        fh=biy2AaKCbwpAZ/Lk7Qechxb9C3WSrIx4CYh+Y6obQL0=;
        b=NVtDZZsIY6pQ2eus64Lqbr/nhxwfIRkuqCL13zOz70WF8eMKFJoGNuAm+JdQaq2x9c
         PNvAWVGtuXwshM4eBDOlhPgfRSopNcFFDTMjsE61lW49TEvN6T1kBlyz8rgvJzpu0o7d
         RBouUncHTqqFFhX51875ca/Z9qWFerF9TTaOmDdlGJNeSMItC/j5/sdFiKfj7XDJ/I60
         jkQXDeTCp3Tk4+wfJnXzeX8652JI1BGqHXWfRoqXZXxurflueaMXoUa72JlPqC9vxCIP
         o4P7mIe+QvAnEK/8KRh8WPhaIeaI9/gGB3MfNQTYqI0HylbnCE5gBA8srUwdAav1SoTF
         P3vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qj27K2Mo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-472021afd73si36629331cf.274.2025.02.19.10.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 10:48:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qj27K2Mo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkp5k-000300-RZ; Wed, 19 Feb 2025 13:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3BCe2ZwgKCG8jhUNbgfUTbbTYR.PbZdRZh-NeZabaTah.beT@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5d-0002wY-GC
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:35 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3BCe2ZwgKCG8jhUNbgfUTbbTYR.PbZdRZh-NeZabaTah.beT@flex--wuhaotsh.bounces.google.com>)
 id 1tkp5a-0004hO-SY
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 13:46:32 -0500
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fbfa786a1aso312021a91.3
 for <qemu-arm@nongnu.org>; Wed, 19 Feb 2025 10:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1739990789; x=1740595589; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=z8xVoS50d7e+ciafSSflJFcc3kwT94nPrc7QEj/k7Ig=;
 b=qj27K2MouanphIYUuHBeYNF2VZf/wpKDKEE/DsgsKXzelhnmG+LiG6bldEi5Q/2Ybd
 NLlQhR0yg/uVh1dqrdKp7GObV9hYsZbcIFfrHHlAw86RhXEbpgTkVmLZfE4dYQfUC7Hd
 LIVExTpwwGjh5L2z0N0dU+QoXXBz599h5rpixaEki8DpqgRRcT6PlaL7Fg1UK/azBnkS
 3L/puJSGSTqr+gJ8xYEKqV1h/3k/93LWDi5i1NUa6M/EuQ7sTXz+Nc2pe52APD/7yBG4
 iomgNdiXE6PvPwEDQf3uYce7NJowm9ZtvRPUcWN67szcLqaY/CzASQ+7C61FQmzuyL4t
 4uSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739990789; x=1740595589;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8xVoS50d7e+ciafSSflJFcc3kwT94nPrc7QEj/k7Ig=;
 b=MrgPxwQBKW6LKHjHBhSAnDHJfm9GmJVoS7ok9kZvua/1J9cKQYrMfTespnSdgIjRXm
 CdseTRbFZR/LGxVJt3oBay5YyeIVy9OPb+uvINpVcMDB4ppEmWb++zS0oZT3L2xgUau7
 fcbfdoVGuJWF5IJvrJXXb3OF0Cq4rpgdDF0XzLJu/o1xSfZ/2RIHWENuYAPG1VtwMPxg
 NYEsBbSby/NjAuJ9ACMKrucdsPTuHD7GEBULEt2eJeK5krIXTcIK2I296n8aJwbCkQhz
 d5oegJXWc/oB4i+xpJUTOSPpWhDrdHkyXc2k1KRQ98FLx54BGuxns3luyXWHfKunszVT
 pWEA==
X-Gm-Message-State: AOJu0YxDp8QkprWT391RDj3yyK5Lwb9rBblkphQxtO+2vzJ2xzzps3zM
 xf9+Ex12jDUUFtso4h9qUcm15k1a/eu2LieVByiF4UOMtSoxbCW+NRHaxkptWUjtD0LlS7XicB2
 RehtQzGbITg==
X-Received: from pjbsg13.prod.google.com ([2002:a17:90b:520d:b0:2fa:1b0c:4150])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c50:b0:2f5:88bb:12f with SMTP id
 98e67ed59e1d1-2fc40f22a40mr26221701a91.21.1739990788827; 
 Wed, 19 Feb 2025 10:46:28 -0800 (PST)
Date: Wed, 19 Feb 2025 10:45:54 -0800
In-Reply-To: <20250219184609.1839281-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20250219184609.1839281-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250219184609.1839281-4-wuhaotsh@google.com>
Subject: [PATCH v5 03/17] hw/ssi: Make flash size a property in NPCM7XX FIU
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 chli30@nuvoton.corp-partner.google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3BCe2ZwgKCG8jhUNbgfUTbbTYR.PbZdRZh-NeZabaTah.beT@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: Zp8QRqbnFd4l

This allows different FIUs to have different flash sizes, useful
in NPCM8XX which has multiple different sized FIU modules.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@linaro.org>
---
 hw/arm/npcm7xx.c             |  6 ++++++
 hw/ssi/npcm7xx_fiu.c         | 16 ++++++++++++++--
 include/hw/ssi/npcm7xx_fiu.h |  1 +
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 386b2c35e9..2d6e08b72b 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -292,17 +292,21 @@ static const struct {
     hwaddr regs_addr;
     int cs_count;
     const hwaddr *flash_addr;
+    size_t flash_size;
 } npcm7xx_fiu[] = {
     {
         .name = "fiu0",
         .regs_addr = 0xfb000000,
         .cs_count = ARRAY_SIZE(npcm7xx_fiu0_flash_addr),
         .flash_addr = npcm7xx_fiu0_flash_addr,
+        .flash_size = 128 * MiB,
+
     }, {
         .name = "fiu3",
         .regs_addr = 0xc0000000,
         .cs_count = ARRAY_SIZE(npcm7xx_fiu3_flash_addr),
         .flash_addr = npcm7xx_fiu3_flash_addr,
+        .flash_size = 128 * MiB,
     },
 };
 
@@ -735,6 +739,8 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
 
         object_property_set_int(OBJECT(sbd), "cs-count",
                                 npcm7xx_fiu[i].cs_count, &error_abort);
+        object_property_set_int(OBJECT(sbd), "flash-size",
+                                npcm7xx_fiu[i].flash_size, &error_abort);
         sysbus_realize(sbd, &error_abort);
 
         sysbus_mmio_map(sbd, 0, npcm7xx_fiu[i].regs_addr);
diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
index 21fc489038..8df4bec3f1 100644
--- a/hw/ssi/npcm7xx_fiu.c
+++ b/hw/ssi/npcm7xx_fiu.c
@@ -29,7 +29,7 @@
 #include "trace.h"
 
 /* Up to 128 MiB of flash may be accessed directly as memory. */
-#define NPCM7XX_FIU_FLASH_WINDOW_SIZE (128 * MiB)
+#define NPCM7XX_FIU_MAX_FLASH_WINDOW_SIZE (128 * MiB)
 
 /* Each module has 4 KiB of register space. Only a fraction of it is used. */
 #define NPCM7XX_FIU_CTRL_REGS_SIZE (4 * KiB)
@@ -507,6 +507,17 @@ static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->flash_size == 0) {
+        error_setg(errp, "%s: flash size must be set", dev->canonical_path);
+        return;
+    }
+
+    if (s->flash_size > NPCM7XX_FIU_MAX_FLASH_WINDOW_SIZE) {
+        error_setg(errp, "%s: flash size should not exceed 128 MiB",
+                   dev->canonical_path);
+        return;
+    }
+
     s->spi = ssi_create_bus(dev, "spi");
     s->cs_lines = g_new0(qemu_irq, s->cs_count);
     qdev_init_gpio_out_named(DEVICE(s), s->cs_lines, "cs", s->cs_count);
@@ -525,7 +536,7 @@ static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
         flash->fiu = s;
         memory_region_init_io(&flash->direct_access, OBJECT(s),
                               &npcm7xx_fiu_flash_ops, &s->flash[i], "flash",
-                              NPCM7XX_FIU_FLASH_WINDOW_SIZE);
+                              s->flash_size);
         sysbus_init_mmio(sbd, &flash->direct_access);
     }
 }
@@ -543,6 +554,7 @@ static const VMStateDescription vmstate_npcm7xx_fiu = {
 
 static const Property npcm7xx_fiu_properties[] = {
     DEFINE_PROP_INT32("cs-count", NPCM7xxFIUState, cs_count, 0),
+    DEFINE_PROP_SIZE("flash-size", NPCM7xxFIUState, flash_size, 0),
 };
 
 static void npcm7xx_fiu_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/ssi/npcm7xx_fiu.h b/include/hw/ssi/npcm7xx_fiu.h
index a3a1704289..1785ea16f4 100644
--- a/include/hw/ssi/npcm7xx_fiu.h
+++ b/include/hw/ssi/npcm7xx_fiu.h
@@ -60,6 +60,7 @@ struct NPCM7xxFIUState {
     int32_t cs_count;
     int32_t active_cs;
     qemu_irq *cs_lines;
+    size_t flash_size;
     NPCM7xxFIUFlash *flash;
 
     SSIBus *spi;
-- 
2.48.1.601.g30ceb7b040-goog

