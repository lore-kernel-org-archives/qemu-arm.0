Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851C4CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:26:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtUh-0006Mn-6r; Fri, 15 May 2026 10:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtUA-0005l2-At
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU7-0000wf-80
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-441209fb77eso611502f8f.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855150; x=1779459950; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3JaWcGkaE9fLWfSI8DU3cpDjO0IByAUy1JTs+IjAeEY=;
 b=EkrD13o4pmOBeroyHY964/H2db51/9CfMj1HhdMjSzUCP4dNLlmzUaIgcN8FRWix8n
 Qhknoy6jQhvE//5oYr/a2uSn/XZV3WN6JPXPS+BF27iyzVdUcnHPJeiv501OyTjtkOdc
 XTqcloNKr9Iqz5sfD6RUKyerNqnhrtmO8x75rcpSZr5eSGj1qIU0FygjVTU4wWYnlcdH
 eDXCOZrEuPSF9BVmt7cWVEyPFJcXvdv1Dmlh41rhjYmrvwxCAdsPqnK+vRxjlESOAWIh
 oF4uSoUOiT5JOzllxmJtAm/nZG8YnHLukWjqGoM/rWcXGgKWuwqKGOcVNSgTs9iJ5qVi
 8B6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855150; x=1779459950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3JaWcGkaE9fLWfSI8DU3cpDjO0IByAUy1JTs+IjAeEY=;
 b=dbxL9kmxTTCLLSC8i6I+umGJnJZjb7od/4It/XatzQYP6pXAbCCPcmIpnYwXV56PxS
 GJK9hH+RznTECXMRdbqW4BcQGo14ryGqZy1PbKPMWNO/f1bf3I0Uaiq269y2Asxr/wUg
 rfyRSsHYhvwNop01LyWV5OF9Nk05JKJUATGvhOLpB9D8ZeYaBY/zYo1AjljsHFCLIbSR
 hI78SVxPT+ftfsy1dXXPkhWA7hQatXMgEzHEG8xKUZGJQdBjbNpELKuuhVaQtibSaR3A
 EX2LiWJZZ4bXQBu/5QuO4N5wVVSLLqBghSjYztV8sTXk36EFhwNJG6HWj/MeQoFl2fEt
 usvw==
X-Gm-Message-State: AOJu0Yw3XVQBHlXJI3wy6ckMTF2E9iLmgDZfkRy+ZFLSkvWhl/Pz3jMv
 yaGXIyNUcsglSpHfv59qkPnzy5b9xCRW0Nf6MFgQ9MTjPNikyu3bsDoTtYauEFxJ9dI1ocMv1GS
 XjChE
X-Gm-Gg: Acq92OH+r/WJoYnkfbvDtYNb5pmhrynR4Iuel0+0F3Mae6Ux78NCeBqx2LSWeiHs3Zj
 +L3bp0N/2WjSZ5YBV59yk7T2VO6dx0M+F0OvayEKzGe6+WoGioJi7dXWWqQbucPOpcG9YdDSApV
 3136eoXXOfiqhMZAJXV1tC4fEM4q7IetPtBHUsSw9wwis88ronLvUmfkanyAGNrqXM+ef2Ha2H0
 1I/PL+e8PL9GjNzty3eP2iMxv9Gb87A1ZRQuKLXrNPbypAvLQ3f1yOUbujwP2hfSTzmUPpWKnrN
 ki7Kj9A2EvJi96VcGK6M5OJHlcGkDJpc1ZD328ZVkjaXXzscK0GOUFXhqqgT6g7NM0bo2xd4R1h
 y2niE78d3MlwEUf2aoBK2Q9zuFa2j6iX1dYZY4bJaHZYTnOGDtKplmB11V4UpZ52lIyfvTrm5Ra
 01cKvU8kjHUn4DABtGA5R8OrLm+Sjvcoiz+2kJnjVft9UHTBDPJNDb4+3kQOqf3SKDRt+CMdzSy
 lu092U98RJ3FRI3l6xvlZlX10alcuU=
X-Received: by 2002:a05:6000:230b:b0:43f:e978:148f with SMTP id
 ffacd0b85a97d-45d941b0bcamr12909063f8f.25.1778855149681; 
 Fri, 15 May 2026 07:25:49 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13560603f8f.36.2026.05.15.07.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:25:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 06/14] target/arm/ptw: Flip sense of get_phys_addr_pmsav7
 return value
Date: Fri, 15 May 2026 15:25:33 +0100
Message-ID: <20260515142541.571911-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515142541.571911-1-peter.maydell@linaro.org>
References: <20260515142541.571911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
 target/arm/ptw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c9563557f9..12e700fe07 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2732,7 +2732,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
             if (!pmsav7_use_background_region(cpu, mmu_idx, secure, is_user)) {
                 /* background fault */
                 fi->type = ARMFault_Background;
-                return true;
+                return false;
             }
             get_phys_addr_pmsav7_default(env, mmu_idx, address,
                                          &result->f.prot);
@@ -2806,7 +2806,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
 
     fi->type = ARMFault_Permission;
     fi->level = 1;
-    return (ptw->in_prot_check & ~result->f.prot) != 0;
+    return (ptw->in_prot_check & ~result->f.prot) == 0;
 }
 
 static uint32_t *regime_rbar(CPUARMState *env, ARMMMUIdx mmu_idx,
@@ -3759,7 +3759,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                        result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
-            ret = get_phys_addr_pmsav7(env, ptw, address, access_type,
+            ret = !get_phys_addr_pmsav7(env, ptw, address, access_type,
                                        result, fi);
         } else {
             /* Pre-v7 MPU */
-- 
2.43.0


