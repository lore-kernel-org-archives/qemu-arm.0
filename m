Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4355114lfq;
        Mon, 21 Sep 2020 15:22:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT0VSSlacoCaa5CSLJzlwrX3z8sAxTsIylpxmeQUvLh+5v9FprHNAfGzZrSg9VltfNTmHl
X-Received: by 2002:a25:ac09:: with SMTP id w9mr3125070ybi.491.1600726920693;
        Mon, 21 Sep 2020 15:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600726920; cv=none;
        d=google.com; s=arc-20160816;
        b=SY1kPs4p6q5Vqbb6olpg9R7Tc7VldWcpcmV10ph9IdjZ7oGyC4QQo8A0QTmmEkPTX1
         i+feGEXa1juV0pEQnVhIgPu5Md1xOdBMfAxVlUtg9TsbxcvEDpB8RUAT+vMSx+jvwSTH
         qu9jAKFtCK3uIO2sSh+nt38TbBJVW6vex+rCZoTIkohJZK73ynFoaQpQkeLIGQedMncp
         ewu9euUki6120zdWncNdDezHaMYVWKZoik+sWbx3QsdUy+GRjX9inqAz9RldKRt4iNKI
         YqXok+c8iMd6E8wsiGG/dfTepESIvYBt8ObXfrwbCJK20E11QbqtDUbaAAeV0cgcOGDT
         KlNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=folivq79vU79XSA6rq0LSS3y2MaZhG4xZKnlYr4A8ng=;
        b=EelZmBUgiO1APTHbCamC9SedpPx8GPoBgKaB4ARhzDh6/YSu4DFrrXL509NoznV+mm
         vbLEioPmDNjHeLteEmCUo4A3u9JeTxpoiG6bXED+aRXuVsZ0KsRa5uD01M1SkArdZzep
         E2JkUfzpnqRSb5h1aD8gsd4eUrar1qb6dPAjrXgW283xxFc1+Ut+2HpOMnkhCRlSZL+7
         Fk0gubOf+Vgmvmt9ta0s8iJET6y1uuxBgIk+pBxJ2ZpFxfeiGGBDEoR09CM49ySGsou0
         iImC61IAhOZ1dBAbGBpytHiMBr61A/lKBXzMsVXk5ff51WDWliNojNfFSngrQOu3lauO
         71VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZhHr6cID;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2si13969387ybm.274.2020.09.21.15.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 15:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZhHr6cID;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKUC8-0003vP-32
	for alex.bennee@linaro.org; Mon, 21 Sep 2020 18:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU27-0000c7-Gh
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 18:11:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU22-0001eG-G0
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 18:11:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600726287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=folivq79vU79XSA6rq0LSS3y2MaZhG4xZKnlYr4A8ng=;
 b=ZhHr6cIDzONXWh4qqQWcGwHc0E+ksEZAlcUmIhd3e6ATu0I+jOKWG0RHx698zlXxaXtD1F
 4sZjWOTp/v+lLaqefm7laErYTqVCsCFlw0DfoF2YGY7AighJfnynD0h3lfOn9RUBvrERUi
 /qEVlfal8gdGIhQZaaOPjvYPIWFWXk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-i3vfzWNRNMuAmyIMiBfllA-1; Mon, 21 Sep 2020 18:11:26 -0400
X-MC-Unique: i3vfzWNRNMuAmyIMiBfllA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02A04873081;
 Mon, 21 Sep 2020 22:11:25 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDCE616E20;
 Mon, 21 Sep 2020 22:11:24 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/24] virt: Register "its" as class property
Date: Mon, 21 Sep 2020 18:10:37 -0400
Message-Id: <20200921221045.699690-17-ehabkost@redhat.com>
In-Reply-To: <20200921221045.699690-1-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:44:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 06xdS1XeJRSY

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
index d1ab660fa60..986b75a6b89 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2484,6 +2484,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
@@ -2511,11 +2518,6 @@ static void virt_instance_init(Object *obj)
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
2.26.2

