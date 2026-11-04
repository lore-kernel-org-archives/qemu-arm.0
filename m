Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA1606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 06:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SyR+YWyu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOUlN-0006q6-Jc; Wed, 04 Nov 2026 01:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1xOUl2-0006lL-4K
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 01:46:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1xOUkz-0002ct-05
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 01:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793774759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+IlFRCa4ft6MY5EMf0Mo9x2BH8oNi4KEBnja+0szPFc=;
 b=SyR+YWyuBKEf6rStvWc8KJRPVPib8d5jPuWtvuenpwXPmqlBYKld0eTJOmjChXIZkVl3fb
 dxnp2lZm7/e8uWh8/YdrDtvHWPcvRoJq6DEoY5iUFgzXEpNRpCO2YsqHG82klDaeFAmvER
 Xc87RiTAHula52gDouuW2QJi6Ir4VoM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-690-ac1dDeQjM7axeUFalYyc7w-1; Wed,
 04 Nov 2026 01:45:56 -0500
X-MC-Unique: ac1dDeQjM7axeUFalYyc7w-1
X-Mimecast-MFC-AGG-ID: ac1dDeQjM7axeUFalYyc7w_1793774755
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CA2DF19560BC; Wed,  4 Nov 2026 06:45:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.2])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5AFA41956088; Wed,  4 Nov 2026 06:45:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B8E5921E6880; Wed, 04 Nov 2026 07:45:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 milesg@linux.ibm.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 2/4] hw/gpio/pca9552: Fix @type of pca9552 property led<N>
Date: Wed,  4 Nov 2026 07:45:50 +0100
Message-ID: <20261104064552.959862-3-armbru@redhat.com>
In-Reply-To: <20261104064552.959862-1-armbru@redhat.com>
References: <20261104064552.959862-1-armbru@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 8FV-hf0DVUXuMqC3w0jmWqYaff-Na-oGyxfxzAjMWws_1793774755
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pca955x_initfn() passes @type "bool" to object_property_add().  The
properties are actually string-typed: pca955x_get_led() and
pca955x_set_led() use visit_type_str().  Pass "str" instead.

Fixes: a90d8f84674d ("misc/pca9552: Add qom set and get")
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/gpio/pca9552.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/pca9552.c b/hw/gpio/pca9552.c
index 7e5fda4980..07ef0fb20b 100644
--- a/hw/gpio/pca9552.c
+++ b/hw/gpio/pca9552.c
@@ -567,7 +567,7 @@ static void pca955x_initfn(Object *obj)
         if (k->has_led_support) {
             /* LED variant: expose the LED selector state as led%d. */
             name = g_strdup_printf("led%d", ix);
-            object_property_add(obj, name, "bool", NULL,
+            object_property_add(obj, name, "str", NULL,
                                 pca955x_get_led, pca955x_set_led, NULL, NULL);
         } else {
             /* GPIO variant: expose the pin logic level as pin%d. */
-- 
2.55.0


