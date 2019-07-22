Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7014114wrv;
        Mon, 22 Jul 2019 08:18:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhgADMXjGyBDI4IFGvW3gmzstPGpwi/zL35VDYwON+F+pfa/M28hE76FAscKWg1irYhoWp
X-Received: by 2002:a05:620a:1661:: with SMTP id d1mr47987040qko.192.1563808697005;
        Mon, 22 Jul 2019 08:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563808696; cv=none;
        d=google.com; s=arc-20160816;
        b=mU1Z8VdLdqAE+PFh3QkKRcRJLKr6CKJaoC7YxEgpHTnapz8hCL85od2VsPrV3y8+Ty
         y/NFkpILj/eWu3jrgta9MP87mr4FhbBq52x/4Dia7KjMYBqWMnP2Dc4bQUI2uMwEH5Qi
         BqMz68pNOzZqDrwYfY7WkxhXRz7pt0oV4xtLH9VvNGfvdafEqQSgNj//UGA8qt5skFu3
         6Ih6b/zFXwB/ifTj9vO1j0c9WYuvDXOZte45z6TpxBOtZsBaZBbFcPTd8bSA12wwAStY
         Pf3NfbCU0ekieW6ZJIesb7xo87yy+LoECVHOrZWUfzGyV1FuBIcr4B2xIzGeKucznGoK
         7INw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=OYBMZusYqESde0qHUOjc4d/ttVAW59Cu3YSqerf0Vp0=;
        b=FfUH97s9zuF1GfVyUAL4Lb5ARVQ18VkVJh7MZ5FElsS0Q2BnHdsYWl+PFV1SsCX5iK
         U7wyn1A00r5lyt4TJ0JmOI7LKStshzQ1Mp0B3QvqWV2XNMKVN7Dfh/R8JSh2VUxJRLPH
         XqIhzOZMjtefMxQFd2lfVu7eaeSQ0eUs1rsDLowSilEkhttaACNmyooOIq5iu8sLxLhQ
         3gOM30LxFd7iEhwcDRCuvHh/VFswm+tdv2n8ko64DTkhYkTmGtMcltOehmIeO4T+vDaB
         pOgxklRx+XzQ4bGI/GAYqe9E3PyPQBJnp1eHJorLzb1WD0BNogq1s+33nWoxhjFivW27
         ktvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BYAkNYV/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si9204441vsr.441.2019.07.22.08.18.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 08:18:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BYAkNYV/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpa4t-0002il-Px
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 11:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hpa4o-0002hu-Fh
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:18:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hpa4n-00023A-9R
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:18:10 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33715)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hpa4n-00022F-2a
 for qemu-arm@nongnu.org; Mon, 22 Jul 2019 11:18:09 -0400
Received: by mail-wr1-x444.google.com with SMTP id n9so39919392wru.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2019 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OYBMZusYqESde0qHUOjc4d/ttVAW59Cu3YSqerf0Vp0=;
 b=BYAkNYV/IKOanaijq53MZGBHOwjZxQ+QrPknvcXKF1JZrvOoF3xLjGRjSv+AOSGWWr
 3wLEJvLq83zDi3Tr8DYh0kP6legijgYfAJ5pic8mCSgAodAS6hbCPfYrbOLQihe6mUf6
 MIShX/Qg7GRlEYWKZt+LLOugBAxF25tAVs5nrVUg8VOFth7YlXqYduETHvOREtxDPe0P
 n4lqU/hFR4Y/kp6XQDjnOjjegGATmq7/Hokrx9zDtu8zkY6/zaSbsTU9O7BHi+omt/gU
 9ntK94Dc+SyGsCmyvxiGABsFDTE5cD8LNcWcqXUGiUH06LI2jlKf6BetGmbtRTqIWNXZ
 7ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYBMZusYqESde0qHUOjc4d/ttVAW59Cu3YSqerf0Vp0=;
 b=A5//qnatajm1gJ66NH8BYi0zmp9YN9U8QGMue1ugsJC81Uy/jRvdlSZU6eMt4z1sL+
 Nn73QCNML3AqXDxrjbFdP76ILXiJjRSon/WgXfJPOoAyKf/7caI7CNTg0hLRd/B7MZol
 jVuPV+IuBIkb0/p6WqhAmfmPTllqdiXBkQuP00AOP3PyF31rHieKH/gPY2YEHXhbTsC5
 PGGf0FSUUqU2zvy+Ifdg/0giULSQb6hVsGH2dlZttqpvDhqh6vcYtCax/s7+IFUOjPaS
 Ln3CG9+XPdvOxBosO2vcvu6kegUXt3aua7ute9Mkv3TDT7kj00elC4mm3OLYnhySYaka
 JQzw==
X-Gm-Message-State: APjAAAXtI7//wlSpnGWGjHtCu/mjl0DcD/KAvfKj07giLKHp6mFzQsoW
 nPSXzfs1HPAkT453Mc8uW0SzbOjHirKT6Q==
X-Received: by 2002:adf:dd51:: with SMTP id u17mr72073092wrm.218.1563808687889; 
 Mon, 22 Jul 2019 08:18:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s15sm23163990wrw.21.2019.07.22.08.18.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:18:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 16:18:03 +0100
Message-Id: <20190722151804.25467-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722151804.25467-1-peter.maydell@linaro.org>
References: <20190722151804.25467-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH for-4.1? 1/2] hw/arm/boot: Rename elf_{low,
 high}_addr to image_{low, high}_addr
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kpxd8wiR9wTq

Rename the elf_low_addr and elf_high_addr variables to image_low_addr
and image_high_addr -- in the next commit we will extend them to
be set for other kinds of image file and not just ELF files.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 1fb24fbef27..b7b31753aca 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -986,7 +986,9 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     int kernel_size;
     int initrd_size;
     int is_linux = 0;
-    uint64_t elf_entry, elf_low_addr, elf_high_addr;
+    uint64_t elf_entry;
+    /* Addresses of first byte used and first byte not used by the image */
+    uint64_t image_low_addr, image_high_addr;
     int elf_machine;
     hwaddr entry;
     static const ARMInsnFixup *primary_loader;
@@ -1014,24 +1016,24 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         info->nb_cpus = 1;
 
     /* Assume that raw images are linux kernels, and ELF images are not.  */
-    kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
-                               &elf_high_addr, elf_machine, as);
+    kernel_size = arm_load_elf(info, &elf_entry, &image_low_addr,
+                               &image_high_addr, elf_machine, as);
     if (kernel_size > 0 && have_dtb(info)) {
         /*
          * If there is still some room left at the base of RAM, try and put
          * the DTB there like we do for images loaded with -bios or -pflash.
          */
-        if (elf_low_addr > info->loader_start
-            || elf_high_addr < info->loader_start) {
+        if (image_low_addr > info->loader_start
+            || image_high_addr < info->loader_start) {
             /*
-             * Set elf_low_addr as address limit for arm_load_dtb if it may be
+             * Set image_low_addr as address limit for arm_load_dtb if it may be
              * pointing into RAM, otherwise pass '0' (no limit)
              */
-            if (elf_low_addr < info->loader_start) {
-                elf_low_addr = 0;
+            if (image_low_addr < info->loader_start) {
+                image_low_addr = 0;
             }
             info->dtb_start = info->loader_start;
-            info->dtb_limit = elf_low_addr;
+            info->dtb_limit = image_low_addr;
         }
     }
     entry = elf_entry;
-- 
2.20.1

