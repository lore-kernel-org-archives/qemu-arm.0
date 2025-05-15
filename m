Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1691746njb;
        Thu, 15 May 2025 01:13:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/+ImX5P6L/w6hm2iucwjcefZ0i46sZ2kx5KLNFZB2Rlrej5nONJlhDEdYxEPe5MO/P5DnESnuYIT5sA==@linaro.org
X-Google-Smtp-Source: AGHT+IFWc03AB+yxpMNaKLW/1Be1BkhUY62bdiJYHjqLiGlD/K1Ap9fV4Gy9Ppv67u/LuKwkZEMd
X-Received: by 2002:a05:6214:f23:b0:6f5:437a:d316 with SMTP id 6a1803df08f44-6f8a4b9cc6amr22801766d6.11.1747296779869;
        Thu, 15 May 2025 01:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296779; cv=none;
        d=google.com; s=arc-20240605;
        b=c76ZBsMPtbk6Nmci4SMKFixE3ZvmNg8TTeWshXHaj7hDyA4IDkzWiymXle3sKHHgNR
         uLzsUrK3CBvWvrjg0DsyKa1KYeMLUMGoIVajjLdTMg//wRUJfQwb5JaNgDDggg5KkMz/
         GgnB4MLlVdBO40IUxtnv8lmUlB6zHKVcFafMQsUJkYdMG2kPiZOEpl1L6oFXZ5rd5qgC
         FFmcWxW1L33i/M6+TF27bYhCdk4iQeBJwowpfp70aGFVyibeoLjFsnbrL2iozGGdh+Tf
         sdcsT0OKqwfCv3lqKI8z5CxoQQvu0HETl7/ivYiw9y+Ld7bxGPsInYLxgLn/mTvLOZnJ
         Vp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=YRdM+tAt8ow64KLelIXzy+r+gTTaK7pGlpj2UHTWwIA=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=bZr0E8IBSbtQTrZc2Xo0KVbLZ+CDY/ikKMeQ/IMkDzrGIDMNBlMcpjDxBsAE8UntBS
         8yuH11JqJasVQY/lW4QIrG7iWhnUaYqM8yW95xcvVtkMJy3J25lFZuDEoyhEw65CKYCR
         BkrET3obKWcGroILJr8q+/VtvV4WAtURrHjmvd20ubkg38gEhLDw+LV4RDPZElopUCEz
         n/WSc0mRw5txcXjaIIeMuafKXQbrUW+GyJqqN5mLs5lQlnObqPBpUbOU5QpDumNlztqL
         XolvhZXW56j2qk4/6HFO9krvaEc8ctmxSsIVYxUG5NTPXog09Dr2fp9vkgEs/S5oSpHz
         8eiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452459d60si157379571cf.37.2025.05.15.01.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uFTh8-0006zd-G4; Thu, 15 May 2025 04:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfz-0003Uj-28; Thu, 15 May 2025 04:10:47 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uFTfx-00010V-2K; Thu, 15 May 2025 04:10:46 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 May
 2025 16:10:11 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 May 2025 16:10:11 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 11/28] hw/misc/aspeed_hace: Support accumulative mode for
 direct access mode
Date: Thu, 15 May 2025 16:09:43 +0800
Message-ID: <20250515081008.583578-12-jamin_lin@aspeedtech.com>
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
X-TUID: yc5tNruck+RT

Enable accumulative mode for direct access mode operations. In direct access
mode, only a single source buffer is used, so the "iovec" count is set to 1.
If "acc_mode" is enabled:
1. Accumulate "total_req_len" with the current request length ("plen").
2. Check for padding and determine whether this is the final request.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 62649b5b27..049f732f99 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -151,8 +151,11 @@ static uint64_t hash_get_source_addr(AspeedHACEState *s)
     return src_addr;
 }
 
-static int hash_prepare_direct_iov(AspeedHACEState *s, struct iovec *iov)
+static int hash_prepare_direct_iov(AspeedHACEState *s, struct iovec *iov,
+                                   bool acc_mode, bool *acc_final_request)
 {
+    uint32_t total_msg_len;
+    uint32_t pad_offset;
     uint64_t src;
     void *haddr;
     hwaddr plen;
@@ -171,9 +174,23 @@ static int hash_prepare_direct_iov(AspeedHACEState *s, struct iovec *iov)
     }
 
     iov[0].iov_base = haddr;
-    iov[0].iov_len = plen;
     iov_idx = 1;
 
+    if (acc_mode) {
+        s->total_req_len += plen;
+
+        if (has_padding(s, &iov[0], plen, &total_msg_len,
+                        &pad_offset)) {
+            /* Padding being present indicates the final request */
+            *acc_final_request = true;
+            iov[0].iov_len = pad_offset;
+        } else {
+            iov[0].iov_len = plen;
+        }
+    } else {
+        iov[0].iov_len = plen;
+    }
+
     return iov_idx;
 }
 
@@ -345,7 +362,8 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
     if (sg_mode) {
         iov_idx = hash_prepare_sg_iov(s, iov, acc_mode, &acc_final_request);
     } else {
-        iov_idx = hash_prepare_direct_iov(s, iov);
+        iov_idx = hash_prepare_direct_iov(s, iov, acc_mode,
+                                          &acc_final_request);
     }
 
     if (iov_idx <= 0) {
-- 
2.43.0

