Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp733813wro;
        Thu, 25 Oct 2018 06:54:00 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e3ZVSmA//QKkb0pHtwlJbldP2HstHN4XB0deDC+/wIyp70RKRtdWimaXa8bbxytMEE8kgS
X-Received: by 2002:ac8:2837:: with SMTP id 52-v6mr1552776qtq.243.1540475640658;
        Thu, 25 Oct 2018 06:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540475640; cv=none;
        d=google.com; s=arc-20160816;
        b=wkbsMcI3bn/SQHDjy3935+uPaNdTA5/d/dHgnpdToCQWzIDeO8EyszI9tvK/XB/N4X
         JiNLOh/BSN3aBk1TD8QZw2nu83t9PJpXrUh8K7mgl1ojMjBDZOuYdPYZje3rq0tXP119
         ADYbMhWo5u4LZJVKqq8en1qkE4ADYFqZ0FcxauqLjGIUuLdQCAUrr4VflbZHq1YIyitk
         +nydn6DCMU8FVvPJ9sQ+3Ob1fKyOBzoG8KrPeg/Xp6k93vCGRfY8R+T47BqD2zV5y0Dr
         4FTGeikjGkTlLE20XVbtE2gaS2oT/ItuNjVL50qpYQJgRiXWw4q7Zcrz9HZKjBn/zvkS
         bPHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=DcpWzBpinwNwOJnp9B9Pe4RJGYlZHZiU4zGtA3qg+kE=;
        b=DqchZuxVt/TJpeYLCb7GqXgM9q8XNubQxNCMVTAQiYS2uW8MQIq6Tw9bFkDCjxF90S
         eibFClUO/S/PZLh95ZexHN2XFn9ui5uz2mYs/RuE1Y77sj0iBlFJMscdvNTs8pPtsGbK
         krphAuHwFnOBIKf0pGJZjSij0nGLrRnFX4cvMKmgzhGZuluVLmkoGgUTykCyXd0LcO9G
         Nm5i1d7MK5yXrXj40js1wXEfjFmY4XYpeLlCEOQS2gKtMPiY4EUnCX4r/b/11VcCQT8s
         ulcGchUrQG0ARYm+vf3BdzFDTC4VCOfG3bl96LPOqG1MEpwTPvtgj+15CfCmlP9AXtbf
         JJnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t18-v6si3588966qtj.158.2018.10.25.06.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFg5I-0003Ae-4Q
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:54:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfo2-0003NJ-Q8
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:36:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfo1-0000Qk-LQ
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:36:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52708)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfnz-0000OK-4F; Thu, 25 Oct 2018 09:36:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BDFC30C79BA;
	Thu, 25 Oct 2018 13:36:05 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5209A17F43;
	Thu, 25 Oct 2018 13:35:57 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:40 -0300
Message-Id: <20181025133301.16578-23-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 25 Oct 2018 13:36:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 22/43] memory-device: introduce separate
 config option
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, David Hildenbrand <david@redhat.com>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y1cp4YQVVQ76

From: David Hildenbrand <david@redhat.com>

Some architectures might support memory devices, while they don't
support DIMM/NVDIMM. So let's
- Rename CONFIG_MEM_HOTPLUG to CONFIG_MEM_DEVICE
- Introduce CONFIG_DIMM and use it similarly to CONFIG NVDIMM

CONFIG_DIMM and CONFIG_NVDIMM require CONFIG_MEM_DEVICE.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20181005092024.14344-7-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 default-configs/i386-softmmu.mak  | 3 ++-
 default-configs/ppc64-softmmu.mak | 3 ++-
 qapi/misc.json                    | 2 +-
 hw/Makefile.objs                  | 2 +-
 hw/mem/Makefile.objs              | 4 ++--
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
index 210cff2781..64c998c4c8 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -51,7 +51,8 @@ CONFIG_PCI_Q35=y
 CONFIG_APIC=y
 CONFIG_IOAPIC=y
 CONFIG_PVPANIC=y
-CONFIG_MEM_HOTPLUG=y
+CONFIG_MEM_DEVICE=y
+CONFIG_DIMM=y
 CONFIG_NVDIMM=y
 CONFIG_ACPI_NVDIMM=y
 CONFIG_PCIE_PORT=y
diff --git a/default-configs/ppc64-softmmu.mak b/default-configs/ppc64-softmmu.mak
index b94af6c7c6..f550573782 100644
--- a/default-configs/ppc64-softmmu.mak
+++ b/default-configs/ppc64-softmmu.mak
@@ -16,4 +16,5 @@ CONFIG_VIRTIO_VGA=y
 CONFIG_XICS=$(CONFIG_PSERIES)
 CONFIG_XICS_SPAPR=$(CONFIG_PSERIES)
 CONFIG_XICS_KVM=$(call land,$(CONFIG_PSERIES),$(CONFIG_KVM))
-CONFIG_MEM_HOTPLUG=y
+CONFIG_MEM_DEVICE=y
+CONFIG_DIMM=y
diff --git a/qapi/misc.json b/qapi/misc.json
index c85c6c8ca3..6c1c5c0a37 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -2066,7 +2066,7 @@
 #
 # @plugged-memory: size of memory that can be hot-unplugged. This field
 #                  is omitted if target doesn't support memory hotplug
-#                  (i.e. CONFIG_MEM_HOTPLUG not defined on build time).
+#                  (i.e. CONFIG_MEM_DEVICE not defined at build time).
 #
 # Since: 2.11.0
 ##
diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 30722ccf98..39d882af6f 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -34,7 +34,7 @@ devices-dirs-$(CONFIG_SOFTMMU) += vfio/
 devices-dirs-$(CONFIG_SOFTMMU) += virtio/
 devices-dirs-$(CONFIG_SOFTMMU) += watchdog/
 devices-dirs-$(CONFIG_SOFTMMU) += xen/
-devices-dirs-$(CONFIG_MEM_HOTPLUG) += mem/
+devices-dirs-$(CONFIG_MEM_DEVICE) += mem/
 devices-dirs-$(CONFIG_SOFTMMU) += smbios/
 devices-dirs-y += core/
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/mem/Makefile.objs b/hw/mem/Makefile.objs
index 10be4df2a2..3e2f7c5ca2 100644
--- a/hw/mem/Makefile.objs
+++ b/hw/mem/Makefile.objs
@@ -1,3 +1,3 @@
-common-obj-$(CONFIG_MEM_HOTPLUG) += pc-dimm.o
-common-obj-$(CONFIG_MEM_HOTPLUG) += memory-device.o
+common-obj-$(CONFIG_DIMM) += pc-dimm.o
+common-obj-$(CONFIG_MEM_DEVICE) += memory-device.o
 common-obj-$(CONFIG_NVDIMM) += nvdimm.o
-- 
2.18.0.rc1.1.g3f1ff2140

