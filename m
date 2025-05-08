Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp428383njb;
        Thu, 8 May 2025 06:39:31 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXC9TA27sy5+sB9w/vuRR3J1YdCjtfYS51uVnkPJNGtjLqRVhqDZMREv1ukSfyKL2IFyOa8QpbGxevWBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEQd/P7OPL0Bwho4tmdZ3QTNTq+yVXql17pixQeGi/JZNh7KWj3w3EogcEVpNXgXQaAOOvV
X-Received: by 2002:a17:90b:3903:b0:2ff:5ec1:6c6a with SMTP id 98e67ed59e1d1-30b3a6745ebmr5552206a91.18.1746711571668;
        Thu, 08 May 2025 06:39:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746711571; cv=pass;
        d=google.com; s=arc-20240605;
        b=Ki4vrN2/QxJ4tZcXAG/Q0GslLezc7VFoqZyIXbJYdHFXcVyFhRdilAE8Sk3yut1opc
         MsxDwMARgVDTjtvVA446QyBNG858u9dpJgv4n4f3ke0lPN5i1jEy6R7bLqGDQDuMN4bW
         CVvHTx0A9JZV/aV/ZTq6kXyiH/v5CCWFIoRpJxQTVhwICDtjj+UkLmGT9a3e7xIh8KgQ
         oNXpggAASejiGouYPnjNBcvUkgJCDEh2ZVRY7BOxwgT4fTKvLLou5ux26MEIcACpZ/+w
         /Ow+0t1MdV24tgorC+JdekWljG630sUfKJ6067yHWj6h5B1VWOJb4yfGsCChVwczpuvj
         1wSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=cAbS7dd6OYaBgTRts6heMSablah9GO0KM+pjh24R5k0=;
        fh=VDttybbh+dAt25Fxz9w2CSWO920kFnrrk8Xr3mNkRkI=;
        b=WYcwnBdzcH4tRSy+ZUauoaQvtyt+OyFKwpjva3tZs/PAmWwxCZJol4ZWY2kCAsycBo
         oS4p8ZAxxoqYyrBVM4j74x0akh8EYBUw1bOllT59btc7LxeHQcmW+ANOQ0qIQ3DUilyN
         f84rMx+54JGILHPnW/RMTwhET7bb1tnRu1RHrPuQpUleofmEqDMz6Nu2NBwg156pyETY
         dYRzP+Xd0aLnRqSZrC3LG0kf6b/der/fZG7ykw3MSwDfk9NLiO/YNIn7dbzSV9haD5lx
         VOKtYJjlUSGuSdxpoMyk3UkgGI8eO8gyCly5RRKkVA/VtmLfB9pbbZrMKSONFS++J4qS
         ycVQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hYcOlIh2;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45868-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-45868-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-45868-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-30ad4f93d8dsi3446818a91.167.2025.05.08.06.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-45868-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hYcOlIh2;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-45868-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-45868-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E50FF3A41AB
	for <alex.bennee@linaro.org>; Thu,  8 May 2025 13:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34583223DC4;
	Thu,  8 May 2025 13:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYcOlIh2"
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F584D13
	for <kvm@vger.kernel.org>; Thu,  8 May 2025 13:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711567; cv=none; b=r2J8s+11RMPXU5Key9VunCZEyuEGxRnMvtD21GVRlCIiTdwvaXPw0MsBWpQKfE3wETi4r2v+NH/iXoD8RRoy5x/vDefLXsr7vFHChXxkD7/u5nAvZXcq9iGpzpVNZ1mVQbS5Ozw7XiifjC8DY1mZWFRmqB7w5fJTf8JVa+UXruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711567; c=relaxed/simple;
	bh=Eaxuxky+DCM+LhvF8NoTGqc4aLtPj3Kobpo33q4TsMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uKJLYlKVo+CO+ppDUZ9Kb6bop7T7cN+ifdZyuvxGb1Yg+9zZhtg7pNiQN4qbjpyizOPhk2ILNmQUPp1U5/wV/6phS/86b4cr+3Xyq5qvClTe4AEgp7r8Qh5p6IvufA74jr2mU2foJo1PwatZSkrTcLUFugvTDSh62Q07BbnRHsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hYcOlIh2; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af579e46b5dso578243a12.3
        for <kvm@vger.kernel.org>; Thu, 08 May 2025 06:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746711564; x=1747316364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAbS7dd6OYaBgTRts6heMSablah9GO0KM+pjh24R5k0=;
        b=hYcOlIh21dcXinsAapRZ2/skP8If5g0hsvtARD2BNyzb0RtnPMzAwfQpulgH2idx9t
         OUMgQLY3nZhxAGK/n3hZKpa+aDIkp97UQHjNMxNMZUfSsJnU9/l46gy1R2jdX4JAgBfU
         g0QLvV3dcJHa5qn4D8BNTQqoakHMBle34JH6sxkTtM8Y6YY781cOxRTui+sP0PJzOhp2
         iJl8WVk5dVUI0q93b5nok/8jdbxu2QEf4lRgsIxThIxmRiub9A5qPaIzIuPK5lcYl5Y9
         Lh9hTY7Ocw6hUr1Aez/2KWoX1Em+RX+9uFcq/xAYm+fUoyzQ1AMRiVy2yKNVRlilC72i
         OYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711564; x=1747316364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAbS7dd6OYaBgTRts6heMSablah9GO0KM+pjh24R5k0=;
        b=C+fk0nJY/5E8BTpH6xS2nfPXWpckH3FECftll3w6RtSloEufLJ6AYjkDgtPb1X7gz7
         DlmQZ/X4RCiz9l0Yz4uCLZmORopBW9Kn3BsdbSfZzD57w8z+wq41IUdI9FJZLl+o1S5q
         xtnxFzLxrZQ9GKplm3hevwv1cv1UmUVZpbuV8nqTtwP9++DZRvPvg9AYMo5EX+VsbtFC
         sH6EpKV6lFeH1YQqdfWzbWzqGtaT3TDq89Y4WCCB53+BXSynmDtOmg8K11vjsLf38dom
         oV3r1XuKPR9WRpo4gNgN6c7rTh00Xl3cCXGjNI1dId8kK81ypUlKm7HYRML2wSf+vQq0
         m2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9oCLcq5GyKHRkDhc28ocGyJo12iNvvhti7ToYdNOpoGHGnyH9uRRVl1nDET/BYUETaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1mayz9osnQNh7lZvRqqvVkaU6ISFRJOL++V6xB04BBnUifKY/
	n2xcrH2+lEatY07fUyNbcRX1COact/ShUt/wI7txW44x37BGHmrTSPBlYUO1lhM=
X-Gm-Gg: ASbGnctGSD1cEE4pVi49/w4rx9oScecE/waYUfAsIPE8yU7+hu+ZjXXNftXtj9GKmhL
	oH9LQN3pDJJ334OzDjMvWScjnXMAFSE0iFz5jcEyE2yD/G21VTs7ZUw5ffabTwObsDm63c4ZMP2
	AjpShoqlkXEG8rXxET2rGy8GMLST9D9zcvd7PMgDgc3nssMIIGp2nWkNgDoDRZhyzsXM9Gth9p5
	g/J94QOgLLAaTDNV67aFcHfA2O673UCZ/pfx8Rb4Sj3DOY2cRq2STEN9sGLXs4+O5H0qi0/hN7U
	ZTbeQdGYG35nur49Inrpf+aSagJGd49EEPuPiQneJTFC+XFA+b+pzapm90jsMrxYXa6IJgQM+5F
	sTMz/BIufjrQGOIc=
X-Received: by 2002:a17:90b:4ad2:b0:30a:a38f:f78b with SMTP id 98e67ed59e1d1-30b3a65b933mr5249495a91.9.1746711564599;
        Thu, 08 May 2025 06:39:24 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522a667sm111765955ad.171.2025.05.08.06.39.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 May 2025 06:39:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	Sergio Lopez <slp@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Yi Liu <yi.l.liu@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-riscv@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Amit Shah <amit@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Helge Deller <deller@gmx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ani Sinha <anisinha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 09/27] hw/nvram/fw_cfg: Remove fw_cfg_io_properties::dma_enabled
Date: Thu,  8 May 2025 15:35:32 +0200
Message-ID: <20250508133550.81391-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: k8L/a8RJCEm0

Now than all calls to fw_cfg_init_io_dma() pass DMA arguments,
the 'dma_enabled' of the TYPE_FW_CFG_IO type is not used anymore.
Remove it, simplifying fw_cfg_init_io_dma() and fw_cfg_io_realize().

Note, we can not remove the equivalent in fw_cfg_mem_properties[]
because it is still used in HPPA and MIPS Loongson3 machines:

  $ git grep -w fw_cfg_init_mem_nodma
  hw/hppa/machine.c:204:    fw_cfg = fw_cfg_init_mem_nodma(addr, addr + 4, 1);
  hw/mips/loongson3_virt.c:289:    fw_cfg = fw_cfg_init_mem_nodma(cfg_addr, cfg_addr + 8, 8);

'linuxboot.bin' isn't used anymore, we'll remove it in the
next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/fw_cfg.c     |  5 +----
 hw/i386/x86-common.c |  5 +----
 hw/nvram/fw_cfg.c    | 26 ++++++++------------------
 3 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index 5c0bcd5f8a9..1fe084fd720 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -221,10 +221,7 @@ void fw_cfg_add_acpi_dsdt(Aml *scope, FWCfgState *fw_cfg)
      * of the i/o region used is FW_CFG_CTL_SIZE; when using DMA, the
      * DMA control register is located at FW_CFG_DMA_IO_BASE + 4
      */
-    Object *obj = OBJECT(fw_cfg);
-    uint8_t io_size = object_property_get_bool(obj, "dma_enabled", NULL) ?
-        ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr_t) :
-        FW_CFG_CTL_SIZE;
+    uint8_t io_size = ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr_t);
     Aml *dev = aml_device("FWCF");
     Aml *crs = aml_resource_template();
 
diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
index 27254a0e9f1..ee594364415 100644
--- a/hw/i386/x86-common.c
+++ b/hw/i386/x86-common.c
@@ -991,10 +991,7 @@ void x86_load_linux(X86MachineState *x86ms,
     }
 
     option_rom[nb_option_roms].bootindex = 0;
-    option_rom[nb_option_roms].name = "linuxboot.bin";
-    if (fw_cfg_dma_enabled(fw_cfg)) {
-        option_rom[nb_option_roms].name = "linuxboot_dma.bin";
-    }
+    option_rom[nb_option_roms].name = "linuxboot_dma.bin";
     nb_option_roms++;
 }
 
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 51b028b5d0a..ef976a4bce2 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1026,12 +1026,9 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
     FWCfgIoState *ios;
     FWCfgState *s;
     MemoryRegion *iomem = get_system_io();
-    bool dma_requested = dma_iobase && dma_as;
 
+    assert(dma_iobase);
     dev = qdev_new(TYPE_FW_CFG_IO);
-    if (!dma_requested) {
-        qdev_prop_set_bit(dev, "dma_enabled", false);
-    }
 
     object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
                               OBJECT(dev));
@@ -1042,13 +1039,10 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
     memory_region_add_subregion(iomem, iobase, &ios->comb_iomem);
 
     s = FW_CFG(dev);
-
-    if (s->dma_enabled) {
-        /* 64 bits for the address field */
-        s->dma_as = dma_as;
-        s->dma_addr = 0;
-        memory_region_add_subregion(iomem, dma_iobase, &s->dma_iomem);
-    }
+    /* 64 bits for the address field */
+    s->dma_as = dma_as;
+    s->dma_addr = 0;
+    memory_region_add_subregion(iomem, dma_iobase, &s->dma_iomem);
 
     return s;
 }
@@ -1185,8 +1179,6 @@ static void fw_cfg_file_slots_allocate(FWCfgState *s, Error **errp)
 }
 
 static const Property fw_cfg_io_properties[] = {
-    DEFINE_PROP_BOOL("dma_enabled", FWCfgIoState, parent_obj.dma_enabled,
-                     true),
     DEFINE_PROP_UINT16("x-file-slots", FWCfgIoState, parent_obj.file_slots,
                        FW_CFG_FILE_SLOTS_DFLT),
 };
@@ -1207,11 +1199,9 @@ static void fw_cfg_io_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->comb_iomem, OBJECT(s), &fw_cfg_comb_mem_ops,
                           FW_CFG(s), "fwcfg", FW_CFG_CTL_SIZE);
 
-    if (FW_CFG(s)->dma_enabled) {
-        memory_region_init_io(&FW_CFG(s)->dma_iomem, OBJECT(s),
-                              &fw_cfg_dma_mem_ops, FW_CFG(s), "fwcfg.dma",
-                              sizeof(dma_addr_t));
-    }
+    memory_region_init_io(&FW_CFG(s)->dma_iomem, OBJECT(s),
+                          &fw_cfg_dma_mem_ops, FW_CFG(s), "fwcfg.dma",
+                          sizeof(dma_addr_t));
 
     fw_cfg_common_realize(dev, errp);
 }
-- 
2.47.1

