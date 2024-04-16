Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp572392ejd;
        Tue, 16 Apr 2024 12:01:22 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXqJ37EJ/CToRDZ+rCGmqNA5nLTIrzLeHhPuyel3tpCxIC1yBQQaQUEdnTiXviVw2vrf3NtDBefeMx0bHktF1jAwRXfEQut
X-Google-Smtp-Source: AGHT+IEQm0NHn0YIcAQ5rNuIJ0bwb4VYbVwwtJz5Eb+2P3dmr8Y1fjDoMT9/EZ2JdU86SWqlRALY
X-Received: by 2002:a17:902:ce89:b0:1e5:10e5:b673 with SMTP id f9-20020a170902ce8900b001e510e5b673mr15655021plg.37.1713294081985;
        Tue, 16 Apr 2024 12:01:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713294081; cv=pass;
        d=google.com; s=arc-20160816;
        b=e39q1Y4J0uTTBkYm8bwWYzjLd2O2ziRv+RKwAaQzH4MDX9Q6EeOVUmC6rahG0nkox2
         6Q1VhKZI4M7XShv9Jjp4t6s3WNIB3DkJZYdx2Z9xPruu7fbyu9+nB4mTayWXAfIP3Z48
         aFo+696UDc2l1YurMJkl+iPtnZk9DPWQ25bIEzYwdPP4/vqs2T5zWHo0VQBKLBGl3N5j
         976JaqpLy0RnxWVnaJdWMlS7rtl1O0qIsGqkjFEJNgZ5+eUD9/YuMn9ZedmWZi9/LGQS
         fCXbaLZM6NGK84yM9AQF6YzxYOFDr63gCW4fRuWkmkCkIbmF7Y+2PXzB9/TY1gkPxGVY
         bq0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=3tX6emDsZqVY2muZJRjyArm9SgC2+2SHZUCWPsCYUO0=;
        fh=6i4hm9sv/gSwuHX/dzq6i7Lw+to7fPTOZGj6QV+OUzY=;
        b=S7VxUm9ELzg41sPDX26PDlyszfoJ02RPxc8xShfRphRsHd9q5hx8LNk/2Nf7NjAz+u
         3Yzts9w1ELNDCWQ7D52pQXaY/yVRHcLeM9gfyD+gJ8d6pmHl2KQP2XhXmwHH3Xce+5kL
         kO3AzSnMXPSyhVzAxQNlBvVTG0Y6YhcjcUrxsKbRdiPTbJvL4IRjKYYAO8K+ziB+G9tV
         MS4F0TMEzeMux+29fXWBd9SVX0zo8GLQDYpOMMNDScuB1HpvkJMZGHd0nXKnBSD5ZvWZ
         uQGU2BArDDPPEiKTt6Y4NvYIxTkg7D/flKigbSE5FxTuUFi9BIvM5EpQiG9uXpw9TpqJ
         pbLQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JkGKLE56;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14863-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-14863-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-14863-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id i7-20020a636d07000000b005e83b6752bdsi10180871pgc.269.2024.04.16.12.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 12:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14863-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JkGKLE56;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14863-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-14863-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81E17282A4B
	for <alex.bennee@linaro.org>; Tue, 16 Apr 2024 19:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE84136995;
	Tue, 16 Apr 2024 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkGKLE56"
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7313473F
	for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294079; cv=none; b=ukMtcqY5ZjCS1Zh9YKwkTVY+1qTtbWj3z0z6+21F/99iY8op4cXHSAi0FHK/iN04QFhTL4fNLohRl0w+Qs+FIEAlDhkZA5+s/Pxkhn7isBSRvq+shyGpQqBpM30+gmDJ62Us6EiowCHxbI/aSDATCRTgWOKJuK7frIYOA9d2XT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294079; c=relaxed/simple;
	bh=SxprYXj3nvkR/+NCWND8d5MujQd2WGZoSkmyRCEVaAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ifmgL7pVs5/3Bw3MczrtgJ56VuGyouGdVweVYb2UdodwQTY6YMUbZYAIs6D0oxHouI25wOy7/OPKaBCsrpH/kcRJjwlqNwP0UBIetsb8+Cu0I6YCb/uq03e/2Hr1aAN3BUs9c0/lp0qYu8tHTLISAWUdx422PreYgSzqnPaQ8CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JkGKLE56; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-518c9ff3e29so3364862e87.0
        for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713294076; x=1713898876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tX6emDsZqVY2muZJRjyArm9SgC2+2SHZUCWPsCYUO0=;
        b=JkGKLE560fZzIsGbAMHn3YU8zspfx5AWpSABLczWUV0BZkSHgDfY8YuPmgvPGkjorF
         qV5U+B0oguuc3eVD3zAUyfjWXLqLmd0xZGvGZhnLWs7SfMHFqb2r3AwRiLTtdxgWPXQ1
         ednbJ7fEPNnjxWhsB9aIeCQValPfIn6y4Wiu6bNfsTcDrlP6VGkwMdq0k1IsV5VMOefD
         994YnklFDYN1LT+OLCGuXu+3/70/1S4DEJynq88iJrQHXHQdiCATCKuaPJbu3ROXeVN9
         /AVSIR0FM1dqAQvzrkhrk0FG/+2ep2zxGFwHY4l9iQc2RUNhlFFZDitRyJTxpDfv+6pC
         K1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713294076; x=1713898876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tX6emDsZqVY2muZJRjyArm9SgC2+2SHZUCWPsCYUO0=;
        b=kwZpnhKAns0/TFrnm83eCE18PoqrqYUbknSqF/0U3PPxw3iosCG900PbLLXn8kcL03
         FVIfFZ7IzharYHGlLAvMcZwb05I6e8xpHNfuCAa2wpRJNeEZIZIIesK//mAjC/JiIWJc
         tqu4X7OBV3IdnqZnoeRujuxwJal2hNnmquDAUD4K4kjf7uhKTJT0VrESaDVVzVioEaLS
         7/jMqCe940mjE7/i4QoXRZ81eBVpgU1QBbEjMUZbVBm7Xia8g7MCDgZxuKGFbMpICQod
         jR4e0uqDvUarvnsiV2bQbdKZ394DsMcavrV6pUj7pBCcSgnBykD6Z8d4WmMwVIN9S5BX
         su9A==
X-Forwarded-Encrypted: i=1; AJvYcCU5EqI8BV13QAY69YE64dEkLLKSUUnKizELPwUtNGMnH+rVANT6aAj3QeL8lyF7V8yfIxOyY+Qjw+YS1diF5A3Q5pol
X-Gm-Message-State: AOJu0Yw1iBqPA8EeLo4Xm9285sxYR6JrTL6/jcGi0W5hbsOWlLwsqXMM
	STCG+wQgysZmN8JmqZUOuqsLAvk89g+k7/5pHV0PfbMzNmE/VAJlfmRRvwtxMyM=
X-Received: by 2002:ac2:4c25:0:b0:515:c102:c825 with SMTP id u5-20020ac24c25000000b00515c102c825mr7947381lfq.19.1713294075893;
        Tue, 16 Apr 2024 12:01:15 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
        by smtp.gmail.com with ESMTPSA id gs39-20020a1709072d2700b00a46f95f5849sm7167635ejc.106.2024.04.16.12.01.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Apr 2024 12:01:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH v4 14/22] hw/mem/pc-dimm: Remove legacy_align argument from pc_dimm_pre_plug()
Date: Tue, 16 Apr 2024 20:59:30 +0200
Message-ID: <20240416185939.37984-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416185939.37984-1-philmd@linaro.org>
References: <20240416185939.37984-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mr74Edc+Z6hq

'legacy_align' is always NULL, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/mem/pc-dimm.h | 3 +--
 hw/arm/virt.c            | 2 +-
 hw/i386/pc.c             | 2 +-
 hw/loongarch/virt.c      | 2 +-
 hw/mem/pc-dimm.c         | 6 ++----
 hw/ppc/spapr.c           | 2 +-
 6 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
index 322bebe555..fe0f3ea963 100644
--- a/include/hw/mem/pc-dimm.h
+++ b/include/hw/mem/pc-dimm.h
@@ -66,8 +66,7 @@ struct PCDIMMDeviceClass {
     void (*unrealize)(PCDIMMDevice *dimm);
 };
 
-void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
-                      const uint64_t *legacy_align, Error **errp);
+void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine, Error **errp);
 void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine);
 void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine);
 #endif
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a55ef916cb..7af05a6a2d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2736,7 +2736,7 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
 
-    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), errp);
 }
 
 static void virt_memory_plug(HotplugHandler *hotplug_dev,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c7bfdfc1e1..9ba21b9967 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1309,7 +1309,7 @@ static void pc_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
 
-    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), errp);
 }
 
 static void pc_memory_plug(HotplugHandler *hotplug_dev,
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 00d3005e54..af71bd2a99 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -1025,7 +1025,7 @@ static bool memhp_type_supported(DeviceState *dev)
 static void virt_mem_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                                  Error **errp)
 {
-    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), errp);
 }
 
 static void virt_machine_device_pre_plug(HotplugHandler *hotplug_dev,
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 37f1f4ccfd..836384a90f 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -44,8 +44,7 @@ static MemoryRegion *pc_dimm_get_memory_region(PCDIMMDevice *dimm, Error **errp)
     return host_memory_backend_get_memory(dimm->hostmem);
 }
 
-void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
-                      const uint64_t *legacy_align, Error **errp)
+void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine, Error **errp)
 {
     Error *local_err = NULL;
     int slot;
@@ -70,8 +69,7 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
                             &error_abort);
     trace_mhp_pc_dimm_assigned_slot(slot);
 
-    memory_device_pre_plug(MEMORY_DEVICE(dimm), machine, legacy_align,
-                           errp);
+    memory_device_pre_plug(MEMORY_DEVICE(dimm), machine, NULL, errp);
 }
 
 void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e9bc97fee0..f147876dc9 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3668,7 +3668,7 @@ static void spapr_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
 
-    pc_dimm_pre_plug(dimm, MACHINE(hotplug_dev), NULL, errp);
+    pc_dimm_pre_plug(dimm, MACHINE(hotplug_dev), errp);
 }
 
 struct SpaprDimmState {
-- 
2.41.0

