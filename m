Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp383642ejb;
        Thu, 2 Feb 2023 05:40:44 -0800 (PST)
X-Google-Smtp-Source: AK7set9v6elJmKGLfIKr6umlfbtBhRLbpQbRwu7ARm5lQCtlIpFjin61ihlv2QMztbGxDDL6pUvZ
X-Received: by 2002:a05:622a:308:b0:3b8:4783:c084 with SMTP id q8-20020a05622a030800b003b84783c084mr11430502qtw.61.1675345244445;
        Thu, 02 Feb 2023 05:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675345244; cv=none;
        d=google.com; s=arc-20160816;
        b=u/d43AxJSt2tM2x+/HN6a3X9eiyivqEtUFAWF57zeXEJo8jgqvMLGELZVwOYv0lNFq
         fDss3fS8gNr8is4huv1iy2o0fmfI+I0J18uWOywduCvJZzF+zlNWCCxDkzCR8mSpgwbQ
         bOoTNi6b9QfJSATvpk3mVrQ7Ep5lKhiVWRXXgKNYmfGPVIfqFe3UXP77SmJlfTO6YX5i
         uJ7LgzYuVq78c+7fygrvuPiZmBsr2/svKH+lx7/6OfUJ+IClcYlRAket/wf1gCrubD9M
         1aQnzF2jKVgTfgYgPtcIKe8XJ/jn7JQ7Nw+rdlVF0SbRmYrIfuQSqTg9ZqewuCj4pWZl
         WvaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ztQP/SqqrCaKQYJfZ+X1RaeQC7KkOBLzr09TiX1vwi4=;
        b=VaDtpKGPhjztdeA5iJBdcKP6QvlgUocNczt/29yZ28OsT6LA1H1AkWwqIJdj3VRiRk
         pdImKUr9FbW21j5dnFttKVldCrj4Hed7mGhL2qJtgom0dmsJN0e3F8dXKpp53LnHWnzb
         0NffbITU39iMAuFDwGzhLx+N4ENwSWyofg0WuKQqNGpe7BtVsDYxgmPUPvjSSsPcF9Sx
         tVADEWfS1Kr+ccNO7+zUkiGzhIdCzpaRSkDAwTny0ttKf0humNDibEfGEkBIUSliJtVI
         YDrMEixpT6jHHEskgV4934D6FzYfoS+wOpIOBxjI5suYLCSYZLYjZp6qS9AqiqJDT606
         0W3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fcP+1ZN6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c64-20020a379a43000000b0071a30e5e284si10078768qke.119.2023.02.02.05.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 05:40:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fcP+1ZN6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZoE-0006Fh-80; Thu, 02 Feb 2023 08:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnk-0005av-Ht
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnb-00087Z-23
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ztQP/SqqrCaKQYJfZ+X1RaeQC7KkOBLzr09TiX1vwi4=;
 b=fcP+1ZN6fDQTSSa7Lsh+GmyhNXTD7NOkot861RiBwfSmO19IAqO0AeSI+qZu0+/rVFiIVF
 5UyfmMNbmLKKsDrHIPBbbscVIvZxq0F4+GR3475NPNXv6k+RKVHodueRznpp9/4HFPyKVn
 cV0lifnjF4NWW7hOhjquP+mNaMTGzEo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-4tsRXFzWOaCR-Hii6OnmZQ-1; Thu, 02 Feb 2023 08:38:38 -0500
X-MC-Unique: 4tsRXFzWOaCR-Hii6OnmZQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0696D81DA89;
 Thu,  2 Feb 2023 13:38:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D183B492C3E;
 Thu,  2 Feb 2023 13:38:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D053021E6913; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
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
Subject: [PATCH v6 12/20] net: Clean up includes
Date: Thu,  2 Feb 2023 14:38:22 +0100
Message-Id: <20230202133830.2152150-13-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-TUID: TSULQIJf73id

This commit was created with scripts/clean-includes.

All .c should include qemu/osdep.h first.  The script performs three
related cleanups:

* Ensure .c files include qemu/osdep.h first.
* Including it in a .h is redundant, since the .c  already includes
  it.  Drop such inclusions.
* Likewise, including headers qemu/osdep.h includes is redundant.
  Drop these, too.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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

