Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp612413njb;
        Thu, 17 Oct 2024 22:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULf6IgpnBvmTWbDUbfJG/5DLoIEgnH7cydXsHeT8LT+PYinRH3dc9kqVe40AS2zRdN6JjXlHpNvagrCg==@linaro.org
X-Google-Smtp-Source: AGHT+IGYf1gfLD5J6mtki7UXq/ZMIFpKdDtYPCZBWAaBqgykbPrkQTfSigAJi17dkBo+Z2KOMMUT
X-Received: by 2002:a05:6214:5a07:b0:6cb:7104:f115 with SMTP id 6a1803df08f44-6cde14c6b89mr18392726d6.11.1729229652359;
        Thu, 17 Oct 2024 22:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729229652; cv=none;
        d=google.com; s=arc-20240605;
        b=CcA2XZvQ4E/OuDwS69wVR7VKwofiqe4jQS/H/pH2u+4LyFw3Fi4cLFJWZdn7hdr/pi
         NTAc/lxAta8UWh51GUHAHByE7nX1hkqHXL8/xRBbVlrtAH+az/zq/G6ixfvVLP/C8E/6
         sgcGBYXBpwAW9YrA6GR/FlGgQ4oNp/nY92npmEarZi0RHN8yAJE9tkaZOu+l/NqZVUV0
         SolV56bvXzSpApHITjN9/LM7xXvhhBiNIC0Hu4ib4m8TDmBIDodBTC6PIRl8nG6/jkT0
         48p3aqfNqicYzxLhLLHNSmls/YgZBGuadl3Gj5KCFEaNFL0egtsDAkyFeNOdBFVp1tL4
         qOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=swKgYK4LbkAOWmJnB6cbeB52PTPlhMyRRUcaE5oGvFI=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=iChNOBFNw6rPoFE9aC7KzOn6u/ugvdSKG84eEFsy49iu8obyB9X7KzQe3jnCQfbqXX
         +kQYSA62zwIgIMwwoLsnEP9Utpw/zcaYkXzLcrD7PFvSE8AqERwt0KBI3XGuY1cCG/RW
         oSvqkrpNLz1munt1KtRk6cXFY9GeqySYQh0BC8ZWro91aB1YJUBj5SqApgdkRQnKLjHv
         b3uR+wS63edQ9g/3qV63pSWqex4S5VbqD84GvAmbnSJZprtNXzVj02J/AiZ9ja5oTflR
         T96wmvZt1g7Yk2N48HPXEngomKC1oeA5aXUC7Q7mlOP746Lbf9wQO4YLLxlqixPX7gb7
         dLTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cde133968asi9357266d6.213.2024.10.17.22.34.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2024 22:34:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t1faN-0008I9-T5; Fri, 18 Oct 2024 01:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faI-0008Gq-Nf; Fri, 18 Oct 2024 01:31:35 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t1faH-00089Y-3z; Fri, 18 Oct 2024 01:31:34 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 18 Oct
 2024 13:31:13 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 18 Oct 2024 13:31:13 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 03/16] hw/block:m25p80: Support write status register 2
 command (0x31) for w25q01jvq
Date: Fri, 18 Oct 2024 13:30:59 +0800
Message-ID: <20241018053112.1886173-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
References: <20241018053112.1886173-1-jamin_lin@aspeedtech.com>
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
X-TUID: ZRl49grrcOnf

According to the w25q01jv datasheet at page 16, it is required to set QE bit
in "Status Register 2" to enable quad mode.

Currently, m25p80 support users utilize "Write Status Register 1(0x01)" command
to set QE bit in "Status Register 2" and utilize "Read Status Register 2(0x35)"
command to get the QE bit status.

However, some firmware directly utilize "Status Register 2(0x31)" command to
set QE bit. To fully support quad mode for w25q01jvq, adds WRSR2 command.

Update collecting data needed 1 byte for WRSR2 command in decode_new_cmd
function and verify QE bit at the first byte of collecting data bit 2 in
complete_collecting_data.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/block/m25p80.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 3f55b8f385..411d810d3b 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -430,6 +430,11 @@ typedef enum {
     RDCR_EQIO = 0x35,
     RSTQIO = 0xf5,
 
+    /*
+     * Winbond: 0x31 - write status register 2
+     */
+    WRSR2 = 0x31,
+
     RNVCR = 0xB5,
     WNVCR = 0xB1,
 
@@ -821,6 +826,15 @@ static void complete_collecting_data(Flash *s)
             s->write_enable = false;
         }
         break;
+    case WRSR2:
+        switch (get_man(s)) {
+        case MAN_WINBOND:
+            s->quad_enable = !!(s->data[0] & 0x02);
+            break;
+        default:
+            break;
+        }
+        break;
     case BRWR:
     case EXTEND_ADDR_WRITE:
         s->ear = s->data[0];
@@ -1280,7 +1294,31 @@ static void decode_new_cmd(Flash *s, uint32_t value)
         }
         s->pos = 0;
         break;
+    case WRSR2:
+        /*
+         * If WP# is low and status_register_write_disabled is high,
+         * status register writes are disabled.
+         * This is also called "hardware protected mode" (HPM). All other
+         * combinations of the two states are called "software protected mode"
+         * (SPM), and status register writes are permitted.
+         */
+        if ((s->wp_level == 0 && s->status_register_write_disabled)
+            || !s->write_enable) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "M25P80: Status register 2 write is disabled!\n");
+            break;
+        }
 
+        switch (get_man(s)) {
+        case MAN_WINBOND:
+            s->needed_bytes = 1;
+            s->state = STATE_COLLECTING_DATA;
+            s->pos = 0;
+            break;
+        default:
+            break;
+        }
+        break;
     case WRDI:
         s->write_enable = false;
         if (get_man(s) == MAN_SST) {
-- 
2.34.1

