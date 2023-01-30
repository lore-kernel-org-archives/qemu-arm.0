Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp944876ejb;
        Mon, 30 Jan 2023 05:28:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+m+8TVmMZH/lC5UbG8xqDxLZbYZxDGX2x59ggQ31kCchS9AiovLQyuN2l//88UE/mrRBju
X-Received: by 2002:ad4:4b65:0:b0:537:791f:48e5 with SMTP id m5-20020ad44b65000000b00537791f48e5mr24608164qvx.22.1675085314893;
        Mon, 30 Jan 2023 05:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675085314; cv=none;
        d=google.com; s=arc-20160816;
        b=sHpeJW+TqH4RHj4uhVeXoOfcIlgkWGPf8GEHL3KVWGT8jq7nzX3dZhLxWVLGsbBnJQ
         OYCR/JRjBAGaS5xD03OPFKbTuHpiUI3euav2RkghFn0CyeawedctEvxMJiSVE3kXL76g
         BGcVIuzcZZ5P+g1AQbOrH+iZhVMcFPlEAXpu/B3T/6G4pUoR1iadvi7NkxPT8jsaNi7Y
         YRx4ZwG2r+grfgvOcDEtRhR4icsgrRrpbToAYCNo0qVCOWkfCiaz8ht765TDYRnvKvuS
         kJkdXAI1WdGqp7eZAe176Ea71m9v6v13yonJrPcNKNKocJlPOM5J5eN4Nbq30a5lYuzH
         jOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xnuUy+MzQFFeHaD2MZP50NQ29I1xF6AysNgDL67JsxU=;
        b=fOmbsSou9uYGQDU1UE5VDl0IqHVrIs/udsnf4DFRAsUgtx+KkRnLh5wDfAMwwbl1iV
         FmyZvhdtpXQPxqvPu1rjNLFtMAlUUG0K9eCVICGimstH10NF+7aRPlHtDnh4oZtt+dMx
         PAkyw1pxq4i1LRH9fShhTozjSAHFMZD1PG1tal2o4qHLUW5bhc6dsJfKe2fKYGzEzqdl
         6Yyd1cx0nJJrcv5o6ibGF72PJb3/8DM/5vdvtzlRlxT/eykPUASWBlpmn2ij5F6t6ukC
         cHeaPyUiTWxvtX/pJlmWAB4F99b9wJL0JKV3PLAEjRoR9XxBwDOPRwZ/fsFTI97lTUyh
         eyKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SzVLSAgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fh15-20020a0562141a0f00b00537781cfaacsi6654618qvb.220.2023.01.30.05.28.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SzVLSAgz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMU8m-0000cM-0m; Mon, 30 Jan 2023 08:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU7D-0005Eu-MQ
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:22:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6q-0005nl-QC
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnuUy+MzQFFeHaD2MZP50NQ29I1xF6AysNgDL67JsxU=;
 b=SzVLSAgzxGXqYB+vPpsrypAJtQ2ofo0N5r4m/kqezpa0heyznqICiWf4e7+LmGlLTZ48nP
 JYS4D+3Grfv7t9s6MVwATExG77D0Ka4a9uXqVo7sIjOqDMmIx3nc31Lxpi/BO3ISLz+pyJ
 DCxYh1T3UK8qlLI3f9Wle/Zi3LJqwN0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-JlEXRDP7OEuWVmr0Y5n3qQ-1; Mon, 30 Jan 2023 08:22:00 -0500
X-MC-Unique: JlEXRDP7OEuWVmr0Y5n3qQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B03413C0E449;
 Mon, 30 Jan 2023 13:21:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A001492B05;
 Mon, 30 Jan 2023 13:21:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7829321E691F; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
Subject: [PATCH v5 19/20] 9p: Drop superfluous include of linux/limits.h
Date: Mon, 30 Jan 2023 14:21:55 +0100
Message-Id: <20230130132156.1868019-20-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-TUID: 2PCq0kTTqASS

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/9pfs/9p.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 9621ec1341..aa736af380 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -17,9 +17,6 @@
  */
 
 #include "qemu/osdep.h"
-#ifdef CONFIG_LINUX
-#include <linux/limits.h>
-#endif
 #include <glib/gprintf.h>
 #include "hw/virtio/virtio.h"
 #include "qapi/error.h"
-- 
2.39.0

