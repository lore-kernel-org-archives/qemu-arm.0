Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4045954njc;
        Mon, 26 May 2025 01:07:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUuYS1aQjM3PFiXem3adARqR6nczNY6uTz888g/Bb70v2pAMIFUUwonFnL+ysTMhnyWsdr4b1uV81Ha/g==@linaro.org
X-Google-Smtp-Source: AGHT+IGUPtsdY+3tdbe/lktjqFwbZ3M4aAzn+TnHSwX0fBIv/+ZWsIX9zc5OJLEg6cQBfRo+AOAG
X-Received: by 2002:a05:622a:540a:b0:474:fee1:7915 with SMTP id d75a77b69052e-49f46e3b384mr144085861cf.31.1748246854048;
        Mon, 26 May 2025 01:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748246854; cv=none;
        d=google.com; s=arc-20240605;
        b=gr+XHmFfYa7zwjT/ReXrFoVpdGrohuG9z1sCKpexpttxPogZNUZQZnCUA56ONxNn40
         K/vH+hkWJeeLn+D/pNfme1PPbaDiKuFcZKJ5SCra50Zr6VdsAU2Cm5sou9Ef+S1PM+c3
         6cdp//1iItpxLRR0oj1Nf8o79yQgObKNLSTqpx5lW6oBafQpsgmjgvmWFd/JSM+0E/Fi
         N1YyJwha4QlXWzmriDuX1U3UJ1P5dfXtuKUC014xzeEQA7WZ38KVpEHqx2152cQGXzz5
         hXCQxFXvsJDu7Y2b+0MbGC6uNoWZ/DgtLHItuGsSI77HEUfZU+bKBkW5PTAq7x5cqZ5X
         N5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cD9kW90sGkrW2nGYGqTYAf51SA64wzKUAEhh8PYOI50=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=FVNvLvuWjP8eSVasqnsTbcCTSh4NroA7mLFex34Ij5cLACXhk87CuJyFosHqyyJ+uZ
         pCE6e73drIr+YJsV4SElVHq0wEC1mShiIsvL0G9rb2aQ2okqlCKUlNWqZJzzOrcJNFoK
         WWRbAi7aAq3CYhfdP2iRuAxStG4o5Jgfdj6WRpxvMgAr2CXBufRBcSuyilh12O8y8Qv9
         4Bg2dmr69efS8p/9ieW7Jql+NQ8t6xEgEDiY/V9nSZUqhRsQL/AduTyGnCORoD7tUWuu
         RsEkUExmYfepNASHvbEgzbHMO2aWVxiHcfmr3Nh7lZ/BvGuIJ0n6SiGmyWts46VYG0XI
         iNgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NMB6WgV8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae57b9c9si228841961cf.376.2025.05.26.01.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 01:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NMB6WgV8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJSql-0005BY-VP; Mon, 26 May 2025 04:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uJSqg-00050e-6S
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uJSqe-0002Ld-8H
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748246774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cD9kW90sGkrW2nGYGqTYAf51SA64wzKUAEhh8PYOI50=;
 b=NMB6WgV8hc50Knj12d7Hfbe2uQbAy5AzqbwI+WpLY7vRNzaraPoXHfjewHLL1/nhHab3io
 szUcNC8Opb4UHPtpYJaFuzQodR0fzHS2lY8sXz/mJzty6Ak9sUig8EQeBXlY/fDD6wh96V
 fFsob2Mf5YLT4cfLY3vJTwoHQhBoul8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-5zGJA7lJMQez1RvjtwVpTw-1; Mon,
 26 May 2025 04:05:38 -0400
X-MC-Unique: 5zGJA7lJMQez1RvjtwVpTw-1
X-Mimecast-MFC-AGG-ID: 5zGJA7lJMQez1RvjtwVpTw_1748246737
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 340E9195423F; Mon, 26 May 2025 08:05:37 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.224.49])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8E0FA18003FD; Mon, 26 May 2025 08:05:35 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 05/39] hw/misc/aspeed_hace: Ensure HASH_IRQ is always set to
 prevent firmware hang
Date: Mon, 26 May 2025 10:04:38 +0200
Message-ID: <20250526080512.1697528-6-clg@redhat.com>
In-Reply-To: <20250526080512.1697528-1-clg@redhat.com>
References: <20250526080512.1697528-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
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
X-TUID: zudihwqt5NMn

From: Jamin Lin <jamin_lin@aspeedtech.com>

Currently, if the program encounters an unsupported algorithm, it does not set
the HASH_IRQ bit in the status register and send an interrupt to indicate
command completion. As a result, the FW gets stuck waiting for a completion
signal from the HACE module.

Additionally, in do_hash_operation, if an error occurs within the conditional
statement, the HASH_IRQ bit is not set in the status register. This causes the
firmware to continuously send HASH commands, as it is unaware that the HACE
model has completed processing the command.

To fix this, the HASH_IRQ bit in the status register must always be set to
ensure that the firmware receives an interrupt from the HACE module, preventing
it from getting stuck or repeatedly sending HASH commands.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Fixes: c5475b3 ("hw: Model ASPEED's Hash and Crypto Engine")
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250515081008.583578-4-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_hace.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 6be94963bce7..1256926d2276 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -267,12 +267,6 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                             iov[iov_idx - 1].iov_len, false,
                             iov[iov_idx - 1].iov_len);
     }
-
-    /*
-     * Set status bits to indicate completion. Testing shows hardware sets
-     * these irrespective of HASH_IRQ_EN.
-     */
-    s->regs[R_STATUS] |= HASH_IRQ;
 }
 
 static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
@@ -356,10 +350,16 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
                 qemu_log_mask(LOG_GUEST_ERROR,
                         "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
                         __func__, data & ahc->hash_mask);
-                break;
+        } else {
+            do_hash_operation(s, algo, data & HASH_SG_EN,
+                    ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
         }
-        do_hash_operation(s, algo, data & HASH_SG_EN,
-                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
+
+        /*
+         * Set status bits to indicate completion. Testing shows hardware sets
+         * these irrespective of HASH_IRQ_EN.
+         */
+        s->regs[R_STATUS] |= HASH_IRQ;
 
         if (data & HASH_IRQ_EN) {
             qemu_irq_raise(s->irq);
-- 
2.49.0

