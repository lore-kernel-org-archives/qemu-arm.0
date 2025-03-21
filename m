Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp178416njc;
        Fri, 21 Mar 2025 02:28:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXx+24eIawha8Pj5SfFVl7UqgzzGuDGWYWvA1hHdiGIVtFvfCr7gdFX/fq6mQu0XPy7nBTXKOR+5s5bjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEEohJFdN7zvaaOA0DYbg7XdCBgZva2Su+amL4mBOPT+wn9uhAJ1KPv0JdkJAxyEdiFjUG2
X-Received: by 2002:a05:620a:280d:b0:7c5:ae70:b081 with SMTP id af79cd13be357-7c5b9b7c67amr334427185a.20.1742549286923;
        Fri, 21 Mar 2025 02:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549286; cv=none;
        d=google.com; s=arc-20240605;
        b=JeFrfES+pFA956lGlWShcFgmqN32i/kCMPi+BzgeOiPAlNeSwKpKtuH4GIa7vBTlwN
         NV5Lx3j48q8Up6XYxH4vita0ygOR98ERInrjv5To+IBc7EBfdX2oPKhqQI37EMDUVYAg
         WzHEUJCiXQaQ56xUhHL67orjFfXa27YgeidqQUBeIecUY8G+t3Y9VuGts4lyO252SuZm
         wPupDMsY/nMcvqgYzueN2+2WuRXrC/+l/j1+9AfuwOTr23iMrQSJce/z38FkgT5Qc7wY
         3jzy5IFivwX7GuzvkwykkIvzxZ73y6hOEn3qnhKk6XW2wEBxvWEzPvBDwHHCDVZYpNXk
         K6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=o25z2Aw2XQ4HMWyGJjYrliXQ0pRCoSEywsz//LHZDb8=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=TT/SDlxv/pMhAce88hhxYYGQFsIjjBfGhmhnyBYaSveyuoK3ZS5MJ16NoZBF8wb5/F
         /viuN8Fb4CpJrqDKJCjLIB7cQ2jmg2tkPrKPOvVrRk9k4ab+DLLgUohMChcf8uX5yebv
         d0g/jtIeRIy/oql0+w3XNFEvoBsrtrhvqqI3vvUjB9t5384kCdmZUCuWG7mjwuhDUBAn
         JPVAnbNM0Czls7+VqULbXaTFWmkt259Sumfh6XMJiyhoSl8TLRW1NtSMSDnbag4Xmk/b
         NUVoRLjI/pmlgJEpB3mYT8tAFyJIlyoK9gmJkYjvUcJnwA6bycOMw7oL8+BADiShWe9u
         HN4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b9347932si153650285a.314.2025.03.21.02.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:28:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvYeT-0006VM-KG; Fri, 21 Mar 2025 05:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeO-0006ON-Ly; Fri, 21 Mar 2025 05:26:48 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeM-00056F-P6; Fri, 21 Mar 2025 05:26:48 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:26 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:26 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 08/22] hw/misc/aspeed_hace: Support DMA 64 bits dram
 address.
Date: Fri, 21 Mar 2025 17:26:04 +0800
Message-ID: <20250321092623.2097234-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
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
X-TUID: QB9wukoQ5tzW

According to the AST2700 design, the data source address is 64-bit, with
R_HASH_SRC_HI storing bits [63:32] and R_HASH_SRC storing bits [31:0].

Similarly, the digest address is 64-bit, with R_HASH_DEST_HI storing bits
[63:32] and R_HASH_DEST storing bits [31:0].

Ideally, sg_addr should be 64-bit for the AST2700, using the following program
to obtain the 64-bit sg_addr and convert it to a DRAM offset:

```
sg_addr = deposit64(sg_addr, 32, 32,
                    address_space_ldl_le(&s->dram_as, src + SG_LIST_ADDR_SIZE,
                                         MEMTXATTRS_UNSPECIFIED, NULL);
sg_addr -= 0x400000000;
```

To maintain compatibility with older SoCs such as the AST2600, the AST2700 HW
HACE controllers automatically set bit 34 of the 64-bit sg_addr. As a result,
the firmware only needs to provide a 32-bit sg_addr containing bits [31:0].
This is sufficient for the AST2700, as it uses a DRAM offset rather than a DRAM
address.

Introduce a has_dma64 class attribute and set it to true for the AST2700.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/misc/aspeed_hace.h |  1 +
 hw/misc/aspeed_hace.c         | 27 ++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
index a4479bd383..58fb66009a 100644
--- a/include/hw/misc/aspeed_hace.h
+++ b/include/hw/misc/aspeed_hace.h
@@ -52,6 +52,7 @@ struct AspeedHACEClass {
     uint32_t src_hi_mask;
     uint32_t dest_hi_mask;
     uint32_t key_hi_mask;
+    bool has_dma64;
 };
 
 #endif /* ASPEED_HACE_H */
diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 51c6523fab..8f333fc97e 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -148,6 +148,7 @@ static bool has_padding(AspeedHACEState *s, struct iovec *iov,
 static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                               bool acc_mode)
 {
+    AspeedHACEClass *ahc = ASPEED_HACE_GET_CLASS(s);
     bool sg_acc_mode_final_request = false;
     g_autofree uint8_t *digest_buf = NULL;
     struct iovec iov[ASPEED_HACE_MAX_SG];
@@ -182,6 +183,9 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             }
 
             src = deposit64(src, 0, 32, s->regs[R_HASH_SRC]);
+            if (ahc->has_dma64) {
+                src = deposit64(src, 32, 32, s->regs[R_HASH_SRC_HI]);
+            }
             src += i * SG_LIST_ENTRY_SIZE;
 
             len = address_space_ldl_le(&s->dram_as, src,
@@ -190,6 +194,21 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             sg_addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
                                            MEMTXATTRS_UNSPECIFIED, NULL);
             sg_addr &= SG_LIST_ADDR_MASK;
+            /*
+             * Ideally, sg_addr should be 64-bit for the AST2700, using the
+             * following program to obtain the 64-bit sg_addr and convert it
+             * to a DRAM offset:
+             * sg_addr = deposit64(sg_addr, 32, 32,
+             *      address_space_ldl_le(&s->dram_as, src + SG_ADDR_LEN_SIZE,
+             *                           MEMTXATTRS_UNSPECIFIED, NULL);
+             * sg_addr -= 0x400000000;
+             *
+             * To maintain compatibility with older SoCs such as the AST2600,
+             * the AST2700 HW automatically set bit 34 of the 64-bit sg_addr.
+             * As a result, the firmware only needs to provide a 32-bit sg_addr
+             * containing bits [31:0]. This is sufficient for the AST2700, as
+             * it uses a DRAM offset rather than a DRAM address.
+             */
 
             plen = len & SG_LIST_LEN_MASK;
             haddr = address_space_map(&s->dram_as, sg_addr, &plen, false,
@@ -218,7 +237,9 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
     } else {
         plen = s->regs[R_HASH_SRC_LEN];
         src = deposit64(src, 0, 32, s->regs[R_HASH_SRC]);
-
+        if (ahc->has_dma64) {
+            src = deposit64(src, 32, 32, s->regs[R_HASH_SRC_HI]);
+        }
         haddr = address_space_map(&s->dram_as, src,
                                   &plen, false, MEMTXATTRS_UNSPECIFIED);
         if (haddr == NULL) {
@@ -275,6 +296,9 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
     }
 
     digest_addr = deposit64(digest_addr, 0, 32, s->regs[R_HASH_DEST]);
+    if (ahc->has_dma64) {
+        digest_addr = deposit64(digest_addr, 32, 32, s->regs[R_HASH_DEST_HI]);
+    }
     if (address_space_write(&s->dram_as, digest_addr,
                             MEMTXATTRS_UNSPECIFIED,
                             digest_buf, digest_len)) {
@@ -601,6 +625,7 @@ static void aspeed_ast2700_hace_class_init(ObjectClass *klass, void *data)
      * has completed. It is a temporary workaround.
      */
     ahc->raise_crypt_interrupt_workaround = true;
+    ahc->has_dma64 = true;
 }
 
 static const TypeInfo aspeed_ast2700_hace_info = {
-- 
2.43.0

