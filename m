Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2826656wrt;
        Thu, 18 Oct 2018 13:27:19 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60/vE7OHZ6TNMA+ThoK7fpaIFBfKn3MVbgkWflpNBfQtPevYG7thVhhWKJ7l9p2sKaq6WAb
X-Received: by 2002:aed:3847:: with SMTP id j65-v6mr30318960qte.171.1539894439666;
        Thu, 18 Oct 2018 13:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894439; cv=none;
        d=google.com; s=arc-20160816;
        b=M1/ncB1TVgGc/YbdDNaEwIPnnrHT8Hjtx7Bd3OYOtnbtvORH88F2DCl716JEtGH3PI
         g5//iE2XI8c9eCPe4gLIFPQfDp9QztknjFwJ0/S4jQhS2TBl9fCzSdc6bUikN4uPlg7+
         0V8R3+dczsGHfiSx60TIiC1Lfz6aG5dHoQH+bsorp0fa26vj1SL8klOLDL+XyOGeu67w
         UwWwCrncKqgDbPncU8r/wJ6yJbinfvAIRUlqm6Gn8ziXSOOdkl8/t3t1wTIdh7HjSZfY
         W9sV8d7DslkaqTfX11/Do6TSujYY3piaFahShWGJo9OO1rHwHxL+kBz01/xgk/lvFyvq
         3MYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=u7WDisWchAhSRNV7PcDN0dXQWvNuK8oROOdv91AuSLw=;
        b=eDVERhLSLw05zCy1+4u1p2/T8vfbFfoY/Z4mesmRSGOiRfOo8xxufri6lmsprcfcCc
         Mlhlq/bT2uhvXUelGT4o0giyboppjwaxTVym6J2lHanjQGQrYasLGXGejLz8VQ/7QAWe
         xg8gs4hFqIkcgutu5rMthyelwOCedb8CUqlc85oaNN9JJFVNAh1TBc4mxcPiRhH0E1GB
         mOPkc0xzbV/qVVADPwQlzeRI7XQN7ioSdKKaRkrOyyG9Spsnbhrp3AL17548LKm5byHE
         siWpaJ/6cmdqeuPzYx2lLAxVfEA4hvzxYPjfEb1GINfOwIMFPppAwj4alNFl8BnL9v6I
         f1YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s76-v6si315031qka.83.2018.10.18.13.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEt5-0002Hc-3V
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEa0-0001Kg-NY
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:07:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEZz-0002Go-Si
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:07:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45984)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEZz-0002Gc-Kl; Thu, 18 Oct 2018 16:07:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB114307D858;
	Thu, 18 Oct 2018 20:07:34 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 561C6611C7;
	Thu, 18 Oct 2018 20:07:28 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:00 -0300
Message-Id: <20181018200422.4358-24-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 18 Oct 2018 20:07:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 23/45] memory-device: introduce separate config
 option
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
X-TUID: aB0P10DK0nlV

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
index 8c7d4a0fa0..4c1637338b 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -50,7 +50,8 @@ CONFIG_PCI_Q35=y
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
index 3a68af9ca3..9b964644aa 100644
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
index a19c1417ed..58872e27e0 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -33,7 +33,7 @@ devices-dirs-$(CONFIG_SOFTMMU) += vfio/
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

