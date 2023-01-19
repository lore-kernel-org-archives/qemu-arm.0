Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp131402ejc;
        Wed, 18 Jan 2023 23:01:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXue/9lIM89HChtCFxWZT9mleyM/crNnLeMwtvKDDjG0ovLls7KI/zZ4YQUDiSLXyfzQWn3g
X-Received: by 2002:a05:6214:5814:b0:535:571f:d4d7 with SMTP id mk20-20020a056214581400b00535571fd4d7mr223309qvb.49.1674111682210;
        Wed, 18 Jan 2023 23:01:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674111682; cv=none;
        d=google.com; s=arc-20160816;
        b=leUCNjUammKZqqTUc5RzYZJmc8mjjuiIRJxqMV/7+pxKbhkR82YnL6YLt3p7+btvOi
         PyXg2zXBYcndNToU5u0eEvfuZgT6GpEfvX5HfHM6dmCIZY8/xMYh9foNqk8Dc1N1hS79
         LsD6MiMfgfOVBozwixi5safD/fCwWmRSuybfbl7bmQ4aXrOWbPwznFw+mPI/jHkD78NU
         VDry3pX6W+zFre/SL2l778EuesnlggE+F74r/9kWzj2lFJ0JnT4virHa5MFyeeaFrpdt
         y7AVWZvIN59DuTrR+tIJYl7bkt75MgNnq79xRlUOAE3R/eG9j0d/IBESbbWxsKIf/OYT
         cEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rlmxNJSVO7GqLGy91wM0ekp2hbEv83W0/JnJaieGtI8=;
        b=AcDc/mB5qKUWb0qnPv2DKWumyY0/zb1h/fvJNdWusBI4pACaBXOiSj5jOCkq1Yhw77
         ceZ8X7HJHkdSYHYf4ZKjZxc/CelITO9fEC+E06HlImcS3LztC4L/99Qu2YbN06nAOGYF
         VwjG9E+/17e2iGzHRfqlC0Ci9PfH67sW6VnJxGcc3KhU808IXD2PFzClPMdLQuFm5l3Z
         10GppmeDDiIGJfeyNkN3fvepfFmTHr3HuNDBoWVmFIUUgZPPZd7Ejn/Rgoa0hjlxXbbE
         3V3WO1ivHDQ1IZ9v2M3RDwvxuDWRG1PV/rhh0H9jB9XWN0KFAzATR5gq9amEchQ5bAKR
         WwWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HDmuJZpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw6-20020a056214238600b004bba80844a7si21371001qvb.270.2023.01.18.23.01.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 23:01:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HDmuJZpy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIOui-0006dn-ER; Thu, 19 Jan 2023 02:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuO-0006RP-T5
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuK-0008AI-5q
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlmxNJSVO7GqLGy91wM0ekp2hbEv83W0/JnJaieGtI8=;
 b=HDmuJZpy7b1vWQmtfDm/t7drH+yG0qcaaqB+6K9Y5URb+apx5cGx6eM0qNJ5HeqcYpaOS9
 ujTS02BQJ0EJzmjVDjGtb99EZQvanf/b9l2GpfK2JQLFAXmX3ysdNSBa9I0M5G06olqoT4
 Oley2ZcwyZoACDzlIdRUvhFN+tGyRvw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-JW2PeW3zPven5T6VEfRQig-1; Thu, 19 Jan 2023 02:00:05 -0500
X-MC-Unique: JW2PeW3zPven5T6VEfRQig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAA2138107A4;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AE722166B29;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5CA9921E6604; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 10/19] migration: Clean up includes
Date: Thu, 19 Jan 2023 07:59:50 +0100
Message-Id: <20230119065959.3104012-11-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
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
X-TUID: FgrJO+Dyd6K2

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qemu/userfaultfd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
index 6b74f92792..55c95998e8 100644
--- a/include/qemu/userfaultfd.h
+++ b/include/qemu/userfaultfd.h
@@ -13,7 +13,6 @@
 #ifndef USERFAULTFD_H
 #define USERFAULTFD_H
 
-#include "qemu/osdep.h"
 #include "exec/hwaddr.h"
 #include <linux/userfaultfd.h>
 
-- 
2.39.0

