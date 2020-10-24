Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1629787lfa;
        Sat, 24 Oct 2020 14:52:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqwXBCdeaPRV5hZT8s9DirOi5qsQXtgbaCpdbFVsxkWqCkBS8MvKaGqKZHc2RZW9Dck/5/
X-Received: by 2002:ac8:7517:: with SMTP id u23mr9523994qtq.261.1603576358992;
        Sat, 24 Oct 2020 14:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603576358; cv=none;
        d=google.com; s=arc-20160816;
        b=t/2uXsHra3TxNZ0qNk0eNXP3/ABGrO7rWv1+AzF4GcCv2KTg+MBrZ83QyoewEGI7BE
         ESZLNmbgO4ZZD3ayZE4NKhHHuRGe8FvkoS6ZktOiVWo26YaKdQp2+ESZWUQMJIVVG0gR
         aUE8LhPx7gCUOWo+u3Nx9WWSnB3CX1dBImYbyim6FF99j8QfnFO5xf8n+Ekmjqv59Zhw
         tq70p+BnXZ8X2EQznH2oWPcwqzbcoDjh80JnJrllUO3CdznWdIf4MV4c07JsfxihmPGV
         abtmofxVwRGunHzb8Wb9yw/5eMaMf9z2vUXGWpeis1x/hAFpHejls3XGtRny5nwFcDLa
         tDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=1YMyM0uvJjng4NpdrtrASF2qdl8mCrwPAZo1XEhle8s=;
        b=j1pVvRzKxL1bMRDpq+oPISFXFMgP3Z1wwB8wp6nH3RX4R9G+FH24M9qlYfQUv66cXh
         StWCdapxk0UA6VRY2n1rdq0RQwMHI3Bz9VuAEBWc0RIrkTy6EN6pGVw7IL0dkIp/2B6B
         BjQFwDZ2ZHGfnqbqceolftpaq4h3lcOIjvTuvjKtnvGXas+oHp79D7fSFKf+P60IxobJ
         r/qo0bJl+EZn/sf7oBGZi54jWg4JfTFDv1TDSgE3y+HyfSOcf83S6zC4s9vnaPmmaBkW
         foiCT2TbcH7m2wGBsVAGt4tMSn7HZ+45nyD7LpOxUqL7IgqEDH8vYH9ZRrQTrnjrRyhF
         o38g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="s/bqX5iv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d132si3477301qkg.182.2020.10.24.14.52.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Oct 2020 14:52:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="s/bqX5iv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kWRSo-0006EC-Bj
	for alex.bennee@linaro.org; Sat, 24 Oct 2020 17:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1kWRSL-0006E3-Kq; Sat, 24 Oct 2020 17:52:09 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:43211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1kWRSJ-0004QI-KK; Sat, 24 Oct 2020 17:52:09 -0400
Received: by mail-ej1-x642.google.com with SMTP id k3so7678261ejj.10;
 Sat, 24 Oct 2020 14:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1YMyM0uvJjng4NpdrtrASF2qdl8mCrwPAZo1XEhle8s=;
 b=s/bqX5ivU+/mRvi0lvbLoCGklUn06GVxI/CtpHNFHuirEUI3AoS/Myf0isGfSEeSMx
 +2LhF2fZOjrxxBwzDHMGfJAbLxj8Wr67t6HIYkFmJ89U5mD+xcjBDCO0pt+r3O4maXvm
 0P22EEV+s4lAYZSU1bA79Bx/dc/8XA5UFiEobSDMYPdQC1o/zzJrX0opo4ReNaUQRucJ
 tdqnHMcLuftlBgSztCmS6L64rSxDI+n7kEKsGriSyVT1xia/T4JCs0pVA03djqk7GE80
 hcqvBTsTmcn9spWA7aEM60KXG2iukb7trBcXw0DYy64qrFla+AFqlSg5cR6fzjoh6YVL
 U7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1YMyM0uvJjng4NpdrtrASF2qdl8mCrwPAZo1XEhle8s=;
 b=roN7thQO95CgToaJnKUCkRdro1TjSyk+atj//5g6rIvMIYKcNAkmd9/jyVH+kPN5/+
 L4Bwci7oESn75W++p6tZ/th9ga6XaO5VK1BNpI9FHF2XeZAOd7OitcLy2yKWzm7sHuj+
 ioMRfBR9sCtf/pS3HEqKLrJJC/GoH/dXvndf9PSLypK2vUj4eLlF1SpNsP4F4BXT3HyJ
 D6tBdSpmBLSZDWJ570ki3V5y1IYkASCPOetq4OnUrIPJuoOgKsD5mDGUlZn1Vrkv8ei4
 xORAGiz+w7N0p+s5YEo9qv326hZ4LADsoTUW4wC13IjgbVnJIOgEvbuFc0QMtnKdrdP/
 3rQw==
X-Gm-Message-State: AOAM533MYMG2cb2D2m06XuhF4xfzrrgQKUrC2W8TZ7CEzDBE1SKEhAnm
 1LzV7sgpYyFIkfC+lU2EVTGt5fUkPv6p3RQh
X-Received: by 2002:a17:906:f205:: with SMTP id
 gt5mr8503691ejb.48.1603576325356; 
 Sat, 24 Oct 2020 14:52:05 -0700 (PDT)
Received: from tuf.home (2a02-a456-6be8-1-74b3-9e98-3c9c-45ea.fixed6.kpn.net.
 [2a02:a456:6be8:1:74b3:9e98:3c9c:45ea])
 by smtp.gmail.com with ESMTPSA id r4sm2669322edv.16.2020.10.24.14.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2020 14:52:04 -0700 (PDT)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: expand Orange Pi PC SD images for NetBSD,
 Armbian above nearest power of two
Date: Sat, 24 Oct 2020 23:52:00 +0200
Message-Id: <20201024215200.494209-1-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, philmd@redhat.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I0WVbdnGs5IJ

The acceptance tests for the Orange Pi PC need to expand the SD card images
to a size which is a power of two. As Qemu uses the size of the SD image file
as well for the size of the emulated SD card, this can sometimes give problems
for guests that assume a certain minimum size of the SD card.

This commit resolves the following acceptance test error for the NetBSD 9.0 test
of the Orange Pi PC by increasing the size of the expanded SD card image to two times
the nearest power of two:

   (5/5) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9: |console: U-Boot SPL 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000)
  console: DRAM: 1024 MiB
  console: Failed to set core voltage! Can't set CPU frequency
  /console: Trying to boot from MMC1
  console: U-Boot 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000) Allwinner Technology
  ...
  console: Starting kernel ...
  console: [   1.0000000] NetBSD/evbarm (fdt) booting ...
  ...
  console: [   1.3300167] sdmmc0: SD card status: 4-bit, C0
  console: [   1.3300167] ld0 at sdmmc0: <0xaa:0x5859:QEMU!:0x01:0xdeadbeef:0x062>
  console: [   1.3430678] ld0: 1024 MB, 1040 cyl, 32 head, 63 sec, 512 bytes/sect x 2097152 sectors
  console: [   1.4102580] ld0: 4-bit width, High-Speed/SDR25, 50.000 MHz
  console: [   2.0674392] WARNING: 4 errors while detecting hardware; check system log.
  console: [   2.0674392] boot device: ld0
  console: [   2.0775401] root on ld0a dumps on ld0b
  console: [   2.0977679] vfs_mountroot: can't open root device
  console: [   2.0977679] cannot mount root, error = 6
  INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Based-on: ("[RFC PATCH 0/4] tests/acceptance: Test U-Boot/Linux from Armbian 20.08 on Orange Pi PC")
---
 tests/acceptance/boot_linux_console.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index b604cfe7da..40835904bb 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -35,11 +35,11 @@ def pow2ceil(x):
     return 1 if x == 0 else 2**(x - 1).bit_length()
 
 """
-Expand file size to next power of 2
+Expand file size to next power of 2 or higher
 """
-def image_pow2ceil_expand(path):
+def image_pow2ceil_expand(path, multiply_factor = 1):
         size = os.path.getsize(path)
-        size_aligned = pow2ceil(size)
+        size_aligned = pow2ceil(size) * multiply_factor
         if size != size_aligned:
             with open(path, 'ab+') as fd:
                 fd.truncate(size_aligned)
@@ -850,7 +850,7 @@ class BootLinuxConsole(LinuxKernelTest):
         image_path_xz = self.fetch_asset(image_url, asset_hash=image_hash,
                                          algorithm='sha256')
         image_path = archive.extract(image_path_xz, self.workdir)
-        image_pow2ceil_expand(image_path)
+        image_pow2ceil_expand(image_path, 2)
 
         self.do_test_arm_orangepi_uboot_armbian(image_path)
 
@@ -879,7 +879,7 @@ class BootLinuxConsole(LinuxKernelTest):
         image_path_gz = self.fetch_asset(image_url, asset_hash=image_hash)
         image_path = os.path.join(self.workdir, 'armv7.img')
         archive.gzip_uncompress(image_path_gz, image_path)
-        image_pow2ceil_expand(image_path)
+        image_pow2ceil_expand(image_path, 2)
         image_drive_args = 'if=sd,format=raw,snapshot=on,file=' + image_path
 
         # dd if=u-boot-sunxi-with-spl.bin of=armv7.img bs=1K seek=8 conv=notrunc
-- 
2.25.1

