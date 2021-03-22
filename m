Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3908197lfg;
        Mon, 22 Mar 2021 13:14:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEzdnxo9mkA1fAauMN1lKDMH1KlQ1igxErPgwVWF4alVQkgZyzK5pu3pjPgDnZceok6yQZ
X-Received: by 2002:a05:6e02:b25:: with SMTP id e5mr1579121ilu.119.1616444062069;
        Mon, 22 Mar 2021 13:14:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616444062; cv=none;
        d=google.com; s=arc-20160816;
        b=YlWerZ2QnjTwQ++h1zrblTLyefsXys0Ql5F+mByL6GnvnYMhNWzWfYUnyEwJkhSZ+3
         KDqSRiXxURanJbz7Q6Bpre8EKzUI/r7KK/VcS/ERJUT1vCUJS19nymuvStXwivn/ykbd
         HmZeGZl54as3QYy8Ll0INg5C+CiHhps76LjlhJ/EjU/UKsAwV2uiSymfXROJfo0eTYwC
         okrJpH5QLRle3+GBAq+Q6oWua+3z6GO/m357h+MA1aqxYbhjjD1oc/55fVBGFG+Xg50b
         dMaMrTlcYV/GUvbSqB/hPXuicwGterr7PSzDuII7+0b+gij2VtDqrtv1xwiU0VqoVxnk
         Lt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=VRN75fiZq3z0KsQUrseR+n6u9jCms7lasgObIRtwiok=;
        b=wG6aFqSIxvBIXt/SpvjSfaGjkvbs7yu780erZj1RYKOQv1p4/KGjYkOHaPZjmBRNWI
         k7B7NNDhR2uqLE1awD2x15xvjCY5TlK+Uk1i1eHvJcE/Zl6zbkEBo/VVwijTg5hZjGNO
         xwPhY88LJsg2y6Hh4LOsZpd7P88OgggPop8nCzf6sJofzgKAaDvtlcQZZp5CXHiNf3vU
         JbJFlFiYHH5U92wQfhGEPLzUHpzni/uJrdlgC1eb63He6SxZmP8GDh5ND1Lze8D2x/Vx
         Kx3vzTyqPr57iDIWpwbXV5nmMhYHPfsmgDuXVqvRAgcxpiMsuuAnfbVbpB4AbJLci0Vd
         mnQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r4dR3MBO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si8861240ilv.149.2021.03.22.13.14.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 13:14:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=r4dR3MBO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOQwP-0000bU-7t
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 16:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOQvo-0000Rl-Rs
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 16:13:46 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOQvl-0003jt-Jv
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 16:13:44 -0400
Received: by mail-wr1-x444.google.com with SMTP id e9so18494609wrw.10
 for <qemu-arm@nongnu.org>; Mon, 22 Mar 2021 13:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VRN75fiZq3z0KsQUrseR+n6u9jCms7lasgObIRtwiok=;
 b=r4dR3MBOpVmKBR+8fSZcoMzu2dgyUoK3HFccRcnWoQ50uKFwhgY0TuttELxN+QhBAG
 tjPC8kuaPop+3jl5xR3lAHgWxcfl3mJ4PXrCElWUPMRhIwHj497UBKHZ31M3f/a+biBp
 T3TSG3fjhLMcu7gYiInhcRNazQ+umDYIF58SlpjVXT2lGjciewzA2irKVRhuxwYa2Jtx
 2gjngSFOmWi7yQlo1cii5KWRicJOWu54m/lc9zwmZ0y82/ZBCLW+oSdFVq55fKWskNM7
 pMkju6A++2ts2rJH2WyaY3cHWRKJtAcjxpipc/EVUj2Stdlj/YkuFqtHHYtlHvDacfno
 glUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VRN75fiZq3z0KsQUrseR+n6u9jCms7lasgObIRtwiok=;
 b=Sydwyozmn0IpNysIdKVHzZiw6xPAbk4w4lo49D9apbK+9xvEivyzslYAvvahKZ22qU
 E2thdxBo9oM1P4vllmSwoB+EorVV3gyW2jIN6eV+QA362dPVSSDlQBy680eLZyBSp8bm
 E4UNZKeHn82xyvylTdUF4+zZMGeuYQJyLwy5jBB6O8fngvE/vP8Oql3tcwBIXFL2BESY
 1ZZawF3UJlv34O9VlwB0fEfpd7pi2d5aalksVavjcXz7ty/CSShjnszcwudzjmB7as1F
 YNy43nfGzKAzsWczc8ZPfyTozJh17eEinU/bDs9MuqIfo8HbPbPxJGo2OO4ahf3IPHmC
 Y4Qg==
X-Gm-Message-State: AOAM530v8818vgMBlykgwZ6+a4Slqup0yLAkIUFnbVFNXusYAI0UGgLS
 C46d1GJSq6+3ZljTv5yiI8MxNJhwTwY5XLgg
X-Received: by 2002:adf:8151:: with SMTP id 75mr323008wrm.152.1616444019883;
 Mon, 22 Mar 2021 13:13:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u15sm419548wmq.4.2021.03.22.13.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 13:13:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/pci-host/gpex: Don't fault for unmapped parts of MMIO and
 PIO windows
Date: Mon, 22 Mar 2021 20:13:36 +0000
Message-Id: <20210322201336.9539-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-riscv@nongnu.org, Arnd Bergmann <arnd@arndb.de>,
 Dmitry Vyukov <dvyukov@google.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E43zuGpHwc0Y

Currently the gpex PCI controller implements no special behaviour for
guest accesses to areas of the PIO and MMIO where it has not mapped
any PCI devices, which means that for Arm you end up with a CPU
exception due to a data abort.

Most host OSes expect "like an x86 PC" behaviour, where bad accesses
like this return -1 for reads and ignore writes.  In the interests of
not being surprising, make host CPU accesses to these windows behave
as -1/discard where there's no mapped PCI device.

Reported-by: Dmitry Vyukov <dvyukov@google.com>
Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not convinced that this is 6.0 material, because IMHO the
kernel shouldn't be doing this in the first place.
Do we need to have the property machinery so that old
virt-5.2 etc retain the previous behaviour ?
---
 include/hw/pci-host/gpex.h |  2 ++
 hw/pci-host/gpex.c         | 37 +++++++++++++++++++++++++++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index d48a020a952..ad876ecd209 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -49,6 +49,8 @@ struct GPEXHost {
 
     MemoryRegion io_ioport;
     MemoryRegion io_mmio;
+    MemoryRegion io_ioport_window;
+    MemoryRegion io_mmio_window;
     qemu_irq irq[GPEX_NUM_IRQS];
     int irq_num[GPEX_NUM_IRQS];
 };
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 2bdbe7b4561..1f48c89ac6a 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -82,13 +82,46 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
     PCIExpressHost *pex = PCIE_HOST_BRIDGE(dev);
     int i;
 
+    /*
+     * Note that the MemoryRegions io_mmio and io_ioport that we pass
+     * to pci_register_root_bus() are not the same as the
+     * MemoryRegions io_mmio_window and io_ioport_window that we
+     * expose as SysBus MRs. The difference is in the behaviour of
+     * accesses to addresses where no PCI device has been mapped.
+     *
+     * io_mmio and io_ioport are the underlying PCI view of the PCI
+     * address space, and when a PCI device does a bus master access
+     * to a bad address this is reported back to it as a transaction
+     * failure.
+     *
+     * io_mmio_window and io_ioport_window implement "unmapped
+     * addresses read as -1 and ignore writes"; this is traditional
+     * x86 PC behaviour, which is not mandated by the PCI spec proper
+     * but expected by much PCI-using guest software, including Linux.
+     *
+     * In the interests of not being unnecessarily surprising, we
+     * implement it in the gpex PCI host controller, by providing the
+     * _window MRs, which are containers with io ops that implement
+     * the 'background' behaviour and which hold the real PCI MRs as
+     * subregions.
+     */
     pcie_host_mmcfg_init(pex, PCIE_MMCFG_SIZE_MAX);
     memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
     memory_region_init(&s->io_ioport, OBJECT(s), "gpex_ioport", 64 * 1024);
 
+    memory_region_init_io(&s->io_mmio_window, OBJECT(s),
+                          &unassigned_io_ops, OBJECT(s),
+                          "gpex_mmio_window", UINT64_MAX);
+    memory_region_init_io(&s->io_ioport_window, OBJECT(s),
+                          &unassigned_io_ops, OBJECT(s),
+                          "gpex_ioport_window", 64 * 1024);
+
+    memory_region_add_subregion(&s->io_mmio_window, 0, &s->io_mmio);
+    memory_region_add_subregion(&s->io_ioport_window, 0, &s->io_ioport);
+
     sysbus_init_mmio(sbd, &pex->mmio);
-    sysbus_init_mmio(sbd, &s->io_mmio);
-    sysbus_init_mmio(sbd, &s->io_ioport);
+    sysbus_init_mmio(sbd, &s->io_mmio_window);
+    sysbus_init_mmio(sbd, &s->io_ioport_window);
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
         sysbus_init_irq(sbd, &s->irq[i]);
         s->irq_num[i] = -1;
-- 
2.20.1

