Received: by 2002:a05:7022:983:b0:97:989a:5032 with SMTP id bt3csp1282482dlb;
        Tue, 18 Feb 2025 23:17:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOINnLJmkjxsAyz2r6GPnDsJq5XCJJNrg1spBOENo+DckKm8dcKDBdBMX1fYl9gN7JQa7SqRxbunnwRg==@linaro.org
X-Google-Smtp-Source: AGHT+IHh0+IfvOe2QtFWod07xnqHDa6jCYedL6S/LO0n2D7j/hrA0gL8MpH8qMDJpiU894X6Zy+H
X-Received: by 2002:a05:6214:501b:b0:6e6:62e0:887b with SMTP id 6a1803df08f44-6e6975aaa99mr38294606d6.45.1739949435705;
        Tue, 18 Feb 2025 23:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739949435; cv=none;
        d=google.com; s=arc-20240605;
        b=OGnBzon37I/JA6pkcpLnIF9iY50iq3BTgdow9/YO43BnbLjfG9eBT8+AwT4rzMhDOf
         c9bBmRxcprLkBYgplIFcT3g8TS2IWi1z8xNF2giaqVAlo6Z8RJoMuRMBMD+YC8grK+am
         18Uv0I/hW8n3YzT75536Pftee8G4m/WvtxHkVHYUoPafPu1C6XlZEHlx08NeQSmjhQDr
         WiwNKXtgHVNyYlthcQ6H+teExrxSDX4lSV2+xQDatErV4CjBO8p2IDBIZdbeyE3uzu+3
         Tes0Go8BTd884YiAcPWp26g3ZZNFtMeKze5d3FdDB2j69kRyQEqAI5MmaM9mlURLaks7
         oTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZVhGhqC4dE0BiCFLecswTfXQ5k/f1kS6/SoNstmulnI=;
        fh=KhXLSX8c6wVmhLa/nUuNp/bImSZbg0QIIf+cCdMOZ3k=;
        b=aBcNaILK0m8+gmvAEeQX45Q0kGVbMyV6iEZBMbxl7OdiAWNNXla6/QGqaVkUzgYJaJ
         jkjAdyvhZ+OJKW5tnJb4jSy3BU7ZOWBgDvpOxifNcwY08O4SRaf09P6xEsp9EL9lStg0
         4TnZHmDvzzB8whjCuGt8MQd98OiAFtJFKtFrdonQOieIfc4Ldk5opYGt0uNcJdFHt7Tz
         t/BG3pXQvJ+zFZwbcJM6+htHpMA+4RjlrVmwfAAladWbavlsjSjPK8qBYRQa0oAqphyP
         LnwI/Vn9URZZEBG6TTUGkT0+RtlnfjYLEQmqA8Pmff6tMrQqJb+sc7XFOGV/8uHdwJr7
         s+Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UZXcX19O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471eededae7si57581461cf.97.2025.02.18.23.17.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 23:17:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UZXcX19O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkeK5-0004nC-Pe; Wed, 19 Feb 2025 02:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIq-0002bS-Tx
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIo-0005MA-7I
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739949317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVhGhqC4dE0BiCFLecswTfXQ5k/f1kS6/SoNstmulnI=;
 b=UZXcX19Oi274kaj2MfnCsrCgTEssF8U27qhuioBU4E9Di+bKvUJD3gfztjRE0Q0Y24MJD/
 imR5jpGrYY0lM0whv5+UYzuSH4XI7Qed4gVO1HYrzo8Hj9lPJlGvGxNRlEKm7U49GSzcgL
 5CyhUE7+2yUbPStzMyDdPyK7tOPkfJ4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-3N-CuVrZMYCoPL79huT0uQ-1; Wed,
 19 Feb 2025 02:15:13 -0500
X-MC-Unique: 3N-CuVrZMYCoPL79huT0uQ-1
X-Mimecast-MFC-AGG-ID: 3N-CuVrZMYCoPL79huT0uQ_1739949311
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 38FF319039C5; Wed, 19 Feb 2025 07:15:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.78])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DC57430001A6; Wed, 19 Feb 2025 07:15:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6AA481801B05; Wed, 19 Feb 2025 08:14:33 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Ard Biesheuvel <ardb@kernel.org>,
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 graf@amazon.com, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 21/24] hw/uefi-vars-sysbus: allow for arm virt
Date: Wed, 19 Feb 2025 08:14:23 +0100
Message-ID: <20250219071431.50626-22-kraxel@redhat.com>
In-Reply-To: <20250219071431.50626-1-kraxel@redhat.com>
References: <20250219071431.50626-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: MDMtauEr68oH

Allow the device being added to aarch64 virt VMs.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4a5a9666e916..046835836fc5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -81,6 +81,7 @@
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/uefi/var-service-api.h"
 #include "hw/virtio/virtio-md-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
@@ -3120,6 +3121,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_UEFI_VARS_SYSBUS);
 #ifdef CONFIG_TPM
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
-- 
2.48.1

