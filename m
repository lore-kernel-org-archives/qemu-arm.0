Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6495294njn;
        Mon, 20 Jan 2025 23:07:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcZJZwi6Fvml9dkQRq1iNLopnwqdhI0dWPPXqIMqnSQ6GiyYWc8ZOp3+we6BAKAg9DUSz4XHPkH2mQ0g==@linaro.org
X-Google-Smtp-Source: AGHT+IHHotXya0yBQjbdlJMdtr1JZOW3ffwOgShoCtKp23cU7f9PdzpT5WnhAmNV/N/vYZ2NKMfK
X-Received: by 2002:a05:6214:252e:b0:6d8:a9dc:5a65 with SMTP id 6a1803df08f44-6e1b21f9ef1mr174143716d6.45.1737443275531;
        Mon, 20 Jan 2025 23:07:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737443275; cv=none;
        d=google.com; s=arc-20240605;
        b=Q0MmHSu7vQxeh38t02wMRCZkuNhyv40Rc72/fqyYebpvPJvEEA1e6FJQ8OFcYqZBIR
         32vteL60ykDYGmUvyAo0XolYrurHz0HiXwnCQeRh6Vz5zmKI8o04zRMUOhU5IyStP/XZ
         5quFR1ZLpryF9I8+nQe/1SMv8TKuBvdRZ4QseLX7ZO9Qq4dJ6MR7FkDmHA1qXy8buthj
         BaKNYYqpohR4BResTL04ZxutAZMDP2YfsMWj+BuQmHezsHUMMb3SsbZLbDOBlQixiJLl
         ejyC0IrDlEjEGuplX8jVTtyB47h9PsPOaih0mU2dmjd6lTMGQ5p/i8lHPvSjp1jTt2et
         wxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=oRjyn3cBTd7ACSPc99/uUaK0RuficOn33Ro4D/CU6Hw=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=WyqPRuiiT4el4J94nXCdMXAHDVr47jjxla2gJjPyOnSPQBJ085wl+LWiM+/vLi9BN8
         101rqN+Z8G7/vNanTQzS3FNnNkJUJxQQ5bfUQfVrQ/29UWO7Dh7RlrUNL+gSEULZ8X2m
         fqTVnY97K9As+8iQYP2UPSP2ZdvbQ+qAodF6AdnCPMYf4omZbxvzKuWIo+FMF/Chcvzt
         HOrjljhObQb9JN2axt+sk9DptPqbEvDhKZJ8vJR0xfaATWKE1NQLxciQCqdfhoQIMnG3
         BfOmwy4YW/GkZWtyiizzNTLlndm6pQbH1nAjWTEKfdTkHLGX6dKiyQ5bojbZvFrSSMWH
         36pQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1bda42354si92554616d6.183.2025.01.20.23.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 23:07:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ta8Kw-0000aC-RF; Tue, 21 Jan 2025 02:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Kq-0000AH-NR; Tue, 21 Jan 2025 02:06:04 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8Kp-0001hy-6r; Tue, 21 Jan 2025 02:06:04 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 21 Jan
 2025 15:04:30 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 21 Jan 2025 15:04:30 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 18/18] hw/misc/aspeed_hace: (DROP) Fix boot issue in the
 Crypto Manager Self Test(WORKAROUND)
Date: Tue, 21 Jan 2025 15:04:24 +0800
Message-ID: <20250121070424.2465942-19-jamin_lin@aspeedtech.com>
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
X-TUID: AhQDMpGE77ST

Currently, it does not support the CRYPT command.
Instead, it only sends an interrupt to notify the firmware
that the crypt command has completed.
It is a temporary workaround to resolve the boot issue in
the Crypto Manager Self Test.
Full support for the CRYPT command will be implemented in the future.

It only for reviewer testing and please drop this patch.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 86422cb3be..c3ec6179b9 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -58,6 +58,7 @@
 #define  HASH_HASH_THEN_CRYPT           (BIT(0) | BIT(1))
 /* Other cmd bits */
 #define  HASH_IRQ_EN                    BIT(9)
+#define  CRYPT_IRQ_EN                  BIT(12)
 #define  HASH_SG_EN                     BIT(18)
 /* Scatter-gather data list */
 #define SG_LIST_LEN_SIZE                4
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

