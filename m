Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1115202lff;
        Tue, 10 Aug 2021 01:47:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtUg+VtosCoUCU7bxToT2PMHvpEWyqk83xzRQsmq+Gxw834CO5qgz6JTY3pwmyj8TcC6ID
X-Received: by 2002:a5d:9284:: with SMTP id s4mr171544iom.131.1628585220480;
        Tue, 10 Aug 2021 01:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628585220; cv=none;
        d=google.com; s=arc-20160816;
        b=mG7C8gxNzxzAYFW7j8ttkj+Q35ZG0Fg1ETjc+z8HmO6NbP5DCwBRafC65Jz8YbiKfo
         6bn4JAroOyC06MxdzWiGGtC1asg5xjPomyVGMQMWlGI6wwfyOavktXiWpr8wdX/rlOYJ
         D0WtaiJSddM+x1QA8j/YX6HXNfGQ6fzryC66JR2ncMRaYoGIJ2YMlH50UyBpYBVGhhxb
         3ofuUsvRAaZnjinCxXJ1ka4C2jlgQsrSiYhgI50HjxN8Xb+taAmY79UZGFIQtQOZ6ug2
         yuzFO0Txa7YCIqw8uHuwPzjorO8wwAKse8xS6H3SE36Ww1fHmwqiNA27xA17oC7WxeDs
         qhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tM+6Q/09BSPbSVODH5fu80QY1gdHUNNnA2XQdyRcxCo=;
        b=KvCzd/N0kfLO2LNWMe70pfsNLY0pzWdxgtV5rlAejUaRFGXvTnzNyqG3pc3hSP15Qo
         IWw3G1LrkRVuJ1+kSX11V7u7RGqeoWzmrNCjZk7iBx6O37jzRPY24zW9JpAEQRbmIbY1
         IqQx3IE5+/7t+3BeQRFnRKyKqiUtwwwb2G4WC+2ALfRnq95f1h5Ey9monCFTHZ5gqEVt
         /H5XroHlnvqllcdxmLojqWonrOeEiYfF6mNRr/MaTABiukUrlARjUNYTFrL12UunzKnO
         iNBJwvcNh5mfcbTBWKLfWSvd42huVW8WzFiDE5k3z7rJlLPGntGrVPKwNC3AGNuxmYKA
         8spA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bgg2g5BG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si21992865ilq.82.2021.08.10.01.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 01:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bgg2g5BG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDNPX-0006VP-Nb
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 04:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPJ-0006Uh-Ci
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 04:46:45 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPG-00082E-Fn
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 04:46:45 -0400
Received: by mail-ej1-x632.google.com with SMTP id u3so34080407ejz.1
 for <qemu-arm@nongnu.org>; Tue, 10 Aug 2021 01:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tM+6Q/09BSPbSVODH5fu80QY1gdHUNNnA2XQdyRcxCo=;
 b=bgg2g5BGFBkOFVC6Pv98IBy8W6IbIxAefJihsfII+k01QsEIB1idH8G1Ap/jqapThX
 fouGHHZ/9eBuucRXIXxN0iPqWqA08+xEQaQQxSXqW/Y3B+AHIzCBsKJrpirbQ6hZB8Qx
 EJh2LCnXNSvnKYnC8xvuV4ZqFeDG4u1LID+vvH6ImqpXOuHU8ZSjh0xxl/DHKothLgg5
 b6ZbitvO42PDBB9YuzWLhWNiaMVhkT1kdV1zBkYSJFOBDgzMrfRw3mgNkq05xOCJfqCc
 3u6fXMAfVYgt4pYBBiWFz3PjkOQvlgrgFZAtBk9RZAHp2dwQ9GrIPtJi1UzIif4r625A
 56vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tM+6Q/09BSPbSVODH5fu80QY1gdHUNNnA2XQdyRcxCo=;
 b=quTALlBB/2Wjk4lWEmuowUoFiN0J+2t387M0WJ+ZrBQj4BfWe9LAr5vnXXZlV1wN8q
 N1Z10FzhKKQ+iSRUHRI1hK7KujZt2hRseLWnBrJ9LI07FlAxqS2Nilzwy/NA6/uboRec
 qI6DXkLRIh91RHIXGgAlGw8imOmNWVDOIReahUmGgeyMkrEn4wHS5gWkzj8PQhhJalMq
 2KTfb8ZGyfZAIrBmG21i4nrpDzX3SaMihsAOrywNKJUAPaoFnC69LgmTbr0fv0m9cGsK
 dfASMYsHdIq57Wld/OwtLtzJHNpy/g26WAuZtL+jnMKd4w3NgxADDj0oIAijQqtzkzSj
 hvEw==
X-Gm-Message-State: AOAM533e2ZTDL3yTyCrB8m4v1bqEZbAOgEXeTH5jqfvswG3tNdf5Wnvb
 jrmjsNwrTJWxFOgzi+yNrVL5MA==
X-Received: by 2002:a17:906:2d51:: with SMTP id
 e17mr26408407eji.500.1628585200703; 
 Tue, 10 Aug 2021 01:46:40 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id fl2sm1533516ejc.114.2021.08.10.01.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:46:40 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 1/6] acpi: Add VIOT structure definitions
Date: Tue, 10 Aug 2021 10:45:01 +0200
Message-Id: <20210810084505.2257983-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810084505.2257983-1-jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GWQFM4FGTvDN

The ACPI Virtual I/O Translation table (VIOT) table describes I/O
topology for paravirtual devices. At the moment it describes the
relation between virtio-iommu devices and their endpoints. Add the
structure definitions for VIOT.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
Following the latest spec draft, and related acpica change
https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf
https://github.com/acpica/acpica/commit/fc4e33319c1ee08f20f5c44853dd8426643f6dfd
---
 include/hw/acpi/acpi-defs.h | 60 +++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index cf9f44299c..adbf7d7b77 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -618,4 +618,64 @@ struct AcpiIortRC {
 } QEMU_PACKED;
 typedef struct AcpiIortRC AcpiIortRC;
 
+/*
+ * Virtual I/O Translation Table
+ */
+struct AcpiViot {
+    ACPI_TABLE_HEADER_DEF
+    uint16_t node_count;
+    uint16_t node_offset;
+    uint8_t reserved[8];
+} QEMU_PACKED;
+typedef struct AcpiViot AcpiViot;
+
+#define ACPI_VIOT_NODE_HEADER_DEF   /* Fields common to all nodes */ \
+    uint8_t type;          \
+    uint8_t reserved;      \
+    uint16_t length;
+
+/* Values for node Type above */
+enum {
+    ACPI_VIOT_NODE_PCI_RANGE = 0x01,
+    ACPI_VIOT_NODE_MMIO = 0x02,
+    ACPI_VIOT_NODE_VIRTIO_IOMMU_PCI = 0x03,
+    ACPI_VIOT_NODE_VIRTIO_IOMMU_MMIO = 0x04,
+};
+
+struct AcpiViotPciRange {
+    ACPI_VIOT_NODE_HEADER_DEF
+    uint32_t endpoint_start;
+    uint16_t segment_start;
+    uint16_t segment_end;
+    uint16_t bdf_start;
+    uint16_t bdf_end;
+    uint16_t output_node;
+    uint8_t reserved1[6];
+} QEMU_PACKED;
+typedef struct AcpiViotPciRange AcpiViotPciRange;
+
+struct AcpiViotMmio {
+    ACPI_VIOT_NODE_HEADER_DEF
+    uint32_t endpoint;
+    uint64_t base_address;
+    uint16_t output_node;
+    uint8_t reserved1[6];
+} QEMU_PACKED;
+typedef struct AcpiViotMmio AcpiViotMmio;
+
+struct AcpiViotVirtioIommuPci {
+    ACPI_VIOT_NODE_HEADER_DEF
+    uint16_t segment;
+    uint16_t bdf;
+    uint8_t reserved1[8];
+} QEMU_PACKED;
+typedef struct AcpiViotVirtioIommuPci AcpiViotVirtioIommuPci;
+
+struct AcpiViotVirtioIommuMmio {
+    ACPI_VIOT_NODE_HEADER_DEF
+    uint8_t reserved1[4];
+    uint64_t base_address;
+} QEMU_PACKED;
+typedef struct AcpiViotVirtioIommuMmio AcpiViotVirtioIommuMmio;
+
 #endif
-- 
2.32.0

