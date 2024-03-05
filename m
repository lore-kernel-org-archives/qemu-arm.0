Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp286682ejc;
        Tue, 5 Mar 2024 05:43:47 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCV4hYkP2iymJbu9fc2fPQZs2zLs4/v/x4Dx6FuCjPKaxV5MAMwxR/pcWeZcf7CLNf3m8SUYdOi3UFMqV6wXU0anZP5VUxIW
X-Google-Smtp-Source: AGHT+IG7PSeNriS9B3jQyjKZtn9seMiZXdeaXB+hSB8DAEXT1Zct0eLQzfx2nZz3etFo+JXFdPr2
X-Received: by 2002:a17:902:e54f:b0:1dc:30ab:406b with SMTP id n15-20020a170902e54f00b001dc30ab406bmr1838587plf.13.1709646227341;
        Tue, 05 Mar 2024 05:43:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1709646227; cv=pass;
        d=google.com; s=arc-20160816;
        b=CLMuEyrSmd1Y+zv9owFPbKq5VJ4oynwsi+K81CQpupigzW0ue3yinWG8EZwdiyGpZd
         m+PEel1SwoFHDjaNChu5ai7rLQ5AMFoU58cIDZKx0cCMlajgd7pI/SxK5w/I2D4E7ZAY
         WCPDLRzfavZ1aRkTl/rtk2DPkTZRoyi321Ss1QG9nmu6R/YgGI/LbjPOZLB6NEq0FPJO
         OpPId03jjSHkdyDbVb2DmfPAWGo0ddk1MRHFybqKY6zsE2g/PTSRqOFwUB4QGLRGCFv8
         HojODObee5he/xSAlC8toQ4jVTxS5GH5AMJq6bmwWlLdc8Qo35hsU7cVuvx+p5HuKa0A
         ADXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=8+MCTA1UltNqL+EA8gVKWQmk1jjDdIIyMkrSTBOV/KA=;
        fh=ONy2AWm12fBLPlOi/vlOC5CIy1IZeBRlJa5lHqqSsO0=;
        b=On+SaGQYHqtgIEmEAkKb4Dgu+uQtckMm1EMXPFsG9ZfY8mACz54uKyVUfVmOneJbCu
         xA4NhmEQP8WLADkzsl/3XX2cnxvv9lzqkFRGAc7OCWmnfRv5RjWZr4zONNdFBZap8Unt
         dGWQY3qCYsoIWx8oeNya+qDKG3LRWcjdW8IhtZA3UHb0Zp0MW+O5zXnwsCvQqYwgY/PD
         dxxPpwgnhUmai3MR0mZK+HU3D/1Z+YOKBkkprgwurv00t7Oy7RKWrV9CXAvKoZj12FRz
         z0UETGN95LoglPYKDuhXrDL/QZdjZWGAJx5aGDkMphjFnTBTWO9UV6Nh7dm3TQ5RuIh2
         1FJQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L0Jjtf+9;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-10994-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-10994-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-10994-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id n17-20020a170902e55100b001dcdf1e11b3si9569983plf.73.2024.03.05.05.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 05:43:47 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-10994-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L0Jjtf+9;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-10994-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-10994-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10AE2B28956
	for <alex.bennee@linaro.org>; Tue,  5 Mar 2024 13:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B3885C65;
	Tue,  5 Mar 2024 13:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L0Jjtf+9"
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62E95915D
	for <kvm@vger.kernel.org>; Tue,  5 Mar 2024 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709646219; cv=none; b=ARpzgaMn93TfQDAIlT8z53nm5ccZxKVfQsOptGva7H4GO6mzfMTZECtSuelG1N7Nu6++7FAHNh7N2R4j1A8TxQBeVNNN1xtpq+WJUyhltdmwejYTu78Xb4uRRqdAGGJphcyDCbXISe0gI3JI187ELofVuq3n+IKDttyH0n/omLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709646219; c=relaxed/simple;
	bh=HYPbOo/3N1o8cYm6RRIsG7OHUi29Bq0eDqkzgN+ePWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuAayJ6gVkXdRsD+DINJ5gX5pgTtEPVYCPIHg//d1TPITNMohgwjIAlOfqv/KI8KihHdJWV4GyF5wlz10sx76dhAlJNpQciDdPtG2YsmFpi6Nk97PPobzcsdYxg4qTWUTC01Hnc5UPj73AL/TqL/sOR5Cru+oxR5xuV5x0PVB6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L0Jjtf+9; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5132010e5d1so962631e87.0
        for <kvm@vger.kernel.org>; Tue, 05 Mar 2024 05:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709646216; x=1710251016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+MCTA1UltNqL+EA8gVKWQmk1jjDdIIyMkrSTBOV/KA=;
        b=L0Jjtf+9ucoNMxxQaOthomBpPC86GmlXSJd9IIHBb+vStWDmC5FaDEPc6pCBjirmrI
         03OCKVcxCFH+X/g5etOmvHir3Xv/dEviqJd7M7S6tQLIApn6ld8SHDpN0cPGMPN9I0uv
         cX5btc2Cin0zR7iL1oKPJNPLQYDtEQ9mI48LztMh4QrQ8sLKH2xlF2hy5xMIscdx3c6x
         qArz82pI4D809qYW8Jx8oGiJDPktlmOoKTrR7YbkCxPpjZEuGZubhmyI2k+8GVE8PIm4
         1KoIQrJzCBN9Q8Y8tBSAvETTBeK+xdQnz8MkAzioR0ASaIC9lo+PYkCSRZa1RSlrgeQw
         +SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709646216; x=1710251016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+MCTA1UltNqL+EA8gVKWQmk1jjDdIIyMkrSTBOV/KA=;
        b=oCNZaYcmvk79LZI2qpGo/IkweRzPl9CI6nRlvufLYEIh+a/STEOvPhZccQqzFPLC1c
         rODnyqGD2hATH7U8Q8PyC3BhL5eXzXLSwDezT+jF9UQbXGUpxym4+Hl7dbzJUgFgMGjl
         ZPZyTZcfiZH1/LPbgJ2A1iwYwd6VxR0mZ3hmtZvsujY0/Q8oyu5UAxBVqUqAvpM7fNFx
         LWdhYMNhi/6f4IITHQWtsrNPwzVG1ndxuxf6OMy9zuDJ38VYcV8driTnXYJ8DLrJi0fn
         cUobFAYOYS6W9AYvSGmCvXHF7CZHu1L2rZCpnIZNP6wcD845Tz/AyOdrM9TTfV21nXL1
         F70w==
X-Forwarded-Encrypted: i=1; AJvYcCXXd8GQ69OHEKaNgn8AG014MNDU8EXmvI8RyB/MM0Rvm096UdsjQUDeBKXOmW87rW1gnSY6Rc66jmBs33S7xPVsUkJS
X-Gm-Message-State: AOJu0Yzf4eo2qYmr7cUHqPimAiP4+R0rchoXjFiOvAyAHdaCIhaoAzSY
	I9hwId2PGDCO6nj1EJPCZPn82uSRfDlw3E+esZOEE9YMEdEjpoU2+wTBxbFZ3Vo=
X-Received: by 2002:a05:6512:2028:b0:513:177e:4254 with SMTP id s8-20020a056512202800b00513177e4254mr1162168lfs.14.1709646216124;
        Tue, 05 Mar 2024 05:43:36 -0800 (PST)
Received: from m1x-phil.lan ([176.176.177.70])
        by smtp.gmail.com with ESMTPSA id qw28-20020a1709066a1c00b00a381ca0e589sm6032584ejc.22.2024.03.05.05.43.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 05 Mar 2024 05:43:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	devel@lists.libvirt.org,
	David Hildenbrand <david@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH-for-9.1 10/18] hw/mem/pc-dimm: Remove legacy_align argument from pc_dimm_pre_plug()
Date: Tue,  5 Mar 2024 14:42:12 +0100
Message-ID: <20240305134221.30924-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240305134221.30924-1-philmd@linaro.org>
References: <20240305134221.30924-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zD79A2we/scO

'legacy_align' is always NULL, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index 0af1943697..9a6df69642 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2720,7 +2720,7 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
 
-    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), errp);
 }
 
 static void virt_memory_plug(HotplugHandler *hotplug_dev,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 0950abcc2a..b4736822e4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1325,7 +1325,7 @@ static void pc_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
 
-    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), errp);
 }
 
 static void pc_memory_plug(HotplugHandler *hotplug_dev,
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 1e98d8bda5..2e8234affd 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -1024,7 +1024,7 @@ static bool memhp_type_supported(DeviceState *dev)
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
index 55263f0815..32fdca2bd4 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3639,7 +3639,7 @@ static void spapr_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
 
-    pc_dimm_pre_plug(dimm, MACHINE(hotplug_dev), NULL, errp);
+    pc_dimm_pre_plug(dimm, MACHINE(hotplug_dev), errp);
 }
 
 struct SpaprDimmState {
-- 
2.41.0

