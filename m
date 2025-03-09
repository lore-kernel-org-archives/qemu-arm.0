Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp606554njc;
        Sun, 9 Mar 2025 06:53:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3lR4Rs+4oQKi/srBsPC4Awm9IlzMj0mOZBL90CiM7YCjxQmnyJ7IJem9pPKiBE02k3XTO7ldfghrGYQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGPglfUCEhBRmSaeIx2D5cV3WzgDTl32ob9Ql5NmRyZ9ddOgxMWD5CytYjQR4Zctm99ONOH
X-Received: by 2002:a05:6214:500f:b0:6e6:6c7f:111a with SMTP id 6a1803df08f44-6e9007022f2mr102517426d6.40.1741528402412;
        Sun, 09 Mar 2025 06:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528402; cv=none;
        d=google.com; s=arc-20240605;
        b=iTzdoptnL2pO9ZwtJKPTThigxG2YNgYwdCqsoLbVDNSGTZ3ERVIg/QE5+ckf0Nz2Vc
         KsBiUc5Zbsmx6icyTA/Xm1CUFQcWXaqf7/6uJG+jRRNiNidmZMvkPcWysFO6eP9jH3f0
         khSDs+cMdZSLXK4Vw55WBg6sPoViTNZWCeobzAwMK0vKBj0AiM38ny0XT578B44gNwMF
         qrhH3uVBKOGbGrRBAosyDqBoQZL6hGJkW1VuMyFPjxEN4j6KiRpvWE3lS3X5JRHnaB5u
         wf6AeZ4YrFxfxTt6nt297hGiKNWQZU8er0ReAfOjdSqJ8FDf/5rLJACS7D2rPZRWmwZI
         TEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CN2CVZA9vvPoGf0w4k/HObD/a/RFgyk/5y0FTL6mAn8=;
        fh=gIu7G1JN70NCpiHAwj66qqryR8wRCqauvqmhj52y0eQ=;
        b=CTOlrM94Fz7zPJUerp2rwg6qr3idAlRl4p0T7QZjfRg9UxfoPBO6T73SjXfQBIgjq9
         XSl1nYEL8Ib/C8g+cla+lmO2yWySrqnFn+li/SLYCXV4Ceb9J+NcGrvknCGgyMzbcsPS
         YMt6B3tEYxZmkiEM3B+SoJk+PlewKYExfoib/Px7DS2cJlAzC39/rBU4WJZ/T/yvimS/
         hAavGQpRzuOkukBdEWp8MmDxTFS/nwf4NzKV8yvQJX451N+r7kyv5tWDa0AYBKgviRg8
         orwmhi/ocddLBWoV/Cag3DSPUsGqafVgurEmqMMRCYcCqqec70e9KwXIJmvDyMsL3L7c
         opXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P06a1uRt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f71610bdsi73329756d6.242.2025.03.09.06.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P06a1uRt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1trH5C-0000Px-Pq; Sun, 09 Mar 2025 09:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4w-0008Nv-7x
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4t-0002oK-Ae
 for qemu-devel@nongnu.org; Sun, 09 Mar 2025 09:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CN2CVZA9vvPoGf0w4k/HObD/a/RFgyk/5y0FTL6mAn8=;
 b=P06a1uRtkJ54R1MSn23OnRswjWbhl+Pa2lNkealadY8RwS1U6WEDJJkSWW/xlL4oSN5Izm
 +rjR9U9VvLfyNKKIUx+ZxsOqTDYr3ExFZWm/1ddfX35S5+qbX4IGup9Wz8WqyaAcC1dh0U
 o8N8Eg3JjXy/9o7yyQkf/S591/13S1c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-BgOBGcezPEev7MiCKF4E1Q-1; Sun,
 09 Mar 2025 09:52:20 -0400
X-MC-Unique: BgOBGcezPEev7MiCKF4E1Q-1
X-Mimecast-MFC-AGG-ID: BgOBGcezPEev7MiCKF4E1Q_1741528339
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8D3EF195608A; Sun,  9 Mar 2025 13:52:19 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B13DE1956094; Sun,  9 Mar 2025 13:52:17 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Nabih Estefan <nabihestefan@google.com>
Subject: [PULL 17/46] hw/arm/aspeed_ast27x0.c Fix boot issue for AST2700
Date: Sun,  9 Mar 2025 14:51:01 +0100
Message-ID: <20250309135130.545764-18-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3oQ8PJykTZmK

From: Jamin Lin <jamin_lin@aspeedtech.com>

Currently, ASPEED_DEV_SPI_BOOT is set to "0x400000000", which is the DRAM start
address, and the QEMU loader is used to load the U-Boot binary into this address.

However, if users want to install FMC flash contents as a boot ROM, the DRAM
address 0x400000000 would be overwritten with Boot ROM data. This causes the
AST2700 to fail to boot because the U-Boot data becomes incorrect.

To fix this, change the ASPEED_DEV_SPI_BOOT address to "0x100000000", which is
the FMC0 memory-mapped start address in the AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
Link: https://lore.kernel.org/qemu-devel/20250304064710.2128993-7-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 4cee6ddc0b57..f14d2ea1753d 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -24,7 +24,7 @@
 #include "qemu/log.h"
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
-    [ASPEED_DEV_SPI_BOOT]  =  0x400000000,
+    [ASPEED_DEV_SPI_BOOT]  =  0x100000000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
     [ASPEED_DEV_SDMC]      =  0x12C00000,
     [ASPEED_DEV_SCU]       =  0x12C02000,
-- 
2.48.1

