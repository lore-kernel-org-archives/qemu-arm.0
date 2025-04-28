Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5871337njd;
        Mon, 28 Apr 2025 03:30:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWFxD1kBPRVCGx4ORkRpTuKMdH2pzjc5gF9HUr995W/oPd8nNPIDZcUA50cHnnGi5txVdVjXRsM0Vb6UQ==@linaro.org
X-Google-Smtp-Source: AGHT+IELDSc4Y2ufMh8+XjkJDdPKrVTlyd1XUUCfT4bD+rXlAkN24TcdQpc3iQMHveq8JWEWeNHT
X-Received: by 2002:a05:6214:29ca:b0:6d8:a7e1:e270 with SMTP id 6a1803df08f44-6f4cbb5893bmr162117246d6.40.1745836237643;
        Mon, 28 Apr 2025 03:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836237; cv=none;
        d=google.com; s=arc-20240605;
        b=KIkMJ69WtUTYXCLX7i181b7TimMJOkBcc1Jjq9CjBapUYT6mjJOaxOWn5CkURfzDoh
         yvmK/fg5RuK6gONZv0Fzi+MdL/ykC1Yszph2qAQ6hqTFsvOXyTyoVZKFn93iu6Qe5IYG
         KlLvqJ4jRfO7hM8sVRebmDvCJ1MV19OBuek0e1MM4Y7ADycEinDhEeDLEf/d44ljNuny
         +Q6nm1n2vVbJQChiGlGdh60ImjlouTZ3Sfi7msUEknu9DeKr+/OV/TYuE+0b7XxSxRe2
         IwAEcFOjO1Bq/nJ9VjxUWDoxGAEDfLarl07zXlNpNxlhevckSV9pMmcVoVJK6fO8MHCM
         Ku0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fFudWQQaXcQsD/scMYnpag3QGBg2bLZxpT+cqC7Wy1Q=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=QUaJOAV90WpIa8IXrXM1rRUL14M/O4HfA9KENUePOwzi7A4YZRq57ixD11wrRQByLP
         A1DdXc3ec4e/qT/ar5saBjl7AhDB7StdWDgYeqpIffySLeUBFDLSlQYEh6wqF2bfqD54
         vHm1yyP0nYmVoI9OlvZsj5U2BvBxtkwl13eQwbg8EQSDYbe+GVGGJQdMxdA5xh8IiaZ3
         NvQkDTo7ZcaHa/tbyJjgI6H0d3k1cRfDiFCXf54Ynz1o4olL29pF5bChP5tJKf/S6/Fp
         J3KDQmuXBy2bX8vxn1ugzBtFth7FAA4GZwwVZHrxAlbOhcyVkt1UqM+5Y+cHJ5UXzL3F
         HZHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BzwVuktm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c08d26f8si100530236d6.62.2025.04.28.03.30.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:30:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BzwVuktm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u9Lkg-0005iG-9R; Mon, 28 Apr 2025 06:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Lj1-0000k3-L7
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9Liy-0003Vf-0D
 for qemu-devel@nongnu.org; Mon, 28 Apr 2025 06:28:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFudWQQaXcQsD/scMYnpag3QGBg2bLZxpT+cqC7Wy1Q=;
 b=BzwVuktmeuVZ5k8spv7sSpLGyKKfUERO2/qTzymGPvc1Eir4+QoZ6XfBzRIIAQG+XjMZJr
 MywuJVAUXM5ltVRyBppyqlcaxTOStXTIZtBVlYyIFAVeoxA2So69JJqrP4m/taL3/gpsB1
 rMl4j/0h75yeuxcExMVY2R6wKatCLcc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-48-27BHEAEgOJymnTNFtwOv0A-1; Mon,
 28 Apr 2025 06:28:16 -0400
X-MC-Unique: 27BHEAEgOJymnTNFtwOv0A-1
X-Mimecast-MFC-AGG-ID: 27BHEAEgOJymnTNFtwOv0A_1745836095
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4604B1800370; Mon, 28 Apr 2025 10:28:15 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id ADFC2180045C; Mon, 28 Apr 2025 10:28:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 21/24] hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
Date: Mon, 28 Apr 2025 12:25:47 +0200
Message-ID: <20250428102628.378046-22-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.492,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +6Lx+I5vnyde

Some sysbus devices have conditionnal mmio regions. This
happens for instance with the hw/acpi/ged device. In that case
it becomes difficult to predict which index a specific MMIO
region corresponds to when one needs to mmio map the region.
Introduce a new helper that takes the name of the region instead
of its index. If the region is not found this returns -1.
Otherwise it maps the corresponding index and returns this latter.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/sysbus.h |  1 +
 hw/core/sysbus.c    | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 7dc88aaa27..18fde8a7b4 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -82,6 +82,7 @@ void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq);
 bool sysbus_is_irq_connected(SysBusDevice *dev, int n);
 qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n);
 void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
+int sysbus_mmio_map_name(SysBusDevice *dev, const char*name, hwaddr addr);
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
                              int priority);
 
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 6eb4c0f15a..fe1abe589d 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -151,6 +151,17 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr)
     sysbus_mmio_map_common(dev, n, addr, false, 0);
 }
 
+int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr addr)
+{
+    for (int i = 0; i < dev->num_mmio; i++) {
+        if (!strcmp(dev->mmio[i].memory->name, name)) {
+            sysbus_mmio_map(dev, i, addr);
+            return i;
+        }
+    }
+    return -1;
+}
+
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
                              int priority)
 {
-- 
2.49.0

