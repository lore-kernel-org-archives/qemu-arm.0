Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D5606A31C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lX78nxXZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXuD-0005Rs-60; Mon, 09 Nov 2026 17:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtv-0005Ga-Uv
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:48 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtu-0003w0-Bk
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:43 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8a9f9473029so1101640b3a.2
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263501; x=1794868301; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Gfp51PLlf67b5A5in6MUJzCYhyc5cgtldNZyxdvH6Ec=;
 b=lX78nxXZBuqeHtdPrhcPx8jLCUoBrzN2pByRvFH+P0aLhdSKS+kmXBYLfvRjypuD5U
 fPefQFFhC7QASJD9YvBntrtKpGVMtxsgsQF2ybpSR6Urm3zV7QC7EoFRPOF41t+7nrgS
 I0USPuBoGdpCAUByWRsKfNl8IjNXz7USR0Hl6p8DdKm0BAagI0HGFmFK537SXAkSTRFF
 LjOdOEVES/V9IixMERrn5nVrMedJn5VRpMn24elRH/yMjNIx47q6UhlGfGvBNBhaAX99
 WfBx/Q+pzvMuZ7RXUjITv+kp4HiXRfgklMdfWZn0eXveFy9Rrybd3lPgDe22d0RxUszN
 ciFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263501; x=1794868301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Gfp51PLlf67b5A5in6MUJzCYhyc5cgtldNZyxdvH6Ec=;
 b=mF55091fcf9ow3PZeM4859nnW/3k53T1yXcky/9kT8IGtM+VdwX8wrCllRErYkEcUW
 WzFDeZkEUk9p4PSa5HMqCsbFzTjDYwkkCF9A8jHdv1omEYJSuQA+bIYfJroM8XR2+GM1
 H3IlVD7DjQ43oByC7vf6NROPeklAgwDQGnBjkv9lRhUuQm0NoBmslqV3OtDwg4INNP/j
 Dw3EPAQButnCfSODNymOTqjdJsnzhEh3c2c0Pt1HPdxWfncKT/o6rjMQLzgpa3ycalKV
 p2pNf72VGmosENFLLiTMtS/TkRtUAtI//+r0/FPMa41hQUVLSd6yzoo4GGnfH2OGWVpL
 STgw==
X-Forwarded-Encrypted: i=1;
 AL+hErGODxWpRakw6ZlowOVE/xsjHz/cTBWvAQsYTuMWACldA2mYV/qbBdTGLAMt6A/bobUSTKGlNzBCNw==@nongnu.org
X-Gm-Message-State: APuU4Z+8It49R+tb9CZJy7qtzmZelLkovoky4Nts5NL7DhfP8BXb9OJk
 AJ/BUztZrpt0jI4UDnzPFwuhY8U19z9urW3XQ4SpXbVWAXrqP/R1krSuL77cjjE3lPY=
X-Gm-Gg: AYBFou1gY/GyYQqLFNhX8Pv1OmkwyhiR+/pdi0LuP8T4+Bg52RH7oRG6LZ0t1J18Uyz
 xQuQPXzR/wdPFRvW0S+IWBbJKZRapOweusaCPsJC4meH0okn+hbTztj681g8SOR6/6bwjDhSd/e
 shb+ockZC5V96E/TX+MzzFtJINbPXsXE+gFbD196N+Y4hRsADNVrtnrGObwqX/ijEo1EmLXiGb2
 /HBeFREhkgOD1ZqDzn05u3iyzx2bw6moFf2+HhTdIAq8usMHcz9W2mjhxMiyIjQIQqnAtJh54hR
 ntC+HIXsbK8fnjqh6kYlj5nyRBCGzPvDJAk49RtJlsCdNwzf6+OzC0wuufEtdPAoje2GzjGPdZ2
 JJoVGycwjCb+JpObuuIMV4OKR5McjM3fFLMd/OM5X6gln/+vqaSjtzzJd0EDHPvgluBrtum4Zsx
 4jn3XNg+eu2j0OjpA2i9lCuyM1eOO2ZWt2vNdJMIepPmcbKrQG2LGsXQ6KQliWEwOFV0ZOhQLdB
 PM7KksNLON3TTiTwXeOhdsMUCjbWy8MS+AyiTfOsD7RXS5w6X9vqMAgAHdT9yRT+skSPVVINgte
 t1wN+7sjq20iCN3ceIOV/uFjai4eo3Bb52Vg9kaGzyncMxUFqW3Pww==
X-Received: by 2002:a05:6a00:951c:b0:8b5:f313:9f40 with SMTP id
 d2e1a72fcca58-8ba87e0a5cfmr993721b3a.49.1794263500868; 
 Mon, 09 Nov 2026 14:31:40 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:40 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 15/23] hw/arm/virt: Embed Realm VM type with IPA address
 space
Date: Mon,  9 Nov 2026 16:31:02 -0600
Message-ID: <20261109223110.1619504-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Set the Ream VM bit in the IPA address space size when needed.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 hw/arm/virt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0ed6df4b9b9e..349257f53f2d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -95,6 +95,8 @@
 #include "qemu/guest-random.h"
 #include "hw/watchdog/sbsa_gwdt.h"
 
+#include <linux/kvm.h>
+
 static GlobalProperty arm_virt_compat_defaults[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
 };
@@ -4058,6 +4060,7 @@ virt_machine_get_hotplug_handler(MachineState *machine, DeviceState *dev)
 static int virt_kvm_type(MachineState *ms, const char *type_str)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
+    int vm_type = ms->cgs ? KVM_VM_TYPE_ARM_REALM : KVM_VM_TYPE_ARM_NORMAL;
     int max_vm_pa_size, requested_pa_size;
     bool fixed_ipa;
 
@@ -4087,7 +4090,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
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
2.53.0


