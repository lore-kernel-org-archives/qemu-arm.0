Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2037105wro;
        Sun, 4 Nov 2018 17:53:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5caWmwK3ZT+TwVeEk9zM9etAC+9oybqhE2I7VOHSCzCB3NleCTrQpd9TmOFnmmlbHyu+PQG
X-Received: by 2002:ac8:5205:: with SMTP id r5-v6mr19896841qtn.201.1541382819265;
        Sun, 04 Nov 2018 17:53:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382819; cv=none;
        d=google.com; s=arc-20160816;
        b=00sSWnvof0pAbvQXVu/GOtGFhqGzme8dFtUJP5ATIMMx2rdJZqlXoqhaFDiHA4EdMr
         qAfEx/kiTYsq2BUkVX8xX/BPTwi98eoUrmCZdkhMQm6z7prbcGviq6u5iJTJFAhuk+uC
         jZXlJ9lhjr4gBRGOsy762tuAH+aD23pEGIygyGnpmzAIZ+OomVk1inVLYKHNl4qvnPrV
         F381c/4ySV6ViRlP88jFHyQ1PdMJWvwThKsKgb51sVFxfUZqE8i+655vSy3421no5CNY
         5y9k8U/xlVwjGJNst9r1JUdymGk6lyp+pCQevPy5l/+6If6wRTbh9mQjmLhV91zikB+7
         6+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YeN9U8n+dN/iPXOOOAuYOUxoIchAsIFLL1M0ofoeZuc=;
        b=RFqgq1bW5sFhxI8jZgeNpj3wBS00kBS39B1FYOB1iLtBGHZ1KyKr0hp8PRLjRFDxX9
         7MRIbVECPZ4YV86WX/f8UX5ilppgaRjDauZSA1Cb9zUC8cUHxV7yJ3ZfFEia+028H7wk
         cwL+7MR1u1a1fje2pzAI2jKzZrzYHFIBITT9VajI0VY8bPv7SkMAz1EPKUoMQ2z6Fm+S
         XCBRYk6cVEErvyQOtGciwetZLjMB0PADdBl5zl8ZG6BK1hgdEXFUWa/CEV86v7rmybdN
         Hy+kDIAXgiLqkxErNlxzgleNRrSB0IQbruOZT98B71vdN6Q8ytRkwHTyOVW2dYYhIT/Q
         SxRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w7si4796744qte.36.2018.11.04.17.53.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:53:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJU5C-0002Jn-LR
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:53:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvh-0000wr-WE
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTvd-0003ok-4I
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:49 -0500
Received: from mga06.intel.com ([134.134.136.31]:29817)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTvc-0003lB-Pi; Sun, 04 Nov 2018 20:43:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074538"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:43:36 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:46 +0100
Message-Id: <20181105014047.26447-24-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH v5 23/24] hw: i386: Set ACPI configuration PCI
 host pointer
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
X-TUID: cYKV7a3nXaZ2

For both PC and Q35 machine types, we can set it at the PCI host
bridge creation time.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/i386/pc_piix.c | 1 +
 hw/i386/pc_q35.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index f5b139a3eb..f1f0de3585 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -216,6 +216,7 @@ static void pc_init1(MachineState *machine,
         no_hpet = 1;
     }
     isa_bus_irqs(isa_bus, pcms->gsi);
+    acpi_conf->pci_host = pci_host;
 
     if (kvm_pic_in_kernel()) {
         i8259 = kvm_i8259_init(isa_bus);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index cdde4a4beb..a8772e29a5 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -188,6 +188,7 @@ static void pc_q35_init(MachineState *machine)
     qdev_init_nofail(DEVICE(q35_host));
     phb = PCI_HOST_BRIDGE(q35_host);
     host_bus = phb->bus;
+    acpi_conf->pci_host = phb;
     /* create ISA bus */
     lpc = pci_create_simple_multifunction(host_bus, PCI_DEVFN(ICH9_LPC_DEV,
                                           ICH9_LPC_FUNC), true,
-- 
2.19.1

