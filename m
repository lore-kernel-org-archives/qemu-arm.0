Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B3DC83F1A
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 23:16:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubSKP-0007tp-6K; Mon, 14 Jul 2025 19:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSIY-000443-7o
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 19:09:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ubSIW-0005s1-Do
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 19:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752534563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nWTgx9OOmQrzNpl+Eee6xG0XRq2aOUUPbQTx1jMMcO4=;
 b=hKRuRSxtK89jPs5bScsM5gUkeu5C8kHawNixwCN3c6c3RugOSyabgA1neCy9EK8aIYTW97
 1ncsDubOxqHtchoyH6Ym7dVfSSGT25gYcNMowfDiW0lf/bwENefXTkjvjGPogj8gr6lbsk
 aO8Hvr9NUaQ+5GNxdUyPuXk0uyLyxUA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-xNhXxJCtMtCg4fQVyF117g-1; Mon, 14 Jul 2025 19:09:22 -0400
X-MC-Unique: xNhXxJCtMtCg4fQVyF117g-1
X-Mimecast-MFC-AGG-ID: xNhXxJCtMtCg4fQVyF117g_1752534561
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4560f28b2b1so7124175e9.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 16:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752534561; x=1753139361;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWTgx9OOmQrzNpl+Eee6xG0XRq2aOUUPbQTx1jMMcO4=;
 b=hdKJO8vqMKkPN747IEyUn/Y9pkXz/TID0rU5NTrVLrB9Zyxv6GWjByDiMryLUlMwrC
 WM3q/z1yltFZYMC7mncYCDeiq4yeaiBunKblj+mZyJkhoC0VSUfBz1SArtQDJFQ6tZCe
 AbVnc6nE93/F/K2fncNu6XeMDwVC8j6eUl54bfZXTfTS5HzxnnoXoUQgAlkE1ih7ct+L
 Ibeic1ekupSghPfOEwBJmoGEm9Fusl2lsuwGBNjGJ30gaHno9eCixKgle9hED5EKrqHB
 L1HvrtFo1oz1nn6uhLrI8Sj17EvQJSsa/593BYTXj5BgpbERXxF4AFseptZV5W5+r2Rt
 sDEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU15NxJ16bP4U5U1USGDGoNnnUNH0YlAGQbXN15aPZh+6MpgIb6fK02SyK6Hiwy+61ifisHG8jk+A==@nongnu.org
X-Gm-Message-State: AOJu0YxcbfG4uuYp1FdkSQRhSRK9tD6M3/9yiSWznzVerHWEjnhOVfhO
 ziqTBhT+TD4I1aGg4SL2A2h413hBjguZvglUVfviilM0J6nh984rOc+3WuTwixgqL8hDQd6arBt
 SxRWgwlTJ9vq+LDEhGBC9Y5jNjxe3AGq19gBcgjg6nI6AlaOS4ykLSQ==
X-Gm-Gg: ASbGncuELU0lJc90lhEaRnQW3tPmhKafE8OyJCMmrXqVI6NlKaNjPVadEMhiWE4eyOL
 cQrMRhhdpuh43V4PG/GxX0w3xZkBGGB5FZ48sPCcfncHx4Iws3Wv4hnR9XCjgbqhPdizbycOy4o
 1hGC5z5Ib0c22waOWDuWBnxJOmsgsGNvva3ddgk0T34m62uSRYax+FDh9/pqEyWJv8DRj0GAy3p
 lrVA54GN007sKzAK0r43VXTX2ikxYiqxfEyTRUhwh3mb17OCvUqu8rv7Z36WfLwnS1RIHHAP+Yb
 NFDwVDLtbr+JmL7eyEUMvXlewGT/4gJO
X-Received: by 2002:a05:600c:4ecf:b0:456:24aa:958e with SMTP id
 5b1f17b1804b1-45624aa9786mr19627115e9.0.1752534561305; 
 Mon, 14 Jul 2025 16:09:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa/OVUbHxTW5QCZ8VAm3s4vhGBi/pvLBF02n0N6fAUc1zCjvIlOrw1NmHrzTAiGoovUfsBBw==
X-Received: by 2002:a05:600c:4ecf:b0:456:24aa:958e with SMTP id
 5b1f17b1804b1-45624aa9786mr19626955e9.0.1752534560887; 
 Mon, 14 Jul 2025 16:09:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560ceb1337sm81503405e9.13.2025.07.14.16.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 16:09:20 -0700 (PDT)
Date: Mon, 14 Jul 2025 19:09:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 71/97] hw/arm/virt: Pass the bus on the ged creation
Message-ID: <c919cff502f6c149d7cf38576ccbf8a7e044ad44.1752534227.git.mst@redhat.com>
References: <cover.1752534227.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1752534227.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -AZfHFhE4y1rDFf2gAnuKYZYkIkQfJ3rNX-CjISeJ4s_1752534561
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Eric Auger <eric.auger@redhat.com>

The bus will be needed on ged realize for acpi pci hp setup.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20250714080639.2525563-26-eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 817adedb31..41b5086b55 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -701,6 +701,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 
     dev = qdev_new(TYPE_ACPI_GED);
     qdev_prop_set_uint32(dev, "ged-event", event);
+    object_property_set_link(OBJECT(dev), "bus", OBJECT(vms->bus), &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
-- 
MST


