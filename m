Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp679290ocs;
        Tue, 27 Sep 2022 09:15:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Jw81u1h0fEQ3kX/Edv2NnLXrCdCa5ir+nnXtJ3bsNIAePd6cD2i0izEzjRk+qMO7Zctsy
X-Received: by 2002:a05:622a:7:b0:35d:186:bf97 with SMTP id x7-20020a05622a000700b0035d0186bf97mr23280341qtw.160.1664295322071;
        Tue, 27 Sep 2022 09:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664295322; cv=none;
        d=google.com; s=arc-20160816;
        b=XpoRlKDHyDrLA0oXOhfcYQJglmu92WOAxX/z3+MzUa/xiiQNxE5Fjh/BvQ92LaSzup
         ZTvK8o3W/7p0x7DHXgJNk2qRPTYQlPjtF6A3aZ4BP531ywrqv5iTs54w48SRDhCoK8LA
         E+ScSUcP3OFRd9WyaFuX7fDWEvcJT3iSD8Z7S12pNl0SZxcmyPa1vtoNImVLWP8KGGi9
         SwumikV96Ga25OQtVWPFapwsEbRmA8g+fSwkNqn1LTDSTqCafSy4ZaFnFQdo4I3DwgW8
         1DRnOIFnSSJQIsjcnUzyOc/ZNVgkfYV7Law3ZpmZHkpcPaNs10J9PWft1IcM+QxpvnJX
         r3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=AYXNAR/40rFqzW2vG8sAKK8tE30s5Xu8rSZ73wgd/NM=;
        b=C6ySgNFffBvW0xXSrLQM7XfSEoAziylHQYmuWaRVYmqMWlTQQ4qAo7nYk5pnCRL4HD
         OfpFKaVfRe36648+MzFXRRc7HkpCjwtBOQfPVnJxT6/rPC0uzHT4U2lcIeFXlBhMQRpF
         kIwfQ/fedzi91Szgi9lfUixQIKXZyTFuVqrcs3Sbh7lvQyLlD5zRwSD8pbgnc/vs4WYs
         XU4xrbGFNK6afh5+TMuqLqLVE70GcBKCiPedUVdfSVKuRUsXFJ5XDzcwO/Hyqg2IlqHk
         UvdTFcyR4ZIr8XXzbyK0X/rjcTFruHAz6tYFgok9leUVaOYuktZYA8KEAoQ8gs9tdU2X
         ZrWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=20210105 header.b=PbQ6ZR6O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb3-20020a05622a1b0300b0035d4dfe8efdsi1041814qtb.54.2022.09.27.09.15.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 09:15:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@zx2c4.com header.s=20210105 header.b=PbQ6ZR6O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odDEu-0005CM-Fx
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 12:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=O2ZR=Z6=zx2c4.com=Jason@kernel.org>)
 id 1odD7s-0002s0-U2; Tue, 27 Sep 2022 12:08:06 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:58202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=O2ZR=Z6=zx2c4.com=Jason@kernel.org>)
 id 1odD7p-000312-Up; Tue, 27 Sep 2022 12:08:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 836CFB819D6;
 Tue, 27 Sep 2022 16:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F6BC43470;
 Tue, 27 Sep 2022 16:07:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="PbQ6ZR6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1664294865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AYXNAR/40rFqzW2vG8sAKK8tE30s5Xu8rSZ73wgd/NM=;
 b=PbQ6ZR6OOtkJdY5I04dKvl2ylvMYLb6x7dSj2Op4mFPUnTLm0o7pm50PEJTkNOcNffBS47
 O4IHQBVszU70FJ3bEWM+oLtZQyeCoW3p2osmK1sDh4m7glFMjHcrq//Jgt3XY1+PdA1Cjo
 P8vIdnDPx/OdQen1B/9WfzUlGCVOfMQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2a1565b1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 27 Sep 2022 16:07:45 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] arm: re-randomize rng-seed on reboot
Date: Tue, 27 Sep 2022 18:07:42 +0200
Message-Id: <20220927160742.1773167-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=O2ZR=Z6=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dsTI87uNQ5oA

When the system reboots, the rng-seed that the FDT has should be
re-randomized, so that the new boot gets a new seed. Since the FDT is in
the ROM region at this point, we add a hook right after the ROM has been
added, so that we have a pointer to that copy of the FDT. When the
reboot happens, we then look for RNG seeds and replace their contents
with new random data.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/arm/boot.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..2836db4abb 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -25,6 +25,7 @@
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "qemu/guest-random.h"
 
 /* Kernel boot protocol is specified in the kernel docs
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
@@ -529,6 +530,26 @@ static void fdt_add_psci_node(void *fdt)
     qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
 }
 
+static void rerandomize_fdt_seeds(void *fdt)
+{
+    int noffset, poffset, len;
+    const char *name;
+    uint8_t *data;
+
+    for (noffset = fdt_next_node(fdt, 0, NULL);
+         noffset >= 0;
+         noffset = fdt_next_node(fdt, noffset, NULL)) {
+        for (poffset = fdt_first_property_offset(fdt, noffset);
+             poffset >= 0;
+             poffset = fdt_next_property_offset(fdt, poffset)) {
+            data = (uint8_t *)fdt_getprop_by_offset(fdt, poffset, &name, &len);
+            if (!data || strcmp(name, "rng-seed"))
+                continue;
+            qemu_guest_getrandom_nofail(data, len);
+        }
+    }
+}
+
 int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                  hwaddr addr_limit, AddressSpace *as, MachineState *ms)
 {
@@ -683,6 +704,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      * the DTB is copied again upon reset, even if addr points into RAM.
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
+    qemu_register_reset(rerandomize_fdt_seeds, rom_ptr_for_as(as, addr, size));
 
     g_free(fdt);
 
-- 
2.37.3

