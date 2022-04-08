Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp397399lfq;
        Fri, 8 Apr 2022 07:35:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTd2ov274J/13iVuW3OUG0eSdvYC1s5HCD4s7ptxGtcvwIwtc3XZgs1EmnYf0BYUUEcDhl
X-Received: by 2002:a0d:dd09:0:b0:2eb:696f:a0e2 with SMTP id g9-20020a0ddd09000000b002eb696fa0e2mr16570842ywe.416.1649428521434;
        Fri, 08 Apr 2022 07:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428521; cv=none;
        d=google.com; s=arc-20160816;
        b=K/RDcD92UoSivZCMk5aMcVPdmSgmMEOhk+JzqmPTC75C13vkCuUma3KxGQPihRyr0F
         pFH8Qa+0yCJ/bYtdlxoLypam9Q4lFBg5xoaSUinEa5Kse6T/cqNhtq5zQX3KNAhXxvZr
         5oezL3zqHdt13lqHgmtLGq5d1Dr9rwSXXafAxWFrsXJ+6465UJi6KO5OmP5fQdl9M2kS
         yTjCLZUIU+kIxEbLGRsrDDUhuCoRVeDts5zXSggx1af3/qoiQTxENfgbhW5Pne+OTTvh
         eIitfwH+ft2w8X3aUo1NvZoiozxaEdTx56r2su/0BfVOLGlHxgY7EX6ha+wEunaQa4Rm
         xHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=c2w8hD7BvI/mrPbeJHM/ddfGPpF2hd8m8r56TLjlSxo=;
        b=gbgSga8a4xN2EdIHjjL4o9agpUu+ggDMBe+AZVhKNPIknWRnCGA8DTgx+/g5JgoXGT
         M6bXxGXZdEGM+Hlzkh1/OtyD2nRnonlIugR/Xje8HjZJb5RNdQ4rQesL7hxrvXydAFDa
         jZfjTaaAj48040IGOlGf6O/AdoFcXD6GUCeQx41jgInn4Sb6ECQ07OPy4e6owaWSg0gh
         AXZf3yD67BBC7Up8L9IatMjLtfJq8503TbtGfyJLhGFiuVdKXah61wbet0+4/b3INkgp
         Bnjc61MAREqwLknKQcGzOvKukQ5UgT7Z3mSrbZfKzac8fMM5i2rxmfKOF+IuaKAT6zmI
         KEow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=McqFH8HA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z189-20020a2565c6000000b0063399404414si622524ybb.126.2022.04.08.07.35.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=McqFH8HA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpho-0002kD-Og
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPS-00075Z-BV
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:47033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPP-0002Mx-2k
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:20 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v2so2198984wrv.13
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c2w8hD7BvI/mrPbeJHM/ddfGPpF2hd8m8r56TLjlSxo=;
 b=McqFH8HAyOz3+0xfW01DCj9eees7vq1ysV+8HonEZDNfQLIHoqcwjsRdJR2PtPrYj2
 HCwTHqUW+TUjWqmZHfPvS8ghv3EUcQNVS7KdI8Rk5NmCOsyRCUxBv5W2NEmy5nz5QXQf
 9gyOeYtJnH+ll/5aUgYsaDcjzPxPzJI4El4ACLz1N0QJeUHRrbvEyhIcY+63Rmpxm37N
 Pg01Qj9hDUYi0JDt3HIbR7CqoeuQ7Hg3pDV6nmeDsmnER6x4hkmXGPPKTmd75eKe2SY8
 I6NsPZG+CrQrH5L+KGsqUIlDxz2zyA42K7kpIh6hKkKSVng94rgvIc/8tXQ6BDo0s8xC
 spiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c2w8hD7BvI/mrPbeJHM/ddfGPpF2hd8m8r56TLjlSxo=;
 b=Z8MZx0KIYwm2NXtPcjUM21tcG5+8gVlsBRV3ICquX8iHKMgyoti8KoHZ6uAV1GmNWA
 XbxOfvR2OeNYZlEjziomlKrJabdaVh/bLqT0R4A3E+FyvqDC3eZP8PR8EVtOl+bHXu8t
 OquXq43Y6q3kCr8ldLo7y29ZswlbKwjroF1qF9q8HD7DpGLSNSCkpiKSdbkEwFBanKHH
 Lnm070zEn6f+jkGL25U4WoQ+tFKSrifqT5YrFjX1djyMCTb9lDyRtqyiWMZmLXC7S8OB
 Ko8rpGbGbmwQi+wuaF7lyeiabsmYL3E9wActD/eTgB6z08OQS+98Vs+XuFtZZBpD30a3
 LAXg==
X-Gm-Message-State: AOAM533kzxXMJwxYf4qTb9eWlKzljNU0732GFrR13NS7SAMlIz4fRJKe
 BNfjU+V7eiwcimsMLNrVZNhvVw==
X-Received: by 2002:a05:6000:178c:b0:204:648:b4c4 with SMTP id
 e12-20020a056000178c00b002040648b4c4mr14519912wrg.219.1649427377731; 
 Fri, 08 Apr 2022 07:16:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 26/41] hw/intc/arm_gicv3_cpuif: Don't recalculate maintenance
 irq unnecessarily
Date: Fri,  8 Apr 2022 15:15:35 +0100
Message-Id: <20220408141550.1271295-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 41sPVLUI2g1r

The maintenance interrupt state depends only on:
 * ICH_HCR_EL2
 * ICH_LR<n>_EL2
 * ICH_VMCR_EL2 fields VENG0 and VENG1

Now we have a separate function that updates only the vIRQ and vFIQ
lines, use that in places that only change state that affects vIRQ
and vFIQ but not the maintenance interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index f11863ff613..d627ddac90f 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -543,7 +543,7 @@ static void icv_ap_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
 
-    gicv3_cpuif_virt_update(cs);
+    gicv3_cpuif_virt_irq_fiq_update(cs);
     return;
 }
 
@@ -588,7 +588,7 @@ static void icv_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     write_vbpr(cs, grp, value);
 
-    gicv3_cpuif_virt_update(cs);
+    gicv3_cpuif_virt_irq_fiq_update(cs);
 }
 
 static uint64_t icv_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -615,7 +615,7 @@ static void icv_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     cs->ich_vmcr_el2 = deposit64(cs->ich_vmcr_el2, ICH_VMCR_EL2_VPMR_SHIFT,
                                  ICH_VMCR_EL2_VPMR_LENGTH, value);
 
-    gicv3_cpuif_virt_update(cs);
+    gicv3_cpuif_virt_irq_fiq_update(cs);
 }
 
 static uint64_t icv_igrpen_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -682,7 +682,7 @@ static void icv_ctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     cs->ich_vmcr_el2 = deposit64(cs->ich_vmcr_el2, ICH_VMCR_EL2_VEOIM_SHIFT,
                                  1, value & ICC_CTLR_EL1_EOIMODE ? 1 : 0);
 
-    gicv3_cpuif_virt_update(cs);
+    gicv3_cpuif_virt_irq_fiq_update(cs);
 }
 
 static uint64_t icv_rpr_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -2452,7 +2452,7 @@ static void ich_ap_write(CPUARMState *env, const ARMCPRegInfo *ri,
     trace_gicv3_ich_ap_write(ri->crm & 1, regno, gicv3_redist_affid(cs), value);
 
     cs->ich_apr[grp][regno] = value & 0xFFFFFFFFU;
-    gicv3_cpuif_virt_update(cs);
+    gicv3_cpuif_virt_irq_fiq_update(cs);
 }
 
 static uint64_t ich_hcr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-- 
2.25.1

