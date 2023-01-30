Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp942058ejb;
        Mon, 30 Jan 2023 05:24:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/OT39svtFkmd9Eqm0CXU0bdXKA9991IZuLLAxfZFMVstlou+8O+hlaBEx8NkWGInFqbRg7
X-Received: by 2002:a0c:e7cb:0:b0:539:dc87:f4fd with SMTP id c11-20020a0ce7cb000000b00539dc87f4fdmr11748190qvo.26.1675085044571;
        Mon, 30 Jan 2023 05:24:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675085044; cv=none;
        d=google.com; s=arc-20160816;
        b=Kob6oA/xxJBRFUbIKBn615780JsPGLP7WXHHNePviuxn5ewG1gzCFTqxSspZcRKy2g
         MuQ2pxlWjrWC5Bi9OzUXii5vF0QqN42iK02OXO1+vzF1Zu4ujAxR543hmuOO2O/mJu8Q
         adRi1MUryxwYknDTEI7xLRr3vYAN2ARtqf8c5+h0kwurXgHZIlXQ7LS+f11E0dt4Lns3
         X8uInj+ApPz+aVvUodBJBEKnpv+mRy6Rc3Itb+G5hGfdDL0dKVgN+xQv48R8NuTsGND/
         Klm+Y997NWDxELp+bH/1/oJoyyGxpebCroXOKinwIcwPKpZbpXWQ2gWavjofWFi8ekS3
         fEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JYJgOYLIY3Zd9s8hgjp2CZMM0oC/9ABdj6PFiCWfZkM=;
        b=mmY9IgyysUgyIgrs4JI73VjxyKEvjWFP4KONOfH1DubPvCFZq+YuOEJeb0DvA/AGuK
         hmBOJrjOxAxwhfXRTBHLX5JoS7JOdlMepX8L156qNS7M1TsGu8QTR8kRsXHnT+7CoGm4
         BvqRTmNzYTV5l/0xYj50kyMqK8xt/GmABt7CpfdHC12YXbL2ePaOwSbV5GaDUC2HFWhx
         5cA2Q0oJhGLqqgo4dBricLcYA/T9j6DvbjoS5TA54crhEuipt9N+B4mkg6mMBw4cZ841
         +wfrkZUDSgZOvEHMq8njw3QzFl5eh0ekvrXUjwxoMUInmODI8oomWYFuSZ5cbKUhmN2x
         yuog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IG9mGC04;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10-20020ae9f10a000000b006ec5f9983a0si6328218qkg.398.2023.01.30.05.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:24:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IG9mGC04;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU72-0004uz-Je; Mon, 30 Jan 2023 08:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6t-0004Hr-1u
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6m-0005jJ-Od
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYJgOYLIY3Zd9s8hgjp2CZMM0oC/9ABdj6PFiCWfZkM=;
 b=IG9mGC049aUlrUNL0H6Ozn3gG98sPZFJHi4XwZe7+cjRnOquQZByZuz/gg0kxBGWzuHgiT
 HcPoOVtdExdx1fdTIMGxKQp7aKBp3t7B54KWLLj8v9c5l5rD5cTh1n8owXfqvLYLt+vRPd
 chaKr+Pi2Tj20GLY0Edu86EqYyy097k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-3dcuylNfOLulD11Nx49pbQ-1; Mon, 30 Jan 2023 08:22:01 -0500
X-MC-Unique: 3dcuylNfOLulD11Nx49pbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F07A3C0E453;
 Mon, 30 Jan 2023 13:21:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78E90140EBF5;
 Mon, 30 Jan 2023 13:21:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B05E21E6916; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
 qemu-riscv@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: [PATCH v5 15/20] block: Clean up includes
Date: Mon, 30 Jan 2023 14:21:51 +0100
Message-Id: <20230130132156.1868019-16-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +B+12l2o5hUr

Clean up includes so that qemu/osdep.h is included first in .c, and
not in .h, and headers which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/block/graph-lock.h      | 1 -
 include/block/write-threshold.h | 2 --
 block/qapi.c                    | 1 -
 3 files changed, 4 deletions(-)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 3ab924d5e2..18cc14de22 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -20,7 +20,6 @@
 #ifndef GRAPH_LOCK_H
 #define GRAPH_LOCK_H
 
-#include "qemu/osdep.h"
 #include "qemu/clang-tsa.h"
 
 /**
diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index f50f923e7e..63d1583887 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -13,8 +13,6 @@
 #ifndef BLOCK_WRITE_THRESHOLD_H
 #define BLOCK_WRITE_THRESHOLD_H
 
-#include "qemu/typedefs.h"
-
 /*
  * bdrv_write_threshold_set:
  *
diff --git a/block/qapi.c b/block/qapi.c
index 9b4da12966..4f8df48cf4 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -40,7 +40,6 @@
 #include "qapi/qmp/qstring.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/block-backend.h"
-#include "qemu/cutils.h"
 
 BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
                                         BlockDriverState *bs,
-- 
2.39.0

