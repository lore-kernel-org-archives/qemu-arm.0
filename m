Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3335839lfa;
        Sun, 18 Oct 2020 13:58:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF8yt9iH5MfISdPznqXEAqari5M++HOc79/2O7L+fG1FMAuCaYIjL5m/NydhuoAfbYEiRE
X-Received: by 2002:a25:bcc9:: with SMTP id l9mr17249305ybm.183.1603054691096;
        Sun, 18 Oct 2020 13:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603054691; cv=none;
        d=google.com; s=arc-20160816;
        b=Sjjf061LT4HQ5nvJ6GU36Qvt7YD1q8D5nfmT+NOJsbhoJQBwJd1ZnWK9Oij5RTlsl2
         pZh3OYPl9KsWVq4u41UkCeAn5EWRK7B56i5f1PM61VDLxAUQk3jzTAhyA1Kupx+naol/
         F++4coU+tdC4Vx+WU3qCtBava0MPie0kPX/FbY4OjKUxUMPGIoAT+uaCzp0/R5ad1aHQ
         82ndmMoE0uq8lB5la4lMqMpjWtq0Ul8xEzA6tOS13M2iP2bd2JIW1rjBlwSUKHQvDMY4
         C9BRiqcdWoDgTF2bWbi5J2reK5pFcnl7S+uh+2CRR5QJFwiH4+ETESRtVLcjn9oxcEbZ
         yE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=H4Vj4prHafiErMNGerrw49ZgJ7IM19BsKxuWO4t5AF8=;
        b=Sxva31A8UY+AwBJ1OcNGr0qZPAf+PaOfgS5A9AoOuWXFhlBtSWX1iImjVnkkI6HfU8
         KFIDE3rn6nDlJgvJ9gFIyCDp7IheME1Ta+mD1CuqBR3iCe6VT2miRgNGf8QvH6ns1FQn
         qCkwAt2m21IS/CLZWAIwVvE82KPzTJ7dwDopSU5Jo5PjmCsOWiTVxqgduj4TMQGXOS6Y
         WQPgyz1mP9XBBXr5VOlRTpyYkD7L9Eq4ul/X84LWCzT9I4/WucvJDlJD79w3DQQa22Sf
         3xfb44ZBL3bzVJ3xiTlQ+ItHfAYTxm/joojqft/ryxo/U9GBU31OnIN3foCkbB7xD8k5
         EpMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rO1ItjBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r62si7160564yba.202.2020.10.18.13.58.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Oct 2020 13:58:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rO1ItjBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUFko-0000JT-GB
	for alex.bennee@linaro.org; Sun, 18 Oct 2020 16:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUFis-00063i-B9; Sun, 18 Oct 2020 16:56:10 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUFiq-0003qS-TO; Sun, 18 Oct 2020 16:56:10 -0400
Received: by mail-wr1-x441.google.com with SMTP id e17so9125673wru.12;
 Sun, 18 Oct 2020 13:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H4Vj4prHafiErMNGerrw49ZgJ7IM19BsKxuWO4t5AF8=;
 b=rO1ItjBKyeiW1aL2VZWP1VWyDoieT2uDkEkaSyU4wBw8KpKSsWym96gcMfYja3dRYG
 hhk39KvxVuZv6cdAdOBe746VUG9oCniDbR4HBu9DFAIMvNZkBr9l1n9vt/HkTeRYn9sn
 EpvLqp0XKk0C/OWxjbIulNg83ybZVxo0EcUL8ks1jsAk30g6q6gEhSBsl2yLjNjI4p0u
 9vde+OlvMkWCBsVaTK/5MQs9gRJkGFPDmocg/p4DLKllDUKaV+Tbx3rXtViIM+IJ383E
 emQR+JybIovRUz0f26IBEHUgdA57zwt4PyPPvCt+qbOsjL1Dm83qg0BrP1tzD+JREoUe
 0OaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H4Vj4prHafiErMNGerrw49ZgJ7IM19BsKxuWO4t5AF8=;
 b=S0RC0ushhT5wFg/VYe5LtvyvMOp/IHr60rOnMyoBgiY0ZwKx9DbGzT+aZxfx7wmNYk
 kgoTZfFxwQoL451gFGW6neQLzkCyKd02Z5JXc+ew9vWGxv7xDlGsXnRXT5PxLnLKV3tA
 WEXVZYh1OAIKduX8IVsuQVIO5grd2bU40EXpDeHeN5dkRk91X/PuJLGZ7nnpz5u1Py8r
 cicSaAjvH5gHaXcgwyIvMxRtzJVJq2xFvMHxhjur5HffHhjxs4VOIa8Ve5cScVNzlP6F
 nzuQ+c49ELGWOM0r4v9+Hoxv4YXf1B9NU6w0YGJs8N5I8CHW2JoENCWRgjnHBjnnoWBG
 dV4g==
X-Gm-Message-State: AOAM532Fe0Ktzy0WjbX/sWG39M+Hi+lD27kDLo1cZMumaC7++tEqn1hP
 QF0Q3ZJDturxeiPM7f4BHrKLKdx0wXE=
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr16119386wrr.20.1603054567144; 
 Sun, 18 Oct 2020 13:56:07 -0700 (PDT)
Received: from localhost.localdomain
 (117.red-83-52-172.dynamicip.rima-tde.net. [83.52.172.117])
 by smtp.gmail.com with ESMTPSA id u20sm13159004wmm.29.2020.10.18.13.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 13:56:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [NOTFORMERGE PATCH v2 3/3] hw/arm/raspi: Remove unsupported raspi4
 peripherals from device tree
Date: Sun, 18 Oct 2020 22:55:51 +0200
Message-Id: <20201018205551.1537927-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201018205551.1537927-1-f4bug@amsat.org>
References: <20201018205551.1537927-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Johnny Sun <psunjohnny@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NGIbap0twXh7

Kludge when using Linux kernels to reach userland.
No device in DT -> no hardware initialization.

Linux 5.9 uses the RPI_FIRMWARE_GET_CLOCKS so we now need to
implement that feature too. Look like a cat and mouse game...

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 6a793766840..93eb6591ee8 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -25,6 +25,7 @@
 #include "hw/arm/boot.h"
 #include "sysemu/sysemu.h"
 #include "qom/object.h"
+#include <libfdt.h>
 
 #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS */
 #define MVBAR_ADDR      0x400 /* secure vectors */
@@ -200,6 +201,29 @@ static void reset_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
     cpu_set_pc(cs, info->smp_loader_start);
 }
 
+static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
+{
+    int offset;
+
+    offset = fdt_node_offset_by_compatible(fdt, -1, "brcm,genet-v5");
+    if (offset >= 0) {
+        /* FIXME we shouldn't nop the parent */
+        offset = fdt_parent_offset(fdt, offset);
+        if (offset >= 0) {
+            if (!fdt_nop_node(fdt, offset)) {
+                warn_report("dtc: bcm2838-genet removed!");
+            }
+        }
+    }
+
+    offset = fdt_node_offset_by_compatible(fdt, -1, "brcm,avs-tmon-bcm2838");
+    if (offset >= 0) {
+        if (!fdt_nop_node(fdt, offset)) {
+            warn_report("dtc: bcm2838-tmon removed!");
+        }
+    }
+}
+
 static void setup_boot(MachineState *machine, RaspiProcessorId processor_id,
                        size_t ram_size)
 {
@@ -234,6 +258,9 @@ static void setup_boot(MachineState *machine, RaspiProcessorId processor_id,
         }
         s->binfo.secondary_cpu_reset_hook = reset_secondary;
     }
+    if (processor_id >= PROCESSOR_ID_BCM2838) {
+        s->binfo.modify_dtb = raspi4_modify_dtb;
+    }
 
     /* If the user specified a "firmware" image (e.g. UEFI), we bypass
      * the normal Linux boot process
-- 
2.26.2

