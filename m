Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C056ECA5FE5
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:25:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjkf-0007Uh-9c; Fri, 02 Oct 2026 16:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkY-0007N8-8a
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:58 -0400
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkW-0005oW-ML
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:57 -0400
Received: by mail-pj2-x2b.google.com with SMTP id
 d9443c01a7336-2e2d2bbcab2so18104105ad.2
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972455; x=1791577255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xGwa4+kYIpnF7nSKCoYuD6ZjnEJjyPrjCuP1EkufKsg=;
 b=WarenS4NlqmlSJtJ5AyEdWsWvxgH/pnhU56fRmpiGaPZh8Po7AwpDEZuYuZ9KaHp+r
 dou8egoLJorvsDsoZD2/D4vdCxZzM/QF/2d24zIs2Gs2+hIzWzh3w9ECUOLWntUEzOCg
 tErQhd9sPLvSBL35i6wzd+QLX16y0/gCpKvMf5Hk5JU6ng+BGBSDV5WxuPWTyuuGh1YG
 z1hRfAJDaIZY1HwzJy7HzXSwXYoZecOMh2xNYgSpq8u+C+s4L1ScTa2gACO3Ja/NbiBv
 rcW9mSTf3siJS2iR7WrsvPo3BFtgQzqLfxhH8L9RJtJ713jDgGhTItg0inODjLFvTU3P
 5CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972455; x=1791577255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xGwa4+kYIpnF7nSKCoYuD6ZjnEJjyPrjCuP1EkufKsg=;
 b=O+u4/HSHvLhUHZbbcQ8TSvMKHwHPm7jhj10tqKu5UDNzX3L2jlfk2to7pFesw7UK8t
 7wrUXVvgVlcwQ1monkS302gliRkqcfnXk1ChCgOSTD9wjTVLb/gaYyC+UokZ9kpGiLgP
 22L/xyoO0lvWUqLo0stWt8DDY/k0bXCJz75tXTmue/P2DequLQ14RhLAh91PP+VOHdjy
 ieftTHBEhyco1jQhHFLMwA9gc6FClr4P4xGgh0UkrG9xYdqIdN0Z5btvm2G3IR7B6qou
 fKIfc4LtLDfz3T/mS3iGUX6gKyKTuIZWC9aagyMTg0+jXDI78+YhoEM8hu1yX5IxThiC
 1gWA==
X-Forwarded-Encrypted: i=1;
 AKwUvByAkGL2/YcacLdTnBkckrwAN715MSyHi5YcnCH7yZETT/MM9VSszQFri/bjelaj+pNX6pM4exvQ5g==@nongnu.org
X-Gm-Message-State: AFq9FYLMAyy4rWuwZMVxbptxtszuccWpAGsq5kSAAyFVHCbt3d1BseJ9
 I51GM3w6gyZDEWSq2dlOGYe9WOvLb2Hxim0T1VZ5CBdiC93AHLMs/Di5WDvvT4YIANM=
X-Gm-Gg: AYBFou08fbFT5qh258rZ08JhK1TtY3SnNDIWxy/To4xKahMWiyZaM9uwCL78wrRwHLq
 xDuFHK6SDRknj9zu6AqGSf/lSqCHdXicUgMpqyt9jysbmLdfKtUqNYainStM/xPCXDnI1/PlfY6
 vMr61yVinwAuGUT1mHRjj6t3ch1vNtIfkg6LgJzWzddmfMj0xOsEDaFLbws/E8chwgRCVVBKcQ6
 QEA0t7+oVUCUxr7cgpt0QkZuINFPUsGzzgtCWyZXKT7zH7zwZ/UZ9i+QCr4IiQI9mq+Xwrjb2gS
 KCHdXjuTCG4X2Rquf9oXGo/lVRcbAwbI4d3m01pXO255/mmdkNO3qBj6zs3aHJTD9oPd/JVGY0M
 WZQ4+OJD9zBhbk+qExHZFO+x2QmUl0EVBUY7q7k4xJ0Xc61KgFF+pFuZUV5jBx/r6OKkkFF1F4u
 AgkjMmFEU7723yMmSs5/5K8o4XLOhs1/diee9nBTVZSmE0E3iHDEgnB7MlisMM2zDd+PnBu9ji4
 RDFAcuCt0TAkUtRA+MzPlYpq1yPFemtQY4=
X-Received: by 2002:a17:903:18e:b0:2e3:1bb4:6113 with SMTP id
 d9443c01a7336-2e49b648c41mr40464145ad.26.1790972455139; 
 Fri, 02 Oct 2026 13:20:55 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:20:54 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 14/22] hw/arm/virt: Embed Realm VM type with IPA address space
Date: Fri,  2 Oct 2026 14:20:18 -0600
Message-ID: <20261002202026.1204110-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::2b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj2-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Set the Ream VM bit in the IPA address space size when needed.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/virt.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5ab4bb23ef2d..cdfb71ce97d3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -96,6 +96,8 @@
 #include "qemu/guest-random.h"
 #include "hw/watchdog/sbsa_gwdt.h"
 
+#include <linux/kvm.h>
+
 static GlobalProperty arm_virt_compat_defaults[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
 };
@@ -4047,9 +4049,12 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     VirtMachineState *vms = VIRT_MACHINE(ms);
     int max_vm_pa_size, requested_pa_size;
     bool fixed_ipa;
+    int vm_type;
 
     max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
 
+    vm_type = (ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL);
+
     /* we freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms, max_vm_pa_size);
 
@@ -4074,7 +4079,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
      * the implicit legacy 40b IPA setting, in which case the kvm_type
      * must be 0.
      */
-    return fixed_ipa ? 0 : requested_pa_size;
+    if (fixed_ipa) {
+        return 0;
+    }
+
+    return requested_pa_size | vm_type;
 }
 
 static int virt_get_physical_address_range(MachineState *ms,
-- 
2.43.0


