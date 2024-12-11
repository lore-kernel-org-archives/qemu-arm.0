Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3845226njb;
        Tue, 10 Dec 2024 22:32:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFUBaUPH/CCLOpUbpaFH24iX1UGQaIssHOuc8Wp9ImXWyklk9kkDPV5nP5lz9BjTeWTj5Z2KeTG7lLjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFPAPWF7QKd8RHmt/gwTbxi9dAhUMZVhREeqvZ8kBrBND2paS8n25BxaWrIPwFF/pmpEW2r
X-Received: by 2002:ad4:5ce8:0:b0:6d8:7ed4:3367 with SMTP id 6a1803df08f44-6d934aec768mr29711236d6.19.1733898774213;
        Tue, 10 Dec 2024 22:32:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733898774; cv=none;
        d=google.com; s=arc-20240605;
        b=It4HefiBzPMPzu5+22lbDgGbOMDapfGvxZmPx5qfuodBcGnfXfgIIbJx7lc/Y4ep4M
         Otq+eigcaEmwuEtu+EbGDX5h8b6vm+93AwDh/o5LvQuuDoq+FIB+SBEaYX7qau8AqlWV
         2r4v+MvNJM4BsjoZ7SWc540duPLVrYzndc7KzgzGhovHFRqYntefNl5TuT69w1wDV+Cn
         oa7ZPWBWTBNBVZEFOzWt8DyIvw7oyU8an27zSqYgVtKtfJRaL3mJ5ea4YDNvdWgRpUrP
         TGoM+FWVW3L7P0mtM6szpeWz+NJIP2vK22zyAr5pnKvCGK/ufHBqQD84sKZ7t/jsQWs9
         Zb/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BclSUp6IAVJ5JWhVxzeCxnEdPcsWzvQAxDhmtK6Zyls=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=efU3qG61450r0VMOTbywSTngbe7Q1pavm+PRjk+10YWWoX6T9Ol+/KZ0Cv9pONuXsy
         pszOlWtCP85K6j7QbiWdxjMT7B6suW7XJifZ/maHlHJj5nJVJQXyH4B41fO/jqoPY4Qg
         ZKXhEcZaNa49ytygRFvgT83tmQAduZohM7rC/9H3RDH5kRx6yv1Ab6PpDZg9OlSsTCpc
         DrN1o/k/1VKP6F05CR6p8ifOr/ept3TL3SPgwyGNbaLra4Auzp6sfN10kgoqKY2kUFtp
         ASKkDGMtqfVxdnSL53lLZ/V9ADLXSbwfKmngo41apgqfH/FhEdj6+hCkewffn842Nqlk
         Wlng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XURFo9fK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8f4f117a8si119659946d6.284.2024.12.10.22.32.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 22:32:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XURFo9fK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLGFz-0004Za-5D; Wed, 11 Dec 2024 01:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGFu-0004T8-FI
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 01:31:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGFl-0008Rq-8P
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 01:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733898680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BclSUp6IAVJ5JWhVxzeCxnEdPcsWzvQAxDhmtK6Zyls=;
 b=XURFo9fKFJhSfXwrEbGSHt/VKw3JNJtY8m85Kr+zzhvVjJv8M6ELesXk1UYhFqjScpCg/i
 AQupaQPB3Qh1aMvcYc24aDrwAr6iPk9q4xv017+3q0vpPR66Oz2IWV1EK/vtu6QBDaKDgM
 ro3KSWxZMOL9BuAC0tWfk3QhpdXDQBQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-AnAvl-b1POy3Rnn8gyEuxw-1; Wed,
 11 Dec 2024 01:31:17 -0500
X-MC-Unique: AnAvl-b1POy3Rnn8gyEuxw-1
X-Mimecast-MFC-AGG-ID: AnAvl-b1POy3Rnn8gyEuxw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E73561956056; Wed, 11 Dec 2024 06:31:15 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.144])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1234F1956054; Wed, 11 Dec 2024 06:31:08 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 03/24] hw/arm/aspeed: Fix coding style
Date: Wed, 11 Dec 2024 07:30:37 +0100
Message-ID: <20241211063058.1222038-4-clg@redhat.com>
In-Reply-To: <20241211063058.1222038-1-clg@redhat.com>
References: <20241211063058.1222038-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 2Wm87jR9SMC5

From: Jamin Lin <jamin_lin@aspeedtech.com>

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20241204084453.610660-3-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast2600.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index be3eb70cdd77..c40d3d84435f 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -541,7 +541,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
     }
-    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
+                    sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
 
-- 
2.47.1

