Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB5EC624DE
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:40:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DEt-0001XZ-T0; Thu, 03 Sep 2026 15:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEr-0001Vk-V0
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:45 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEp-0004IH-Of
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:45 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-39647184c73so1435238a91.1
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464202; x=1789069002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yYE9pOet48lRlcAA3fKM0Js3n1ztODOyy6XvoWvQ26M=;
 b=SQPD9hWTFokx2hy45BNdd5KDBy+HmaAC8mJewjQRj74g0woobMpOqk3yC+Qng90wV9
 dY94An4kwKUV7K5C0Mo+FXYbhmAEISait84gi4kvzsucU0Kj5ARfMhM/qdTI4ZTTNg46
 AC12+hAqRWDJlAOV0jo0MkM0+0FlbBvDRPHur2BC+uV1TBsOSmaiESlN+by1AcdyQavN
 l/rd5z1hFVhCCvUEJBX8yffF4CPp/Q8B9/YWoT9/eJpH+p13gtYMRmLHv5sjH7w0uh7j
 /ZDGDQj90UIC5FylUglarDnPzah/lh+nbprCKF1MOzl+5dPE/fO2pagDJCEUcitItJiC
 V6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464202; x=1789069002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yYE9pOet48lRlcAA3fKM0Js3n1ztODOyy6XvoWvQ26M=;
 b=LrcOUx+EQlA7fV/ex2sUipZEMvdY4fJlFmeOSjGOTXAEwWyuohTm5QUedeHRe6RkXQ
 3ZkFB9VDwQ891LRd2CzGGys+jihyd7Zz0qjT3TsJnOvJUpzGCt3je7cTwg8GX2P0PuZC
 UFaciCpVdmUeD4vsZBZD90NWXMclh21zry/vZVVTY1iBFw0ED2UU+Phjij0gifQaVp2s
 X5CmR8Cqw3FZSwDKIw8dU90KwQdWwYutX7cx+HiAUtxTBjM9NoxFU6i1cvLOLl5Z3PmL
 2M2G4/9ltUrKQeNyUkIDiqEpcwAKATyudilNdh+x8ioMAzOA47RyhKgfPyIp5dh/UF1E
 feRQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwoyyn5ZWtNzcnRyNUts13up8O5nIEFam0mBNfB0m2BhHaTQAQ6NlzKxQUGqfdOOVXdQcSBAlhU9w==@nongnu.org
X-Gm-Message-State: AFuF++kTvNMDPMhr3cGZY4evALFW7G7e5NBBFAHoEXmM0fe3vOPkFuXP
 9cSGXiemjjXtJH5eQBOOAMWhzVJ3G0N02LnCurFadXlVHzZJB9zbI3GpeUye+hzuFXA=
X-Gm-Gg: AYBFou1g8cX/Cudny9BhlA3QNN+2ExeHAfq3lmEK7D7xOI0UwjG99Vz/g7enGpMVGxZ
 C6y5DdR9maANzOH9cvRA6bOH4AMDjE9d/j8U/f1YFRr96tC6BZBSU8aC1atirZyrUKFhON0nSpW
 sAMSU9fzXelPWrsp3RBplIJCXTuGaCxljq69um+8/FiBASfSEb/vAhsM8IbWOMdCtjZTe6avtuN
 aISz5QRtZ0oIzgr8bs9xWHJqmmHeJR7VBVoCHPCqFOZsLvjshXPD0kiOgDv5vHb9nXuiHDFh9dY
 Ru2cr5qkLxqp3dJRrb5RV4BkZxsvjBgNTrhiXNxdnxHd2u84xanu/SsgK80++2tHxieulg3ClOF
 Z7SyUBabe9ivwTc0+3QfjDpCOUrR85lHAh7ws6U9mAVU8sMluLwvpyIRxsGHm58i+RyRtXYBc62
 MC+0YmeRm1kZb8g593oSEqxTDqyOgef5/s98k0Vclv8SSOeUwtFGTflyUMtel0/9O+Un6i52cO5
 BKJjQ7SlLqrhV8=
X-Received: by 2002:a17:90b:5484:b0:384:927f:3db9 with SMTP id
 98e67ed59e1d1-39b27c0fa43mr86643a91.1.1788464202333; 
 Thu, 03 Sep 2026 12:36:42 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:41 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 16/24] hw/arm/virt: Embed Realm VM type with IPA address space
Date: Thu,  3 Sep 2026 13:36:03 -0600
Message-ID: <20260903193611.1058589-17-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
index 37211bc81926..61751aa31e0d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -97,6 +97,8 @@
 #include "qemu/guest-random.h"
 #include "hw/watchdog/sbsa_gwdt.h"
 
+#include <linux/kvm.h>
+
 static GlobalProperty arm_virt_compat_defaults[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
 };
@@ -4053,9 +4055,12 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     VirtMachineState *vms = VIRT_MACHINE(ms);
     int max_vm_pa_size, requested_pa_size;
     bool fixed_ipa;
+    int vm_type;
 
     max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
 
+    vm_type = (ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL);
+
     /* we freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms, max_vm_pa_size);
 
@@ -4080,7 +4085,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
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


