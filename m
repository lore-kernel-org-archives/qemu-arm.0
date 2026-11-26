Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A604606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nrx0DTNf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWii1-0008Ga-OB; Thu, 26 Nov 2026 18:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWihx-0008Ar-CW
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:16:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1xWihv-00064N-JH
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795735011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pemxv6+p2jbO1Ze6odVJgmKdnHXIU402L1Ae0wQ+2iw=;
 b=Nrx0DTNfjFzn22+QU8syg/cwVRm2SH4rtIoSlO+ArvojLTLeCR9swj9NNgQLklkh6QZArE
 fmQ1LVKFMkNOD6YlFrLnNShZS2Bs4/VVO7DmDudNasGRDBHSkUgT5fcTyB0lbdJSRbeSKd
 /bXCnpLMFMrFARDbcS4bkOK5UblpWtw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-DTpZza7BPJSTd5ceM4mfsw-1; Thu, 26 Nov 2026 23:16:49 +0000
X-MC-Unique: DTpZza7BPJSTd5ceM4mfsw-1
X-Mimecast-MFC-AGG-ID: DTpZza7BPJSTd5ceM4mfsw_1795735009
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-921246186bfso142408976d6.0
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795735009; x=1796339809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Pemxv6+p2jbO1Ze6odVJgmKdnHXIU402L1Ae0wQ+2iw=;
 b=KAKiz83vOsLW1lK2ugYLxXnKKPUr6dg1Dz/qs42ETLC8YSyvL1fTGzdzWWiRgG3L8l
 SMbea0/1eVflgEGlOienDriQyW5GZb/IyjBda5asiYkLr0QYGCfMmUbgmzRmcYO5kRXJ
 RaOO5N4n6PyveOn/2KZW9msan0pGtMIgSRExo8IarWTX2UKEUxn5JUHeg1c1ocy0V5PT
 J7cqhzPNy5aHM3AAssdV2VUjKrFhbRCq3DKWOly/B8bqT+vQhE+u/W0rEfDnaQduzRZO
 Ych0pWyLfZMYyJFZ/WLOOgy1HWyfHblinADRiQVdH2ZZIKwqImEtKK8qfy5r6iibEj+3
 PUOg==
X-Forwarded-Encrypted: i=1;
 AL+hErFrTePhVTqtXWxqDnfs0qkSGuSv3y0e8qD9L7ZIFk8jMaczwoGcCD5d7up0QOvXpu8GZv+dhIk6eQ==@nongnu.org
X-Gm-Message-State: APuU4Z+cgq6Cdn8Ig9QIOuIJfBtcm+s/1/jfpfREqE4jDD/DJpTyUjkH
 laMUp0kirHQcwVNmzCjhpcmauyvig9U0Xr9F6JG6yYeVippfgpfi1CbcbDYenHZ22IDXh3nsXN5
 1/pzXk0t3g8TTjwVr03w1I+YGZKXbP0yNYde3KBQZkOJc51juDgKHkA2t0Z4f6A==
X-Gm-Gg: AZFdTZfRZbxummgbmd4rKBTRN3MdPKnyxIZ+IwSuvBN+ZBLaf3RbWtlx9e/ULFeqxos
 57jMW45lqByeEZd5mtYvtrzoYYsXoXZE4M2XWjbcK2aIQtfeJZwlo8kophkvgtxQtxpxWdWGQ4A
 lAZ6LZSl5KHBOfefqbcZpfbnsXYM+FwSTZF3J22VjrXCAOv8T9CnsOxxMERiEANTF0aJqDTFMLs
 wEN/P2NuUDBI3psdKBQc5yf8TOAr9yxUbpSf8tHAy2VxIUi4MZr4bkDWdJ2BTGB7DLJXSUxJ6WM
 wiU6mqYsEuhehSEy2h5l21glQB/qxXxu9Fs+a/hapSXNjaW5o9o0mwCXuLDsrNpXlV0VH3may2F
 TXoofjQLzdC2PjE0N5+gjZuoZ7i9cMMZDPmd45Pl+M0p1
X-Received: by 2002:a05:620a:2417:10b0:949:7bf4:3b47 with SMTP id
 af79cd13be357-949bbb8d5b2mr3048262185a.27.1795735008597; 
 Thu, 26 Nov 2026 15:16:48 -0800 (PST)
X-Received: by 2002:a05:620a:2417:10b0:949:7bf4:3b47 with SMTP id
 af79cd13be357-949bbb8d5b2mr3048257685a.27.1795735007991; 
 Thu, 26 Nov 2026 15:16:47 -0800 (PST)
Received: from localhost ([142.188.212.246]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb3c2abesm1675207385a.26.2026.11.26.15.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 15:16:47 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juraj Marcin <jmarcin@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, peterx@redhat.com,
 Fabiano Rosas <farosas@suse.de>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org
Subject: [PATCH for-12.0 v2 8/9] arm/machine: Move all VMSTATE_VALIDATE()
 usages into post_load
Date: Thu, 26 Nov 2026 18:16:30 -0500
Message-ID: <20261126231631.3392756-9-peterx@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126231631.3392756-1-peterx@redhat.com>
References: <20261126231631.3392756-1-peterx@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zvfBT_KJvErHTPzZYo6V4qlLfCzDAdp7jGvrFWni4lk_1795735009
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To pave way removing VMSTATE_VALIDATE(), move all four such uses into a
post_load hook instead.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 target/arm/machine.c | 90 ++++++++++++++++++--------------------------
 1 file changed, 37 insertions(+), 53 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index e86fa85a9b..b401593496 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -407,14 +407,6 @@ static const VMStateDescription vmstate_m_faultmask_primask = {
  * just non-secure, we transfer both banks here rather than putting
  * the secure banked version in the m-security subsection.
  */
-static bool csselr_vmstate_validate(void *opaque, int version_id)
-{
-    ARMCPU *cpu = opaque;
-
-    return cpu->env.v7m.csselr[M_REG_NS] <= R_V7M_CSSELR_INDEX_MASK
-        && cpu->env.v7m.csselr[M_REG_S] <= R_V7M_CSSELR_INDEX_MASK;
-}
-
 static bool m_csselr_needed(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -429,7 +421,6 @@ static const VMStateDescription vmstate_m_csselr = {
     .needed = m_csselr_needed,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32_ARRAY(env.v7m.csselr, ARMCPU, M_REG_NUM_BANKS),
-        VMSTATE_VALIDATE("CSSELR is valid", csselr_vmstate_validate),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -590,18 +581,6 @@ static bool pmsav7_needed(void *opaque)
            !arm_feature(env, ARM_FEATURE_V8);
 }
 
-static bool pmsav7_rgnr_vmstate_validate(void *opaque, int version_id)
-{
-    ARMCPU *cpu = opaque;
-
-    /*
-     * Check MPU_RNR in-bounds. If no MPU, we still migrate this field
-     * but number of regions == 0 and MPU_RNR is RAZ/WI so also 0
-     */
-    return cpu->env.pmsav7.rnr[M_REG_NS] < cpu->pmsav7_dregion ||
-        (cpu->pmsav7_dregion == 0 && cpu->env.pmsav7.rnr[M_REG_NS] == 0);
-}
-
 static const VMStateDescription vmstate_pmsav7 = {
     .name = "cpu/pmsav7",
     .version_id = 1,
@@ -614,7 +593,6 @@ static const VMStateDescription vmstate_pmsav7 = {
                               vmstate_info_uint32, uint32_t),
         VMSTATE_VARRAY_UINT32(env.pmsav7.dracr, ARMCPU, pmsav7_dregion, 0,
                               vmstate_info_uint32, uint32_t),
-        VMSTATE_VALIDATE("rgnr is valid", pmsav7_rgnr_vmstate_validate),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -695,31 +673,6 @@ static const VMStateDescription vmstate_pmsav8 = {
     }
 };
 
-static bool s_rnr_vmstate_validate(void *opaque, int version_id)
-{
-    ARMCPU *cpu = opaque;
-
-    /*
-     * Check MPU_RNR in-bounds. If no MPU, we still migrate this field
-     * but number of regions == 0 and MPU_RNR is RAZ/WI so also 0
-     */
-    return cpu->env.pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion ||
-        (cpu->pmsav7_dregion == 0 && cpu->env.pmsav7.rnr[M_REG_S] == 0);
-}
-
-static bool sau_rnr_vmstate_validate(void *opaque, int version_id)
-{
-    ARMCPU *cpu = opaque;
-
-    /*
-     * Check SAU_RNR in-bounds. If no SAU regions are implemented,
-     * we still migrate this field, but number of regions == 0 and
-     * SAU_RNR is RAZ/WI so also 0
-     */
-    return cpu->env.sau.rnr < cpu->sau_sregion ||
-        (cpu->sau_sregion == 0 && cpu->env.sau.rnr == 0);
-}
-
 static bool m_security_needed(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -749,7 +702,6 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_VARRAY_UINT32(env.pmsav8.rlar[M_REG_S], ARMCPU, pmsav7_dregion,
                               0, vmstate_info_uint32, uint32_t),
         VMSTATE_UINT32(env.pmsav7.rnr[M_REG_S], ARMCPU),
-        VMSTATE_VALIDATE("secure MPU_RNR is valid", s_rnr_vmstate_validate),
         VMSTATE_UINT32(env.v7m.mpu_ctrl[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.ccr[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.mmfar[M_REG_S], ARMCPU),
@@ -761,7 +713,6 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_VARRAY_UINT32(env.sau.rlar, ARMCPU, sau_sregion, 0,
                               vmstate_info_uint32, uint32_t),
         VMSTATE_UINT32(env.sau.rnr, ARMCPU),
-        VMSTATE_VALIDATE("SAU_RNR is valid", sau_rnr_vmstate_validate),
         VMSTATE_UINT32(env.sau.ctrl, ARMCPU),
         VMSTATE_UINT32(env.v7m.scr[M_REG_S], ARMCPU),
         /* AIRCR is not secure-only, but our implementation is R/O if the
@@ -1177,11 +1128,48 @@ static bool cpu_post_load(void *opaque, int version_id, Error **errp)
     ARMCPU *cpu = opaque;
     CPUARMState *env = &cpu->env;
     bool ignore_s_regs;
+    bool valid;
     int i, v;
 
     trace_cpu_post_load(cpu->cpreg_vmstate_array_len,
                         cpu->cpreg_array_len);
 
+    if (env->v7m.csselr[M_REG_NS] > R_V7M_CSSELR_INDEX_MASK ||
+        env->v7m.csselr[M_REG_S] > R_V7M_CSSELR_INDEX_MASK) {
+        error_setg(errp, "CSSELR is invalid");
+        return false;
+    }
+
+    /*
+     * Check MPU_RNR in-bounds. If no MPU, we still migrate these fields
+     * but number of regions == 0 and MPU_RNR is RAZ/WI so also 0
+     */
+    valid = env->pmsav7.rnr[M_REG_NS] < cpu->pmsav7_dregion ||
+        (cpu->pmsav7_dregion == 0 && env->pmsav7.rnr[M_REG_NS] == 0);
+    if (!valid) {
+        error_setg(errp, "rgnr is invalid");
+        return false;
+    }
+
+    valid = env->pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion ||
+        (cpu->pmsav7_dregion == 0 && env->pmsav7.rnr[M_REG_S] == 0);
+    if (!valid) {
+        error_setg(errp, "secure MPU_RNR is invalid");
+        return false;
+    }
+
+    /*
+     * Check SAU_RNR in-bounds. If no SAU regions are implemented,
+     * we still migrate this field, but number of regions == 0 and
+     * SAU_RNR is RAZ/WI so also 0
+     */
+    valid = env->sau.rnr < cpu->sau_sregion ||
+        (cpu->sau_sregion == 0 && env->sau.rnr == 0);
+    if (!valid) {
+        error_setg(errp, "SAU_RNR is invalid");
+        return false;
+    }
+
     /*
      * Handle migration compatibility from old QEMU which didn't
      * send the irq-line-state subsection. A QEMU without it did not
@@ -1426,10 +1414,6 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_vfp,
         &vmstate_m,
         &vmstate_thumb2ee,
-        /* pmsav7_rnr must come before pmsav7 so that we have the
-         * region number before we test it in the VMSTATE_VALIDATE
-         * in vmstate_pmsav7.
-         */
         &vmstate_pmsav7_rnr,
         &vmstate_pmsav7,
         &vmstate_pmsav8,
-- 
2.56.0


