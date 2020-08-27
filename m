Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp575228lfc;
        Thu, 27 Aug 2020 06:41:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLsne9Fpoo0em2MLnJVuPps3BLjQbHgVqkKpZ2SPq1vjTO9sdeDQXFS9Lcq8QuaeOYipre
X-Received: by 2002:a25:ab0f:: with SMTP id u15mr29989441ybi.7.1598535690014;
        Thu, 27 Aug 2020 06:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598535690; cv=none;
        d=google.com; s=arc-20160816;
        b=ITthRfK/iUg5f5O+Gk6XFEkNQPFyq+xDmcLZWbEg8hOfoeH4PzrDZ8z9dLdB/w+0pS
         dTMQ7O12VUmX/XeMEHv1zVgcn+Hgo+yQg6C3pwIDaZ4htBxelv9gFuUJAxXB7MNCgp9l
         QWvCyAa6z4Nsf+1KhbIJMrFnoXJSG5eI5p51DBFe8qKqesibVsx87kKbOA/Su2h0/DOj
         2tE/wHwzOxmv80IphgIbvZUGmpNspndHgh9LO/n/bCJrNEW5HZ+5iyza9MtLQczYXsbs
         V1nq4HRbhTvnwZ2mzJ9pAsIMhYjrDaP63t9bJUNhVejl3G2Gw6d4D6hexXOSWJOnlNve
         Qr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=O+Jdn5rlTkIqQs4IBOaacsbGO+yrRT0GNqOf9hAByzs=;
        b=AWZ4qi+E8ZbM2rGwAmiJepvXNTqwzocBk8cCui1U+K2vaj+bGcB4F/Tg4IxXBBe+Pw
         9Ew33pLPRimxt/mDcM7YdypUwCebU311p1C6Ex+mo2S3rcNDCh7uivxWIHrg45Te3zXb
         LBowlML8GWLCbiu8w3eaByJOqz+UFABQCxUmllr88/rpnY+rL9hGJL2QXt8kOS8LNoW9
         WpuWP2XLJ6vM5YoTF3IfIPZnNXaPGt1aInjGDY9/FegW8aR5ktI8vvou1Gg8TUBqy+bs
         dLn6sh7h+wq880oFhByq3pyTS/YllVm9I0o1zlb8/jO8AOF62MDhNweAF0mHCic/bqxa
         1+Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="RrQ/m6/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16si2187689yba.391.2020.08.27.06.41.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 06:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="RrQ/m6/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBI9h-0002Nu-CE
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 09:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kBI8o-0000wa-KL
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 09:40:34 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50753
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kBI8l-0006JP-Vh
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 09:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598535630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O+Jdn5rlTkIqQs4IBOaacsbGO+yrRT0GNqOf9hAByzs=;
 b=RrQ/m6/zE8GuypwEc+PAdt6ISnoHFrQg3POR6KMI4JMqvlZJVDHwPS3J6BUPp11B7Tuc6y
 iNu1qiBZuo255wTO2cHkt315OjHC1EYerkpXdY6jywNrN1oc+wUqq6LTQUBuGF+ESUXeO6
 iHnwMLjKQ3Rns6mboi7jxmPaJXhTZLk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-NxM9peRMNvmqj3cP9_gEjg-1; Thu, 27 Aug 2020 09:40:27 -0400
X-MC-Unique: NxM9peRMNvmqj3cP9_gEjg-1
Received: by mail-wm1-f70.google.com with SMTP id m25so821740wmi.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2020 06:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O+Jdn5rlTkIqQs4IBOaacsbGO+yrRT0GNqOf9hAByzs=;
 b=eKQ4M1wA4/VLuQi1jAzLwYMhGjHjgOeKpNGjfEiwsd57fYxN6JTH13TECoKyOF/lnQ
 a+EElc1KKdre4lQML4//3VkBMmFIEgDh0rqeO3kLcmfxSiQW5yGrW3omNDfsyFJZAdNd
 R3dswFrU5AdBhoe/usdyA0rJsErwJqUkN8FLwkuls40k1J8T2eUOW2afuJ/8qk2+TP5+
 XQh0V4e9v/WMjUdFS+VbwnTr/cfG5rbcyYuOumLDwPUSORqibxVihxBqBZZD6djqKZrx
 Ye0d90kAFaah9RzYMILf/gowH3L3j1OQDf1TSZyBmTrDanBI0Ce0a2uI/XpT63IZ604H
 RDLQ==
X-Gm-Message-State: AOAM5329ZCGqwubrWYKvOnk7qeyDKSl5m3Z5ROd9aFt+SUsAJb+kxxaW
 5KfBlI0e8Sy3/O6x81kDW6hQriTeSi0MEjduJA8kJtZOVBzOWe4Sgt+TAFSA9tzSm4p0mwr009E
 SAWzRpJafOaER
X-Received: by 2002:adf:f58e:: with SMTP id f14mr13441174wro.251.1598535626065; 
 Thu, 27 Aug 2020 06:40:26 -0700 (PDT)
X-Received: by 2002:adf:f58e:: with SMTP id f14mr13441156wro.251.1598535625877; 
 Thu, 27 Aug 2020 06:40:25 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id c10sm5045320wmk.30.2020.08.27.06.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 06:40:25 -0700 (PDT)
Date: Thu, 27 Aug 2020 09:40:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] arm/acpi: fix an out of spec _UID for PCI root
Message-ID: <20200827133954.2118749-4-mst@redhat.com>
References: <20200827133954.2118749-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200827133954.2118749-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 07:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vitaly Cheptsov <vit9696@protonmail.com>, qemu-stable@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZEW7m5o3TGLn

On ARM/virt machine type QEMU currently reports an incorrect _UID in
ACPI.

The particular node in question is the primary PciRoot (PCI0 in ACPI),
which gets assigned PCI0 in ACPI UID and 0 in the
DevicePath. This is due to the _UID assigned to it by build_dsdt in
hw/arm/virt-acpi-build.c Which does not correspond to the primary PCI
identifier given by pcibus_num in hw/pci/pci.c

In UEFI v2.8, section "10.4.2 Rules with ACPI _HID and _UID" ends with
the paragraph,

    Root PCI bridges will use the plug and play ID of PNP0A03, This will
    be stored in the ACPI Device Path _HID field, or in the Expanded
    ACPI Device Path _CID field to match the ACPI name space. The _UID
    in the ACPI Device Path structure must match the _UID in the ACPI
    name space.

(See especially the last sentence.)

A similar bug has been reported on i386, on that architecture it has
been reported to confuse at least macOS which uses ACPI UIDs to build
the DevicePath for NVRAM boot options, while OVMF firmware gets them via
an internal channel through QEMU.  When UEFI firmware and ACPI have
different values, this makes the underlying operating system unable to
report its boot option.

Cc: qemu-stable@nongnu.org
Reported-by: Vitaly Cheptsov <vit9696@protonmail.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 91f0df7b13..0a482ff6f7 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -170,7 +170,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
     aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
     aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
     aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
-    aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
     aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
     aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
 
-- 
MST

