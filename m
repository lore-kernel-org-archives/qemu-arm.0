Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65491CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:26:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtUk-0006dP-G5; Fri, 15 May 2026 10:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtUH-0005th-KT
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:26:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtUD-0000zp-1Q
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so660402f8f.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855154; x=1779459954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lnHCoKfIHOU4NHMQe3Kj9Fosoqb2a9TyPNEWvgX/PmE=;
 b=iz/65VmB3ajRJmG1MFGIj3mGjENRTiG6B/9SlR458Wm6k8cLaJds/xtTDmbwuvCq6K
 AiTyHJCl0bhT/koNdTrIYbHhxFyfGJNtfzBFLGMk6JpkILZ4FgNqAqleH1hRZr8U0jkW
 rrX8Ahge8AkbcjAOT+pynakOacm3giROnN0xYeToqglQI6sXvOGYstuSlCvShqsDNRXf
 FBx4/Gmn/4eCW9TRzQ0pM/8t3hBXcXdYlqj3Ce5edxqyp8kWLDFJwyB0NBgw3goS3yJ7
 NO9OI+72uECGFpItTgg292aX0v1irDUT2PGZ1kMpfbUlPQYXc8cXs1d9kZfILKD7dkhP
 hLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855154; x=1779459954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lnHCoKfIHOU4NHMQe3Kj9Fosoqb2a9TyPNEWvgX/PmE=;
 b=bk4HFY/wIaD34IdmbvgXcILMNF2nPsn1Y2Al+TLyCQ0iy8QG1Zzwa1T8YXv2iVbDkX
 V24SQFx/QoLoNLBGBGlLAbq0tMZOtMlYo05sQyo8yVH7BsJT+fFx8Cx4bZa7Ualkfw3D
 lFHRO73efZ17VvXRwBxS016BMofZNcSG4Emd96J3ueOKBuHsy/MHPs2MOo38w+nZ7r2v
 a8F2VbDpL0EzH81yre/tb+31qwl3NyqPcQtrfq55w4zF+qUwKCIbyuAoZ8R/Es63mW0p
 WfdYMmea1JBg1MyT9PZ7TTV3gDOxDDDm7HegdQgx+Hw0klZ4S2MLdpAaKGjZQyk9Vfru
 RBBA==
X-Gm-Message-State: AOJu0YwH5UQ4p6R7NEGkPAItuxrXabpccPyHSJzE5e5a3JDKJBc76FKU
 zhn1EVt/3eQn9bGkQX5OYzgVCfen1kEp7aBvtfNpDAfqCjDL0CpOiHgQ4t3ri30tMPjLu4y99ky
 I0f3F
X-Gm-Gg: Acq92OHA9FMHYXdnXwNi1VL0oyRxXtVZqucTA2W91kwJPn+f0XLrZ6uR2UYANkbYNbe
 0EiP3MgyU+OBaHoRyEV6zCWSCXNZuY7F3NdZcZIFJI6k9B+Tscjh2iDc/eAKaOBsskx8jH8VR94
 rvrVFAmNEazSCiRJiYA6Mz8AIuQvRfnLidvh+Ze2lwvFUyJjSJS6zzL+D7gWARU7o+lQgGECSTv
 PuodQ6FVVrQ3MhfMyqucTH9A6jpaudlG7d6MoAjw+56WaQBQfnUEQMmpB7s2F5o0e2H08MDqqlj
 qCpqHSVB/Wi1OiwTquWMPqB9A/cVjgr99mgs//Mp/AuPh8IBFVb624RwU38zbhrsOJNIWVo/WFw
 QA39MqAn9PMXm0xrSoCumkEWuiAkaiN5fW4+BWuLKLChMhN7Gu4OqI/FLUvaNfkBGQzblnWZmjZ
 HFlbKDcNyt1Rlu5X7uZICJNghmAZUQbxikPaBSkZfdmel9YUiDOeMjwGHR/6eRWZdYf0XhwLyDL
 TrjSPVcJt/td8vBC4MztpEx6d3C1Es=
X-Received: by 2002:a05:6000:4b07:b0:44f:69f4:39b5 with SMTP id
 ffacd0b85a97d-45d9502e84dmr13423623f8f.29.1778855153946; 
 Fri, 15 May 2026 07:25:53 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13560603f8f.36.2026.05.15.07.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:25:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 11/14] target/arm/ptw: Flip sense of get_phys_addr_gpc
 return value
Date: Fri, 15 May 2026 15:25:38 +0100
Message-ID: <20260515142541.571911-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515142541.571911-1-peter.maydell@linaro.org>
References: <20260515142541.571911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9ecb6238a7..cb41146b9c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -667,7 +667,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         };
         GetPhysAddrResult s2 = { };
 
-        if (get_phys_addr_gpc(env, &s2ptw, addr, MMU_DATA_LOAD, 0, &s2, fi)) {
+        if (!get_phys_addr_gpc(env, &s2ptw, addr, MMU_DATA_LOAD, 0, &s2, fi)) {
             goto fail;
         }
 
@@ -3806,7 +3806,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
 {
     if (!get_phys_addr_nogpc(env, ptw, address, access_type,
                             memop, result, fi)) {
-        return true;
+        return false;
     }
 
     if (FIELD_EX64(env->cp15.gpccr_el3, GPCCR, GPC)) {
@@ -3826,11 +3826,11 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                                           result->f.attrs.space, ptw->in_space,
                                           fi)) {
             fi->type = ARMFault_GPCFOnOutput;
-            return true;
+            return false;
         }
     }
 
-    return false;
+    return true;
 }
 
 bool get_phys_addr_for_at(CPUARMState *env, vaddr address,
@@ -3939,7 +3939,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
         .in_prot_check = 1 << access_type,
     };
 
-    return get_phys_addr_gpc(env, &ptw, address, access_type,
+    return !get_phys_addr_gpc(env, &ptw, address, access_type,
                              memop, result, fi);
 }
 
@@ -3956,15 +3956,15 @@ static bool arm_cpu_get_phys_addr(CPUARMState *env, vaddr addr,
     };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    bool fault = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
+    bool ok = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
 
-    if (!fault) {
+    if (ok) {
         /* translation succeeded */
         result->physaddr = res.f.phys_addr;
         result->attrs = res.f.attrs;
         result->lg_page_size = res.f.lg_page_size;
     }
-    return fault;
+    return !ok;
 }
 
 bool arm_cpu_translate_for_debug(CPUState *cs, vaddr addr,
-- 
2.43.0


