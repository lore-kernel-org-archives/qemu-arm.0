Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2858210njd;
        Wed, 23 Apr 2025 00:24:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjEYDZsOU+jVNJqwnQr7Enj9EwdoK9XbunwbzC83SHdZtxM87Nwph6RVW9Al0tkvD3bpVqV/QlGFtUAw==@linaro.org
X-Google-Smtp-Source: AGHT+IH9QprfQbyLxdJLJo/XaTxrGkb/cu6V+EyeKM7CCnxhTjeBXpHtebTQDM8m2RDqXXtoZ5nV
X-Received: by 2002:a05:622a:11c3:b0:477:6e32:aae2 with SMTP id d75a77b69052e-47d1c74644emr29966311cf.0.1745393084519;
        Wed, 23 Apr 2025 00:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745393084; cv=none;
        d=google.com; s=arc-20240605;
        b=XG5ol0J/dxudQrLUMb9WqkO8Y0LCkGisvVprvN3MgyHY/COf3jWjvtLAyoylawy5gP
         gugzZMxkQzw2KnI260gtrXSldnChSxp9y/0uD+WBbWUlyOKxapRI/D3CYOdmDMC9Mgxy
         YfH7ygxDIMSAdezJlbiv4MCzkGP/Ikjwy/XM/Yf7vSGgqoadWjVZK3vqM5/MiAHekdTQ
         lBqZULIKi5+HrBqNmelFwg0vCGzKNBARu5fs/wWfoYqkxYa6LDFuikBPV60BocpqW5hE
         efRIT/7ok/Jo0jDSY9+NY1Sdd6raDvcl1KEYoMtDS85EZipaO+bUOSX3fPkRWYpNRzId
         qDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=V/dhotLayjhs6TECu6ACV1TspD0+QqHhRBAcDl7ZH+k=;
        fh=mYa7DW7+LcAerod9KMiSdtH0/D1NqzuZXE0uoAi0+1E=;
        b=JVPQbsFu3hFAfZ3pZP+3HStpkKjZ8Wc0JtxTuOrrsk/hMFBPw0rpNklVUuQ2t5QC1C
         Yjr0vz4SGoSlEuda9HnNZilGa4CkUFzj6Jb1dhak0HUMyA3E6r0SjyC3IRk31nYfZmKb
         6zthqJnOaqNLIbXXRv7C+nKWdVt4oX1WipFWGQ9Dn/mVtm6QBKIbn9iyyoITODWGMsrn
         w0UNL/JhNq6PBSj+n2w0ZCXwfEKfZIr8hgwNS4Qt5ep0avFuCIHXm6Zio9P3OtXAj8K8
         gDov7sCtDgSW/6M+hLfqMS4Ho1NIM/kX5tnERrrkHeEjeZfmSDMOOt5igSgBd1aHlKRe
         +vkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9c2bd1dsi132303791cf.184.2025.04.23.00.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 00:24:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7USl-0002ac-Rn; Wed, 23 Apr 2025 03:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7USj-0002a9-JT; Wed, 23 Apr 2025 03:24:05 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7USh-0001IR-Sm; Wed, 23 Apr 2025 03:24:05 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Apr
 2025 15:23:51 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 23 Apr 2025 15:23:51 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v5 01/11] hw/arm/aspeed_ast27x0: Rename variable sram_name to
 name in ast2700 realize
Date: Wed, 23 Apr 2025 15:23:37 +0800
Message-ID: <20250423072350.541742-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
References: <20250423072350.541742-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a5SBCEmlAHd7

The variable "sram_name" was only used for naming the SRAM memory region.
Rename it to "name" for consistency with similar code and avoid unnecessary
new local variable declarations.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
---
 hw/arm/aspeed_ast27x0.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index dce7255a2c..b05ed75ff4 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -577,7 +577,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     AspeedINTCClass *ic = ASPEED_INTC_GET_CLASS(&a->intc[0]);
     AspeedINTCClass *icio = ASPEED_INTC_GET_CLASS(&a->intc[1]);
-    g_autofree char *sram_name = NULL;
+    g_autofree char *name = NULL;
     qemu_irq irq;
 
     /* Default boot region (SPI memory or ROMs) */
@@ -649,9 +649,9 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
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
2.43.0

