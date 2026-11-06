Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521FC606A326
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nu2VN4R+
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPHkh-00054F-Md; Fri, 06 Nov 2026 06:04:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1xPHkd-0004yh-Fn
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 06:04:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1xPHkZ-0007jS-Ax
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 06:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793963090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pH6P4DyS3Pqr9gOuvpmn13zFS8d17KXTQJIh3PTz2pE=;
 b=Nu2VN4R+UPSWQl+gXkXYQzca6dn050+eiRs5mQh8xCnsTxRL2bDvZ/7a1jmyuauql6E16y
 1cn3yeluzG29ihTojqswPUPRg3GVYluDNjJfJc5NIkwFh4L9UuhY9pBRxqiqGYEjQSMVmd
 mrcsS9uyIaLtlGfzvtoLD4woCrMGA5E=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-438-uSkUeVqPPTuvUe26bF-RsA-1; Fri,
 06 Nov 2026 06:04:44 -0500
X-MC-Unique: uSkUeVqPPTuvUe26bF-RsA-1
X-Mimecast-MFC-AGG-ID: uSkUeVqPPTuvUe26bF-RsA_1793963083
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B46461956063; Fri,  6 Nov 2026 11:04:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.2])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0F4491956087; Fri,  6 Nov 2026 11:04:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BBFF721E6882; Fri, 06 Nov 2026 12:04:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, milesg@linux.ibm.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, mark.caveayland@nutanix.com
Subject: [PATCH 3/8] hw/gpio/pca9554: Simplify QOM type creation
Date: Fri,  6 Nov 2026 12:04:35 +0100
Message-ID: <20261106110440.3552588-4-armbru@redhat.com>
In-Reply-To: <20261106110440.3552588-1-armbru@redhat.com>
References: <20261106110440.3552588-1-armbru@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 8Wj9NBQveoJdV8OwLSMzWaQmiRN-eRGvp2leNrG_sgM_1793963083
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

According to object.h, direct usage of DECLARE_INSTANCE_CHECKERS()
should be avoided, and the complete OBJECT_DECLARE_TYPE macro is
recommended instead.  So use that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/gpio/pca9554.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/gpio/pca9554.c b/hw/gpio/pca9554.c
index e5a1932c89..caa73f63c9 100644
--- a/hw/gpio/pca9554.c
+++ b/hw/gpio/pca9554.c
@@ -22,14 +22,12 @@
 #include "trace.h"
 #include "qom/object.h"
 
-typedef struct PCA9554State PCA9554State;
-DECLARE_INSTANCE_CHECKER(PCA9554State, PCA9554,
-                         TYPE_PCA9554)
-
 #define PCA9554_NR_REGS 4
 #define PCA9554_PIN_COUNT 8
 #define PCA9536_PIN_COUNT 4
 
+OBJECT_DECLARE_TYPE(PCA9554State, PCA9554Class, PCA9554)
+
 struct PCA9554State {
     /*< private >*/
     I2CSlave i2c;
@@ -52,10 +50,6 @@ struct PCA9554Class {
 
     uint8_t pin_count;
 };
-typedef struct PCA9554Class PCA9554Class;
-
-DECLARE_CLASS_CHECKERS(PCA9554Class, PCA9554,
-                       TYPE_PCA9554)
 
 #define PCA9554_PIN_LOW  0x0
 #define PCA9554_PIN_HIZ  0x1
-- 
2.55.0


