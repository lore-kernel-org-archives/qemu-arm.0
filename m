Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0382CCC6B3C
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 12:24:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHKTV-0005dq-VW; Thu, 15 Oct 2026 08:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1xHKTR-0005QK-Nw
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:22:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1xHKTQ-0005ag-0q
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792066935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4jeaIL5qBVLkK/sDCwk13zw4P82+yF+4WP6MfAHbPY=;
 b=hyOrwlGtzhIOwWgBTm9dpFJRpznRGun8jYvAl6DMnu/2Xv76fuAMWcuX6KqBMEfe1K4/a2
 Xp7LHc5pF+doAkJIkcdQ2dwIiJg9Z5KH2mSaR+e6FU6/O6fNHtNeGm0UcBTAAM0yzmooG2
 kZrPpa+W4ksD87RlJK5ySWDWoxP3bjo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-375-WBb08xioPmab2Y6OnpRxtA-1; Thu,
 15 Oct 2026 12:22:12 +0000
X-MC-Unique: WBb08xioPmab2Y6OnpRxtA-1
X-Mimecast-MFC-AGG-ID: WBb08xioPmab2Y6OnpRxtA_1792066931
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 03A501956063; Thu, 15 Oct 2026 12:22:11 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.48.67])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5932B7D5; Thu, 15 Oct 2026 12:22:09 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 08/21] MAINTAINERS: Update ASPEED BMCs reviewers
Date: Thu, 15 Oct 2026 14:21:38 +0200
Message-ID: <20261015122151.889017-9-clg@redhat.com>
In-Reply-To: <20261015122151.889017-1-clg@redhat.com>
References: <20261015122151.889017-1-clg@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: iazcmjYMVdnuZIOGkudWs3Aoh7ghAhoBWNIvWvQlyFk_1792066931
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Update the ASPEED BMCs reviewer list to reflect the current active
reviewers.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Link: https://lore.kernel.org/qemu-devel/20261005015015.3466808-1-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 MAINTAINERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc60193aa3fb..1ee661cc23ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1265,12 +1265,8 @@ F: tests/functional/arm/test_emcraft_sf2.py
 ASPEED BMCs
 M: Cédric Le Goater <clg@kaod.org>
 M: Peter Maydell <peter.maydell@linaro.org>
-R: Steven Lee <steven_lee@aspeedtech.com>
-R: Troy Lee <leetroy@gmail.com>
 R: Jamin Lin <jamin_lin@aspeedtech.com>
 R: Kane Chen <kane_chen@aspeedtech.com>
-R: Andrew Jeffery <andrew@codeconstruct.com.au>
-R: Joel Stanley <joel@jms.id.au>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/*aspeed*
-- 
2.56.0


