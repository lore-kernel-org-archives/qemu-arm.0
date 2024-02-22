Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp230679ejf;
        Thu, 22 Feb 2024 14:24:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqLD0HtzgkozvhQ70yRwqjxzCbabxs5XCi1YaTuJlh/7OpLOohTGGT/IhFCEZsYRmVd3q9ZTvqzsFeDtUWM8LztqjvsVZY
X-Received: by 2002:a17:902:ced1:b0:1dc:1df6:48d3 with SMTP id d17-20020a170902ced100b001dc1df648d3mr560267plg.17.1708640677207;
        Thu, 22 Feb 2024 14:24:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708640677; cv=none;
        d=google.com; s=arc-20160816;
        b=MMpVW8He0k9IGiKDVBHxuwYEadUh4D1k8RJPDSq6Q+ssg+lFwJa9RiEzNyLxo4uxkf
         6eIaEc7lBg756EL2nEflX9RfqoZQ+DjVaPj1lRxsfLlJU/CJB6cFIQBzbi4+qB8Obo8u
         9yPER2rajDXCAB5HVRhwrkkm8rvNIbxdxZadHpVbe2ey5/nOwK7wbXxgUc/0fRxeAuQl
         xYCOVob2Ss65VOhWtdkhIxOmwK0MAnVUdvS0UPU4oiIY4+1Se+OnhifDcqo/yuPYJDU5
         HsRIvQVxOOVSk9XrRWzYhLbBUqKv02842AmW5WzCWQVv95Wng+6lawvlLHAfDqRYKej+
         iUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gEU9egN9+/NfXTjj920HZmiXCFvNCQE5eANcITvsGZ4=;
        fh=9IA0DwtpEKp4xrs4hnFQpEIJMqvAktzaLAzOzpKoICg=;
        b=CMNa5p0TZP/fkq0ToMueL3/OSE+O/bCjVbJsIK1uLjnRnGz/6b2+MaUYljviCuRfuh
         0UQN2KyKSFJ1jH2EIuUifZxL2MSjfHRAnSadC3AqxGaPKQSZ6y0i5cX7yNgrXovcSOyB
         NJ0+1mOmQ9Xg2K+KEa1Wyu1+yNYJ56r9x3KSWEPYsn+nxCa05qWyzP6BNkD3fpUbrfQl
         CF5W/TLiMWsrM7UTeNfrYsIaVxxMRjiCQ3pTLbDYSVYltUc8U6Zddo6VhJI3UasGW4mD
         K25IR4iF+6rAT5cVGw9L9mKs7ZkkjT9petl/ybJ5LWGLG1/9NfAGhncEbqR5LS0MYxzu
         JdqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZEVOKQ3q;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c21-20020a170902c1d500b001d8f2294bbdsor5801560plc.9.2024.02.22.14.24.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 Feb 2024 14:24:37 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZEVOKQ3q;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708640677; x=1709245477; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEU9egN9+/NfXTjj920HZmiXCFvNCQE5eANcITvsGZ4=;
        b=ZEVOKQ3qEWvW+wd0gWM1msPMRKtxy17hf2/mdYXfs9vftQMP7tgefLyV/iIs47N7j2
         Aas0kTpet19wbSGteULsggBNYi7VebdzwftitrwmjgErZqtY4qiO2EF8IngK9O0weDLA
         yjkIzE+o+h2xizOQXzuECFAG25ugiqJVxmHM+OFLwUATUGXd+irKjzvTpOrccNBbvIz1
         lH4d33t2kfihU+e15it5K+O7BW+Idkzixl5WLxZdzkeTA38MHyn4CLPXKNr56s85fMQh
         5ssDMWEFPRPtgeWq0LGBAD7szmi60coM7VS+BAn8XVcPgb1zRkbY4zh7CafJh89Qta8W
         QocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708640677; x=1709245477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEU9egN9+/NfXTjj920HZmiXCFvNCQE5eANcITvsGZ4=;
        b=P6bRz9x5f8iKqlKVrx86F2v0sVIfF2QSv9+EyyLcb0sPleDCa6kToktjNHkOyHFN7O
         81xc1PoyD8FcREXEitPk4X1u6C8P0Mgbh/yH48Bv2qaOLH3j8m8n/l+80MSbWq5Iav3o
         y8a8BIgcst8X8ggV8pi/9eTNJXzxcCKib4pgvbZnRMsW+WNZFd1i09479LDvNsm64m9K
         zHeOH5/jDJ3ozVKTX+JeGlZVi3p+ITQ33jUSmMPdJOToQe+YZ9TYWDYvj3EUwqDD/M24
         8nHBL1r5RPak7hqejzvI/rGekXEePHMAIOZcPVCdOqjVQvJE+v0jdee6IfzNcSDRuM0V
         561w==
X-Forwarded-Encrypted: i=1; AJvYcCVwNZysVyStCpyRmFcXL0uw+uG4MzkjBXR9vfg73PcG3j44bhsNd3UKWfqyFtxYSIav3ujZiu0tQTrNCw1O3RMQbZYxI/jW
X-Gm-Message-State: AOJu0YydRKsb55NpHVfjzNUZY26QA3PDoap1kx199oFHQrdqmpz8cAFC
	DhMpbWMv1eQoT+08YMQs6ilc8M+KtGdwgdyRR43/VVtnv+GQ48q2/rxy0MWTZNR7qg==
X-Google-Smtp-Source: AGHT+IGNOMSD9riyu2cofAAWxJEM4CZrHHAP+ZMDGSyuPu9XpA2wqyBcKFEIB9Ba57Jn4K41dSjUqg==
X-Received: by 2002:a17:902:e890:b0:1db:e514:1cfd with SMTP id w16-20020a170902e89000b001dbe5141cfdmr518768plg.21.1708640676599;
        Thu, 22 Feb 2024 14:24:36 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from amd.. ([2804:7f0:b400:285a:3e7c:3fff:fe7a:e83b])
        by smtp.gmail.com with ESMTPSA id ji7-20020a170903324700b001d7057c2fbasm10457210plb.100.2024.02.22.14.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 14:24:35 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	philmd@linaro.org
Cc: thuth@redhat.com,
	lvivier@redhat.com,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	anton.kochkov@proton.me,
	richard.henderson@linaro.org,
	peter.maydell@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH 6/6] tests/qtest: Add ivshmem-flat test
Date: Thu, 22 Feb 2024 22:22:18 +0000
Message-Id: <20240222222218.2261956-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222222218.2261956-1-gustavo.romero@linaro.org>
References: <20240222222218.2261956-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BZrr8YmA8ede

This commit adds a qtest for the ivshmem-flat device to test memory
sharing, IRQ triggering, and the memory mapped registers in the device.

Based-on: https://lists.gnu.org/archive/html/qemu-devel/2023-11/msg03176.html
Message-ID: <20231127052024.435743-4-gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/qtest/ivshmem-flat-test.c | 338 ++++++++++++++++++++++++++++++++
 tests/qtest/meson.build         |   2 +
 2 files changed, 340 insertions(+)
 create mode 100644 tests/qtest/ivshmem-flat-test.c

diff --git a/tests/qtest/ivshmem-flat-test.c b/tests/qtest/ivshmem-flat-test.c
new file mode 100644
index 0000000000..b6f59bba54
--- /dev/null
+++ b/tests/qtest/ivshmem-flat-test.c
@@ -0,0 +1,338 @@
+/*
+ * Inter-VM Shared Memory Flat Device qtests
+ *
+ * SPDX-FileCopyrightText: 2023 Linaro Ltd.
+ * SPDX-FileContributor: Gustavo Romero <gustavo.romero@linaro.org>
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ */
+
+#include "ivshmem-utils.h"
+
+#define IVSHMEM_FLAT_MMR_ADDR 0x400FF000
+#define IVSHMEM_FLAT_SHM_ADDR 0x40100000
+#define SHM_SIZE 131072 /* 128k */
+
+static ServerThread thread;
+
+uint32_t *shm_ptr;
+char *shm_rel_path;
+char *server_socket_path;
+
+static void cleanup(void)
+{
+    if (shm_ptr) {
+        munmap(shm_ptr, SHM_SIZE);
+        shm_ptr = NULL;
+    }
+
+    if (shm_rel_path) {
+        shm_unlink(shm_rel_path);
+        shm_rel_path = NULL;
+    }
+
+    if (server_socket_path) {
+        unlink(server_socket_path);
+        server_socket_path = NULL;
+    }
+}
+
+static void abort_handler(void *data)
+{
+    test_ivshmem_server_stop(&thread);
+    cleanup();
+}
+
+/*
+ * Check if exactly 1 positive pulse (low->high->low) on 'irq' qtest IRQ line
+ * happens. N.B.: 'irq' must be intercepted using qtest_irq_intercept_* before
+ * this function can be used on it. It returns 0 when pulse is detected,
+ * otherwise 1.
+ */
+static int test_ivshmem_flat_irq_positive_pulse(QTestState *qts, int irq)
+{
+    uint64_t num_raises = 0;
+    uint64_t num_lows = 0;
+    int attempts = 0;
+
+    while (attempts < 5) {
+        num_raises = qtest_get_irq_raised_counter(qts, 0);
+        if (num_raises) {
+            num_lows = qtest_get_irq_lowered_counter(qts, 0);
+            /* Check for exactly 1 raise and 1 low IRQ event */
+            if (num_raises == num_lows && num_lows == 1) {
+                return 0; /* Pulse detected */
+            }
+        }
+
+	g_usleep(10000);
+	attempts++;
+    }
+
+    g_message("%s: Timeout expired", __func__);
+    return 1;
+}
+
+static inline uint32_t read_reg(QTestState *qts, enum Reg reg)
+{
+    uint32_t v;
+
+    qtest_memread(qts, IVSHMEM_FLAT_MMR_ADDR + reg, &v, sizeof(v));
+
+    return v;
+}
+
+static inline void write_reg(QTestState *qts, enum Reg reg, uint32_t v)
+{
+    qtest_memwrite(qts, IVSHMEM_FLAT_MMR_ADDR + reg, &v, sizeof(v));
+}
+
+/*
+ * Setup a test VM with ivshmem-flat device attached, IRQ properly set, and
+ * connected to the ivshmem-server.
+ */
+static QTestState *setup_vm(void)
+{
+    QTestState *qts;
+    const char *cmd_line;
+
+    /*
+     * x-bus-address-{iomem,shmem} are just random addresses that don't conflict
+     * with any other address in the lm3s6965evb machine. shmem-size used is
+     * much smaller than the ivshmem server default (4 MiB) to save memory
+     * resources when testing.
+     */
+    cmd_line = g_strdup_printf("-machine lm3s6965evb "
+                               "-chardev socket,path=%s,id=ivshm "
+                               "-device ivshmem-flat,chardev=ivshm,"
+                               "x-irq-qompath='/machine/soc/v7m/nvic/unnamed-gpio-in[0]',"
+                               "x-bus-address-iomem=%#x,"
+                               "x-bus-address-shmem=%#x,"
+                               "shmem-size=%d",
+                               server_socket_path,
+                               IVSHMEM_FLAT_MMR_ADDR,
+                               IVSHMEM_FLAT_SHM_ADDR,
+                               SHM_SIZE);
+
+    qts = qtest_init(cmd_line);
+
+    return qts;
+}
+
+static void test_ivshmem_flat_irq(void)
+{
+    QTestState *vm_state;
+    uint16_t own_id;
+
+    vm_state = setup_vm();
+
+    qtest_irq_intercept_out_named(vm_state,
+                                  "/machine/peripheral-anon/device[0]",
+                                  "sysbus-irq");
+
+    /* IVPOSTION has the device's own ID distributed by the ivshmem-server. */
+    own_id = read_reg(vm_state, IVPOSITION);
+
+    /* Make device notify itself. */
+    write_reg(vm_state, DOORBELL, (own_id << 16) | 0 /* vector 0 */);
+
+    /*
+     * Check intercepted device's IRQ output line. 'sysbus-irq' was associated
+     * to qtest IRQ 0 when intercepted and after self notification qtest IRQ 0
+     * must be toggled by the device. The test fails if no toggling is detected.
+     */
+    g_assert(test_ivshmem_flat_irq_positive_pulse(vm_state,
+                                                  0 /* qtest IRQ */) == 0);
+
+    qtest_quit(vm_state);
+}
+
+static void test_ivshmem_flat_shm_write(void)
+{
+    QTestState *vm_state;
+    int num_elements, i;
+    uint32_t  *data;
+
+    vm_state = setup_vm();
+
+    /* Prepare test data with random values. */
+    data = g_malloc(SHM_SIZE);
+    num_elements = SHM_SIZE / sizeof(*data);
+    for (i = 0; i < num_elements; i++) {
+        data[i] = g_test_rand_int();
+    }
+
+    /*
+     * Write test data to VM address IVSHMEM_FLAT_SHM_ADDR, where the shared
+     * memory region is located.
+     */
+    qtest_memwrite(vm_state, IVSHMEM_FLAT_SHM_ADDR, data, SHM_SIZE);
+
+    /*
+     * Since the shared memory fd is mmapped into this test process VMA at
+     * shm_ptr, every byte written by the VM in its shared memory region should
+     * also be available in the test process via shm_ptr. Thus, data in shm_ptr
+     * is compared back against the original test data.
+     */
+    for (i = 0; i < num_elements; i++) {
+        g_assert_cmpint(shm_ptr[i], ==, data[i]);
+    }
+
+    qtest_quit(vm_state);
+}
+
+static void test_ivshmem_flat_shm_read(void)
+{
+    QTestState *vm_state;
+    int num_elements, i;
+    uint32_t  *data;
+    uint32_t v;
+
+    vm_state = setup_vm();
+
+    /* Prepare test data with random values. */
+    data = g_malloc(SHM_SIZE);
+    num_elements = SHM_SIZE / sizeof(*data);
+    for (i = 0; i < num_elements; i++) {
+        data[i] = g_test_rand_int();
+    }
+
+    /*
+     * Copy test data to the shared memory region so it can be read from the VM
+     * (IVSHMEM_FLAT_SHM_ADDR location).
+     */
+    memcpy(shm_ptr, data, SHM_SIZE);
+
+    /* Check data */
+    for (i = 0; i < num_elements; i++) {
+        qtest_memread(vm_state, IVSHMEM_FLAT_SHM_ADDR + i * sizeof(v), &v,
+                      sizeof(v));
+        g_assert_cmpint(v, ==, data[i]);
+    }
+
+    qtest_quit(vm_state);
+}
+
+static void test_ivshmem_flat_shm_pair(void)
+{
+    QTestState *vm0_state, *vm1_state;
+    uint16_t vm0_peer_id, vm1_peer_id;
+    int num_elements, i;
+    uint32_t  *data;
+    uint32_t v;
+
+    vm0_state = setup_vm();
+    vm1_state = setup_vm();
+
+    /* Get peer ID for the VM so it can be used for one notify each other. */
+    vm0_peer_id = read_reg(vm0_state, IVPOSITION);
+    vm1_peer_id = read_reg(vm1_state, IVPOSITION);
+
+    /* Observe vm1 IRQ output line first. */
+    qtest_irq_intercept_out_named(vm1_state,
+                                  "/machine/peripheral-anon/device[0]",
+                                  "sysbus-irq");
+
+    /* Notify (interrupt) VM1 from VM0. */
+    write_reg(vm0_state, DOORBELL, (vm1_peer_id << 16) | 0 /* vector 0 */);
+
+    /* Check if VM1 IRQ output line is toggled after notification from VM0. */
+    g_assert(test_ivshmem_flat_irq_positive_pulse(vm1_state,
+                                                  0 /* qtest IRQ */) == 0);
+
+    /* Secondly, observe VM0 IRQ output line first. */
+    qtest_irq_intercept_out_named(vm0_state,
+                                  "/machine/peripheral-anon/device[0]",
+                                  "sysbus-irq");
+
+    /* ... and do the opposite: notify (interrupt) VM0 from VM1. */
+    write_reg(vm1_state, DOORBELL, (vm0_peer_id << 16) | 0 /* vector 0 */);
+
+    /* Check if VM0 IRQ output line is toggled after notification from VM0. */
+    g_assert(test_ivshmem_flat_irq_positive_pulse(vm0_state,
+                                                  0 /* qtest IRQ */) == 0);
+
+    /* Prepare test data with random values. */
+    data = g_malloc(SHM_SIZE);
+    num_elements = SHM_SIZE / sizeof(*data);
+    for (i = 0; i < num_elements; i++) {
+        data[i] = g_test_rand_int();
+    }
+
+    /* Write test data on VM0. */
+    qtest_memwrite(vm0_state, IVSHMEM_FLAT_SHM_ADDR, data, SHM_SIZE);
+
+    /* Check test data on VM1. */
+    for (i = 0; i < num_elements; i++) {
+        qtest_memread(vm1_state, IVSHMEM_FLAT_SHM_ADDR + i * sizeof(v), &v,
+                      sizeof(v));
+        g_assert_cmpint(v, ==, data[i]);
+    }
+
+    /* Prepare new test data with random values. */
+    for (i = 0; i < num_elements; i++) {
+        data[i] = g_test_rand_int();
+    }
+
+    /* Write test data on VM1. */
+    qtest_memwrite(vm1_state, IVSHMEM_FLAT_SHM_ADDR, data, SHM_SIZE);
+
+    /* Check test data on VM0. */
+    for (i = 0; i < num_elements; i++) {
+        qtest_memread(vm0_state, IVSHMEM_FLAT_SHM_ADDR + i * sizeof(v), &v,
+                      sizeof(v));
+        g_assert_cmpint(v, ==, data[i]);
+    }
+
+    qtest_quit(vm0_state);
+    qtest_quit(vm1_state);
+}
+
+int main(int argc, char *argv[])
+{
+    int shm_fd, r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    if (!qtest_has_machine("lm3s6965evb")) {
+        g_test_skip("Machine Stellaris (lm3s6965evb) not found, "
+                    "skipping ivshmem-flat device test.");
+        return 0;
+    }
+
+    /* If test fails, stop server, cleanup socket and shm files. */
+    qtest_add_abrt_handler(abort_handler, NULL);
+
+    shm_rel_path = mktempshm(SHM_SIZE, &shm_fd);
+    g_assert(shm_rel_path);
+
+    /*
+     * Map shm to this test's VMA so it's possible to read/write from/to it. For
+     * VMs with the ivhsmem-flat device attached, this region will also be
+     * mapped in their own memory layout, at IVSHMEM_FLAT_SHM_ADDR (default).
+     */
+    shm_ptr = mmap(0, SHM_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, shm_fd, 0);
+    g_assert(shm_ptr != MAP_FAILED);
+
+    server_socket_path = mktempsocket();
+    /* It never fails, so no assert(). */
+
+    /*
+     * Currently, ivshmem-flat device only supports notification via 1 vector,
+     * i.e. vector 0.
+     */
+    test_ivshmem_server_start(&thread, server_socket_path, shm_rel_path, 1);
+
+    /* Register tests. */
+    qtest_add_func("/ivshmem-flat/irq", test_ivshmem_flat_irq);
+    qtest_add_func("/ivshmem-flat/shm-write", test_ivshmem_flat_shm_write);
+    qtest_add_func("/ivshmem-flat/shm-read", test_ivshmem_flat_shm_read);
+    qtest_add_func("/ivshmem-flat/pair", test_ivshmem_flat_shm_pair);
+
+    r = g_test_run();
+
+    test_ivshmem_server_stop(&thread);
+    cleanup();
+
+    return r;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index bc6457220c..c0468bc6e0 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -205,6 +205,7 @@ qtests_stm32l4x5 = \
    'stm32l4x5_syscfg-test']
 
 qtests_arm = \
+  (config_all_devices.has_key('CONFIG_IVSHMEM_FLAT_DEVICE') ? ['ivshmem-flat-test'] : []) + \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
@@ -320,6 +321,7 @@ qtests = {
   'dbus-vmstate-test': files('migration-helpers.c') + dbus_vmstate1,
   'erst-test': files('erst-test.c'),
   'ivshmem-test': ['ivshmem-utils.c', '../../contrib/ivshmem-server/ivshmem-server.c'],
+  'ivshmem-flat-test': ['ivshmem-utils.c', '../../contrib/ivshmem-server/ivshmem-server.c'],
   'migration-test': migration_files,
   'pxe-test': files('boot-sector.c'),
   'qos-test': [chardev, io, qos_test_ss.apply({}).sources()],
-- 
2.34.1
