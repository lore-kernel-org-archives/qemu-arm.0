Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2277ACC6B10
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:48:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY6O-0004Mv-C0; Tue, 13 Oct 2026 04:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3z-0008VH-Gz
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:47 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY3v-00081d-Pg
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:40:47 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso2560460f8f.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880842; x=1792485642; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=smZTZM7oZW8bOZkpZTb5qADBZ0m6LNtjYEMi2pmMLN4=;
 b=ZZHUJqgcWHO/TfiVA+aekEDb0AZ17g9wY31hC4vfIzr73PEFogN66asFaZzMpertps
 Nw4qbhfDevQTLJq6W6f4v6v52sC0I7da8mR24427jsyY0TsijLSC1kLqekrMenRCKz6S
 YYTiGN7l21y8gdjie6zcJLCBnuD2plt34WUGD9xwdE0rkHtshHd+R9vuHhOxH5qBGYF8
 5GfEu8sbWhZVm+4v9jhUVNQJPGkpG3yIJNtdewAODE32h2qHpo+6pOYhgkif0FAy8YdU
 dv1y+6/Tu7yonITQD4g/oyIYMHZdpRynsa/pIKfqB64jejWNHuEYQu+tjAKYmd2qtpKm
 3heA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880842; x=1792485642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=smZTZM7oZW8bOZkpZTb5qADBZ0m6LNtjYEMi2pmMLN4=;
 b=y4UK0eaZ3mtSmfZM6uYKsg2pWsaRU7aFlpPKCwl1TpurS6CF8Hm4ZeCW/Y5aiLc4an
 5Q/8mxnGWydy8x/waS10ak6Pnm+k7rlt7RgHyXrNUzEOYtqWqV406oriGyOCIYp2n+al
 5Jc5P6Zi3wPt7vXI4J4tmV2qAvLw+Y2GTR/xjtXLNj3AsY2iJBC9K77GN9la/j5jq6Gu
 9QDa37pyzOUIYIQU/HkebDusrMM+Gh7ub7U/aVVk42VQEswuiI9Z1y5q98sx5Pt0qwIS
 yYXjH9ncRPms97ZfXIuDb6zVyHXQiqT+QDJtTRjGUYThXmYE4eHhHpaDEc9DgHco/zLu
 E6bA==
X-Gm-Message-State: AFq9FYJMxUumpMGvvl63DXB9ZX3tVURH3K7KUNQBldsl/zkMYo4Qhx1M
 owmLHeY0cT4QUb9MA6yJqD3mgn2RTvxIzCKiMxZ7qOpogWGJwckm4/i+S9s7+fqBuUPojo17V14
 qf9M7VnQ=
X-Gm-Gg: AYBFou0UaX/k4m0FOlm9j9+4vnmep3Vx0KEnw/dnoucgJziajaRGjGgMTlPLTOr0Y1c
 CyMptBFyHCRQHxIg7TT3ZhqeCmepLxYPjdqhytLBfEcHdFuRvQUuV/Rtz0impJHzylnk1MgJe1L
 FSdA+zWi5MabNe66iffAz7Zmn8AZX0AcAGVXxe+WXc7X0MORu0q77c5GRsc0gQxi1sCY+LpfOFk
 Prlix7mRmFM9ZMUhiAFSHwypQSpPlLqK/aHceeprHzcp5ajLIOfRNs4FFbcfTico6vjlJe9ey3v
 k5oMY6Dx43lBp1B/eZGnajMVhVF2a8bZqlAGB/HuUhs+Uje14E7WVSufi6n2ZOHpSNej0wnDcPv
 kB1gwGONfU8doRL8pd7A/hEnwGQL4niqewovE3FyCmKPZfUkZj+hnxAXHijwo/38GW5DJGcejhA
 5vJIqMxxppDlQMaQi6W1lM7xw81ttA+eLlTi53las1izOasJpsrB3Rin+utBHy3RP4T7AkKpp5r
 Fz6yLvvB25+JNBgmsMifEWH09fso3u9YAhhqUNbFjzUh9YlhEYg623RhZxwuoYo5tj88AqPfFGi
 DF9atY5cUc5eaA==
X-Received: by 2002:a05:600c:6097:b0:49f:bd3c:bc24 with SMTP id
 5b1f17b1804b1-4a18e4b8885mr219382515e9.31.1791880842127; 
 Tue, 13 Oct 2026 01:40:42 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:40:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 49/86] hw/intc: Move GICv5 register and data definitions into
 a header
Date: Tue, 13 Oct 2026 09:38:56 +0100
Message-ID: <20261013083933.1024405-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

We put the definitions of GICv5 IRS registers and guest-memory data
structures directly into arm_gicv5.c.  It turns out that there are a
few cases where we would like them outside that file (for instance
register reset is handled in arm_gicv5_common.c).

Move the definitions to their own header file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c              | 270 +----------------------------
 include/hw/intc/arm_gicv5_regs.h | 286 +++++++++++++++++++++++++++++++
 2 files changed, 287 insertions(+), 269 deletions(-)
 create mode 100644 include/hw/intc/arm_gicv5_regs.h

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index d503d8db426..289a3afaeae 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -15,6 +15,7 @@
 #include "hw/core/registerfields.h"
 #include "hw/intc/arm_gicv5.h"
 #include "hw/intc/arm_gicv5_stream.h"
+#include "hw/intc/arm_gicv5_regs.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "trace.h"
@@ -48,275 +49,6 @@ static const char *inttype_name(GICv5IntType t)
     return names[t];
 }
 
-REG32(IRS_IDR0, 0x0)
-    FIELD(IRS_IDR0, INT_DOM, 0, 2)
-    FIELD(IRS_IDR0, PA_RANGE, 2, 4)
-    FIELD(IRS_IDR0, VIRT, 6, 1)
-    FIELD(IRS_IDR0, ONE_N, 7, 1)
-    FIELD(IRS_IDR0, VIRT_ONE_N, 8, 1)
-    FIELD(IRS_IDR0, SETLPI, 9, 1)
-    FIELD(IRS_IDR0, MEC, 10, 1)
-    FIELD(IRS_IDR0, MPAM, 11, 1)
-    FIELD(IRS_IDR0, SWE, 12, 1)
-    FIELD(IRS_IDR0, IRSID, 16, 16)
-
-REG32(IRS_IDR1, 0x4)
-    FIELD(IRS_IDR1, PE_CNT, 0, 16)
-    FIELD(IRS_IDR1, IAFFID_BITS, 16, 4)
-    FIELD(IRS_IDR1, PRI_BITS, 20, 3)
-
-REG32(IRS_IDR2, 0x8)
-    FIELD(IRS_IDR2, ID_BITS, 0, 5)
-    FIELD(IRS_IDR2, LPI, 5, 1)
-    FIELD(IRS_IDR2, MIN_LPI_ID_BITS, 6, 4)
-    FIELD(IRS_IDR2, IST_LEVELS, 10, 1)
-    FIELD(IRS_IDR2, IST_L2SZ, 11, 3)
-    FIELD(IRS_IDR2, IST_MD, 14, 1)
-    FIELD(IRS_IDR2, ISTMD_SZ, 15, 5)
-
-REG32(IRS_IDR3, 0xc)
-    FIELD(IRS_IDR3, VMD, 0, 1)
-    FIELD(IRS_IDR3, VMD_SZ, 1, 4)
-    FIELD(IRS_IDR3, VM_ID_BITS, 5, 5)
-    FIELD(IRS_IDR3, VMT_LEVELS, 10, 1)
-
-REG32(IRS_IDR4, 0x10)
-    FIELD(IRS_IDR4, VPED_SZ, 0, 6)
-    FIELD(IRS_IDR4, VPE_ID_BITS, 6, 4)
-
-REG32(IRS_IDR5, 0x14)
-    FIELD(IRS_IDR5, SPI_RANGE, 0, 25)
-
-REG32(IRS_IDR6, 0x18)
-    FIELD(IRS_IDR6, SPI_IRS_RANGE, 0, 25)
-
-REG32(IRS_IDR7, 0x1c)
-    FIELD(IRS_IDR7, SPI_BASE, 0, 24)
-
-REG32(IRS_IIDR, 0x40)
-    FIELD(IRS_IIDR, IMPLEMENTER, 0, 12)
-    FIELD(IRS_IIDR, REVISION, 12, 4)
-    FIELD(IRS_IIDR, VARIANT, 16, 4)
-    FIELD(IRS_IIDR, PRODUCTID, 20, 12)
-
-REG32(IRS_AIDR, 0x44)
-    FIELD(IRS_AIDR, ARCHMINORREV, 0, 4)
-    FIELD(IRS_AIDR, ARCHMAJORREV, 4, 4)
-    FIELD(IRS_AIDR, COMPONENT, 8, 4)
-
-REG32(IRS_CR0, 0x80)
-    FIELD(IRS_CR0, IRSEN, 0, 1)
-    FIELD(IRS_CR0, IDLE, 1, 1)
-
-REG32(IRS_CR1, 0x84)
-    FIELD(IRS_CR1, SH, 0, 2)
-    FIELD(IRS_CR1, OC, 2, 2)
-    FIELD(IRS_CR1, IC, 4, 2)
-    FIELD(IRS_CR1, IST_RA, 6, 1)
-    FIELD(IRS_CR1, IST_WA, 7, 1)
-    FIELD(IRS_CR1, VMT_RA, 8, 1)
-    FIELD(IRS_CR1, VMT_WA, 9, 1)
-    FIELD(IRS_CR1, VPET_RA, 10, 1)
-    FIELD(IRS_CR1, VPET_WA, 11, 1)
-    FIELD(IRS_CR1, VMD_RA, 12, 1)
-    FIELD(IRS_CR1, VMD_WA, 13, 1)
-    FIELD(IRS_CR1, VPED_RA, 14, 1)
-    FIELD(IRS_CR1, VPED_WA, 15, 1)
-
-REG32(IRS_SYNCR, 0xc0)
-    FIELD(IRS_SYNCR, SYNC, 31, 1)
-
-REG32(IRS_SYNC_STATUSR, 0xc4)
-    FIELD(IRS_SYNC_STATUSR, IDLE, 0, 1)
-
-REG64(IRS_SPI_VMR, 0x100)
-    FIELD(IRS_SPI_VMR, VM_ID, 0, 16)
-    FIELD(IRS_SPI_VMR, VIRT, 63, 1)
-
-REG32(IRS_SPI_SELR, 0x108)
-    FIELD(IRS_SPI_SELR, ID, 0, 24)
-
-REG32(IRS_SPI_DOMAINR, 0x10c)
-    FIELD(IRS_SPI_DOMAINR, DOMAIN, 0, 2)
-
-REG32(IRS_SPI_RESAMPLER, 0x110)
-    FIELD(IRS_SPI_RESAMPLER, SPI_ID, 0, 24)
-
-REG32(IRS_SPI_CFGR, 0x114)
-    FIELD(IRS_SPI_CFGR, TM, 0, 1)
-
-REG32(IRS_SPI_STATUSR, 0x118)
-    FIELD(IRS_SPI_STATUSR, IDLE, 0, 1)
-    FIELD(IRS_SPI_STATUSR, V, 1, 1)
-
-REG32(IRS_PE_SELR, 0x140)
-    FIELD(IRS_PE_SELR, IAFFID, 0, 16)
-
-REG32(IRS_PE_STATUSR, 0x144)
-    FIELD(IRS_PE_STATUSR, IDLE, 0, 1)
-    FIELD(IRS_PE_STATUSR, V, 1, 1)
-    FIELD(IRS_PE_STATUSR, ONLINE, 2, 1)
-
-REG32(IRS_PE_CR0, 0x148)
-    FIELD(IRS_PE_CR0, DPS, 0, 1)
-
-REG64(IRS_IST_BASER, 0x180)
-    FIELD(IRS_IST_BASER, VALID, 0, 1)
-    FIELD(IRS_IST_BASER, ADDR, 6, 50)
-
-REG32(IRS_IST_CFGR, 0x190)
-    FIELD(IRS_IST_CFGR, LPI_ID_BITS, 0, 5)
-    FIELD(IRS_IST_CFGR, L2SZ, 5, 2)
-    FIELD(IRS_IST_CFGR, ISTSZ, 7, 2)
-    FIELD(IRS_IST_CFGR, STRUCTURE, 16, 1)
-
-REG32(IRS_IST_STATUSR, 0x194)
-    FIELD(IRS_IST_STATUSR, IDLE, 0, 1)
-
-REG32(IRS_MAP_L2_ISTR, 0x1c0)
-    FIELD(IRS_MAP_L2_ISTR, ID, 0, 24)
-
-REG64(IRS_VMT_BASER, 0x200)
-    FIELD(IRS_VMT_BASER, VALID, 0, 1)
-    FIELD(IRS_VMT_BASER, ADDR, 3, 53)
-
-REG32(IRS_VMT_CFGR, 0x210)
-    FIELD(IRS_VMT_CFGR, VM_ID_BITS, 0, 5)
-    FIELD(IRS_VMT_CFGR, STRUCTURE, 16, 1)
-
-REG32(IRS_VMT_STATUSR, 0x124)
-    FIELD(IRS_VMT_STATUSR, IDLE, 0, 1)
-
-REG64(IRS_VPE_SELR, 0x240)
-    FIELD(IRS_VPE_SELR, VM_ID, 0, 16)
-    FIELD(IRS_VPE_SELR, VPE_ID, 32, 16)
-    FIELD(IRS_VPE_SELR, S, 63, 1)
-
-REG64(IRS_VPE_DBR, 0x248)
-    FIELD(IRS_VPE_DBR, INTID, 0, 24)
-    FIELD(IRS_VPE_DBR, DBPM, 32, 5)
-    FIELD(IRS_VPE_DBR, REQ_DB, 62, 1)
-    FIELD(IRS_VPE_DBR, DBV, 63, 1)
-
-REG32(IRS_VPE_HPPIR, 0x250)
-    FIELD(IRS_VPE_HPPIR, ID, 0, 24)
-    FIELD(IRS_VPE_HPPIR, TYPE, 29, 3)
-    FIELD(IRS_VPE_HPPIR, HPPIV, 32, 1)
-
-REG32(IRS_VPE_CR0, 0x258)
-    FIELD(IRS_VPE_CR0, DPS, 0, 1)
-
-REG32(IRS_VPE_STATUSR, 0x25c)
-    FIELD(IRS_VPE_STATUSR, IDLE, 0, 1)
-    FIELD(IRS_VPE_STATUSR, V, 1, 1)
-
-REG64(IRS_VM_DBR, 0x280)
-    FIELD(IRS_VM_DBR, VPE_ID, 0, 16)
-    FIELD(IRS_VM_DBR, EN, 63, 1)
-
-REG32(IRS_VM_SELR, 0x288)
-    FIELD(IRS_VM_SELR, VM_ID, 0, 16)
-
-REG32(IRS_VM_STATUSR, 0x28c)
-    FIELD(IRS_VM_STATUSR, IDLE, 0, 1)
-    FIELD(IRS_VM_STATUSR, V, 1, 1)
-
-REG64(IRS_VMAP_L2_VMTR, 0x2c0)
-    FIELD(IRS_VMAP_L2_VMTR, VM_ID, 0, 16)
-    FIELD(IRS_VMAP_L2_VMTR, M, 63, 1)
-
-REG64(IRS_VMAP_VMR, 0x2c8)
-    FIELD(IRS_VMAP_VMR, VM_ID, 0, 16)
-    FIELD(IRS_VMAP_VMR, U, 62, 1)
-    FIELD(IRS_VMAP_VMR, M, 63, 1)
-
-REG64(IRS_VMAP_VISTR, 0x2d0)
-    FIELD(IRS_VMAP_VISTR, TYPE, 29, 3)
-    FIELD(IRS_VMAP_VISTR, VM_ID, 32, 16)
-    FIELD(IRS_VMAP_VISTR, U, 62, 1)
-    FIELD(IRS_VMAP_VISTR, M, 63, 1)
-
-REG64(IRS_VMAP_L2_VISTR, 0x2d8)
-    FIELD(IRS_VMAP_L2_VISTR, ID, 0, 24)
-    FIELD(IRS_VMAP_L2_VISTR, TYPE, 29, 3)
-    FIELD(IRS_VMAP_L2_VISTR, VM_ID, 32, 16)
-    FIELD(IRS_VMAP_L2_VISTR, M, 63, 1)
-
-REG64(IRS_VMAP_VPER, 0x2e0)
-    FIELD(IRS_VMAP_VPER, VPE_ID, 0, 16)
-    FIELD(IRS_VMAP_VPER, VM_ID, 32, 16)
-    FIELD(IRS_VMAP_VPER, M, 63, 1)
-
-REG64(IRS_SAVE_VMR, 0x300)
-    FIELD(IRS_SAVE_VMR, VM_ID, 0, 16)
-    FIELD(IRS_SAVE_VMR, Q, 62, 1)
-    FIELD(IRS_SAVE_VMR, S, 63, 1)
-
-REG32(IRS_SAVE_VM_STATUSR, 0x308)
-    FIELD(IRS_SAVE_VM_STATUSR, IDLE, 0, 1)
-    FIELD(IRS_SAVE_VM_STATUSR, Q, 1, 1)
-
-REG32(IRS_MEC_IDR, 0x340)
-    FIELD(IRS_MEC_IDR, MECIDSIZE, 0, 4)
-
-REG32(IRS_MEC_MECID_R, 0x344)
-    FIELD(IRS_MEC_MICID_R, MECID, 0, 16)
-
-REG32(IRS_MPAM_IDR, 0x380)
-    FIELD(IRS_MPAM_IDR, PARTID_MAX, 0, 16)
-    FIELD(IRS_MPAM_IDR, PMG_MAX, 16, 8)
-    FIELD(IRS_MPAM_IDR, HAS_MPAM_SP, 24, 1)
-
-REG32(IRS_MPAM_PARTID_R, 0x384)
-    FIELD(IRS_MPAM_IDR, PARTID, 0, 16)
-    FIELD(IRS_MPAM_IDR, PMG, 16, 8)
-    FIELD(IRS_MPAM_IDR, MPAM_SP, 24, 2)
-    FIELD(IRS_MPAM_IDR, IDLE, 31, 1)
-
-REG64(IRS_SWERR_STATUSR, 0x3c0)
-    FIELD(IRS_SWERR_STATUSR, V, 0, 1)
-    FIELD(IRS_SWERR_STATUSR, S0V, 1, 1)
-    FIELD(IRS_SWERR_STATUSR, S1V, 2, 1)
-    FIELD(IRS_SWERR_STATUSR, OF, 3, 1)
-    FIELD(IRS_SWERR_STATUSR, EC, 16, 8)
-    FIELD(IRS_SWERR_STATUSR, IMP_EC, 24, 8)
-
-REG64(IRS_SWERR_SYNDROMER0, 0x3c8)
-    FIELD(IRS_SWERR_SYNDROMER0, VM_ID, 0, 16)
-    FIELD(IRS_SWERR_SYNDROMER0, ID, 32, 24)
-    FIELD(IRS_SWERR_SYNDROMER0, TYPE, 60, 3)
-    FIELD(IRS_SWERR_SYNDROMER0, VIRTUAL, 63, 1)
-
-REG64(IRS_SWERR_SYNDROMER1, 0x3d0)
-    FIELD(IRS_SWERR_SYNDROMER2, ADDR, 3, 53)
-
-REG32(IRS_IDREGS, 0xffd0)
-REG32(IRS_DEVARCH, 0xffbc)
-
-FIELD(L1_ISTE, VALID, 0, 1)
-FIELD(L1_ISTE, L2_ADDR, 12, 44)
-
-FIELD(L2_ISTE, PENDING, 0, 1)
-FIELD(L2_ISTE, ACTIVE, 1, 1)
-FIELD(L2_ISTE, HM, 2, 1)
-FIELD(L2_ISTE, ENABLE, 3, 1)
-FIELD(L2_ISTE, IRM, 4, 1)
-FIELD(L2_ISTE, HWU, 9, 2)
-FIELD(L2_ISTE, PRIORITY, 11, 5)
-FIELD(L2_ISTE, IAFFID, 16, 16)
-
-/*
- * Format used for gicv5_request_config() return value, which matches
- * the ICC_ICSR_EL1 bit layout.
- */
-FIELD(ICSR, F, 0, 1)
-FIELD(ICSR, ENABLED, 1, 1)
-FIELD(ICSR, PENDING, 2, 1)
-FIELD(ICSR, IRM, 3, 1)
-FIELD(ICSR, ACTIVE, 4, 1)
-FIELD(ICSR, HM, 5, 1)
-FIELD(ICSR, PRIORITY, 11, 5)
-FIELD(ICSR, IAFFID, 32, 16)
 
 #define IRS_DEVARCH_VALUE ((0x23b << 31) | (0x1 << 20) | 0x5a19)
 
diff --git a/include/hw/intc/arm_gicv5_regs.h b/include/hw/intc/arm_gicv5_regs.h
new file mode 100644
index 00000000000..275fee315b5
--- /dev/null
+++ b/include/hw/intc/arm_gicv5_regs.h
@@ -0,0 +1,286 @@
+/*
+ * ARM GICv5 emulation: Interrupt Routing Service (IRS) registers
+ *
+ * Copyright (c) 2025 Linaro Limited
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This file has definitions of IRS register layouts and
+ * in-guest-memory data structures, that shouldn't be needed
+ * outside the IRS implementation.
+ */
+
+#ifndef HW_INTC_ARM_GICV5_REGS_H
+#define HW_INTC_ARM_GICV5_REGS_H
+
+REG32(IRS_IDR0, 0x0)
+    FIELD(IRS_IDR0, INT_DOM, 0, 2)
+    FIELD(IRS_IDR0, PA_RANGE, 2, 4)
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
+REG32(IRS_IDREGS, 0xffd0)
+REG32(IRS_DEVARCH, 0xffbc)
+
+FIELD(L1_ISTE, VALID, 0, 1)
+FIELD(L1_ISTE, L2_ADDR, 12, 44)
+
+FIELD(L2_ISTE, PENDING, 0, 1)
+FIELD(L2_ISTE, ACTIVE, 1, 1)
+FIELD(L2_ISTE, HM, 2, 1)
+FIELD(L2_ISTE, ENABLE, 3, 1)
+FIELD(L2_ISTE, IRM, 4, 1)
+FIELD(L2_ISTE, HWU, 9, 2)
+FIELD(L2_ISTE, PRIORITY, 11, 5)
+FIELD(L2_ISTE, IAFFID, 16, 16)
+
+/*
+ * Format used for gicv5_request_config() return value, which matches
+ * the ICC_ICSR_EL1 bit layout.
+ */
+FIELD(ICSR, F, 0, 1)
+FIELD(ICSR, ENABLED, 1, 1)
+FIELD(ICSR, PENDING, 2, 1)
+FIELD(ICSR, IRM, 3, 1)
+FIELD(ICSR, ACTIVE, 4, 1)
+FIELD(ICSR, HM, 5, 1)
+FIELD(ICSR, PRIORITY, 11, 5)
+FIELD(ICSR, IAFFID, 32, 16)
+
+#endif
-- 
2.43.0


