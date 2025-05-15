Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1691726njb;
        Thu, 15 May 2025 01:12:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUG3bjb6OZ003I9npDBZQoGIo1xaFmzhuxB5lHWhG0DDHLYjlDl4Rucb3wbKFFK7HRSwFIb8O4sKJVGfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF6WNt8ni6ljZE/zWkkZCa/7d4naKAohSs4HvXQyBynd4nvJoPWGagqJ0tko5BSVBe/QoTv
X-Received: by 2002:a05:6214:5003:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6f8a4bbf923mr26569156d6.21.1747296776117;
        Thu, 15 May 2025 01:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296776; cv=none;
        d=google.com; s=arc-20240605;
        b=F7Q6GxsF9oirxIWSrBBJBmVBbInrhU1cjfb3RWIv5TsrIBB9oMQIaMODZmYr9ytbf7
         +gGuL/Bj3jbW0r0eFl/OAf4G7qwIBy0ucCf/Mp3/v2amdYRGoKxsUJ4Yn3w+9jxN7Hf6
         paw7s9gdF+37aJVU4kfE0aiN8XCVV6ZNsm2Ug/ARg2ywUtKGUIHPkxsNueVW/szMa657
         na2hjFzpaVX2km2CkaNzQDPxO8EDA67F+jFjuhQ0VEwMdjRurbxUBGK+9/r5CdTgGMZ3
         sKXDM/2Zq+ZMjWqT7RNZRGTZvWFz4js/ea1xG5i9T85oOBzs9/3Kb+uhsXGgbP3VERfC
         Yg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=WuoU8IW/22uKhbLSPcz4ZraAS9JGOpTKToYN71tgUV4=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=WEPbsYeRaU3zUQDB/ar9xbX1ECThkabYHPYauZ0K7AcsnA8k8PaBokUCdr2tTgkKoJ
         KbDWM63AxMzsjRq6BN/plUqW7uSVn20nAzJOQPVuPjBtc7Mpv+6tRDcPVx7pz8b2K0Ox
         jJWRmT/2JLHvzAz3WDYvJKFn8PTvrthmnQy/nD3Q09h4RDLBOD8DjSdZa+2Rz4w5tTs2
         EMLRak3DQpwuXXq8bfhZ/oWl+wYkUcZqOUFWhZCFwJodnTiGLPywKOY2IKQ4tIqkGvi8
         fhFLB7G34ha7uhOJhudoOcF9dA4uFS5Bhts2mXZfuXuLIFbWjL3B4ooJ+O4olCfpXFEk
         t08w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39e711bsi153499086d6.26.2025.05.15.01.12.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:12:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uFThn-0001sz-1Y; Thu, 15 May 2025 04:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTgW-0005Fc-Lc; Thu, 15 May 2025 04:11:22 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTgU-00018W-HT; Thu, 15 May 2025 04:11:20 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 May
 2025 16:10:13 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 May 2025 16:10:12 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 14/28] hw/misc/aspeed_hace: Support DMA 64 bits dram address
Date: Thu, 15 May 2025 16:09:46 +0800
Message-ID: <20250515081008.583578-15-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515081008.583578-1-jamin_lin@aspeedtech.com>
References: <20250515081008.583578-1-jamin_lin@aspeedtech.com>
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
X-TUID: 7GnAISDj7usg

According to the AST2700 design, the data source address is 64-bit, with
R_HASH_SRC_HI storing bits [63:32] and R_HASH_SRC storing bits [31:0].

Similarly, the digest address is 64-bit, with R_HASH_DEST_HI storing bits
[63:32] and R_HASH_DEST storing bits [31:0].

To maintain compatibility with older SoCs such as the AST2600, the AST2700 HW
automatically set bit 34 of the 64-bit sg_addr. As a result, the firmware
only needs to provide a 32-bit sg_addr containing bits [31:0]. This is
sufficient for the AST2700, as it uses a DRAM offset rather than a DRAM
address.

Introduce a has_dma64 class attribute and set it to true for the AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/misc/aspeed_hace.h |  1 +
 hw/misc/aspeed_hace.c         | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index 9945b61863..d5d07c6c02 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -53,6 +53,7 @@ struct AspeedHACEClass {
     uint32_t src_hi_mask;
     uint32_t dest_hi_mask;
     uint32_t key_hi_mask;
+    bool has_dma64;
 };
 
 #endif /* ASPEED_HACE_H */
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index d58645cabd..764408716e 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -147,9 +147,13 @@ static bool has_padding(AspeedHACEState *s, struct iovec *iov,
 
 static uint64_t hash_get_source_addr(AspeedHACEState *s)
 {
+    AspeedHACEClass *ahc = ASPEED_HACE_GET_CLASS(s);
     uint64_t src_addr = 0;
 
     src_addr = deposit64(src_addr, 0, 32, s->regs[R_HASH_SRC]);
+    if (ahc->has_dma64) {
+        src_addr = deposit64(src_addr, 32, 32, s->regs[R_HASH_SRC_HI]);
+    }
 
     return src_addr;
 }
@@ -223,7 +227,13 @@ static int hash_prepare_sg_iov(AspeedHACEState *s, struct iovec *iov,
         sg_addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
         sg_addr &= SG_LIST_ADDR_MASK;
-
+        /*
+         * To maintain compatibility with older SoCs such as the AST2600,
+         * the AST2700 HW automatically set bit 34 of the 64-bit sg_addr.
+         * As a result, the firmware only needs to provide a 32-bit sg_addr
+         * containing bits [31:0]. This is sufficient for the AST2700, as
+         * it uses a DRAM offset rather than a DRAM address.
+         */
         plen = len & SG_LIST_LEN_MASK;
         haddr = address_space_map(&s->dram_as, sg_addr, &plen, false,
                                   MEMTXATTRS_UNSPECIFIED);
@@ -260,9 +270,13 @@ static int hash_prepare_sg_iov(AspeedHACEState *s, struct iovec *iov,
 
 static uint64_t hash_get_digest_addr(AspeedHACEState *s)
 {
+    AspeedHACEClass *ahc = ASPEED_HACE_GET_CLASS(s);
     uint64_t digest_addr = 0;
 
     digest_addr = deposit64(digest_addr, 0, 32, s->regs[R_HASH_DIGEST]);
+    if (ahc->has_dma64) {
+        digest_addr = deposit64(digest_addr, 32, 32, s->regs[R_HASH_DIGEST_HI]);
+    }
 
     return digest_addr;
 }
@@ -697,6 +711,7 @@ static void aspeed_ast2700_hace_class_init(ObjectClass *klass, const void *data)
      * has completed. It is a temporary workaround.
      */
     ahc->raise_crypt_interrupt_workaround = true;
+    ahc->has_dma64 = true;
 }
 
 static const TypeInfo aspeed_ast2700_hace_info = {
-- 
2.43.0

