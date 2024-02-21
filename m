Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2172802ejb;
        Wed, 21 Feb 2024 13:17:00 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVTrI6mzb0/SiR7OPG7FVHzi/o7YxlP3wL3g6m4t+BgfwQqAiAnKRDC+fnJ0VBiiM86auYjyt/1iibz812k+wt8v8WgSAF5
X-Google-Smtp-Source: AGHT+IHKUFDRr8xY8ypwtJnxgZNK2zAMts8bmrcgF8MCdE42i71nTb9bZygXlWyrzJlunDrwoqZY
X-Received: by 2002:a05:6a20:9f8c:b0:19c:b457:fb8 with SMTP id mm12-20020a056a209f8c00b0019cb4570fb8mr22610180pzb.51.1708550219931;
        Wed, 21 Feb 2024 13:16:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708550219; cv=pass;
        d=google.com; s=arc-20160816;
        b=a99dhY1Mnvtdfz7P8iSxEmSPYze8VDKcDws1KVJpVBuSPEmLQ1BUJZLOntlj0oqsh0
         eE8gjksHwdf+MgpJ0iZ9WUDt9UuD5ap/juf6AR0nQzXMQz2LzdVvvM3ud85+tyzRDcQi
         poRmnxG9Zm1YgHKNGfyNjfy2S7PwWAAtJZD65c5zB9RCajUCGOWjb6fvwIXHcOYTGKFe
         P6CfLtEM+POeLT3PMNEWBVjyJBQGTVcwFR4jozH9U5k/P6AHlaam8vw2nOZt5/ELa3Ej
         NLPxzDcXeZ4myQkl2/TySepw3mwN6c+Yu3M3bz7wCwVCegBbDYJEvJrlkRas+1EdkMP1
         EwHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=krMCnSm7PN59WBp42omeBRDoSFldcCIH3sGDX1JOTwc=;
        fh=P5NKF6l2aUcst1dy/I0oNWzzEvITTF37xqTJD6FbVm8=;
        b=jDkDgqO08nUKcSe1rQBEF0COPm2LJoP7bXSVNZgq0h7Zq1bMM215jk2m88tE9L886x
         rMj4TYTRPZkTe/0UaLCbMq5OjCnJi7W5arTF/0Ssb1+bv67G0xwJUCftYSB+ND0/AtIe
         jywUjgDNCCLfEwvReDvUz9PnS8+kw+X6WiXyaqmnfS6h8vuVxbUSGxxqnYlM4lL5Mlcl
         sFd4OnjefctRP978c12Cz9GQiQMcMkCbf3MWJTZFOJ7mxxBVEmlWgbYFxrsS1IYKPk9s
         zKXq3+nxJJz5lhhGJDJGUZlutJebAREXT3xVW4PoWKV2hC7FUQZZxGYNFx7lnIzDrVVE
         VAlA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q9kHMW7s;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-9342-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-9342-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-9342-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id z2-20020aa78882000000b006e484e13455si2884183pfe.237.2024.02.21.13.16.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:16:59 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-9342-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q9kHMW7s;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-9342-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-9342-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99DAAB25254
	for <alex.bennee@linaro.org>; Wed, 21 Feb 2024 21:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E33B86AD5;
	Wed, 21 Feb 2024 21:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q9kHMW7s"
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5037385927
	for <kvm@vger.kernel.org>; Wed, 21 Feb 2024 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708550206; cv=none; b=aMdafrmnwUh5sw6rkQiKOBJ4NE3at8hMAjC3DdYHcHwbAF0m8Be4fPrQVZxPv6FTHe6tI66FgK0JfdrT+WhN6Mt0Q05jXF9LfqQ73M5soebsgDeT8zB2zlQ5xTb9MqNU2f+3dtYc3Xzjcu390aukYungariDNQvRwjwToe5hGC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708550206; c=relaxed/simple;
	bh=Nman6J6nntuhSIWvoHa/yhkSJpHd7hSZDfmlCwMKDj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MqaC96pEyApoNvPw0iloq+wiHL4n3fUP0qDEN+9nyH4FuZzY+nscuz+tg+eZ4hZ6B4QjEtutoRtDOt4ocDdLKzk6jsCCm4AXfcbjny0sP+4K7Nc95HoKH/S/w17ghZwph5iS+lQBwxRLxZY3ZuNvhQbXk+SpVXxGCwTQIe8vor0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q9kHMW7s; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33ce8cbf465so3658814f8f.3
        for <kvm@vger.kernel.org>; Wed, 21 Feb 2024 13:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708550202; x=1709155002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krMCnSm7PN59WBp42omeBRDoSFldcCIH3sGDX1JOTwc=;
        b=Q9kHMW7sCQFaIcmvM1JKA7b+76wASVjOA+FrJY4PlVeM2EPxFjX+Iv9H6smale6/Oy
         z7s8W/a+spXxLkuIJ5D3NmsL95huF/AlJwEWzIwerIyBYcjJsFftyVOyHkYdSmoJHlR6
         eNiy2Qbuapx2Sf3fphuerBc4uWGGGUsez5z0+PlXKHEcRA2c1VCsugcrYSVYfAhK3hNm
         JhU2zecWFMxh5MBuk+sk6B0idPV68HdCIxuqKQDI7BNyl/D2Zq10TMMQQ2Us5rE3jGCu
         GCikqe5SCnDRJxgP1K7Z4LKtOG1+3skzsH12JUA1BdRcIUVO/bLgQh6qc3DbWZOv5j2F
         bzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708550202; x=1709155002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krMCnSm7PN59WBp42omeBRDoSFldcCIH3sGDX1JOTwc=;
        b=Nmc6gNKA30RELVhkmH2582F+mAstxHAZVBIDgx3/kRGPB98L5orS8qnUsNHiTM1kkR
         kTeJoYDMf4D/I5drHvPuZPm+/fdAWUMjYd7yl3VBnZkQiZfBxi9NvFajP+SRNVgV61Cr
         JO+kvcTzaqbsuC+ZS6KnUASgeVpJ6hzRvsqVi1zhpQiLoGOpwZBOC/uN+FDP3Dp70vaM
         aQChDIPnSyD083q5TStmPN/Ac+gdLSpDU/8eRy5GVjhcZMW9SAnTWx9l6VzCmtHj+6/l
         wGzOrvZH6o6E/aqcak/uomzzz/rhb5LcXGq58sKCuwxhi2qHfslsHXRwkrVgqPUgXg5d
         om4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKE6yh5HB27RKQdkwWs3kW4pJTFcOcMPZrH5lfvrIDExTCODIKGAA432vzxGMzITWnTsdRtNDBU2XgMPbJ47Kbsu4I
X-Gm-Message-State: AOJu0YxO5M19U4jH99SaHWZDsc+MIgDhqfdXu4QK6RIpw7MhfOqYx6Wv
	B+P7YScsuUh5ffOvUHDLVpS3uWMe6+AYvcUNFUF49zG9hGUzO1zLj5S9p5Et4ak=
X-Received: by 2002:a5d:648e:0:b0:33d:3bc2:7acc with SMTP id o14-20020a5d648e000000b0033d3bc27accmr9430955wri.11.1708550202692;
        Wed, 21 Feb 2024 13:16:42 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
        by smtp.gmail.com with ESMTPSA id ba20-20020a0560001c1400b0033d640c8942sm7735227wrb.10.2024.02.21.13.16.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Feb 2024 13:16:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-block@nongnu.org,
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
Subject: [PULL 02/25] hw/sysbus: Inline and remove sysbus_add_io()
Date: Wed, 21 Feb 2024 22:16:02 +0100
Message-ID: <20240221211626.48190-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
References: <20240221211626.48190-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +gkg5LnD+6Zp

sysbus_add_io(...) is a simple wrapper to
memory_region_add_subregion(get_system_io(), ...).
It is used in 3 places; inline it directly.

Rationale: we want to move to an explicit I/O bus,
rather that an implicit one. Besides in heterogeneous
setup we can have more than one I/O bus.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20240216150441.45681-1-philmd@linaro.org>
---
 include/hw/sysbus.h | 2 --
 hw/core/sysbus.c    | 6 ------
 hw/i386/kvmvapic.c  | 2 +-
 hw/mips/mipssim.c   | 2 +-
 hw/nvram/fw_cfg.c   | 5 +++--
 5 files changed, 5 insertions(+), 12 deletions(-)

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
index f2b0aff479..3be64fba3b 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -727,7 +727,7 @@ static void vapic_realize(DeviceState *dev, Error **errp)
     VAPICROMState *s = VAPIC(dev);
 
     memory_region_init_io(&s->io, OBJECT(s), &vapic_ops, s, "kvmvapic", 2);
-    sysbus_add_io(sbd, VAPIC_IO_PORT, &s->io);
+    memory_region_add_subregion(get_system_io(), VAPIC_IO_PORT, &s->io);
     sysbus_init_ioports(sbd, VAPIC_IO_PORT, 2);
 
     option_rom[nb_option_roms].name = "kvmvapic.bin";
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index a12427b6c8..57c8c33e2b 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -226,7 +226,7 @@ mips_mipssim_init(MachineState *machine)
         qdev_prop_set_uint8(dev, "endianness", DEVICE_LITTLE_ENDIAN);
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, env->irq[4]);
-        sysbus_add_io(SYS_BUS_DEVICE(dev), 0x3f8,
+        memory_region_add_subregion(get_system_io(), 0x3f8,
                       sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
     }
 
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index e85493d513..6d6b17462d 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1142,6 +1142,7 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
     SysBusDevice *sbd;
     FWCfgIoState *ios;
     FWCfgState *s;
+    MemoryRegion *iomem = get_system_io();
     bool dma_requested = dma_iobase && dma_as;
 
     dev = qdev_new(TYPE_FW_CFG_IO);
@@ -1155,7 +1156,7 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
     sbd = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sbd, &error_fatal);
     ios = FW_CFG_IO(dev);
-    sysbus_add_io(sbd, iobase, &ios->comb_iomem);
+    memory_region_add_subregion(iomem, iobase, &ios->comb_iomem);
 
     s = FW_CFG(dev);
 
@@ -1163,7 +1164,7 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
         /* 64 bits for the address field */
         s->dma_as = dma_as;
         s->dma_addr = 0;
-        sysbus_add_io(sbd, dma_iobase, &s->dma_iomem);
+        memory_region_add_subregion(iomem, dma_iobase, &s->dma_iomem);
     }
 
     return s;
-- 
2.41.0

