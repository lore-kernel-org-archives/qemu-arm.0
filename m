Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp944503ejb;
        Mon, 30 Jan 2023 05:28:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9hWc0Ixzc7uxeBoGLG2JWaDzXXcbo30wcA1LGjtJeAciQB77wVSwHNIJiU5MHi0KNUXlWE
X-Received: by 2002:a05:6214:5343:b0:537:77b2:8aa3 with SMTP id kv3-20020a056214534300b0053777b28aa3mr27306697qvb.27.1675085282695;
        Mon, 30 Jan 2023 05:28:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675085282; cv=none;
        d=google.com; s=arc-20160816;
        b=DWQi8kaMGFYdFLic2wKd0SCpWMVD/hyOmtpNsEPyTfQ/bbt39W74olcvu1zeRy/nkH
         A4ESmObumL/YoQYqaHec+SaiaFwsuC7u9geLDV/lJYxuAq69VFnWAef0Lg6SNTHygbcj
         iNPgdypnSw1nJL01nR0pTKTB+y+zn5eqYjQA9Wqtq0piENKmO2GRNI2CpeUKGsVJfQN1
         sVj2VMEMrb0MWWn/pWyLJJ6PSargPrRneSfnofNH45ytTdjBaTKUCfGuK8umLBC5gAhj
         mOubOtZEuGAGqTU1tHfhQEg3S7GHvxECYCxEYFd2uFKMANOL5b3aeKFKqZPS6Hl2jfHT
         M7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7Lsooe6AIqRlDKr8oVmxGSClV1yzmJJRHR2bzlPP/6Q=;
        b=ugw9mrgfJX36SGw2TVONr8MKbbZG9N15RsVe3Kkb2fmG+gnWwdFTX4YwUOgpEFNTtq
         UN2fMNRpHC8I4Ch7sLHxiOqvYWAcpg0/bwXzbv/Zejc4xudQ2AQN3Q6CrXatR7MdARns
         m8eynrgzeVspq+x/rvQNWhDKAgNAhWClzhiMs0vSpwbTmzNocrmhrX1dMhb21qsgaWiW
         HLUVuYEqZ/lKlwOJDqfl2jbHzxgbNbTo02MazmCkps3AhAJSBIqntlQIvT2OInmoyxbA
         fjvEH1SlFR5UKABba5UOTGD21HClkmS9O/0WW4XHxHlmV87rlcVWRvhXTs8qdUFV9L0d
         jB5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LFtjWq2j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020a05620a245200b0071f40a59fedsi1614171qkn.653.2023.01.30.05.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:28:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LFtjWq2j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMU7t-0006ZW-Ex; Mon, 30 Jan 2023 08:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU72-0004vr-T5
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:22:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6n-0005jo-Vx
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Lsooe6AIqRlDKr8oVmxGSClV1yzmJJRHR2bzlPP/6Q=;
 b=LFtjWq2jN4atCQR+73KC6VbTP3KxGPBRv3kd5e1HiJDNj6YPWoLqDEqnStzRgHYUGU5llF
 qhM1AJB4y/hvMibzZNAAf4REQLrc12WRBAVvvN2Q6SP1V3HQ/YW1tvjhwpoGUy+C/5F5M6
 enPcnKI8t06XwANcPMb1uXzMWQqtNDQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-DanFbV5BNXyokyNA3sjBkw-1; Mon, 30 Jan 2023 08:21:59 -0500
X-MC-Unique: DanFbV5BNXyokyNA3sjBkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A143C183B3D1;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B06640C2004;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5C15021E6901; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
Subject: [PATCH v5 10/20] qga: Clean up includes
Date: Mon, 30 Jan 2023 14:21:46 +0100
Message-Id: <20230130132156.1868019-11-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-TUID: g7LM8MbX1kdP

Clean up includes so that qemu/osdep.h is included first in .c, and
not in .h, and headers which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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

