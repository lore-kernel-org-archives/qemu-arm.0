Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp192455njb;
        Tue, 11 Feb 2025 01:26:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWpqzhXh8Xptd2dWEScft5wjDjB/mLQtqxEpkEJlhEklUYS3fEsLs6hiBdt7UJ5po5rr3K7dlTroc5CdA==@linaro.org
X-Google-Smtp-Source: AGHT+IEdMuJgZ4szHtXxBcxT0X+h36j6uI2OVLjDCrAjilVcNz23XMA2fXqTcgLYCzxBxhdGb3i+
X-Received: by 2002:ac8:5748:0:b0:471:aad8:f8b3 with SMTP id d75a77b69052e-471aad8f991mr2503961cf.22.1739266006949;
        Tue, 11 Feb 2025 01:26:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739266006; cv=none;
        d=google.com; s=arc-20240605;
        b=Xvcb3RI06I1VQXj/ocnOicNKrn6wE8HUq5rLY+6saRwT2OYuQcCLApbpasQ4xOI76h
         I089EulwMejJxYTM4t/G3zxFqrwiYEO477E6ugkffK5JbanA/NszwMeJodHh/xIHcARo
         SkGlTxX9iiBQz53FBahR3GEOdKrWtxDHssI13c4NalqsBQwU6MDSIXQge4+d+GyMEDSZ
         VjQx6zDt5joAsCM/PujzDJh0kHo38W1bnUTFC5DAqGWnT+T1pQZ4Oigq1NPtmOPiKwuu
         6iLcyF6rGHPIIzJHn4ufpJgtobM2qK/RKvJlJJc8xgv4SdFMFenYOO8NgBl0n0C5gtZd
         TDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=odtJwCAIqy3le9iGA+tvLIIlcoaTLRoAmUCh/6QhP5E=;
        fh=e1SboN20/jHvoiD1YSHiGEBjk/mnJDcFYjKWtsBcI2Q=;
        b=a4SLxdPbBn4scMnej1MTP//ufDgwmTcEecM62UyC0BlZWAutzoNlDe51wqn3vsd8WD
         Qeow+MRFbq98Yx3lZ+ciYk8ott92EW1qP0JyyVJKdtUZ0BS4pE3pzky4jT9Cx+CoUTnJ
         BBIM4DiPMrYmiappXypRIlFKpWtnoXEMoKAJwCHmIDvvsPjbJeUaWlUrY5L8O2sM50pM
         ujDLqjH/yaY96g3ggc1oxvYuKXUzRTY0eOJ7qAjutkEBUZcsm46MI/amHyAEQdHTxuKA
         KKsLfmmiPF6L2LkdBBugNKxe8YQvgfytwmPCjXH5oHLUvR9eUQG3e4UCNSLvQmw3015U
         N/Cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dyA17sJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4717f3d65d5si59356551cf.15.2025.02.11.01.26.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 01:26:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dyA17sJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thmVC-0003H7-6R; Tue, 11 Feb 2025 04:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmV3-0002sL-OA
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:24:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmUu-00036F-CB
 for qemu-arm@nongnu.org; Tue, 11 Feb 2025 04:24:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739265843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odtJwCAIqy3le9iGA+tvLIIlcoaTLRoAmUCh/6QhP5E=;
 b=dyA17sJMQ7xFytt/Y8JGTBmIzvYPQOoIM8hcaXk9GsDwNU5TjAQNN9znJ+k+UQwbkNk9C4
 VpShcmPaDTsKSnriZZitKK9Ib7O5H4H1+Mmu71UKxai/tdRnvl8eztdUtep3JzEdOycP5n
 /T/SE6IeH1LMhYJJJjJgOsLGhXbamfY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-365-oeP28RLgNpebqEsDgsjKEg-1; Tue,
 11 Feb 2025 04:23:59 -0500
X-MC-Unique: oeP28RLgNpebqEsDgsjKEg-1
X-Mimecast-MFC-AGG-ID: oeP28RLgNpebqEsDgsjKEg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D46D31800877; Tue, 11 Feb 2025 09:23:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.57])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EAB031956094; Tue, 11 Feb 2025 09:23:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CCD28180061F; Tue, 11 Feb 2025 10:23:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 19/23] hw/uefi-vars-sysbus: allow for arm virt
Date: Tue, 11 Feb 2025 10:23:17 +0100
Message-ID: <20250211092324.965440-20-kraxel@redhat.com>
In-Reply-To: <20250211092324.965440-1-kraxel@redhat.com>
References: <20250211092324.965440-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
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
X-TUID: 9dVPkCJttVhY

Allow the device being added to aarch64 virt VMs.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99e0a68b6c55..6146f47f746e 100644
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

