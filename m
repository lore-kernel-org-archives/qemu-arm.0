Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp666956lfb;
        Wed, 11 Nov 2020 10:39:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwz+M/1x9KsARn4kQYlg3lu4iXJCox8fs9G4tO2oczKSGr2LWJIDEA5WqUd5G7mNaiV/A42
X-Received: by 2002:a25:d7d8:: with SMTP id o207mr29417765ybg.274.1605119960817;
        Wed, 11 Nov 2020 10:39:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605119960; cv=none;
        d=google.com; s=arc-20160816;
        b=L67rEPi0tOsqv7m5cOQOcCgLjPW0GLyXoPqt4QStLvRP5dJWKARWSuH82IwT7OW0RX
         aEYInnh8+5K7/++kcUMpyd21ZSj0vN2dSbp24+sanX817FFsLLUFjtq3H2GSJKJXtQ2A
         QE7tC4lmNkBCBvOp2mHxIyEhu+ZdQdOe2bq+L5miLbTI7HZHBhqPLeJiGaOYnxkdSpvA
         26wK0rCO4kjqGRfiazVlMNig5nJe7zwmB1Lqjhb4RWqg79mnflNamFGd7nDuUl7ojdil
         FPdhQqmz7Sv2AzhN6LnXBaCDJKHR+oXffrq0IHY7pzO2E4yJKjP+1JNN5UM+gpjz/37+
         pX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HbFMJjy+ZSanPn+Sow/4EnPoUc4YBNEueLHqjzrwRBk=;
        b=LELKLaX4Tg1d95sQksGi7KOPyQsT5zdmJZ73heO8UKjpr8jqCscnetWn8jefW/LDnA
         RwnpOC/hVqSZ8mNYOI1WKy2ykGEvUU/63NdRJAUZkn+bDpIFZeqLXAUHqHxpe9pjRu6o
         9WWQphVhIl1Wdht1YKnAJKRmhBa5EaVLnJ0l9Fet0SXwgFmoNoWWT9Gn6X4rHM3w0wct
         ghn8eM+6bAqgP9TLORMYNjErysa6aIfCY8y1faX7bXA7enUFlXnqYfCL8ZnnUvfj4R9h
         bU2SyKW1N7tGl98vFcoCI7ExYzva7FSmuoYjZkr0gsgBnFDy8f5zkA5FEYT+6wroTBV0
         wd+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e7c3H+yP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si2880637ybb.448.2020.11.11.10.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 10:39:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e7c3H+yP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcv1c-0000A2-7J
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 13:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0t-00008k-NS
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 13:38:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0q-0007uo-4l
 for qemu-arm@nongnu.org; Wed, 11 Nov 2020 13:38:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbFMJjy+ZSanPn+Sow/4EnPoUc4YBNEueLHqjzrwRBk=;
 b=e7c3H+yPlhkqdFZqsca0PbL797O/ri+DLx7AF+2ScB8jyWSdj8is1+E42sL2dFC9WkI/qn
 2M0X+12BMvvYT8Q4fdL4AAB8dLk8HHX0PEEIoVPJtxeHgUZ2KYCbVSRcrLpm03K1SEa40Y
 x4gGvubbqm5ibl+9lMcGMUGBobRedTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-d6yJAgX8M_u_HDof7KmGJA-1; Wed, 11 Nov 2020 13:38:29 -0500
X-MC-Unique: d6yJAgX8M_u_HDof7KmGJA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3869D801FC4;
 Wed, 11 Nov 2020 18:38:28 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8B0727BCD;
 Wed, 11 Nov 2020 18:38:27 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] vexpress-a15: Register "virtualization" as class
 property
Date: Wed, 11 Nov 2020 13:38:13 -0500
Message-Id: <20201111183823.283752-3-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D5Jzr5epGDmO

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/vexpress.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index da25ce3b2c..c228567ce9 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -766,12 +766,6 @@ static void vexpress_a15_instance_init(Object *obj)
      * but can also be specifically set to on or off.
      */
     vms->virt = true;
-    object_property_add_bool(obj, "virtualization", vexpress_get_virt,
-                             vexpress_set_virt);
-    object_property_set_description(obj, "virtualization",
-                                    "Set on/off to enable/disable the ARM "
-                                    "Virtualization Extensions "
-                                    "(defaults to same as 'secure')");
 }
 
 static void vexpress_a9_instance_init(Object *obj)
@@ -819,6 +813,14 @@ static void vexpress_a15_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
 
     vmc->daughterboard = &a15_daughterboard;
+
+    object_class_property_add_bool(oc, "virtualization", vexpress_get_virt,
+                                   vexpress_set_virt);
+    object_class_property_set_description(oc, "virtualization",
+                                          "Set on/off to enable/disable the ARM "
+                                          "Virtualization Extensions "
+                                          "(defaults to same as 'secure')");
+
 }
 
 static const TypeInfo vexpress_info = {
-- 
2.28.0

