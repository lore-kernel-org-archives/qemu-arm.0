Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp178143njc;
        Fri, 21 Mar 2025 02:27:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNKEk+v+CiHM4eGyXvXPMuNkrovtvmsNETRubVZ6fVzMAcoT0Y+f69EPSDVd9HEtWX63WDFA3V3lgl2A==@linaro.org
X-Google-Smtp-Source: AGHT+IEu6LAVJH2IBd3gzKpj3JUobzSkvAYgdYsUTv1qD9EJigUFzU5wZV3WBpfLNNQF1cW+XeR2
X-Received: by 2002:a05:620a:2405:b0:7c3:ca9d:210b with SMTP id af79cd13be357-7c5ba1337fcmr354917285a.6.1742549240463;
        Fri, 21 Mar 2025 02:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549240; cv=none;
        d=google.com; s=arc-20240605;
        b=hIc+42BmYpH7TSUDRuSxArSuRr+GVDxRCM1BekXtIiizGTCFtn/9QMGTWLZimgf7MJ
         rj64iMWS4i12O69Y47/OMcRh5yZsrVJWFjDYXhCOTHTR3PEXgmiC6zOtVd/t49HdgogL
         SP3/GLh/m5mPxjz8D1/gceIKQkLs849ZHGLCzUhRLPbJsyBzdOMr+9d0w0AKwnPuXgLM
         QhRAEBo02UcQ3XW/Rg0UXW8Ph1HOxFilppbHKA371Ipp/zOUmlmbsFP5vZsMMfDi88oj
         6UNy7DLQUwGVZL8Z7tMegkCg1yIh6FSVj0LSzjg2CvGT7wkqEjNiS/wOiHu2aSbuu5UQ
         KRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=fR38OvfEPtxAfBY9/vqmCtT5ZvmUqWsVlZfslM2Guvw=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=YeACsGaI/kNgQVqpITMbROqFe1yxIDWb36usmMNKZ7WusxhfqwboNn07DrQlg0Nc+L
         0O6OmNw9x+yw4n8LxhP9ASFVBQSYC2TgfWYbPxLRSdzkLzt29P8KB2pUylh10a3W/lGc
         yNPiEs2izw2RbitrP2zIly+rHqkm602imagRlRIqgQIBSylTkQXeEQQRIY1U0sUcMZuX
         WbF+H+elTc3Qo/cK41Dj7b/24KI6PyniXulyMIkfFjLaebL7BjWppTDHZLDkmdhxmyb/
         XjWhbpJCxGdjIBEKBUiu2HnDGDUpJZ4U07AFraFcQ3ndtxgBnxMcXanl6kHWI+S3eS+a
         v2Bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b93611b9si153690085a.482.2025.03.21.02.27.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:27:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tvYeN-0006N9-RY; Fri, 21 Mar 2025 05:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeI-0006Hj-Tw; Fri, 21 Mar 2025 05:26:43 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeG-00056F-Tk; Fri, 21 Mar 2025 05:26:42 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:24 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 03/22] hw/misc/aspeed_hace: Improve readability and
 consistency in variable naming
Date: Fri, 21 Mar 2025 17:25:59 +0800
Message-ID: <20250321092623.2097234-4-jamin_lin@aspeedtech.com>
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
X-TUID: VpPuGcSwTYpW

Currently, users define multiple local variables within different if-statements.
To improve readability and maintain consistency in variable naming, rename the
variables accordingly.
Introduced "sg_addr" to clearly indicate the scatter-gather mode buffer address.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index d8b5f048bb..4bcf6ed074 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -145,15 +145,19 @@ static bool has_padding(AspeedHACEState *s, struct iovec *iov,
 static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                               bool acc_mode)
 {
+    bool sg_acc_mode_final_request = false;
+    g_autofree uint8_t *digest_buf = NULL;
     struct iovec iov[ASPEED_HACE_MAX_SG];
+    Error *local_err = NULL;
     uint32_t total_msg_len;
-    uint32_t pad_offset;
-    g_autofree uint8_t *digest_buf = NULL;
     size_t digest_len = 0;
-    bool sg_acc_mode_final_request = false;
-    int i;
+    uint32_t sg_addr = 0;
+    uint32_t pad_offset;
+    uint32_t len = 0;
+    uint32_t src = 0;
     void *haddr;
-    Error *local_err = NULL;
+    hwaddr plen;
+    int i;
 
     if (acc_mode && s->hash_ctx == NULL) {
         s->hash_ctx = qcrypto_hash_new(algo, &local_err);
@@ -166,12 +170,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
     }
 
     if (sg_mode) {
-        uint32_t len = 0;
-
         for (i = 0; !(len & SG_LIST_LEN_LAST); i++) {
-            uint32_t addr, src;
-            hwaddr plen;
-
             if (i == ASPEED_HACE_MAX_SG) {
                 qemu_log_mask(LOG_GUEST_ERROR,
                         "aspeed_hace: guest failed to set end of sg list marker\n");
@@ -183,12 +182,12 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             len = address_space_ldl_le(&s->dram_as, src,
                                        MEMTXATTRS_UNSPECIFIED, NULL);
 
-            addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
-                                        MEMTXATTRS_UNSPECIFIED, NULL);
-            addr &= SG_LIST_ADDR_MASK;
+            sg_addr = address_space_ldl_le(&s->dram_as, src + SG_LIST_LEN_SIZE,
+                                           MEMTXATTRS_UNSPECIFIED, NULL);
+            sg_addr &= SG_LIST_ADDR_MASK;
 
             plen = len & SG_LIST_LEN_MASK;
-            haddr = address_space_map(&s->dram_as, addr, &plen, false,
+            haddr = address_space_map(&s->dram_as, sg_addr, &plen, false,
                                       MEMTXATTRS_UNSPECIFIED);
             if (haddr == NULL) {
                 qemu_log_mask(LOG_GUEST_ERROR,
@@ -212,16 +211,16 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             }
         }
     } else {
-        hwaddr len = s->regs[R_HASH_SRC_LEN];
+        plen = s->regs[R_HASH_SRC_LEN];
 
         haddr = address_space_map(&s->dram_as, s->regs[R_HASH_SRC],
-                                  &len, false, MEMTXATTRS_UNSPECIFIED);
+                                  &plen, false, MEMTXATTRS_UNSPECIFIED);
         if (haddr == NULL) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
             return;
         }
         iov[0].iov_base = haddr;
-        iov[0].iov_len = len;
+        iov[0].iov_len = plen;
         i = 1;
     }
 
-- 
2.43.0

