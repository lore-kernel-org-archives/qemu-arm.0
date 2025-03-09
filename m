Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp608211njc;
        Sun, 9 Mar 2025 06:57:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYi1ihjMA6FLFWs1AwfGoaGvKl5A0qLoJQ/MZBOGvrB94EjTkBjXgfX7DAjNIJJ8wc71yaw/TNNSPX1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG6dR1UBLeuEMbawal1okVwZKhEuxxhzNWhxSpPt62klSePBlrtDvySysPa5v34N/lCHzEv
X-Received: by 2002:a05:622a:528a:b0:474:de57:8c53 with SMTP id d75a77b69052e-476623891bemr83301631cf.4.1741528649714;
        Sun, 09 Mar 2025 06:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528649; cv=none;
        d=google.com; s=arc-20240605;
        b=SLfgo7rih5ocF3aiuKRzDwJSMCZpLuSu5kZzwgXcwAS9y/uyiyWNq9HSdn6ODfyQW1
         LK6d47VkASCs6H+E8x95eFa05n9Ri+QogXU3hMFE5w2sAzy5K3ItUMjLeTRfThv93bsg
         kaY0ek5N1nL/R7PZB1aBgKnsjworYu28RZkiD6ZRnLRKGiSTVWaTsjDF8zDXJx2DV/Sj
         fwnvmltRRRQXDRYfXfOGvv7ntSI8yUUleu0a2UYeMuNOt4SJK496QOf3pFv0Nu2XCik0
         vF3YxE6oUZM6wCJSIkWER1d3FKI5IDOn8a6U7F9yVqVICUCKFZUOgQD3/YhFmeVgybiN
         ykHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YoI8GuRMpRUHRNia4eBQVQe6sszmgwkcTyrJ8pUstX8=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=BGjGdqKA7/XZWohWXmi/AJ+7udGo0vMOZW9KFANWqR+ljZY7eigy5b3BUd7U9EpwdP
         4kfZFqjVtavUumapUcOM57JQbbLxTwOq6T60w3GUVitmSaojpd/FNl1UvufVl0n1/Qae
         ApepGutVLOGXLjzr4pyzrJJOF/cGnD3mheW8lrxSM13MyaxEpbf6iwi84v+NflqjV6iR
         V4+3tQWU/DudzQwrM23jU5xc8RammfzLVLJQG0+Odq0Sp+ZSKjJZ6AkegfZayMzfmEDP
         8ErQv0to7LFETlrkE/lg2rbkrCoqw/nS9YsZ2u9oqh8O03UBTkqfp1YCMMau6usXrwEg
         OokQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JMGH9eEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47689293ad3si2457021cf.349.2025.03.09.06.57.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:57:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JMGH9eEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH4c-0007fS-D2; Sun, 09 Mar 2025 09:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4W-0007Y3-An
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4R-00029p-U8
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoI8GuRMpRUHRNia4eBQVQe6sszmgwkcTyrJ8pUstX8=;
 b=JMGH9eElKED3L+alv4SuLprmPsY3/fqHF5SqwzFUsRpXFpOSg0p3p8WmbW1bAXxvJVfxGy
 VbDu+nUXIfMLFnZh4OvqnAADvOKUXZWxjYykLNIy56ayxGCD/hY/jqyhJVH76S9064xBzJ
 ppsF2egwXSFuspNCUjmzt8n4aoaLYlM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-SCW38zwcMim0E81zpMf1mw-1; Sun,
 09 Mar 2025 09:51:57 -0400
X-MC-Unique: SCW38zwcMim0E81zpMf1mw-1
X-Mimecast-MFC-AGG-ID: SCW38zwcMim0E81zpMf1mw_1741528316
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 26692195608A; Sun,  9 Mar 2025 13:51:56 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8A0511956094; Sun,  9 Mar 2025 13:51:54 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 08/46] hw/misc/aspeed_hace: Fix coding style
Date: Sun,  9 Mar 2025 14:50:52 +0100
Message-ID: <20250309135130.545764-9-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ogXdwECgOSuZ

From: Jamin Lin <jamin_lin@aspeedtech.com>

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250225075622.305515-2-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_hace.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index e3f7df2e862a..18b85081c7c5 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -75,9 +75,12 @@ static const struct {
     { HASH_ALGO_SHA1, QCRYPTO_HASH_ALGO_SHA1 },
     { HASH_ALGO_SHA224, QCRYPTO_HASH_ALGO_SHA224 },
     { HASH_ALGO_SHA256, QCRYPTO_HASH_ALGO_SHA256 },
-    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA512, QCRYPTO_HASH_ALGO_SHA512 },
-    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA384, QCRYPTO_HASH_ALGO_SHA384 },
-    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA256, QCRYPTO_HASH_ALGO_SHA256 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA512,
+      QCRYPTO_HASH_ALGO_SHA512 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA384,
+      QCRYPTO_HASH_ALGO_SHA384 },
+    { HASH_ALGO_SHA512_SERIES | HASH_ALGO_SHA512_SHA256,
+      QCRYPTO_HASH_ALGO_SHA256 },
 };
 
 static int hash_algo_lookup(uint32_t reg)
@@ -201,7 +204,8 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             haddr = address_space_map(&s->dram_as, addr, &plen, false,
                                       MEMTXATTRS_UNSPECIFIED);
             if (haddr == NULL) {
-                qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "%s: qcrypto failed\n", __func__);
                 return;
             }
             iov[i].iov_base = haddr;
-- 
2.48.1

