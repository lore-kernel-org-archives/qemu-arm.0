Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4045571njc;
        Mon, 26 May 2025 01:06:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJNj1M7oaUTCNXIj2sbFfPfB1sjmze2owUWAC8z2SLKu6EQmYjC7L58tXtrq6UF8FpGuvlbQd14Pi/gQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEf0v43QaNPBBEsc+l6ZK3syWZvESu6flTX3G16Xv6gSws5LohEUFqyzEIJaPsK3mhxLsjR
X-Received: by 2002:a05:622a:5147:b0:477:4df:9a58 with SMTP id d75a77b69052e-49f4674d4c4mr153957001cf.18.1748246799799;
        Mon, 26 May 2025 01:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748246799; cv=none;
        d=google.com; s=arc-20240605;
        b=I9KZ6hPSZqjRfBFYa1JFUehvV1aRRnsXZ8qITTCDiYP/DJw3mnnIdxE6G+CHrSW9th
         aTS3h0o1qQ1XO4Jo92qZHPrzhykO5AvLB/jUbAfid6WjgmL0RxCu+U/6rwwRNMmCJrTw
         f6CjKRzLZWgVw2SvEpnUFW40ITRp8mq11Wc07sE9Z6nrm/TWjaUvMTZt2iq/hD70YfQ+
         fMbQyGPxMxtZSeudppDBxE6zL9a/l96l85M+SxchZpRgp0y6o86Ftq9oKmWwuP0klF03
         DYtEbj9HqYQrFatjO9AK/KBRVkQHh9QH7rzGhtjpNu9byuLsuC1DhHfCuWGofrZ8kCmX
         VSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HfGN9ZH/qL+FliRNkApFqSVweldnK8DBomt8HvC3C9Y=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=FtDh4zqDubmIBo1L/+6FcT2CWMin5Z6ms8GRt/QmWTPTe/kSgfTjVllag8oBKkhpMt
         wfokjqeDB+urI6Mn5a/OG0T8b+CmLxSZRwjCHLIMLEQdyqKcy8U2oQlZaTP8dRmMqucG
         pfLvm1wDrZCOmng+L2Ni2NUzq9xWsdod+M1Bepbf4gXRHAi2o3ubqc3G6riE8D/pa4eA
         UHypewKW0Z79dqA8d4ThWKoNmdD5YsXQJBSn6KN8VtAx2a5+hxO+mT8JwXdIzuBduwtb
         kJ+nz3YyxqgrGd3L33fKcuQWk8F2tUlgn67GsfNrzKp5mCj7Ih5B+OMAwBLU4T0Uovtp
         4uKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OtZfNP/l";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae595bc2si242424191cf.599.2025.05.26.01.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 01:06:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OtZfNP/l";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uJSqm-0005Ce-Pa; Mon, 26 May 2025 04:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uJSqk-000583-4C
 for qemu-devel@nongnu.org; Mon, 26 May 2025 04:06:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uJSqh-0002M2-MY
 for qemu-devel@nongnu.org; Mon, 26 May 2025 04:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748246779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfGN9ZH/qL+FliRNkApFqSVweldnK8DBomt8HvC3C9Y=;
 b=OtZfNP/lM8Fz9Vh7s9YDRGHB5SwLEwWLXqqultupcIBCawFJhK5EPvSrwU9xHV+YM2y/vy
 Vq5QScdAoBiIDrs0gTW4dpF/cZVR99zPL6eGZzXG9wqR7uVRF1hJPfnU1tJZgmE6z5gHCu
 CsGnKuKr0TuOEa8NEA1szGovswEck+Q=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-186-UsMuewjaPNqQAe36Pe8pQA-1; Mon,
 26 May 2025 04:05:44 -0400
X-MC-Unique: UsMuewjaPNqQAe36Pe8pQA-1
X-Mimecast-MFC-AGG-ID: UsMuewjaPNqQAe36Pe8pQA_1748246743
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B9E7518009A2; Mon, 26 May 2025 08:05:43 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.224.49])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 223DD18003FD; Mon, 26 May 2025 08:05:41 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 08/39] hw/misc/aspeed_hace: Extract digest write and iov unmap
 into helper function
Date: Mon, 26 May 2025 10:04:41 +0200
Message-ID: <20250526080512.1697528-9-clg@redhat.com>
In-Reply-To: <20250526080512.1697528-1-clg@redhat.com>
References: <20250526080512.1697528-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.904,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ltnd9F5qGCxx

From: Jamin Lin <jamin_lin@aspeedtech.com>

To improve code readability and maintainability of do_hash_operation(), this
commit introduces a new helper function: hash_write_digest_and_unmap_iov().

The helper consolidates the final digest writeback and subsequent unmapping of
the I/O vectors into a single routine.

No functional changes are introduced.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250515081008.583578-7-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_hace.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 22eea62693c7..7da781f8649e 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -228,6 +228,26 @@ static int hash_prepare_sg_iov(AspeedHACEState *s, struct iovec *iov,
     return iov_idx;
 }
 
+static void hash_write_digest_and_unmap_iov(AspeedHACEState *s,
+                                            struct iovec *iov,
+                                            int iov_idx,
+                                            uint8_t *digest_buf,
+                                            size_t digest_len)
+{
+    if (address_space_write(&s->dram_as, s->regs[R_HASH_DEST],
+                            MEMTXATTRS_UNSPECIFIED, digest_buf, digest_len)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Failed to write digest to 0x%x\n",
+                      __func__, s->regs[R_HASH_DEST]);
+    }
+
+    for (; iov_idx > 0; iov_idx--) {
+        address_space_unmap(&s->dram_as, iov[iov_idx - 1].iov_base,
+                            iov[iov_idx - 1].iov_len, false,
+                            iov[iov_idx - 1].iov_len);
+    }
+}
+
 static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                               bool acc_mode)
 {
@@ -292,18 +312,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
         return;
     }
 
-    if (address_space_write(&s->dram_as, s->regs[R_HASH_DEST],
-                            MEMTXATTRS_UNSPECIFIED,
-                            digest_buf, digest_len)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "aspeed_hace: address space write failed\n");
-    }
-
-    for (; iov_idx > 0; iov_idx--) {
-        address_space_unmap(&s->dram_as, iov[iov_idx - 1].iov_base,
-                            iov[iov_idx - 1].iov_len, false,
-                            iov[iov_idx - 1].iov_len);
-    }
+    hash_write_digest_and_unmap_iov(s, iov, iov_idx, digest_buf, digest_len);
 }
 
 static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
-- 
2.49.0

