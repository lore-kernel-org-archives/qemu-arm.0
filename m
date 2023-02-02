Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp383885ejb;
        Thu, 2 Feb 2023 05:41:06 -0800 (PST)
X-Google-Smtp-Source: AK7set8QcydllOA2etaT9YhOBpm7/nXk6CGu1Yqzf/RZrSfuYjmlG4y8akrBW4/scTmqVbbtgvfJ
X-Received: by 2002:a05:6214:aae:b0:557:a5c5:7df2 with SMTP id ew14-20020a0562140aae00b00557a5c57df2mr2789887qvb.10.1675345266537;
        Thu, 02 Feb 2023 05:41:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675345266; cv=none;
        d=google.com; s=arc-20160816;
        b=nFP2rv2vPDsqCFScKf/a0Kuz5F/O9Osec3OP+pkYFfMz/VzoVux4GJm7IHCg9sJ0yx
         cfqHAZT5JwOKiWBFY6xHccT9XRRpm1mi1NrDvzrZgh3BaB/4oz0z8zeHYVmcn8NjSqH5
         DglBGqdW8q3rKMz2zpEnnoVXo6IjcpH8szO6BDfDwveRVzaBNdV6oGOCQfh4jPUD2dDa
         n2+Tj6Wr9lGA4nEZ9BKbZ77K5PriCfTpjS6XHxztQdLC+bj4U5hNsQE3Aah1fJ7aAPyf
         TbPmddYcSllMD4knF/yCbBh0kFf0lyqt8jhR6niOmGW7PA9YbXWlGebpVRpBofWAjMAQ
         pfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1xpdh3T+Tq8TpF+aECgwaz/Yobg1qYCgW4QneLFug+w=;
        b=fsFI8VoyowkwKK5XoAWqsx+TsKv99vQtRMjDSpAd1dLzYLteTBaizIzDQJi4Iy28h1
         XZilfwPwMFqNjm58pKM8DCkWAvurEs4BVaP3xB92LgLuvag12N1huO23p4SPlHCEL3g4
         i5xKhXFykYkXx5FviwcBzBwxMcj3qMTw8vJxKWldn4CgYG+/IRcn2x1Ocs8mkkQUPH5f
         g3aYXPo6YuJoeFfwooy+8GV0Fr08ggjckuTblEHewEhj+iMcGHchQ8YC7v+H3D0Tt3+i
         rNVdNVHzsSVI1da3yyllbU5XZFkNEoRRtGRPZ4mbSG1v/24n7Rx0daOo8tzu65IhOH9Y
         BJsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fevpkQQs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s21-20020a05620a16b500b0071bbe916b10si8869384qkj.462.2023.02.02.05.41.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 05:41:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fevpkQQs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZoY-0006lL-OO; Thu, 02 Feb 2023 08:39:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnp-0005dY-Tt
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNZnb-00087o-Br
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:38:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675345122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xpdh3T+Tq8TpF+aECgwaz/Yobg1qYCgW4QneLFug+w=;
 b=fevpkQQsG7oh3tLzt0IO4yOG93VSzjGCQVXAeAa5L0kdr7H6XaEk9mXVG7PVLNIqq99OIb
 qHcB1lTI+sw/gvM+8KL2KIJyoASBkstDsqpNQRhE5pZYxIQc9FVx8/hYbHIpkN7tZCJz/d
 FduGkquzd38oJDP7FKHUNALQzHkkOiw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-LSzOUkDLPLyChJuai2Y_6A-1; Thu, 02 Feb 2023 08:38:38 -0500
X-MC-Unique: LSzOUkDLPLyChJuai2Y_6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F5C01C041AD;
 Thu,  2 Feb 2023 13:38:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2947A140EBF6;
 Thu,  2 Feb 2023 13:38:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DE11721E691A; Thu,  2 Feb 2023 14:38:30 +0100 (CET)
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
Subject: [PATCH v6 16/20] accel: Clean up includes
Date: Thu,  2 Feb 2023 14:38:26 +0100
Message-Id: <20230202133830.2152150-17-armbru@redhat.com>
In-Reply-To: <20230202133830.2152150-1-armbru@redhat.com>
References: <20230202133830.2152150-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-TUID: tzY45ZcRwWaQ

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
 include/sysemu/accel-blocker.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/accel-blocker.h b/include/sysemu/accel-blocker.h
index 72020529ef..0733783bcc 100644
--- a/include/sysemu/accel-blocker.h
+++ b/include/sysemu/accel-blocker.h
@@ -14,7 +14,6 @@
 #ifndef ACCEL_BLOCKER_H
 #define ACCEL_BLOCKER_H
 
-#include "qemu/osdep.h"
 #include "sysemu/cpus.h"
 
 extern void accel_blocker_init(void);
-- 
2.39.0

