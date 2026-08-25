Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F067C61DBD
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:03:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzE2-0005Z4-RG; Tue, 25 Aug 2026 18:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDC-0003rM-C6
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:44 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDA-0001r4-KA
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:42 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3856d6fbcb3so396074a91.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695299; x=1788300099; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yoa1yXasHmwThxA/d6QCly7EHag7eD5zfWJ/qbBT6qc=;
 b=HyyT/CqkjCIDudEfTfQvnM5GZsLTu4i8BrBVOoeBlNQutE1Jpo7Wk4m/Mby3nkGMfa
 PtaBgiE2K60+a3emuy4tUS4uEVNggDwauh9VtEVZRl2hmLaqBBnNSiYofAetqt/BheZt
 neUQVqTyDa4B8Ta76Bp9cy5RHyoO5qGcYsiYbX51U6yZ4xbijDc8ye1S4en8kbhKT4Oq
 OZn2ZpcOcruEuHMizPAkCD3o3j5fl82AJHRcTi8d0Y8jbepYY9Yqq/+whr39mVAoLso8
 zM5fPAA3gwSiwW1l9JpFPD4PPKZkxob8zYVmJn9PWdor1nQo22ZktUPWXhkaQ0SQjPew
 lkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695299; x=1788300099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yoa1yXasHmwThxA/d6QCly7EHag7eD5zfWJ/qbBT6qc=;
 b=LLOukQKSM0ljaZc7Pv8wzhTCqWH9DA6Pk0uyjr2Sf3TDur8puF3uQwv0By/NyzVTwX
 kioPIGb++Fr9jBRvfpqdnIyQeRHaqeeS9W9V7hqrTEEsEApashJjFVXyuQ04Es3UDuSV
 rxXKa7j4QvgjFWslCpijfkgwSmH/5Xcuj/eExrVzgIlQenY7t9h/RLFQafUXrsNkSScs
 ceGCsUC7MevFzS8+F91C78XjWkbkk17cwlhEfNBumZMCyS99qMFN31RLFqkjdp6EEqcs
 JKjCoTZjIKevpipfLpfsxK7DBOST+mVPmMP9vJlEsk21FB1MkkVytakrteOXblqBIeUB
 62qQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr4Nvx4eLI/l1cnq/fwt/N2Smk2RX6GqQJ+53YM+YnNtlwtmKvETHwrxMFDWP5ZyjmLtTiKZVU7tg==@nongnu.org
X-Gm-Message-State: AFuF++k6f9t8QKDsy/Nk7iwKO/hQyhU3alqFaF5EzKx2Dt1S9KQa5+Wu
 lDwtoeU8q4CHlDx4cw3JV9+6dh93PtpOb2gv5oFJVYdDCz2bvMaLioxLrHKLP3TXKnQ=
X-Gm-Gg: AR+sD134Be1YxZMwrenzms21XIN6ACYwJauiX9vo8qSXVI19DoLVTX4842L+bx1ovmI
 mZkyQhcECwDlkm9arpp4ddoO9BR+OavZI8kW4M1e6j2xo/OEO949v9iHDZ0YGTeDX87Tgg6nBQb
 C4yoVXI52mQ6u04pBSvWful2nCx7l28z2MyPXQmpLLZYJ8YUJasuVWvvuwA1TZe716hD93kkBl4
 0w6+FyKDFAzdMHkFiM7iiFksAkcOhKCLQgk480uLSHjQDwCjSYTu9m6jWiEK1GOpmAieAjVX3Kj
 ZNUySMEQH1EeZa2cSLQ/8nccNoeKauHQTyJcU7WBcIDEO3JeeQ1Obvi3axGOVeh2Gn6WipAh7rz
 4iszSmKR+fMvYzWjDW8x//NDdsoAsplSSeAH1byO/nWeRVvKBxiVxvj+ZnpRnoz0wUCLr4RNuZd
 IwIq0XfaDapsyzgk07IWtIt6ihLwQIYsQDGEGhHKbEovyW/OpqUScSlX/Qq+//r6N8hjSRQpo65
 Dsh+y1mMY3mg6AdlJjBVRuFvg==
X-Received: by 2002:a17:90b:3a05:b0:37f:fd1f:d30f with SMTP id
 98e67ed59e1d1-3966d44312fmr4568138a91.12.1787695298971; 
 Tue, 25 Aug 2026 15:01:38 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:38 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 16/24] hw/arm/virt: Embed Realm VM type with IPA address space
Date: Tue, 25 Aug 2026 16:00:53 -0600
Message-ID: <20260825220101.3443954-17-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 3418d75eccc4..fe195d145676 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -96,6 +96,8 @@
 #include "hw/cxl/cxl_host.h"
 #include "qemu/guest-random.h"
 
+#include <linux/kvm.h>
+
 static GlobalProperty arm_virt_compat_defaults[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
 };
@@ -3971,9 +3973,12 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     VirtMachineState *vms = VIRT_MACHINE(ms);
     int max_vm_pa_size, requested_pa_size;
     bool fixed_ipa;
+    int vm_type;
 
     max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
 
+    vm_type = (ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL);
+
     /* we freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms, max_vm_pa_size);
 
@@ -3998,7 +4003,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
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


