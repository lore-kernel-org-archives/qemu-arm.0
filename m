Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp322969njb;
        Mon, 12 May 2025 23:32:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdDV3nhUtmbRGkjmU+dxuXhSinmgaXIA+rPDOtPRXfEk17gj3bsJQfIKHWkZ5JsQNWGkS1AZiBdag1lg==@linaro.org
X-Google-Smtp-Source: AGHT+IGPLCduWPwMIa5ybWisucG7oSIlgZqpkmyes/Z7QgwaeaVdVgXpOhpKjRdw6WVoa02glkdA
X-Received: by 2002:a05:620a:2953:b0:7ca:cb02:793d with SMTP id af79cd13be357-7cd010f4330mr2160875785a.4.1747117949034;
        Mon, 12 May 2025 23:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747117949; cv=none;
        d=google.com; s=arc-20240605;
        b=aDKNAWT3DG+4zdalb+D3pKBJs3XpSTOYHJ7dwQZU48JhZvLU1z7KD+ZXjkF+y92HS4
         QLB0C1km4R6c33Dm2pY0YkQJ8I8tjiM47CaledNO+FhNDXzFcmtkEpymhbJaukPjd04D
         Dx5ReHZojJEHzrsrshfM6vdbjOK1tNAau937TlQbr83uvoObRA5JUhzy5G9swdHPuzVA
         x+CERn3r0b8plgbKXFswJydzMu9T/f/53/HvZpYKRR4zrNYktDyCKsvJ8JOXK5TfHoct
         itQn2ekpjHyJ9CS1bYeYw766Gi/mN3selCir71EqYV1GaeSsVUzoKaW8tpEhvY2f3EB5
         Lfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=waKNQ7ICAWhVDlBDI6d9nYBltdk2/ze4UI9TF2xNq7k=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=AK+z1wymbjfS9pfsQmTJYh9yVPtvrXjFXtmreJSSSzMPhDxHLNpRnHP635o/V6nNrB
         maTpbYiCdJIHJI5aw+aj9tdEETKaU6Lutsnf7RyVnOzL2q6VCJWxVqYfrdEWfI4QVacH
         /bk3gvGYPNGbk2zkpT275wKpugvRwN6KZ/NxVN7pk/IkexeBDj/rqRZviCSZjcMe/8WE
         f3x/ZxFde1/Z/Ga/L+s2nHBCQgW9YUmoSSCCrTv+O7CRYyVkU2ZzJV3hvfqKhD5CIKLj
         ZaFvRkf/DczEFD8Ra54vXvzCzlxyEZxkHZNEGSlcXLSMQLGo+Bb2QklHA0JczJvpdFnW
         HMIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a4bcb3si107017816d6.335.2025.05.12.23.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:32:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEjBb-0005ng-0H; Tue, 13 May 2025 02:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjAe-0005Fn-0F; Tue, 13 May 2025 02:31:23 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEjAb-00026a-73; Tue, 13 May 2025 02:31:18 -0400
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
Subject: [PATCH v2 12/25] hw/misc/aspeed_hace: Add trace-events for better
 debugging
Date: Tue, 13 May 2025 14:28:42 +0800
Message-ID: <20250513062901.2256865-13-jamin_lin@aspeedtech.com>
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
X-TUID: uqjx9IY3//3u

Introduced "trace_aspeed_hace_hash_addr", "trace_aspeed_hace_hash_sg",
"trace_aspeed_hace_read", "trace_aspeed_hace_hash_execute_acc_mode",
and "trace_aspeed_hace_write" trace events.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 11 +++++++++++
 hw/misc/trace-events  |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 5454f51aa6..1ffec029dc 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -18,6 +18,7 @@
 #include "crypto/hash.h"
 #include "hw/qdev-properties.h"
 #include "hw/irq.h"
+#include "trace.h"
 
 #define R_CRYPT_CMD     (0x10 / 4)
 
@@ -170,6 +171,7 @@ static int hash_prepare_direct_iov(AspeedHACEState *s, struct iovec *iov,
 
     plen = s->regs[R_HASH_SRC_LEN];
     src = hash_get_source_addr(s);
+    trace_aspeed_hace_hash_addr("src", src);
     haddr = address_space_map(&s->dram_as, src, &plen, false,
                               MEMTXATTRS_UNSPECIFIED);
     if (haddr == NULL) {
@@ -214,6 +216,7 @@ static int hash_prepare_sg_iov(AspeedHACEState *s, struct iovec *iov,
     void *haddr;
 
     src = hash_get_source_addr(s);
+    trace_aspeed_hace_hash_addr("src", src);
     for (iov_idx = 0; !(len & SG_LIST_LEN_LAST); iov_idx++) {
         if (iov_idx == ASPEED_HACE_MAX_SG) {
             qemu_log_mask(LOG_GUEST_ERROR,
@@ -227,6 +230,7 @@ static int hash_prepare_sg_iov(AspeedHACEState *s, struct iovec *iov,
         sg_addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
         sg_addr &= SG_LIST_ADDR_MASK;
+        trace_aspeed_hace_hash_sg(iov_idx, sg_addr, len);
         /*
          * To maintain compatibility with older SoCs such as the AST2600,
          * the AST2700 HW automatically set bit 34 of the 64-bit sg_addr.
@@ -290,6 +294,7 @@ static void hash_write_digest_and_unmap_iov(AspeedHACEState *s,
     uint64_t digest_addr = 0;
 
     digest_addr = hash_get_digest_addr(s);
+    trace_aspeed_hace_hash_addr("digest", digest_addr);
     if (address_space_write(&s->dram_as, digest_addr,
                             MEMTXATTRS_UNSPECIFIED,
                             digest_buf, digest_len)) {
@@ -332,6 +337,8 @@ static void hash_execute_acc_mode(AspeedHACEState *s, int algo,
     Error *local_err = NULL;
     size_t digest_len;
 
+    trace_aspeed_hace_hash_execute_acc_mode(final_request);
+
     if (s->hash_ctx == NULL) {
         s->hash_ctx = qcrypto_hash_new(algo, &local_err);
         if (s->hash_ctx == NULL) {
@@ -403,6 +410,8 @@ static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
 
     addr >>= 2;
 
+    trace_aspeed_hace_read(addr << 2, s->regs[addr]);
+
     return s->regs[addr];
 }
 
@@ -414,6 +423,8 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
 
     addr >>= 2;
 
+    trace_aspeed_hace_write(addr << 2, data);
+
     switch (addr) {
     case R_STATUS:
         if (data & HASH_IRQ) {
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 4383808d7a..b2587c37d7 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -302,6 +302,13 @@ aspeed_peci_read(uint64_t offset, uint64_t data) "offset 0x%" PRIx64 " data 0x%"
 aspeed_peci_write(uint64_t offset, uint64_t data) "offset 0x%" PRIx64 " data 0x%" PRIx64
 aspeed_peci_raise_interrupt(uint32_t ctrl, uint32_t status) "ctrl 0x%" PRIx32 " status 0x%" PRIx32
 
+# aspeed_hace.c
+aspeed_hace_read(uint64_t offset, uint64_t data) "offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_hace_write(uint64_t offset, uint64_t data) "offset 0x%" PRIx64 " data 0x%" PRIx64
+aspeed_hace_hash_sg(int index, uint64_t addr, uint32_t len) "%d: addr 0x%" PRIx64 " len 0x%" PRIx32
+aspeed_hace_hash_addr(const char *s, uint64_t addr) "%s: 0x%" PRIx64
+aspeed_hace_hash_execute_acc_mode(bool final_request) "final request: %d"
+
 # bcm2835_property.c
 bcm2835_mbox_property(uint32_t tag, uint32_t bufsize, size_t resplen) "mbox property tag:0x%08x in_sz:%u out_sz:%zu"
 
-- 
2.43.0

