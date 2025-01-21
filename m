Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6494640njn;
        Mon, 20 Jan 2025 23:06:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU2sIG42wU20uVi98TufkO+2aWGO3Tnpt1sT8F4eQnh2iymrGJ7ddsYca+AYTZon3NVJ1V7zJbP3LA8bw==@linaro.org
X-Google-Smtp-Source: AGHT+IHyObILZIm6S9fv8LwGXNehI8cLy3SwnBrFHJv7CmtxrjKT2xQM/C/w+swpGJuecpEuW1qc
X-Received: by 2002:a05:6214:3b81:b0:6d8:8667:c6ca with SMTP id 6a1803df08f44-6e1b220c59cmr294557986d6.32.1737443172757;
        Mon, 20 Jan 2025 23:06:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737443172; cv=none;
        d=google.com; s=arc-20240605;
        b=b0ye4LFkCwH8b4cSwz4GAxZLJF64+ArXyDmyilUTyBXVBQcntqBtLwEjV/iIeLm200
         GvhTiQ8R1sVjTaZDwmJGkUIgfF+E0Z9C7I1zpbZhlFTKXgpRNypgByY6p2mwTrWN/i4J
         tqusOhqdJFv2qi0KIbT745syqXFZXhcPmHPM5hFcSra2ebAZ5RqZFyeqbEac5LiUMWzo
         ArFUog/xonsvQwTIdf8fhSZq2DXDVXsQ9OXUfKzZxPND5nPf6+jIfZHrh7ESEQLs3oBD
         MYygF1fmyxpuEHUolZjy0tpl6TJAY7iZpw5hhRlZU4aG9n2yHJwdxWNSPoCzLINGdDEk
         qc5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6c7LFV0LcNcNB6Uxr4We3DiptxTypiRoGIb5nXSreks=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=Bn520igIfya9Ca4SauScjCDwQONLQWmqHwllvfAkMdty/YXyujtLqARhVpe287zFyz
         ldxgLP02WZm2Q5J5cErTcfjTgt43+taWTDQ8PrvShELeIXrb2zJTzDWet88UitrfDahj
         4YzqNPIYNJVbLok5YQv9VuCkxC1qBph7apK2c0pJwc4r1inB6VW0AGqMMJRO10VGaD5w
         0kqTF9fYjDn3ZUWAiFOZMwSEv/O4R2UMyzVqkG5IJhWGgx1LVg1A81tZSnP2eORiqroh
         4pOQdDMSYcX85nMiVmRxLlimRKvmWX6+/whOoPByzKQMW2uAYMpaR0fLFuWPu5PMIRnB
         AUhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afcee191si119002486d6.316.2025.01.20.23.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 23:06:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ta8KD-00076i-NE; Tue, 21 Jan 2025 02:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8KB-00071U-VP; Tue, 21 Jan 2025 02:05:24 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8KA-0001eA-Fm; Tue, 21 Jan 2025 02:05:23 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 21 Jan
 2025 15:04:28 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 21 Jan 2025 15:04:28 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 11/18] hw/misc/aspeed_scu: Add Support for AST2700/AST2750
 A1 Silicon Revisions
Date: Tue, 21 Jan 2025 15:04:17 +0800
Message-ID: <20250121070424.2465942-12-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: O9GrCk/+tQzA

Added new definitions for AST2700_A1_SILICON_REV and AST2750_A1_SILICON_REV to
identify the A1 silicon revisions.

Update "aspeed_ast2700_scu_reset" to set the silicon_rev field in the SCU
registers.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_scu.c         | 3 +++
 include/hw/misc/aspeed_scu.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index bac1441b06..f049a9fd96 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -559,6 +559,8 @@ static uint32_t aspeed_silicon_revs[] = {
     AST2700_A0_SILICON_REV,
     AST2720_A0_SILICON_REV,
     AST2750_A0_SILICON_REV,
+    AST2700_A1_SILICON_REV,
+    AST2750_A1_SILICON_REV,
 };
 
 bool is_supported_silicon_rev(uint32_t silicon_rev)
@@ -938,6 +940,7 @@ static void aspeed_ast2700_scu_reset(DeviceState *dev)
     AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(dev);
 
     memcpy(s->regs, asc->resets, asc->nr_regs * 4);
+    s->regs[AST2700_SILICON_REV] = s->silicon_rev;
 }
 
 static void aspeed_2700_scu_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 356be95e45..684b48b722 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -54,6 +54,8 @@ struct AspeedSCUState {
 #define AST2700_A0_SILICON_REV   0x06000103U
 #define AST2720_A0_SILICON_REV   0x06000203U
 #define AST2750_A0_SILICON_REV   0x06000003U
+#define AST2700_A1_SILICON_REV   0x06010103U
+#define AST2750_A1_SILICON_REV   0x06010003U
 
 #define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) == 0x04)
 
-- 
2.34.1

