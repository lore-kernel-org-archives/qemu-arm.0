Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp440633lfy;
        Fri, 21 Aug 2020 09:30:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDQUwkbPgc2kUh6+r6tHkeGy6BDbnAICxhjIMmFNCp0VwKVTLMBk1o8zGzTS0qHOR5BQBf
X-Received: by 2002:a25:86cf:: with SMTP id y15mr4423940ybm.25.1598027457167;
        Fri, 21 Aug 2020 09:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598027457; cv=none;
        d=google.com; s=arc-20160816;
        b=K1CSvTekASkInvshRK9OXKx/hAnetu49fx5tdA1CjhDWaT7vA+9Pk6j++HCkgnuK/w
         +fdqaPrbipYNYkdyYxLEH2ebF7g3BtDGeDotjicnqq9oZ2ABOltxIehptZwvXIlFmoHP
         16qtnNlL4so1fVoUO7qrmmhq9kx9/oYLxFGmmqxvnq7ZxIVOl9ftaHtVKScgPfLScHa+
         u1z92Pq/WLGBE+WEEJFkErLzWpunkMbaIrFCxZpnqPaCo2lp3HeQYdDBaGro1evSPb8c
         o5nk50m4ak4k1ysZN9m+PqzZljF61p7Fqt0nyOB7k2bbLmIfXyEWqKiu3ayIjvcYRUco
         EdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cfGEtVcjgxqVubuTMIgt6HrOoNGCRwyjjLNrvoUWZIE=;
        b=EedekhHeoBsW/rpN0SF7P/8JqWLnoIydxTvlrBEkD9/0dXnRlUzx8zAhtMBdqAMe8e
         vBal4WAtSG0rylRimcrLtnEw8zO+3LpCp3GeiFlPJvnsVJZBIVHairZ2CuYTuJBiWzzG
         BhUJyjYYsNhK2hfDDjWWu8uvNloAj4lVPgOhNDoXXS8mUF/ZurpzXTY1zIQAQrPTt5/q
         /2ZASb40Zms+LYA+gRVfcR2cl85ugLQs69qf0a+oxxJcQo/3AHEeodiuKs1DP39+/Xya
         iAY3pP7oZNjRXbFhnQJzjLiRxC4jIOqG24U5wpv60hdZuZ5YUNq8tBHOAFtgFqJRo0e2
         IAKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FcVI/YAV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si3145791ybm.367.2020.08.21.09.30.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 09:30:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FcVI/YAV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k99wO-0007zK-Fr
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 12:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1k99w0-0007vQ-5d
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 12:30:33 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:35511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1k99vv-0006nq-K2
 for qemu-arm@nongnu.org; Fri, 21 Aug 2020 12:30:31 -0400
Received: by mail-ej1-x642.google.com with SMTP id a26so3023237ejc.2
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2020 09:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cfGEtVcjgxqVubuTMIgt6HrOoNGCRwyjjLNrvoUWZIE=;
 b=FcVI/YAV+PBNs/h35+luBqIu5MBgP4JC3OJUnM+kHCHF8ZyBBS5CkJCszjSsrW53QR
 YY3GkGj2Lf01ntsQIcD/7onmQKw9EeGyAjZX4BjlVFjH7m44yVGxOyu0OYcdsrCop0Wv
 1Z16aIRw/4al5FceE09chtSY4OibYq+/HOsq0oZuuIn2gW6w+CAcIUs+jbGb2731gsyS
 DtcrE4QQmJ8v00DC7ktgUZHN4ORb1qjBh+GRrAVFhusNI1ZZfQBiDfNI+OLxxLu7dex4
 SP5gdCu7ykqhNMW2y9C/uShqtv48zYfuvxd20DThCDj2EJKLHtdceZtLiLUpPoVkgi9n
 uHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cfGEtVcjgxqVubuTMIgt6HrOoNGCRwyjjLNrvoUWZIE=;
 b=f3IFa0kxHRh47i305XAuFsdDhM7yzj708WStgT3+AGE5jxN5XbYEaYRTu2I6xF7kaY
 P/oYGxdFl8wFLeNbzvwtRiQdwf1M9jGMoIkXzQWHlAf6qeNouJeYu+sOyh3ECcTZoj/z
 Mukj8vd6mrebN2e5TJnFmKxSdoXARH2Y2L5ckTvZtm0r9jhduw8HMtUOoE0ahewj3t41
 IOjCZlfx9ExbFXnV+2ItzLcaENWScRVSJqlTjmtYadqlvYTxMPdz8h1S5mELVEU9dsG5
 59KiPjIlD2WDW10yriDfptKA2EnAed2m1HGUXKhCNfLoxFJT83AVvan7jNWBknaZvWGY
 Y7Qw==
X-Gm-Message-State: AOAM533vwZtuxII6pp55BKiYeCO/D5E3ucjOLtYSgakspuocWbc0wbRI
 dzvbk02Ze1Pr4dKcOO1WELGDzzAeAKSIkm4B
X-Received: by 2002:a17:906:9989:: with SMTP id
 af9mr3498328ejc.385.1598027425104; 
 Fri, 21 Aug 2020 09:30:25 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id dk28sm1398030edb.90.2020.08.21.09.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 09:30:24 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/5] linux headers: Import virtio-iommu header from Linux
Date: Fri, 21 Aug 2020 18:28:36 +0200
Message-Id: <20200821162839.3182051-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200821162839.3182051-1-jean-philippe@linaro.org>
References: <20200821162839.3182051-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 eric.auger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AbPE2blrTuLD

Import virtio-iommu topology definitions from Linux. These changes
haven't been upstreamed yet.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/standard-headers/linux/virtio_iommu.h | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/standard-headers/linux/virtio_iommu.h b/include/standard-headers/linux/virtio_iommu.h
index b9443b83a13..ee158c37c36 100644
--- a/include/standard-headers/linux/virtio_iommu.h
+++ b/include/standard-headers/linux/virtio_iommu.h
@@ -16,6 +16,7 @@
 #define VIRTIO_IOMMU_F_BYPASS			3
 #define VIRTIO_IOMMU_F_PROBE			4
 #define VIRTIO_IOMMU_F_MMIO			5
+#define VIRTIO_IOMMU_F_TOPOLOGY			6
 
 struct virtio_iommu_range_64 {
 	uint64_t					start;
@@ -27,6 +28,17 @@ struct virtio_iommu_range_32 {
 	uint32_t					end;
 };
 
+struct virtio_iommu_topo_config {
+	/* Number of topology description structures */
+	uint16_t					count;
+	/*
+	 * Offset to the first topology description structure
+	 * (virtio_iommu_topo_*) from the start of the virtio_iommu config
+	 * space. Aligned on 8 bytes.
+	 */
+	uint16_t					offset;
+};
+
 struct virtio_iommu_config {
 	/* Supported page sizes */
 	uint64_t					page_size_mask;
@@ -36,6 +48,38 @@ struct virtio_iommu_config {
 	struct virtio_iommu_range_32		domain_range;
 	/* Probe buffer size */
 	uint32_t					probe_size;
+	struct virtio_iommu_topo_config		topo_config;
+};
+
+#define VIRTIO_IOMMU_TOPO_PCI_RANGE		0x1
+#define VIRTIO_IOMMU_TOPO_MMIO			0x2
+
+struct virtio_iommu_topo_pci_range {
+	/* VIRTIO_IOMMU_TOPO_PCI_RANGE */
+	uint8_t					type;
+	uint8_t					reserved;
+	/* Length of this structure */
+	uint16_t					length;
+	/* First endpoint ID in the range */
+	uint32_t					endpoint_start;
+	/* PCI domain number */
+	uint16_t					segment;
+	/* PCI Bus:Device.Function range */
+	uint16_t					bdf_start;
+	uint16_t					bdf_end;
+	uint16_t					padding;
+};
+
+struct virtio_iommu_topo_mmio {
+	/* VIRTIO_IOMMU_TOPO_MMIO */
+	uint8_t					type;
+	uint8_t					reserved;
+	/* Length of this structure */
+	uint16_t					length;
+	/* Endpoint ID */
+	uint32_t					endpoint;
+	/* Address of the first MMIO region */
+	uint64_t					address;
 };
 
 /* Request types */
-- 
2.28.0

