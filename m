Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1437812lfc;
        Tue, 3 Dec 2019 04:30:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMk/kmjaFn7WhDkDbQnnFM4SrfP2UVBpB5hEDoA5NWE5DaQhy31MRMBhKDhcaDP1oBp+Y0
X-Received: by 2002:ac8:37b6:: with SMTP id d51mr4817463qtc.261.1575376259754;
        Tue, 03 Dec 2019 04:30:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575376259; cv=none;
        d=google.com; s=arc-20160816;
        b=BZkMxUIqsCEVi+yooTL+P5yL6ZVA49y5jBPgoj8W1zEYF8jkwYgX3HHOPnN6uMgMKW
         ggDY9VSd/9y1hU1PBLEwlLXvy2IIGhabRymu19RwQyvN37GHxMxW3aAtVZmytQktzWIa
         se2bHjRZhSIzfDXKQSb0bAdPdnirlP9nhGNnWhK9qoAThDGHl1cT0yp2DXN1HtYmfNJV
         JawxlPXbKYNzX7PkEYIvi3WmTNquSIkRl04DU83f+apKpQzCORNiO5uhsrtTP4w+6ZXE
         iavZjJQghyPK5WzaY5MsKt9JD5JiJRkAcY/3i1XU+SVdhcdpJT4fweh6fk4TAJyxoV/X
         kAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=UDhkWXygTdd4UtMjORj7KrB9LtcS3bpO4dmgFS2gnsQ=;
        b=sdyliZrxctPZlJCyngznpjYyKs5mFN6+AkiZqHO+C2hn6TR5aqTl3d243VANOFdD1G
         uOKhDL77illlhJHPGJGz5UdXcCooBYMiR5+fv9YCCeKKgy9p+XcCbXaFZbpBcZvMFsq7
         SaoEyZUGT8lNdh+IjdEYQluW8bMty0Oq+83KOSynUz2KDBU8fvjW66xRoAvwNfhTHeAO
         gjcUCLDmYIyacJGVaMCYbfHoGhboW1g2aC2aqPCuwrtuW5k1vABN0Rov2xRff4fisP9r
         Y+FyGPErY6dgvqjz0340rdbb9o91DqO583rmKc+WU9Z1gb2ymZpFCcYwecdl9cU6ptY3
         MQ8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si2030617ejw.65.2019.12.03.04.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 04:30:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic7KQ-00084L-7I
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 07:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48713)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JJ-00082t-8f
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JG-0003be-JU
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 07:29:44 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:40890 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1ic7JD-0003QB-PK; Tue, 03 Dec 2019 07:29:41 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7C2628850E3415A8B2D3;
 Tue,  3 Dec 2019 20:29:31 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Dec 2019 20:29:22 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
To: <peter.maydell@linaro.org>, <thuth@redhat.com>, <lvivier@redhat.com>
Subject: [PATCH 1/5] tests: fw_cfg: Rename pc_fw_cfg_* to fw_cfg_*
Date: Tue, 3 Dec 2019 20:27:49 +0800
Message-ID: <20191203122753.19792-2-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191203122753.19792-1-zhengxiang9@huawei.com>
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kraxel@redhat.com, wanghaibin.wang@huawei.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xt4lbUx6rLjZ

Rename pc_fw_cfg_* to fw_cfg_* to make them common for other
architectures so that we can run fw_cfg tests on aarch64.

Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 tests/fw_cfg-test.c      | 48 ++++++++++++++++++++--------------------
 tests/hd-geo-test.c      |  6 ++---
 tests/libqos/fw_cfg.h    | 20 +++++++++++++----
 tests/libqos/malloc-pc.c |  4 ++--
 4 files changed, 45 insertions(+), 33 deletions(-)

diff --git a/tests/fw_cfg-test.c b/tests/fw_cfg-test.c
index 5dc807ba23..5a5342fa9d 100644
--- a/tests/fw_cfg-test.c
+++ b/tests/fw_cfg-test.c
@@ -30,13 +30,13 @@ static void test_fw_cfg_signature(void)
     char buf[5];
 
     s = qtest_init("");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     qfw_cfg_get(fw_cfg, FW_CFG_SIGNATURE, buf, 4);
     buf[4] = 0;
 
     g_assert_cmpstr(buf, ==, "QEMU");
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 }
 
@@ -47,12 +47,12 @@ static void test_fw_cfg_id(void)
     uint32_t id;
 
     s = qtest_init("");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     id = qfw_cfg_get_u32(fw_cfg, FW_CFG_ID);
     g_assert((id == 1) ||
              (id == 3));
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 }
 
@@ -68,12 +68,12 @@ static void test_fw_cfg_uuid(void)
     };
 
     s = qtest_init("-uuid 4600cb32-38ec-4b2f-8acb-81c6ea54f2d8");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     qfw_cfg_get(fw_cfg, FW_CFG_UUID, buf, 16);
     g_assert(memcmp(buf, uuid, sizeof(buf)) == 0);
 
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 
 }
@@ -84,11 +84,11 @@ static void test_fw_cfg_ram_size(void)
     QTestState *s;
 
     s = qtest_init("");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u64(fw_cfg, FW_CFG_RAM_SIZE), ==, ram_size);
 
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 }
 
@@ -98,11 +98,11 @@ static void test_fw_cfg_nographic(void)
     QTestState *s;
 
     s = qtest_init("");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_NOGRAPHIC), ==, 0);
 
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 }
 
@@ -112,11 +112,11 @@ static void test_fw_cfg_nb_cpus(void)
     QTestState *s;
 
     s = qtest_init("");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_NB_CPUS), ==, nb_cpus);
 
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 }
 
@@ -126,10 +126,10 @@ static void test_fw_cfg_max_cpus(void)
     QTestState *s;
 
     s = qtest_init("");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_MAX_CPUS), ==, max_cpus);
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 }
 
@@ -141,7 +141,7 @@ static void test_fw_cfg_numa(void)
     uint64_t *node_mask;
 
     s = qtest_init("");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u64(fw_cfg, FW_CFG_NUMA), ==, nb_nodes);
 
@@ -158,7 +158,7 @@ static void test_fw_cfg_numa(void)
 
     g_free(node_mask);
     g_free(cpu_mask);
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 }
 
@@ -168,10 +168,10 @@ static void test_fw_cfg_boot_menu(void)
     QTestState *s;
 
     s = qtest_init("");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     g_assert_cmpint(qfw_cfg_get_u16(fw_cfg, FW_CFG_BOOT_MENU), ==, boot_menu);
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 }
 
@@ -183,14 +183,14 @@ static void test_fw_cfg_reboot_timeout(void)
     size_t filesize;
 
     s = qtest_init("-boot reboot-timeout=15");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     filesize = qfw_cfg_get_file(fw_cfg, "etc/boot-fail-wait",
                                 &reboot_timeout, sizeof(reboot_timeout));
     g_assert_cmpint(filesize, ==, sizeof(reboot_timeout));
     reboot_timeout = le32_to_cpu(reboot_timeout);
     g_assert_cmpint(reboot_timeout, ==, 15);
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 }
 
@@ -203,14 +203,14 @@ static void test_fw_cfg_no_reboot_timeout(void)
 
     /* Special value -1 means "don't reboot" */
     s = qtest_init("-boot reboot-timeout=-1");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     filesize = qfw_cfg_get_file(fw_cfg, "etc/boot-fail-wait",
                                 &reboot_timeout, sizeof(reboot_timeout));
     g_assert_cmpint(filesize, ==, sizeof(reboot_timeout));
     reboot_timeout = le32_to_cpu(reboot_timeout);
     g_assert_cmpint(reboot_timeout, ==, UINT32_MAX);
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 }
 
@@ -222,14 +222,14 @@ static void test_fw_cfg_splash_time(void)
     size_t filesize;
 
     s = qtest_init("-boot splash-time=12");
-    fw_cfg = pc_fw_cfg_init(s);
+    fw_cfg = fw_cfg_init(s);
 
     filesize = qfw_cfg_get_file(fw_cfg, "etc/boot-menu-wait",
                                 &splash_time, sizeof(splash_time));
     g_assert_cmpint(filesize, ==, sizeof(splash_time));
     splash_time = le16_to_cpu(splash_time);
     g_assert_cmpint(splash_time, ==, 12);
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
     qtest_quit(s);
 }
 
diff --git a/tests/hd-geo-test.c b/tests/hd-geo-test.c
index 7e86c5416c..a9b8a07403 100644
--- a/tests/hd-geo-test.c
+++ b/tests/hd-geo-test.c
@@ -693,7 +693,7 @@ static void test_override(TestArgs *args, CHSResult expected[])
     joined_args = g_strjoinv(" ", args->argv);
 
     qts = qtest_init(joined_args);
-    fw_cfg = pc_fw_cfg_init(qts);
+    fw_cfg = fw_cfg_init(qts);
 
     read_bootdevices(fw_cfg, expected);
 
@@ -829,7 +829,7 @@ static void test_override_scsi_hot_unplug(void)
     joined_args = g_strjoinv(" ", args->argv);
 
     qts = qtest_init(joined_args);
-    fw_cfg = pc_fw_cfg_init(qts);
+    fw_cfg = fw_cfg_init(qts);
 
     read_bootdevices(fw_cfg, expected);
 
@@ -889,7 +889,7 @@ static void test_override_virtio_hot_unplug(void)
     joined_args = g_strjoinv(" ", args->argv);
 
     qts = qtest_init(joined_args);
-    fw_cfg = pc_fw_cfg_init(qts);
+    fw_cfg = fw_cfg_init(qts);
 
     read_bootdevices(fw_cfg, expected);
 
diff --git a/tests/libqos/fw_cfg.h b/tests/libqos/fw_cfg.h
index 13325cc4ff..708aa922ed 100644
--- a/tests/libqos/fw_cfg.h
+++ b/tests/libqos/fw_cfg.h
@@ -39,14 +39,26 @@ void mm_fw_cfg_uninit(QFWCFG *fw_cfg);
 QFWCFG *io_fw_cfg_init(QTestState *qts, uint16_t base);
 void io_fw_cfg_uninit(QFWCFG *fw_cfg);
 
-static inline QFWCFG *pc_fw_cfg_init(QTestState *qts)
+static inline QFWCFG *fw_cfg_init(QTestState *qts)
 {
-    return io_fw_cfg_init(qts, 0x510);
+    const char *arch = qtest_get_arch();
+
+    if (!strcmp(arch, "aarch64")) {
+        return mm_fw_cfg_init(qts, 0x09020000);
+    } else {
+        return io_fw_cfg_init(qts, 0x510);
+    }
 }
 
-static inline void pc_fw_cfg_uninit(QFWCFG *fw_cfg)
+static inline void fw_cfg_uninit(QFWCFG *fw_cfg)
 {
-    io_fw_cfg_uninit(fw_cfg);
+    const char *arch = qtest_get_arch();
+
+    if (!strcmp(arch, "aarch64")) {
+        mm_fw_cfg_uninit(fw_cfg);
+    } else {
+        io_fw_cfg_uninit(fw_cfg);
+    }
 }
 
 #endif
diff --git a/tests/libqos/malloc-pc.c b/tests/libqos/malloc-pc.c
index 6f92ce4135..5c58bf6e88 100644
--- a/tests/libqos/malloc-pc.c
+++ b/tests/libqos/malloc-pc.c
@@ -23,11 +23,11 @@
 void pc_alloc_init(QGuestAllocator *s, QTestState *qts, QAllocOpts flags)
 {
     uint64_t ram_size;
-    QFWCFG *fw_cfg = pc_fw_cfg_init(qts);
+    QFWCFG *fw_cfg = fw_cfg_init(qts);
 
     ram_size = qfw_cfg_get_u64(fw_cfg, FW_CFG_RAM_SIZE);
     alloc_init(s, flags, 1 << 20, MIN(ram_size, 0xE0000000), PAGE_SIZE);
 
     /* clean-up */
-    pc_fw_cfg_uninit(fw_cfg);
+    fw_cfg_uninit(fw_cfg);
 }
-- 
2.19.1


