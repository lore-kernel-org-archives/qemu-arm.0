Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4815567lfb;
        Tue, 7 Sep 2021 08:07:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeMqlIwSnObnLMOqyLfgZ2L+Hp6xqy4gcoFoLENxj/Q182AMlvCDy2T6Ve++lf8I7r/aV6
X-Received: by 2002:a05:6512:2246:: with SMTP id i6mr12706481lfu.360.1631027256470;
        Tue, 07 Sep 2021 08:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631027256; cv=none;
        d=google.com; s=arc-20160816;
        b=Hziv8A5+g/DL62gOQt59Fdu5AfWOv6PbojcYf++LqFsRipTrv2+rq4INI6eACArGmG
         9dOtLDvDEpWcRJVr5D6cRFiFtmwgBCL4KpoHrdit3zFrmAKpX7U33xFW1ve8eCWKv9EJ
         9fPvB/TtzpRue9j6PJvqp8h98QMMosgmI1g5kweJE7pgnwJsSMZTpemLxH4EO4Li6uHl
         v49Rt1rw231VgnHKLljdc6ndLd5wXKIx3frFaSl5u9tWOqm3Qr+kBh00y4DHnmirU0XK
         57aNQuxmp3aHZ5bnQl7qhM6z4dUI5zNXK2BKVYzFD0DZilZeoYilwGGgMHVMU5rr+f1Z
         IYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3iNT6Zcwjgf8UpSegHUiUDoEGZV2Ocqrz4DrP1j/kY0=;
        b=gIGN8QPYgj/6vSxT1zUuxipWJ6TQvLeBHCTBvLBqXk5WNa0wCmXHdLBN92FIQRZNiX
         WPSR9kiF4VhOrTtOtFQ5MYYsyOooIo0OGSMmpa5yydfK6esBn8gA+g4lB+I+cJMVQO69
         TndxVmpJ9HNZuiNM+LTxnbUVORIQcxwR0FnLnD9dZgyjIoDkAcCTQMqbm0lc8PnmXKtv
         Z7wJHFNofVLmsGN2NVU2GFSW5el14kf48tsq4/xKWhRk/Priq4StVWlSqspoqlfM5/rg
         oHch6eNvThjbkHfQ188/CyNxEOChIjFqMoMN9V/gOW8RZvT/Mgle++pOaZ5GM7+RY8YK
         hXNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZEfL9QIc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si10785318edd.81.2021.09.07.08.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 08:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZEfL9QIc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNchD-00049e-F0
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 11:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPy-0001CY-FK
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPv-0000fp-OP
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3iNT6Zcwjgf8UpSegHUiUDoEGZV2Ocqrz4DrP1j/kY0=;
 b=ZEfL9QIc10mzkoBPLTBn0W8nGL3Sz2JO4VtzD2zZ5A2fK2qa/z5lQP2zqQjZPbJttpm+oN
 QRzh+DsmEYgomHUtuXLP/xp7UaSOAs28Iey/VaFK2t3uM6FyQH42Gb2H4uzlVQdVGA/EbV
 7oQbXOJ0IvBv9scGf4A8v7arg3Hdpfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-iFGiuC1RPbKcH3RwGXxqqQ-1; Tue, 07 Sep 2021 10:49:39 -0400
X-MC-Unique: iFGiuC1RPbKcH3RwGXxqqQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D89BE1006C85;
 Tue,  7 Sep 2021 14:49:38 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9876A5D9DE;
 Tue,  7 Sep 2021 14:49:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 30/35] acpi: arm/virt: build_spcr: fix invalid cast
Date: Tue,  7 Sep 2021 10:48:09 -0400
Message-Id: <20210907144814.741785-31-imammedo@redhat.com>
In-Reply-To: <20210907144814.741785-1-imammedo@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: taUtl1kXJ0uw

implicit cast to structure uint8_t member didn't raise error when
assigning value from incorrect enum, but when using build_append_gas()
(next patch) it will error out with (clang):
  implicit conversion from enumeration type 'AmlRegionSpace'
  to different enumeration type 'AmlAddressSpace'
fix cast error by using correct AML_AS_SYSTEM_MEMORY enum

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
CC: drjones@redhat.com
CC: peter.maydell@linaro.org
CC: shannon.zhaosl@gmail.com
CC: qemu-arm@nongnu.org
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4c682e7b09..50ed73b9d0 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -459,7 +459,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     spcr->interface_type = 0x3;    /* ARM PL011 UART */
 
-    spcr->base_address.space_id = AML_SYSTEM_MEMORY;
+    spcr->base_address.space_id = AML_AS_SYSTEM_MEMORY;
     spcr->base_address.bit_width = 8;
     spcr->base_address.bit_offset = 0;
     spcr->base_address.access_width = 1;
-- 
2.27.0

