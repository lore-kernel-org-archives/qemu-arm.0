Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF3560A3801
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Nov 2026 12:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JqJVGKqi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUO3k-0000tV-NH; Fri, 20 Nov 2026 07:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xUO3j-0000sf-K9
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 07:49:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xUO3h-0004mM-Vr
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 07:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795178981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yB6UGk0PQtx1HyzaQH1q7NaL5PpeGBbOIWIpyS3oM/0=;
 b=JqJVGKqixYd8LxmCAByelghWxMfcoS6YHR/asy4DDP7xN6rXcYZVCzyZy1AkYPz9nRP9RA
 TZWiZp7cJBJi9vAd/srFV3vXomCY21Ao34m0MOihA9VPu/5lL6ZlakaHUruhxlbAdMniSL
 JUP1w7WUQb+rI+8H7yFVdfyAF9FGsls=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-qTAwOwZqOealY2O4-KRjIA-1; Fri, 20 Nov 2026 12:49:39 +0000
X-MC-Unique: qTAwOwZqOealY2O4-KRjIA-1
X-Mimecast-MFC-AGG-ID: qTAwOwZqOealY2O4-KRjIA_1795178979
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-53639e47be2so17822211cf.3
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2026 04:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795178979; x=1795783779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yB6UGk0PQtx1HyzaQH1q7NaL5PpeGBbOIWIpyS3oM/0=;
 b=DfHYBPJK/DCP/ytLlpIHSzdxOmF9H2zF6Mha25BLrLLm4/ajzwSw2q6U2dkEYSbEaj
 QbPeyhCrxyeuB1C3vZVzgaFkgUftBlgsVzc6fQRbuTsfNo7Y7mhZcMNoIP60rII1MAwR
 ZRk1aISlcg0ahjw/XbbKMaGq5XuRTDh2KhVd9xyjjjaFxSNg3VP8K+rRq7cq+XDUT8gb
 4Py26WEa+m17xkftQDpPc7zTd05PYJZhHJPUgz/X6RgyMaBO5npUkGC7tw9iqqGYhNd3
 RouFioTOmsolhyWo0m2ik/P6otjv1aReBF9kNRkfTuHknbYeL2W8vQB2zSOuBDuF8p2+
 S02A==
X-Forwarded-Encrypted: i=1;
 AL+hErHu98Ico0jyUcP0NWSVzNfr1jirYoELIHVW3cLtedpefHLMYFMOh9hROpyjrVjlXFAeJHvDzrM2fQ==@nongnu.org
X-Gm-Message-State: APuU4Z+lDbWgVPeeboytCcES3+8NqUVtZFNH+CmxCzl7a4g22Thh399h
 TzVAQ/fu07hcfMRzsVcVRoubj32CXr5zAbVph0fpJ0kmDOzNpXbEDDVHS3LI2rzyD7X4OwOTfv+
 XkSIq528P3EJp7KYdXw9y0efWpwrnzuOj7XbC7vr1krjbgO+LYX7r8A==
X-Gm-Gg: AYBFou1ElYMZ/Kt8UuhJmmFys0oCc6TGQWQMGrDc1FelHr4bypF5afH/0QhEqGVKYYa
 KeznBMr8jNoq7i9IhBQy4uEsyaRh3vVlmpbjjslF1QxQflGHk5D/tNYJkAk2+/SlFAKOUhG1g5O
 qE8h1pL8rqUv0V69SBlv9sk2mGO/B8BR42RQgK+1H3Yo5SkxTy9NDK6kVFz9/LCmK8o+PNaR8aJ
 khzXORrB4N+9CK/u5GZz1OgFIH674AcxLOe9PHqVSa6hMo6fxMlv8K0CGs3hJoJbfK6LOagiKVw
 f91PGePFJD9M7M+YiHMq3ggm4PMeIz5TGoZPCyLNoJvnzcyFohGgsWXzwp6k8DvwZbvZ465cWwr
 IT3fDrXQUMfEOx23hieOA4KpoV2N2FxOZZK8TT6WdzClm
X-Received: by 2002:a05:622a:c18:b0:536:780e:8f48 with SMTP id
 d75a77b69052e-55d76a5d56cmr47530141cf.30.1795178977413; 
 Fri, 20 Nov 2026 04:49:37 -0800 (PST)
X-Received: by 2002:a05:622a:c18:b0:536:780e:8f48 with SMTP id
 d75a77b69052e-55d76a5d56cmr47527281cf.30.1795178972205; 
 Fri, 20 Nov 2026 04:49:32 -0800 (PST)
Received: from localhost ([142.188.212.246]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d78807b5fsm21591291cf.6.2026.11.20.04.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 04:49:31 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 peterx@redhat.com, qemu-arm@nongnu.org
Subject: [PATCH for-12.0 4/6] arm/machine: Move all VMSTATE_VALIDATE() usages
 into post_load
Date: Fri, 20 Nov 2026 07:49:21 -0500
Message-ID: <20261120124923.1656220-5-peterx@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120124923.1656220-1-peterx@redhat.com>
References: <20261120124923.1656220-1-peterx@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OSFwOLwOAWywjC1OCb1wvIJvvmxE4AABUpdoFGe-Y2Q_1795178979
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To pave way removing VMSTATE_VALIDATE(), move all four such uses into a
post_load hook instead.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 target/arm/machine.c | 45 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index c3aef3f330..ec6daf1ab9 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -11,6 +11,7 @@
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "target/arm/gtimer.h"
+#include "qapi/error.h"
 
 static bool vfp_needed(void *opaque)
 {
@@ -421,14 +422,24 @@ static bool m_csselr_needed(void *opaque)
     return !arm_v7m_csselr_razwi(cpu);
 }
 
+static bool csselr_post_load(void *opaque, int version_id, Error **errp)
+{
+    if (!csselr_vmstate_validate(opaque, version_id)) {
+        error_setg(errp, "CSSELR is invalid");
+        return false;
+    }
+
+    return true;
+}
+
 static const VMStateDescription vmstate_m_csselr = {
     .name = "cpu/m/csselr",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = m_csselr_needed,
+    .post_load_errp = csselr_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32_ARRAY(env.v7m.csselr, ARMCPU, M_REG_NUM_BANKS),
-        VMSTATE_VALIDATE("CSSELR is valid", csselr_vmstate_validate),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -596,11 +607,22 @@ static bool pmsav7_rgnr_vmstate_validate(void *opaque, int version_id)
     return cpu->env.pmsav7.rnr[M_REG_NS] < cpu->pmsav7_dregion;
 }
 
+static bool pmsav7_rgnr_post_load(void *opaque, int version_id, Error **errp)
+{
+    if (!pmsav7_rgnr_vmstate_validate(opaque, version_id)) {
+        error_setg(errp, "rgnr is invalid");
+        return false;
+    }
+
+    return true;
+}
+
 static const VMStateDescription vmstate_pmsav7 = {
     .name = "cpu/pmsav7",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = pmsav7_needed,
+    .post_load_errp = pmsav7_rgnr_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_VARRAY_UINT32(env.pmsav7.drbar, ARMCPU, pmsav7_dregion, 0,
                               vmstate_info_uint32, uint32_t),
@@ -608,7 +630,6 @@ static const VMStateDescription vmstate_pmsav7 = {
                               vmstate_info_uint32, uint32_t),
         VMSTATE_VARRAY_UINT32(env.pmsav7.dracr, ARMCPU, pmsav7_dregion, 0,
                               vmstate_info_uint32, uint32_t),
-        VMSTATE_VALIDATE("rgnr is valid", pmsav7_rgnr_vmstate_validate),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -711,11 +732,27 @@ static bool m_security_needed(void *opaque)
     return arm_feature(env, ARM_FEATURE_M_SECURITY);
 }
 
+static bool m_security_post_load(void *opaque, int version_id, Error **errp)
+{
+    if (!s_rnr_vmstate_validate(opaque, version_id)) {
+        error_setg(errp, "secure MPU_RNR is invalid");
+        return false;
+    }
+
+    if (!sau_rnr_vmstate_validate(opaque, version_id)) {
+        error_setg(errp, "SAU_RNR is invalid");
+        return false;
+    }
+
+    return true;
+}
+
 static const VMStateDescription vmstate_m_security = {
     .name = "cpu/m-security",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = m_security_needed,
+    .post_load_errp = m_security_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32(env.v7m.secure, ARMCPU),
         VMSTATE_UINT32(env.v7m.other_ss_msp, ARMCPU),
@@ -732,7 +769,6 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_VARRAY_UINT32(env.pmsav8.rlar[M_REG_S], ARMCPU, pmsav7_dregion,
                               0, vmstate_info_uint32, uint32_t),
         VMSTATE_UINT32(env.pmsav7.rnr[M_REG_S], ARMCPU),
-        VMSTATE_VALIDATE("secure MPU_RNR is valid", s_rnr_vmstate_validate),
         VMSTATE_UINT32(env.v7m.mpu_ctrl[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.ccr[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.mmfar[M_REG_S], ARMCPU),
@@ -744,7 +780,6 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_VARRAY_UINT32(env.sau.rlar, ARMCPU, sau_sregion, 0,
                               vmstate_info_uint32, uint32_t),
         VMSTATE_UINT32(env.sau.rnr, ARMCPU),
-        VMSTATE_VALIDATE("SAU_RNR is valid", sau_rnr_vmstate_validate),
         VMSTATE_UINT32(env.sau.ctrl, ARMCPU),
         VMSTATE_UINT32(env.v7m.scr[M_REG_S], ARMCPU),
         /* AIRCR is not secure-only, but our implementation is R/O if the
@@ -1405,7 +1440,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_m,
         &vmstate_thumb2ee,
         /* pmsav7_rnr must come before pmsav7 so that we have the
-         * region number before we test it in the VMSTATE_VALIDATE
+         * region number before we test it in the post_load_errp()
          * in vmstate_pmsav7.
          */
         &vmstate_pmsav7_rnr,
-- 
2.56.0


