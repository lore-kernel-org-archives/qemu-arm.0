Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp670735lfb;
        Wed, 11 Nov 2020 10:43:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsMlPB17SMJqUDqGaoTnbTex/bOO2aeE2ce3Mdn4iqaBaV0GZcfZ8uvwEzftWl/R3z0/Sc
X-Received: by 2002:a05:6902:72d:: with SMTP id l13mr30114887ybt.374.1605120226419;
        Wed, 11 Nov 2020 10:43:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605120226; cv=none;
        d=google.com; s=arc-20160816;
        b=FROiUFE+Hhbo5ESLDGxrn3Jn1T4BXDJHCMouwwB9fP0p9RABg8Ip2pMhZPbZr1vjR0
         F/pVMOQ7bRo5aNGc02Wh/MWpQQZuqQ/GFBo2R2Gn9DRJ3u0dTfFJOxbkPCcgfwI6eisx
         96/sk1Smblnwtw1P+fiwKuX7CTWZ1zsMg2IsUUEy6q1ZOs5H9cUtnycvIUetYoShHxPy
         +RisdkWNnNxn7ovr692upl77XAkn2IX1Dj9T0RZWI7DBYW5FFnA8KPkrGAXfHjP9twMq
         8cPq56hk1UU6nJDk7M3NmKfjLt301XVbOTvxyVd7+Yq2SiAHceFpVvfkE6dZpmAX5VFo
         MpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GM7yHtXmsvdlS2d7gUReDtGettnNVOSzGUug6VroSwc=;
        b=RHJcd36Qd/BEhNv2l4RCLC7DrZOZUxqKcX+eRoWnhcFq4502Z5qqoPiRisD88sxz4E
         JJQ2Au2Inb3POe0WW9+E98UvmIu5XHzo6l/naCbxlqXBmqHtOPXMzTwFNUPfu1gCaQ/4
         klapScRd2uILGD8AIWsxIOY1HCJfx4rgZa0wmVbQ//kysJkA/L+D9yHPFd7jhksf4wNf
         Qt4DguTpU4uCCi1nHt9BsIv60Kk48JrNabp1fxdY0HpWNfPWA7hoomD/EnW860ogxSmF
         g4/14tVRho6D/yy4hpz1w6s3h7uGSCRcAR6ODsj/GB6JdMd84dv/A6wgaGbY6Z1N2QAx
         hU2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GueqjTnr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si2854918ybm.436.2020.11.11.10.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 10:43:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GueqjTnr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcv5t-0004Yo-Pa
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 13:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0z-0000GK-Hg
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv0x-0007yq-Nv
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GM7yHtXmsvdlS2d7gUReDtGettnNVOSzGUug6VroSwc=;
 b=GueqjTnrVyrCIs0YPTuYHlBNCVk1xrSNacPQLscJNuxdDwlftLpbXlRlpjWjF226UTQJYN
 1KiC+g31Vd1sVX76H2PIiK7qRtqjNzldCM3NqwABWuzGDU+cl9wWrb0WEqJX4LlvCtbMrP
 SklarlsDsOJhiugp/hsX5DXKk+tnm78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-oK5XFC-2PWisD838sPai6w-1; Wed, 11 Nov 2020 13:38:36 -0500
X-MC-Unique: oK5XFC-2PWisD838sPai6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBE3D1006C84;
 Wed, 11 Nov 2020 18:38:34 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 422FB7366F;
 Wed, 11 Nov 2020 18:38:34 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] virt: Register "its" as class property
Date: Wed, 11 Nov 2020 13:38:17 -0500
Message-Id: <20201111183823.283752-7-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-arm@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SMUWq419jqx8

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Note: "its" is currently registered conditionally, but this makes
the feature be registered unconditionally.  The only side effect
is that it will be now possible to set its=on on virt-2.7 and
older.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 53fcaf5e4f..37a020c149 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2525,6 +2525,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable emulating a "
                                           "guest CPU which implements the ARM "
                                           "Memory Tagging Extension");
+
+    object_class_property_add_bool(oc, "its", virt_get_its,
+                                   virt_set_its);
+    object_class_property_set_description(oc, "its",
+                                          "Set on/off to enable/disable "
+                                          "ITS instantiation");
+
 }
 
 static void virt_instance_init(Object *obj)
@@ -2552,11 +2559,6 @@ static void virt_instance_init(Object *obj)
     } else {
         /* Default allows ITS instantiation */
         vms->its = true;
-        object_property_add_bool(obj, "its", virt_get_its,
-                                 virt_set_its);
-        object_property_set_description(obj, "its",
-                                        "Set on/off to enable/disable "
-                                        "ITS instantiation");
     }
 
     /* Default disallows iommu instantiation */
-- 
2.28.0

