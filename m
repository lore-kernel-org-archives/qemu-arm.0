Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3769626lfm;
        Mon, 20 Apr 2020 05:20:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypL8QTCDbn3DSK2hhKr6XOiAJRlc2FOlxpTrt4PLKBC5Kbo697FC2CuWx9iKpj4VgEPIVHFN
X-Received: by 2002:aed:3bf2:: with SMTP id s47mr15176767qte.126.1587385240450;
        Mon, 20 Apr 2020 05:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587385240; cv=none;
        d=google.com; s=arc-20160816;
        b=FpHRNyKJ05Nf5Xbo/BQQaE/QeZwiLyq+gdVElsVBXGw7USZlaxRk8YqzNonXj40c1p
         4Ru8Sb27E37h/YwcpJ3x0ZfUMCdhtj+L9m4ZGp6GOg0M4B4TUptTo8s0fYA/zN2ZwzHn
         C5ssAXDlVZSYtQv8IsBPoekuxC8aiGKmWuK/Qspzsfe1+4o/xYjXCOjAEOUUuv/p5DGv
         AXxrpNJVvZphBRYTBsx1s1J4qWB/JVUifPQxrQXEg7rZgL//oZofSqrmgAFt6pEa1P4n
         Wh5Kve30NXAx9PfVY6EG+mUSGGDa4K3OB6QVuE5dTNCyEJp2aX2UOl2c0L3hq7w8bJtk
         pWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aw73xtFklm/Xs1zT9ssg56PFA0LAMfEmVbDCKfcPWjo=;
        b=GXNYB5Z30TErqYvOO8Y4tVA7kes6w+KhAg76KkywAB/MYjkDDUYAF1+OHN61MNg5/Q
         MCkPpZ+8g+xF/p5JZCWfNfV+nQM4vozQx8mOy4ozUr2eTEvMrrcQgGuJKoPs29F0Hfkf
         D/h3PQ2gv1OVzP2SJNiuGcwn7mxZtSwfUanBwu0ZOI7CgdpFUYgqCV+dKy/zNCHQmSEY
         ir3+D/gJlu7OeQtbvLKYQh7ZPFqtqVAxgM6C3cZAAEHKOhSLQctYcrv9ShpjJtZkgMJm
         JKW2lA6wKU2sOq9OUJpmJjbFeKEB1ITiFqR9qhasNpkgH9I9eiDWNLD6BvxpjLzYzuXc
         EGjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@forissier-org.20150623.gappssmtp.com header.s=20150623 header.b=qnAXjfSn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194si429330qkh.177.2020.04.20.05.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 05:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@forissier-org.20150623.gappssmtp.com header.s=20150623 header.b=qnAXjfSn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQVPj-0001q7-T1
	for alex.bennee@linaro.org; Mon, 20 Apr 2020 08:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jerome@forissier.org>) id 1jQVPZ-0001me-9E
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 08:20:29 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <jerome@forissier.org>) id 1jQVPX-00012v-AO
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 08:20:28 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52052)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerome@forissier.org>)
 id 1jQVPW-00011G-UW
 for qemu-arm@nongnu.org; Mon, 20 Apr 2020 08:20:26 -0400
Received: by mail-wm1-x344.google.com with SMTP id x4so10768334wmj.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2020 05:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forissier-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aw73xtFklm/Xs1zT9ssg56PFA0LAMfEmVbDCKfcPWjo=;
 b=qnAXjfSnS4Oh2D7anbdo5atylx7dTzg4Y1ylNXoE6Izisclv3nHOZ8i2Mlch5roLic
 rI2D6U2t+zaD88qZnvmtSHHkGvZhgyg+mepxYeBfRd6/EESE2jWPcNbv83eiItPLK0FK
 wNTrsrUmUiYFIz6yFbq4mXIB/nAm+h79oI26BmOOjFaIbjZlih+NogbMQFIL1Kg/+6rI
 s9Ts9KyAeCCQbnXeNK0zRyDwMPW9dNGumvR70wB8jw/Fj7t3sMcdlAfZix7j5VEMF2S/
 kDudDvoE1LEhnJ/0SKFhyBlDRS1sk0LnCR0/Y3+duWfwB9s6Mkg/mrO7CL7zEY15DrRr
 a8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aw73xtFklm/Xs1zT9ssg56PFA0LAMfEmVbDCKfcPWjo=;
 b=fvgGRmIWF2099CXlyVMONR+ZuTaLZt8KB1wUfBwYUilQUaUXLKm6Rt7f0XzMmMicaL
 rxNzQrvSZljnvztCTbV9IHN+sJD9k+TYO9OjutAPvvF+KxVdlHcL/FhPFGUOEpZOstIK
 cFq+NTBTte/lq/v5MGJLa+9NB2IcZoPWs1KOIxhTK3Dinla/JY3NoQ3OYBTFdYiaYZKx
 zTey4SBf50hVfnaY5IhAV3ezcUTSzUWtJ6SDjCOSzdPo72XHrqdxyGk9dTaZksx7JmKr
 mOJbMYKaYiVOMD/xfwZE8WnKfRP16NZQnLlwsIDUIV8raDkDWVQ6FopTVZZ+MtOewmS9
 ireA==
X-Gm-Message-State: AGi0PuZn5cchRwCh7U26p/AK+VGJchueYGWyOq8Cj6zp+Bo76oROvJ8E
 wivg6FLf1wBtCqWslvwd8YCrhw==
X-Received: by 2002:a05:600c:2a52:: with SMTP id
 x18mr16903684wme.37.1587385225553; 
 Mon, 20 Apr 2020 05:20:25 -0700 (PDT)
Received: from matebook.home ([2a01:e0a:3cb:7bb0:4826:2464:6688:71f6])
 by smtp.gmail.com with ESMTPSA id v16sm1127132wml.30.2020.04.20.05.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 05:20:24 -0700 (PDT)
From: Jerome Forissier <jerome@forissier.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/2] hw/arm/virt: dt: add kaslr-seed property
Date: Mon, 20 Apr 2020 14:18:07 +0200
Message-Id: <20200420121807.8204-3-jerome@forissier.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200420121807.8204-1-jerome@forissier.org>
References: <20200420121807.8204-1-jerome@forissier.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::344;
 envelope-from=jerome@forissier.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Cc: tee-dev@lists.linaro.org, op-tee@lists.trustedfirmware.org,
 Jerome Forissier <jerome@forissier.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u95Xwenpo7QS

Generate random seeds to be used by the non-secure and/or secure OSes
for ASLR. The seeds are 64-bit random values exported via the DT
properties /chosen/kaslr-seed [1] and /secure-chosen/kaslr-seed, the
latter being used by OP-TEE [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e5bc0c37c97e1
[2] https://github.com/OP-TEE/optee_os/commit/ef262691fe0e

Signed-off-by: Jerome Forissier <jerome@forissier.org>
---
 hw/arm/virt.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c3073b7cf19..1b6f3971bf7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -77,6 +77,7 @@
 #include "hw/acpi/generic_event_device.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
+#include "qemu/guest-random.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -213,6 +214,18 @@ static bool cpu_type_valid(const char *cpu)
     return false;
 }
 
+static void create_kaslr_seed(VirtMachineState *vms, const char *node)
+{
+    Error *err = NULL;
+    uint64_t seed;
+
+    if (qemu_guest_getrandom(&seed, sizeof(seed), &err)) {
+        error_free(err);
+        return;
+    }
+    qemu_fdt_setprop_u64(vms->fdt, node, "kaslr-seed", seed);
+}
+
 static void create_fdt(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
@@ -233,9 +246,11 @@ static void create_fdt(VirtMachineState *vms)
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
+    create_kaslr_seed(vms, "/chosen");
 
     if (vms->secure) {
         qemu_fdt_add_subnode(fdt, "/secure-chosen");
+        create_kaslr_seed(vms, "/secure-chosen");
     }
 
     /* Clock node, for the benefit of the UART. The kernel device tree
-- 
2.20.1

