Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2349588wrx;
        Mon, 15 Apr 2019 00:04:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKEnMDCdJEmSs6dNQObOkYu8cRyy7wimxCAUtT/NEqk3nRhXsc7pIZzGC43gnvHmRd3jZD
X-Received: by 2002:a05:600c:2055:: with SMTP id p21mr19622586wmg.118.1555311863049;
        Mon, 15 Apr 2019 00:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555311863; cv=none;
        d=google.com; s=arc-20160816;
        b=JhfGTOLbjnRLHu7aDkWIrUCEYQzd58CjpEbR6Ke+8bnmDy0eqfUB5bS8aDyVBQo+z1
         sQ6kCIa/qN4xImxXUavY+CL4ikePAuKMGEuiYcdDTYMPcAbMiCxVI5mkeNqm8OlRQuHH
         +aXs8NwXkECtmwUdYqUlizSGn3QgIO/N9L0JqnI5FiF1xpCkQYr4TMJmOqPTe4TqC3ZX
         s/2e7zfyYH/DiDzs6KO+EJ6wGzLpNSVfz8J/Ar0IXtn/st+IWd6iJ0l/xiecI16mf4r/
         UrfTy1j3TCPtu1LLkXoX4VmyNzFj4TNYRFdhGpJiQjuNjG6MdFYD0+gxylaRXq9EL2ML
         m49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=EdbZ39bFyMGW6ekJ7QC1YV5/o/FSh66nQkgr0wD1jdg=;
        b=RI7W+uDK+r4lEiNIAuJA3tXffpm3pHcpwhxYFLhNtbT5pkweCnhOIAjG9i5LigKA2z
         uT2XJSZVUjFBclz9h/c5sCN+mo/LPM4cbHEHkEPmUUm1TcrAfCsoGLOBtAdk7t1td27h
         GUopPP4nfY3+ce64HF5jS1m2fjhAK0QJtKfsnE6Q/zdnqX38mxRaUR9qjEeKWDLmPn2v
         MqWonunToA6NIXHykSCbK6cC31eI9q5Dpbjn9DUXXRQegFjFELUPc/MUjch4Eig9Ecje
         9sPjSz79qtaKr1ErJ+TRSM1W8XbINwYc0hLCb5/jbcxkYbvdsGeckd+RI63mguxm4GI5
         z+Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si33185039wrm.153.2019.04.15.00.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 00:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFvfC-0008Dr-3J
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 03:04:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hFvep-0008D7-W4
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 03:04:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hFveo-0004FF-1E
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 03:03:59 -0400
Received: from mga06.intel.com ([134.134.136.31]:30995)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hFvek-00048B-6D; Mon, 15 Apr 2019 03:03:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Apr 2019 00:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,352,1549958400"; d="scan'208";a="164783097"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2019 00:03:43 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 15 Apr 2019 15:03:04 +0800
Message-Id: <20190415070307.13668-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190415070307.13668-1-richardw.yang@linux.intel.com>
References: <20190415070307.13668-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH v2 1/4] hw/arm/virt-acpi-build: remove
 unnecessary variable mcfg_start
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com, Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LQ2Iuyw0CBY8

mcfg_start points to the start of MCFG table and is used in
build_header. While this information could be derived from mcfg.

This patch removes the unnecessary variable mcfg_start.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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

