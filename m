Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp132562ejc;
        Wed, 18 Jan 2023 23:03:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsBt3i1oNMqspYsw3erfLlCXa5XbLeGwSe7QQcH/hAXuLpzlj7hXEq6O1I1GxGdgQk5ZE9u
X-Received: by 2002:a05:6214:3006:b0:535:2256:a47f with SMTP id ke6-20020a056214300600b005352256a47fmr18404877qvb.49.1674111808565;
        Wed, 18 Jan 2023 23:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674111808; cv=none;
        d=google.com; s=arc-20160816;
        b=a4jQUY+ZkyVOl4V8s8tyuGp6ntyLyWWyjZGP4y3dO22oEV6EO6J/sEpw8lGVTLjYNr
         wefb7Re7AhQAryjjazZirhT8PqSgw/5TyUHdAN4ZfWm5d0mjPL/7ICMF3zKuEcsRqU+w
         ysMuF2uUEl+2v6LHE/0eV7VA3E/Sd1b5TQRkJd5pKHQfmXmhMFzWYOSgsT+xtcI5707/
         WqtA6bT2w1hTes3AOCNpwZ9aPSb4cvlp6bml0PfWmFewU7T2Cp4aWR3TNh6rwH56Q/YN
         xUmtCsF1zv816lDTYUrsss0ATRXR/H8FMt76kCoy7/OGuBfcVzyAIV1OTn4SuUkn5oOR
         U+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q7Aa4H8NxI3BfcTgY65K+THkgcyzhdU7KeXHSHDpbkE=;
        b=YsgyZ9NLqOPSpbfiFlzNMsxixT1+m1DYFFtbYagseKy8BPGjuUtROisPwCBY36jKuZ
         G7coIY9AusEueZbY8FUARrj8nXLRwzguWL+eiduDbpQkcTVhdl6LNo5P4rm9SrlB4KRz
         +sXRXy5AhigECWcjzXSc1ku44Of+2PLfw+/nwafR4p+7qGqOvu0X1nVCFyEXW7VQArpR
         TQVwcZ34HK2YXSkdUpUCIn5tr6Wt16P4H4LBK1BRWuGaYdK+RuU7C73wGGQ9yCeA8Ou7
         XEiVnFDRP8Mn/r/vlOCniVE50/w+UFcV0MJaYyqmZ3yL0ssrP4xxJjikl1Wrx1BWBFGw
         wS3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MJQvM0VG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl25-20020a05620a1a9900b006e366c7db36si23696911qkb.427.2023.01.18.23.03.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 23:03:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MJQvM0VG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIOuy-0006ng-Cz; Thu, 19 Jan 2023 02:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuN-0006Nt-Am
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuK-0008An-3a
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7Aa4H8NxI3BfcTgY65K+THkgcyzhdU7KeXHSHDpbkE=;
 b=MJQvM0VG29xtmV+pgKVthHiIto91bsiL4cFpSKxU67p/e1zoPsgUdW9nYz93Hx4wtuYdpC
 vR5DuKQz/kQn7pi+2CihSDlTHiMQMGF1ZDABzNncY+0BPDtry7bAjx3NLALlMv6j09xyn4
 yDhusL7pjtchDko0w8GmPNzZSxi/srw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-bVDpfzNVOwS1e93czWbLvQ-1; Thu, 19 Jan 2023 02:00:04 -0500
X-MC-Unique: bVDpfzNVOwS1e93czWbLvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E23A1C05AC8;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 229FA1415108;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 509DC21E66A4; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 06/19] hw/cxl: Clean up includes
Date: Thu, 19 Jan 2023 07:59:46 +0100
Message-Id: <20230119065959.3104012-7-armbru@redhat.com>
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
X-TUID: bLPgkW+s08m7

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/cxl/cxl_component.h | 2 --
 include/hw/cxl/cxl_host.h      | 1 -
 include/hw/cxl/cxl_pci.h       | 1 -
 3 files changed, 4 deletions(-)

diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 5dca21e95b..692d7a5507 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -15,9 +15,7 @@
 #define CXL2_COMPONENT_CM_REGION_SIZE 0x1000
 #define CXL2_COMPONENT_BLOCK_SIZE 0x10000
 
-#include "qemu/compiler.h"
 #include "qemu/range.h"
-#include "qemu/typedefs.h"
 #include "hw/cxl/cxl_cdat.h"
 #include "hw/register.h"
 #include "qapi/error.h"
diff --git a/include/hw/cxl/cxl_host.h b/include/hw/cxl/cxl_host.h
index a1b662ce40..c9bc9c7c50 100644
--- a/include/hw/cxl/cxl_host.h
+++ b/include/hw/cxl/cxl_host.h
@@ -7,7 +7,6 @@
  * COPYING file in the top-level directory.
  */
 
-#include "qemu/osdep.h"
 #include "hw/cxl/cxl.h"
 #include "hw/boards.h"
 
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index 01e15ed5b4..407be95b9e 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -10,7 +10,6 @@
 #ifndef CXL_PCI_H
 #define CXL_PCI_H
 
-#include "qemu/compiler.h"
 
 #define CXL_VENDOR_ID 0x1e98
 
-- 
2.39.0

