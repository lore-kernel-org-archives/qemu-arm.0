Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12909CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:44:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OF-0000A2-0u; Thu, 07 May 2026 19:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OC-000085-QY
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:20 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8O9-0000yX-SC
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:20 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7dcdaf06498so1087225a34.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197456; x=1778802256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLBUgvemDVI7RU2td5O8ML7A96sLCDah7D9rLOrhH9o=;
 b=cRFRs0oua/wqoYxHXWeSPXumPXOC3TWt1N9kqviBa74y44cajn2wPA3sDNKIP4MiP5
 r2eFtypNUY52ZooaXnk5EhgI+DTo3ZukXtlP2fLLfgw0Pc5Bsxz6hjYVEL3S2r0eLBB8
 O2oiAwsTfbfhGEEFW8pRRHcJJA1bhqK+ftrrEGIHoKGC+A4HreEqgIz1q3ay0Nl0rwse
 xU2hNJWoRyRtSQ1yqH57wzLNL2DpunoYw0msVqiTFNIo8+t4FmssC7TjGEKdfqglxDwg
 tgsPyYVXG7orR5xNrvsC2dUpCSV19Qn8smRwSoWe+41hdzYGMEKOfZD0dnc48P+IaZ5I
 aWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197456; x=1778802256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SLBUgvemDVI7RU2td5O8ML7A96sLCDah7D9rLOrhH9o=;
 b=qvlPwvSwQXEl/t0jTES/olPt/13/baJvoaqWjaLleF0aapf0DzL00BjYN0mPLN3bG0
 GMNIe9FCp6fMhEMMHbvdUfPrzGR9nGKEBoZBcEJaHLeuYnfN/BIQgCX8Od3Mc8Z3I10R
 riLe6OvK2NZSmIyCWpzEdQGTCw0Q6++jkADTGB0MuSr16rRg3NpcOK0M+yfUv+Bpm4cF
 Izk5dr/pJEyx2W0fzgRvxYWU6GV8u0mEhxEgg6NcqRTVxLSWQ0eRKER1wnpZyUloKYT1
 amwEf7QcTVirApBuwc7s4PEP944fND5Jud2pWNZXCQ32ZIfTiS/iVuoVHkcoUhaoLgaB
 se8w==
X-Gm-Message-State: AOJu0YzNLjSeaKP0FaveR7DWj7sblR0ejtzZl6JvHMbzunGh5dNwdsFG
 Ec8HbM6xbIPnYo3hJR28Ea7DhE/Oz+t09v/Qir9fKbMyqVXeI6sdCm3ZHCzUwThNon4=
X-Gm-Gg: AeBDietm4k9bRtc1gUCOXqDRt8TDIemN1e5lVZqRbsJXIzP5Sy1II/dz95k00nmj8WG
 x+nMR9jDGB0AIdef1/BST4MJcQ4FHCpix0pZFHmZsckhfkxd5tsj/tzxXPD11yaTs8wzI+fSU/l
 wLBRmizZS42r63f5GNwHjEgPfR8LuXnlZk8XZN+f5e8WLKdVv28UiEwPgLLIoEDJ679KmCmSa7g
 sxLBvB9aFBUB3pBXw/gee9Syer+xCZZ7MlBhQNEjPDloycaH6U6cMYOt539mFtQ/mEf7DYoi1wL
 EH0CDIrTTf5tYLEvSG4CXdpCnCuQPF1raRkGZP4HGWcnYVSYmTk0cOihZPEqwGn8IpOkEb1fF7t
 7CYbztD2N7oo/6t2RWQrX+ggdJNkVmFNMLgK9dCkm6OCLMgT8ygadegXuCxoPOO0GflIH0aMPN/
 e31iMI6KtlDpex3Ed4TBDEZNrwhZX2riLJFfZsGr1mZC68Ppq1zPI5Umbz
X-Received: by 2002:a05:6830:81c7:b0:7d7:51af:4aa1 with SMTP id
 46e09a7af769-7e1defeb3a5mr6520339a34.18.1778197456507; 
 Thu, 07 May 2026 16:44:16 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 01/60] target/arm: Implement ID_AA64ISAR3
Date: Thu,  7 May 2026 18:43:14 -0500
Message-ID: <20260507234413.643512-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h    | 9 +++++++++
 target/arm/helper.c          | 8 ++++++--
 target/arm/cpu-sysregs.h.inc | 1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 88fe3ed287..252044b057 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -244,6 +244,15 @@ FIELD(ID_AA64ISAR2, CSSC, 52, 4)
 FIELD(ID_AA64ISAR2, LUT, 56, 4)
 FIELD(ID_AA64ISAR2, ATS1A, 60, 4)
 
+FIELD(ID_AA64ISAR3, CPA, 0, 4)
+FIELD(ID_AA64ISAR3, FAMINMAX, 4, 4)
+FIELD(ID_AA64ISAR3, TLBIW, 8, 4)
+FIELD(ID_AA64ISAR3, PACM, 12, 4)
+FIELD(ID_AA64ISAR3, LSFE, 16, 4)
+FIELD(ID_AA64ISAR3, OCCMO, 20, 4)
+FIELD(ID_AA64ISAR3, LSUI, 24, 4)
+FIELD(ID_AA64ISAR3, FPRCVT, 28, 4)
+
 FIELD(ID_AA64PFR0, EL0, 0, 4)
 FIELD(ID_AA64PFR0, EL1, 4, 4)
 FIELD(ID_AA64PFR0, EL2, 8, 4)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7e7677a584..66813bb298 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6498,11 +6498,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
               .resetvalue = GET_IDREG(isar, ID_AA64ISAR2)},
-            { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64ISAR3_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
-              .resetvalue = 0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64ISAR3) },
             { .name = "ID_AA64ISAR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -6731,6 +6731,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                                R_ID_AA64ISAR2_BC_MASK |
                                R_ID_AA64ISAR2_RPRFM_MASK |
                                R_ID_AA64ISAR2_CSSC_MASK },
+            { .name = "ID_AA64ISAR3_EL1",
+              .exported_bits = R_ID_AA64ISAR3_FAMINMAX_MASK |
+                               R_ID_AA64ISAR3_LSFE_MASK |
+                               R_ID_AA64ISAR3_FPRCVT_MASK },
             { .name = "ID_AA64ISAR*_EL1_RESERVED",
               .is_glob = true },
         };
diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index 3d1ed40f04..b99579f773 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -10,6 +10,7 @@ DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
 DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
 DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
 DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
+DEF(ID_AA64ISAR3_EL1, 3, 0, 0, 6, 3)
 DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
 DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
 DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
-- 
2.43.0


