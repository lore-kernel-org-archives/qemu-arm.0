Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp387617ejd;
        Tue, 16 Apr 2024 06:58:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjUh+ry51KCqyoeIWBmaXa4WhDxNxrsHdVCTtwTS8lxLsfmExBWYO/LT+M4z/W2IdeJsLma2FiDLj8fgRoQZZhnx/GHFTQ
X-Google-Smtp-Source: AGHT+IEVe28SRvZSdsA3pXMb3t8eYITvbuoWzjI3DqloL3AnYO2xXkv/raHFKJ1ExRttVllvZYt7
X-Received: by 2002:a0c:e586:0:b0:69d:b424:92e6 with SMTP id t6-20020a0ce586000000b0069db42492e6mr3265457qvm.14.1713275883223;
        Tue, 16 Apr 2024 06:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713275883; cv=none;
        d=google.com; s=arc-20160816;
        b=xkGWi4QYhGjAcNwGn0f/oQ6gwcQ8VL9gVOdAia4JAzufo8qL9kf3OOIFIh+WsRzQLn
         iXjozOqXTsjKeQDfR9b/qc9goyjg8tA6QNo6dVBn7+ZkkEfot5d07jvyAQ8R4xvszoEG
         FI4kvNUAvjICCl8TCpAQH5CHdTLXthstUiDuoEWK+a7k8h0yMR+/FjIn9ZpJvHFTrHjg
         a9WDMzvtwpVRnSkEzY1FgmAOkcQCJnRY05I2dklBWk4IkhAtEl/Aa+iYYsbddOSuNylA
         6XM7tpxDkuO5EJIFBIX+sQDbZCTojpjAM6Pa2dNzygQrKKAWOpCIniBGSa76JOY7tjF1
         KHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tsrnbZ/xEVJKz1N1FMvTxZQqN2f7puK7xmLkanRPsWY=;
        fh=M+5faf8RinYMgUFHtM9mZ1Mu6nlBeTmANv6wNiuEjzU=;
        b=kkWHHiFSFHk9zwKEw0r64DoYYsDFMJB0eMACNHgHhTeM7UqDbMjgr3krnVUXA2f5X8
         paDmGa1OlZUNPA4ok6KiYTHACo3/543y2k91N/7onM8HRGP2Lye7Z/zsHq6psSkTK7OO
         csFfcCAY2m3VU5zpAiBrgx8iLr/6YCpE9wpwY91Gd1ow760CgQwdYusccj/rTvsYjs/z
         K0nZNdYHhDlet1/d+o++WBvIjBkqS5X8oh8yrOjX01DOF9vEoxrTMFqu3LlWMLGPxloz
         LlsPxmHZi5trRzLIEIct1z102N45ayMorPMzOFYXG0P+9f5ILtfOcByHGQ/9HQY1S0I4
         KQeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k838FdLX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020a05621415ce00b0069b4d8769f4si12068560qvz.243.2024.04.16.06.58.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 06:58:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k838FdLX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwjGa-0004gm-VL; Tue, 16 Apr 2024 09:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjGY-0004Pp-O8
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 09:54:30 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwjGV-0001vJ-BV
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 09:54:30 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a46ea03c2a5so721094066b.1
 for <qemu-arm@nongnu.org>; Tue, 16 Apr 2024 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713275665; x=1713880465; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tsrnbZ/xEVJKz1N1FMvTxZQqN2f7puK7xmLkanRPsWY=;
 b=k838FdLXHRA7Ses3XAscsKoNMS93EQr/Qle1Qzpr2H74i2uIl3HmqIUOYiNnsIqRRA
 jqeICBWTTrUk6bDkNizBYowJUi73k2fuRnf95fYKlvf7IVazw4ra9XLuaaFcNeG02sb4
 vXYeXxibZ4Ec1n/nSFbm82m3RuFf+jA7bleDk2BOkJLHvEotUUPI+fH3rnhmE+BAbCO2
 5x6vOHSv+9JsNLXt/tJYre1YyC3ug1lLXajvwo6s+42uEeOzOkjpApgZK/L5yqjDbxNn
 XBCV7m0q1EzMJHB+0LVX22qNzI/5b0NUATU2HQkFV+Y1aErE4u8pHv24ITXJcEDID58g
 S02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713275665; x=1713880465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tsrnbZ/xEVJKz1N1FMvTxZQqN2f7puK7xmLkanRPsWY=;
 b=w4/Aa4HVck55/rJRtraX12LjuSozczES8csj8ZjuSnkn81sUGvDxbGZfFJ5E6hjYBz
 fVbTl1MHn7RzdWVzjg/g2z2EXUP6XkxXkpdXvcS4hdu90k6kBHqstxN22/X0RVizMGZj
 ik8epQjQiKX0C/BmTQMzZ9EorxgH+WQLC2G0JaHaT7FJoqNTj3c53/ve1Q1jf7pzyRKz
 lHtqE6GGwXFtks7e0WLyU2YOxvGY8sJ7CCLktLIECOr07qLsluTe1lm4DPL/Rg/oGL6J
 AAdM/jeUK0y2yf23DBFEMCVizg/NzxgSKVykMiI3v8yUUio0x7ttF+XKkbMBGgr22kHK
 QxJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU460ocEdh+XDwtRaqSxsJQGWAiSKheREjVHpFGIGNNryycwCdh3XXOai/f/+OaFJfCrqgxfAqzE0X5xZYfK2axE4Ut
X-Gm-Message-State: AOJu0Yz/r8eeRPNs20EZRjjxNxrcJcypEXGlZLBRkENMbrVfDVwm7b7I
 n0pJ34HhusO6mAHZex6yffcS95qAGw5u/w5ZXCABSk+eIxH3ctz0RF5qUu66snU=
X-Received: by 2002:a17:906:f74c:b0:a52:9e:45c3 with SMTP id
 jp12-20020a170906f74c00b00a52009e45c3mr2136288ejb.35.1713275665453; 
 Tue, 16 Apr 2024 06:54:25 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a170906470900b00a51a74409dcsm6960354ejq.221.2024.04.16.06.54.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Apr 2024 06:54:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v3 14/22] hw/mem/pc-dimm: Remove legacy_align argument from
 pc_dimm_pre_plug()
Date: Tue, 16 Apr 2024 15:52:43 +0200
Message-ID: <20240416135252.8384-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240416135252.8384-1-philmd@linaro.org>
References: <20240416135252.8384-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: N/G5qhTOxPoJ

'legacy_align' is always NULL, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20240305134221.30924-11-philmd@linaro.org>
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

