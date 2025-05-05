Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2306461njj;
        Mon, 5 May 2025 02:11:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCCUMKUtX+SjITUosr5NdpYuxqMts3flK8PKpobMoS0p+fB6NCb1t+YtnA3fEayD0+YXj1mz+jy/KkRg==@linaro.org
X-Google-Smtp-Source: AGHT+IHTGTtXd/cfy9AO62hJf+1CPhwwMsYWB7wYJKgaKB6lT/Ql1wWa36fJXiS+BLcsSxkCif8Y
X-Received: by 2002:a05:6000:178f:b0:3a0:8033:1e3a with SMTP id ffacd0b85a97d-3a09cea71famr5837293f8f.2.1746436276123;
        Mon, 05 May 2025 02:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436276; cv=none;
        d=google.com; s=arc-20240605;
        b=iPwCxAGfr6G5uHLVET02LKR2oqIdxOeoUMYdnRx9dSLwC5cMeGKfBlH+5x5g9oPRm8
         fpGLbZU8QNwBvR8nHlfvV/SK3HRC8pbWlVPrk4W7Vh8UJjklCRbJNQ+I9Fa1CxcGDbz6
         NF7DlJwbUio6r3T4rtlhgQHUj/Koci4k2Ppcwe9sV5msSIGnfC8LYtbQkfEDhBKr5VHi
         ri+TaaeaXZkFUlveoP8IcBLCo6rPgQzBtYex6FiLMf1oA7vwgrZRW9skUz9RsvJgQAPA
         IGIwj7bmQUtIdlvsIwGVSH6hzxyM8XXzp1/P1hIcOXqZDy9AfdupyXyTi0dy2Zj6hUwf
         uSig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZU+rrdM8D261lALuggGMiOwtX+mH1c1ZZ8492BsZ2M8=;
        fh=gIu7G1JN70NCpiHAwj66qqryR8wRCqauvqmhj52y0eQ=;
        b=GsK767+IqbnzoUblMSuG46oHQANry8Voo7ufHIQRipFH2D4F+gnCFk1pNcfyk0qmtc
         RYO5p7oFwQtPeNWtNuBjqyaYtx56wm6lOmFwoDlc68hFuErV3yXjMg/6mTVSrtgEr6Bi
         /M21b59mLuxy9r3HUWUFkFG6rsUxsuaX+mqb7FD/6Pp9j2bYrXuAo188o7oE8q/Il4l0
         rATBsgVxmPP/OsJnvPSEEQ+qB0BNdCZwHeHKTsQX47fzaFN5nLzegEz10LsFOn/513tH
         QxVwPq9UGWh/6NMgQr4BUoAFB7YQLaRZ7923/hEfupjt2QHT5AuX8fm1O928DFh8d1yf
         GutA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KsZxV8fE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099afbdd2si4871199f8f.355.2025.05.05.02.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:11:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KsZxV8fE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBrop-0001OF-LP; Mon, 05 May 2025 05:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrmu-0006ID-Sh
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:07:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrms-0006E3-FB
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZU+rrdM8D261lALuggGMiOwtX+mH1c1ZZ8492BsZ2M8=;
 b=KsZxV8fE+SchNbj4VSO/XAP+8QQVRktos2j/MmLk+mVL1qOwYpvPB/TQ8WahdvM+Pmfcgk
 Cz9mLu67FOK1O1YqHQmwgquVnCIvZMh57yd398Z9/4koMXSYn7EslZ3zqdM2bbvifQJhru
 dHMy00yJr8Jr08xV5wqQ3A5Ug//IFZg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-53-wBkS5W-KMBu1oko-JylZ-g-1; Mon,
 05 May 2025 05:06:56 -0400
X-MC-Unique: wBkS5W-KMBu1oko-JylZ-g-1
X-Mimecast-MFC-AGG-ID: wBkS5W-KMBu1oko-JylZ-g_1746436015
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3CA7F19560AE; Mon,  5 May 2025 09:06:55 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 56A2230002C5; Mon,  5 May 2025 09:06:53 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Nabih Estefan <nabihestefan@google.com>
Subject: [PULL 06/23] hw/arm/aspeed_ast27x0: Rename variable sram_name to name
 in ast2700 realize
Date: Mon,  5 May 2025 11:06:18 +0200
Message-ID: <20250505090635.778785-7-clg@redhat.com>
In-Reply-To: <20250505090635.778785-1-clg@redhat.com>
References: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 3EoRB/03LbY9

From: Jamin Lin <jamin_lin@aspeedtech.com>

The variable "sram_name" was only used for naming the SRAM memory region.
Rename it to "name" for consistency with similar code and avoid unnecessary
new local variable declarations.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
Link: https://lore.kernel.org/qemu-devel/20250423072350.541742-2-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index ea4a611b9068..2e21c3a98fa0 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -592,7 +592,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     AspeedINTCClass *ic = ASPEED_INTC_GET_CLASS(&a->intc[0]);
     AspeedINTCClass *icio = ASPEED_INTC_GET_CLASS(&a->intc[1]);
-    g_autofree char *sram_name = NULL;
+    g_autofree char *name = NULL;
     qemu_irq irq;
 
     /* Default boot region (SPI memory or ROMs) */
@@ -664,9 +664,9 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu_index);
-    if (!memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size,
-                                 errp)) {
+    name = g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu_index);
+    if (!memory_region_init_ram(&s->sram, OBJECT(s), name, sc->sram_size,
+                                errp)) {
         return;
     }
     memory_region_add_subregion(s->memory,
-- 
2.49.0

