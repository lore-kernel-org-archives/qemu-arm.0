Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4351836lfq;
        Mon, 21 Sep 2020 15:16:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNbGhsFr2c5bEF9ihpeWJiuxSggPyCubn/kfCc6hUKV4K6vieMXFJSGePb86ymIq9LvSX5
X-Received: by 2002:a25:9944:: with SMTP id n4mr3051024ybo.261.1600726608400;
        Mon, 21 Sep 2020 15:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600726608; cv=none;
        d=google.com; s=arc-20160816;
        b=cvzco/XSKDFKuRbgQcq6YQKJuQNSgfQtinHi67GqYkRKs21q1Y0yQPaLW/2hBv+iD9
         AG3sqPW6cMtCEYD3WUklVdvQdZQfJ9P0XwB/dLF24aj8njYhdI76RSZFH9nUUmzjahin
         ABXUJ9Q59SztijZgK03M9KBTTPJFKjiCLzjmq4B+NBymOgTQI/muvVnuno7E9PslLC/6
         0pbWHfHwsRj5Pctz00/ms8FwY6NNNDLOWV7sowCRJeWfBXY2F/3O+XQEP+h16zrVZr95
         I4qNxW/1PjCvqoru+YG/QPCFPd8W6uDbmT11Qc2Mk4Czi34cDi9UNx7IEnxOxeOTGFax
         o9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nbTMuNTCnHfILdL0OqkdIuBhc6flK1JddONBlf63Zow=;
        b=Q6ddBbP2r1XxavRuoJ0BJDzhJ69NBjRDewhfbzxvY0E+yFomhI8FrU4FkfbCKzPoxV
         svyjd9z26lOEBETiR5FM76NNuydfCqx/8497rmVfH8e/5S2S6qlmR758TFJdJkcRFbbl
         9shDl8Pmajiegy/8drUz5hpYzo54PagbQORBBtvlZ1axzxYaQApbHD/XJg1dmrp1CHkE
         02r04Yg/qqnWfihUK8sJxN00KJ60icIo5IFj9rL/aVBX4pfHdFa+6ORe07IaAdT7yN5s
         Z+m8FIGguSz7AKEASIpG/D/N16vdyVuCchNOgf4AWBqUGdIHD5gWCY9H5HNWQk2UBh43
         /0rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h3jV3VHl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si14484718ybj.305.2020.09.21.15.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 15:16:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h3jV3VHl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKU75-0006tt-Dl
	for alex.bennee@linaro.org; Mon, 21 Sep 2020 18:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU1g-0008Pv-7w
 for qemu-arm@nongnu.org; Mon, 21 Sep 2020 18:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kKU1e-0001aB-8y
 for qemu-arm@nongnu.org; Mon, 21 Sep 2020 18:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600726269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbTMuNTCnHfILdL0OqkdIuBhc6flK1JddONBlf63Zow=;
 b=h3jV3VHlZ8VFE/QJAeAOpFPMRXhxdAncxwVsnhroMZXzkxPuVKGQaQuNhlqkYLpM3Xqk1W
 0d1CL3NAwDHniHLABiZukCWua0WAOATmad7gmuNrlHUvy1fDZ8tsudIYkM/tW8zvr2XTVL
 vQwDACWZKhNakppaCdoXild4GecEeHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-Vl6haqGbPB2bHPZOytqI4Q-1; Mon, 21 Sep 2020 18:11:07 -0400
X-MC-Unique: Vl6haqGbPB2bHPZOytqI4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5BA6909CB7;
 Mon, 21 Sep 2020 22:11:00 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A23910013BD;
 Mon, 21 Sep 2020 22:11:00 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/24] vexpress-a15: Register "virtualization" as class
 property
Date: Mon, 21 Sep 2020 18:10:29 -0400
Message-Id: <20200921221045.699690-9-ehabkost@redhat.com>
In-Reply-To: <20200921221045.699690-1-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:43:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
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
Cc: John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T0nQoSqVT3NG

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
index 0cc35749d7d..13339302af5 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -769,12 +769,6 @@ static void vexpress_a15_instance_init(Object *obj)
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
@@ -822,6 +816,14 @@ static void vexpress_a15_class_init(ObjectClass *oc, void *data)
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
2.26.2

