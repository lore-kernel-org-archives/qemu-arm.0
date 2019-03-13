Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1224104wrs;
        Tue, 12 Mar 2019 21:47:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyT6PAuQY6ueQ0PyvEz/3kxMviSlxXQ6S6K9Qfi725tt54dS2PZZYfDPHpEKMR2SHEMgkHo
X-Received: by 2002:a25:e904:: with SMTP id n4mr15503248ybd.91.1552452459937;
        Tue, 12 Mar 2019 21:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552452459; cv=none;
        d=google.com; s=arc-20160816;
        b=JCPDmYjy/B2Y8Z0/P91vP1pFClTnYnBqS19q0VCo8hi2pfGZICCjAuc/ya6KdG1u/S
         q1Zlsaq/h2YtBne6ax446aRqA1R9w+psEJQLcBS/JCz9bDPRjt3Qk+0w/dNAOpPKK0BS
         MsH2fgaZaPl8FF9ZHuMtcEjSG9zjFgi/sUmMZAAmRG3bsfHqfcQYrY89zZ+7vyn7esNZ
         L7LmI2W8OUCvZl/t0D7ZCkB6v+z6KZwDmYmH1//LTzIlZj25K3hYCvjyC2R1PGl7LVUa
         w9YumdM2SrZMMe/vNH5drUsg3sMWWinkesm/X0p5j1pxuodt1lfDbTSV0t5b6k7iQYwR
         3mkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=uxjwe6zPpsMZ67f5f6q/3MZgUOJixj8axDnBIkpd0bU=;
        b=0h0i8h894wNQ+Ejoz+rAJWB7XdGVaVdJ3BI71sas/TWZfFb7gewSVqMWLYFHVdna82
         /YuShzNZ6+UElz4ujjSvcqj9ePcxudkQCxjyKb8uWaGaTRtjJpxaXakMD26+Csrk3yYY
         6Hj2yL3ZayeVKODqdGwAXOfo2DsRfxXs7vyo0n/cnXD9hwlfNFxpmVMWNCl8PaecoPL/
         drjA/YOgBfYNfAg/7JQ84DwJ2K3twSEzV1S0RXpny3DtEaURAUNENIJ08Kv1biUHhGWV
         /7IhorjT7RyPzTogGy6ECgC3cy60Mzy6l2vadbzpHjIQrsjR4qTCEyJQ77sVSM1ugM9m
         Rz2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si1380647ybn.359.2019.03.12.21.47.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 21:47:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:38260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3vnn-00064Z-C7
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 00:47:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h3vkG-0003Nh-HI
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 00:44:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h3vkF-0003cf-KU
	for qemu-arm@nongnu.org; Wed, 13 Mar 2019 00:44:00 -0400
Received: from mga17.intel.com ([192.55.52.151]:13002)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h3vkC-0003X3-3p; Wed, 13 Mar 2019 00:43:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2019 21:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,473,1544515200"; d="scan'208";a="131180359"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga008.fm.intel.com with ESMTP; 12 Mar 2019 21:43:54 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 13 Mar 2019 12:42:52 +0800
Message-Id: <20190313044253.31988-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190313044253.31988-1-richardw.yang@linux.intel.com>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-arm] [RFC PATCH 2/3] hw/arm/virt-acpi-build: remove
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
Cc: peter.maydell@linaro.org, mst@redhat.com, shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r1cdMaMY4mMt

mcfg_start points to the start of MCFG table and is used in
build_header. While this information could be derived from mcfg.

This patch removes the unnecessary variable mcfg_start.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 hw/arm/virt-acpi-build.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7713c2d809..ae7858a79a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -562,18 +562,15 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
     AcpiTableMcfg *mcfg;
     int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
-    int mcfg_start = table_data->len;
 
     mcfg = acpi_data_push(table_data, len);
     mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
-
     /* Only a single allocation so no need to play with segments */
     mcfg->allocation[0].pci_segment = cpu_to_le16(0);
     mcfg->allocation[0].start_bus_number = 0;
     mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
 
-    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
-                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
+    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
 
 /* GTDT */
-- 
2.19.1

