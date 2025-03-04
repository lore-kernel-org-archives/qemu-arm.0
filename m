Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp3099085njb;
        Mon, 3 Mar 2025 22:48:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXX8bmlbc0Fd/vmje7veS11/Fh5Z2VzNdbXMELN2l6yYZq7F6kZ6a1lf75mX2xK7sFMdIElhddxzpJVBw==@linaro.org
X-Google-Smtp-Source: AGHT+IHTvIwivA7XMzdvxffqcwoorjaZcYEtLQM7fT3BSLpwXuhl9re1hLGJ4XGTGtT4zF6OQT4b
X-Received: by 2002:a05:6214:2462:b0:6e6:69d8:6c16 with SMTP id 6a1803df08f44-6e8a0d6d8f5mr255523176d6.35.1741070905701;
        Mon, 03 Mar 2025 22:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741070905; cv=none;
        d=google.com; s=arc-20240605;
        b=d2EVGOBO985QigRKS3acMSErFbphkh1V1KBi5QYrF8uUMLSjOajtTy8UBkdUaQ3ykX
         jI0A47KL3IljpBpwptDrZQ4Lw2KsOf/LLWjerD7SWOg4ZTcbA17XV8v1szdewy0PfosT
         C3akF7JNBI6q8LbHYNXG5x0a7W0E9zk0sLXXKlyyGh/ySyUCnszhzSK5uONEESWlEpen
         O5Vpko8utm3m1fUot24oQk+2xF0x2kvgKaedDKvRroUAH0VF2yhS+PLhTLHtWT6j3OFh
         7XihCiTVnvfgQ7IF+CBtPXFHMUfA7pGnz6y+Q8IipG/rzHPynNQJgz1RSXB4ogxLOXZS
         01uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=gifZZNsEgOVxNXjY84+V+VGSwEhozOD3P0PNfC5UxLA=;
        fh=no4a9QA/0zeIocEYrBrieE6XYIGB9KPekpO3W6wNjNE=;
        b=frlwVZ88qWGDEEk9Co/jln8o9cL+3TqVc9B+2eL+xfHwySqz+Ad93xnwvrNv2va8eR
         eSaS9i1XcCLdgNCQvN3b/udUlQtT032CU7BWfKOUte04w2b9350rISoQwb/1eLcqvjFn
         lVTaVK9Oy9wdkHv2snp56KCSNcbp0rHglx82Pse+PIdPVZhqd8beDPtdmUzrVip/L71n
         pDFlxOE9ZfgB+IqHCEhJFlTRiQrrLL/CVaDc6HAFMg8nMElW2DQvnLMbw2Uin61Z3num
         mWAAocQrCEOEWIhc5AFW01a7yvYvrsZbJ9MDYUf09I+Feaww/GFuihHaVS90Sj962Uwo
         Wl3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976e7467si103682016d6.431.2025.03.03.22.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 22:48:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tpM4P-0006bA-KC; Tue, 04 Mar 2025 01:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4L-0006aQ-U7; Tue, 04 Mar 2025 01:47:57 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tpM4J-0003IK-49; Tue, 04 Mar 2025 01:47:57 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Mar
 2025 14:47:11 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 4 Mar 2025 14:47:11 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 4/6] hw/misc/aspeed_scu: Fix the hw-strap1 cannot be set in
 the SOC layer for AST2700
Date: Tue, 4 Mar 2025 14:47:06 +0800
Message-ID: <20250304064710.2128993-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304064710.2128993-1-jamin_lin@aspeedtech.com>
References: <20250304064710.2128993-1-jamin_lin@aspeedtech.com>
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U1SCpSUkEgwx

There is one hw_strap1 register in the SCU (CPU DIE) and another hw_strap1
register in the SCUIO (IO DIE).

In the "ast2700_a0_resets" function, the hardcoded value "0x00000800" is set in
SCU hw-strap1 (CPU DIE), and in "ast2700_a0_resets_io" the hardcoded value
"0x00000504" is set in SCUIO hw-strap1 (IO DIE). Both values cannot be set via
the SOC layer.

The value of "s->hw_strap1" is set by the SOC layer via the "hw-strap1" property.
Update the "aspeed_ast2700_scu_reset" function to set the value of "s->hw_strap1"
in both the SCU and SCUIO hw-strap1 registers.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_scu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 545d004749..0581c744f1 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -910,7 +910,6 @@ static const MemoryRegionOps aspeed_ast2700_scu_ops = {
 };
 
 static const uint32_t ast2700_a0_resets[ASPEED_AST2700_SCU_NR_REGS] = {
-    [AST2700_HW_STRAP1]             = 0x00000800,
     [AST2700_HW_STRAP1_CLR]         = 0xFFF0FFF0,
     [AST2700_HW_STRAP1_LOCK]        = 0x00000FFF,
     [AST2700_HW_STRAP1_SEC1]        = 0x000000FF,
@@ -940,6 +939,7 @@ static void aspeed_ast2700_scu_reset(DeviceState *dev)
 
     memcpy(s->regs, asc->resets, asc->nr_regs * 4);
     s->regs[AST2700_SILICON_REV] = s->silicon_rev;
+    s->regs[AST2700_HW_STRAP1] = s->hw_strap1;
 }
 
 static void aspeed_2700_scu_class_init(ObjectClass *klass, void *data)
@@ -1032,7 +1032,6 @@ static const MemoryRegionOps aspeed_ast2700_scuio_ops = {
 };
 
 static const uint32_t ast2700_a0_resets_io[ASPEED_AST2700_SCU_NR_REGS] = {
-    [AST2700_HW_STRAP1]                 = 0x00000504,
     [AST2700_HW_STRAP1_CLR]             = 0xFFF0FFF0,
     [AST2700_HW_STRAP1_LOCK]            = 0x00000FFF,
     [AST2700_HW_STRAP1_SEC1]            = 0x000000FF,
-- 
2.34.1

