Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1265860wrx;
        Thu, 18 Apr 2019 17:48:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3UtxZt4kx6xk3lkSKpp31cx8gxP1yDiOlUhmjVQS/SKyMPAIb/FwWGnGwggFAzWZCRSo4
X-Received: by 2002:a1c:20cf:: with SMTP id g198mr739084wmg.42.1555634931927;
        Thu, 18 Apr 2019 17:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555634931; cv=none;
        d=google.com; s=arc-20160816;
        b=heon66FVxN1uHGUH+WAFcjNeRzzPOPgp7cIwwisCMKauo4jeVizxkR0bBLk4II7rTi
         XM3FQrnY95k1bpvU8m8z1db9V53QvPB4nppvQWUzaXVslqQIoUs/ETvEEHy6y8I2bKG/
         55Ry6ixiulSyfOJNn5nNABSksLA/dxpVIe6KWCsHXxcmtmO3CGPepOq6QBLnXYWDxYys
         JIGDRd+FAuUNAEuWvM3RrwUzxYOywZOs4JSmlQXdODD4BorIA8W6svZIH4dB5JaiKqwN
         KFqr6cv8Op0TrQpO6ladFPgzYsvMTdCMV3VVwxcDnc522GhJeD/o5uMEW1IbfNot7krm
         PJFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=eJ6t9G3eZlWLik/iCt7LMGSzyS4JGJWMYhSFJEHxV94=;
        b=ikzJOhJCShh9RftK6mpJxQfUnMM1jJ2Nmxf4KGioRMnf7tv6cjIY33OrieA2TpfyVe
         msvRUqghkO61XGRkErg+UEBIkLGatK7/gW7wRDUm+1MqpR8qDW8BfMGJFXe+bUKsrbgQ
         TBIF0LaQYcLlCERS9ZwqAsnXB9ZJqBUmNYKh+0+6Py3VDS77lyw8AJbAXD2cj8F7Fywr
         XXiw6JCo/Zwf4H4DtdGAbmMS+N1MoYyfdnXMSbiO1zjC87VYSWbiUhrbIEPyXFiohkfP
         inwbMRNLIKgYmDKTFEsCp5rWHIp0dzpMmp0brVUih932vqC3sJCgD9b7QzfDBSBIoZZV
         JR2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si2735227wrt.146.2019.04.18.17.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 17:48:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:49301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHHhz-0003Ie-3T
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 20:48:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hHHc8-0007cN-FG
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 20:42:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hHHRC-0005oA-CX
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 20:31:31 -0400
Received: from mga18.intel.com ([134.134.136.126]:3679)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hHHRA-0005kx-VX; Thu, 18 Apr 2019 20:31:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Apr 2019 17:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,367,1549958400"; d="scan'208";a="163163316"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga004.fm.intel.com with ESMTP; 18 Apr 2019 17:31:26 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 19 Apr 2019 08:30:49 +0800
Message-Id: <20190419003053.8260-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190419003053.8260-1-richardw.yang@linux.intel.com>
References: <20190419003053.8260-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH v4 2/6] hw/arm/virt-acpi-build: remove
 unnecessary variable mcfg_start
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b28ayJ89iseB

mcfg_start points to the start of MCFG table and is used in
build_header. While this information could be derived from mcfg.

This patch removes the unnecessary variable mcfg_start.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/virt-acpi-build.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 857989362a..e09e7eff8d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -552,7 +552,6 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     const MemMapEntry *memmap = vms->memmap;
     int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
     int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
-    int mcfg_start = table_data->len;
 
     mcfg = acpi_data_push(table_data, len);
     mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
@@ -563,8 +562,7 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     mcfg->allocation[0].end_bus_number =
         PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
 
-    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
-                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
+    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
 
 /* GTDT */
-- 
2.19.1

