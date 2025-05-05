Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2306376njj;
        Mon, 5 May 2025 02:11:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEgls+qf9rp/1IeQ1Zp5PlqEzPhqeeH0EDZ1B/CdZH2KosikdvSQFd82fMbBGnh2m0M8gXfOwpmcmMBA==@linaro.org
X-Google-Smtp-Source: AGHT+IEXuN7uVv11XZQ+AW9RGHwkap2w04KwbgPEHDbkFJvquTjhuq0I5I1/FxqB3l218aEQxoaT
X-Received: by 2002:a5d:4349:0:b0:3a0:9dfb:b001 with SMTP id ffacd0b85a97d-3a09fdecb01mr3236509f8f.58.1746436263632;
        Mon, 05 May 2025 02:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436263; cv=none;
        d=google.com; s=arc-20240605;
        b=SdudQ1Um/8/h9GSCuUnz8f5pBgyAt7IQytX/2jiaB/DHfjwrdc9+sMPE8Ns1bhpjWr
         jh/1kKLw3rYRb+RKY+fNm+T4VQ8NYUDuHute41VaI5SAdoZ14ilvJGgOMgQe/tFvR9Rb
         iOqIzbEXeyf46nInkhh9spUoL0JNRr6x1pkiI9P3t5pSyIXHAK+8rlpNEqAz5z+Wn0GF
         Emx7JRN25H1ikxGLLMkAzxxmiY3ARomFXYeVfVSK2oEKpsWTnPulCiRLLI8tlaNKR3SF
         tfQaMga1kBjbDjrYAZOIowt/07WYBiDcK1QX2PiGjFganYp9imAVzKRuFk79IwijPWAU
         z66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JMvixnTeIGRPnX6DPfiITJ+OozTCTJDp1tYcr2ncX7g=;
        fh=T0srg4NBQRu22oFjMK4XHQySpCI66Qi9dZIWpS9x1iM=;
        b=TBYYldGcH3mToU9RWGk8gLWEJhrzjg5kSIIdjliUWCK5FGa3NAuaL0p6jFZi7YzlLZ
         WiBgvm9N99vH0GRJNAuQOTULr1VgnMqzb3oVCzXWFUwCV5bLI87xw91o+QO7CFqZva5m
         WCmuhZRDXYX4MljRLPD30eH07aIuQS68Xpab3AsBqRh0c9BJPdi8lxqNKpm/NlwJSSaG
         aYzopeG3LFgkJtNq903fiHL9W+rLlve3cl89ibNXJoQVNQSuyjYNYnRJ3RLXug+nB1+6
         fmoxZFy9y6g6MuYAdHw6mzPFXBbVhThD6/VleJAv7T7a2i1z66XfyyxK+Hv5rTb8Yo9i
         iK+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Zb9qgX3/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-441bf6c31absi46745705e9.115.2025.05.05.02.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Zb9qgX3/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uBrpj-0001hh-5n; Mon, 05 May 2025 05:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrnC-0007Im-OX
 for qemu-devel@nongnu.org; Mon, 05 May 2025 05:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrn9-0006Ih-Ia
 for qemu-devel@nongnu.org; Mon, 05 May 2025 05:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JMvixnTeIGRPnX6DPfiITJ+OozTCTJDp1tYcr2ncX7g=;
 b=Zb9qgX3/5M91jemjGI/dxXvymkbOSs8SiFgh11FPTuTdNjRf6oLU+KslTSVrKYUh/YHJTx
 bPUMUZiCvbDq9/+xlTEzlfPwxx80XGn8TPwEZUu4ka7VeM0wIfPraG6DNqIBS1YQ+JanUD
 nqDZjjazXN9n5vFmetgjR6H7xkj6oPg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373--GQyOjMTM8KaNvMSBDEv5Q-1; Mon,
 05 May 2025 05:07:11 -0400
X-MC-Unique: -GQyOjMTM8KaNvMSBDEv5Q-1
X-Mimecast-MFC-AGG-ID: -GQyOjMTM8KaNvMSBDEv5Q_1746436030
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A645E1800446; Mon,  5 May 2025 09:07:10 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C01AB30001A2; Mon,  5 May 2025 09:07:08 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Nabih Estefan <nabihestefan@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 10/23] hw/arm/aspeed_ast27x0 Introduce vbootrom memory region
Date: Mon,  5 May 2025 11:06:22 +0200
Message-ID: <20250505090635.778785-11-clg@redhat.com>
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z6F3vs3i5m29

From: Jamin Lin <jamin_lin@aspeedtech.com>

Introduce a new vbootrom memory region. The region is mapped at address
"0x00000000" and has a size of 128KB, identical to the SRAM region size.
This memory region is intended for loading a vbootrom image file as part of the
boot process.

The vbootrom registered in the SoC's address space using the ASPEED_DEV_VBOOTROM
index.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250424075135.3715128-2-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/arm/aspeed_soc.h | 2 ++
 hw/arm/aspeed_ast27x0.c     | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index c1e80c8908b3..4dcb1010dc28 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -59,6 +59,7 @@ struct AspeedSoCState {
     MemoryRegion sram;
     MemoryRegion spi_boot_container;
     MemoryRegion spi_boot;
+    MemoryRegion vbootrom;
     AddressSpace dram_as;
     AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
@@ -169,6 +170,7 @@ struct AspeedSoCClass {
 const char *aspeed_soc_cpu_type(AspeedSoCClass *sc);
 
 enum {
+    ASPEED_DEV_VBOOTROM,
     ASPEED_DEV_SPI_BOOT,
     ASPEED_DEV_IOMEM,
     ASPEED_DEV_UART0,
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 2e21c3a98fa0..a289e65e495d 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -24,6 +24,7 @@
 #include "qemu/log.h"
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
+    [ASPEED_DEV_VBOOTROM]  =  0x00000000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
     [ASPEED_DEV_EHCI1]     =  0x12061000,
     [ASPEED_DEV_EHCI2]     =  0x12063000,
@@ -672,6 +673,14 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(s->memory,
                                 sc->memmap[ASPEED_DEV_SRAM], &s->sram);
 
+    /* VBOOTROM */
+    if (!memory_region_init_ram(&s->vbootrom, OBJECT(s), "aspeed.vbootrom",
+                                0x20000, errp)) {
+        return;
+    }
+    memory_region_add_subregion(s->memory,
+                                sc->memmap[ASPEED_DEV_VBOOTROM], &s->vbootrom);
+
     /* SCU */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
         return;
-- 
2.49.0

