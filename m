Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp218583eja;
        Thu, 22 Feb 2024 04:55:34 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWFzrbzRRM+xju/CIxMGVLKYLYzXWiW2S4K+COOlxe6+ISEqphp6jl96np6xZfE268PQFH431kQvlrFpJR+XrnusgDGyL/I
X-Google-Smtp-Source: AGHT+IGlcfDTPsmuD58590wGG4L5jywuuzoaxYxY6Lo+txKX5Lcguj6BYtYsJMYuMF2blzbU9r3l
X-Received: by 2002:a05:6808:1481:b0:3c1:5f35:38a4 with SMTP id e1-20020a056808148100b003c15f3538a4mr11049660oiw.6.1708606534552;
        Thu, 22 Feb 2024 04:55:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708606534; cv=pass;
        d=google.com; s=arc-20160816;
        b=JHU2faXQgCprfUT3NhpDx4BOnv2L+g65tlJBT6HZG5SP3lyGorI9t1DQ2kcWGXWOwc
         H7RQhdoqNT35oL7azwXRkkUnCw9DfBVffKT50xqeBfTrTYdFgX/ltVL+3j3tj5DmT+hu
         TQW6DMj7T0idrYGpBmLPPKt6LDjq80VOIh8r9Iiy3timVP1+WF2cCIQnqih18WjMv7fB
         0MdO+513ybB4Uib00ukJhQ26iH/NFsvDNYit27g8ikW5O2vvV1wHDuCllvph/h3ZWZ5L
         HTXJUSp83Z8mt+wpbuCLPldQRxhQOfwo/V/dn2wcZ+QXuT4qw4WVXLyV6qGx3ZRF8EWi
         ty/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+ZxPkAn9Il3IN8rHQ8R89Mlj+pjG0aoXx4zL2lsx2sI=;
        fh=VvXo8ri41W3EzWaqHFDpzK5/D0ENd9CiEsa2kpn5A9s=;
        b=NA9tqGIG79sbuDeskeLCi9pz4KM8QzybLD5bBBdzgxaCClaNTPSD4VacI2fKAq1w41
         KwR6Q8lp84MRh7RAHG1N0VzkbqjZptGIpkiuuUkoghcEDuCXPG3quGX0r0lxqlOCYTcO
         ee9PG0yOqujZL8WcUR9RDxnFev1q1n+9F6kxaM7vcFaxHZaQ+ZU1eK59w2f4o7EbxMtl
         aVje8dWM/m7sEaVCkv27IqW5yjTeTdXCdvrKAndDlVgGR/jkVp1bsqQGgu7Mnhzo0d0s
         V59TUGlknv+R8JMevqHGIkiADvbK86NFHVUK6tfveH2HYTu+gBqRSoGmaU3BseO2Eh7b
         owYQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xlriqtqx;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-9386-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-9386-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-9386-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id dt18-20020a05620a479200b00787a6b110d4si420919qkb.672.2024.02.22.04.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 04:55:34 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-9386-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xlriqtqx;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-9386-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-9386-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20E7D1C23BCF
	for <alex.bennee@linaro.org>; Thu, 22 Feb 2024 12:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7998412EBDC;
	Thu, 22 Feb 2024 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlriqtqx"
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF5712E1CF
	for <kvm@vger.kernel.org>; Thu, 22 Feb 2024 12:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708606524; cv=none; b=kYjXheLAdY/OJCeJ6m4vAUrpkCD2TCyT2oekFivANu3GnKsn8qYq1iADV+Lhw2OCswjxrfcJTmKAUp3LZ6MBt6vd9ihHMTpssNlks/ssTboo0ic1mjHrjJqOx89lr5HzL6Eqrm1rvUiqKAsJYYLf7G/XMMbBdJHlTRKC1WZEWb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708606524; c=relaxed/simple;
	bh=V002//gIur4N+NUBd0RRHxjo9K/oZ2rYYU/NjuCO5K0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aDWFAifM7yTQhkYttHR70vL1/4xLUIYOjEDqrmNNM+5qw4CSv8JT//ZXcG9gkAr4UGw46eN73QTN1ehqAU8rI/A5TKxOukG3X/ds6+I8Ph4LWmqjWJHy6yWCyMLWnnU91PWzANIy+5Exjo0S49ZFZ2EePkEXoGAED97LlohC7jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xlriqtqx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4128d15ae56so2156615e9.1
        for <kvm@vger.kernel.org>; Thu, 22 Feb 2024 04:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708606520; x=1709211320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZxPkAn9Il3IN8rHQ8R89Mlj+pjG0aoXx4zL2lsx2sI=;
        b=xlriqtqxMmHtkXd1OxAPUdu2F2Tc5KwBhOddmY3q+5kvTMuwiPPuBnu8miyfrlZjDO
         xundPFIzg454mJcFGu0NYI1CtdB4/hd4jI0d/ePwc9YfRa61tbHEtLtAtkPqNW+A6JRO
         KRy0g9uG7MVuJ8eY2b5oei8sLPveX7wm5gXTKtna9a45V7HM5sIXz/JqZCqw3cC2QRva
         esCi6MZqsNnZeJiqcOJpkI3/6itVqxxIYDTnQ0mogs3GPef76fWbSzn9Emz44L15emB+
         1RWAuAQtYEdOgwVpIyayG30y7tPmpi6qtHavpZsztw4OW8vK7BMbBSiqOXyXHZWXZMzM
         GQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708606520; x=1709211320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZxPkAn9Il3IN8rHQ8R89Mlj+pjG0aoXx4zL2lsx2sI=;
        b=mnnX9Zf4OiyGOlf2I1mkuCTcqof7JHWbLfW+PpfwH9kCg4CeCRmsD+pSc4LODtBccg
         NJz9DfqV5dNkJme3K0xP0pqGTKs0qTTPznGyAw26W1zTPoAlO8YNu3Nw+KUzOS69lfTH
         s7nK9doQftfi2iYXDOuIDEcxG2pOCldAXI1qxokbU0PHZsSIe7CGp6Ok9PAUQYt9U21W
         TqK02sa/vBV4T4PnAqFIcBHhkhEVfEkwK4+AO3/BX7UcVMYAL67eYu0/R2Ayy0iK1bPA
         AbnVi93OB3bk92N0UL0EfIvcfD571Vw98I6FWeQ5WW6VgsA4Qi2YKlIbDvltiOC/uk46
         x9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWE5Iq0tVSCcJsv1hnbDZsWteHE5ATf25woeD2G6Sg77tJP2GbtMZ4D+s70eQjbXAyZE93RSK6GzaKhhHzWMuWL6fG9
X-Gm-Message-State: AOJu0YxzcBj94ba0wppzSzaXdabuRrF3zXEgAzSXLuOTtcXC9QS3SQ0L
	83We7I+skBlTai8eHJb4nfhOGov6CLFHeQbjHoQrEx0EJTXaFVlLghp/dWEoJV8=
X-Received: by 2002:a05:6000:10c6:b0:33d:7d88:bd3e with SMTP id b6-20020a05600010c600b0033d7d88bd3emr3316027wrx.43.1708606520647;
        Thu, 22 Feb 2024 04:55:20 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
        by smtp.gmail.com with ESMTPSA id k1-20020adfe3c1000000b0033afc81fc00sm20170135wrm.41.2024.02.22.04.55.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Feb 2024 04:55:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	kvm@vger.kernel.org
Subject: [PULL 02/32] hw/sysbus: Inline and remove sysbus_add_io()
Date: Thu, 22 Feb 2024 13:55:08 +0100
Message-ID: <20240222125517.67131-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bdXwIG9ub0ga

sysbus_add_io(...) is a simple wrapper to
memory_region_add_subregion(get_system_io(), ...).
It is used in 3 places; inline it directly.

Rationale: we want to move to an explicit I/O bus,
rather that an implicit one. Besides in heterogeneous
setup we can have more than one I/O bus.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20240216150441.45681-1-philmd@linaro.org>
[PMD: Include missing "exec/address-spaces.h" header]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sysbus.h | 2 --
 hw/core/sysbus.c    | 6 ------
 hw/i386/kvmvapic.c  | 3 ++-
 hw/mips/mipssim.c   | 3 ++-
 hw/nvram/fw_cfg.c   | 6 ++++--
 5 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 3564b7b6a2..14dbc22d0c 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -83,8 +83,6 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
                              int priority);
 void sysbus_mmio_unmap(SysBusDevice *dev, int n);
-void sysbus_add_io(SysBusDevice *dev, hwaddr addr,
-                   MemoryRegion *mem);
 MemoryRegion *sysbus_address_space(SysBusDevice *dev);
 
 bool sysbus_realize(SysBusDevice *dev, Error **errp);
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 35f902b582..9f1d5b2d6d 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -298,12 +298,6 @@ static char *sysbus_get_fw_dev_path(DeviceState *dev)
     return g_strdup(qdev_fw_name(dev));
 }
 
-void sysbus_add_io(SysBusDevice *dev, hwaddr addr,
-                       MemoryRegion *mem)
-{
-    memory_region_add_subregion(get_system_io(), addr, mem);
-}
-
 MemoryRegion *sysbus_address_space(SysBusDevice *dev)
 {
     return get_system_memory();
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index f2b0aff479..20b0300357 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -16,6 +16,7 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
+#include "exec/address-spaces.h"
 #include "hw/i386/apic_internal.h"
 #include "hw/sysbus.h"
 #include "hw/boards.h"
@@ -727,7 +728,7 @@ static void vapic_realize(DeviceState *dev, Error **errp)
     VAPICROMState *s = VAPIC(dev);
 
     memory_region_init_io(&s->io, OBJECT(s), &vapic_ops, s, "kvmvapic", 2);
-    sysbus_add_io(sbd, VAPIC_IO_PORT, &s->io);
+    memory_region_add_subregion(get_system_io(), VAPIC_IO_PORT, &s->io);
     sysbus_init_ioports(sbd, VAPIC_IO_PORT, 2);
 
     option_rom[nb_option_roms].name = "kvmvapic.bin";
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index a12427b6c8..9170d6c474 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -28,6 +28,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/datadir.h"
+#include "exec/address-spaces.h"
 #include "hw/clock.h"
 #include "hw/mips/mips.h"
 #include "hw/char/serial.h"
@@ -226,7 +227,7 @@ mips_mipssim_init(MachineState *machine)
         qdev_prop_set_uint8(dev, "endianness", DEVICE_LITTLE_ENDIAN);
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, env->irq[4]);
-        sysbus_add_io(SYS_BUS_DEVICE(dev), 0x3f8,
+        memory_region_add_subregion(get_system_io(), 0x3f8,
                       sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
     }
 
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index e85493d513..fc0263f349 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -27,6 +27,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/dma.h"
 #include "sysemu/reset.h"
+#include "exec/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/qdev-properties.h"
@@ -1142,6 +1143,7 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
     SysBusDevice *sbd;
     FWCfgIoState *ios;
     FWCfgState *s;
+    MemoryRegion *iomem = get_system_io();
     bool dma_requested = dma_iobase && dma_as;
 
     dev = qdev_new(TYPE_FW_CFG_IO);
@@ -1155,7 +1157,7 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
     sbd = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sbd, &error_fatal);
     ios = FW_CFG_IO(dev);
-    sysbus_add_io(sbd, iobase, &ios->comb_iomem);
+    memory_region_add_subregion(iomem, iobase, &ios->comb_iomem);
 
     s = FW_CFG(dev);
 
@@ -1163,7 +1165,7 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
         /* 64 bits for the address field */
         s->dma_as = dma_as;
         s->dma_addr = 0;
-        sysbus_add_io(sbd, dma_iobase, &s->dma_iomem);
+        memory_region_add_subregion(iomem, dma_iobase, &s->dma_iomem);
     }
 
     return s;
-- 
2.41.0

