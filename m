Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp335909njg;
        Tue, 25 Feb 2025 08:33:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUNm7IJ4gMbrIEz5pAAvxXX+oohT/nOfW/iBwXwJRTo+ObhptbXIxDQvrUQ490yERH6qv6AXrMV2AZvhw==@linaro.org
X-Google-Smtp-Source: AGHT+IHWtoe2xXuZ5UFd0nPsI+Qou5v3A8hgY3wGuNKzawu20ubVlomkaBX4NduZm32ao/eSS1zQ
X-Received: by 2002:a05:620a:1a8c:b0:7c0:a1ca:93ac with SMTP id af79cd13be357-7c0cf9507ffmr2401306485a.40.1740501183399;
        Tue, 25 Feb 2025 08:33:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501183; cv=none;
        d=google.com; s=arc-20240605;
        b=kIxKlgJTbTi3ImWGsPHfOpQYSULtezgjXbsbxuShSiWdkbg7+RIPmgctaIh3g6jUjp
         fg6BkkSMoVzI7LQa6ThZhkhurWCGdFTyZRwEOhbYHpnXwOEQVYbM/RNmbxWfUkj6WT+s
         gYpZDSZBMBM5vWAVGt+zpIAdrbETdgxOTshNW469UVzZQF8WlLbzORKufdltfOvpNMFn
         Xo+IXw/WbmyyfLs0vnqVeNHzx94yARb1BDomOKI2DWF91uFDSxg5aZYqNKHTVvLVS/06
         hK5zcl/fyzCzfJGZGKGeoZ/hdvOZqsvnBx/fBpFwHfcyVwwmh02xGXXkrOIuaqaLGUXK
         3/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0LerVMLCO2g0uxpoATuHSnU0aK0p7jxOiA6jhHk9aNQ=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=itB0R4r35R8nYFIifFXDPvdn8NwRFxaBksIjn6iV9NR6wM7fgwOtbO8q/6SF0IGmfn
         cGbLXs6dSjOB5sx+Z4z4kQFr6gVxCiAyqAapyM26JJd7Xjxo0VjHvkza95Sjj/hB9rbP
         TAEReZQK6aJ/Dv9nykiz0G6sT5lIffm9Y/SyU+Zd06U93cvrCOR4/S7OZedutez2/SWe
         9r0is6/97plT0JvL2e8OQZ2K54kfSUdk0p2ZJBnqmu+P7Jw6eUOtOJAcXLpZe4/lfOVI
         EvlJEqVgrd2lUmDpoCHjBuHivoLWh6Lovptri2UYLGa3yf/hGi5741og9JqQYL5ijOrs
         v+eQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P5rZt0rP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2daceasi215592885a.451.2025.02.25.08.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:33:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P5rZt0rP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmxqO-0001dW-1C; Tue, 25 Feb 2025 11:31:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxq8-00019H-4c
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:31:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxq3-0006cJ-CK
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0LerVMLCO2g0uxpoATuHSnU0aK0p7jxOiA6jhHk9aNQ=;
 b=P5rZt0rP37kHzGDJmng+U4G915lCYkCVsT/Zr49mhsUb4pgEwhsiavmJDNWdL0sVKpv5f3
 YCsVJHEtVo/PRTYQ+yXwqP2xRoP92TJ+IFfwLk3/uMuhIFQoOJ3P6Mg3vbCvR7F5eWdWqZ
 jVld17yJ4VHsK4mDgTOIngPt/nH5buw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-l3WcQJdJO5u_z4qVFDJxmg-1; Tue,
 25 Feb 2025 11:31:13 -0500
X-MC-Unique: l3WcQJdJO5u_z4qVFDJxmg-1
X-Mimecast-MFC-AGG-ID: l3WcQJdJO5u_z4qVFDJxmg_1740501071
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7EFA418E6952; Tue, 25 Feb 2025 16:31:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2CD3E1800367; Tue, 25 Feb 2025 16:31:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 14A1318007A1; Tue, 25 Feb 2025 17:30:33 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 22/24] hw/uefi-vars-sysbus: allow for pc and q35
Date: Tue, 25 Feb 2025 17:30:26 +0100
Message-ID: <20250225163031.1409078-23-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 4R7Ok8ggqYGP

Allow the device being added to x86_64 pc and q35 VMs.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/pc_piix.c | 2 ++
 hw/i386/pc_q35.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 04d2957adcd7..6c91e2d29298 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -65,6 +65,7 @@
 #include "system/numa.h"
 #include "hw/hyperv/vmbus-bridge.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/uefi/var-service-api.h"
 #include "hw/i386/acpi-build.h"
 #include "target/i386/cpu.h"
 
@@ -468,6 +469,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     m->no_parallel = !module_object_class_by_name(TYPE_ISA_PARALLEL);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
+    machine_class_allow_dynamic_sysbus_dev(m, TYPE_UEFI_VARS_X64);
 
     object_class_property_add_enum(oc, "x-south-bridge", "PCSouthBridgeOption",
                                    &PCSouthBridgeOption_lookup,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 77536dd697f5..fd96d0345c7d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -58,6 +58,7 @@
 #include "system/numa.h"
 #include "hw/hyperv/vmbus-bridge.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/uefi/var-service-api.h"
 #include "hw/i386/acpi-build.h"
 #include "target/i386/cpu.h"
 
@@ -355,6 +356,7 @@ static void pc_q35_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
+    machine_class_allow_dynamic_sysbus_dev(m, TYPE_UEFI_VARS_X64);
     compat_props_add(m->compat_props,
                      pc_q35_compat_defaults, pc_q35_compat_defaults_len);
 }
-- 
2.48.1

