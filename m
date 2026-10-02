Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFC8CA5FE6
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:24:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjkf-0007Ua-8s; Fri, 02 Oct 2026 16:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjka-0007Oh-MM
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:00 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkY-0005ot-K1
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:00 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2cfbbdfa60bso17634585ad.3
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972457; x=1791577257; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vuH6P0OStc/UzrpQmtoJOgA5ex/nCeUuUbaOQvlKUg4=;
 b=YFEkrU2HIVf6TFggSuVfzbtYjmBPVpDhqyReZdx+nXhJ+9Q1qiy2WUNlqoO+YURJ/J
 nwHo+zJqwKCTV4f9DKpRMfPNwxSS4ztBsYzxONX5AGIPxxAEHv8Qx7Zsv4H+4KfSEiJk
 fl4xnSVIx1t8EH+DaDXt41rDm/FqS5BMYvQIe9utdoonea4+1hi0tYZrs7e/C5Ue4+hu
 o73jF5yQBckbtriUDbM+dGKDPVuOoqkvJJRE8KsgzFe1zSigbetH3oxsV2qdqDXBa04l
 r+a/za0aIA4y3uRJ4idamhRufLDDL7Yrau0X0Y5b1EOzrI4OqU5qu2ND/Ocp/b3dwJui
 9KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972457; x=1791577257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vuH6P0OStc/UzrpQmtoJOgA5ex/nCeUuUbaOQvlKUg4=;
 b=UyY70Sa6FMCLvm2CruBrkkSWPDQqB/teGrNxfhwGXB1kObGhDgdBPTtLLUPklWxTRc
 p5soJh/cGVc/yNPF10lsbIt9Xzjz0PH/C4HSOiSBpE5daUTcMVMWBYcOcseRnUDv5Ost
 JVjVSoGr1oGOqWB1FwtAkdklkgJr4w1e9lzg5u31nd5l4L/iVH6GegEMq4IFoGBoUblP
 bkCrBAC6XgVj4q12+wc3eqZ6g83d/Esyx9VIJ6EROZvKX0ebdNnYJohxsoQIV5rawH8X
 LjWliWpB97zUoCjEeOFwDK4ZSkM49YuUh4ZuKLR65LNiQ+HBKdQczyH32QO3MAetgmPU
 cnAQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwvooGFDB7PPAWoQgLYs/NKXmJKRsSm47L9dAzvxapHcwQhoe8C7v+yD+g/QwRh9I/G6G51ppFPNA==@nongnu.org
X-Gm-Message-State: AFq9FYIx8GMJzAJa2/KJUEvKFmr+I7099jBhxuQX6m5rlGL49cP4KXW9
 1UQoUiKNaekGKhHoRwU+mn3oecbdI+8QLUZksRsKBNz6YFK0q0ajB9TrRMjQ6v+uTI0=
X-Gm-Gg: AYBFou2Z+c6WeVeAzNca/kKvCvTqKzfW1C3xv9gDJ/XnXExWQimoWTxGk+knggYxeoI
 zhfobzC73SruijEo9+Uo6P5kApV+Br290ptzhlTnyqgT12qLGXYvqR0vxWhquis2SIpbla/RLV8
 CPcPLfyou7FMEwA0w0cDIUjMbTd2HAPnaCMhgmBE009Qm8unyOFCieJKPtEqSd8tfSmLVGg+JZZ
 W1eaFwfldA3KJTimk0HAyLDvdPuxK95YV7DP5ky3Gfp8I2mWFQwVEj1g7vNh7DcTqTU68u6GLh4
 0cGeXIspolPCQBP84cHRWCvEKNO+VEtPX9DR/ONfG5wNJ7Hmn6rk3zi034bgsOM8UAeooUK7hra
 IqPCOp59TE6sChTqKKglOiZ1cDEI3Q8147SVsF0PCFAEdfxiovO2Zo7Y6v4/1g5XEijuweF6keA
 DGg8YO23Aruvcluad0E6qoOKMEQXsBtvfvaiJn0scw4SEf/BfP3y+XM/ufp+tpRfc0eu0JemvG0
 EvAjqnsN4oF9nrZ3OYKm83e
X-Received: by 2002:a17:903:3d89:b0:2dd:c100:4254 with SMTP id
 d9443c01a7336-2e510562a17mr4146125ad.56.1790972456622; 
 Fri, 02 Oct 2026 13:20:56 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:20:56 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 15/22] hw/arm/virt: Reserve one bit of guest physical address
 for RME
Date: Fri,  2 Oct 2026 14:20:19 -0600
Message-ID: <20261002202026.1204110-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x634.google.com
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

When RME is enabled, the upper GPA bit is used to distinguish protected
from unprotected addresses. Reserve it when setting up the guest memory
map.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/virt.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cdfb71ce97d3..b2cca73dda6f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -4048,17 +4048,27 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
     int max_vm_pa_size, requested_pa_size;
+    int rme_reserve_bit = 0;
     bool fixed_ipa;
     int vm_type;
 
-    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
-
     vm_type = (ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL);
 
+    if (vm_type) {
+        /*
+         * With RME, the upper GPA bit differentiates Realm from NS memory.
+         * Reserve the upper bit to ensure that highmem devices will fit.
+         */
+        rme_reserve_bit = 1;
+    }
+
+    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa) -
+                     rme_reserve_bit;
+
     /* we freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms, max_vm_pa_size);
 
-    requested_pa_size = 64 - clz64(vms->highest_gpa);
+    requested_pa_size = 64 - clz64(vms->highest_gpa) + rme_reserve_bit;
 
     /*
      * KVM requires the IPA size to be at least 32 bits.
@@ -4067,11 +4077,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
         requested_pa_size = 32;
     }
 
-    if (requested_pa_size > max_vm_pa_size) {
+    if (requested_pa_size > max_vm_pa_size + rme_reserve_bit) {
         error_report("-m and ,maxmem option values "
                      "require an IPA range (%d bits) larger than "
                      "the one supported by the host (%d bits)",
-                     requested_pa_size, max_vm_pa_size);
+                     requested_pa_size, max_vm_pa_size + rme_reserve_bit);
         return -1;
     }
     /*
-- 
2.43.0


