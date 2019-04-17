Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4587292wrx;
        Tue, 16 Apr 2019 18:42:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKp95VY6SMWXfBtdkcTOqz0I+uUbNz0C186TWPEl1yEbwC5o4Ewe4k3hONfn+5qFdmV1P0
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr30031849wmb.7.1555465324795;
        Tue, 16 Apr 2019 18:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555465324; cv=none;
        d=google.com; s=arc-20160816;
        b=Eos9fNTSqVToJYRKAR87vURJsF9bXC4LPkFnWHl4HH2ZS3O3wlZVpoXU93JLolC6gq
         I0GgPODvph/CrorytMlo9wu4hhbxy1KAS2tEDLwvY4IPd90GKfbrS29qxd9e9fQDVyul
         SrWT5q1Dt/lTY7nWiO0thwwu5intywbWfpjGn68WtJwrdfy9n+yl1VBR+RKjSZohFUDA
         TCYVGzNeFdmYi9TTRiMq7RBa1yxD+Xx7mtvxmtZoZHIUwUsri6ss7SjSefTTMp6Tq/gD
         qXyqLAlPpe1HJbSZ72kv5Cz15kULpZmmIhsVNzOB5R75eMmOFtfPOeepvvOy88AinS/g
         St1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=eJ6t9G3eZlWLik/iCt7LMGSzyS4JGJWMYhSFJEHxV94=;
        b=NSWPXnybNmGBNU31mBe5Irav9x/vXdI6eMNImTb6oQBp080+ygby2jqhusxyEqe09K
         QTTuTbU+pkPBDtth92SLwFZ75sFmJ+QGal7lIIUWDzu0f6FJRC13mqGPVj/uaAJ7h6JV
         vkgmRjVSC5e0EVbs5Nq6rOT7yFFnLBPKMDFJ/M3gBN0iOP4Qy3fvMSaMhrSy/xiWg8QS
         0BUgExaJfH4I//yg8LpI/NsHn3VMdPBgX7EkBU3W7vQa1ZGsgqxuQphkXE3WQAkbpoNV
         HfrzMS0AMqYcCXpqeeolM4Q9yMr8cXOL+tL+oK6JUmgnUO9zmdaCk01qC9jwM8n4Zd5A
         4xxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si36788637wrm.422.2019.04.16.18.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 18:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGZaN-0006k0-QE
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 21:42:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZZm-0006Sd-6H
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 21:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZZl-0006Kt-8e
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 21:41:26 -0400
Received: from mga01.intel.com ([192.55.52.88]:47701)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hGZZk-0006GL-U5; Tue, 16 Apr 2019 21:41:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Apr 2019 18:41:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,360,1549958400"; d="scan'208";a="338161171"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 16 Apr 2019 18:41:17 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 17 Apr 2019 09:40:34 +0800
Message-Id: <20190417014038.26018-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190417014038.26018-1-richardw.yang@linux.intel.com>
References: <20190417014038.26018-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-arm] [PATCH v3 2/6] hw/arm/virt-acpi-build: remove
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
	marcel.apfelbaum@gmail.com, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HLiTvwXh+URT

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

