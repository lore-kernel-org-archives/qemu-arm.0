Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp337987njg;
        Tue, 25 Feb 2025 08:36:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXoWM26Wkou7nIc8kwQ9nqVXpMAQPLPG+iKXyLPCCf4gCWjO0rCpBvIxsAFK9MG/ooATW2VOYKa0wqXdw==@linaro.org
X-Google-Smtp-Source: AGHT+IEFZNMPCe/SslVnWGlHnOBHCoLllVDWkPJMVKjRJUfeUD0daLFaGvT5jcxKVqxf8H6MXERG
X-Received: by 2002:a05:620a:4508:b0:7c0:b7ca:70ec with SMTP id af79cd13be357-7c0cef4853emr2559312285a.41.1740501386035;
        Tue, 25 Feb 2025 08:36:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501386; cv=none;
        d=google.com; s=arc-20240605;
        b=MT87F22T6nZAE2fcE0I7G2E4DTq9o4AX5dMiSbGXg9qRAgG1mGXs43vCoSzp5UghEb
         v6vQb9yyw99cOOJckujxD1c9mmXnw2135yAnNwIui/Yg//Ur2lRu9YEDTHcWIWkmD+AN
         UKZrL7U22bxUl6R6JF/QH2fwIi2Bhhn/I5uxGkaFjg0mXxjpZwzpMu0wl+q2nPpufDhQ
         SkufRW+VVWxBphZljmeR/rmQwRrlIYHloxI+uVznXIXcFztoemfqdoUklCdJ+/iSH7gO
         6LUW7Ca3H0F2a3xZ0MzZ4t+1sSQJ+KOCSj/kjPs7N5ZgqghIvGTpKRRLNSXkYyIkdxMr
         DrAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZVhGhqC4dE0BiCFLecswTfXQ5k/f1kS6/SoNstmulnI=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=XHEbv5fC62uB3LxWQHq9OyKxNR9EUZQFjgALUpcVsg6j/4bKquQXmIXkwMym4nfW1q
         4LbzZf4prdINCXq3oPPkJFKVCGvizuPhA0CDOsxkCtEjlILeHxI7yrimDyJ/zTcCd+KF
         IXLc3mOCoegWaW0cid7WikiDWLnDs8Rtrl1mMkB4znMbmcGiSmwFho/dx/IqCp9Y1eGC
         cWjHmdopTUCCqwxodh1RBxjXPIN6RmOL+O+31Cev0r0YPvVJfMzLtfdjvjMr+WTZk/2K
         Av3kYoPSgLfNw65qDM8pbiR+3yo8sFIBIKguqV7LxqJQeV2UQQHkf73nuXdt5IBu0Zgs
         Twaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H7SjrW5A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2d84c3si215045985a.390.2025.02.25.08.36.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:36:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H7SjrW5A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tmxqJ-0001Te-7N; Tue, 25 Feb 2025 11:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxq8-00019k-Cl
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxq3-0006cN-CK
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVhGhqC4dE0BiCFLecswTfXQ5k/f1kS6/SoNstmulnI=;
 b=H7SjrW5AMaz856VCpCU5VjVDFTemIPFlYufIiZt4l5RJqCKimPs9YNfbhD9tKlmFFnGcUx
 Q+WTAY7eE5Ap9Qtbfdp+YMn6MVZC8JeObKt30Ugp2g13OG1hQpn7bD6fX2z9JUyThrgC6V
 /Cq+hwokPzHnURH6C4nalpmonXX1/cY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-247-bmmw4boBPv66cNSqEP_6Dg-1; Tue,
 25 Feb 2025 11:31:14 -0500
X-MC-Unique: bmmw4boBPv66cNSqEP_6Dg-1
X-Mimecast-MFC-AGG-ID: bmmw4boBPv66cNSqEP_6Dg_1740501072
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EEA6019373D8; Tue, 25 Feb 2025 16:31:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 58CF919560AB; Tue, 25 Feb 2025 16:31:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 023E5180079D; Tue, 25 Feb 2025 17:30:33 +0100 (CET)
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
Subject: [PATCH v5 21/24] hw/uefi-vars-sysbus: allow for arm virt
Date: Tue, 25 Feb 2025 17:30:25 +0100
Message-ID: <20250225163031.1409078-22-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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
X-TUID: 65RbSxzlWDU2

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

