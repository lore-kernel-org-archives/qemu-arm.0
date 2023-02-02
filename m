Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp383924ejb;
        Thu, 2 Feb 2023 05:41:10 -0800 (PST)
X-Google-Smtp-Source: AK7set94Jqx8606QW3YCFYFhadGdci1caAVE5OFfWUsgXla1HmlUj40nfits0T2gIyWCpFwiK1ho
X-Received: by 2002:ac8:7d0a:0:b0:3b8:61df:1c2 with SMTP id g10-20020ac87d0a000000b003b861df01c2mr11141386qtb.56.1675345270297;
        Thu, 02 Feb 2023 05:41:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675345270; cv=none;
        d=google.com; s=arc-20160816;
        b=h+GMn+M/PHylmT/XyZHOooMD7fr/0t9W+AwAO5yT+rWS+dIfaZQD1FZRZb8Ji187Kp
         8DknScXtNKW2qQstagQxUSkoNZj0c4MLeRX2yJVBlgGBR/1BTnImYDdkzRczx9nfUWAW
         K8b69eoYtZaZh7a8eJ0vXaDInmqHsYTKFLtPhRGMCTXv3BhnNQoyqNGt5G9nvpgW8pgm
         ZGbFpwESEG1qbW/pr2ROTYaIYI9ahINywosZIXLvMmL738wvbaSgqWn9Xb+WKjFdTcgf
         Z4YGKQAGSYKlCYl/Sn8mKFcwh46n1jDzzO7P8nKgtNBqJrHLHaQ1JC0UOEhLNdbfWXb7
         sxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=y7j6o7r+ivhZioL5mOuRS4hPfEFnlJBnJW1dpYzk1cw=;
        b=GCOxmSqBS+frQNN5grntCLu7kS7KMnUY5S7p9dmR07Nj9CV/13/XEEQhaEGgpgeMJV
         TVlR3Ljmw5FlntbEK0Z12eK7G5j+ja9DCLltI9V8FqPuUBG1G/navhjXsWmYsvuAKQlD
         TNE+LxB6BvsrsLauTKNkfBQU2n+R3DlJf+/niME+q1ZqdRGQ679rDqCS0nCcxio59RQJ
         VmGVVpL296ya5dVDFoc1mgwpVsNfd0OQRgPK73YB0EgIhenfxKrCfP1nXc95doHBZtT/
         nZqNNutDusb19xTYxU3Q5saCbSkq8d2Dz+Ua/j8tbqudEyliXZ3ijaFnDxclK8KQrwIM
         zIuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dQkcuGYJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12-20020a05622a060c00b003a5cd4b067csi12504256qta.776.2023.02.02.05.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 05:41:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dQkcuGYJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZoe-0007Cl-VB; Thu, 02 Feb 2023 08:39:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnt-0005jP-W5
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:39:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnc-00088h-2h
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7j6o7r+ivhZioL5mOuRS4hPfEFnlJBnJW1dpYzk1cw=;
 b=dQkcuGYJF1hBVRYmIhNCxZL2/pwoj0OJMvThhxqjiJw8aKGH7UJUFKcqQhIRv8FavLt1lQ
 kr2BkzzYiJE0Y4GJEUn9dzVhntxszpEBWZnDrjqVE/E7U0d6pET2dPDLikKTZ1poRq5W0i
 R3YC4uUrDP68XaCjZOKi9T+g6MgDsSI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-ZpCnhEpENsSFIzE80IDjjg-1; Thu, 02 Feb 2023 08:38:38 -0500
X-MC-Unique: ZpCnhEpENsSFIzE80IDjjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC88C382C997;
 Thu,  2 Feb 2023 13:38:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5689E2166B3F;
 Thu,  2 Feb 2023 13:38:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C979121E6901; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
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
Subject: [PATCH v6 10/20] qga: Clean up includes
Date: Thu,  2 Feb 2023 14:38:20 +0100
Message-Id: <20230202133830.2152150-11-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-TUID: A1bRiqFE7S86

This commit was created with scripts/clean-includes.

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

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

