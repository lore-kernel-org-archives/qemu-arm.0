Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2830794wrt;
        Thu, 18 Oct 2018 13:31:23 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60MOCl22M4Ch8t84jZBhz9BI6SkIOyKLEWXNPrA5awmuCiYORo5h+Mc2uKTYMH1xXts0ohm
X-Received: by 2002:a0c:b512:: with SMTP id d18mr7204014qve.154.1539894683639;
        Thu, 18 Oct 2018 13:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894683; cv=none;
        d=google.com; s=arc-20160816;
        b=ZrecgNxFr7k3gCOkVhvW0TNK9eiD8dPLqMH9MFzJz5w4jLo3VCPe/OAsEj0yIvCEr9
         pfa2oV6gmbyHxnWQUtxFZLyoxRpDeFNVks8TDMupk39rWtAjlmNR9oSln0Fu7CqjWwH4
         6jRFouWnjJ9NcMYaB32vOlXC8yEq9GIIERWjMG4MhSVXmrsuILWGo+LOa2b0DEKI0Tjn
         cCJOuMwEXBZI1sjFCvBBKHVmU1QNAawh6OvAUABnzmuE0peZb9BAnSM2mvOBlSLpBpFa
         5CqB83Oq/phyVT/Wa6HKE9/lbc0V+LTc7pY8eqIc5ceMP70envPFObir/+MrIrWrItt9
         aDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=SgzgcttemwjPV2BcNc5kYB7331bm8PfL4L71TEtMvOs=;
        b=iTqhekuBybystSagU/6MuE6hOw1rixtTol5cL/peA4r6yCs14gkfYvPVqQQBFk0+Dj
         4ZrMvgm5IjQtcRYorV1ejHOx5UogHYra99HBuUhgy7fXNJSQ7tHoK7BK896y7TVTNJOX
         N95zpIW44WJEXP+FQ3TLCvpkAFJ/QMAgKQTh7oOZ0ySKPvUO+QY/xeg2ZR0yfxMhgOIn
         gC+x1oJe20sIiaI9ANopVfGdj55pWLybbl+9s+E6gwE7qyu6lG1WsBPUVjd/IgpiUlFW
         okmTZZYC+eubRB3WfRRBYLNXAYSayoTKhdOIYWMlBVajk0cNo+J8yw+ToCA4lPE8gxPf
         lNnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e4-v6si2254281qtb.52.2018.10.18.13.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEx1-00068t-3O
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:31:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbI-0002rt-3u
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:08:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbA-000301-NS
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:08:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48678)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEb9-0002zi-VZ; Thu, 18 Oct 2018 16:08:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E93B030F8BF7;
	Thu, 18 Oct 2018 20:08:46 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDFB460150;
	Thu, 18 Oct 2018 20:08:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:09 -0300
Message-Id: <20181018200422.4358-33-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 18 Oct 2018 20:08:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 32/45] memory-device: complete factoring out
 unplug handling
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	David Hildenbrand <david@redhat.com>, Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JMvqkYAVDm3a

From: David Hildenbrand <david@redhat.com>

With the new memory device functions in place, we can factor out
unplugging of memory devices completely.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-16-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/mem/memory-device.h |  2 +-
 hw/mem/memory-device.c         | 11 +++++++++--
 hw/mem/pc-dimm.c               |  5 +----
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
index 53d89dac89..e904e194d5 100644
--- a/include/hw/mem/memory-device.h
+++ b/include/hw/mem/memory-device.h
@@ -102,7 +102,7 @@ uint64_t get_plugged_memory_size(void);
 void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
                             const uint64_t *legacy_align, Error **errp);
 void memory_device_plug(MemoryDeviceState *md, MachineState *ms);
-void memory_device_unplug_region(MachineState *ms, MemoryRegion *mr);
+void memory_device_unplug(MemoryDeviceState *md, MachineState *ms);
 uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
                                        Error **errp);
 
diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 6569896b7e..30585d6148 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -290,9 +290,16 @@ void memory_device_plug(MemoryDeviceState *md, MachineState *ms)
                                 addr - ms->device_memory->base, mr);
 }
 
-void memory_device_unplug_region(MachineState *ms, MemoryRegion *mr)
+void memory_device_unplug(MemoryDeviceState *md, MachineState *ms)
 {
-    /* we expect a previous call to memory_device_get_free_addr() */
+    const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(md);
+    MemoryRegion *mr;
+
+    /*
+     * We expect that a previous call to memory_device_pre_plug() succeeded, so
+     * it can't fail at this point.
+     */
+    mr = mdc->get_memory_region(md, &error_abort);
     g_assert(ms->device_memory);
 
     memory_region_del_subregion(&ms->device_memory->mr, mr);
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 647841bcd4..6c854139a7 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -73,13 +73,10 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine, Error **errp)
 void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
 {
     PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
-    MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(dimm);
     MemoryRegion *vmstate_mr = ddc->get_vmstate_memory_region(dimm,
                                                               &error_abort);
-    MemoryRegion *mr = mdc->get_memory_region(MEMORY_DEVICE(dimm),
-                                              &error_abort);
 
-    memory_device_unplug_region(machine, mr);
+    memory_device_unplug(MEMORY_DEVICE(dimm), machine);
     vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
 }
 
-- 
2.18.0.rc1.1.g3f1ff2140

