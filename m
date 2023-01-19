Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp131859ejc;
        Wed, 18 Jan 2023 23:02:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtjoQHG1ZJl/6bWgPYfgPzi8mwO5LFROubVqUOcPFYmlJ8X5aJ1EaQMMqTPQit7xM9qCVgQ
X-Received: by 2002:a05:7500:4bc8:b0:f1:c741:7375 with SMTP id kx8-20020a0575004bc800b000f1c7417375mr976999gab.49.1674111730319;
        Wed, 18 Jan 2023 23:02:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674111730; cv=none;
        d=google.com; s=arc-20160816;
        b=ok5hdWfsKGEY8+mT1DYmapye6VzThINYJ4FOEddGqh+kkb9R3HGXY4vbbrmlEQUzYt
         mBhOX4JpkaHhrmsmcsE8TBJ54ssdIz/uaNaLpUyv2OMga6mAXnx1KNd0M3S4ob41Gsa/
         4HBVy7hD4t+v87Hy9uH5DPTX6MCpnjC633/DrSaxyT9K6KwAwG0GUnlPC5hgiYfWf78F
         VYtBARM4nHjI7ZMrMthaOqirbwaGn9xohRT4gILd3p4kykGQVIzpfr74FVQBKCdeK47s
         Eh5OyLlsiOgbOKMhxrS+1dXPSEwYtm93NDmvocNTmSnFBngUUbDEfKpel/0l8WsvFVL0
         1PWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=I9eDmQMujepM/kxEtYgd4YzLcqhO2qph2AAWSt1MpLM=;
        b=KfRarbOO8EA6nnIGf+6oyr+JQdLrACWibS8ttxKCkvEcC2tyEKaT4Hakw50Jd0oNMo
         Iln5sLDBzc3h5RjFm0zdqz06T2TF43R234mjgO8HVm3RSzkptgX0YWCoPg07tqsQ7y/Y
         t4dwZuXXDHBPL/en9KTV9QQZwZ9LeQOyxJzyB1AHzrOcuH4uSkddNrKKC2Giu81qIizJ
         DdoRYSO4XtCV9JSeDPbEnCNkQgBfhrdgTnQyAum965KkiWKELinz0QBdbTvGGE+MSAAP
         YD/WvMZfbqZeygHYkdOUzL4asIDq9eNFedBUVpJtUMc9QWvDrv44hJZJ3PMTfhb50xQS
         bi/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GTUkycbN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18-20020a05620a2a1200b006fcc8de31a7si24312802qkp.396.2023.01.18.23.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 23:02:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GTUkycbN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIOui-0006eF-S8; Thu, 19 Jan 2023 02:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuM-0006Mu-Cp
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuI-0008Ad-67
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I9eDmQMujepM/kxEtYgd4YzLcqhO2qph2AAWSt1MpLM=;
 b=GTUkycbNgwiZvuB3Bsr4uUas9l0K9azvgf3MDOk5fr8R+fudP/Zm5GGh+rMvNQt3oskloX
 Mqoz1hCrcw/gzRGozkBKdSLWltqKTAD+Pn+/27Y46cS+Fi7nVdEdiz3JKX6UBMtAb1+4Ha
 Ny+gnzGvylTJErgYXc38DO0yzd7+4oE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-Zxhx27h3OOuE5zFfnbZVtA-1; Thu, 19 Jan 2023 02:00:04 -0500
X-MC-Unique: Zxhx27h3OOuE5zFfnbZVtA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C63C18533EB;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82B4640AE1E9;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 664A421E660B; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 13/19] riscv: Clean up includes
Date: Thu, 19 Jan 2023 07:59:53 +0100
Message-Id: <20230119065959.3104012-14-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-TUID: OxqRezZFyTNS

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 target/riscv/pmu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
index 3004ce37b6..0c819ca983 100644
--- a/target/riscv/pmu.h
+++ b/target/riscv/pmu.h
@@ -16,7 +16,6 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
-- 
2.39.0

