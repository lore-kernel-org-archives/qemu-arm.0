Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp383594ejb;
        Thu, 2 Feb 2023 05:40:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/n6TFaO9MI/vbYBe4vitlILduun8xRbeTIdZIlxxyNRNiLklLiUCyW1Xc2Ml0aGBP7+QZJ
X-Received: by 2002:ad4:4e6a:0:b0:552:bc72:e69f with SMTP id ec10-20020ad44e6a000000b00552bc72e69fmr7573505qvb.8.1675345239778;
        Thu, 02 Feb 2023 05:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675345239; cv=none;
        d=google.com; s=arc-20160816;
        b=N/Bo6NNSiCJpEkaAS5vHld3dV9RijprCJ57uOtchcoMObsqwyEha3s7swuQnqXg/zs
         awyXQ+/4wFRX4VglGPlFQGnMDfbcFM5wACGPc+Ow/5rI7eQTAj+fM+/W8LVcJTHyaVB/
         KLQvzAZAqGHlAGi6CZNo/qrosW435l09O9Bmdt6Fm2QI/fUMexYUkOyQ8Jpcg3Ct8esh
         ChnTlV+xn6Sa5IhmIB0Yq8rHFi9cldkgYpXoPlpYjUrwjnVv13KySi3uRZcYBTtmzXqg
         WcEszzWr95evn41ydPJoKkyBh1mdiFRb2Zfg69f/Kn5IqmgaGDacOyqyfIdMlIGSyf3X
         1mRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Im9D9GPlDv84qP18kBJzWOAOUi3vigMNUhZJote7pRk=;
        b=ZUfrr5NA0QDhkZm2r3lmDsDmCXLwDrz05D17cB9KyTyTggpas90e6TJBb9H2I2xajF
         IGCxLlwuuXmW3tp+ImnPa4bRDRUXDutx0CA1kUT1ciST3r+YCBJHarYrEzHQQLqDlI7P
         1MzH+S3GfKZmCXn7sexRUFvZ2wKG71twZ28GQRMZXiwV+DSfdSvq6wnSwZ6mR8nGyQMx
         Z9No04elsUFs2OpFchs29NJp2Lqzv18oQXIbQDkHPkzyUrmaK7WtdYPL7dyyMMRfDZte
         zBdrvB3L/JjWwnCG0vFhxzdlRPYjmfddUpG0EjG3KKCvRLFJ29nMXvjvdIFcohkYzJ5F
         /Hrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VV5g4uXA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18-20020ad45292000000b00534f2e547afsi11684378qvr.205.2023.02.02.05.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 05:40:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VV5g4uXA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNZoR-0006Zu-La; Thu, 02 Feb 2023 08:39:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnp-0005dT-TM
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 08:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnb-00088L-7C
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 08:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Im9D9GPlDv84qP18kBJzWOAOUi3vigMNUhZJote7pRk=;
 b=VV5g4uXAVu45Q9TzdnKSytj3+FknF3cJUeoE2Al2QGniqBvjCM61TWenmj+kyeWkvVF3J8
 UfhtbKIcXjKs1AOLugBQ+ngkEWZI2GfwBKoa9UWB4YIBds3JZ/dopg5NDh1h9Gygz0/gtM
 0p61mLv6fYF25zdjUwAYlBJVkqYW8B4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-7P1Y8GuYOdGadeHAaQgZYw-1; Thu, 02 Feb 2023 08:38:38 -0500
X-MC-Unique: 7P1Y8GuYOdGadeHAaQgZYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F53C82401F;
 Thu,  2 Feb 2023 13:38:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CF0AC15BA0;
 Thu,  2 Feb 2023 13:38:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C03F121E6A26; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v6 07/20] hw/cxl: Clean up includes
Date: Thu,  2 Feb 2023 14:38:17 +0100
Message-Id: <20230202133830.2152150-8-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e02LAl9WpSbJ

This commit was created with scripts/clean-includes.

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_component.h | 2 --
 include/hw/cxl/cxl_host.h      | 1 -
 include/hw/cxl/cxl_pci.h       | 1 -
 3 files changed, 4 deletions(-)

diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 5dca21e95b..692d7a5507 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -15,9 +15,7 @@
 #define CXL2_COMPONENT_CM_REGION_SIZE 0x1000
 #define CXL2_COMPONENT_BLOCK_SIZE 0x10000
 
-#include "qemu/compiler.h"
 #include "qemu/range.h"
-#include "qemu/typedefs.h"
 #include "hw/cxl/cxl_cdat.h"
 #include "hw/register.h"
 #include "qapi/error.h"
diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
index a1b662ce40..c9bc9c7c50 100644
--- a/include/hw/cxl/cxl_host.h
+++ b/include/hw/cxl/cxl_host.h
@@ -7,7 +7,6 @@
  * COPYING file in the top-level directory.
  */
 
-#include "qemu/osdep.h"
 #include "hw/cxl/cxl.h"
 #include "hw/boards.h"
 
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index 01e15ed5b4..407be95b9e 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -10,7 +10,6 @@
 #ifndef CXL_PCI_H
 #define CXL_PCI_H
 
-#include "qemu/compiler.h"
 
 #define CXL_VENDOR_ID 0x1e98
 
-- 
2.39.0

