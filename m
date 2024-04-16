Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp572521ejd;
        Tue, 16 Apr 2024 12:01:32 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXcVatJzxJIfKpWF2oB+nICgz8MAjWiIxtgFKZnvTWzrmwz/ncg8bSEEC00IcNnlF7AlXjNzEasME6NrA7K2LvkPBdmPp9h
X-Google-Smtp-Source: AGHT+IFSYd/c6iR8aElAsocgqUWwz1L7Tn94UZ6mXV0cnUKD6dyYxcuYKPUuav5CRhlHMlPs+c9w
X-Received: by 2002:a17:902:d4c7:b0:1e2:1805:52c5 with SMTP id o7-20020a170902d4c700b001e2180552c5mr17041177plg.16.1713294092218;
        Tue, 16 Apr 2024 12:01:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713294092; cv=pass;
        d=google.com; s=arc-20160816;
        b=RTBffptsoQrpNuUlQiJk+TKyqCAT3/LR2IopWl2MbLiN+tvWQE5u7cik7Jre+tEgcd
         1uYfFve7ohEPQjIt7oRIpscL1+9CgslZBXhJYAYQtyNyQ9sKHZLB+P/6mx2Qy5F+EyEk
         bLKwg7OTcYOpoingxs7l0dzy2nQXXx4ubsAAg+fGhPLspPNnbwm1tGHMVWYsMflEBVyt
         IX9iSuE09hyxKxZlCjWgowPGjfKPefMxMcwOW+/SZjSmvoCeAvCSKwo1G+AeYs1O/bpk
         Iss1QKJkvbnK3PQWz9ofOco7dXZEvTv5JpbV/DkXtlt2ds3i/NytO4SP3RMErrBqJt0P
         Oxhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=+xewXMqFZRdg+aIzvHesVxZBjNGsZ5q/Yk0k6GByalI=;
        fh=MSGC4qxWnveYmBm+5tP0mn3kEF/SQmRJqAoNP+axjck=;
        b=PCkKU8AqqyJMDQ2p2t2VEX+MutqL9XwDH93/IHc7uIEWPAUAGV2LPOVR59AFhgTkBR
         72Txw6PXWHYv9eonie+MZMQfzLvPJUIYLwSFThVbpdmhpiz4gM3SBzQmhBAYIY2OXj/5
         zcSZqesmRBDk1kyHs0QyS55CdCuFV/Kj8jfW5IYoeN6kaRomrCjc4mmJb7eH2LhabGV9
         aY9vBnBGLnHLKSyi0r9uQmRPGrILs2d9CIGiStvxHQ2KK51Y8UNSB2f75RfdvqLPiPFd
         SfUbDPKKP5FezGHsUVRHAFn7VFIZTT9da/IKHQwWYQGVZ0HiTuH/FZQWWCj0Ww4dqkZ4
         B5LA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N3dsT4lO;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14864-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-14864-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-14864-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id t8-20020a170902e84800b001e45f010f5dsi10032617plg.585.2024.04.16.12.01.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 12:01:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14864-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N3dsT4lO;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14864-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-14864-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8EDA283507
	for <alex.bennee@linaro.org>; Tue, 16 Apr 2024 19:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA864137766;
	Tue, 16 Apr 2024 19:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N3dsT4lO"
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0584071B25
	for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 19:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294085; cv=none; b=jYow4DBq9wSap+1VEDtA6C7qSOcvFvLFofLZSzsZv5Ovbsg3FzanxrMdROPFcdTouNV7wwrR/OsTLoV1r2Nn758Pq3kV+5yc/5KIbuG0AF+c5eJBG0/1SqIcJNjDNW4hk49wn20XF7PtByoy0h+2G5DVDrQx0RGnSQqFF9/grXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294085; c=relaxed/simple;
	bh=bkdUkhCPKjn9aCOP5gG5kGPyrNnP9d3yVBI2phkXjis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XAYufZHrwEbFPr2ChaOVGg0nyadWyfq5QYCI7/FRsv+UtmqSA03c7mozlDJXImjIfIqfrrVWoQJ8zDR/fm9fZO/XDlRf5NngPAWypa0kM83lQYxdJrDsL/U732Fw/Au1LXt1DypNmp9rtLNxJHGc8cs2JN3bJL4Vk6W7ED0Vhbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N3dsT4lO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a53ed18f34fso259252966b.0
        for <kvm@vger.kernel.org>; Tue, 16 Apr 2024 12:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713294082; x=1713898882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xewXMqFZRdg+aIzvHesVxZBjNGsZ5q/Yk0k6GByalI=;
        b=N3dsT4lOmS43AQSFBRsRYTsYS9qubNodrTEA2llrBsdyQ65B1MxNWhPalLZjn8tRZC
         bFZfDfE/Oi9278uwCkge+8K674mBSMH83f9kqh4gmkFs8W7PnABVSfvmt3ew3YLEHRrx
         rNj98edqTlJ/1iv2T5ABobHBbQscjoQ5yik+CV88nImhjurwnhhPosk+7aM//WzbwKyU
         K1bRMuM83w492CuYRy/hdEFFoB40DeXHhLoB4dj2bBnJclwwAgixUCN0Sa4VIgzHEeh1
         FeZMn7tJkDgFUsv9zI+xM+9XL5Oqn7sUwGLSva5d86mQu1HjnMtAp9mHe5mGjVX71vwk
         XCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713294082; x=1713898882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xewXMqFZRdg+aIzvHesVxZBjNGsZ5q/Yk0k6GByalI=;
        b=w7P13d+O4ZgORI33i6siFv0Tz9wwXa34GDwsHEN6pzvzaybaFBuCWoy1If36NCYe2I
         5JF3YZHAczjJsxNFfj1CVlsjndc4ecOZawTcjkFOCALSOiChKmYIEbTCjSD4TXkY58NV
         iCS50YFuXJfZupDEMcyMG8bGbsROBS4WyoxYgPbrxMhc/LkJVyNGIkGtFpgrMUa9rIi5
         I3Qib92pzlYJlZ5gqUs/rquTL4XcDshP1jMk5TrXCQwesmaF0uHt3gxNCqnUiSB5mbt3
         maBGP/WPvdSOb6bN8QhHGNvWPl7EW3UsbrcUhJRSNF8t5lCNU8Abd5X9LC+G/j30znuh
         fBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCGat7oVGHmRWuhIcoz5kZiTTAmJ4MrwGcU9SOkT9Em4syyYWAeTza2nhWgj5Ik+YeUXNh8EtfBek+pxsl9rmOnuSv
X-Gm-Message-State: AOJu0Yyv49GPi1hw9J6oD4pVhU2enzXZmOgoX652Lfu5CakQGyUBk7hC
	Mz+Qs/gxBwez7IQJSV2xYArxkiyu/xHofBJ+y2yj36Ht8gc3Gv0+hoJG3wK1I0w=
X-Received: by 2002:a17:907:724b:b0:a52:5795:226a with SMTP id ds11-20020a170907724b00b00a525795226amr7057705ejc.5.1713294082413;
        Tue, 16 Apr 2024 12:01:22 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
        by smtp.gmail.com with ESMTPSA id q5-20020a170906360500b00a51da296f66sm7135044ejb.41.2024.04.16.12.01.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Apr 2024 12:01:22 -0700 (PDT)
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
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Subject: [PATCH v4 15/22] hw/mem/memory-device: Remove legacy_align from memory_device_pre_plug()
Date: Tue, 16 Apr 2024 20:59:31 +0200
Message-ID: <20240416185939.37984-16-philmd@linaro.org>
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
X-TUID: gmbxNBkC2shx

'legacy_align' is always NULL, remove it, simplifying
memory_device_pre_plug().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/mem/memory-device.h |  2 +-
 hw/i386/pc.c                   |  3 +--
 hw/mem/memory-device.c         | 12 ++++--------
 hw/mem/pc-dimm.c               |  2 +-
 hw/virtio/virtio-md-pci.c      |  2 +-
 5 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index e0571c8a31..c0a58087cc 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -169,7 +169,7 @@ uint64_t get_plugged_memory_size(void);
 unsigned int memory_devices_get_reserved_memslots(void);
 bool memory_devices_memslot_auto_decision_active(void);
 void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
-                            const uint64_t *legacy_align, Error **errp);
+                            Error **errp);
 void memory_device_plug(MemoryDeviceState *md, MachineState *ms);
 void memory_device_unplug(MemoryDeviceState *md, MachineState *ms);
 uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9ba21b9967..633724f177 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1377,8 +1377,7 @@ static void pc_hv_balloon_pre_plug(HotplugHandler *hotplug_dev,
 {
     /* The vmbus handler has no hotplug handler; we should never end up here. */
     g_assert(!dev->hotplugged);
-    memory_device_pre_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev), NULL,
-                           errp);
+    memory_device_pre_plug(MEMORY_DEVICE(dev), MACHINE(hotplug_dev), errp);
 }
 
 static void pc_hv_balloon_plug(HotplugHandler *hotplug_dev,
diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index e098585cda..a5f279adcc 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -345,7 +345,7 @@ uint64_t get_plugged_memory_size(void)
 }
 
 void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
-                            const uint64_t *legacy_align, Error **errp)
+                            Error **errp)
 {
     const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(md);
     Error *local_err = NULL;
@@ -388,14 +388,10 @@ void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
         return;
     }
 
-    if (legacy_align) {
-        align = *legacy_align;
-    } else {
-        if (mdc->get_min_alignment) {
-            align = mdc->get_min_alignment(md);
-        }
-        align = MAX(align, memory_region_get_alignment(mr));
+    if (mdc->get_min_alignment) {
+        align = mdc->get_min_alignment(md);
     }
+    align = MAX(align, memory_region_get_alignment(mr));
     addr = mdc->get_addr(md);
     addr = memory_device_get_free_addr(ms, !addr ? NULL : &addr, align,
                                        memory_region_size(mr), &local_err);
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 836384a90f..27919ca45d 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -69,7 +69,7 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine, Error **errp)
                             &error_abort);
     trace_mhp_pc_dimm_assigned_slot(slot);
 
-    memory_device_pre_plug(MEMORY_DEVICE(dimm), machine, NULL, errp);
+    memory_device_pre_plug(MEMORY_DEVICE(dimm), machine, errp);
 }
 
 void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
diff --git a/hw/virtio/virtio-md-pci.c b/hw/virtio/virtio-md-pci.c
index 62bfb7920b..9ec5067662 100644
--- a/hw/virtio/virtio-md-pci.c
+++ b/hw/virtio/virtio-md-pci.c
@@ -37,7 +37,7 @@ void virtio_md_pci_pre_plug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp)
      * First, see if we can plug this memory device at all. If that
      * succeeds, branch of to the actual hotplug handler.
      */
-    memory_device_pre_plug(md, ms, NULL, &local_err);
+    memory_device_pre_plug(md, ms, &local_err);
     if (!local_err && bus_handler) {
         hotplug_handler_pre_plug(bus_handler, dev, &local_err);
     }
-- 
2.41.0

