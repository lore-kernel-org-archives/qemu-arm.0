Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp294184lfa;
        Wed, 28 Oct 2020 02:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3iyzHZKvqkOULYypBocxikJWxS0vEDWJnu1uxN3Jbu5kNNnvMIl2lkt7eOM6E+OMDbKsv
X-Received: by 2002:a25:d8a:: with SMTP id 132mr9072949ybn.7.1603875660823;
        Wed, 28 Oct 2020 02:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603875660; cv=none;
        d=google.com; s=arc-20160816;
        b=lsIv25vt+2D1u6NZidfzl1YVWEYMMg495PtoKrK6sKag1IJhFHg/3pAw/XGwMbOrrg
         Z2EHwOz+uQbIuW54wDhbxRchBV0Xbdlz8if6aikqZqRr3vRYCImnh9BtrZKiv4WzfmxT
         Sq3rDhR7j+ujXYlM7djIngSm+KJKBQtUzrRxIjZvoLKkxXBNwhhrhArQjpN1MogEAQgc
         yLzjiS49Kx8JTbcA2Q+1A5DEKWIbrpU1gJFOqFGbEytMmwGvYMoXsQwsjJrlljDRmln6
         SpyJ1a62CWQ0gtTNnIXhTDViZKOJlXZBNX2wwLSOHUJD5kQDRSApcd/LrGjncWqGBKtb
         vJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=9KzxZphh5qorAZCm7OOtB/tI3KN6E0kQQ+xEwkJpWxM=;
        b=jA2C/4/0nJZSMTM2KHHM1fnr1Hvbe7AHcEg0jvI2/G2WXtxjCl9zLvZZJqhp+w9Q8k
         lhSQdT4o4MDwdkkuIe1gdXfpCKdUTS5AeXq+3dAHFWGyFR+htpbrgF+2Xiqj71CJj7na
         GQwCSHtwlRUovAT5ohbjogkywtYPQNqkuarbil7hUfTlN9uYnGzZWylF6Qogwq9ZLJDJ
         odMM4SnnwSao0elA81RYYM/jbiAgK9CNV6H3OW7SqtqhrUIwgfmO2QI84XlvRVTC9+Jb
         ATSAi6grxTxUUdzB359234dMuXtjXXQxg1z+bFxi9bC77hQL4sdmZ37HXqVIoCKeQlw8
         j8hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CAsGSlju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k185si4313201ybc.326.2020.10.28.02.01.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 02:01:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CAsGSlju;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXhKG-0007ck-5s
	for alex.bennee@linaro.org; Wed, 28 Oct 2020 05:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kXhJ2-0007PC-Rq
 for qemu-arm@nongnu.org; Wed, 28 Oct 2020 04:59:44 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:33039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kXhIz-0008Mq-U4
 for qemu-arm@nongnu.org; Wed, 28 Oct 2020 04:59:44 -0400
Received: by mail-lj1-x243.google.com with SMTP id c21so5234529ljj.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2020 01:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9KzxZphh5qorAZCm7OOtB/tI3KN6E0kQQ+xEwkJpWxM=;
 b=CAsGSljuJw3uvCLpvtA92Xycjxof9qcDxt2mv6LrlQ5QWNxzi0rwe7GoLD7Z9RQeoI
 ge2CRd518VBBe704wYLGYwW/VvnbQqh+Pknt/sFcL7Mf8iSQVpTfindehsgJK98i4Cf5
 9l3uUNMMTBbAyy91UbDGTLo2rviLZE8P7ZmnLL9/p4aMxBOf+kfHKKCU9PvGulYGA6z/
 wII+T1b5U/LdlCXwzZAS5DevaIoThhTpI+6GbLTu0Dx/4p68NeAFaupCWUFLWQKJM6yz
 htamPTcxkhAhDHqnpiy5akCEdfo8hpl5yGiM2FVz/ZMkRLfB7wkVSUB1AUcahA7BcW7e
 205A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9KzxZphh5qorAZCm7OOtB/tI3KN6E0kQQ+xEwkJpWxM=;
 b=HAB5WX1N6swzhcL0FrOZwzvDU5dOaiD/kkAS207vGZkYlnqg8bFclE7/jx/ViKhWHI
 tkX6CkSecLa9jlVGZhrzlZlf07UKMJP2x45sJwj3f+hTw0a3pO36tua9wNdOrxt1PH7A
 kF1+Ldafmv4G5m5UJ6iVEy4Lb6vhqcRRUYpqRdEU6fb7KgPBEARoM5X8Qp1Wp/9r6XUC
 BDNAOIZhBXjBzhDI7PN05GUyc5AgEhntRu0ibTdW/T7dFkgVvcahToc5R4L/gFUoPWWp
 zcfcQVSYcioeuQUb6NzBb0h1BriOrk4m0Rw5MC974tFy5VYL3XtFwFhpO8NVmyFhksLS
 sUXQ==
X-Gm-Message-State: AOAM533WTXVFncO+8431dxU4g29OIi0uCOtqYOBzZ6KBFDKkfy8VNopU
 ozQYVh+V9TgmqSeR8gD1JJ1FIpT6QTljLCfW
X-Received: by 2002:a2e:884d:: with SMTP id z13mr597254ljj.413.1603875578430; 
 Wed, 28 Oct 2020 01:59:38 -0700 (PDT)
Received: from localhost.localdomain (37-145-124-43.broadband.corbina.ru.
 [37.145.124.43])
 by smtp.gmail.com with ESMTPSA id l3sm521719lji.36.2020.10.28.01.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 01:59:37 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org
Subject: [RFC PATCH] hw/arm/virt: use sbsa-ec for reboot and poweroff in
 secure mode
Date: Wed, 28 Oct 2020 11:59:18 +0300
Message-Id: <20201028085918.14580-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, francois.ozog@linaro.org, qemu-devel@nongnu.org,
 Maxim Uvarov <maxim.uvarov@linaro.org>, tf-a@lists.trustedfirmware.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /12deyr685G2

If we're emulating EL3 then the EL3 guest firmware is responsible for
providing the PSCI ABI, including reboot, core power down, etc.
sbsa-ref machine has an embedded controller to do reboot, poweroff. Machine
virt,secure=on can reuse this code to do reboot inside ATF.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 Hello,

 This patch implements reboot for the secure machine inside ATF firmware. I.e. current qemu
 patch should be used with [1] ATF patch. It looks like that Embedded Controller qemu
 driver (sbsa-ec) can be common and widely used for other emulated machines. While if
 there are plans to extend sbsa-ec then we might find some other solution.

 So for the long term it looks like machine virt was used as an initial playground for secure
 firmware.  While the original intent was a runner for kvm guests. Relation between kvm guest
 and firmware  is not very clear now. If everyone agree it might be good solution to move secure
 firmware things from virt machine to bsa-ref and make this machine reference for secure boot,
 firmware updates  etc.

 [1] https://github.com/muvarov/arm-trusted-firmware/commit/6d3339a0081f6f2b45d99bd7e1b67bcbce8f4e0e

 Best regards,
 Maxim.

 hw/arm/virt.c         | 9 +++++++++
 include/hw/arm/virt.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e465a988d6..6b77912f02 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -152,6 +152,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
+    [VIRT_EC] =                 { 0x090c0000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -1729,6 +1730,13 @@ static void virt_cpu_post_init(VirtMachineState *vms, int max_cpus,
     }
 }
 
+static void init_ec_controller(VirtMachineState *vms)
+{
+    vms->ec = qdev_new("sbsa-ec");
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(vms->ec), 0, vms->memmap[VIRT_EC].base);
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
@@ -1797,6 +1805,7 @@ static void machvirt_init(MachineState *machine)
      */
     if (vms->secure && firmware_loaded) {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
+        init_ec_controller(vms);
     } else if (vms->virt) {
         vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     } else {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index aad6d69841..6f2ce4e4ff 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -85,6 +85,7 @@ enum {
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
+    VIRT_EC,
     VIRT_LOWMEMMAP_LAST,
 };
 
@@ -163,6 +164,7 @@ struct VirtMachineState {
     DeviceState *gic;
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
+    DeviceState *ec;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.17.1

