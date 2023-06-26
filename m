Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp776011ejx;
        Mon, 26 Jun 2023 00:53:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40veOFf+u2ChxmOm4y09TT+ZM7vTvOQVs/Jdw7uuq+2MQS4xDo+cmaeP0LVSU1mHO956B0
X-Received: by 2002:a05:620a:459f:b0:765:3a81:c3eb with SMTP id bp31-20020a05620a459f00b007653a81c3ebmr11304676qkb.6.1687766010618;
        Mon, 26 Jun 2023 00:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687766010; cv=none;
        d=google.com; s=arc-20160816;
        b=mFwUsRdSk4pte/dXjALFG0A8nFvehr5ZfwkTW3d9reUWyAS73oOD2ykq6XFecG4jMQ
         cD97GSKDeNVGWw1L84pv88r27cq8CwhMySUvQZ/EMqe8vvkuShHhW7mLNBjJ2zyxfOHx
         jwy4STEbvwQixL4B/mUXK+PrlE2Qe9Y3B5T4cw3h9fnMEDem+iIhwfSfGtOrRygCtIyf
         h0FQ/u9hRxhfm36yGlosj2W401QuouMzJgShKDmsKFEazKSz7PwTuEVfCtF1WH88EQAv
         tBvAyfJatg/qy1OeyNSzKQRBfRQVHLrPODfXqR/SqYnv2DX7jUx946W0Q8d57+UkL1t5
         i3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=zsgmO9LYlTM54wBq0P5A8wqThQrPESUnfoCoyhUnAY0=;
        fh=re3e8uwTPvv2vlr5qKUSD6AnvIT0rqiJLN7RYjQH7Vw=;
        b=TmgbtVfJ/IXOYVOJNz1Bkhz9SETNdEecOiaWCLrNCjvsoPtCHdr3ipADCYWyV1KJHe
         IEPP7muHODYtsAqEAjRE4w/X5TdbvT7i2xNtKu49PhzaXELoI6SlawjEgMsABz2+XDmb
         hTMVgVatM+iuI8ckrS2qNW1/32OYayJ8xriDF8pZDSrGb8dgSCsMdNG3VX0cZ12QaOrl
         9z84t47HQWrhxWs+bvVSEDoh4uEsRkwxke3E8Bq9w8aNYWVgRtKVlHBV9EDu4TEcw834
         CbqR2Is1aKCCuWv62Kh5X87pqSLk1Eh49VWOZ2iI3rvEqzWaiZx2T62ImHl2jNfZgJWS
         GtvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo29-20020a056214501d00b0062164c72369si1906887qvb.28.2023.06.26.00.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jun 2023 00:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qDh25-0005cS-Kt; Mon, 26 Jun 2023 03:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qDh1m-0005OS-Vc; Mon, 26 Jun 2023 03:52:52 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qDh1X-0003fQ-Pj; Mon, 26 Jun 2023 03:52:48 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 0968F260A77;
 Mon, 26 Jun 2023 09:52:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkikLRAoM7ZU; Mon, 26 Jun 2023 09:52:28 +0200 (CEST)
Received: from applejack.lan (83.21.150.32.ipv4.supernova.orange.pl
 [83.21.150.32])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7889E26009E;
 Mon, 26 Jun 2023 09:52:28 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] hw/arm/sbsa-ref: add PCIe node into DT
Date: Mon, 26 Jun 2023 09:51:56 +0200
Message-ID: <20230626075207.623535-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OaECN9432toV

Add PCI Express information into DeviceTree as part of SBSA-REF
versioning.

Trusted Firmware will read it and provide to next firmware level.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 0639f97dd5..b87d2ee3b2 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -171,6 +171,25 @@ static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
+static void sbsa_fdt_add_pcie_node(SBSAMachineState *sms)
+{
+    char *nodename;
+
+    nodename = g_strdup_printf("/pcie");
+    qemu_fdt_add_subnode(sms->fdt, nodename);
+    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
+                                 2, sbsa_ref_memmap[SBSA_PCIE_ECAM].base,
+                                 2, sbsa_ref_memmap[SBSA_PCIE_ECAM].size,
+                                 2, sbsa_ref_memmap[SBSA_PCIE_PIO].base,
+                                 2, sbsa_ref_memmap[SBSA_PCIE_PIO].size,
+                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO].base,
+                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO].size,
+                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO_HIGH].base,
+                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO_HIGH].size);
+
+    g_free(nodename);
+}
+
 static void sbsa_fdt_add_gic_node(SBSAMachineState *sms)
 {
     char *nodename;
@@ -286,6 +305,7 @@ static void create_fdt(SBSAMachineState *sms)
     }
 
     sbsa_fdt_add_gic_node(sms);
+    sbsa_fdt_add_pcie_node(sms);
 }
 
 #define SBSA_FLASH_SECTOR_SIZE (256 * KiB)
-- 
2.41.0

