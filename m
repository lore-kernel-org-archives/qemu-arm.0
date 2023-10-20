Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1360610ejb;
        Fri, 20 Oct 2023 09:37:43 -0700 (PDT)
X-Received: by 2002:a17:907:31ce:b0:9be:ef46:6b9c with SMTP id xf14-20020a17090731ce00b009beef466b9cmr1968118ejb.70.1697819863516;
        Fri, 20 Oct 2023 09:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819863; cv=none;
        d=google.com; s=arc-20160816;
        b=cUSyGGLbF8FkH1r5gnfyj6ANYUAYtrFj3zvcfnHbs1PyNX6ljACLhSBpmofYasyieJ
         a65612Rqk33nO/gL3WuzTXYwGoZbah9oBADnVBZADYfCaR5ckTqNjujvdno+rq+Bq8fY
         xwwqA4I7GdQOYGJXw2NGJKkpmtmpYOo4Se6c7DgIxZ8nV0A95feRfE6w0NMLzTPBX6em
         YRYmNUEXQlPA/pqNLkcaDSl5RpjiUpt8Gx98SeXGtt6auVxY0OIzmmq9V37M3eijPjq5
         IyX3RiEUA8MQaIb5kTEvl75m1Wfpd2TpRPYJvvTrDpxzEFLX2xiQou/Yg/pStXNjDESa
         aK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lIfqIPgjXaT+HDThdwR33vMHRV/AQLZXNgmR/zi6+zY=;
        fh=Nz4lhZ0AnKqvLF3aq2NyUZF0BmcdTN93FX5XK7mwXmE=;
        b=HiYzr8B0GSOxKDp1QgFjaF67hnuVUELBmQhy6KRMNv6fnFGDN/0XgGtQ8OVdqzuY0S
         N5l8lhIq4Bz/IOhtLtKldzWhl92BdjRV59Sf7mCIASRK70/QCKgNQZ3O/hW1ifYu+wrH
         mly7UmOag1FGIXiVFSf60fXWyxaSIE868q7NltPhivQXRpXoDPL5Xo+yAyE0UQOgOtLA
         lyzsiv8CPrdmCfm0aUh1RwhDoQsYntW03huwIbJDbj7nK5aNERpaOgt/A8sK7e1g91OL
         hk61r+4lUnYihwfyeETL4J8AgqwuQjUwIcfG4cY6pIbpXGyllkvw8t8CvmuHcO+wOe1g
         Bw8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qHsgl90e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e13-20020a170906844d00b009be0a6778cdsor696456ejy.2.2023.10.20.09.37.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:37:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qHsgl90e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819863; x=1698424663; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIfqIPgjXaT+HDThdwR33vMHRV/AQLZXNgmR/zi6+zY=;
        b=qHsgl90eXNSbVR+ZNsWiw5NLfXJZYkX1CHW5xtSQ+MRSMs+hDY4FdZumGfNY+Chy7E
         ZNepB2OStk3LeEhGwLPT9igP1K/X0xRbd0pMuiX72pYcxLiu5hUd6K423GcpiQjPqnZU
         CLB8rdxen9vxfJeBXJSmFvF4vc/ojG/ZDP9fJ4DM2iSHAzhmdvzrbv207dtUhRO+S8Aa
         UXrHdHTCW/WIPFdusBjOsLi/jH93u/IthxDyoUMsG4Rkq+E/7ZPaWFzKgrli67+MI0q3
         6kxHUFYP1Oz2wqkfm6nP5oFFRhdfYKYky4xVaIyBhW0BRbfkNkSSoXwP3iRVg7hnn70f
         Pyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819863; x=1698424663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIfqIPgjXaT+HDThdwR33vMHRV/AQLZXNgmR/zi6+zY=;
        b=jaNQ2Ca6T+zGpmRF58cA0HSjjbp/+ipvhS4ng2cYeenQpWdj9+7KhVUu8QkqxNRHo+
         1yy+iV5yrHEBlo964tLRTxBX8Cl1Cv0ByMALyJPWO+wg0aGs7HoCg71n7LCklGHvygxs
         2XkW3FBdWpRuAlvL/YLMAE0p+1ZqQDIte4IBmRb38vAJBcfy6AI8197pkTIVOApVFS6H
         g4qb/QOzKVsagBZCGmjGkv1qlnGlyz+iBaVI+x0mvhFlhIXKD4EvBESC0m/6Ozr8fJ51
         Zu3t5espRqVITiHLjbo1etzxUtajPIx3m9kgNLh+Vn0rFWV51J4wO4ufh9AMn/Id0FRu
         91qQ==
X-Gm-Message-State: AOJu0YyDsBJ9feWzw1zWKip3+dPpepMCJHnnPYva5CrYQ923Ch+ZJM4f
	Q6k8vRhvtvKDoo8UgS1t5AJHLC/5
X-Google-Smtp-Source: AGHT+IHBVyZvw4f5Hs2t7cng9Y5f77G/O2sVJ7W2ZL6Q5XN2PZL/Jc6G4ofUIv4JkhfUQQT3G+9t1Q==
X-Received: by 2002:a50:ab12:0:b0:530:7ceb:33c with SMTP id s18-20020a50ab12000000b005307ceb033cmr1872603edc.4.1697819863159;
        Fri, 20 Oct 2023 09:37:43 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id m14-20020a50ef0e000000b0053f0e4e0411sm1747279eds.76.2023.10.20.09.37.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:37:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 07/19] cpus: Filter for target specific CPU (riscv)
Date: Fri, 20 Oct 2023 18:36:29 +0200
Message-ID: <20231020163643.86105-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UvooX4jN78U5

Enforce qemu_get_cpu() to return RISCV CPUs in RISCV specific files.

Mechanical change using the following coccinelle script:

  @@ expression index; @@
  -   qemu_get_cpu(index, NULL)
  +   qemu_get_cpu(index, TYPE_RISCV_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/sifive_plic.c | 2 +-
 hw/riscv/boot.c       | 2 +-
 hw/riscv/opentitan.c  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 3e2534ac04..ea0e7af16e 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -499,7 +499,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
 
     for (i = 0; i < plic->num_addrs; i++) {
         int cpu_num = plic->addr_config[i].hartid;
-        CPUState *cpu = qemu_get_cpu(cpu_num, NULL);
+        CPUState *cpu = qemu_get_cpu(cpu_num, TYPE_RISCV_CPU);
 
         if (plic->addr_config[i].mode == PLICMode_M) {
             qdev_connect_gpio_out(dev, cpu_num - hartid_base + num_harts,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index ea733b3df1..1d004660d4 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -49,7 +49,7 @@ char *riscv_plic_hart_config_string(int hart_count)
     int i;
 
     for (i = 0; i < hart_count; i++) {
-        CPUState *cs = qemu_get_cpu(i, NULL);
+        CPUState *cs = qemu_get_cpu(i, TYPE_RISCV_CPU);
         CPURISCVState *env = &RISCV_CPU(cs)->env;
 
         if (kvm_enabled()) {
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index e98361de19..106ef5d2d0 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -190,7 +190,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->plic), 0, memmap[IBEX_DEV_PLIC].base);
 
     for (i = 0; i < ms->smp.cpus; i++) {
-        CPUState *cpu = qemu_get_cpu(i, NULL);
+        CPUState *cpu = qemu_get_cpu(i, TYPE_RISCV_CPU);
 
         qdev_connect_gpio_out(DEVICE(&s->plic), ms->smp.cpus + i,
                               qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
@@ -223,7 +223,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
                        0, qdev_get_gpio_in(DEVICE(&s->plic),
                        IBEX_TIMER_TIMEREXPIRED0_0));
     qdev_connect_gpio_out(DEVICE(&s->timer), 0,
-                          qdev_get_gpio_in(DEVICE(qemu_get_cpu(0, NULL)),
+                          qdev_get_gpio_in(DEVICE(qemu_get_cpu(0, TYPE_RISCV_CPU)),
                                            IRQ_M_TIMER));
 
     /* SPI-Hosts */
-- 
2.41.0
