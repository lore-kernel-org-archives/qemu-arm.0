Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1352225lfb;
        Fri, 3 Sep 2021 07:33:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3kSEJ4dWMEcsLP2KVOc75NGWIY8+8T7f/1T+CLe3PlvftMaHecYsAxYmRqxg0ebDFM31Q
X-Received: by 2002:a02:946d:: with SMTP id a100mr2869508jai.118.1630679597258;
        Fri, 03 Sep 2021 07:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630679597; cv=none;
        d=google.com; s=arc-20160816;
        b=qwXOV+X7jGQKQAp+fH1Rjs9soegv14iHCY+f3jeOTNjdQnFPBoigfUZsIh6rSqVe8n
         x75GVvJGU6jOG54LRoGIJDKFSCD/R3tYk+fyzTDGFTuEsOwxF7ABnUPxZTJ8CvhE4VdZ
         sHgXiuSNMqunSYXjmWHgyyx2bKKX5yoCa41FhY4TMXey4cS0SC4RAb2PEF+o4rZ1jb+F
         22bilftAhLzjqOk4/E+mUYX6yAy1I6IQyry26t6JX7foNSoUutP9JNHoKfTS9Woqd1hs
         cpV+i+sl4TNpkhJRd7E0Tf+tr9CvmBlrGpoAuc/uQNKKg4dM78+EPE3dLpmJID+84G50
         pmLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nocKA961ViPzNqbUH/x+1dP7BZ4tC2NX/d0OA0oqeeI=;
        b=ffnGj2B+UEH3HMSd7d0BLeV5kQrcGu6b1SHLGBXBhBwZwkXzxlMtCQ8vrWTW+a5MN0
         hpsFEIVSsOfkF0arOxVOBGM4aumbUGB8tw1CBPhoWIiyRg+8QfX1y4qtgpI9BPOt4xoo
         bdK1X/cOoM9pa5ES4WLsWEoqyCXLhc1uRUZZQgYXP9uKPKrZTfF1Q4zLYe4AiPZ0oSt5
         BFaTxD/fWKhe6P6Vs2HcKwwGLM70FFotrGYbJmi6dd42phPjorABpPdB653wnfEL7ea/
         qhvMFu30cgqzzT7KijyPBE6bKAjcLuuq49eKvz9mjlW8SCdWnkbmQ690QJqpqWomWiUX
         4IQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z72J+lyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c32si5651093jaa.44.2021.09.03.07.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 07:33:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z72J+lyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMAFo-0004GE-Bl
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 10:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFF-0004ED-EE
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFD-0005aB-3x
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id g18so8517389wrc.11
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nocKA961ViPzNqbUH/x+1dP7BZ4tC2NX/d0OA0oqeeI=;
 b=Z72J+lyA6EN0MFsMVh4ZMhzgY+KUuESJt3g/37stB11n6NNveCgVVPoJa3K4479imH
 WEanpDXkzlPZarmh0apMsoc9TtzHsd9R4lKE8Iz2g+D5+5q6LYMSjHIpwYQ/MHxxiqz4
 Bpj/X5FoVYYH2TxJuitt38pTRk+gSkIW9+ZS69M4IoygN0yLCJWV/lvkJlm4m3KPjbVF
 HhCd646l3SXsbQJIMWvgRb4yNO3f5/zBeX7k3aAcVAR9k/QUxSw4WTdRFplY5rbqw0tL
 6dMeFSC5BEhXj+Og4nP7rrLRS5CBJrr/jB8KEsOYQKufn/5jHfWvVIllDESEbwvv3Zj5
 9U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nocKA961ViPzNqbUH/x+1dP7BZ4tC2NX/d0OA0oqeeI=;
 b=MV8ufJQqcioczCOMLWfSLl7Yp9ZgiIoOKDSlhkQhG8AK1V/wOOv/jM8L8pFwsE9Tex
 vXs49Za4QI9RDypttdKE0lCS0FgcAItLvwfbw2rTjfnpEmGO/L+sWBdII9iPO2Pq4Wpq
 c1mblBhCbMz9wVj+hHcYcWLWakKAW3pJpUu5Gw+S4pSFBCFL8wrZB6pbb5j4NcwSOKL0
 iqa5EHeYV0B5p7tppgrbeRroWaui1BE47LIWimOwVWPuRITn+YRzm/odZTNoKrbru8i5
 o4Rx2X4xknID091A5OZ6zwMecCkLGILe+j2TZbvAhexZtFYwvyyoYlwzQWukzYnALhA4
 BBLg==
X-Gm-Message-State: AOAM532S7Yd1kHOe98Qs5mMBgnrHd8TmuHZQiy0niDqee7qRuoA0Cj67
 NHhIFWFo9mons4sRI4xe5peGrg==
X-Received: by 2002:adf:cc92:: with SMTP id p18mr4650699wrj.98.1630679556696; 
 Fri, 03 Sep 2021 07:32:36 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:36 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 1/8] acpi: Add VIOT structure definitions
Date: Fri,  3 Sep 2021 16:32:02 +0200
Message-Id: <20210903143208.2434284-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: G4LovvkeY1cO

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
2.33.0

