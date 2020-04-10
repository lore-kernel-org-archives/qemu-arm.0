Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp878820lfm;
        Fri, 10 Apr 2020 10:01:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypJryjmzQ6oRQ5gtD8qz6MaNAsYnybkgjlixDTXwmMQr+/afFHFBWq+Ru0usIABaYp3YRTw4
X-Received: by 2002:a37:9bc6:: with SMTP id d189mr4967587qke.174.1586538090748;
        Fri, 10 Apr 2020 10:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586538090; cv=none;
        d=google.com; s=arc-20160816;
        b=dK03nD4keyjT4dBYGq4T8jgnWremvAFstCNPkPM76N9lBzN3rmN3dFfnXdAz7OTt7w
         jrjq4dxNktL5LGtOx8uu1wlOOlXyMdqJRPAp90G2lhiyaNrw/4K9z0O1VvyoKggh142p
         3E1oQUzG0vWWIfueRj9n/iR1K24/xX1kYnfYZ7QpfPqFkPM4bmrzS6AMc61BJg79mRhg
         SGV8yjSXm21PbHhD1TE726G0MH4NC6puAvGRnwfWLwEEP5VjNksVHhynGlYsAnaodO0l
         bCPfXLuIAW8ebY9Vh/1ysEHw7OxqdgchV+A7ieXDgbSvby230yUxsQMAFIeXMwDUPEcr
         v4uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=pePTeeE7h5ir7BgZLzcfutrSaXBXb4kdz/GFrYkYkbA=;
        b=wa2OG2k+LHSLcX6z0501+6RSQ8QyHX4C01PIHwTYbQ4ZAtd8olbpqzB39s+Z3wb7Qg
         7PvSklI9kFwXQr3sO286lISX9U3YFk+BBkA9JgUgPZdX8ah3Q7IpxH9gq3QMAJUdlHA2
         VYCczRCevH4H/emKWXavH58K5vR/xNrG02RTby+0QhyP3SHB8wQVRdVvQ24ME1h5QA5b
         EWX7CWu3YfED6IZ1kxlM4XNA/ZU7yrYBCan32SOHTVZKyBjinKCzldejaIQMTkHeMdsA
         L9AosNrVn76o/rDMZdzXs9Q6mMDaKzwcW5tNWe253v2FZjl3g+QEJJJD5yHnCiAJJpe3
         ckjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@forissier-org.20150623.gappssmtp.com header.s=20150623 header.b=zdYSOJif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d23si1666143qkg.335.2020.04.10.10.01.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Apr 2020 10:01:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@forissier-org.20150623.gappssmtp.com header.s=20150623 header.b=zdYSOJif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jMx22-0000mK-7J
	for alex.bennee@linaro.org; Fri, 10 Apr 2020 13:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33595)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jerome@forissier.org>) id 1jMw7P-0004Hv-Ii
 for qemu-arm@nongnu.org; Fri, 10 Apr 2020 12:03:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jerome@forissier.org>) id 1jMw7O-00037C-FH
 for qemu-arm@nongnu.org; Fri, 10 Apr 2020 12:02:59 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jerome@forissier.org>)
 id 1jMw7O-00036Y-3i
 for qemu-arm@nongnu.org; Fri, 10 Apr 2020 12:02:58 -0400
Received: by mail-wm1-x344.google.com with SMTP id a81so3142425wmf.5
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2020 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forissier-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pePTeeE7h5ir7BgZLzcfutrSaXBXb4kdz/GFrYkYkbA=;
 b=zdYSOJifHlZTMqNFNk+XREK2HRDDzxbjS0rElQPguz11sXfaruI1t5K7B76KAKzZMT
 VhEcLvBUg89/nLrVxQdwkYg4uYg1GOfSPq5iZTRIeGe3924sowVzzvOpAUoSeZnvqvJZ
 ussgcbyg+IhZmiDBLtI2188qedVDqNQEqg7byPwmpzXT/ZUJ5f/LHOc3w7CXlYheAeJt
 qvB7akeg84WxYvHFQUGqr9oSRLPo6Nv4dQDRbffmt0C2MuFocZcqLnOmtJzpZ8aqBbCY
 k1PqNtXRNy2A1WXkNFJPDi/mdzHr6dWNw3i8f0rPm386RuJkZXYuZuwy4/zgdbNq5aEh
 11lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pePTeeE7h5ir7BgZLzcfutrSaXBXb4kdz/GFrYkYkbA=;
 b=V4GNqeqtR1/e+T9haoy9c5IXuhRrAv3LS1Qc/cqPMxa6jstalCMveKkKDlz7x5sSaU
 yJaputZ/ttFTbBzUF1dFiQqHrEeYWb+RRe+ZUYU8h8h8DvEnbHySPod4oZg9wmmW0HkG
 d56XCveGLNvoHYysC8uvKoRHw/TMSb2HJfOnq1WQA/KCB3bzEOeo5KOwoFDGMf3rGwt7
 3H2wR3RJYQhNckWZ9jr25JHsDIdM8G+2hnEtr5teW9IFqsaDnA7epBGvFMLJ3bTOuVHk
 /GjWyggXZrpDaQX7xge5b7YlECkelB1X/9JpRL/fSJgQmkvbNvPluHdzk6CTF5eKcSNt
 +znQ==
X-Gm-Message-State: AGi0PuZJKpM96CScx1+a0crBxs7L6AP5SeNKH2L77Z6wEygJDepiTfIH
 +apDDFrJjUgH4rcMxipmki8Gqg==
X-Received: by 2002:a05:600c:210:: with SMTP id
 16mr5508968wmi.57.1586534576762; 
 Fri, 10 Apr 2020 09:02:56 -0700 (PDT)
Received: from matebook.home ([2a01:e0a:3cb:7bb0:f902:b48c:6f87:25f2])
 by smtp.gmail.com with ESMTPSA id v21sm3268094wmj.8.2020.04.10.09.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 09:02:56 -0700 (PDT)
From: Jerome Forissier <jerome@forissier.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: Add DT property /secure-chosen/kaslr-seed
Date: Fri, 10 Apr 2020 18:01:29 +0200
Message-Id: <20200410160129.19748-1-jerome@forissier.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-Mailman-Approved-At: Fri, 10 Apr 2020 13:01:15 -0400
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
Cc: Jerome Forissier <jerome@forissier.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kPSJZ0vb1zW6

This commit generates a random seed to be used by the secure OS for
ASLR when the machine is secure. The seed is a 64-bit random value
exported via the DT in /secure-chosen/kaslr-seed. This interface is
used by OP-TEE [1].

[1] https://github.com/OP-TEE/optee_os/commit/ef262691fe0e

Signed-off-by: Jerome Forissier <jerome@forissier.org>
---
 hw/arm/virt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7dc96abf72c..42a6f84086f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -77,6 +77,7 @@
 #include "hw/acpi/generic_event_device.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
+#include "crypto/random.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1635,6 +1636,18 @@ static void finalize_gic_version(VirtMachineState *vms)
     }
 }
 
+static void create_secure_kaslr_seed(VirtMachineState *vms)
+{
+    Error *err = NULL;
+    uint64_t seed;
+
+    if (qcrypto_random_bytes(&seed, sizeof(seed), &err)) {
+        error_free(err);
+        return;
+    }
+    qemu_fdt_setprop_u64(vms->fdt, "/secure-chosen", "kaslr-seed", seed);
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
@@ -1837,6 +1850,7 @@ static void machvirt_init(MachineState *machine)
     if (vms->secure) {
         create_secure_ram(vms, secure_sysmem);
         create_uart(vms, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
+        create_secure_kaslr_seed(vms);
     }
 
     vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
-- 
2.20.1

