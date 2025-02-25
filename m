Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp242977njg;
        Tue, 25 Feb 2025 06:16:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXspOg8xJ47QfWDNQLC09hASH3oUaJBy+9ojlGadbiu444V/tBvZoRpKXTBiYUvXiaiGK5z0VdWwXcLqg==@linaro.org
X-Google-Smtp-Source: AGHT+IF2e+ClW4VkK6ynItsxe4sZWgHLFYy2kg5vXJ2+VMBFfea3MBDU6ijSKIA/Ro02eCyrqHmX
X-Received: by 2002:a05:6214:1c43:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6e87ab4709amr46732276d6.22.1740492987923;
        Tue, 25 Feb 2025 06:16:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740492987; cv=none;
        d=google.com; s=arc-20240605;
        b=T0cqJU9ucukHye5u0Wyqc+KESiFFeySmItjpJqdLpTZnus232kpZLIx5szVPHzRi86
         6LIgErHmhmZr40m1SP6DdBAO+ifIOqCpoYISgv9CyRXUF4362/pjFxkhndBLJIYTW77E
         9G8AiBX2SUX75UP0aot4Nbc/gqWCQbncxwgVH0VWEzp2dGxAW1bf/MWbO+TewYeIs5ZF
         uWrreEJAe1IaeUacAac9yLosnemF15ctu31ulPRPIobAHFvVdHLhS6bMYb5rktMh+49c
         M4Vmpv6Tk1TGiCW62KNcrSaLt9E6ao/hK9TcphLVGjnb6RA9VDDL84mhL6zkuHod97Nv
         L17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to;
        bh=V7UkulhshLQJCY9lpeRY3A7hbNYQ015oXJ9jbxK09oY=;
        fh=5JL7mqVb0xJPQxAe5ZtlV0oPd81juhKpcMs9GAwoilE=;
        b=WNu+NqzmOupAuFWPeC14Vqg50PhapNBVazKktcgk12cBSIgltN1N+X3hgSRD5/kEU9
         r1bt16V7QAIhguJT97PnUuCmW8STwqWGRcH932EcePgDHey2iiTciX84+LQCAi4PsWrG
         h70YvduOQN+r+HeJNdwYYrjdjDmMOuBobtoBnjo1kRcMLwNadxD9+dPH9/d+omMhLd/Z
         KKS8UflG6E5vrjQ3nf1qHN2trxLm5IIPDprNNmqjgZOb54T5PFo59q+vXHtwdM6OiHuN
         lX/EIIN7fAk2Pvt0RqdfnD6SNvjjoHg5+7hLZCmQc8i/BQLpUXBT3x5XZRGox9nM45cv
         ldkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c00c775955si298602137.661.2025.02.25.06.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 06:16:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmviV-0007Kj-Js; Tue, 25 Feb 2025 09:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cy_liu@aspeedtech.com>)
 id 1tmpX0-0006d7-4I; Tue, 25 Feb 2025 02:39:06 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cy_liu@aspeedtech.com>)
 id 1tmpWy-0008HP-Jc; Tue, 25 Feb 2025 02:39:05 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 25 Feb
 2025 15:33:43 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 25 Feb 2025 15:33:43 +0800
To: <cyliu0926@gmail.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v4 4/4] hw/misc/aspeed_hace: Fix boot issue in the Crypto
 Manager Self Test
Date: Tue, 25 Feb 2025 15:33:41 +0800
Message-ID: <20250225073342.2960966-5-cy_liu@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225073342.2960966-1-cy_liu@aspeedtech.com>
References: <20250225073342.2960966-1-cy_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72; envelope-from=cy_liu@aspeedtech.com;
 helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 Feb 2025 09:15:03 -0500
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
Reply-to:  cy_liu <cy_liu@aspeedtech.com>
From:  cy_liu via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ieEtkjUC5qUL

From: Jamin Lin <jamin_lin@aspeedtech.com>

Currently, it does not support the CRYPT command. Instead, it only sends an
interrupt to notify the firmware that the crypt command has completed.
It is a temporary workaround to resolve the boot issue in the Crypto Manager
Self Test.

Introduce a new "use_crypt_workaround" class attribute and set it to true in
the AST2700 HACE model to enable this workaround by default for AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/misc/aspeed_hace.h |  1 +
 hw/misc/aspeed_hace.c         | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index d13fd3da07..5d4aa19cfe 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -50,6 +50,7 @@ struct AspeedHACEClass {
     uint32_t dest_mask;
     uint32_t key_mask;
     uint32_t hash_mask;
+    bool raise_crypt_interrupt_workaround;
 };
 
 #endif /* ASPEED_HACE_H */
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 86422cb3be..32a5dbded3 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -59,6 +59,7 @@
 /* Other cmd bits */
 #define  HASH_IRQ_EN                    BIT(9)
 #define  HASH_SG_EN                     BIT(18)
+#define  CRYPT_IRQ_EN                   BIT(12)
 /* Scatter-gather data list */
 #define SG_LIST_LEN_SIZE                4
 #define SG_LIST_LEN_MASK                0x0FFFFFFF
@@ -343,6 +344,15 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
                 qemu_irq_lower(s->irq);
             }
         }
+        if (ahc->raise_crypt_interrupt_workaround) {
+            if (data & CRYPT_IRQ) {
+                data &= ~CRYPT_IRQ;
+
+                if (s->regs[addr] & CRYPT_IRQ) {
+                    qemu_irq_lower(s->irq);
+                }
+            }
+        }
         break;
     case R_HASH_SRC:
         data &= ahc->src_mask;
@@ -388,6 +398,12 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
     case R_CRYPT_CMD:
         qemu_log_mask(LOG_UNIMP, "%s: Crypt commands not implemented\n",
                        __func__);
+        if (ahc->raise_crypt_interrupt_workaround) {
+            s->regs[R_STATUS] |= CRYPT_IRQ;
+            if (data & CRYPT_IRQ_EN) {
+                qemu_irq_raise(s->irq);
+            }
+        }
         break;
     default:
         break;
@@ -563,6 +579,13 @@ static void aspeed_ast2700_hace_class_init(ObjectClass *klass, void *data)
     ahc->dest_mask = 0x7FFFFFF8;
     ahc->key_mask = 0x7FFFFFF8;
     ahc->hash_mask = 0x00147FFF;
+
+    /*
+     * Currently, it does not support the CRYPT command. Instead, it only
+     * sends an interrupt to notify the firmware that the crypt command
+     * has completed. It is a temporary workaround.
+     */
+    ahc->raise_crypt_interrupt_workaround = true;
 }
 
 static const TypeInfo aspeed_ast2700_hace_info = {
-- 
2.34.1

