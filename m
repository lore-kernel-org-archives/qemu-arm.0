Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8CACDE000
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 10:33:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcKrm-0008ER-8g; Wed, 24 Jun 2026 06:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wcKrk-0008CO-Ty
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 06:29:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wcKrj-0007Ko-KP
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 06:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782296995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bqd+48YFH3p5jZTGj4/Jgg9aZXLgidEu4QGg0yoGco=;
 b=TulS04n68RER0o2nhF811DP9/1N3p3kMsq46KtyjtVm2fXryAhc+RnwOW8lXH7+iJNTAOs
 DQyHQ6Tw54jh9sJndQAuUV9cnxC3237vpzQK0ll4RO4ActggqR51RG9Ms4s+pZkIO4iUfl
 rQKTWK8+++52oemusDn3pA28gYd9bOw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-455-p7JFMpWANme5mEW06kJQ7w-1; Wed,
 24 Jun 2026 06:28:45 -0400
X-MC-Unique: p7JFMpWANme5mEW06kJQ7w-1
X-Mimecast-MFC-AGG-ID: p7JFMpWANme5mEW06kJQ7w_1782296924
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EB8BD195604C; Wed, 24 Jun 2026 10:28:43 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F0E0B3000B54; Wed, 24 Jun 2026 10:28:41 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, eauger@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org
Subject: [PATCH v3 03/17] arm: sbsa_gwdt: rename device type to sbsa-gwdt
Date: Wed, 24 Jun 2026 12:28:16 +0200
Message-ID: <20260624102830.1355552-4-imammedo@redhat.com>
In-Reply-To: <20260624102830.1355552-1-imammedo@redhat.com>
References: <20260624102830.1355552-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: CTxaIQh-lw1rgvrTLpYnY9B1XDEn6KWPlvV7L95VhIw_1782296924
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
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

Use hyphenated name to follow QEMU device naming convention.
Migration compatibility is preserved since the vmstate name
is already "sbsa-gwdt".

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/watchdog/sbsa_gwdt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/watchdog/sbsa_gwdt.h b/include/hw/watchdog/sbsa_gwdt.h
index 307a4f291a..8941dcff9e 100644
--- a/include/hw/watchdog/sbsa_gwdt.h
+++ b/include/hw/watchdog/sbsa_gwdt.h
@@ -16,7 +16,7 @@
 #include "hw/core/sysbus.h"
 #include "hw/core/irq.h"
 
-#define TYPE_WDT_SBSA "sbsa_gwdt"
+#define TYPE_WDT_SBSA "sbsa-gwdt"
 #define SBSA_GWDT(obj) \
     OBJECT_CHECK(SBSA_GWDTState, (obj), TYPE_WDT_SBSA)
 #define SBSA_GWDT_CLASS(klass) \
-- 
2.47.3


