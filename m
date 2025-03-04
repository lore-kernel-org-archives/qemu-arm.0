Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp97981njm;
        Tue, 4 Mar 2025 04:52:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUFoOTtNHHXnmJmIVhwyFbslC2x007fajYKmByHPUiwdfV2yKKrkadBnSABdY58O/hOlbp6jU4snjUT2w==@linaro.org
X-Google-Smtp-Source: AGHT+IG6YBkrUGi+zOYh8jzlHzgKU0CbbQyyM8nXz3wnEWelNyzRH7a+syBziUBP1/l/WFuAUJAk
X-Received: by 2002:a05:622a:46:b0:471:9a99:4356 with SMTP id d75a77b69052e-474bc086454mr197776011cf.22.1741092722763;
        Tue, 04 Mar 2025 04:52:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741092722; cv=none;
        d=google.com; s=arc-20240605;
        b=ZWua8goDpEyfquCu44esUlHvetjyvd+eHH/97PF0F3mZwmThwQ2J5PgarejNU1hk/y
         laHsxf6jCCccY0BL2CNYW9AuruiktwDM0ikqIy2WAy7D35Gv0aN/7Mb2XLHqUTs9gjDV
         2+23jJ1QrJwlDdkURfLJagaJnTC2oIGxroN85DitOqJAFHBAxPONIuDuQUP64RxGEk9+
         /YHiDkY+XVn0I0m17M3U4z4DC6H9/XuX1f7Mz0pEVIueI003xCpXzAMb1GJNSiClFOKs
         7NGHecIDKKcyKeToedKjqUKhCAgThUtDwX1lJz7ho4+fQeSGoHvwXcH77DMATW7lUk9d
         fV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mUBOE9OT+pY4tCy5GFBKI+k5VNKGF2elTDpalQAv3lI=;
        fh=AUxCU78jacJE1vSghMJJha3+F2+VikVKZl38eSKs5/I=;
        b=WpYIVUsRLCsudOCVvGF/3DnACgA8Aaik27ygh1QIBf+SM+nZPl6JUJ2XQwFQAWENUQ
         uEBizfDJ/xmFOEVFBFjZe3LHY0D37qMyuq73Bg06fAOCdmrtL6l4RI9KCIKEGfbsIxUW
         8iroRPpWPYjNyoBJezOBCU4NKbomG56n4VXg28zi+0AIWsXXUeSIEmUXtWiSK2yRuWWU
         c4ouBIKfhvtnueODQDWuPaXlZKiIp4ml5Swk3/qiJx5IKc0ujixdQHpwoaICWyo00Cvm
         r6oya9hVc+5IufPFY7K/Dpp9gAqZgRylrMd9a21rkzPJfq8H0oHm/KUxhpVyRzWcmo0J
         vJYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iUwUUpQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4747240dadbsi111336051cf.351.2025.03.04.04.52.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Mar 2025 04:52:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iUwUUpQr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpRjO-0007XC-Cs; Tue, 04 Mar 2025 07:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhr-0004wT-UA
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhq-0007UP-7q
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741092545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUBOE9OT+pY4tCy5GFBKI+k5VNKGF2elTDpalQAv3lI=;
 b=iUwUUpQrvl12D99bdYVeRhC96KmPRxKbuCT60jfJCQ8rs7AmejXjdl2cKk/aX/b4LbC+mx
 UTLyt0FHEIfgYRya/xuR2qz1ls0Yui2N35SrGINCwMasK13AotUE4CRL22rrxAi3bv/DCQ
 3yydQWTT/uPpqskmAZak5ZL8xD0xLuw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-4s8HRx6YN0qQWL9hTwBEGg-1; Tue,
 04 Mar 2025 07:48:57 -0500
X-MC-Unique: 4s8HRx6YN0qQWL9hTwBEGg-1
X-Mimecast-MFC-AGG-ID: 4s8HRx6YN0qQWL9hTwBEGg_1741092536
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D9C781800877; Tue,  4 Mar 2025 12:48:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.122])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 81C6819560AB; Tue,  4 Mar 2025 12:48:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A01D6180060B; Tue, 04 Mar 2025 13:48:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 21/24] hw/uefi-vars-sysbus: allow for arm virt
Date: Tue,  4 Mar 2025 13:48:09 +0100
Message-ID: <20250304124815.591749-22-kraxel@redhat.com>
In-Reply-To: <20250304124815.591749-1-kraxel@redhat.com>
References: <20250304124815.591749-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: OJwoNQTSeux9

Allow the device being added to aarch64 virt VMs.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20250225163031.1409078-22-kraxel@redhat.com>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ee69081ef421..904c698b1406 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -82,6 +82,7 @@
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/uefi/var-service-api.h"
 #include "hw/virtio/virtio-md-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
@@ -3162,6 +3163,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_UEFI_VARS_SYSBUS);
 #ifdef CONFIG_TPM
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
-- 
2.48.1

