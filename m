Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp300829ejb;
        Tue, 10 Oct 2023 00:50:21 -0700 (PDT)
X-Received: by 2002:a17:906:5ac8:b0:9b2:b755:5b94 with SMTP id x8-20020a1709065ac800b009b2b7555b94mr11302547ejs.38.1696924221401;
        Tue, 10 Oct 2023 00:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696924221; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNzeF0ix15yqAHQ/qCT50zRWT2S1CwVExXUJ3w87EI6Y0UUmT1piLAMAUAiEh7V27R
         VYSLYgy9/Qe1vgq9/XOo8JYdlQ26W/NY52+FL8AXdGHdQp1YUryiZE6x74JIA+e+NJZR
         gcxbeS8DRDHt4N1FE8sKkp3m6QO+HkwumMKZaPjfdC1Y22DUeztiHeJWmKUYc/8ODL+c
         vR6CRHKazeBm4kAcUIcMd44IfjKcCwpS9XUCaeaODIK8BexrZ4d18EK1WAYfTJyusI2P
         RcvX3pNdWMqx/CX2Hvdr2llE2RqmyW8tLBdDGrC9TjrH7US+4OkT43fHA/s8aTHt2ylv
         7soA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zHkTGqBrVdowOzimiYZAy4nhJnGIbEuU9/oLP4xBoO4=;
        fh=vZ42y8n3avyo3v9Ib/TiaqszLPgJVdJGoGlb4zlZE8s=;
        b=mFcIzm5o1wOxSSa8DRI1/rfOhefgfyyd862x4MwkKm5RFVARnfGJAvcnX5qGr4qz/R
         wHPa9gfn9kVKw1/x/0oXPkvbcQAdoWosiroMNxw7DswOVrLI1qoU6P+4Q3dMBqakydyW
         SyvwYipKw7Cym80lUCei9CuuzRCM/mr54EOohpJqx/cYiUZwz7QX9RsXy78s7K4rqRre
         rBRVTU6YdZFU1RwgR8H654oOzSjn/fVqs+SJ1rEYj1nrfKA1wZ4dQZkpKJQx5sZNJOXE
         7uNacTDubmG1Ky8arOpTGmnqkBWXsO8J6EiYz4/kHGdOpnc+xvWbr23yzI63q4+a6F1a
         sqKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SqnnzaLf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id eu10-20020a170907298a00b009b85a4478a2sor5887839ejc.0.2023.10.10.00.50.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 00:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SqnnzaLf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696924221; x=1697529021; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHkTGqBrVdowOzimiYZAy4nhJnGIbEuU9/oLP4xBoO4=;
        b=SqnnzaLfG/Ixrf4GVu/FLsb+BH59dffUKqrOkEQGbcCJZMZSCVXp0uYXxUQ09JiNuy
         dhA4ESLtubw05fXb+AwDwYvpOA+0zT7H7/Mb0D7V6i1mg7BNZ9dD0/b89c1GG5SR31Rn
         YkLSg7wi2HTYWMESLDXnuwTxlVGDyNuBqJP+yUF9oSLWBdKhygpT3oUPrHk3cCNhbdk1
         xL4UkPvmdFdQ1q5f5M7J1aRTBJ+0Q9o/5MAidPG26ftCVCSIEJrpXxfXb7Po7X1KrFP2
         wChJn8kLbb9bF7RZZrs+KunrGQ8zGAUjqBlcPhBfZaLW0jW9sFk7M2m6vjMc9KM2oxlh
         FAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696924221; x=1697529021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHkTGqBrVdowOzimiYZAy4nhJnGIbEuU9/oLP4xBoO4=;
        b=A8dNj0aY+M6HdG8ev0zjIRuzXZoSeP0uqgwbe+Y/+5z1bsDfgt6vPA5Ct6QsD+GHcF
         BQiaBObu8rf40eidpWKx3BVX7evmCIV944/3RltQe6G84jsJAY/TvAxIMKL5L5uS/G05
         gwXIDCVWUf6ROKS9szitHMYwXPk/VoGMf1J7De+eAxb0s0i5+nJIwEDsAB5tf5LjmPSX
         2ejqpQxsQ7ib+XxU/zkAurB0Wmg4AJz13tslz6AE3TxtPQmy7MI60mF5AI12bdULKabX
         e2g4ocpepCMmg4SZCQCxJPAcloxId7KwbjwZOCwvh9wJQ0yQ8+tz/mWJibKBnjSFDngI
         zsaw==
X-Gm-Message-State: AOJu0Yx5YpUspP9e94Xu24uBgLq4y4m3MXxLC0QfcjTlggembXQLDkJO
	2xoLDmkkLpNy9tEieIlviTwojbSJ
X-Google-Smtp-Source: AGHT+IGBV1xu7EXLCmP/AvjFlZUZuctWNT4QEk1nU81sUkGz8CnHvzlSPbs42O5EOxrkS7eP2gLANw==
X-Received: by 2002:a17:907:1c1e:b0:9a5:7dec:fab9 with SMTP id nc30-20020a1709071c1e00b009a57decfab9mr12453124ejc.9.1696924220956;
        Tue, 10 Oct 2023 00:50:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id lf8-20020a170906ae4800b00992e14af9c3sm8091519ejb.143.2023.10.10.00.50.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Oct 2023 00:50:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Bandan Das <bsd@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Jeuk Kim <jeuk20.kim@samsung.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Amit Shah <amit@kernel.org>
Subject: [PATCH 4/4] tests/qtest: Use qtest_get_base_arch()
Date: Tue, 10 Oct 2023 09:49:52 +0200
Message-ID: <20231010074952.79165-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010074952.79165-1-philmd@linaro.org>
References: <20231010074952.79165-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1ZNJvrap+eYg

Additionally use qtest_get_arch_bits() when relevant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/ahci-test.c           |  5 ++---
 tests/qtest/am53c974-test.c       |  4 +---
 tests/qtest/bios-tables-test.c    |  6 +++---
 tests/qtest/boot-sector.c         |  6 +++---
 tests/qtest/device-plug-test.c    |  6 ++----
 tests/qtest/drive_del-test.c      | 16 ++++++----------
 tests/qtest/erst-test.c           |  4 +---
 tests/qtest/fuzz-e1000e-test.c    |  4 +---
 tests/qtest/ivshmem-test.c        |  6 +++---
 tests/qtest/libqos/qos_external.c |  6 ++++--
 tests/qtest/lpc-ich9-test.c       |  4 +---
 tests/qtest/m48t59-test.c         |  6 ++----
 tests/qtest/pxe-test.c            |  6 +++---
 tests/qtest/qos-test.c            |  6 ++++--
 tests/qtest/readconfig-test.c     |  6 +-----
 tests/qtest/rtas-test.c           |  4 +---
 tests/qtest/ufs-test.c            |  4 +---
 tests/qtest/usb-hcd-uhci-test.c   |  6 +++---
 tests/qtest/virtio-net-test.c     |  3 +--
 tests/qtest/virtio-rng-test.c     |  4 +---
 20 files changed, 44 insertions(+), 68 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index eea8b5f77b..93d1e14896 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -1835,7 +1835,7 @@ static void create_ahci_io_test(enum IOMode type, enum AddrMode addr,
 
 int main(int argc, char **argv)
 {
-    const char *arch, *base;
+    const char *base;
     int ret;
     int fd;
     int c;
@@ -1867,8 +1867,7 @@ int main(int argc, char **argv)
     }
 
     /* Check architecture */
-    arch = qtest_get_arch();
-    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
+    if (strcmp(qtest_get_base_arch(), "x86")) {
         g_test_message("Skipping test for non-x86");
         return 0;
     }
diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
index ed3ac7db20..dc41182a38 100644
--- a/tests/qtest/am53c974-test.c
+++ b/tests/qtest/am53c974-test.c
@@ -253,11 +253,9 @@ static void test_reset_before_transfer_ok(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
-
     g_test_init(&argc, &argv, NULL);
 
-    if (strcmp(arch, "i386") == 0) {
+    if (!strcmp(qtest_get_base_arch(), "x86") && qtest_get_arch_bits() == 32) {
         qtest_add_func("am53c974/test_cmdfifo_underflow_ok",
                        test_cmdfifo_underflow_ok);
         qtest_add_func("am53c974/test_cmdfifo_underflow2_ok",
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 7e708d78b3..573e7dfcd9 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2044,7 +2044,7 @@ static void test_acpi_virt_oem_fields(void)
 
 int main(int argc, char *argv[])
 {
-    const char *arch = qtest_get_arch();
+    const char *arch = qtest_get_base_arch();
     bool has_kvm, has_tcg;
     char *v_env = getenv("V");
     int ret;
@@ -2063,7 +2063,7 @@ int main(int argc, char *argv[])
         return 0;
     }
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(arch, "x86") == 0) {
         ret = boot_sector_init(disk);
         if (ret) {
             return ret;
@@ -2173,7 +2173,7 @@ int main(int argc, char *argv[])
 #endif
             }
         }
-    } else if (strcmp(arch, "aarch64") == 0) {
+    } else if (strcmp(arch, "arm") == 0 && qtest_get_arch_bits() == 64) {
         if (has_tcg && qtest_has_device("virtio-blk-pci")) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
             qtest_add_func("acpi/virt/acpihmatvirt",
diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
index 679ee17e2a..f13e9a12ff 100644
--- a/tests/qtest/boot-sector.c
+++ b/tests/qtest/boot-sector.c
@@ -90,7 +90,7 @@ int boot_sector_init(char *fname)
     int fd, ret;
     size_t len;
     char *boot_code;
-    const char *arch = qtest_get_arch();
+    const char *arch = qtest_get_base_arch();
 
     fd = mkstemp(fname);
     if (fd < 0) {
@@ -98,12 +98,12 @@ int boot_sector_init(char *fname)
         return 1;
     }
 
-    if (g_str_equal(arch, "i386") || g_str_equal(arch, "x86_64")) {
+    if (g_str_equal(arch, "x86")) {
         /* Q35 requires a minimum 0x7e000 bytes disk (bug or feature?) */
         len = MAX(0x7e000, sizeof(x86_boot_sector));
         boot_code = g_malloc0(len);
         memcpy(boot_code, x86_boot_sector, sizeof(x86_boot_sector));
-    } else if (g_str_equal(arch, "ppc64")) {
+    } else if (g_str_equal(arch, "ppc") && qtest_get_arch_bits() == 64) {
         /* For Open Firmware based system, use a Forth script */
         boot_code = g_strdup_printf("\\ Bootscript\n%x %x c! %x %x c!\n",
                                     LOW(SIGNATURE), SIGNATURE_ADDR,
diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index c6f33153eb..59153e3493 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -65,7 +65,6 @@ static void process_device_remove(QTestState *qtest, const char *id)
 static void test_pci_unplug_request(void)
 {
     QTestState *qtest;
-    const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
     if (!qtest_has_device("virtio-mouse-pci")) {
@@ -73,7 +72,7 @@ static void test_pci_unplug_request(void)
         return;
     }
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(qtest_get_base_arch(), "x86") == 0) {
         machine_addition = "-machine pc";
     }
 
@@ -107,7 +106,6 @@ static void test_q35_pci_unplug_request(void)
 static void test_pci_unplug_json_request(void)
 {
     QTestState *qtest;
-    const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
     if (!qtest_has_device("virtio-mouse-pci")) {
@@ -115,7 +113,7 @@ static void test_pci_unplug_json_request(void)
         return;
     }
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(qtest_get_base_arch(), "x86") == 0) {
         machine_addition = "-machine pc";
     }
 
diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 8a6f3ac963..ccc42acce9 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -125,9 +125,9 @@ static void drive_del(QTestState *qts)
  */
 static const char *qvirtio_get_dev_type(void)
 {
-    const char *arch = qtest_get_arch();
+    const char *arch = qtest_get_base_arch();
 
-    if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
+    if (g_str_equal(arch, "arm")) {
         return "device";  /* for virtio-mmio */
     } else if (g_str_equal(arch, "s390x")) {
         return "ccw";
@@ -249,7 +249,6 @@ static void test_drive_del_device_del(void)
 static void test_cli_device_del(void)
 {
     QTestState *qts;
-    const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
     if (!has_device_builtin("virtio-blk")) {
@@ -257,7 +256,7 @@ static void test_cli_device_del(void)
         return;
     }
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(qtest_get_base_arch(), "x86") == 0) {
         machine_addition = "-machine pc";
     }
 
@@ -323,7 +322,6 @@ static void test_empty_device_del(void)
 static void test_device_add_and_del(void)
 {
     QTestState *qts;
-    const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
     if (!has_device_builtin("virtio-blk")) {
@@ -331,7 +329,7 @@ static void test_device_add_and_del(void)
         return;
     }
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(qtest_get_base_arch(), "x86") == 0) {
         machine_addition = "-machine pc";
     }
 
@@ -394,7 +392,6 @@ static void test_device_add_and_del_q35(void)
 static void test_drive_add_device_add_and_del(void)
 {
     QTestState *qts;
-    const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
     if (!has_device_builtin("virtio-blk")) {
@@ -402,7 +399,7 @@ static void test_drive_add_device_add_and_del(void)
         return;
     }
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(qtest_get_base_arch(), "x86") == 0) {
         machine_addition = "-machine pc";
     }
 
@@ -447,7 +444,6 @@ static void test_drive_add_device_add_and_del_q35(void)
 static void test_blockdev_add_device_add_and_del(void)
 {
     QTestState *qts;
-    const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
     if (!has_device_builtin("virtio-blk")) {
@@ -455,7 +451,7 @@ static void test_blockdev_add_device_add_and_del(void)
         return;
     }
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(qtest_get_base_arch(), "x86") == 0) {
         machine_addition = "-machine pc";
     }
 
diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
index c45bee7f05..8d3665b82c 100644
--- a/tests/qtest/erst-test.c
+++ b/tests/qtest/erst-test.c
@@ -95,9 +95,7 @@ static void cleanup_vm(ERSTState *s)
 
 static void setup_vm_cmd(ERSTState *s, const char *cmd)
 {
-    const char *arch = qtest_get_arch();
-
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(qtest_get_base_arch(), "x86") == 0) {
         s->qs = qtest_pc_boot("%s", cmd);
     } else {
         g_printerr("erst-test tests are only available on x86\n");
diff --git a/tests/qtest/fuzz-e1000e-test.c b/tests/qtest/fuzz-e1000e-test.c
index 5052883fb6..a8d3596f2c 100644
--- a/tests/qtest/fuzz-e1000e-test.c
+++ b/tests/qtest/fuzz-e1000e-test.c
@@ -40,11 +40,9 @@ static void test_lp1879531_eth_get_rss_ex_dst_addr(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
-
     g_test_init(&argc, &argv, NULL);
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(qtest_get_base_arch(), "x86") == 0) {
         qtest_add_func("fuzz/test_lp1879531_eth_get_rss_ex_dst_addr",
                        test_lp1879531_eth_get_rss_ex_dst_addr);
     }
diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index 9bf8e78df6..32024d9243 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -397,9 +397,9 @@ static void test_ivshmem_hotplug_q35(void)
 static void test_ivshmem_hotplug(void)
 {
     QTestState *qts;
-    const char *arch = qtest_get_arch();
+    const char *arch = qtest_get_base_arch();
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(arch, "x86") == 0) {
         qts = qtest_init("-object memory-backend-ram,size=1M,id=mb1"
                          " -machine pc");
     } else {
@@ -409,7 +409,7 @@ static void test_ivshmem_hotplug(void)
     qtest_qmp_device_add(qts, "ivshmem-plain", "iv1",
                          "{'addr': %s, 'memdev': 'mb1'}",
                          stringify(PCI_SLOT_HP));
-    if (strcmp(arch, "ppc64") != 0) {
+    if (strcmp(arch, "ppc") != 0 && qtest_get_arch_bits() == 64) {
         qpci_unplug_acpi_device_test(qts, "iv1", PCI_SLOT_HP);
     }
 
diff --git a/tests/qtest/libqos/qos_external.c b/tests/qtest/libqos/qos_external.c
index c6bb8bff09..f01bb17628 100644
--- a/tests/qtest/libqos/qos_external.c
+++ b/tests/qtest/libqos/qos_external.c
@@ -31,10 +31,12 @@
 
 static void machine_apply_to_node(const char *name)
 {
-    char *machine_name = g_strconcat(qtest_get_arch(), "/", name, NULL);
+    g_autofree char *machine_name = g_strdup_printf("%s/%u/%s",
+                                                    qtest_get_base_arch(),
+                                                    qtest_get_arch_bits(),
+                                                    name);
 
     qos_graph_node_set_availability(machine_name, true);
-    g_free(machine_name);
 }
 
 void machines_apply_to_node(MachineInfoList *mach_info)
diff --git a/tests/qtest/lpc-ich9-test.c b/tests/qtest/lpc-ich9-test.c
index 8ac95b89f7..9f27591b74 100644
--- a/tests/qtest/lpc-ich9-test.c
+++ b/tests/qtest/lpc-ich9-test.c
@@ -28,11 +28,9 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
-
     g_test_init(&argc, &argv, NULL);
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(qtest_get_base_arch(), "x86") == 0) {
         qtest_add_func("ich9/test_lp1878642_pci_bus_get_irq_level_assert",
                        test_lp1878642_pci_bus_get_irq_level_assert);
     }
diff --git a/tests/qtest/m48t59-test.c b/tests/qtest/m48t59-test.c
index b9cd209165..3579effdf4 100644
--- a/tests/qtest/m48t59-test.c
+++ b/tests/qtest/m48t59-test.c
@@ -239,15 +239,13 @@ static void fuzz_registers(void)
 
 static void base_setup(void)
 {
-    const char *arch = qtest_get_arch();
-
-    if (g_str_equal(arch, "sparc")) {
+    if (g_str_equal(qtest_get_arch(), "sparc")) {
         /* Note: For sparc64, we'd need to map-in the PCI bridge memory first */
         base = 0x71200000;
         base_year = 1968;
         base_machine = "SS-5";
         use_mmio = true;
-    } else if (g_str_equal(arch, "ppc") || g_str_equal(arch, "ppc64")) {
+    } else if (g_str_equal(qtest_get_base_arch(), "ppc")) {
         base = 0xF0000000;
         base_year = 1968;
         base_machine = "ref405ep";
diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
index e4b48225a5..5112bceb76 100644
--- a/tests/qtest/pxe-test.c
+++ b/tests/qtest/pxe-test.c
@@ -129,7 +129,7 @@ static void test_batch(const testdef_t *tests, bool ipv6)
 int main(int argc, char *argv[])
 {
     int ret;
-    const char *arch = qtest_get_arch();
+    const char *arch = qtest_get_base_arch();
 
     g_test_init(&argc, &argv, NULL);
 
@@ -143,12 +143,12 @@ int main(int argc, char *argv[])
         return ret;
 
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(arch, "x86") == 0) {
         test_batch(x86_tests, false);
         if (g_test_slow()) {
             test_batch(x86_tests_slow, false);
         }
-    } else if (strcmp(arch, "ppc64") == 0) {
+    } else if (strcmp(arch, "ppc") == 0 && qtest_get_arch_bits() == 64) {
         test_batch(ppc64_tests, g_test_slow());
         if (g_test_slow()) {
             test_batch(ppc64_tests_slow, true);
diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index 5da4091ec3..5271582f6a 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -293,8 +293,10 @@ static void walk_path(QOSGraphNode *orig_path, int len)
     path_vec[0] = g_string_free(cmd_line, false);
 
     if (path->u.test.subprocess) {
-        gchar *subprocess_path = g_strdup_printf("/%s/%s/subprocess",
-                                                 qtest_get_arch(), path_str);
+        gchar *subprocess_path = g_strdup_printf("/%s/%u/%s/subprocess",
+                                                 qtest_get_base_arch(),
+                                                 qtest_get_arch_bits(),
+                                                 path_str);
         qtest_add_data_func(path_str, subprocess_path, subprocess_run_one_test);
         g_test_add_data_func(subprocess_path, path_vec, run_one_test);
     } else {
diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
index 760f974e63..7837997c6f 100644
--- a/tests/qtest/readconfig-test.c
+++ b/tests/qtest/readconfig-test.c
@@ -382,13 +382,9 @@ static void test_docs_q35_virtio_serial(void)
 
 int main(int argc, char *argv[])
 {
-    const char *arch;
     g_test_init(&argc, &argv, NULL);
 
-    arch = qtest_get_arch();
-
-    if (g_str_equal(arch, "i386") ||
-        g_str_equal(arch, "x86_64")) {
+    if (g_str_equal(qtest_get_base_arch(), "x86")) {
         qtest_add_func("readconfig/x86/memdev", test_x86_memdev);
         if (qtest_has_device("ich9-usb-ehci1") &&
             qtest_has_device("ich9-usb-uhci1")) {
diff --git a/tests/qtest/rtas-test.c b/tests/qtest/rtas-test.c
index 1ba42b37d2..26c8e8e926 100644
--- a/tests/qtest/rtas-test.c
+++ b/tests/qtest/rtas-test.c
@@ -36,11 +36,9 @@ static void test_rtas_get_time_of_day_vof(void)
 
 int main(int argc, char *argv[])
 {
-    const char *arch = qtest_get_arch();
-
     g_test_init(&argc, &argv, NULL);
 
-    if (strcmp(arch, "ppc64")) {
+    if (strcmp(qtest_get_base_arch(), "ppc") && qtest_get_arch_bits() != 64) {
         g_printerr("RTAS requires qemu-system-ppc64\n");
         exit(EXIT_FAILURE);
     }
diff --git a/tests/qtest/ufs-test.c b/tests/qtest/ufs-test.c
index ed3dbca154..5a5b10b520 100644
--- a/tests/qtest/ufs-test.c
+++ b/tests/qtest/ufs-test.c
@@ -552,7 +552,6 @@ static void *ufs_blk_test_setup(GString *cmd_line, void *arg)
 
 static void ufs_register_nodes(void)
 {
-    const char *arch;
     QOSGraphEdgeOptions edge_opts = {
         .before_cmd_line = "-blockdev null-co,node-name=drv0,read-zeroes=on",
         .after_cmd_line = "-device ufs-lu,bus=ufs0,drive=drv0,lun=0",
@@ -575,8 +574,7 @@ static void ufs_register_nodes(void)
      * Check architecture
      * TODO: Enable ufs io tests for ppc64
      */
-    arch = qtest_get_arch();
-    if (!strcmp(arch, "ppc64")) {
+    if (!strcmp(qtest_get_base_arch(), "ppc") && qtest_get_arch_bits() == 64) {
         g_test_message("Skipping ufs io tests for ppc64");
         return;
     }
diff --git a/tests/qtest/usb-hcd-uhci-test.c b/tests/qtest/usb-hcd-uhci-test.c
index 4446555f08..144a5541f0 100644
--- a/tests/qtest/usb-hcd-uhci-test.c
+++ b/tests/qtest/usb-hcd-uhci-test.c
@@ -53,7 +53,7 @@ static void test_usb_storage_hotplug(void)
 
 int main(int argc, char **argv)
 {
-    const char *arch = qtest_get_arch();
+    const char *arch = qtest_get_base_arch();
     const char *cmd = "-device piix3-usb-uhci,id=uhci,addr=1d.0"
                       " -drive id=drive0,if=none,file=null-co://,"
                       "file.read-zeroes=on,format=raw"
@@ -73,9 +73,9 @@ int main(int argc, char **argv)
         qtest_add_func("/uhci/pci/hotplug/usb-storage", test_usb_storage_hotplug);
     }
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(arch, "x86") == 0) {
         qs = qtest_pc_boot("%s", cmd);
-    } else if (strcmp(arch, "ppc64") == 0) {
+    } else if (strcmp(arch, "ppc") == 0 && qtest_get_arch_bits() == 64) {
         qs = qtest_spapr_boot("%s", cmd);
     } else {
         g_printerr("usb-hcd-uhci-test tests are only "
diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index fab5dd8b05..c37fe36af6 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -169,7 +169,6 @@ static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtioPCIDevice *dev = obj;
     QTestState *qts = dev->pdev->bus->qts;
-    const char *arch = qtest_get_arch();
 
     if (dev->pdev->bus->not_hotpluggable) {
         g_test_skip("pci bus does not support hotplug");
@@ -179,7 +178,7 @@ static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     qtest_qmp_device_add(qts, "virtio-net-pci", "net1",
                          "{'addr': %s}", stringify(PCI_SLOT_HP));
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(qtest_get_base_arch(), "x86") == 0) {
         qpci_unplug_acpi_device_test(qts, "net1", PCI_SLOT_HP);
     }
 }
diff --git a/tests/qtest/virtio-rng-test.c b/tests/qtest/virtio-rng-test.c
index 64e131cd8c..173f42ff7b 100644
--- a/tests/qtest/virtio-rng-test.c
+++ b/tests/qtest/virtio-rng-test.c
@@ -25,12 +25,10 @@ static void rng_hotplug(void *obj, void *data, QGuestAllocator *alloc)
         return;
     }
 
-    const char *arch = qtest_get_arch();
-
     qtest_qmp_device_add(qts, "virtio-rng-pci", "rng1",
                          "{'addr': %s}", stringify(PCI_SLOT_HP));
 
-    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+    if (strcmp(qtest_get_base_arch(), "x86") == 0) {
         qpci_unplug_acpi_device_test(qts, "rng1", PCI_SLOT_HP);
     }
 }
-- 
2.41.0
