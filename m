Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp323612njb;
        Mon, 12 May 2025 23:34:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6r1HBgVipJ3DvF9L7dgTsMZR8lWWW6UucTc5qRme36py6MMgBSjZ5rY2jum5Qh+mghMYBAK/m1lolJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF/XEuK8xyhFTf9TfCKx/mOlGk53O06jsFRin4ovGrK03hjKDNaBf3udhkOlFLTEEA/yEdy
X-Received: by 2002:a05:6214:4111:b0:6e8:fde9:5d07 with SMTP id 6a1803df08f44-6f6e47e4b32mr228260306d6.26.1747117990910;
        Mon, 12 May 2025 23:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747117990; cv=none;
        d=google.com; s=arc-20240605;
        b=PVD4zt7CeWosv/S8vSNt1UO9zuiEU8KGq+TmyhFBoymCWrFUuMLajxXDQT2kIu5tCT
         O5jq+WkmPEKPz7qMIym+XssvaB1x9VCopgbQt7LfaIAjSBUAQKK54EJ5juSnRMf43d0x
         +wctR4MYmD1Er7tJTMPXWzLIJ70RPUbzPpmue7cJqE92e/26rwEQGq4UaE8O8OThGVim
         10tZF9ov+SMabWtlU3Z6tyJHvXUVL+qs4vDzpuAguFXYZ4s4JA7jriP/3HRv6Sk6Tdl8
         QSH6vsdWrWIAlhol3M9uyduzb6aVsPl+EOVZdzFeO8+gN5QHxW/x6pCxNwxa5dFehb8Y
         jNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=fd1BKu6vVGyqLU1DbI8J02QQcYbYpzQg88cBrTpWMqY=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=E+2Ejs5wsjy0U6gIIONQ1MYHMzxAoqwEbG3anwwKbsFQCh8YGx9+EDSPIBZ2YXIf5n
         z5LuTBQQVfrHr2yX/Gc0JWDL6L84OWIRShbnNEsbW2tCweKEnA/3SNRkOgBB194AY2mI
         y64JxMr53kW3vGHmBQ79NFrNDkRqjTyqb75uCnS1/urrCEUnUjH3ZSVL9lXenxSM3Yul
         xPxY/fyQcYNi/BHk50n3NP6j0ZfJbPge1nu+FL7Iom0TnrUPyt5AX/DgSjwd6y77I96n
         Ay6qVeYrgTXszSVZRZs6VkimT4J4AkT+Sht/aXzcWNyJcU+LMGB+5dZgT+oVFZCmIIxl
         dD0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a64f7fsi104523016d6.500.2025.05.12.23.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:33:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEjBk-00061M-F1; Tue, 13 May 2025 02:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjAW-00057w-EH; Tue, 13 May 2025 02:31:16 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjAU-00026a-AK; Tue, 13 May 2025 02:31:12 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:05 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:05 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 10/25] hw/misc/aspeed_hace: Add support for source, digest,
 key buffer 64 bit addresses
Date: Tue, 13 May 2025 14:28:40 +0800
Message-ID: <20250513062901.2256865-11-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
References: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
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
X-TUID: 4WBac6UT7agU

According to the AST2700 design, the data source address is 64-bit, with
R_HASH_SRC_HI storing bits [63:32] and R_HASH_SRC storing bits [31:0].
Similarly, the digest address is 64-bit, with R_HASH_DIGEST_HI storing bits
[63:32] and R_HASH_DIGEST storing bits [31:0]. The HMAC key buffer address is also
64-bit, with R_HASH_KEY_BUFF_HI storing bits [63:32] and R_HASH_KEY_BUFF storing
bits [31:0].

The AST2700 supports a maximum DRAM size of 8 GB, with a DRAM addressable range
from 0x0_0000_0000 to 0x1_FFFF_FFFF. Since this range fits within 34 bits, only
bits [33:0] are needed to store the DRAM offset. To optimize address storage,
the high physical address bits [1:0] of the source, digest and key buffer
addresses are stored as dram_offset bits [33:32].

To achieve this, a src_hi_mask with a mask value of 0x3 is introduced, ensuring
that src_addr_hi consists of bits [1:0]. The final src_addr is computed as
(src_addr_hi[1:0] << 32) | src_addr[31:0], representing the DRAM offset within
bits [33:0].

Similarly, a dest_hi_mask with a mask value of 0x3 is introduced to ensure that
dest_addr_hi consists of bits [1:0]. The final dest_addr is calculated as
(dest_addr_hi[1:0] << 32) | dest_addr[31:0], representing the DRAM offset within
bits [33:0].

Additionally, a key_hi_mask with a mask value of 0x3 is introduced to ensure
that key_buf_addr_hi consists of bits [1:0]. The final key_buf_addr is
determined as (key_buf_addr_hi[1:0] << 32) | key_buf_addr[31:0], representing
the DRAM offset within bits [33:0].

This approach eliminates the need to reduce the high part of the DRAM physical
address for DMA operations. Previously, this was calculated as
(high physical address bits [7:0] - 4), since the DRAM start address is
0x4_00000000, making the high part address [7:0] - 4.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/misc/aspeed_hace.h |  3 +++
 hw/misc/aspeed_hace.c         | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index f30d606559..9945b61863 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -50,6 +50,9 @@ struct AspeedHACEClass {
     uint32_t hash_mask;
     uint64_t nr_regs;
     bool raise_crypt_interrupt_workaround;
+    uint32_t src_hi_mask;
+    uint32_t dest_hi_mask;
+    uint32_t key_hi_mask;
 };
 
 #endif /* ASPEED_HACE_H */
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 63404a76f7..0fd8a167a2 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -30,6 +30,9 @@
 #define R_HASH_DIGEST   (0x24 / 4)
 #define R_HASH_KEY_BUFF (0x28 / 4)
 #define R_HASH_SRC_LEN  (0x2c / 4)
+#define R_HASH_SRC_HI       (0x90 / 4)
+#define R_HASH_DIGEST_HI    (0x94 / 4)
+#define R_HASH_KEY_BUFF_HI  (0x98 / 4)
 
 #define R_HASH_CMD      (0x30 / 4)
 /* Hash algorithm selection */
@@ -473,6 +476,15 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
             }
         }
         break;
+    case R_HASH_SRC_HI:
+        data &= ahc->src_hi_mask;
+        break;
+    case R_HASH_DIGEST_HI:
+        data &= ahc->dest_hi_mask;
+        break;
+    case R_HASH_KEY_BUFF_HI:
+        data &= ahc->key_hi_mask;
+        break;
     default:
         break;
     }
@@ -656,12 +668,29 @@ static void aspeed_ast2700_hace_class_init(ObjectClass *klass, const void *data)
 
     dc->desc = "AST2700 Hash and Crypto Engine";
 
-    ahc->nr_regs = 0x64 >> 2;
+    ahc->nr_regs = 0x9C >> 2;
     ahc->src_mask = 0x7FFFFFFF;
     ahc->dest_mask = 0x7FFFFFF8;
     ahc->key_mask = 0x7FFFFFF8;
     ahc->hash_mask = 0x00147FFF;
 
+    /*
+     * The AST2700 supports a maximum DRAM size of 8 GB, with a DRAM
+     * addressable range from 0x0_0000_0000 to 0x1_FFFF_FFFF. Since this range
+     * fits within 34 bits, only bits [33:0] are needed to store the DRAM
+     * offset. To optimize address storage, the high physical address bits
+     * [1:0] of the source, digest and key buffer addresses are stored as
+     * dram_offset bits [33:32].
+     *
+     * This approach eliminates the need to reduce the high part of the DRAM
+     * physical address for DMA operations. Previously, this was calculated as
+     * (high physical address bits [7:0] - 4), since the DRAM start address is
+     * 0x4_00000000, making the high part address [7:0] - 4.
+     */
+    ahc->src_hi_mask = 0x00000003;
+    ahc->dest_hi_mask = 0x00000003;
+    ahc->key_hi_mask = 0x00000003;
+
     /*
      * Currently, it does not support the CRYPT command. Instead, it only
      * sends an interrupt to notify the firmware that the crypt command
-- 
2.43.0

