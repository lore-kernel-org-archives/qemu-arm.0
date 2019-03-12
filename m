Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp182892wrs;
        Tue, 12 Mar 2019 00:50:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOk7uKxA/hmfSSD5eTFCAnHXa6I7Q1HMiWCSwj4KlZfnRJQSJaCRXNLhQnmqWJ0T5NoUEF
X-Received: by 2002:a81:3988:: with SMTP id g130mr29181045ywa.470.1552377055718;
        Tue, 12 Mar 2019 00:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552377055; cv=none;
        d=google.com; s=arc-20160816;
        b=zBo/qdm52JYUVbpuMkvdTvlGEYBFAsXnWgeirU1BohWwIoRKIC+0uMD97vMDU8gTVd
         qyaGcnB0C5Nrd9KwEyzDP8BMKQFwJPGd5Ed0APWVTxqLIh0qpiCdt34H2p0r/zoYfY8J
         5W4WD3eooJjKUL7C5RDufdtiYCudpPi7T4w3cDLfxzfDqnLlNanszuK6CQzsyH7s1k91
         PynlJtmTESKkK76yLjXUDF9V3A1Axy4woWMdRrArsWfqlDs7Czp65kLkhNdSuEaOvBjD
         yulySpPJs4ezmh8t2PsBw9HTGp4MCvR9eVCLlLkHecQZ9FZj0s+dO2x7A8kZXC2/n3Mi
         i42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=b96Qsdf9sTAyONL087jvMBjUdtEQxuHoWMgc0ZpFQBU=;
        b=el1GK/3E2gN2SzupyctzQVnW4DIoRyDnVOKnv/g6T3lzRLn3zA6fBggI5oiigw66P3
         6DfHDdmX4XuozNyium7f6zJpqcz0rLDZFRFNYThaU0Mm6EYRdwIwI6kf0/aS1HtsXXU4
         FzGXkWkhAGSSIzPvtRSuYs3S7+7eAeJNsLxPlGkQYoSTsx7VLSsIh0DCFGSGNSwWa7pR
         8SgicVX2hn5KUi5yWgOD3KWiPX4YWormMWFXEVSO3Z3aeq0afk9vdP+BnRPwyPAve2SY
         MSn7h8BDmdF0DqT4ELIDGYyE93JlPnviQtDOg+JYTiRYl8xaVQlxsekyBY0jVNZ8NbeX
         VSYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 202si4432202yws.328.2019.03.12.00.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:46886 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3cBb-0004E7-38
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:50:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h3cBD-0004CU-JA
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h3cBC-0000Np-P0
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 03:50:31 -0400
Received: from mga01.intel.com ([192.55.52.88]:19816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h3cBA-0000AZ-F3; Tue, 12 Mar 2019 03:50:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2019 00:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,470,1544515200"; d="scan'208";a="124712371"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga008.jf.intel.com with ESMTP; 12 Mar 2019 00:50:18 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 15:49:53 +0800
Message-Id: <20190312074953.16671-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-devel] [PATCH] hw/arm/virt-acpi-build: use PCIE_MMCFG_BUS to
 retrieve end_bus_number
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
Cc: imammedo@redhat.com, shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TjaI2RHAs02m

This is more proper to use PCIE_MMCFG_BUS to retrieve end_bus_number.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 hw/arm/virt-acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d7e2e4885b..57679a89bf 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -560,8 +560,8 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     /* Only a single allocation so no need to play with segments */
     mcfg->allocation[0].pci_segment = cpu_to_le16(0);
     mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = (memmap[ecam_id].size
-                                          / PCIE_MMCFG_SIZE_MIN) - 1;
+    mcfg->allocation[0].end_bus_number =
+        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
 
     build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
                  "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
-- 
2.19.1

