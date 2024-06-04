Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2752594ejs;
        Tue, 4 Jun 2024 00:10:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSYpEfKp6AYisyD9V0JVLaloGoQAlth/yrTqU/VxyNsLHtArj8IEz1WDMeXyRx2kmseBK+DkxdpWOP/SCweZxphkDAKUzH
X-Google-Smtp-Source: AGHT+IHb55iiP4wsoeWFblsepNWgw+wiotbtOtblLhojE5NsDMFBhqEQTTWZDlSe5stST4adQk0K
X-Received: by 2002:a05:6214:c4f:b0:6ab:9c77:c32c with SMTP id 6a1803df08f44-6aff728c2f9mr30713036d6.10.1717485048356;
        Tue, 04 Jun 2024 00:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717485048; cv=none;
        d=google.com; s=arc-20160816;
        b=LrTLVmTluaSsFX6XoAZPubDQK+eJOmLlR/VFS2QzddCQgAptF345RIuJWU2t2WMU2h
         EumQhcPg3jEcGNIvngUmA6Cs41qp1lj7sgSkUAb/5kHH9XBhFvUTNsC/6h6Nwf8m7jMW
         oRN68RfPKY2SUpgD9hnzyl3mBlbLyF5P7w6JX+T4VCT+J9saJlCfaf4hJIoVZSGBd4By
         bh+JZeayREPi3K3+QUIVF9qWfjxlx0Bt2dt5iplhcAk4+xD4Zt+Wv8I+qAGSShGlYbJB
         pUXpCwfDqDfc53WFXCdFKk4W1FhfhyfYmWsmnGwfA6Og+46GoMIVdBvWa1rEYzNfZmFx
         HeOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Sbuv/MOyNIQ6l5m1LicrtKm3mCmCzjFzQu45Z/Y7Z5s=;
        fh=bG9AHmHjh8g6GgfcKM7lGj90naeFaNcgJ1MLjJrdI8g=;
        b=fKkm+ZANnfHIn75tl9eJtrBhAy1dhQoT/5y1mG4R13Ab/OFNKAaHphMULlb0IDQ3mm
         isSnuilHuX8oU47ENIQ7q4sXnJHVYd8C/AR/fl6X/XbyNgLAT65pZKXN/PE91JsRpJkH
         eoHptpzBw76vhWLKTkfipIVPF/gGAjF3jEk5k6x1xm2jkJCRUUZQCSVIPMHcNiz1wgLW
         ZyIst/pdd0/S5aqKmLMOwWrzIhzeE/7sO+Iw8cFEAaKXRt6VAGQwTT9oAfT5SyxuS3WL
         +gDtdmwdu6M8voX7qDlUz6kiASJdI9P3QVrhr2Qb3f5iZ4BJhHAuJ+egwqrPlEeP+7H6
         y89Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=RXe6c3NM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b42d917si24903956d6.541.2024.06.04.00.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2024 00:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=RXe6c3NM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEOJZ-0005KI-M3; Tue, 04 Jun 2024 03:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sEOJW-0005II-B8
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:10:35 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sEOJT-0000WK-0N
 for qemu-arm@nongnu.org; Tue, 04 Jun 2024 03:10:32 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-6c702226b0aso2104260a12.1
 for <qemu-arm@nongnu.org>; Tue, 04 Jun 2024 00:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717485029; x=1718089829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sbuv/MOyNIQ6l5m1LicrtKm3mCmCzjFzQu45Z/Y7Z5s=;
 b=RXe6c3NMxVFYPDV1CKwBnPpKihEPwZQeUEjEXMMjxq0kr3flJtzg76AtVJqjv7B4J3
 zzqqDTtw/drYXK3mYOthYdahNWxEr1nRei3DFSoy2RnKf9aa0UsZctndkzoVeKc4J12F
 +CHi/nQ8CbAG1lEi8+ueCmUyrSfxppb2Hnh+dNYyBrMUbPWN6LlbK/Zq3RLbJku/7KKN
 mzEfOZC0aQ7c78BQAM017y3Sd80yf4dMwLcssYaYiISbdDO90eNkG1+3iWcklpB7XGaE
 GtCb7Aw/MmY7CA09WGIdsWitbpCPdtFK3aBgOBluX8xkHJ/owYabDUM5Onk4Gc44Iy8W
 H9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717485029; x=1718089829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sbuv/MOyNIQ6l5m1LicrtKm3mCmCzjFzQu45Z/Y7Z5s=;
 b=e9jDmfIASUWkNeZ4uZWGbgQ0qHs1F/ogiAhax2xGeRvKmVbC5Wu6HDncVAmtmO1w2D
 uJCodJWE5sJy01SBf+nss3MKJpMdbND8DSB3pklej9Az46wRK1563lcsqkxyq34VuY+9
 W9iyyOzZppIcGc1ovAxfHVxf2B8h2ew9N0++aOz1sU0nsDV3aXn8gfelnbAZnXFStNPR
 93YkmvaLJFuz0JFvQ5T2egGUt+snKn9I4pbngxllNwaxee2CZ2Vgw7tfX8zWfa9jK4Sv
 QnzSm/ekah4uXWx7+tpji6yyPiKlApNJO0hau2DrOV1CEYNmoY3hrDcwRa1AlNpo7wwY
 rgOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbBRSv4WTieWUogNHUDCkG6nPrhOGJr1hb5geb45u0D1fV6DTpFyS8ddnD6N+biKDpexkzQYUrxHrzVLWy6oy4hR2C
X-Gm-Message-State: AOJu0YzhZwgQQX2lf5maRePlrp+P6Oy6/AMsFQYSxkLbJiD7LrCz+DiX
 vfXrW9NoVYi2lwfo12U6m/HUenwLrZzOn59ouqLkp7ouYnQFV2dpS/qXm2BKltw=
X-Received: by 2002:a17:90b:4d87:b0:2c1:ad50:5e1b with SMTP id
 98e67ed59e1d1-2c2530789a2mr2691816a91.8.1717485029538; 
 Tue, 04 Jun 2024 00:10:29 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c1a775d68dsm9237943a91.6.2024.06.04.00.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 00:10:29 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v2 2/3] hw/dma: Add a trace log for a description loading
 failure
Date: Tue,  4 Jun 2024 15:15:39 +0800
Message-Id: <20240604071540.18138-3-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604071540.18138-1-fea.wang@sifive.com>
References: <20240604071540.18138-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: g5CqekVRfbcB

Due to a description loading failure, adding a trace log makes observing
the DMA behavior easy.

Signed-off-by: Fea.Wang <fea.wang@sifive.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/dma/trace-events    | 3 +++
 hw/dma/xilinx_axidma.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/hw/dma/trace-events b/hw/dma/trace-events
index 3c47df54e4..95db083be4 100644
--- a/hw/dma/trace-events
+++ b/hw/dma/trace-events
@@ -44,3 +44,6 @@ pl330_debug_exec_stall(void) "stall of debug instruction not implemented"
 pl330_iomem_write(uint32_t offset, uint32_t value) "addr: 0x%08"PRIx32" data: 0x%08"PRIx32
 pl330_iomem_write_clr(int i) "event interrupt lowered %d"
 pl330_iomem_read(uint32_t addr, uint32_t data) "addr: 0x%08"PRIx32" data: 0x%08"PRIx32
+
+# xilinx_axidma.c
+xilinx_axidma_loading_desc_fail(uint32_t res) "error:%d"
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index ad307994c2..c9cfc3169b 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -36,6 +36,7 @@
 #include "sysemu/dma.h"
 #include "hw/stream.h"
 #include "qom/object.h"
+#include "trace.h"
 
 #define D(x)
 
@@ -201,6 +202,8 @@ static MemTxResult stream_desc_load(struct Stream *s, hwaddr addr)
                                             addr, MEMTXATTRS_UNSPECIFIED,
                                             d, sizeof *d);
     if (result != MEMTX_OK) {
+        trace_xilinx_axidma_loading_desc_fail(result);
+
         if (result == MEMTX_DECODE_ERROR) {
             s->regs[R_DMASR] |= DMASR_DECERR;
         } else {
-- 
2.34.1

