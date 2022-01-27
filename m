Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4183278lfk;
        Thu, 27 Jan 2022 07:44:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzddAEZxxnx+bif4lqoB0hnN3L7wCa4BkEYZCGx/+9iCoT18wjJO+0SYXLf1mlT3/4UXu18
X-Received: by 2002:a05:6902:120c:: with SMTP id s12mr6634136ybu.66.1643298279760;
        Thu, 27 Jan 2022 07:44:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643298279; cv=none;
        d=google.com; s=arc-20160816;
        b=flEb1KkYm4r7NDyNbIhAYiVlQAglQFGOp1sC3eZdYjAHEYt6ielhsFeeK/GtkQK5XV
         fi936b+mv8ASSZIlmULW0dp6eDWf6v5ENFFtE/ko3251CKBLTCR82/KfsExT6YHYk5M0
         5FxVvchBf0NoGaM+koxJSQsNBZqNpDtWbzgWGOgqcrxLMWFskp/Ib9Yyehdv58k+Pqjw
         tCaw2KnmYyg68NYLHO8rXku8onyU4NjKKS1vvPtuon2ew42oHLqQpKFg7KSHL8Yu684d
         icGrcDedgIEk7V0NUtCqtUm4ik809TH6O8vKNuWXDJcESqe68nUmC+WnzD+TEcq+WXM0
         1asg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=A2B2+TVQlWAuqvtCs7R9leG4MI6OE0bzrkXceQTNKVc=;
        b=gTwgGs+/4HPF7pGaSIdTf5+e3TXEWk7vg9cBrkGzLjXYW4PtV9FK6Kh77vUpIRtoqw
         b+UdIwk3NsYizTG9Rxs6AKxNgBmu1RFYe5Rungql7KQl9EIDdVmmKd8CE1T7pCnDSzRG
         JpxRSQjxdw4z/EePAG+257vg2xFYe5YOdEX7Rmqz0kiyfvmJWfhPnhBU/lV9HPHG/dIU
         zCcwu8UsSmoZmrBugGGc/eCL+/2bzglEYiniQ2c77LSeQ57aT2Kquw81q/Dj0VRX/12V
         X/9R5DYVdcksZyRoFRhdH196wDuqrLC1GPluQoJTID9naQCPWpZAf3dTT3YdvUcYqmuv
         ZKFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CqTZPONZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r184si22723926yba.596.2022.01.27.07.44.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:44:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CqTZPONZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6wx-0001rK-1W
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:44:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6VA-0007bN-Tk
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:15:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6V6-0003Ay-Ig
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:15:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2B2+TVQlWAuqvtCs7R9leG4MI6OE0bzrkXceQTNKVc=;
 b=CqTZPONZp3kfFxjcrS4NNEBMfGhFllrfcULrIn7m9py5SA4g5icSblshfUKupoUWRa179x
 QL3NA5F4bRT96OSI+hbhCYOR+WYMnK391mMjNTjHCBa64wIYVn8GWMPM4ZRbEzrycKUxLY
 fa/k79n/FcttBRrqbX4Ni4st7uc3/GM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-M5K2QLXNMW6CzHNaCfVpyQ-1; Thu, 27 Jan 2022 10:15:39 -0500
X-MC-Unique: M5K2QLXNMW6CzHNaCfVpyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B57D101F7A3;
 Thu, 27 Jan 2022 15:15:36 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3538D70D46;
 Thu, 27 Jan 2022 15:15:29 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/38] migration: Perform vmsd structure check during tests
Date: Thu, 27 Jan 2022 16:05:34 +0100
Message-Id: <20220127150548.20595-25-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m2Vnro2Rsjl+

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Perform a check on vmsd structures during test runs in the hope
of catching any missing terminators and other simple screwups.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index b17e624d3f..302babc8cf 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -66,6 +66,7 @@
 #include "net/announce.h"
 #include "qemu/yank.h"
 #include "yank_functions.h"
+#include "sysemu/qtest.h"
 
 const unsigned int postcopy_ram_discard_version;
 
@@ -839,6 +840,39 @@ void unregister_savevm(VMStateIf *obj, const char *idstr, void *opaque)
     }
 }
 
+/*
+ * Perform some basic checks on vmsd's at registration
+ * time.
+ */
+static void vmstate_check(const VMStateDescription *vmsd)
+{
+    const VMStateField *field = vmsd->fields;
+    const VMStateDescription **subsection = vmsd->subsections;
+
+    if (field) {
+        while (field->name) {
+            if (field->flags & (VMS_STRUCT | VMS_VSTRUCT)) {
+                /* Recurse to sub structures */
+                vmstate_check(field->vmsd);
+            }
+            /* Carry on */
+            field++;
+        }
+        /* Check for the end of field list canary */
+        assert(field->flags == VMS_END);
+    }
+
+    while (subsection && *subsection) {
+        /*
+         * The name of a subsection should start with the name of the
+         * current object.
+         */
+        assert(!strncmp(vmsd->name, (*subsection)->name, strlen(vmsd->name)));
+        vmstate_check(*subsection);
+        subsection++;
+    }
+}
+
 int vmstate_register_with_alias_id(VMStateIf *obj, uint32_t instance_id,
                                    const VMStateDescription *vmsd,
                                    void *opaque, int alias_id,
@@ -884,6 +918,11 @@ int vmstate_register_with_alias_id(VMStateIf *obj, uint32_t instance_id,
     } else {
         se->instance_id = instance_id;
     }
+
+    /* Perform a recursive sanity check during the test runs */
+    if (qtest_enabled()) {
+        vmstate_check(vmsd);
+    }
     assert(!se->compat || se->instance_id == 0);
     savevm_state_handler_insert(se);
     return 0;
-- 
2.34.1

