Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2319240njk;
        Mon, 27 Jan 2025 01:44:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtlIk7+LfOCsb1ptRXBXSDMApLeWpBgqQWSFZfHi0PAFgApSmeYZCT60W7BQWUc/76SJUaTL1H9f7WBA==@linaro.org
X-Google-Smtp-Source: AGHT+IF8ph5H5lN2PdFxEIsPAQvuR5SZ/uH1qbpBFVdpBixHOgI4Tv50cKX6fSiFGIsxPxmO1u7G
X-Received: by 2002:a05:6214:23ce:b0:6d9:3016:d10d with SMTP id 6a1803df08f44-6e1b2230a18mr673880626d6.42.1737971064443;
        Mon, 27 Jan 2025 01:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737971064; cv=none;
        d=google.com; s=arc-20240605;
        b=FUnbErF86+U1161ECqoIv4NJ+bSKTAA3yEUyqgK4HUasg0vwZjYohsGBiVO1zstCnz
         MOviimHMHXmuGsFyweKXg0NX45DPB8QIFB+XDUDjLOBapSlaHWuUbboC79Vwgm33C0EK
         M+jhCRv+PqMM22Kwxbakd94YMzXVHZGys/u90jxcaK1Tbxoy/K+/jdfPMQBlyzgSznoY
         J22JmGralF5VJwnF5HN1AD769d9aOsOzVjQiE6so9KOYe+ikHzmeNxOnGkmNZiMnwLhr
         F/zNk4AZ+qbxGeXYJ7Wo5zcXJLdT17TZ9/TlGmoGuP/CyUCsvFh10m/QXWgY6KC4ZOOJ
         2TYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ayl2E/VrUl+Llrmlcin4PivEBLaP2DgTB+tiRIfVc+M=;
        fh=5LiVt5s7dTkwgHHghJiBqPTCMyUjd2zZF10Q3QJtNho=;
        b=KgtIj+Vp5Qy4DgW3FRNEd0m6HVUCB2HMMNTleg0tk58BvEnGmtqtVoByLiAtXqIS6A
         k4PRHCuDdZWrK4Dngv3ynDtCrbZf/1z/fdbBK0bJcStTQ49lUP8RCUYWKGczZuxIeMWB
         GCeH2rd2/sTU8nKQvS6CwfYMBFa5vpxHKpvtOr042O2+m1GvRNT3npbiEXBZ71c7RHo+
         rPKCr0/z/I8gDAtsQt+YzVw1AyMzmYrOm3R2nMfNew7VvgOw4OK6pROK+hivuti8oTkp
         AnDijgHLuabcY0m+eJPfePzLuZJWfhSGwoinnxH+kTYprJQ3N7LmREjO3Ua3baVNPmTx
         H+IQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DUIsyDzV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2053628ccsi95040906d6.112.2025.01.27.01.44.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 01:44:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DUIsyDzV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcLe7-0006Cs-No; Mon, 27 Jan 2025 04:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLe3-0006Bm-8f
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 04:43:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLe1-0005QQ-Pt
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 04:43:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737970981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ayl2E/VrUl+Llrmlcin4PivEBLaP2DgTB+tiRIfVc+M=;
 b=DUIsyDzVQUSwOKiftsyahOEeg+Z58ONCCUkzTvsCRB1zDwACkCWcLDs00gxS8/tLr7jdE+
 Lv3hQYaJvVbRyxj/4Ic25WHNYtE8iebF7iUR1khgtd2AJdIzkq4Q/mtb3+5jwO9+n2ivN5
 UQfEWfG1DnizXwQ/E9M0dLiTVIiwAkE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-294-HWhXqO5ZOVG2d-KDJQ9Hlw-1; Mon,
 27 Jan 2025 04:42:57 -0500
X-MC-Unique: HWhXqO5ZOVG2d-KDJQ9Hlw-1
X-Mimecast-MFC-AGG-ID: HWhXqO5ZOVG2d-KDJQ9Hlw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EA7DF18009B8; Mon, 27 Jan 2025 09:42:55 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6555A18008C8; Mon, 27 Jan 2025 09:42:52 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 03/12] hw/arm/aspeed: Invert sdhci write protected pin for
 AST2600 EVB
Date: Mon, 27 Jan 2025 10:42:30 +0100
Message-ID: <20250127094239.636526-4-clg@redhat.com>
In-Reply-To: <20250127094239.636526-1-clg@redhat.com>
References: <20250127094239.636526-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XZkaBvNP1NGl

From: Jamin Lin <jamin_lin@aspeedtech.com>

The Write Protect pin of SDHCI model is default active low to match the SDHCI
spec. So, write enable the bit 19 should be 1 and write protected the bit 19
should be 0 at the Present State Register (0x24).

According to the design of AST2600 EVB, the Write Protected pin is active
high by default. To support it, introduces a new "sdhci_wp_inverted"
property in ASPEED MACHINE State and set it true for AST2600 EVB
and set "wp_inverted" property true of sdhci-generic model.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Link: https://lore.kernel.org/r/20241114094839.4128404-4-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/arm/aspeed.h | 1 +
 hw/arm/aspeed.c         | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index cbeacb214ca4..9cae45a1c99c 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -39,6 +39,7 @@ struct AspeedMachineClass {
     uint32_t macs_mask;
     void (*i2c_init)(AspeedMachineState *bmc);
     uint32_t uart_default;
+    bool sdhci_wp_inverted;
 };
 
 
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 2662465ada4f..53a859a6e4aa 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -409,6 +409,12 @@ static void aspeed_machine_init(MachineState *machine)
                              OBJECT(get_system_memory()), &error_abort);
     object_property_set_link(OBJECT(bmc->soc), "dram",
                              OBJECT(machine->ram), &error_abort);
+    if (amc->sdhci_wp_inverted) {
+        for (i = 0; i < bmc->soc->sdhci.num_slots; i++) {
+            object_property_set_bool(OBJECT(&bmc->soc->sdhci.slots[i]),
+                                     "wp-inverted", true, &error_abort);
+        }
+    }
     if (machine->kernel_filename) {
         /*
          * When booting with a -kernel command line there is no u-boot
@@ -1415,6 +1421,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 1;
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |
                      ASPEED_MAC3_ON;
+    amc->sdhci_wp_inverted = true;
     amc->i2c_init  = ast2600_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
-- 
2.48.1

