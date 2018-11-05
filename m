Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2030524wro;
        Sun, 4 Nov 2018 17:43:47 -0800 (PST)
X-Google-Smtp-Source: AJdET5c4gB1jtbmJzDGEsX7MiNSo0ikcXhzjTFizBOkXuG+vOnBGrdg8Zrm1e4EtSHasnljla1Pg
X-Received: by 2002:ac8:901:: with SMTP id t1-v6mr19078567qth.335.1541382227514;
        Sun, 04 Nov 2018 17:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382227; cv=none;
        d=google.com; s=arc-20160816;
        b=dz0z5TJ8dkpD5Y+itIGh7yRwTlPSxoppgm79pg6JMmLuZPr96ig3W8W5jZgHEwdSkr
         LWGctARxuz4aFYJqw6q5uJmP98tUgci0L41gF1Vs85lsvz3IbLlKyK8NxgyIdrhpBu5K
         AxKB73ZoWJXUkXXpNVdPCmbTD5NxT0QTqRZLwTYgYOlA7lBZQzOgqEo2dzPH9989Xj0O
         I0piZoMKbdtC1KP68CykBQ223WZVNGoPjM/IxzWTp3ahEZ4qDdtbytg4vNaCKbNH0+mO
         uA7HnM0B7OU3shu+6bHrF1LRbCs0QHMroFVZ6VV/ihFd72t+0ZKhqQKlQsbahyCuBNs8
         kqDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=W9mvthBohbvTFD78fWcfz3F6yCv/cMaQvqKwev/oIoE=;
        b=SbWfZQdkmZcbzx1FfWqB/DYFzSPc9JqGBbo+gyjuQdgvgCkzrMy7wRaPWsKtklTVPQ
         JgmyJQRU6ThxToNgi7uCncxGKqm42fld3mkxYYB43xDhLvxZZf7FrIv29eZIyUi8U9j5
         hsEveD1Ys0Zozsanq47AqeMMH78hvIRULlOsf4jziyVi8dLDIdNd9k9A8wCHl9qZESkv
         gclNCtmUtLyIi3q0hhUJ0WyIWgqssMvB96THRjdsH5zd06jpXqOtYJx6ALIVLAk5WSeB
         P4hKBuy+uhvcLEGX1b+SGwsTkO8SXMb3lpdtorI9ApRrOH+15SXEULtXGmIHFZSUsToL
         A+qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a46si7085014qtk.44.2018.11.04.17.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:43:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJTve-0007UW-VH
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:43:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTuf-0007Li-A2
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:42:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTue-0002px-39
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:42:45 -0500
Received: from mga18.intel.com ([134.134.136.126]:7954)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTua-0002Fx-5C; Sun, 04 Nov 2018 20:42:40 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:42:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074346"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:42:20 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:32 +0100
Message-Id: <20181105014047.26447-10-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH v5 09/24] hw: i386: Move PCI host definitions
 to pci_host.h
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aSyFHMOwrC3n

The PCI hole properties are not pc or i386 specific. They belong to the
PCI host header instead.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/i386/pc.h      | 5 -----
 include/hw/pci/pci_host.h | 6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index fed136fcdd..bbbdb33ea3 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -182,11 +182,6 @@ void pc_acpi_init(const char *default_dsdt);
 
 void pc_guest_info_init(PCMachineState *pcms);
 
-#define PCI_HOST_PROP_PCI_HOLE_START   "pci-hole-start"
-#define PCI_HOST_PROP_PCI_HOLE_END     "pci-hole-end"
-#define PCI_HOST_PROP_PCI_HOLE64_START "pci-hole64-start"
-#define PCI_HOST_PROP_PCI_HOLE64_END   "pci-hole64-end"
-#define PCI_HOST_PROP_PCI_HOLE64_SIZE  "pci-hole64-size"
 #define PCI_HOST_BELOW_4G_MEM_SIZE     "below-4g-mem-size"
 #define PCI_HOST_ABOVE_4G_MEM_SIZE     "above-4g-mem-size"
 
diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
index ba31595fc7..e343f4d9ca 100644
--- a/include/hw/pci/pci_host.h
+++ b/include/hw/pci/pci_host.h
@@ -38,6 +38,12 @@
 #define PCI_HOST_BRIDGE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(PCIHostBridgeClass, (obj), TYPE_PCI_HOST_BRIDGE)
 
+#define PCI_HOST_PROP_PCI_HOLE_START   "pci-hole-start"
+#define PCI_HOST_PROP_PCI_HOLE_END     "pci-hole-end"
+#define PCI_HOST_PROP_PCI_HOLE64_START "pci-hole64-start"
+#define PCI_HOST_PROP_PCI_HOLE64_END   "pci-hole64-end"
+#define PCI_HOST_PROP_PCI_HOLE64_SIZE  "pci-hole64-size"
+
 struct PCIHostState {
     SysBusDevice busdev;
 
-- 
2.19.1

