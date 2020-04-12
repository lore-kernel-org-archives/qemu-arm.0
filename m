Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3147501lfm;
        Sun, 12 Apr 2020 15:54:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypKlEwyLwYEt9JWECAoBgfvLKVDHIR5+G7Oxne2VIQzFp8Pd9Zi8TMWWoRMs0RMBz3/YoT52
X-Received: by 2002:ae9:dfc2:: with SMTP id t185mr14057533qkf.20.1586732058435;
        Sun, 12 Apr 2020 15:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586732058; cv=none;
        d=google.com; s=arc-20160816;
        b=G1SBCwL2/EyGEkEuJQNRUHhrQiNXeURTrHoMZN59cRdrd/Mi1dtxycjIgN6+0ciblR
         EJNvbqZfnKGYVBV/K1sM3FRXL8LNnP9fKidqK+zOgBpZDjwr893jYoGnlwF/l1wkBPHM
         7PMwAb14WYjbADKjYCIOOrDWOX2qQ7ntOUfjT/uAJ7WGqidKWNV4eVKHWPYdeK2Paqn2
         Z9Sl7Ex4ENsKzJeUUjBgh2yGEFZMn2diWIWoWY/g8Wob9VdfdgCjlvr/95L89OJs8ncr
         C/BVlETh0YN/TawhbompGX7AO2SIe8uFdYCVOsNdexQ3VAT+6yJk2w8mhzJkme/IrfVp
         k26g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YIEKjYaSehnFfLSFKx18jrIeGBK5qNFrnpqQGnepkJE=;
        b=WJ2E74Wqps3Lz8zyQwy7YwabZ28wa+IIAV0vZVGtwqr007/JLktKtzQZTIcbj6P48n
         LkzC5Xv/sSgLRhjVkKBgeSHnG8IMopSgAjaexnF0Nd26h9CPYF4krUTfTuz3SY7esbSb
         pYcnNUmDzbCVvY61nS0ciqW3ky+1eNBYvI33pWMRpSTtBEnJdrlSdgQEiJl+GXa0uUbL
         0LNQH5nbLDeMBw872tRVOtDNCjXNrtmI+ylxKsCNF6XKgJqcXr2EeI92jGnvdqpMfvyt
         81zoQSl/4Id2OnFKhWKaFV+EBKIQMy8DxdplbB49QbnUWZb3V5dhW7Jc5bhmfCvhfIe5
         fkOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HkWHmv9g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si4689127qvu.161.2020.04.12.15.54.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:54:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HkWHmv9g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlUX-0008OZ-SA
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJ0-0001G5-J7
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIz-00061O-Fh
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:22 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36958)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIo-0005rq-TR; Sun, 12 Apr 2020 18:42:11 -0400
Received: by mail-wm1-x344.google.com with SMTP id z6so8411628wml.2;
 Sun, 12 Apr 2020 15:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YIEKjYaSehnFfLSFKx18jrIeGBK5qNFrnpqQGnepkJE=;
 b=HkWHmv9gZdAw6lY5Jeo+ZU3aN9GLylM+Ya9qK82xklS8Tekd0/puSmBaHntEalEqRh
 r/tq6JZBZVDWbw3wOcrZrYiS9T/YZiUw4KY+PBSUXHDuW4SaosMbDi4zVYJi2ZgypIR4
 TvQzH/tDSunadtLYjDoXD1iKM2tnkf4RQNWWa3yzE6IlX3pHmCI2lh0pPix5seBiDajS
 Y2lhGPddSPRMzl7f1NCSzaQeygFAqn5vGbLWe9wGdP3ICo7ExwPHsl7PmfydNmAngHf3
 k617tTbMhtc7ZGbPTuT/OJwDfbcqrb443fJT6y3VKWeoPG08VkRDP4DfO0TXsOXLN+GX
 bH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YIEKjYaSehnFfLSFKx18jrIeGBK5qNFrnpqQGnepkJE=;
 b=Jwh3MrCxYiNs+GIlX+YarcEFArAZm3pPlI78igal4M6beRuJU+iIDfi2Zbnx43kAMB
 /JDX+gF/e3b9T0+Oc0xr7edHKO5gx18KqpK6Ymfr5PyMhhP5H50Jz9dYmYTh2fBMfNyI
 jmvR03r6IhVtfLo6H2k5773vxWaFwClZYAenqUtyxKCFfIyVf1r/AcBbBqls9wpciBbL
 yf5csNdoA9A7UnIeMZFSkYpfOW+TEhe289KQmjzJvKw9T4FAE1nPV02M3bk6OWSWc4mm
 VFzGTrvmTrS2CYCGTaa7H+FWoF4HWXBB4i/VW+tW5ebvot/s+4qirII3aHFfw7oP6iea
 139A==
X-Gm-Message-State: AGi0PuZu6qClR43MvLpWfEaOnGs3jfqEJiaTndJkbuHEQDxsqPGsTINI
 0rjossj0iW0pib54/r4cj09OHYrcsf+FIg==
X-Received: by 2002:a1c:5448:: with SMTP id p8mr15519826wmi.173.1586731329787; 
 Sun, 12 Apr 2020 15:42:09 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 06/23] hw/arm/msf2-soc: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:27 +0200
Message-Id: <20200412224144.12205-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0YsJRkzTEMUJ

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/msf2-soc.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index e448b0ab74..7619e71cfa 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -93,7 +93,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     MemoryRegion *system_memory = get_system_memory();
 
     memory_region_init_rom(&s->nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size,
-                           &error_fatal);
+                           &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     /*
      * On power-on, the eNVM region 0x60000000 is automatically
      * remapped to the Cortex-M3 processor executable region
@@ -107,7 +111,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     memory_region_add_subregion(system_memory, 0, &s->nvm_alias);
 
     memory_region_init_ram(&s->sram, NULL, "MSF2.eSRAM", s->esram_size,
-                           &error_fatal);
+                           &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
 
     armv7m = DEVICE(&s->armv7m);
@@ -115,7 +123,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
-                                     "memory", &error_abort);
+                                     "memory", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
     if (err != NULL) {
         error_propagate(errp, err);
@@ -184,8 +196,12 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         bus_name = g_strdup_printf("spi%d", i);
         object_property_add_alias(OBJECT(s), bus_name,
                                   OBJECT(&s->spi[i]), "spi",
-                                  &error_abort);
+                                  &err);
         g_free(bus_name);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
     }
 
     /* Below devices are not modelled yet. */
-- 
2.21.1

