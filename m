Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp132544ejc;
        Wed, 18 Jan 2023 23:03:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs2cWRv3qELg6maF9ybeS4t0nQhs/o029kscyfo2wnLuMUV7lF77Rxb/HhmtEwHJQOgMJlC
X-Received: by 2002:a0c:fe46:0:b0:532:2fd0:5933 with SMTP id u6-20020a0cfe46000000b005322fd05933mr14198508qvs.19.1674111806669;
        Wed, 18 Jan 2023 23:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674111806; cv=none;
        d=google.com; s=arc-20160816;
        b=tyt8GSJg09g1BHQbBOYwJJCG4LLbUCy2JvCg3g6cuMkVhDMJLvuGXdw4KoqHghacHX
         wHJw7SJN2KCEhxj3ED+ECwwwr8eMylJZfiv5B8Jn7fO9EOr6oKIJKZLAx3HtrmEJV0k1
         54GhwOMg9BBHpKp9lHGqedVgXDwn6ylW/Jt6soH2aPE5Q32XsNCRW5WJH2XSvIF4/Ja5
         vH8MVdLAds1Ik026q/QUhBZ2+o3PDvb5bg//KpoL/mHCdCBHPvfi8N3n7V5BdHdmEgg+
         oUu6msfPcvlrh4xrqVajT73aMhdSZrdsXGEQBf3xM/QYGFJLVLh4znR6SAXlURYBTwGm
         iVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vhEyU3lG/HddlFOPbY0juv1v7ZnJ12wqNCac3xMgqpY=;
        b=FzuYlOe2pEtmfFlT8LjmFlE7ulek2hD9zgUSRbXp51Si0x85VBVOsYj7H3hO0flGwL
         H3U+qXAY6gkz8vx3Y7gyxyBMS4Kg9QBRgpRPpdFach8p02B4FiOd7Rn5dz/R8CwfLuND
         pPg5Qx5JRJ9wvIK6dhWPIZx0R68fKeIBQcmEqQ7KthreUtTRxi5ZvsZq1PXSRIWfl8Zi
         AbVHgq81FV6MQu5glYtymILMdzs04VHRxSkpXotng3Ue3jKMwbva3/IrKBdwqEyTCLKv
         cuvejbGpmvf+sAHvkCY29JQRsi6k+GQy7W2veQIEas2by8dyKS3eUdmhEkIIjYlTzl1S
         x0mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P6VijxQa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020ad45c6a000000b005354ca36b9esi1099983qvh.190.2023.01.18.23.03.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 23:03:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P6VijxQa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIOub-0006ZI-UI; Thu, 19 Jan 2023 02:00:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuC-0006KI-GD
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOu7-00087y-0h
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhEyU3lG/HddlFOPbY0juv1v7ZnJ12wqNCac3xMgqpY=;
 b=P6VijxQahDXkH4zqoQbHDTMuFnfUz9TYfeJbG9oZFG1rjePeFamkcE18aUgjlLIVScwXkt
 jZUh2sCMRjV6hd1/seibTp5Ie/teK/fMCKKqMlhZA4vFZEOHVSM4LKCFZguKwW0g49+B2H
 tyjTWgWDrjqtBDa7eEqfGREzeFEgJQQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-tT4Km-04Mlqzxd9U-zU7jg-1; Thu, 19 Jan 2023 02:00:04 -0500
X-MC-Unique: tT4Km-04Mlqzxd9U-zU7jg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C24881C05AC4;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86C2EC15BAD;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6955C21E64D9; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 14/19] block: Clean up includes
Date: Thu, 19 Jan 2023 07:59:54 +0100
Message-Id: <20230119065959.3104012-15-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wUGs2aU5Dnav

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/block/graph-lock.h      | 1 -
 include/block/write-threshold.h | 2 --
 block/qapi.c                    | 1 -
 3 files changed, 4 deletions(-)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 4c92cd8edf..ed9263b84e 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -20,7 +20,6 @@
 #ifndef GRAPH_LOCK_H
 #define GRAPH_LOCK_H
 
-#include "qemu/osdep.h"
 #include "qemu/clang-tsa.h"
 
 #include "qemu/coroutine.h"
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
index fea808425b..aede6a40d8 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -39,7 +39,6 @@
 #include "qapi/qmp/qstring.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/block-backend.h"
-#include "qemu/cutils.h"
 
 BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
                                         BlockDriverState *bs,
-- 
2.39.0

