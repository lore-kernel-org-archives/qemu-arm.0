Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp31639ejb;
        Wed, 12 Jun 2024 18:30:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSTHgfjjnVwm8mxleFLvkTm2CrBlSc12Td5vQi3V6JZzXpuIPBR6z72MqM8v6bSnX+X8VNKuYyUgiatU5ItfrGGse/a+yJ
X-Google-Smtp-Source: AGHT+IG9pDDIiRE/rhrHeQZ5nzbtRTppOBpsGad5DHEPpGI02cesxHlA8FfuTIMkaLh1BZn3r08Y
X-Received: by 2002:a05:620a:2448:b0:795:5c5e:54a8 with SMTP id af79cd13be357-797f6062d11mr375949685a.39.1718242216008;
        Wed, 12 Jun 2024 18:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718242215; cv=none;
        d=google.com; s=arc-20160816;
        b=bYkHIRAfLNhNhZ4Wwej/EjOe+KAb/Xjvks/wmG1cDBX3c13p5G0WIxtCZ7CAK5bhWf
         aZmLHNa0JdquGtLrRI41eZBszhdWtQmDwvzAEc2jTWxOiyqFxty8e1J1pToiI/9L2EEj
         0KS7QnLG8uxjUYd2fhREZSKGxoOPeauML6ltM4hyOrGprwGrJvcJXfyE7wCu8GLWlvNP
         1eZqjW8WejZ1nRe9Bklh49fZ17UgcQPW3fHygsnyV1OSFk4UX2wYdek36uxfwcppPRIV
         7v6/X7bAIiHu52BnCU1CyMU/2A1pCA76CP4hXLlHcxc8FEiOQ2nNLLPN7StM5ioDfAFf
         Gxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sx46nwLh6y0cuModMm/z+J15eC8XVVvw74Hv/Q7DVvE=;
        fh=2weFPmyWofyV4D7aLuBFBjoirjPUYw0d2hjIKrIx3Y8=;
        b=KJyiC47Q1m7m4qmLrIhwr2SNMKLIohXhVXaGHEFbWpOVV8oCNMSmNsBVlemeOn9QvC
         E+RgK+WNIRmIk09x065+49Nr7DJA6QlOMEAhqq3SM0NvjVMED/NsqXFJstuKJwkkylmP
         nCD+SAMs0u+dC/N+TzhPx0e+Vn0ldxJkbmfafEF/iwA1r5D6d3m3fFgp8SQMEDHR+WMD
         g6xtTa96vXaB/gEMwdmCMQulpZwRMkLLjx5ZfmSVYU/3dbG71FFUk2WyN6n5ZR/xgby4
         5oroSeSdR0lfRHBJtcW4JWJJYMOSlHVK8RSOYmV0iYGpfERNlhoJ28MtX8XZhqKmrwPx
         2wyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b="nvLu/oXR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798ab8ffc7bsi31990285a.308.2024.06.12.18.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 18:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b="nvLu/oXR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHZHw-0001v7-57; Wed, 12 Jun 2024 21:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHu-0001uY-Gr
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 21:30:02 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHs-0008AC-O9
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 21:30:02 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1f6f031549bso4995285ad.3
 for <qemu-arm@nongnu.org>; Wed, 12 Jun 2024 18:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718242199; x=1718846999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sx46nwLh6y0cuModMm/z+J15eC8XVVvw74Hv/Q7DVvE=;
 b=nvLu/oXRvOge2DO8OB33m9hIICKFPnQWR+EVddR5PP5o4i6IzEDH0gjft0N1rB7qDF
 lPl2jn+3bt6yyTmlR2pjrqVjH01/4remEvOOKsI6ofvmqJXlWuEv+En1ipx/ulPG2mxe
 s1PWJ7kYXwW5sskF1bhSAU8gqfseUK0h6PTujmm5v3C41PTCl85cQfhttTNJfnu4Kch2
 rS9gwt0SlZK56a1EHCE2EK4mAz3DOmORN4K6girzYEHlEi/RXmpi+ItkT1Vhxze2PgBt
 MtPxSKyCPe+wKBkpYRuQ2zZ0YMuWGjS7WHn7oLcwM56BvnwcFW+kHqPKvM6K7yh5PnYc
 urhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718242199; x=1718846999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sx46nwLh6y0cuModMm/z+J15eC8XVVvw74Hv/Q7DVvE=;
 b=TlQ6FjX+r/roAgPsHja/Wuu0Y2AGns+xlBXGLyipdnSaALdoMxHi4zSBQm3+ZcWfzd
 5u9VoWXmK1/ndzWNkDd5BvaX8zPwnjTnOCFoUJUqi2t0T9QVE6I7D3oqxYAV3RwWIJGm
 3YODRSciP1sATmKWbXLJWd25eCT6mgDZDuzBv7zDg/R2LKTbVUq47fmczvbMhTAQXcw9
 jmrPE/CvUwxpP8AtZ4Xt5VcoFhN4hQobdJsiRo+pNGdf06xFp0Twg83qdC+aoqccEPXw
 8E1dP3HFn8d/mhzhasZcYVy4YEW4myW1Hsd+RFls9Bxq7PkWMVbrAr3k+djWXTZb6i4e
 K/Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPJ9QbHemuczcO3oPVtVCQskGpsq4KPCJdSShM+4dRapAWg3DWFcR/9EAx67UXfv8tvwexLn46VwLmLXLi/+iFOCJB
X-Gm-Message-State: AOJu0YwQURlQJqwrDaiqBvHaW5sGItrETksj7dPkI6yddyErMTkUT24Z
 pIIXf8OBfCUFxXzJHABEexnd+fSIaPfgSVGFeRhsB9pFb8vZER/Fbr3sKP20RaE=
X-Received: by 2002:a17:902:ec83:b0:1f8:3639:653e with SMTP id
 d9443c01a7336-1f83b6f31e0mr34795585ad.45.1718242199422; 
 Wed, 12 Jun 2024 18:29:59 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e723fasm1264155ad.97.2024.06.12.18.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 18:29:59 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PATCH v3 2/3] hw/dma: Add a trace log for a description loading
 failure
Date: Thu, 13 Jun 2024 09:35:00 +0800
Message-Id: <20240613013501.426905-3-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613013501.426905-1-fea.wang@sifive.com>
References: <20240613013501.426905-1-fea.wang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=fea.wang@sifive.com; helo=mail-pl1-x631.google.com
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
X-TUID: 1PEalqajYivj

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
index 3c47df54e4..4c09790f9a 100644
--- a/hw/dma/trace-events
+++ b/hw/dma/trace-events
@@ -44,3 +44,6 @@ pl330_debug_exec_stall(void) "stall of debug instruction not implemented"
 pl330_iomem_write(uint32_t offset, uint32_t value) "addr: 0x%08"PRIx32" data: 0x%08"PRIx32
 pl330_iomem_write_clr(int i) "event interrupt lowered %d"
 pl330_iomem_read(uint32_t addr, uint32_t data) "addr: 0x%08"PRIx32" data: 0x%08"PRIx32
+
+# xilinx_axidma.c
+xilinx_axidma_loading_desc_fail(uint32_t res) "error:%u"
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

