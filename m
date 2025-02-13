Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp344501njc;
        Wed, 12 Feb 2025 19:37:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVHKDB99FehH1KDXUkXfskgem6SiHNnUCHtjyNfZ+VywmsPlZuZL+kSiLzMi3NXbcx5yC8I0wpb64QEbw==@linaro.org
X-Google-Smtp-Source: AGHT+IF34UIYCHHjIiTzD7YLQklq99n8ddOp9yzfCJc/NjOxlkiJRqQsHYRc11mHx6BhTjKe28aW
X-Received: by 2002:a05:6214:b69:b0:6e4:2e5f:c03b with SMTP id 6a1803df08f44-6e46ed87131mr83509186d6.22.1739417852842;
        Wed, 12 Feb 2025 19:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739417852; cv=none;
        d=google.com; s=arc-20240605;
        b=TIYjLsWcLCmnDmJlNCtVafgxiFtgOt7xRd0F/HLjIIuc6NHOn22CtBYwyi4pFXgoR8
         EAk3x+cmwnn98+nZAV3HU0MfZj7aLPZIi1diJrrCvB32f+g8pXAaYvQlh8tUtUgSv4x6
         qkVxsyex6A5N8e2lLIDEjOt1oYV8Fs06SM5gZgseDXrb1bkGEOnerlXQmc2nIWhHZ3e2
         ye8b8G/Ha30n0GN86+SFMQ3jw50QronpAL0hcQasTgBh1sCklO466mPXDnhkUrvi1NRd
         iZqW3ZmDPmen4tyaERELWMjAHt0Wh/vSIQjSn1KXL2cnt7WsI2UzIV91J4iFcqQvvpXf
         mS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=oT237kvzns+YRcKx3L580TTy4MOodnHOkDU5Aq85OGs=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=J4F/7P+nnPHd7oACuWjDzgTNIkx/9MTAleQAM2lnvFpi2sWm0nOtT6/3fXasRtRCF+
         dXYy0rgx1WhF+wWOzfKx8/EM2MGzmttMKjHkyStcKWiGWLZsBQwYi4GsEMFslV3TBtgY
         JLQs0J3a9BA5QTkxP+ylkzcW0BnPJtxQyqvgMV23awZ9LmiYGh9avCkITvpQ/WpRMHRm
         6OgkqUq7E+C6i0rmFA4u2L48U+9b2tofPx07h32uEyopkdLQp5WlPqqNRQ1Qu6tbZH53
         3p/7amkZmKqO7dcUMGovMRoiqHoE7dDOn2pbxkXrarSmfDLgkxn4bByGsR5uWR67fCt1
         Sj0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d73450fsi6340336d6.8.2025.02.12.19.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:37:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiQ2Z-0000eR-OU; Wed, 12 Feb 2025 22:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2L-0008T6-T8; Wed, 12 Feb 2025 22:37:15 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ2K-0000nL-CJ; Wed, 12 Feb 2025 22:37:13 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 11:35:40 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 11:35:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 21/28] hw/misc/aspeed_hace: Fix boot issue in the Crypto
 Manager Self Test
Date: Thu, 13 Feb 2025 11:35:24 +0800
Message-ID: <20250213033531.3367697-22-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-TUID: sL8SXlQ7ppnI

Currently, it does not support the CRYPT command. Instead, it only sends an
interrupt to notify the firmware that the crypt command has completed.
It is a temporary workaround to resolve the boot issue in the Crypto Manager
Self Test.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 86422cb3be..4d0999e7e9 100644
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
@@ -343,6 +344,13 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
                 qemu_irq_lower(s->irq);
             }
         }
+        if (data & CRYPT_IRQ) {
+            data &= ~CRYPT_IRQ;
+
+            if (s->regs[addr] & CRYPT_IRQ) {
+                qemu_irq_lower(s->irq);
+            }
+        }
         break;
     case R_HASH_SRC:
         data &= ahc->src_mask;
@@ -388,6 +396,10 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
     case R_CRYPT_CMD:
         qemu_log_mask(LOG_UNIMP, "%s: Crypt commands not implemented\n",
                        __func__);
+        s->regs[R_STATUS] |= CRYPT_IRQ;
+        if (data & CRYPT_IRQ_EN) {
+            qemu_irq_raise(s->irq);
+        }
         break;
     default:
         break;
-- 
2.34.1

