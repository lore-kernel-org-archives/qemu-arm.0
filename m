Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCEEC61DD3
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:41:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DEu-0001Xf-6D; Thu, 03 Sep 2026 15:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEs-0001WZ-Rm
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:46 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEr-0004JZ-6n
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:46 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-38dfe7eb825so177474a91.0
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464204; x=1789069004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y7O2QFPzNWx332l2m0iFWMqO57jF7lDWROu5Spv39Uc=;
 b=pgM3rZlGE+fILtvnRoyn/6Zzu3qkoTZUFPiHYVDIBWguTn8m7vU5Hs/1LxXQSOm4+U
 bLZc+bDDptEYn6hM6zVaV7npqKeHpdTQYtizZin5eSzWyzLFiMp4mnoqR7EuoKmoaAK5
 lnaXbShKRXqgbERIBHCj8LrWSF3+joKOfbgQ0c804f3fdSIg+kbXXoA6d4c44SC+sPLl
 P6LegvVwDbf+ABwmq5JU99wg5xQvBmsDkFt4ZX1s0JpHRPYTXk3vE56C+u+ZPX6Gmwoq
 UzzSoFNDfB9BbnZ3FrQoMqCpooGmBi0HPf9zJBsoS4l/WtBv+8orkrBz/guMloSXT274
 AXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464204; x=1789069004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y7O2QFPzNWx332l2m0iFWMqO57jF7lDWROu5Spv39Uc=;
 b=BaCaJsfplxCx+RkEpqpdiDozcpVKenax0dq+JGtihMWi2z7CVTntYFlgLoBf7HRvaA
 1D4ynrkYBvqxJH6c1SZus9a6l8ut54OYx6hCFPXFDbQzbYts6ODBCYWbBkYRAoxkeltt
 /FpjV+c7p6IDfsTTxwlvQTEcdyxsmAtIAHZxcUxAnuxxoqjje/4ja22ZBlONupvBBojo
 WyO2aJmGrFl7MXj1oXEU0W/hEI/smqIkmBnei10ApE2dOIm2rwx4HgEs4Subj+VJC/bv
 swEZoKNkVaM2YVHPgXlIoNpLFLmjENmoi5ZRqwxz2jqxo+1ZFkk7BOKoZr1PiknvmFgU
 gUHA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx0E0xrMlCKVhisc5zgOqm59xFScJLxt+IJLeYC/TwAzAt/AKvtB5VRkvflxkgkch6DhqmkG/znbA==@nongnu.org
X-Gm-Message-State: AFuF++mQerg6Du7/GTUiTyw+2xA2cfdJpYHs8jfO3QPJs0o0/6iUZ4Za
 e6EWcH2rHHbLZbeBZw9m+ugtYLhWVhsv43MU3ReJHMSX6MOqEzF6ED5lYDlPRJgA3HHNpDViQSX
 yGdGP
X-Gm-Gg: AYBFou0GmZlHubIfEPt+AxpWWz8MnmSbZ/NxtpFV31ks3ZH/g1UmYvb9m9d/d9QEEb2
 ec7R3j/Fi590/7bRnSm0elkeDxZBG9lH43k5oQn18De5nJxCTjpY42O+1hq3oYVhg2hwdt95RxH
 3uVQQ/Kmq6sZ9A5WAtnqmYJND9CXQ3gBAItOBWFKoNJekEF1RMfpNjkqRvD7+2vVOriJ7Zx4z8E
 0m7lE0rIk/9YX7lISJCKLawZlKWAx3IXPb+kqNRCbO4ZM/5nHcNf7bXVMFcrLK0fE7NtfjOZOeQ
 6IHkg4vd8ITdpr5XXqQmO/WvqlHvq0ymxlYIDjhwE/yuCoCgZTjFFd934lriJ2/REYKhEartzYF
 yPhTJEy1kYW6orchXQk/2fkRxNII7taVv2gyqI/yKOryo+KhMstk7ecmPOVbbQ7yx3MXCAMqFRK
 Zl2utyyDsgDIC0JNdOkDx9r2YXDS6b37Bc7Y4suyOEOOJeRLnCd9pxlEsuxXBTbiP43MBGDCuD2
 7p47mWiXtFuQEQ=
X-Received: by 2002:a17:90b:274c:b0:398:9be9:ab92 with SMTP id
 98e67ed59e1d1-39b2629b27fmr1266138a91.23.1788464203921; 
 Thu, 03 Sep 2026 12:36:43 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:43 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 17/24] hw/arm/virt: Reserve one bit of guest physical address
 for RME
Date: Thu,  3 Sep 2026 13:36:04 -0600
Message-ID: <20260903193611.1058589-18-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
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

When RME is enabled, the upper GPA bit is used to distinguish protected
from unprotected addresses. Reserve it when setting up the guest memory
map.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/virt.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 61751aa31e0d..cf3a9320dc3a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -4054,17 +4054,27 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
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
@@ -4073,11 +4083,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
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


