Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8999DEC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:05:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKG-0001Mr-I2; Mon, 23 Feb 2026 12:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKE-0001Kx-UV
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:26 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKC-00005J-Vn
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:26 -0500
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4837634de51so20462575e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866143; x=1772470943; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pqW9rM/0GD/85HW/dEUCbk4fqpodu9kP2QyiPy7FS58=;
 b=SqkqXLQq8NXEXv52hTgd4P71TPmdd9I8TvJfBGz4Rqsm2idEKwOhQhPsy2vX+eAIwG
 gjjk7ua6KWDqUB4tXcBxBYRDU4TWG+Vf4ZCslwFxQIlsyoZSNxXEw2jWgd2DckihVv5e
 h8PsxBjBQs/RGReEW3jk/HwblbEqPvM//tIW6LFDLCrkaY1b9yoQwAJ3NhQ70r0TN80d
 g0tHSkeYfIQ5ZuaRw8ja4odVcpyvjSUeaMnJ1O0fYTTru3Upu2z1CyTcgo+QuF5G24M5
 jqX9x/CqNTUd/QnLSoL2FfG5Z79wHkf1FhfkPQxvNgGJ17DPIbaRHZbz2XhPq2FdtmQo
 aHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866143; x=1772470943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pqW9rM/0GD/85HW/dEUCbk4fqpodu9kP2QyiPy7FS58=;
 b=VTcGdHKL+t/sK7jDLpG6o1N+tQTG5EAMtpl9QnU7y6v87j+Qu8gIp1UQN5ewp2YtHl
 rkkj5yk3Rih7x3pFY5M6lZUSFIEYC5zg6S/of3Tx/a1Y3M0W8PHNZmD2ufGzQQnUNm/z
 cJCRI5kkJfk1RRI992E0DeNXrnNyKa5cUrGFwlSQ4XBi/M1YaJ6I3SBEYKSCxkROL/6H
 newxoYKpcaa4hxYkY2B3vIGEgNEVwwKmoOb3mgFNSMPQ2Ptqqn/WMvnOhezwScsFtM6Q
 QLFYzWpjZV8KCNHNu9Y4+npGQXC7BNXjkJYD4dBFpp0fhPKMQ1xrTus0DBukXnNe1zVM
 t58A==
X-Gm-Message-State: AOJu0YzLJSwNZlfoBX+40RgxfZTwdbzUOFt0qq5fpCe1WyNnwwEpYUQk
 q0fw0GsE+FYv/nQeitb69qKRB2tY3ltporlxZZTYWa1vU6dFgLYPuiyei5mtgfidCjsHnSA3BO3
 QN0FIu/M=
X-Gm-Gg: AZuq6aKuBPvcYiCodRY8rZuckSdPDe4323WtZ8nQ1gmck4trbqIviURNdkJdeVhJahB
 dWlg3eBQdTNplp5zvhk/tS8+KvCGz+QIEg+LuI4VfJnfhx8YxJsjDp7pWt1PfYI3P1AR/+xBzk/
 VPQBy0u5UO2oWafSbjsIgrOb3/y+yX+qguI4myvYu8TaVqFDATD2qZZzC7hfsHWZ1JPQSO5Z7UZ
 2rezEkskLluGFI6x2wuWD/yHXZTYja8V61I+w/aapSqtZz58VKi2pdjkd8FdM4kVChll3AArg2X
 8PUoOEhGEogZ6nPGUM3j59x59S6pCXF8XkBH5xaNrCaYygHHM8z7PatsmlB6zonlwG04Y0B1EFl
 nvFfTQtmdtpiA9ry7KUZ5iCX6wlpqKWSP9HRkUEr+cF+btS45vDgJLcMEY4DWHAl48zJJJNNHFl
 S+r2Rjf6/r7Fhfa8CJXGJfOHTiwLv8WH4+RajHvJ/wGceD7MEQ7etUWT0yp1Tson2H6i9Og6gFK
 e3fJWWN8ar4bZat7pq8FTDaSK/MgsU=
X-Received: by 2002:a05:600c:1386:b0:475:da1a:53f9 with SMTP id
 5b1f17b1804b1-483a96087d8mr171816225e9.14.1771866143092; 
 Mon, 23 Feb 2026 09:02:23 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/65] hw/intc/arm_gicv5: Define macros for config frame
 registers
Date: Mon, 23 Feb 2026 17:01:15 +0000
Message-ID: <20260223170212.441276-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Define constants for the various registers in the IRS config frame
using the REG and FIELD macros.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 243 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 243 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 7ef48bb450..db754e7681 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/core/registerfields.h"
 #include "hw/intc/arm_gicv5.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
@@ -22,6 +23,248 @@ static const char *domain_name[] = {
     [GICV5_ID_REALM] = "Realm",
 };
 
+REG32(IRS_IDR0, 0x0)
+    FIELD(IRS_IDR0, INT_DOM, 0, 2)
+    FIELD(IRS_IDR0, PA_RANGE, 2, 5)
+    FIELD(IRS_IDR0, VIRT, 6, 1)
+    FIELD(IRS_IDR0, ONE_N, 7, 1)
+    FIELD(IRS_IDR0, VIRT_ONE_N, 8, 1)
+    FIELD(IRS_IDR0, SETLPI, 9, 1)
+    FIELD(IRS_IDR0, MEC, 10, 1)
+    FIELD(IRS_IDR0, MPAM, 11, 1)
+    FIELD(IRS_IDR0, SWE, 12, 1)
+    FIELD(IRS_IDR0, IRSID, 16, 16)
+
+REG32(IRS_IDR1, 0x4)
+    FIELD(IRS_IDR1, PE_CNT, 0, 16)
+    FIELD(IRS_IDR1, IAFFID_BITS, 16, 4)
+    FIELD(IRS_IDR1, PRI_BITS, 20, 3)
+
+REG32(IRS_IDR2, 0x8)
+    FIELD(IRS_IDR2, ID_BITS, 0, 5)
+    FIELD(IRS_IDR2, LPI, 5, 1)
+    FIELD(IRS_IDR2, MIN_LPI_ID_BITS, 6, 4)
+    FIELD(IRS_IDR2, IST_LEVELS, 10, 1)
+    FIELD(IRS_IDR2, IST_L2SZ, 11, 3)
+    FIELD(IRS_IDR2, IST_MD, 14, 1)
+    FIELD(IRS_IDR2, ISTMD_SZ, 15, 5)
+
+REG32(IRS_IDR3, 0xc)
+    FIELD(IRS_IDR3, VMD, 0, 1)
+    FIELD(IRS_IDR3, VMD_SZ, 1, 4)
+    FIELD(IRS_IDR3, VM_ID_BITS, 5, 5)
+    FIELD(IRS_IDR3, VMT_LEVELS, 10, 1)
+
+REG32(IRS_IDR4, 0x10)
+    FIELD(IRS_IDR4, VPED_SZ, 0, 6)
+    FIELD(IRS_IDR4, VPE_ID_BITS, 6, 4)
+
+REG32(IRS_IDR5, 0x14)
+    FIELD(IRS_IDR5, SPI_RANGE, 0, 25)
+
+REG32(IRS_IDR6, 0x18)
+    FIELD(IRS_IDR6, SPI_IRS_RANGE, 0, 25)
+
+REG32(IRS_IDR7, 0x1c)
+    FIELD(IRS_IDR7, SPI_BASE, 0, 24)
+
+REG32(IRS_IIDR, 0x40)
+    FIELD(IRS_IIDR, IMPLEMENTER, 0, 12)
+    FIELD(IRS_IIDR, REVISION, 12, 4)
+    FIELD(IRS_IIDR, VARIANT, 16, 4)
+    FIELD(IRS_IIDR, PRODUCTID, 20, 12)
+
+REG32(IRS_AIDR, 0x44)
+    FIELD(IRS_AIDR, ARCHMINORREV, 0, 4)
+    FIELD(IRS_AIDR, ARCHMAJORREV, 4, 4)
+    FIELD(IRS_AIDR, COMPONENT, 8, 4)
+
+REG32(IRS_CR0, 0x80)
+    FIELD(IRS_CR0, IRSEN, 0, 1)
+    FIELD(IRS_CR0, IDLE, 1, 1)
+
+REG32(IRS_CR1, 0x84)
+    FIELD(IRS_CR1, SH, 0, 2)
+    FIELD(IRS_CR1, OC, 2, 2)
+    FIELD(IRS_CR1, IC, 4, 2)
+    FIELD(IRS_CR1, IST_RA, 6, 1)
+    FIELD(IRS_CR1, IST_WA, 7, 1)
+    FIELD(IRS_CR1, VMT_RA, 8, 1)
+    FIELD(IRS_CR1, VMT_WA, 9, 1)
+    FIELD(IRS_CR1, VPET_RA, 10, 1)
+    FIELD(IRS_CR1, VPET_WA, 11, 1)
+    FIELD(IRS_CR1, VMD_RA, 12, 1)
+    FIELD(IRS_CR1, VMD_WA, 13, 1)
+    FIELD(IRS_CR1, VPED_RA, 14, 1)
+    FIELD(IRS_CR1, VPED_WA, 15, 1)
+
+REG32(IRS_SYNCR, 0xc0)
+    FIELD(IRS_SYNCR, SYNC, 31, 1)
+
+REG32(IRS_SYNC_STATUSR, 0xc4)
+    FIELD(IRS_SYNC_STATUSR, IDLE, 0, 1)
+
+REG64(IRS_SPI_VMR, 0x100)
+    FIELD(IRS_SPI_VMR, VM_ID, 0, 16)
+    FIELD(IRS_SPI_VMR, VIRT, 63, 1)
+
+REG32(IRS_SPI_SELR, 0x108)
+    FIELD(IRS_SPI_SELR, ID, 0, 24)
+
+REG32(IRS_SPI_DOMAINR, 0x10c)
+    FIELD(IRS_SPI_DOMAINR, DOMAIN, 0, 2)
+
+REG32(IRS_SPI_RESAMPLER, 0x110)
+    FIELD(IRS_SPI_RESAMPLER, SPI_ID, 0, 24)
+
+REG32(IRS_SPI_CFGR, 0x114)
+    FIELD(IRS_SPI_CFGR, TM, 0, 1)
+
+REG32(IRS_SPI_STATUSR, 0x118)
+    FIELD(IRS_SPI_STATUSR, IDLE, 0, 1)
+    FIELD(IRS_SPI_STATUSR, V, 1, 1)
+
+REG32(IRS_PE_SELR, 0x140)
+    FIELD(IRS_PE_SELR, IAFFID, 0, 16)
+
+REG32(IRS_PE_STATUSR, 0x144)
+    FIELD(IRS_PE_STATUSR, IDLE, 0, 1)
+    FIELD(IRS_PE_STATUSR, V, 1, 1)
+    FIELD(IRS_PE_STATUSR, ONLINE, 2, 1)
+
+REG32(IRS_PE_CR0, 0x148)
+    FIELD(IRS_PE_CR0, DPS, 0, 1)
+
+REG64(IRS_IST_BASER, 0x180)
+    FIELD(IRS_IST_BASER, VALID, 0, 1)
+    FIELD(IRS_IST_BASER, ADDR, 6, 50)
+
+REG32(IRS_IST_CFGR, 0x190)
+    FIELD(IRS_IST_CFGR, LPI_ID_BITS, 0, 5)
+    FIELD(IRS_IST_CFGR, L2SZ, 5, 2)
+    FIELD(IRS_IST_CFGR, ISTSZ, 7, 2)
+    FIELD(IRS_IST_CFGR, STRUCTURE, 16, 1)
+
+REG32(IRS_IST_STATUSR, 0x194)
+    FIELD(IRS_IST_STATUSR, IDLE, 0, 1)
+
+REG32(IRS_MAP_L2_ISTR, 0x1c0)
+    FIELD(IRS_MAP_L2_ISTR, ID, 0, 24)
+
+REG64(IRS_VMT_BASER, 0x200)
+    FIELD(IRS_VMT_BASER, VALID, 0, 1)
+    FIELD(IRS_VMT_BASER, ADDR, 3, 53)
+
+REG32(IRS_VMT_CFGR, 0x210)
+    FIELD(IRS_VMT_CFGR, VM_ID_BITS, 0, 5)
+    FIELD(IRS_VMT_CFGR, STRUCTURE, 16, 1)
+
+REG32(IRS_VMT_STATUSR, 0x124)
+    FIELD(IRS_VMT_STATUSR, IDLE, 0, 1)
+
+REG64(IRS_VPE_SELR, 0x240)
+    FIELD(IRS_VPE_SELR, VM_ID, 0, 16)
+    FIELD(IRS_VPE_SELR, VPE_ID, 32, 16)
+    FIELD(IRS_VPE_SELR, S, 63, 1)
+
+REG64(IRS_VPE_DBR, 0x248)
+    FIELD(IRS_VPE_DBR, INTID, 0, 24)
+    FIELD(IRS_VPE_DBR, DBPM, 32, 5)
+    FIELD(IRS_VPE_DBR, REQ_DB, 62, 1)
+    FIELD(IRS_VPE_DBR, DBV, 63, 1)
+
+REG32(IRS_VPE_HPPIR, 0x250)
+    FIELD(IRS_VPE_HPPIR, ID, 0, 24)
+    FIELD(IRS_VPE_HPPIR, TYPE, 29, 3)
+    FIELD(IRS_VPE_HPPIR, HPPIV, 32, 1)
+
+REG32(IRS_VPE_CR0, 0x258)
+    FIELD(IRS_VPE_CR0, DPS, 0, 1)
+
+REG32(IRS_VPE_STATUSR, 0x25c)
+    FIELD(IRS_VPE_STATUSR, IDLE, 0, 1)
+    FIELD(IRS_VPE_STATUSR, V, 1, 1)
+
+REG64(IRS_VM_DBR, 0x280)
+    FIELD(IRS_VM_DBR, VPE_ID, 0, 16)
+    FIELD(IRS_VM_DBR, EN, 63, 1)
+
+REG32(IRS_VM_SELR, 0x288)
+    FIELD(IRS_VM_SELR, VM_ID, 0, 16)
+
+REG32(IRS_VM_STATUSR, 0x28c)
+    FIELD(IRS_VM_STATUSR, IDLE, 0, 1)
+    FIELD(IRS_VM_STATUSR, V, 1, 1)
+
+REG64(IRS_VMAP_L2_VMTR, 0x2c0)
+    FIELD(IRS_VMAP_L2_VMTR, VM_ID, 0, 16)
+    FIELD(IRS_VMAP_L2_VMTR, M, 63, 1)
+
+REG64(IRS_VMAP_VMR, 0x2c8)
+    FIELD(IRS_VMAP_VMR, VM_ID, 0, 16)
+    FIELD(IRS_VMAP_VMR, U, 62, 1)
+    FIELD(IRS_VMAP_VMR, M, 63, 1)
+
+REG64(IRS_VMAP_VISTR, 0x2d0)
+    FIELD(IRS_VMAP_VISTR, TYPE, 29, 3)
+    FIELD(IRS_VMAP_VISTR, VM_ID, 32, 16)
+    FIELD(IRS_VMAP_VISTR, U, 62, 1)
+    FIELD(IRS_VMAP_VISTR, M, 63, 1)
+
+REG64(IRS_VMAP_L2_VISTR, 0x2d8)
+    FIELD(IRS_VMAP_L2_VISTR, ID, 0, 24)
+    FIELD(IRS_VMAP_L2_VISTR, TYPE, 29, 3)
+    FIELD(IRS_VMAP_L2_VISTR, VM_ID, 32, 16)
+    FIELD(IRS_VMAP_L2_VISTR, M, 63, 1)
+
+REG64(IRS_VMAP_VPER, 0x2e0)
+    FIELD(IRS_VMAP_VPER, VPE_ID, 0, 16)
+    FIELD(IRS_VMAP_VPER, VM_ID, 32, 16)
+    FIELD(IRS_VMAP_VPER, M, 63, 1)
+
+REG64(IRS_SAVE_VMR, 0x300)
+    FIELD(IRS_SAVE_VMR, VM_ID, 0, 16)
+    FIELD(IRS_SAVE_VMR, Q, 62, 1)
+    FIELD(IRS_SAVE_VMR, S, 63, 1)
+
+REG32(IRS_SAVE_VM_STATUSR, 0x308)
+    FIELD(IRS_SAVE_VM_STATUSR, IDLE, 0, 1)
+    FIELD(IRS_SAVE_VM_STATUSR, Q, 1, 1)
+
+REG32(IRS_MEC_IDR, 0x340)
+    FIELD(IRS_MEC_IDR, MECIDSIZE, 0, 4)
+
+REG32(IRS_MEC_MECID_R, 0x344)
+    FIELD(IRS_MEC_MICID_R, MECID, 0, 16)
+
+REG32(IRS_MPAM_IDR, 0x380)
+    FIELD(IRS_MPAM_IDR, PARTID_MAX, 0, 16)
+    FIELD(IRS_MPAM_IDR, PMG_MAX, 16, 8)
+    FIELD(IRS_MPAM_IDR, HAS_MPAM_SP, 24, 1)
+
+REG32(IRS_MPAM_PARTID_R, 0x384)
+    FIELD(IRS_MPAM_IDR, PARTID, 0, 16)
+    FIELD(IRS_MPAM_IDR, PMG, 16, 8)
+    FIELD(IRS_MPAM_IDR, MPAM_SP, 24, 2)
+    FIELD(IRS_MPAM_IDR, IDLE, 31, 1)
+
+REG64(IRS_SWERR_STATUSR, 0x3c0)
+    FIELD(IRS_SWERR_STATUSR, V, 0, 1)
+    FIELD(IRS_SWERR_STATUSR, S0V, 1, 1)
+    FIELD(IRS_SWERR_STATUSR, S1V, 2, 1)
+    FIELD(IRS_SWERR_STATUSR, OF, 3, 1)
+    FIELD(IRS_SWERR_STATUSR, EC, 16, 8)
+    FIELD(IRS_SWERR_STATUSR, IMP_EC, 24, 8)
+
+REG64(IRS_SWERR_SYNDROMER0, 0x3c8)
+    FIELD(IRS_SWERR_SYNDROMER0, VM_ID, 0, 16)
+    FIELD(IRS_SWERR_SYNDROMER0, ID, 32, 24)
+    FIELD(IRS_SWERR_SYNDROMER0, TYPE, 60, 3)
+    FIELD(IRS_SWERR_SYNDROMER0, VIRTUAL, 63, 1)
+
+REG64(IRS_SWERR_SYNDROMER1, 0x3d0)
+    FIELD(IRS_SWERR_SYNDROMER2, ADDR, 3, 53)
+
 static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
                          uint64_t *data, MemTxAttrs attrs)
 {
-- 
2.43.0


