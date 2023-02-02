Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp383673ejb;
        Thu, 2 Feb 2023 05:40:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9kjrFHpIErSPZnYlZyqxdscwGjKweu+1zWgQYdRVHJoS7y2xstQHbwhjRYUd6C4pz3QCDw
X-Received: by 2002:ac8:5847:0:b0:3b8:61df:e298 with SMTP id h7-20020ac85847000000b003b861dfe298mr10374893qth.3.1675345246159;
        Thu, 02 Feb 2023 05:40:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675345246; cv=none;
        d=google.com; s=arc-20160816;
        b=SSlkVAHBXpJXjovK7KWPxugn2vJzZH6eI9HT+T5DqvK7Qicns4DUX37e9UNvWAuVQ+
         1jg96CKBqCK/CahT+ZaWLoXTd66JaGDyP/kTf21ynPcNutCp5wuUGR4k6GO0uhoYacgD
         abayInTIeCAb4hrYbqlryTzuk6z1Tk2eJzmN0eDnL7Zq5RR9fMjIlRBsLTq49yaJD8BR
         TW2ep/endqccTVXn5wTODl1gqGnkEjuJW0in7F6BfBurUG+49bmHGVh9euuRabLXvCYJ
         jtHHQoWAU5KTJ8yZvF6FgUvqeDG5OQsePT7FgnWTWj7qgvQT9uZaBk+HwgiyCrshrhq/
         OxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xnuUy+MzQFFeHaD2MZP50NQ29I1xF6AysNgDL67JsxU=;
        b=G9DtEWVzhGrjvV65O78/5rGiWjgVixlW5zJV7dfpwqwejuGQt00q5iBeDOXULsXypQ
         TEtVgM5RDKU2yBVI/f3VcV1KCIl61QmKqOojPQEEHaMD5s6yNFBIPT4Jx5Bjxez6osen
         DXy4wEJG6iIS3b4ungz1hMWx87Yp8N/VktqOW+DlU4eURY3p8kU0y/RVCAwduni1EFZL
         wmg2rnm9mvi1vhzdFPpZYqeXjYxEYkRqWgVvaB6iylcUN2OLUp6M3RcCFo5YECq7kVXn
         Isuv1jGBxPTqnqmYM8aFylm6ckRDktbUEWb223Y0So7rpVWd9fnlXtBaGrSEoFHS5//L
         Xb2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K3AQGUCQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020ac85cc3000000b003b86db0752esi6925057qta.351.2023.02.02.05.40.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 05:40:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K3AQGUCQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNZoE-0006FM-3C; Thu, 02 Feb 2023 08:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnp-0005dW-TM
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 08:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnb-00089v-HH
 for qemu-arm@nongnu.org; Thu, 02 Feb 2023 08:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnuUy+MzQFFeHaD2MZP50NQ29I1xF6AysNgDL67JsxU=;
 b=K3AQGUCQM6bE1IXLmxmzMpFiYPyzhAFY56QfQrxAoxIXdOXfRqsiK7sarOGj0YCe1F+zD+
 OkWgPFM2rPhi+iZje2loXpNwzJlhpieWv4WTtoH5FrGRuFIrjeuF9DhKWhGUR7fHE4X4zW
 8VVOstM+J0lyNPiXBAVDyY/+rdACHN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-ceJo1B35NAKsrQrGgrjuyA-1; Thu, 02 Feb 2023 08:38:39 -0500
X-MC-Unique: ceJo1B35NAKsrQrGgrjuyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AFDF180063B;
 Thu,  2 Feb 2023 13:38:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FE1A140EBF6;
 Thu,  2 Feb 2023 13:38:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E91ED21E691F; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
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
Subject: [PATCH v6 19/20] 9p: Drop superfluous include of linux/limits.h
Date: Thu,  2 Feb 2023 14:38:29 +0100
Message-Id: <20230202133830.2152150-20-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-TUID: 9l/Xh2rOt8XU

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

