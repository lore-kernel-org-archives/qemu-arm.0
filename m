Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1672698ejx;
        Sat, 5 Nov 2022 10:25:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/68HpkbuWnZPqEtWmIS5hSRfYK5P0vxq4fpm4Jw8wyyvGjWx6CigzJjXRjoyb8V8NXK5f
X-Received: by 2002:a05:6214:5193:b0:4bb:db4d:b614 with SMTP id kl19-20020a056214519300b004bbdb4db614mr34687669qvb.55.1667669143233;
        Sat, 05 Nov 2022 10:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667669143; cv=none;
        d=google.com; s=arc-20160816;
        b=uIK2ujKLNF7+gG0Iq87vQXlSdupSpP4RsNR33GSsZ5TTBMn8QzFNKDrTOn1/Bu+kRt
         +PuX+sD149sczoP+XDgRAipztczj6GXVnxtIsK4tW/aS+ePqXzi0G4ma9w4x1fLqBzRA
         mQ0oGSRsbwMfp1hM6IcAH34+ypQbgNnyOM5qomePmlOt9+DjkDrrtW4P5KziZ7t1utoR
         8d3Y6JvOk3N955EQ8XZCpn046O3+AzO8JRDA5UaxE3LaJlVdx2zKhwM8J6uvqqUsS4jF
         y6r95YFvv3JqnZ7GnWOvPy4XUtGf+Nb33WYCAC9nkeR97QouzMOkp3ZMA2alI4AQORje
         fJnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
        b=BdNF8vQIL4oNIt9FSq+vQfpmPonHS2vuqNkz2Qo3DY9R3peFRMQFRJGBQ7zJ+Kbx9Z
         r+glR8LiiCvz+iiUoAzrnSbW5ZI8JaGX7ez/iV3HYdTPbdNW7vPvOZXWB9qHTau3tUKE
         ptjJOra6iVCm8HAx3xaT/3d9x5Dy3/+pK/I2lTYAn4Bglvv2/PW5c2iuryzyxYu6bbsU
         SDBqfWsD7lr+YdOuYT+jmmRfPxAMYYYNOfH5b483n9yzs0/H3rJVLVpkrSQFC1v8Io/c
         3CWhuquaTV1vvKRLkmcPPiff8TOLvjK1kWm8H8Ib8IiFgvAI0gA335OFR6EGCn2sQ18O
         Y54A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RNS+OVwZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9-20020ac84749000000b003a56ed43bdcsi1592897qtp.497.2022.11.05.10.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Nov 2022 10:25:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RNS+OVwZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqv-00010A-9w; Sat, 05 Nov 2022 13:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMp1-0007fz-0n
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoz-0007nz-MG
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
 b=RNS+OVwZuNLdSYn6nKcSOoXOr7OCaKyhNi5cyr9426h3JT0TJB8gE/uYqKhFNez4uJNVfC
 84Bi2CGn4IYwNiEf4Snb+b/kwL3wZKDehkiRP6e6YlHKEDKfAIfYpOP0HANlAtwpQRcSna
 7J6rrZQL+ypIXP5ekdGQ5N2XHqXdaFE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-S0YulUGGNly4XOizsYavjw-1; Sat, 05 Nov 2022 13:19:01 -0400
X-MC-Unique: S0YulUGGNly4XOizsYavjw-1
Received: by mail-wm1-f69.google.com with SMTP id
 az40-20020a05600c602800b003cfa26c40easo439250wmb.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oy2j3dzraHwJBqN04p66ThFiaUmnAcs5Y2XrHOxqe2M=;
 b=bPGmNerStIgIOCmWe87WD2KldDdDJhVTITkh8PmzBMDL/mHP95IrzJps0ma7/Ghb1Z
 KU4BrRKqdjbv/Ih83KA/w27kMQgRphQdpmfffeJCLv2Z8m7PnvFj8ccI9NZ0NeIqg5y0
 9WRVOZinWCmwoOUy0vFsKlOb6QuVbHdCSDUeCpCO+KnH/vYjqhgTmft6W+bPzf9CfnlM
 EuDlOG1oUFT+PPkFuwFzKkRGT50uYoXhSXJgVo9jXk7HgJli5uog2SLGA7NBe6Y/k8WV
 8ILczEtv46fH/ddNcutOrIrcgBu/CRC4e4Ob7+L1i6puQhIKVb05HYJeJqeIGJ/sPMiR
 Tk/Q==
X-Gm-Message-State: ACrzQf1Nm2wLc2QFyH57K5StBdrI8b6lW504zLQypA2xwuoVIBrrQeF/
 HckbKmmp5yKL6w6aBt2HuFhCZAQiGMqKjL3GulklgFj4ZxvZUtPL94HUvo4vgrXQGY/yVN4HJNR
 P9DkUDCGC6ooPPLerqBIaxkBo8Pklhuz0G5eyxqfr1PrcLpyCjSD4zvDug7pe
X-Received: by 2002:a5d:4804:0:b0:236:94d4:5472 with SMTP id
 l4-20020a5d4804000000b0023694d45472mr26188799wrq.286.1667668739985; 
 Sat, 05 Nov 2022 10:18:59 -0700 (PDT)
X-Received: by 2002:a5d:4804:0:b0:236:94d4:5472 with SMTP id
 l4-20020a5d4804000000b0023694d45472mr26188783wrq.286.1667668739766; 
 Sat, 05 Nov 2022 10:18:59 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d4b12000000b002365f326037sm3111422wrq.63.2022.11.05.10.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:59 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Yicong Yang <yangyicong@hisilicon.com>, Ani Sinha <ani@anisinha.ca>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL v3 72/81] hw/arm/virt: Enable HMAT on arm virt machine
Message-ID: <20221105171116.432921-73-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WYY1VQpieTU3

From: Xiang Chen <chenxiang66@hisilicon.com>

Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221027100037.251-7-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index da9e41e72b..4156111d49 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -42,6 +42,7 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/generic_event_device.h"
 #include "hw/acpi/tpm.h"
+#include "hw/acpi/hmat.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
@@ -987,6 +988,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
             build_slit(tables_blob, tables->linker, ms, vms->oem_id,
                        vms->oem_table_id);
         }
+
+        if (ms->numa_state->hmat_enabled) {
+            acpi_add_table(table_offsets, tables_blob);
+            build_hmat(tables_blob, tables->linker, ms->numa_state,
+                       vms->oem_id, vms->oem_table_id);
+        }
     }
 
     if (ms->nvdimms_state->is_enabled) {
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 15fa79afd3..17fcde8e1c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -30,6 +30,7 @@ config ARM_VIRT
     select ACPI_VIOT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
+    select ACPI_HMAT
 
 config CHEETAH
     bool
-- 
MST

