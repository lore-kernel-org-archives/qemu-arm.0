Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp669001lfb;
        Wed, 11 Nov 2020 10:41:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzq/9aQLkd9lKXNo01YYoPOFiwu8Fas48QtYDDF4CQcJglqWyEVOzpgtk/UVDJ3LKnL1z2
X-Received: by 2002:a25:b19f:: with SMTP id h31mr33927580ybj.112.1605120104285;
        Wed, 11 Nov 2020 10:41:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605120104; cv=none;
        d=google.com; s=arc-20160816;
        b=xKp8D3i4HuRic3soyd+uiL3eY5KMGCYRZs95jFFZAbr99fA5qGyUpJjiiUuH1elpED
         7AFuHFYi/wpQVRFNR5phvIm3LHXZQJrVnWYUeCr5c8Ja8Fidg9CddEdr02I3iSAEfBFf
         dcfwWOeR5vS8IBir4XzxppjrfDOAvjIsYAe9o9Xb3lKLtLaXcZK/p5yPTu1+A4XC2gJN
         +jabCIBG6eZJCTMPyM8DbMtzBT87Dcg+qUNPxTDoV/35rCey50b/TiNjkLQlcK1N1HYs
         Q1LxSg80TmPJbGiuc69loGxz3KysKwzgBK1NcO/wocgPpzPNJ8l04ub4X2s6pzSoqkRY
         VaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PcPpBCTO/OGmj1460lh+NKkFRuN0e9q5i3elpdRuoLA=;
        b=G1MGkDS3AiZWlt9lgXYEoQFbteSVm9M0Lw2SZEV/Mk2egqD/ckwNUwU683mkigISbr
         LLNVdt6K2Y44TiJIht05tK7BpQVuo5ITRbnSiWHAGejDvzn4eOAHKNdUIieqeicXRvIZ
         PeS2YtyA6Tt+ufPlJeg33sYRK6t1xteqNNSWdbn/O48hBvdo9RovGkZkK//bPqdCiyHk
         Kb6LArgZnnisbRDvNG0r6pXdMnEaoODDRyh6coR+iTdzY3eS3YYjYZN58H5LsCRZRlul
         +6vqraOBjQ80AGXiXVCsg9r2OHlC3VEsvanJrWYz/qONIgFa8YSW2iQwYEDUhNaQq+Om
         Q+EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KHmDynxx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o190si2426661yba.455.2020.11.11.10.41.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 10:41:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KHmDynxx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcv3v-0001lp-MT
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 13:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv13-0000JA-Bk
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv10-00081S-SJ
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcPpBCTO/OGmj1460lh+NKkFRuN0e9q5i3elpdRuoLA=;
 b=KHmDynxxD1eronHFagmz9l1+g31xZE+ImdmZObN8XJ5dkP9rGwGXZYEbUgyIMe273da5RK
 oeHPJCA76w3Ko7dazQHwyNNdHHJueWLOqMQLkRP2HP9rUdWROSVu2NErEpMCXEUuEtJh7S
 UpGVxvDkO/R1bqfWKqHYe0UUZq8OyZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-2RgKfFigOMGsRS4_eq4Mzg-1; Wed, 11 Nov 2020 13:38:38 -0500
X-MC-Unique: 2RgKfFigOMGsRS4_eq4Mzg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A5C186DD40;
 Wed, 11 Nov 2020 18:38:36 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C363127BCD;
 Wed, 11 Nov 2020 18:38:35 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] arm/cpu64: Register "aarch64" as class property
Date: Wed, 11 Nov 2020 13:38:18 -0500
Message-Id: <20201111183823.283752-8-ehabkost@redhat.com>
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
X-TUID: 6zIx4RKwu8uf

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 target/arm/cpu64.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 649213082f..7cf9fc4bc6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -762,15 +762,6 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
     }
 }
 
-static void aarch64_cpu_initfn(Object *obj)
-{
-    object_property_add_bool(obj, "aarch64", aarch64_cpu_get_aarch64,
-                             aarch64_cpu_set_aarch64);
-    object_property_set_description(obj, "aarch64",
-                                    "Set on/off to enable/disable aarch64 "
-                                    "execution state ");
-}
-
 static void aarch64_cpu_finalizefn(Object *obj)
 {
 }
@@ -790,6 +781,12 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_num_core_regs = 34;
     cc->gdb_core_xml_file = "aarch64-core.xml";
     cc->gdb_arch_name = aarch64_gdb_arch_name;
+
+    object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
+                                   aarch64_cpu_set_aarch64);
+    object_class_property_set_description(oc, "aarch64",
+                                          "Set on/off to enable/disable aarch64 "
+                                          "execution state ");
 }
 
 static void aarch64_cpu_instance_init(Object *obj)
@@ -827,7 +824,6 @@ static const TypeInfo aarch64_cpu_type_info = {
     .name = TYPE_AARCH64_CPU,
     .parent = TYPE_ARM_CPU,
     .instance_size = sizeof(ARMCPU),
-    .instance_init = aarch64_cpu_initfn,
     .instance_finalize = aarch64_cpu_finalizefn,
     .abstract = true,
     .class_size = sizeof(AArch64CPUClass),
-- 
2.28.0

