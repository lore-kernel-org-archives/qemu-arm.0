Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6186ECDB479
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 10:29:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcKr9-00073p-NB; Wed, 24 Jun 2026 06:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wcKr5-000728-TZ
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 06:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wcKr4-0007Fr-JV
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 06:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782296954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fta3ujsMWU/24uQqd5ToZqhS5bH/tIQ9KiCrl4mbbow=;
 b=OcXTfAMYt7pQlo/qUHjgA5vJg9GfVE99iGjco4l4jtysWCdox9YgAhHgtOzJuggX9GIrdA
 C12TVdBTGVA1m9Csc0IJOF7H5yEv4sta9Pc2drFvYCIc0xK82nGEUEZ7pDS6M7pBi5BRlJ
 Vzq2/wus9OcUQ3GGEQoNDzv+8aTGFuU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-534-50Sd4vyiPkSZP5o8SpZFng-1; Wed,
 24 Jun 2026 06:29:12 -0400
X-MC-Unique: 50Sd4vyiPkSZP5o8SpZFng-1
X-Mimecast-MFC-AGG-ID: 50Sd4vyiPkSZP5o8SpZFng_1782296951
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7D16E1956076; Wed, 24 Jun 2026 10:29:11 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4DC4F30001A7; Wed, 24 Jun 2026 10:29:09 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, eauger@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 14/17] sbsa-gwdt: reduce code ident
Date: Wed, 24 Jun 2026 12:28:27 +0200
Message-ID: <20260624102830.1355552-15-imammedo@redhat.com>
In-Reply-To: <20260624102830.1355552-1-imammedo@redhat.com>
References: <20260624102830.1355552-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 6xMs3bHiQWXdC95Urua_ISnIQazh418Ix_0rgwygeLo_1782296951
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/watchdog/sbsa_gwdt.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
index 1678ab85db..6113dcd077 100644
--- a/hw/watchdog/sbsa_gwdt.c
+++ b/hw/watchdog/sbsa_gwdt.c
@@ -105,25 +105,27 @@ static void sbsa_gwdt_update_timer(SBSA_GWDTState *s, WdtRefreshType rtype)
 
     timer_del(s->timer);
 
-    if (s->wcs & SBSA_GWDT_WCS_EN) {
-        /*
-         * Extract the upper 16 bits from woru & 32 bits from worl
-         * registers to construct the 48 bit offset value
-         */
-        timeout = s->woru;
-        timeout <<= 32;
-        timeout |= s->worl;
-        timeout = muldiv64(timeout, NANOSECONDS_PER_SECOND, s->freq);
-        timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-
-        if ((rtype == EXPLICIT_REFRESH) || ((rtype == TIMEOUT_REFRESH) &&
-                (!(s->wcs & SBSA_GWDT_WCS_WS0)))) {
-            /* store the current timeout value into compare registers */
-            s->wcvu = timeout >> 32;
-            s->wcvl = timeout;
-        }
-        timer_mod(s->timer, timeout);
+    if (!(s->wcs & SBSA_GWDT_WCS_EN)) {
+        return;
+    }
+
+    /*
+     * Extract the upper 16 bits from woru & 32 bits from worl
+     * registers to construct the 48 bit offset value
+     */
+    timeout = s->woru;
+    timeout <<= 32;
+    timeout |= s->worl;
+    timeout = muldiv64(timeout, NANOSECONDS_PER_SECOND, s->freq);
+    timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+    if ((rtype == EXPLICIT_REFRESH) || ((rtype == TIMEOUT_REFRESH) &&
+            (!(s->wcs & SBSA_GWDT_WCS_WS0)))) {
+        /* store the current timeout value into compare registers */
+        s->wcvu = timeout >> 32;
+        s->wcvl = timeout;
     }
+    timer_mod(s->timer, timeout);
 }
 
 static void sbsa_gwdt_rwrite(void *opaque, hwaddr offset, uint64_t data,
-- 
2.47.3


