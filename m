Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D742DC53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 19:29:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wonSt-0003jS-UC; Tue, 28 Jul 2026 15:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonSK-0003Si-UJ
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:27:13 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonSI-0001ZW-If
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:27:12 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-38e69bdb0fcso169736a91.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785266829; x=1785871629; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O97834IMZHMJj8CNpJQMqMEGxl2bcDXLGwhFx5nEj0E=;
 b=JGvp3EC9S3QKc2++uBAqH4Q5I0O+DaoAUSg4jSpE8loaJH6Nf9sKjLNRHK6zhbnkHD
 eCFEAK0snC/ZtSIvQrYUw4Y/X74nBXKkaeugCfMyHKTMPBTb3TBLj/8Iv5oBcydeHE7j
 NIIOFEX9+PAdZEfqPzHjcwbDGJ6fm6LAxDzr9F53mPrXLZfz0QBfqLgqphoSTfEXl6Xl
 xptfsRrNBaxnsgnfgclph0vjgZjIDESeOkFaGZv/U1+wpvUrOjnFJtqNz0jCk+iWMoEf
 uHD5Dd83F5H+ImOwQlBkrhGOqbMDhW2hXUVpQIhBHV4os9xNX1zynudAy78OymxweBhP
 zBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785266829; x=1785871629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O97834IMZHMJj8CNpJQMqMEGxl2bcDXLGwhFx5nEj0E=;
 b=lOhXE/bMKcNyNQvmS4w379pVqkKA9Y2evYvIBG9ot/MaK/K2IevmPQCHxEXZYCZ/z/
 CYs+wyqKovM+tkPcvkVQlLVOEuJS2Yb+e8UYx+rcW7dvUk24rW1vUoeUaURMZREiGhEF
 r3A0dzIdI09H0h8xKiLzAGmbDvexvYUAp9n0OBr/P/KG/oUVVt+rDIHjTEhUiIXgDPNw
 3FYveBMOg7Ijtuyq2+hzNRvFTo2Y5V8yMi+qHvpmpEZ/yazjyWPUPRAOLnXo63glKydk
 cc3zS8A8+/hJd0w5mvdEta4GVsx0D9UWxlkr6fGahlGYMoanBSuDhhSlj+q3Dk9j7UGe
 Beow==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrm5lKCYt/czXdayAJGGCj3S0sMsOD+UsD/AbDs+XdxkMVdvh62W4WMb4KQTmPYt1Q2vu/Doz3yLg==@nongnu.org
X-Gm-Message-State: AOJu0YywFRmXr4pzNo3aSB8vFJwmw1iPQnQ4MlqI3vxrc5z1NqCF18eK
 CF9ROJBRMNdKZF/DT0gOh/vn3+pul6sKw4vvnez2LkOhboQkwsT4yBhFdDsPX0VxLr8=
X-Gm-Gg: AR+sD12QCie+tyrTh36LR58CO8wVPjlAzS7tzjH7tSRiMHwxjayDKRFIzCHHx3amUCE
 G+ugk1n1GSH/qkfZHQvrlURWGlyFNfW76iuHfWC013G2NfPQNTWqVjPb60287wxh+OsyrWUHGQG
 N8c1pWCkmPyoQdwKWLFrqpZlipn2/QQ3+LoZKyJrTbX5baS2POOq6xUbOxsgoh1CgiXkmuJ9VDs
 8d1rXPw5D54QzuMHPx3fTof/falDriNjJXu+S9xE8eGpNo/CUFeJNl9uN7UV0+Z4R9DXfE3NddN
 k5Q2YrDxJyGorzsIdn9s1bVsoqgzE0/1VQ3R0ZicvAkktGtbmGPniEa3TFyC+mX0s/sjASjWkXC
 Z9bqfVIQ8wR1tKKVoybtXohBSWKu/aeCTO33xnzVKPqX6dePWS2dyltGUY3XuGYqUU7sJl0Tu3B
 iUWq92JEgcLze+La9vWEUhsOyzbEMb
X-Received: by 2002:a17:90b:4483:b0:38e:584f:2515 with SMTP id
 98e67ed59e1d1-38f6a465c40mr3652686a91.37.1785266829178; 
 Tue, 28 Jul 2026 12:27:09 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:b9d1:87c9:a085:86c9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f7f1353fdsm372650a91.8.2026.07.28.12.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:27:08 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v2 16/24] hw/arm/virt: Embed Realm VM type with IPA address space
Date: Tue, 28 Jul 2026 13:26:22 -0600
Message-ID: <20260728192630.240375-17-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728192630.240375-1-mathieu.poirier@linaro.org>
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1033.google.com
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
index 27bed9755320..9123f46fae4a 100644
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


