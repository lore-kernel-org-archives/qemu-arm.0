Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp484028lfg;
        Thu, 8 Jul 2021 09:30:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB6Z6Tnde46D6Bn8BWeqE7md3+kvFsKCauyxWPkYh2nqF/ZjB2N4K2ncxCTyMfIRhTfKTq
X-Received: by 2002:a05:6402:1297:: with SMTP id w23mr38385099edv.311.1625761824167;
        Thu, 08 Jul 2021 09:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625761824; cv=none;
        d=google.com; s=arc-20160816;
        b=sGhReLtU7tnetx5P2cWEURLAp2ObodEDwBw0SiFXIVypMiSx8F33IiMDkG78nvxSd0
         abFlsoccON45sDgcciRvRrYL396G5A4QtfrhFLcvtMUTVzJ6oqUI5G79/L4EPk/8qoZl
         6vbQaQXprQcXJeVxAyiObjJO+k/3ZOj2UOfyVLISPYHwyebg10924hG236Hf+LwsTsM+
         CRYP+AebiRJafXOYuLggvpFkyB3ya+KKv5Q+i8wQ8tYWFmpAB2pKbs1ye4nUOzgcCM5c
         Ek/c5Dy3SP77k7s4kYHnDQKJ5lAQ4FEsi3fwytdKLkW1qxCdWCNosS+1OaJtfUuuQnFv
         b5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=w4ifF/najuF76LRWVsVWOLdU0QbOqm9xDPI8kEMS4dQ=;
        b=nGQLGuKnn7HtTxYKLLt+18Zr5iWRMVi4C4E5jBfN3bJ0+2FjSUtlwYxhxoYCCqmfJL
         msSJC++V8sJpvpw+i+K4iXPU2iwuIYcxnbkKNvn1c8zFABGSO5SFL/EgU0FS7nmDIaw6
         M8WMJfS3yjk1unT5fl+dSxBBMEjMIeyF2HzCU0gCVlG6zCVQTSG2N8xvLK/Q3IUsrtqK
         ziK3gPaFcccWv0vIK5jyd+jj2fGBTGmKYH9Fn9Jizjw+kwChnSs5aH5oeEZKSYeiV+1s
         1OQyT5PVWBFVnYc29ZMdItZmLQriMYclbejgiuGh7aR7hFP8TFVDEdyk25rnCYiHXIEq
         hDCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I8FCQFHT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si3552603edc.210.2021.07.08.09.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 09:30:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I8FCQFHT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1Wus-0003jB-Ui
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 12:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WFI-000389-F2
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:47:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1WFG-0000ct-VC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625759242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4ifF/najuF76LRWVsVWOLdU0QbOqm9xDPI8kEMS4dQ=;
 b=I8FCQFHTonunxYOdD9NkmpK0ZZ4bUkDhf/JgmKZGHdogR2NX7UOPYZgkew+A4q4RmL9Vzg
 uSg/O97DM+f7dAgC0IraKRjiFAV+tMOlq10rvdeUOVRH4v2YbovIeLb1QyxnBBsGAh2vlN
 XjeofTIZFxxbIOapGXHVn+/W2UOfMiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-nezxblXsPA6n3QTYissuFg-1; Thu, 08 Jul 2021 11:47:21 -0400
X-MC-Unique: nezxblXsPA6n3QTYissuFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DC16100C618;
 Thu,  8 Jul 2021 15:47:20 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CD7519C66;
 Thu,  8 Jul 2021 15:47:11 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/35] acpi: arm/virt: build_spcr: fix invalid cast
Date: Thu,  8 Jul 2021 11:46:12 -0400
Message-Id: <20210708154617.1538485-31-imammedo@redhat.com>
In-Reply-To: <20210708154617.1538485-1-imammedo@redhat.com>
References: <20210708154617.1538485-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-arm@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VxeLZ2wg8GMh

implicit cast to structure uint8_t member didn't raise error when
assigning value from incorrect enum, but when using build_append_gas()
(next patch) it will error out with (clang):
  implicit conversion from enumeration type 'AmlRegionSpace'
  to different enumeration type 'AmlAddressSpace'
fix cast error by using correct AML_AS_SYSTEM_MEMORY enum

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: drjones@redhat.com
CC: peter.maydell@linaro.org
CC: shannon.zhaosl@gmail.com
CC: qemu-arm@nongnu.org
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b88ea4b70a..a07540affb 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -361,7 +361,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     spcr->interface_type = 0x3;    /* ARM PL011 UART */
 
-    spcr->base_address.space_id = AML_SYSTEM_MEMORY;
+    spcr->base_address.space_id = AML_AS_SYSTEM_MEMORY;
     spcr->base_address.bit_width = 8;
     spcr->base_address.bit_offset = 0;
     spcr->base_address.access_width = 1;
-- 
2.27.0

