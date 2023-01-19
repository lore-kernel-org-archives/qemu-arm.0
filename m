Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp132346ejc;
        Wed, 18 Jan 2023 23:03:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt4ft7nCSTeSLCEfc2zSb0LYL+x/JXHrAYuW8esZPfoGVOueX1KGfIljLoP18zTx+QIR24R
X-Received: by 2002:a05:622a:5a8c:b0:3ad:d2d4:2503 with SMTP id fz12-20020a05622a5a8c00b003add2d42503mr17001439qtb.7.1674111783378;
        Wed, 18 Jan 2023 23:03:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674111783; cv=none;
        d=google.com; s=arc-20160816;
        b=xAy/V84K/utN1EWtoDwLFPb2Y2OUMJjpfA6lO7wM+wTZSJmkTAe2cyRKzWpYlCpudL
         V1H3vwcz0mdQNWCyNAgJZEilz3cc8NQ1QQ/oKdWpL2vpqIPXTCsKS/VLw18lF9UmQqjf
         zaOVyPq+7MHoSL+2BLPJT8GVRq6f0EH1po8rVqBcUiUaDku+PoQTK59615TsYofwvMcr
         LBcIItERtebShi49+MykTo4gey9TluBKauvs7GvU0NAJWRf6SfEcY3wfHP23ebOxb/YY
         g4F9owFgh59iwm5beGA6XZucKiEBVaUnXPCktOSRhhdEQnsMY046kajaU6D3eKF3W5RN
         oVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=osxuc13IOeeQnt/BeEajhTLlc11XxWiHUgCrHTX7RbI=;
        b=dAZEDecVMKd25UD8nBwTzrMRnW92mQIGHZnEufjaPw4xLqiDcNVYsqYTj5TVg/CJOs
         WhkgBG0y4i2RqN33gjD9tDWY7LeKrgmuK0Pyw70poIhFOWud9gj/yJ0tGNYBoi2NfDPW
         St9Tm1VVnnPlYx+L5aNLsO+BZdx5EaIO1rIuoWRyIqYMuAZxVa0Q8aeDpWFetyxsEUug
         JN7eQIyupM3mC/0d6t7oJx8vGdnQayPZ5Y5qX1UoqBvFUrGfdG7pj+1gCqfnYqOxyGKi
         abOsHGrlC8CRVpqYyxfzlt+1Y+5Iludc/fYIgTWPP3y0O3KMJCY3hD4o4ssOQe/GJbAe
         fLXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dms9iDgd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca9-20020a05622a1f0900b003b2202446a6si13040166qtb.517.2023.01.18.23.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 23:03:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dms9iDgd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIOv7-0006yK-A6; Thu, 19 Jan 2023 02:01:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuN-0006PT-Oi
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:00:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuK-0008A0-4I
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osxuc13IOeeQnt/BeEajhTLlc11XxWiHUgCrHTX7RbI=;
 b=dms9iDgdml0V5rcUcqR0Ikt3s8DIBM1ruYsVi0q7WRuiYF1+QE7ZSbfiRx1upcw41hXHpP
 V3m7LMWRoanAp8mqhMIsTU+8lnqXOhMiyG3IrEEjg2oCyyv6IGSQOLbe/iP1viwnLooIg1
 qgRQcY/EhkhwUDr+5P9OISfF7moCCpc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-ivgpKZvLNv-GQ1VCnY-zlw-1; Thu, 19 Jan 2023 02:00:04 -0500
X-MC-Unique: ivgpKZvLNv-GQ1VCnY-zlw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5578E1C05AC6;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C700492B00;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4DB3A21E669F; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 05/19] crypto: Clean up includes
Date: Thu, 19 Jan 2023 07:59:45 +0100
Message-Id: <20230119065959.3104012-6-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-TUID: 207eZEc9ktwC

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 crypto/block-luks-priv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/crypto/block-luks-priv.h b/crypto/block-luks-priv.h
index 90a20d432b..1066df0307 100644
--- a/crypto/block-luks-priv.h
+++ b/crypto/block-luks-priv.h
@@ -18,7 +18,6 @@
  *
  */
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/bswap.h"
 
-- 
2.39.0

