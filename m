Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp134273ejc;
        Wed, 18 Jan 2023 23:07:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXszD3tIf1YdamD0AO5989SuvVYmrB6nqmS8GNXX5MunwFzd3pxfxR9MF80ZGbBagS/gaayy
X-Received: by 2002:a05:6214:306:b0:532:3351:6495 with SMTP id i6-20020a056214030600b0053233516495mr14545047qvu.27.1674112025789;
        Wed, 18 Jan 2023 23:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674112025; cv=none;
        d=google.com; s=arc-20160816;
        b=GypxsCM1JaoysJ+WYTDMEiNoRaOejUTimX/gr08iOV65X6EAm+UZiI2XXh2azUQnVC
         /zImKwUhhba13AOlCAuKsWH1bvbbR2tijiZGJ1Z9aRIA/pFJy3f7I1frV6bc902g1oUY
         N77n3wVotPj+GWMjwaeIZ75yb5qDQCDUAgjULPHGjMudgEWAv51uNoQxmbPI+GkKy/3D
         korF7MoIc9zsFf9XkflgfSryyLqo6+RQdW/i5ihW/mIGujXH1nfPP9AMdCRVUNq+vNmz
         ywNwTrMI8gPs+xb2KH6qhFaYieQukbngtg52qj5+YcEzfUPTda4zWuVQhLmgXkNMcIns
         bSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6HC870YUJByfkMZaMPwjTRzkOnJyWaURlvdeg0SRvwM=;
        b=YCjEuFNSUFn5RbONBIEHxvji6gCu2ry5urSYFd0Q9ZRhDVjKmBRFha8PI9kW8xgjvw
         VtrIul8nFepHqa/e3trax4q+Td8tE/7pECVv3QbsN7qcqbSYpqDyAwrkk2TLNu2TNajZ
         yo/T9CxI22fH+WfmW6hZIGP3L6xeMXPvudMlBzNfdsWztKhsSmzFzf+mLwUWvavIa4vh
         We4JxgRjsawnEQRXs4jMQjX8T9CGhEsfmEc01d0Dw0gMbV5MU9JtUoxQTjo1/Va9NDYP
         UdpxVUbFubqF0ZeQ/pUPZ7tv3oxrorod5VIkW/I90awPgQYHre40rDzt7EPrFCObgU5O
         B+Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S4Aw9eyl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo7-20020a056214500700b004f1f44e9856si23371022qvb.343.2023.01.18.23.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 23:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S4Aw9eyl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIOv5-0006tC-3w; Thu, 19 Jan 2023 02:01:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuQ-0006Tw-IX
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuM-0008D7-2M
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HC870YUJByfkMZaMPwjTRzkOnJyWaURlvdeg0SRvwM=;
 b=S4Aw9eylXCmM/ZTNZzQu0DUmb0J5MjeqFumSEbYeYogPMcQnb8ZkcuuCfUNccKoOo25RA8
 LN14yv1TXO4ibZ2IQMGtDdA/8Cm4ILTmQupFsPglvZEnYACBy7gyml9pr1aMHaNi6pyP4e
 HxfOOBEYNYQmfgfnuxx+M6zvv3PNJ+g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-k0ksHQ5UPmaK26KYeiBTfg-1; Thu, 19 Jan 2023 02:00:06 -0500
X-MC-Unique: k0ksHQ5UPmaK26KYeiBTfg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10CCE8533DC;
 Thu, 19 Jan 2023 07:00:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C72D1492B00;
 Thu, 19 Jan 2023 07:00:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 763DE21E5A10; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 18/19] 9p: Drop superfluous include of linux/limits.h
Date: Thu, 19 Jan 2023 07:59:58 +0100
Message-Id: <20230119065959.3104012-19-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
X-TUID: cD8JcDkuaFr/

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/9pfs/9p.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 9621ec1341..aa736af380 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -17,9 +17,6 @@
  */
 
 #include "qemu/osdep.h"
-#ifdef CONFIG_LINUX
-#include <linux/limits.h>
-#endif
 #include <glib/gprintf.h>
 #include "hw/virtio/virtio.h"
 #include "qapi/error.h"
-- 
2.39.0

