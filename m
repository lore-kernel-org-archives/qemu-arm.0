Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2307271njj;
        Mon, 5 May 2025 02:13:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlF6PJ52lSr04wifT672mxothy5xCe4NWOer91n//uNEHsNxbIY9JtST2wGpWtHDsIOJGVNLAnScCQ0w==@linaro.org
X-Google-Smtp-Source: AGHT+IHo5zB9XK+E621381x8yHeMjEj7EDgXGB56ckBzCZVrGcbJsuB2jfLifVemi4CTV6SyjXKi
X-Received: by 2002:a05:600c:b8c:b0:441:b19c:96fc with SMTP id 5b1f17b1804b1-441c48b676cmr44188105e9.11.1746436394901;
        Mon, 05 May 2025 02:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436394; cv=none;
        d=google.com; s=arc-20240605;
        b=HKhz3AtdcKT2Z13tw+VDVreFxDMO9S3wjz11ix5vWVc0hrBryQ03YZ7e6y6D9MWK1n
         c4LsYkC/ghuCqfmKhzPaX2hsk7LNdchjIdB8YkwHjWS940c9U2DedvIlPk5aillC4F+7
         nPfQ9gjczVkkGhSy0Nz649XP7QhQngOEjNN8mjyWII6DH1h79HGfOHTGJ5WSs9eGgHeb
         yNShrqmNOwmToyARyQPZUR5Q1GX7OciOhj0yVixkkW65Wl2PxtRCY3rMv+GANDeAyWRQ
         HDqXoMqphrsm9+yQv91qFe5eoeDsp8UF8GSL6ootu3JfEufu+ayWMuAuA5grIMniHGLk
         EibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Cmp+xw+e+WHTiw05Jl9oTQCn6JA0x2PKHqMvKNwHRMw=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=kEXSBXb0TE0SFj1rEdNPcCxMuHLekGQtite++4kAeZ4Ei/S7jatYOUyqUHhoG6S1xa
         xaaLuMAvccxS1gr+wY4KZPlD/yzo0MpAGcrdM2EKn2WlUtYDsAhPMVgoC7SlGhYAPG4C
         8zYma5IKGujFvxZhrITH/Wo3VYx1Y8UiZ0maERlalQuq2pcw7hnWe3EDufs2o2FgcMcU
         zZoBEdaIhK0KHOyhPE1naBtQmlTJ+cFXcao4QC/kjWsg8Tuq2UXIEahOsX+QeO+L/IVW
         3ABaFenQSAE14qo5lIUDge8rR8x2NX9P02z+eh7vxD1DtiPtmra9rHzCjajQKieUv0uL
         SiMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IBE47dbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-441b2aecd87si88318985e9.63.2025.05.05.02.13.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:13:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IBE47dbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBrqq-0003jL-TQ; Mon, 05 May 2025 05:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrnH-0007VE-38
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:07:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrnE-0006KZ-K5
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cmp+xw+e+WHTiw05Jl9oTQCn6JA0x2PKHqMvKNwHRMw=;
 b=IBE47dbmosfcvonEcdsrdYPnU2cFtEDFArES1jdhbZlcjwGu5COUWLuljQoiTzaWHYMkpt
 04lBgbEMTOstB2cAbRZE/f0Dh8vG29Us7Ox5v4hkFTTT1xEAJQqAHgPAPnvO6wG58oWogz
 Ni8ZNUcAZFKlhe+SvHveV0EikpoLoBs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-362-v1lJkeEjNxaUL19rdOE0Qg-1; Mon,
 05 May 2025 05:07:18 -0400
X-MC-Unique: v1lJkeEjNxaUL19rdOE0Qg-1
X-Mimecast-MFC-AGG-ID: v1lJkeEjNxaUL19rdOE0Qg_1746436037
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8A47F180087A; Mon,  5 May 2025 09:07:17 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E355930002C5; Mon,  5 May 2025 09:07:15 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 13/23] docs/system/arm/aspeed: move AST2700 content to new
 section
Date: Mon,  5 May 2025 11:06:25 +0200
Message-ID: <20250505090635.778785-14-clg@redhat.com>
In-Reply-To: <20250505090635.778785-1-clg@redhat.com>
References: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: L2TnYj/cSsUq

From: Jamin Lin <jamin_lin@aspeedtech.com>

Moved AST2700-related content from the general Aspeed board list into a
dedicated section for Aspeed 2700 family boards. Improves clarity and
readability.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250424075135.3715128-6-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 docs/system/arm/aspeed.rst | 70 ++++++++++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 97fd6a0e7fbd..08a33b7008b7 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,12 +1,11 @@
-Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
+Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
 ==================================================================================================================================================================================================================================================================================================================================================================================================================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
 Aspeed evaluation boards. They are based on different releases of the
 Aspeed SoC : the AST2400 integrating an ARM926EJ-S CPU (400MHz), the
 AST2500 with an ARM1176JZS CPU (800MHz), the AST2600
-with dual cores ARM Cortex-A7 CPUs (1.2GHz) and more recently the AST2700
-with quad cores ARM Cortex-A35 64 bits CPUs (1.6GHz)
+with dual cores ARM Cortex-A7 CPUs (1.2GHz).
 
 The SoC comes with RAM, Gigabit ethernet, USB, SD/MMC, USB, SPI, I2C,
 etc.
@@ -39,10 +38,6 @@ AST2600 SoC based machines :
 - ``qcom-dc-scm-v1-bmc``   Qualcomm DC-SCM V1 BMC
 - ``qcom-firework-bmc``    Qualcomm Firework BMC
 
-AST2700 SoC based machines :
-
-- ``ast2700-evb``          Aspeed AST2700 Evaluation board (Cortex-A35)
-
 Supported devices
 -----------------
 
@@ -247,6 +242,67 @@ under Linux), use :
 
   -M ast2500-evb,bmc-console=uart3
 
+Aspeed 2700 family boards (``ast2700-evb``)
+==================================================================
+
+The QEMU Aspeed machines model BMCs of Aspeed evaluation boards.
+They are based on different releases of the Aspeed SoC :
+the AST2700 with quad cores ARM Cortex-A35 64 bits CPUs (1.6GHz).
+
+The SoC comes with RAM, Gigabit ethernet, USB, SD/MMC, USB, SPI, I2C,
+etc.
+
+AST2700 SoC based machines :
+
+- ``ast2700-evb``          Aspeed AST2700 Evaluation board (Cortex-A35)
+
+Supported devices
+-----------------
+ * Interrupt Controller
+ * Timer Controller
+ * RTC Controller
+ * I2C Controller
+ * System Control Unit (SCU)
+ * SRAM mapping
+ * X-DMA Controller (basic interface)
+ * Static Memory Controller (SMC or FMC) - Only SPI Flash support
+ * SPI Memory Controller
+ * USB 2.0 Controller
+ * SD/MMC storage controllers
+ * SDRAM controller (dummy interface for basic settings and training)
+ * Watchdog Controller
+ * GPIO Controller (Master only)
+ * UART
+ * Ethernet controllers
+ * Front LEDs (PCA9552 on I2C bus)
+ * LPC Peripheral Controller (a subset of subdevices are supported)
+ * Hash/Crypto Engine (HACE) - Hash support only. TODO: Crypto
+ * ADC
+ * eMMC Boot Controller (dummy)
+ * PECI Controller (minimal)
+ * I3C Controller
+ * Internal Bridge Controller (SLI dummy)
+
+Missing devices
+---------------
+ * Coprocessor support
+ * PWM and Fan Controller
+ * Slave GPIO Controller
+ * Super I/O Controller
+ * PCI-Express 1 Controller
+ * Graphic Display Controller
+ * MCTP Controller
+ * Mailbox Controller
+ * Virtual UART
+ * eSPI Controller
+
+Boot options
+------------
+
+Images can be downloaded from the ASPEED Forked OpenBMC GitHub release repository :
+
+   https://github.com/AspeedTech-BMC/openbmc/releases
+
 Booting the ast2700-evb machine
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-- 
2.49.0

