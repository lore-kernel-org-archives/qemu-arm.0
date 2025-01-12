Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1414295njn;
        Sun, 12 Jan 2025 13:03:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkkFnn+W3Tn5sIhRkJZL8GlIok0rpjyJKqrklC+Xkm6W691OQ7UrDDYCRwKQ7JeY8n/0Tx4b31ahUmEg==@linaro.org
X-Google-Smtp-Source: AGHT+IFqPsuM9vmzJRODcln9kRLDzmGFxZOGAH60AjYhrPiYKsEhA8dFjWYySwdm7b2cPUkPcaaU
X-Received: by 2002:a05:6122:41d:b0:515:25f5:46f6 with SMTP id 71dfb90a1353d-51c7c818af3mr9475368e0c.4.1736715823093;
        Sun, 12 Jan 2025 13:03:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736715823; cv=none;
        d=google.com; s=arc-20240605;
        b=HBse44Z1mf9fz0omm20Me7eeCyzypW/s8jWoeCYgcMvl7ylPEXBKzFsYJUpyBDrusV
         ZUd/BG5h9CZ7icCG3BiYRVVMOXD1X43bUIekDRrzECFYUzLacMMcmBpsAdVx9FPMKL4w
         leC8e4DvxKaO5SFGZ0IPSrhjY/WrOZzMFBR3DOM/xYMkfV85xQPrl+ApoFHqvDy3vOXV
         nYzmvagmdT2Cw2GrYHWFEnbZ0MCjE7SrI05rcnRB5OKEcW/5xNQ3v7pZslMkClRoNViL
         tIrpu1QrmJfzgkjCVrREhL3ogBfDBvjZnQm6DabLDoq+J1AJemSkXo0f1LOSI5fpOJ3C
         jLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eTW3PItu33BhI5IkVRjrY9Xz/ZsiIXnA27EwTGw7g/8=;
        fh=KG85tqRl9GcEX54TPBnYP3ydCPm7J++4c9Qq53ygjtk=;
        b=SUyITJx+6/5kiiD9cpMKGEls+zz0ObGBgn09K/yE4qcn16uchNwoMtWHhuw+v/DqSN
         u8/Xa11o+xugWSvgxV1YuvdHcYtG8TVE42yWpt3MRwYVA9pD8CqaIw1qm67/ZbONjJZs
         xG4x6p9wyqLCoDpkhnsMsU/S5z3HF4Oz79Aft7mpTYFGx2XDYRM/iYYW5hRoRxllzzpx
         YGDGW+bX85PmuPZ1z0FvceuyXjXpnwUlz8yTIiuOa+gFqM+Ss3z5o4s+wBaKrX+qikpQ
         yJr/ynD/FBFl7oVpVYUJyWILZjSoxYo4Rs8LsuvqNpY+N5QZPy3Y+aZfvhimH/1Ba9qi
         4YoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=e47tSpbx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51c7fbd557csi2728856e0c.83.2025.01.12.13.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 13:03:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=e47tSpbx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX56W-0004u5-RD; Sun, 12 Jan 2025 16:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55Y-0004Xr-M4
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:41 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55U-0006Oh-3f
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:40 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so898257666b.0
 for <qemu-arm@nongnu.org>; Sun, 12 Jan 2025 13:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1736715694; x=1737320494;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eTW3PItu33BhI5IkVRjrY9Xz/ZsiIXnA27EwTGw7g/8=;
 b=e47tSpbxISEW2leeib7borZ5n5eBn2bcExVyjuCZclOnyubrhBcwzR0V6xIF6S1ImA
 0McrWjACygVnwG6t4p+qc75jteXgHeTBrKSTzmDS2Oqa0/r2BBj1qQcabB/T4s5msQhy
 hzJncyLR6mMiRB69yI+skw9tktqfOWmxZ/PPmNUFNbn/wlmnqgfohi88x/n1vRUnsZmP
 JXjVJ9qjvnNNZPyvg4qDGz/m5Nm8LwnzPZDSmckfZuxEAtPAVjAQNcwhHidGO5qRjgpt
 7Lc8c+SCocgbXZVMGz1q0TRb+ICAtW9/uyagH7XQR3A38uS9d0P/FIiPubfGv2oVPBXl
 9zfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736715694; x=1737320494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eTW3PItu33BhI5IkVRjrY9Xz/ZsiIXnA27EwTGw7g/8=;
 b=IYkyDdYMf35x/s5kM1nY7tXmzb7wdoBYt3sRfIHJZ+WrI2IYAQdGZplkoG1lWAbb4m
 +nLymaQa2pxSp++0szbo57+uDf5k0osXa/m0T1IUjZXYqjMr9DdCYczBO/UMx0JK8Ada
 YAuHXih1pUtDBLzYsMQ+MLf4H16sSIfL5wyc4Ll7zZUoPLEwEOaR3nbPmSiiso3NNENU
 wBQgo3bjqlD6eD/R96cg88kSZoxo9VEntOMX2uVfY7y9OklVvAK/30ynijKEHclpp+g5
 9W2mJPDMoWjJoIoypbYYm+9S+73sN0E+6TokfmtkR3IWbnIBvhSP0ToFaffGhy/A6U7R
 UfpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6aZNgenx46fvREVUsme/1vTsnjkGWWmLmdoTIRKcOAW6rvZcWyFUNCg76tkzIGjnQ+x9rLRQYBw==@nongnu.org
X-Gm-Message-State: AOJu0Yzl+QsQGjqH1ko7CBcbLMrzvVnEPGhyBYpns+yxuC1Asae47gNr
 ne0/P3pAiulGciXCiBejqwzAF+1u85uBkzZWrrG7024/RIxIuTD7+fx1ah8v0w==
X-Gm-Gg: ASbGncuU6DTRiVgcWH3FWyok3mcIYT3deG5uddd7eUhJntvynTeMWgPSBnV++8jYQRL
 1B6d+FR5GDJ4ZHsNHjs0fIfixRCOU1Wq/PEaySzmTE2d6IppFNh9WJwqe+aQwk08SXerkbH+MW0
 6e7lsgxRespUnZL8/BxG+elSbkRn38ju/2rHKE4hgVp92Evho5u+z+Ahufxs6go+qpmnoG3xy33
 UTfrN3aZgmZgmoPGYJqOuJ3SJuQXxgU6OaNkv1iWZF0AxL/STqgAlLyyCqxI1vDokEpMlsXkFXh
 /75Qrn/3Bb/WOhHY0sEBXR/QJcbSMDeX
X-Received: by 2002:a17:907:60d5:b0:aab:9258:488 with SMTP id
 a640c23a62f3a-ab2c3c4525cmr1243818066b.10.1736715694515; 
 Sun, 12 Jan 2025 13:01:34 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905e283sm418276666b.31.2025.01.12.13.01.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Jan 2025 13:01:34 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Alexander Graf <graf@amazon.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v17 06/11] hw/vmapple/bdif: Introduce vmapple backdoor
 interface
Date: Sun, 12 Jan 2025 22:00:51 +0100
Message-Id: <20250112210056.16658-7-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250112210056.16658-1-phil@philjordan.eu>
References: <20250112210056.16658-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62a;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62a.google.com
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
X-TUID: wuNLtOJVL4O3

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

v15:

 * Constified the property table.

v16:

 * Fixed #include path breakage from recent sysemu->system path rename.
 * Removed the DEFINE_PROP_END_OF_LIST marker to match recent upstream
   changes.

 hw/vmapple/Kconfig           |   3 +
 hw/vmapple/bdif.c            | 274 +++++++++++++++++++++++++++++++++++
 hw/vmapple/meson.build       |   1 +
 hw/vmapple/trace-events      |   5 +
 include/hw/vmapple/vmapple.h |   2 +
 5 files changed, 285 insertions(+)
 create mode 100644 hw/vmapple/bdif.c

diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
index a73504d599..68f88876eb 100644
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
index 0000000000..5827dd2aab
--- /dev/null
+++ b/hw/vmapple/bdif.c
@@ -0,0 +1,274 @@
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
+#include "system/block-backend.h"
+#include "system/dma.h"
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
+static const Property bdif_properties[] = {
+    DEFINE_PROP_DRIVE("aux", VMAppleBdifState, aux),
+    DEFINE_PROP_DRIVE("root", VMAppleBdifState, root),
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
index bcd4dcb28d..d4624713de 100644
--- a/hw/vmapple/meson.build
+++ b/hw/vmapple/meson.build
@@ -1 +1,2 @@
 system_ss.add(when: 'CONFIG_VMAPPLE_AES',  if_true: files('aes.c'))
+system_ss.add(when: 'CONFIG_VMAPPLE_BDIF', if_true: files('bdif.c'))
diff --git a/hw/vmapple/trace-events b/hw/vmapple/trace-events
index 0d4a73d7d1..d86f64d50f 100644
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
index 6762b6c869..9090e9c5ac 100644
--- a/include/hw/vmapple/vmapple.h
+++ b/include/hw/vmapple/vmapple.h
@@ -14,4 +14,6 @@
 
 #define TYPE_APPLE_AES "apple-aes"
 
+#define TYPE_VMAPPLE_BDIF "vmapple-bdif"
+
 #endif /* HW_VMAPPLE_VMAPPLE_H */
-- 
2.39.5 (Apple Git-154)

