Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp131573ejc;
        Wed, 18 Jan 2023 23:01:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsVGzy57CAVpfOYgfxB3pad65Se4qMOrhT9eZD+biyKai6HhwBBsKi1IQTuNG2i/qchYvPm
X-Received: by 2002:a05:6214:3689:b0:531:91cd:59de with SMTP id nl9-20020a056214368900b0053191cd59demr12795520qvb.26.1674111701357;
        Wed, 18 Jan 2023 23:01:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674111701; cv=none;
        d=google.com; s=arc-20160816;
        b=yjEiseO3TW2tEn6V9HlHJESFREAydSr2OvUXa0dY1oSUAdVG2DQXUV0Y1XdCkHhJSq
         mvjE+icEVYtP45oDTYKTtHVsOlJasdQ2aN9HStLdlDIoKEHf4RKkP6ZCcxMc8M3EJ0WL
         gYr+vLc5qHFagFsC7JgtU/uoKYbxsQC65MA9D/fLjBrp2pb0tyTDmdTX2+LSaKjxpaAo
         lJuR9hRK8xX+eUk6onUH8yAqEBcNkyvhHVrT5Cb3x/Gs/JDBVnNX2MsPpNYjM76H5gES
         kVk5iblqm34jYeskx7sbAG01ngMFyoeEHefZJ90IBtDhe4UAtGLUvwr9eqU+20DUb6D4
         Tn9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HSvmGx9pg7RM2UEWG6YDDRKexZJzuEM2p+pEafedpfY=;
        b=OY86sZNGRBr61D7Ttj0GqMkcHsvlaf/0C5SzEXJmffPGD3Lraa/M4PgViPdHkf+Zte
         MF1AHCOby3YdELrBHIApZPl1n4QqBZom2qka4K0qr5ocHShA9ksTytMzFh03A4jiVurA
         UUGIpQJ+3J68BmLxmLEr2gxibT89Bbotfr+2sESKVwz10jxp6iutgMnx33QoD+IpyF6C
         3klJXt5C7W5imKAEDToDNNgZZygBt2PfkRf6LbFT7DZw5uz/GDUuv6becat9c9K+nGfp
         DqxeKLNygzWihXDneAZJqrwAvHvATMasvmSD56nSPnCdkmP4vi0Jt3ZYy+MtXkV0V27J
         elqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CBj/4XrO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv12-20020ad44eec000000b005321cec271bsi23854448qvb.186.2023.01.18.23.01.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 23:01:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CBj/4XrO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIOvB-000729-3y; Thu, 19 Jan 2023 02:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuX-0006XP-MP
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuM-0008B5-R9
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSvmGx9pg7RM2UEWG6YDDRKexZJzuEM2p+pEafedpfY=;
 b=CBj/4XrOkujEHRlC8z5U1xSZL7BsQJmMORlltYI6u4YkxmOGOTwejFnYhzjWcwMv/i63sj
 efVl26tVjoFj5M1w6a7x5VmeKQXx4158e6xKz6bpuS8dVdPrU5VH5MUuQ2TWbRoBTFjojg
 Qdrh1xsTYHZClAoEuVh/SzHFGzVgT70=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-RftXGxXaP_auvQ_IYat3Fg-1; Thu, 19 Jan 2023 02:00:04 -0500
X-MC-Unique: RftXGxXaP_auvQ_IYat3Fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E42680D0F1;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45BED53AA;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 599D921E6602; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 09/19] qga: Clean up includes
Date: Thu, 19 Jan 2023 07:59:49 +0100
Message-Id: <20230119065959.3104012-10-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-TUID: jwbpWxeFnI6q

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qga/cutils.h         | 2 --
 qga/commands-posix.c | 1 -
 qga/cutils.c         | 3 ++-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/qga/cutils.h b/qga/cutils.h
index f0f30a7d28..c1f2f4b17a 100644
--- a/qga/cutils.h
+++ b/qga/cutils.h
@@ -1,8 +1,6 @@
 #ifndef CUTILS_H_
 #define CUTILS_H_
 
-#include "qemu/osdep.h"
-
 int qga_open_cloexec(const char *name, int flags, mode_t mode);
 
 #endif /* CUTILS_H_ */
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index ebd33a643c..079689d79a 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -51,7 +51,6 @@
 #else
 #include <net/ethernet.h>
 #endif
-#include <sys/types.h>
 #ifdef CONFIG_SOLARIS
 #include <sys/sockio.h>
 #endif
diff --git a/qga/cutils.c b/qga/cutils.c
index b8e142ef64..b21bcf3683 100644
--- a/qga/cutils.c
+++ b/qga/cutils.c
@@ -2,8 +2,9 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#include "cutils.h"
 
+#include "qemu/osdep.h"
+#include "cutils.h"
 #include "qapi/error.h"
 
 /**
-- 
2.39.0

