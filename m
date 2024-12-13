Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp523382njb;
        Fri, 13 Dec 2024 07:24:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWLKhGESormSB+gKv3Ii8/+BE4uyOxdf9ncc9GPDe/oh5nWapV6W60gMsGoHLjwq+/Y5dYHv4P2O0JO8g==@linaro.org
X-Google-Smtp-Source: AGHT+IER4lOQ0KUT5SEHnhvxukhe+F0ncJ2ZteN+UMaJ1HYfti551KxrYIukEJhB4qywfaSXHi2v
X-Received: by 2002:ad4:574c:0:b0:6d8:b189:5419 with SMTP id 6a1803df08f44-6dc84f2f572mr45627746d6.8.1734103467419;
        Fri, 13 Dec 2024 07:24:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734103467; cv=none;
        d=google.com; s=arc-20240605;
        b=eT/EY7ejp1CAFhQIExdR2G7xRX9Yjd5k3n+ztTn9BDFx7vaMFduqVhdrDNlHSVyDmR
         QZBidZLr3aIYavbRUhFB3aNUrDDr/NDIv6mlUnCqGZhs1Z36LGU4Y8z/B0J5ZIyx3FGH
         gagBosHbheA5/fKRH+j7S5rNQSBjszSAw9mLA2uR7YurLXVESxcTmLrHRrHSCnaGOk1N
         hxYn1Cu7NwAW7V8SRxLX9bAMm76GJS4JHglh6S0PAxNN/jAUP1wUqOEbnzYLfYDi8TB+
         o74Q7HgK2ROj9dkWs+C5Cae5xBLjPNydrMsuAqP0PtkIkqcepXsfn/gN3Okk/suF/ed4
         JALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sWBVtN/MtB7QwyvqivaPQCEjkPZnM9/4icL1W2D0Ipw=;
        fh=TZ64hR1Xv1wV/z1W0Jd9F+rF9PkFpzg5wSS3g1firlw=;
        b=bmXMPMXq6hEWJUYUoLewxMsHW+ZTplnBMWJJ23XNqvOsRPawbO4kMfHpNWvPLSiUBP
         v2yL0ixnW8h08RpKvg+iwoZ/Yem0mGIZkHWiswgjpOxDjj0ZeHhw6YnhqmLl46S0lQoW
         AYu5TW8sqXT+cWsEMj7H7rkOInlyjtWfY9XQtWLych7P6zM3IUqddSOwBCHNB1/Z2ivf
         UO6dJpDbRED3GCZRyEiqhSWmvo1agtRqD/kuYHecq4QN/EDgQ27w2nuoQf27ZhchheLL
         UX7qud1l5yHYeiI/uhQGKgRR5GLv6uDHHsU/Ie7l8nkTo8VyLR27ncI96sKu78mASaG9
         YAPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=b09Wm2Iw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac45b2fsi204289956d6.536.2024.12.13.07.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:24:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=b09Wm2Iw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM7SN-0005AA-Ny; Fri, 13 Dec 2024 10:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7Rl-0004VT-B1
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:18 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7Re-0005Au-Iq
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:16 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa69107179cso357041966b.0
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 07:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103138; x=1734707938;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sWBVtN/MtB7QwyvqivaPQCEjkPZnM9/4icL1W2D0Ipw=;
 b=b09Wm2Iwd+AFViDEBIqrmKNXPtraeMa3UjR88r17GEavZES/n6d2gLBO631qOKsUx7
 qpI2TU+ZcR2E6lynX8cRJedvfHf6QR/K1qXCKA2trPD14FSa9Oh8XqkdBELW00ehc5Gi
 J1JNBusT0lndDvZHnhKJqVhctkNTEvBR1os71nFURnCk8reuaLcHFAkP6urlEXnJ3NOP
 SnxJ6O3c1TPP5VisjSG7agEpSt90zqAMRD3VhCrz+m22ucXXbPMZB8JyY5Qp/4X58HyK
 2/cuKA/QuYQClzskoFxv0fRJQE7dNZFqAnf+YrEE1cOmBLER5uAUu6W63sPHmThShAgE
 FOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103138; x=1734707938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sWBVtN/MtB7QwyvqivaPQCEjkPZnM9/4icL1W2D0Ipw=;
 b=IEw8RDz11QrkYAaw00qPMCNpoglvJBoIzd/dk5eG1KDSruQ4xltSBAaGwwkkv3r2JI
 7G5uIovznZKry5d4FREfzm2bENIGlen3yY4F4GRM5oB81A0WE51GZhunuYdgDBIk96dl
 qOSUMcLdfxxEStB8MfGkhVDRIVNZjHq9WoZw7oiUSpXRNdDF8luRVO4m4wo5gYMLn/wQ
 j/XQgU0xmRybbHShrT47jcnb+lLTunULvEdcPsm+ajr4P1Ztxm6u3dXxycQ2yHjsJAJz
 bqCG9pub0cTI+br1kLTwQU4No5rFpWOVlDpP1SZS9ny8fowHmvO9ZECGtizVNoHv4UIV
 +iJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0C/gbeHsCdGptyFxVWd8k1LE5gFiRS6qg9ScmeAi5ZeCSG68LrttpcStNSodHJqTG4SbL6kY79g==@nongnu.org
X-Gm-Message-State: AOJu0Yz1C+tSafa7BGgEhG889ZhUp8RbqD/TCJiroQkgeuH+DRrwOpRP
 dUU5K86DvzCZ/NrpgfKGIq1xE2B+B1/zPWUBmH83vtO/rJ+hTDp8+wWfpMKzvQ==
X-Gm-Gg: ASbGncuSKJMFuiv9yJO10c35M6k6AkhXCjfrwpIS0usljEzfp5Ad8kB8HwZQYdZE6b+
 OTOy92/+juioLbeOTWc9fXW4qNPqmqXvaQBu7+7QQp5KbrR2mSOf99PbNTbtKfR0m61VxTiQEbf
 P0hzUNv5C1QHfQ7rnx5XE9HkfTijww1GX2zU5PamO+MCqxBIoCp/1aWIifoMS7A5gPfPfsaQCxH
 0f/GTRzomMlnO2mKSDMFh2oZ72hNa7jrQn9R3/5jQCOjSgbvpoPrGaUafze510L3JwIXtQdgv1M
 YrE1zz9uH5gXzY+Lqe/9kWxObf9yEgZy
X-Received: by 2002:a17:906:3152:b0:aa6:8160:8495 with SMTP id
 a640c23a62f3a-aab77e9705emr304650166b.42.1734103138176; 
 Fri, 13 Dec 2024 07:18:58 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.18.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:18:57 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Subject: [PATCH v13 11/15] hw/vmapple/bdif: Introduce vmapple backdoor
 interface
Date: Fri, 13 Dec 2024 16:18:01 +0100
Message-Id: <20241213151821.65748-12-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::634;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x634.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qnqmWaEX7vRn

From: Alexander Graf <graf@amazon.com>

The VMApple machine exposes AUX and ROOT block devices (as well as USB OTG
emulation) via virtio-pci as well as a special, simple backdoor platform
device.

This patch implements this backdoor platform device to the best of my
understanding. I left out any USB OTG parts; they're only needed for
guest recovery and I don't understand the protocol yet.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---

v4:

 * Moved most header code to .c, rest to vmapple.h
 * Better compliance with coding, naming, and formatting conventions.

v8:

 * Replaced uses of cpu_physical_memory_read with dma_memory_read.
 * Replaced an instance of g_free with g_autofree.

v9:

 * Replaced uses of cpu_physical_memory_write with dma_memory_write.
 
 hw/vmapple/Kconfig           |   3 +
 hw/vmapple/bdif.c            | 275 +++++++++++++++++++++++++++++++++++
 hw/vmapple/meson.build       |   1 +
 hw/vmapple/trace-events      |   5 +
 include/hw/vmapple/vmapple.h |   2 +
 5 files changed, 286 insertions(+)
 create mode 100644 hw/vmapple/bdif.c

diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
index a73504d5999..68f88876eb9 100644
--- a/hw/vmapple/Kconfig
+++ b/hw/vmapple/Kconfig
@@ -1,3 +1,6 @@
 config VMAPPLE_AES
     bool
 
+config VMAPPLE_BDIF
+    bool
+
diff --git a/hw/vmapple/bdif.c b/hw/vmapple/bdif.c
new file mode 100644
index 00000000000..d7b6b7a25a4
--- /dev/null
+++ b/hw/vmapple/bdif.c
@@ -0,0 +1,275 @@
+/*
+ * VMApple Backdoor Interface
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "trace.h"
+#include "hw/vmapple/vmapple.h"
+#include "hw/sysbus.h"
+#include "hw/block/block.h"
+#include "qapi/error.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/dma.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(VMAppleBdifState, VMAPPLE_BDIF)
+
+struct VMAppleBdifState {
+    SysBusDevice parent_obj;
+
+    BlockBackend *aux;
+    BlockBackend *root;
+    MemoryRegion mmio;
+};
+
+#define VMAPPLE_BDIF_SIZE   0x00200000
+
+#define REG_DEVID_MASK      0xffff0000
+#define DEVID_ROOT          0x00000000
+#define DEVID_AUX           0x00010000
+#define DEVID_USB           0x00100000
+
+#define REG_STATUS          0x0
+#define REG_STATUS_ACTIVE     BIT(0)
+#define REG_CFG             0x4
+#define REG_CFG_ACTIVE        BIT(1)
+#define REG_UNK1            0x8
+#define REG_BUSY            0x10
+#define REG_BUSY_READY        BIT(0)
+#define REG_UNK2            0x400
+#define REG_CMD             0x408
+#define REG_NEXT_DEVICE     0x420
+#define REG_UNK3            0x434
+
+typedef struct VblkSector {
+    uint32_t pad;
+    uint32_t pad2;
+    uint32_t sector;
+    uint32_t pad3;
+} VblkSector;
+
+typedef struct VblkReqCmd {
+    uint64_t addr;
+    uint32_t len;
+    uint32_t flags;
+} VblkReqCmd;
+
+typedef struct VblkReq {
+    VblkReqCmd sector;
+    VblkReqCmd data;
+    VblkReqCmd retval;
+} VblkReq;
+
+#define VBLK_DATA_FLAGS_READ  0x00030001
+#define VBLK_DATA_FLAGS_WRITE 0x00010001
+
+#define VBLK_RET_SUCCESS  0
+#define VBLK_RET_FAILED   1
+
+static uint64_t bdif_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t ret = -1;
+    uint64_t devid = offset & REG_DEVID_MASK;
+
+    switch (offset & ~REG_DEVID_MASK) {
+    case REG_STATUS:
+        ret = REG_STATUS_ACTIVE;
+        break;
+    case REG_CFG:
+        ret = REG_CFG_ACTIVE;
+        break;
+    case REG_UNK1:
+        ret = 0x420;
+        break;
+    case REG_BUSY:
+        ret = REG_BUSY_READY;
+        break;
+    case REG_UNK2:
+        ret = 0x1;
+        break;
+    case REG_UNK3:
+        ret = 0x0;
+        break;
+    case REG_NEXT_DEVICE:
+        switch (devid) {
+        case DEVID_ROOT:
+            ret = 0x8000000;
+            break;
+        case DEVID_AUX:
+            ret = 0x10000;
+            break;
+        }
+        break;
+    }
+
+    trace_bdif_read(offset, size, ret);
+    return ret;
+}
+
+static void le2cpu_sector(VblkSector *sector)
+{
+    sector->sector = le32_to_cpu(sector->sector);
+}
+
+static void le2cpu_reqcmd(VblkReqCmd *cmd)
+{
+    cmd->addr = le64_to_cpu(cmd->addr);
+    cmd->len = le32_to_cpu(cmd->len);
+    cmd->flags = le32_to_cpu(cmd->flags);
+}
+
+static void le2cpu_req(VblkReq *req)
+{
+    le2cpu_reqcmd(&req->sector);
+    le2cpu_reqcmd(&req->data);
+    le2cpu_reqcmd(&req->retval);
+}
+
+static void vblk_cmd(uint64_t devid, BlockBackend *blk, uint64_t gp_addr,
+                     uint64_t static_off)
+{
+    VblkReq req;
+    VblkSector sector;
+    uint64_t off = 0;
+    g_autofree char *buf = NULL;
+    uint8_t ret = VBLK_RET_FAILED;
+    int r;
+    MemTxResult dma_result;
+
+    dma_result = dma_memory_read(&address_space_memory, gp_addr,
+                                 &req, sizeof(req), MEMTXATTRS_UNSPECIFIED);
+    if (dma_result != MEMTX_OK) {
+        goto out;
+    }
+
+    le2cpu_req(&req);
+
+    if (req.sector.len != sizeof(sector)) {
+        goto out;
+    }
+
+    /* Read the vblk command */
+    dma_result = dma_memory_read(&address_space_memory, req.sector.addr,
+                                 &sector, sizeof(sector),
+                                 MEMTXATTRS_UNSPECIFIED);
+    if (dma_result != MEMTX_OK) {
+        goto out;
+    }
+    le2cpu_sector(&sector);
+
+    off = sector.sector * 512ULL + static_off;
+
+    /* Sanity check that we're not allocating bogus sizes */
+    if (req.data.len > 128 * MiB) {
+        goto out;
+    }
+
+    buf = g_malloc0(req.data.len);
+    switch (req.data.flags) {
+    case VBLK_DATA_FLAGS_READ:
+        r = blk_pread(blk, off, req.data.len, buf, 0);
+        trace_bdif_vblk_read(devid == DEVID_AUX ? "aux" : "root",
+                             req.data.addr, off, req.data.len, r);
+        if (r < 0) {
+            goto out;
+        }
+        dma_result = dma_memory_write(&address_space_memory, req.data.addr, buf,
+                                      req.data.len, MEMTXATTRS_UNSPECIFIED);
+        if (dma_result == MEMTX_OK) {
+            ret = VBLK_RET_SUCCESS;
+        }
+        break;
+    case VBLK_DATA_FLAGS_WRITE:
+        /* Not needed, iBoot only reads */
+        break;
+    default:
+        break;
+    }
+
+out:
+    dma_memory_write(&address_space_memory, req.retval.addr, &ret, 1,
+                     MEMTXATTRS_UNSPECIFIED);
+}
+
+static void bdif_write(void *opaque, hwaddr offset,
+                       uint64_t value, unsigned size)
+{
+    VMAppleBdifState *s = opaque;
+    uint64_t devid = (offset & REG_DEVID_MASK);
+
+    trace_bdif_write(offset, size, value);
+
+    switch (offset & ~REG_DEVID_MASK) {
+    case REG_CMD:
+        switch (devid) {
+        case DEVID_ROOT:
+            vblk_cmd(devid, s->root, value, 0x0);
+            break;
+        case DEVID_AUX:
+            vblk_cmd(devid, s->aux, value, 0x0);
+            break;
+        }
+        break;
+    }
+}
+
+static const MemoryRegionOps bdif_ops = {
+    .read = bdif_read,
+    .write = bdif_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
+};
+
+static void bdif_init(Object *obj)
+{
+    VMAppleBdifState *s = VMAPPLE_BDIF(obj);
+
+    memory_region_init_io(&s->mmio, obj, &bdif_ops, obj,
+                         "VMApple Backdoor Interface", VMAPPLE_BDIF_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static Property bdif_properties[] = {
+    DEFINE_PROP_DRIVE("aux", VMAppleBdifState, aux),
+    DEFINE_PROP_DRIVE("root", VMAppleBdifState, root),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void bdif_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "VMApple Backdoor Interface";
+    device_class_set_props(dc, bdif_properties);
+}
+
+static const TypeInfo bdif_info = {
+    .name          = TYPE_VMAPPLE_BDIF,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(VMAppleBdifState),
+    .instance_init = bdif_init,
+    .class_init    = bdif_class_init,
+};
+
+static void bdif_register_types(void)
+{
+    type_register_static(&bdif_info);
+}
+
+type_init(bdif_register_types)
diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
index bcd4dcb28d2..d4624713deb 100644
--- a/hw/vmapple/meson.build
+++ b/hw/vmapple/meson.build
@@ -1 +1,2 @@
 system_ss.add(when: 'CONFIG_VMAPPLE_AES',  if_true: files('aes.c'))
+system_ss.add(when: 'CONFIG_VMAPPLE_BDIF', if_true: files('bdif.c'))
diff --git a/hw/vmapple/trace-events b/hw/vmapple/trace-events
index 0d4a73d7d1c..d86f64d50fe 100644
--- a/hw/vmapple/trace-events
+++ b/hw/vmapple/trace-events
@@ -14,3 +14,8 @@ aes_2_read(uint64_t offset, uint64_t res) "offset=0x%"PRIx64" res=0x%"PRIx64
 aes_2_write(uint64_t offset, uint64_t val) "offset=0x%"PRIx64" val=0x%"PRIx64
 aes_dump_data(const char *desc, const char *hex) "%s%s"
 
+# bdif.c
+bdif_read(uint64_t offset, uint32_t size, uint64_t value) "offset=0x%"PRIx64" size=0x%x value=0x%"PRIx64
+bdif_write(uint64_t offset, uint32_t size, uint64_t value) "offset=0x%"PRIx64" size=0x%x value=0x%"PRIx64
+bdif_vblk_read(const char *dev, uint64_t addr, uint64_t offset, uint32_t len, int r) "dev=%s addr=0x%"PRIx64" off=0x%"PRIx64" size=0x%x r=%d"
+
diff --git a/include/hw/vmapple/vmapple.h b/include/hw/vmapple/vmapple.h
index 6762b6c869f..9090e9c5ac8 100644
--- a/include/hw/vmapple/vmapple.h
+++ b/include/hw/vmapple/vmapple.h
@@ -14,4 +14,6 @@
 
 #define TYPE_APPLE_AES "apple-aes"
 
+#define TYPE_VMAPPLE_BDIF "vmapple-bdif"
+
 #endif /* HW_VMAPPLE_VMAPPLE_H */
-- 
2.39.5 (Apple Git-154)

