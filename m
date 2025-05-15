Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1691249njb;
        Thu, 15 May 2025 01:11:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU58dY5sIEOAdcuLbGl45PZj9o4/cNSR5cwfDwFvfHMR7IBcy/IDZzSzqbPxnDnEmmFkCOu7iczux2ADQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEDEzGyJDjZy3w+UnqMEK58dw0oOfGo6pcAu5YxbseKN3adWIdLu1ht+6Od50J8qPy0JRla
X-Received: by 2002:a05:6214:5197:b0:6f5:3e46:63eb with SMTP id 6a1803df08f44-6f896e4427fmr101933386d6.13.1747296702233;
        Thu, 15 May 2025 01:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296702; cv=none;
        d=google.com; s=arc-20240605;
        b=SgHWSXrD/AyrROxuqtmbSkZXfpuZzZ7f8qlfEJh10OIdOHw2sM4UBOzzJ1IETBbRMo
         TA1hLGNTMSprLlJM9qrihYL8cOkqJLpB7QN5pe2K5ZNwWR9EaZwv2AFzoZvZNjXE2tT3
         4WnkkTA1B5z4Z4iDlyrg83mL9IPzFdbkFR9YzNYtqQzUcksz4qLc7bxpX+0YDSVUlSKJ
         pf6ZZLsL3XPQ8wwtWXkgxs3O4F72BtnMeEdjsggNf0GpWTgryZWSqnzd+xwSx6BgteK9
         dxMnFEcRhsF7AxjSie/r7zFeKjDXWS1w/AYZihoD9cRAfl/OFe6oocNsBVPUD31umgSn
         DsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=/ktnCAjMS5f2Vepfc63KRi+avZAmcLtnOg3LdnQai4k=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=B7H2ArNvy/PFoWYVUaF8jnlIXkrsZKeTmeuifrC0yYHYKHpBQ+nrN5276BJ5NvSRCX
         I1qIxI5N0zsedVZZ0O4HyhRopjYKsVrQ7kWfIrAA5ce+M+R/FjN6ZOINRYasxwYrWC2V
         rVkwtGzMq81gN2DOJzPkcWROm5zxic95MlDeTgB36S/KZXueSv5Ld7UC6QsCRcHORUfk
         rfCX72+8FvX0PHAu/XKQrLFIpsC8V4+BR+k7sTrrpYreJ7+0hUN5yLU7G6Ok33kMXBsV
         bBWNp9oYRK9che80XZYbIjJNVf0nWclcTNcGcs4u5JY1fAHr9VWe212sya3iUfFukCS1
         FnfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a42e50si151169776d6.227.2025.05.15.01.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:11:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFTfx-0003Pc-H1; Thu, 15 May 2025 04:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfs-0003I4-Pg; Thu, 15 May 2025 04:10:40 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfq-00010V-S8; Thu, 15 May 2025 04:10:40 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 May
 2025 16:10:10 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 May 2025 16:10:10 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 07/28] hw/misc/aspeed_hace: Extract non-accumulation hash
 execution into helper function
Date: Thu, 15 May 2025 16:09:39 +0800
Message-ID: <20250515081008.583578-8-jamin_lin@aspeedtech.com>
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
X-TUID: t3ySJ+d3zN0Y

To improve code readability and maintainability of do_hash_operation(), this
commit introduces a new helper function: hash_execute_non_acc_mode().

The helper encapsulate the hashing logic for non-accumulation mode.

No functional changes are introduced.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 7da781f864..c50e228cdf 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -248,6 +248,25 @@ static void hash_write_digest_and_unmap_iov(AspeedHACEState *s,
     }
 }
 
+static void hash_execute_non_acc_mode(AspeedHACEState *s, int algo,
+                                      struct iovec *iov, int iov_idx)
+{
+    g_autofree uint8_t *digest_buf = NULL;
+    Error *local_err = NULL;
+    size_t digest_len = 0;
+
+    if (qcrypto_hash_bytesv(algo, iov, iov_idx, &digest_buf,
+                            &digest_len, &local_err) < 0) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: qcrypto hash bytesv failed : %s",
+                      __func__, error_get_pretty(local_err));
+        error_free(local_err);
+        return;
+    }
+
+    hash_write_digest_and_unmap_iov(s, iov, iov_idx, digest_buf, digest_len);
+}
+
 static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                               bool acc_mode)
 {
@@ -304,15 +323,12 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             s->hash_ctx = NULL;
             s->total_req_len = 0;
         }
-    } else if (qcrypto_hash_bytesv(algo, iov, iov_idx, &digest_buf,
-                                   &digest_len, &local_err) < 0) {
-        qemu_log_mask(LOG_GUEST_ERROR, "qcrypto hash bytesv failed : %s",
-                      error_get_pretty(local_err));
-        error_free(local_err);
-        return;
-    }
 
-    hash_write_digest_and_unmap_iov(s, iov, iov_idx, digest_buf, digest_len);
+        hash_write_digest_and_unmap_iov(s, iov, iov_idx, digest_buf,
+                                        digest_len);
+    } else {
+        hash_execute_non_acc_mode(s, algo, iov, iov_idx);
+    }
 }
 
 static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
-- 
2.43.0

