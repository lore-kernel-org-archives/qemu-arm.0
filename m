Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4596C5B572
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 16:36:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtpPU-0006ZQ-DQ; Tue, 11 Aug 2026 12:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wtpOp-0005O1-Jr
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 12:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wtpOm-00011F-Gr
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 12:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1786465939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFaHKdFRFSDtsyrbFezgrvh5awGz7mtVB4qygyxTMi8=;
 b=FStFNosjF2GZ4KUOXgz01LsV7N1J3Fey1vKwgA8uJwpt20tSXvwFPQb/gY/SrvvfZkIRy6
 wHa3zW8dhhKcQO7P//x7nf1D0n3/jlvnLcNvEo1WZVHbWL9DQxGAHW8SfKx8yxMEknw8RG
 Q295ZZQYcYwFJ9OPJEBBw/ZlmpeEVSw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-91-fP64E64lNJe9MvpbZHid2w-1; Tue,
 11 Aug 2026 12:32:16 -0400
X-MC-Unique: fP64E64lNJe9MvpbZHid2w-1
X-Mimecast-MFC-AGG-ID: fP64E64lNJe9MvpbZHid2w_1786465935
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E16091956078; Tue, 11 Aug 2026 16:32:14 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.48.12])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0D6F4195DF91; Tue, 11 Aug 2026 16:32:12 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 71/83] hw/misc/aspeed_hace: Support the CTR mode for the crypto
 command
Date: Tue, 11 Aug 2026 18:29:26 +0200
Message-ID: <20260811162938.1403216-72-clg@redhat.com>
In-Reply-To: <20260811162938.1403216-1-clg@redhat.com>
References: <20260811162938.1403216-1-clg@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: -Eu1QzyZRzyVtI6xnhpIerk_3-g4e6SUbMvGgmdmPtM_1786465935
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.102,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jamin Lin <jamin_lin@aspeedtech.com>

The AST2600, AST1030 and later crypto engines add AES/DES/3DES CTR mode
(HACE10[6:4] = 0b100) on top of the ECB/CBC modes shared with the
AST2500. Decode the CTR selection, round the working buffers up to a
whole block so the stream-like final block is still processed a block at
a time, and write the counter advanced by the number of blocks consumed
back to the context buffer so the driver can continue across requests.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Kane Chen <kane_chen@aspeedtech.com>
Link: https://lore.kernel.org/qemu-devel/20260811060115.1849266-5-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_hace.c | 50 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 646ff504762d..d84f7f9cec1a 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -41,6 +41,7 @@
 #define  CRYPT_CMD_OP_MODE_MASK     (0x7 << 4)
 #define  CRYPT_CMD_ECB              (0x0 << 4)
 #define  CRYPT_CMD_CBC              (0x1 << 4)
+#define  CRYPT_CMD_CTR              (0x4 << 4)
 /* AES key length HACE10[3:2] */
 #define  CRYPT_CMD_AES_KEY_LEN_MASK (0x3 << 2)
 #define  CRYPT_CMD_AES256           (0x2 << 2)
@@ -587,6 +588,9 @@ static bool crypt_decode_cmd(uint32_t cmd, QCryptoCipherAlgo *alg,
     case CRYPT_CMD_CBC:
         *mode = QCRYPTO_CIPHER_MODE_CBC;
         break;
+    case CRYPT_CMD_CTR:
+        *mode = QCRYPTO_CIPHER_MODE_CTR;
+        break;
     default:
         return false;
     }
@@ -650,6 +654,22 @@ static bool crypt_prepare_sg(AspeedHACEState *s, uint64_t addr,
     return copied == len;
 }
 
+/*
+ * Add @add to the big-endian counter block @ctr (@len bytes) in place, so the
+ * CTR mode counter can be advanced by the number of blocks just consumed.
+ */
+static void crypt_be_add(uint8_t *ctr, size_t len, uint64_t add)
+{
+    size_t i = len;
+
+    while (i > 0 && add) {
+        i--;
+        add += ctr[i];
+        ctr[i] = add & 0xff;
+        add >>= 8;
+    }
+}
+
 /*
  * Perform an AES/DES/3DES ECB/CBC operation. The source and destination are
  * either single contiguous buffers (direct access mode) or scatter-gather
@@ -675,6 +695,7 @@ static void do_crypt_operation(AspeedHACEState *s, uint32_t cmd)
     uint64_t dst_addr;
     size_t iv_offset;
     size_t blocklen;
+    size_t buf_len;
     size_t keylen;
     bool status;
 
@@ -727,8 +748,14 @@ static void do_crypt_operation(AspeedHACEState *s, uint32_t cmd)
         return;
     }
 
-    src_buf = g_malloc0(len);
-    dst_buf = g_malloc0(len);
+    /*
+     * Round the working buffers up to a whole block. Block modes are already
+     * block-aligned; the stream-like CTR mode may leave a partial final block
+     * that the engine still processes a full block at a time.
+     */
+    buf_len = QEMU_ALIGN_UP(len, blocklen);
+    src_buf = g_malloc0(buf_len);
+    dst_buf = g_malloc0(buf_len);
 
     /* Gather the source into the bounce buffer, per the selected mode. */
     src_addr = s->regs[R_CRYPT_SRC];
@@ -749,7 +776,7 @@ static void do_crypt_operation(AspeedHACEState *s, uint32_t cmd)
     }
 
     if (encrypt) {
-        if (qcrypto_cipher_encrypt(cipher, src_buf, dst_buf, len,
+        if (qcrypto_cipher_encrypt(cipher, src_buf, dst_buf, buf_len,
                                    &local_err) < 0) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: encrypt failed: %s\n",
                           __func__, error_get_pretty(local_err));
@@ -757,7 +784,7 @@ static void do_crypt_operation(AspeedHACEState *s, uint32_t cmd)
             return;
         }
     } else {
-        if (qcrypto_cipher_decrypt(cipher, src_buf, dst_buf, len,
+        if (qcrypto_cipher_decrypt(cipher, src_buf, dst_buf, buf_len,
                                    &local_err) < 0) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: decrypt failed: %s\n",
                           __func__, error_get_pretty(local_err));
@@ -790,13 +817,26 @@ static void do_crypt_operation(AspeedHACEState *s, uint32_t cmd)
          * output when encrypting, or of the input when decrypting. Write it
          * back as the IV for the next request.
          */
-        next_iv = (encrypt ? dst_buf : src_buf) + len - blocklen;
+        next_iv = (encrypt ? dst_buf : src_buf) + buf_len - blocklen;
         if (address_space_write(&s->dram_as, ctx_addr + iv_offset,
                                 MEMTXATTRS_UNSPECIFIED, next_iv, blocklen)) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: Failed to write IV, addr=0x%" HWADDR_PRIx "\n",
                           __func__, ctx_addr + iv_offset);
         }
+    } else if (mode == QCRYPTO_CIPHER_MODE_CTR) {
+        /*
+         * CTR chains on the counter, which advances by one per block. Add the
+         * number of blocks processed (buf_len / blocklen) and write it back.
+         */
+        crypt_be_add(ctx + iv_offset, blocklen, buf_len / blocklen);
+        if (address_space_write(&s->dram_as, ctx_addr + iv_offset,
+                                MEMTXATTRS_UNSPECIFIED, ctx + iv_offset,
+                                blocklen)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Failed to write IV, addr=0x%" HWADDR_PRIx "\n",
+                          __func__, ctx_addr + iv_offset);
+        }
     }
 }
 
-- 
2.55.0


