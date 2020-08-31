Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4002336lfc;
        Mon, 31 Aug 2020 14:10:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYgeM/RdM5txbE638u9sMZu6H5xI6gAYRp6v7lHWtRgLb13Pl87jcP/5twtiJ3kBUH8bas
X-Received: by 2002:a25:b5cc:: with SMTP id d12mr5102361ybg.190.1598908247855;
        Mon, 31 Aug 2020 14:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598908247; cv=none;
        d=google.com; s=arc-20160816;
        b=RqcmfJ+iMZ5M1cxb+JdLS0cDmTuh2R7s+aqNtDTGTkAsOCiLCWdQINBHuN3OZh20NM
         nmp/QhAiZnZ4UZvIOj75OGcaxeeSwc40ualzHG1Dd7DsSf8BO65ZkzOhK3d53VscWEnR
         iFuolnYNIKhibf2HskgJ4McJZlwrk5dj7DHBlnQE0v7cPc8NMO679oDs6sRS2jUR1vUU
         CZ4tCC0nJdsuJeCOUE3ESKOPfehgkTs6scydzHuGYsMEKtTpHGbh+lgTqP7vw9JPQTfA
         pDVSRdo/KENk/sod9jIjRvxzA1VWogzQQyKGF6WMkid0HsDy5dRXKGEbMLVT99dxrJv5
         0gDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Wbzi430Kpadf0ivRBdvVfzRyP76PlwJUtCXjcSq46Ns=;
        b=ZF9LDRJdf6O+6wRk6b4Z7cUW+41ME8wazqNRr99qLnjGXSuFGztZmjvLRu4nrHzOZg
         m/Y39mqYPipaiwM0/fpS7riR/qoYoOd/umJmUpenm8ybt5uel6zRT6Cmv4jCFarCONks
         3JvgjscIm25ZJGF/rcn4TFR22I6J3lSUuitUnJ4H+Uf2AVA1XP4vK6Syw4y6XsMfk067
         A3FuUmHDyyZBQ+Ji2astXsRX6OzTD0qQG46W+ehnIXFsX9itU1LlhtwxkCR4PFmtAQ0T
         qWt+187NO5MFDZ/ncqKxeer+AgLIkNjSO8IE3Omdsv6LNEOhdeXGiRK8ChV07O6lEKt/
         rqEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LX6Jxs+e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si8043592ybe.226.2020.08.31.14.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 14:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LX6Jxs+e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kCr4g-0000FU-Oz
	for alex.bennee@linaro.org; Mon, 31 Aug 2020 17:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kCr3i-0006uE-Qx
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 17:09:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kCr3f-0000JJ-Gp
 for qemu-arm@nongnu.org; Mon, 31 Aug 2020 17:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598908182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wbzi430Kpadf0ivRBdvVfzRyP76PlwJUtCXjcSq46Ns=;
 b=LX6Jxs+e/Hq/iAQhpsnZHI5TZ4JRQG7ueBdmbevCNHtaFk5LFFikPfxE3A6ZJFsUizvj06
 2EQfI/iBIxQENj4hWvhEANYEef0TJfsRqo1R6ECc+cCQNAaVcPQ2/DS6qfKtnhKlVaTc/q
 qUX4mCoo8vnnd11wP3XiXSCe8rnoot8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-OhSkuY7nNgKFd-eGMJyAFg-1; Mon, 31 Aug 2020 17:09:40 -0400
X-MC-Unique: OhSkuY7nNgKFd-eGMJyAFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F881801AB2;
 Mon, 31 Aug 2020 21:09:39 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D8BF16E27;
 Mon, 31 Aug 2020 21:09:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/18] [automated] Use OBJECT_DECLARE_TYPE where possible
 (pass 3)
Date: Mon, 31 Aug 2020 17:07:39 -0400
Message-Id: <20200831210740.126168-18-ehabkost@redhat.com>
In-Reply-To: <20200831210740.126168-1-ehabkost@redhat.com>
References: <20200831210740.126168-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 15:34:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AF+nomEr1q46

Replace DECLARE_OBJ_CHECKERS with OBJECT_DECLARE_TYPE where the
typedefs can be safely removed.

Generated running:

$ ./scripts/codeconverter/converter.py -i \
  --pattern=DeclareObjCheckers $(git grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes series v3 -> v4: this is a new patch added in series v4

The script was re-run after series rebase.

This is being submitted as a separate patch to make review
easier, but it can be squashed into the previous patch once it
gets reviewed.
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/arm/armsse.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 452cbb5793..b844ef6bc0 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -108,10 +108,8 @@
 #include "qom/object.h"
 
 #define TYPE_ARM_SSE "arm-sse"
-typedef struct ARMSSE ARMSSE;
-typedef struct ARMSSEClass ARMSSEClass;
-DECLARE_OBJ_CHECKERS(ARMSSE, ARMSSEClass,
-                     ARM_SSE, TYPE_ARM_SSE)
+OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
+                    arm_sse, ARM_SSE)
 
 /*
  * These type names are for specific IoTKit subsystems; other than
-- 
2.26.2

