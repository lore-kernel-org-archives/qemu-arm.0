Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp131160ejc;
        Wed, 18 Jan 2023 23:00:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtmYtLW0gXtW6akonLLDdF+oos75bdBvJlyHpyup/fULDSKfphU286M09zD0ZF9/fDD5EKL
X-Received: by 2002:a05:6214:3b01:b0:535:2e85:44f1 with SMTP id nm1-20020a0562143b0100b005352e8544f1mr12928350qvb.43.1674111659111;
        Wed, 18 Jan 2023 23:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674111659; cv=none;
        d=google.com; s=arc-20160816;
        b=fYQ/rKMcKedvkqR7AtgyDBzTo3DrTqlHznEhY9qs4SqUyDDdnjsXK9UlqDyyYy7daI
         zjS3cWuju9wYNBfVUydSRqDOVQsV0lQ+Xc/1HwIjwZIph92B68vSESt/v19KrkQ3DmAV
         Bu2gosHmo9Gyvv4xVQiFU4EYtfRhcyGE242GKJbAf7DwYCPo6V65A9piK1ZIWqnRTbOV
         MPAlYkrZWlASzfTX8qNpERplhBeBe8jrAFJDMSLPc7y+mBqak0181pnvRnE2zzuD7VUU
         UiV0O9ABMeecyVt9Rgfgy4hDY2FU8hZpjKOVU2sP0RI9KKWaBgFe9FtojQbqQseZMb9Q
         moww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BE921JrQWP4TpjdyqLaSPNFTTip/SwY2uy8DueicnB8=;
        b=vPGztpJdhN7NgVuc9sOmaLM8IGthO4mGG6kwxP+nVLs/Pikz01ZsnXx1ShpY53SlZP
         mi0FahGst8NA4RTh6VSJKg3z6uJL63roEnl0WVuDrneOFRsMdG3EhMcndO59i02qnuiJ
         qF5OzILmy8rsMw7b+lkXJsr3peLYDpK+VoJUkAOYM1I3uGHSf68YBozy6z7Pw20H3jAf
         69K04imk1Ux39jv0wHNgcy0Elx9piwE+Umt5qewWkforEGziPV7vPvj/8Pb35wfzqgvh
         L3udEqbJss0V1XBLQ6QsEDx2cvDJLym8oF0hOZYebww8OKwCUPa6h35oLnrCDsvds9Ww
         i/Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JVgplON8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12-20020a05620a284c00b006ff1c55d74csi22773087qkp.28.2023.01.18.23.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 23:00:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JVgplON8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIOuP-0006R3-6i; Thu, 19 Jan 2023 02:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuC-0006KO-Nm
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOu7-00087z-Hr
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BE921JrQWP4TpjdyqLaSPNFTTip/SwY2uy8DueicnB8=;
 b=JVgplON8VjCalvTNKkk7WcAoigEs+BfS10XuXvnSkh7jWZmPOoDacTwmSsfZNNW1PB0Nty
 2cqC/KmtcsHMNbnQiLWSuNVk6CWXz2flYm9X2dxLpcfO3WMHFJ0dsUqjZq+W8OOZjl9WJM
 B8gBxBNsNzyzt+BAs2inppdc+GR7REw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-XvfwCC2uPKeV3vVc_zCOJA-1; Thu, 19 Jan 2023 02:00:04 -0500
X-MC-Unique: XvfwCC2uPKeV3vVc_zCOJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84854183B3CA;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B2231415113;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5FF7A21E6608; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 11/19] net: Clean up includes
Date: Thu, 19 Jan 2023 07:59:51 +0100
Message-Id: <20230119065959.3104012-12-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
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
X-TUID: ixJ6PKcQmWPG

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 net/vmnet_int.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/vmnet_int.h b/net/vmnet_int.h
index adf6e8c20d..d0b90594f2 100644
--- a/net/vmnet_int.h
+++ b/net/vmnet_int.h
@@ -10,7 +10,6 @@
 #ifndef VMNET_INT_H
 #define VMNET_INT_H
 
-#include "qemu/osdep.h"
 #include "vmnet_int.h"
 #include "clients.h"
 
-- 
2.39.0

