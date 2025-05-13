Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp323920njb;
        Mon, 12 May 2025 23:35:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4Vf3wYBx/XtViwKEfcFnzEme6KE0GxXMj+292JXh0+O5cVBZaUck9dwHcA8rGA7mlkX377atkxGtDjw==@linaro.org
X-Google-Smtp-Source: AGHT+IH3JFZVaX3OOU27IMNFqzPodiruQLOCB3MY90RfDl9UFpNCup+9LsJNFYpKH0OJ6/n+SrxY
X-Received: by 2002:ad4:5ae1:0:b0:6f4:b265:261 with SMTP id 6a1803df08f44-6f6e479775bmr327923006d6.8.1747118103606;
        Mon, 12 May 2025 23:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747118103; cv=none;
        d=google.com; s=arc-20240605;
        b=Li46292AQFb5pXA231TKZFp83Co/50GvjXVMuJvoDFp/0MnMQSUISU5Og3LAAQJKKn
         xirrb4Y0m/FBgMqzx/HWoQ+LjGBJS0NGkc4LdMZ3w6Ykp4NwplgLBBjOtGHzGa2LqYcN
         Dz6VErah/IW2Qppt/4ic+ocBAx9AMWzR86ZbKm0iBx9OcLsKLq/RDzYqm88gnMSO+og0
         Em9iV6X6pDZluvNi/Ux+bwJPGlp8FZvvr7w88C9VmD+FsGlwbUprE3lKUrCSRDOf0HtL
         RjPTRMj6bZbYJFWM1NR0OGnRcHOfqJaeJ7DAVnfxi87ZBGsDOhe4oyFEGo6wEQ6HXBB4
         QkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=eJFyrCNoeuEvfrsU/RDm6+Tez1El8zxSnycihYdMiow=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=QTTviMynXWGsFQrf+ySElKWCQQrNt60rUO/LvA5nIf7sAD1GGUwROo7/ZNYLVO7KHU
         exm+Ea1TiS6k+L43pu+HRFfPRWJ5TSIQ8toglTMH1WJcL3MHT4FBzKO1pv2G71uIMMDs
         HmYW0PimKP35BxjI0df3Sqak5oKMa1MtoRIHggeksqbuE+A16flOLVw0NEE4lOQDbQWQ
         8z0f0ot43lO5AxBQZQ6Dq8QJg43tC8ICe4X5sZ1iID/SRVdTW1OTok7SjU6uJj6tlSNO
         AvtfwfaB6bzMTFLXoxsPaxEj7zcQsP2PKEEnxz/NKiNDzluhfJILHoUhwZlu8TwvLJpW
         4i/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39f78fdsi106472846d6.135.2025.05.12.23.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEjDl-0000Zo-Sx; Tue, 13 May 2025 02:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjAa-00059v-2e; Tue, 13 May 2025 02:31:22 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjAX-00026a-FY; Tue, 13 May 2025 02:31:15 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:06 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 11/25] hw/misc/aspeed_hace: Support DMA 64 bits dram address
Date: Tue, 13 May 2025 14:28:41 +0800
Message-ID: <20250513062901.2256865-12-jamin_lin@aspeedtech.com>
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
X-TUID: dO+sISAAGx/W

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
index 0fd8a167a2..5454f51aa6 100644
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

