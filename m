Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp131438ejc;
        Wed, 18 Jan 2023 23:01:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuZynhZY87qHiKo3hE0KJG1OM/ij8kdSSyMookuvd6W/pBhMtzoZYtwAGkkHoB5oDx/ih72
X-Received: by 2002:ac8:58c3:0:b0:3b6:3594:3470 with SMTP id u3-20020ac858c3000000b003b635943470mr16978118qta.43.1674111686532;
        Wed, 18 Jan 2023 23:01:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674111686; cv=none;
        d=google.com; s=arc-20160816;
        b=jxt/2o5/VDhNtGTKLGfQKTKeyqhzYpAqTzRsoLY/+ru5JEu/xQm0RaObrIfN3SZMdK
         uwbUEu5xS+6qoyn5drebg8Vlo2ss4kexSjmv+s4NnzNYAP6gF1/MK5U7CqJmQudZaUgE
         T9KeuMBQv80EizIx5s4qY9oDMt2Tia1GEXl91itLZdG8tjBmgIpd9e+P47NlxeNNHVkQ
         bp0G3e1CMO4zK1dYRybihwDwSTc8JPkQIPKtAcjnOXvjA5MCo/9GA3x22IbmKE5Cb9ZD
         GQLWYwshHxEYHQ0ZHQt/6zJi32vkfSRhF0W2OOy9TttKhGTRnucfJGmQKzuTO3Q0K9cR
         NJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KJ8KOH8nIqaOp0V9+BTR+CpJ02hP4F+vGPzj4gdl0rs=;
        b=DllP+MdjTkAw6MrJmF0HjFWaKBtApzdrUQaK93AQQ+LCaaoDWoLgX39HbHiQ3VFJlF
         yTUVuQ5/ifhV0zTgTMue1xt0ydJHvx6e6lQrE+5ghZremq5g6riAG9x1+D5mlTmaKJMf
         umdXHVgY8NVdKxxqo9ZSqi5PeOJpalak3FhyEBz4bAEdWippW0CPTtxHXBYq1xKpjOHG
         ++BqhJaY2LixiSFOp7gNmLtix1vZNJBr1hfug5NcuoYBWBK5KS6Ib2KYKxG1F4Xiquxd
         reCUA7lGJZi695uFOf87eiBCFvglJMuAxaEuz2x5zLkmt2lGCgeZxs0ahm/aSOqQGJFJ
         REFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PzX5uqmd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020ac87587000000b003b62d5d2f5bsi7091208qtq.735.2023.01.18.23.01.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jan 2023 23:01:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PzX5uqmd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIOue-0006ah-C9; Thu, 19 Jan 2023 02:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuM-0006Mw-EX
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIOuI-00089Q-Ew
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 02:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674111607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJ8KOH8nIqaOp0V9+BTR+CpJ02hP4F+vGPzj4gdl0rs=;
 b=PzX5uqmdF5wLAMDAJlXr6VN9Ynh5uojoQExtdaHsfH8jD5T2E5JBKiSHBbXy+fbMF7FsEH
 Yup+zDhcaSPVIN9uCskx8Tk/SWTnqhHztAcy/yIM1IpSBHFNTylm1ckBH4vzwnyVc0rupp
 amDVGw6/NcnznwNWkuMQLUT6RR8KRNY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-XD1hoiD2MDeYEiAjogJ-qQ-1; Thu, 19 Jan 2023 02:00:04 -0500
X-MC-Unique: XD1hoiD2MDeYEiAjogJ-qQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A21D1C05AD8;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54BA12026D68;
 Thu, 19 Jan 2023 07:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 630EA21E6609; Thu, 19 Jan 2023 07:59:59 +0100 (CET)
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
Subject: [PATCH v4 12/19] target/hexagon: Clean up includes
Date: Thu, 19 Jan 2023 07:59:52 +0100
Message-Id: <20230119065959.3104012-13-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-1-armbru@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-TUID: ObMQVWz/a2e7

Clean up includes so that osdep.h is included first and headers
which it implies are not included manually.

This commit was created with scripts/clean-includes.

Changes to standalone programs dropped, because I can't tell whether
them not using qemu/osdep.h is intentional:

    target/hexagon/gen_dectree_import.c
    target/hexagon/gen_semantics.c
    target/hexagon/idef-parser/idef-parser.h
    target/hexagon/idef-parser/parser-helpers.c
    target/hexagon/idef-parser/parser-helpers.h

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 target/hexagon/hex_arch_types.h | 1 -
 target/hexagon/mmvec/macros.h   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/target/hexagon/hex_arch_types.h b/target/hexagon/hex_arch_types.h
index 885f68f760..52a7f2b2f3 100644
--- a/target/hexagon/hex_arch_types.h
+++ b/target/hexagon/hex_arch_types.h
@@ -18,7 +18,6 @@
 #ifndef HEXAGON_HEX_ARCH_TYPES_H
 #define HEXAGON_HEX_ARCH_TYPES_H
 
-#include "qemu/osdep.h"
 #include "mmvec/mmvec.h"
 #include "qemu/int128.h"
 
diff --git a/target/hexagon/mmvec/macros.h b/target/hexagon/mmvec/macros.h
index 8c864e8c68..1201d778d0 100644
--- a/target/hexagon/mmvec/macros.h
+++ b/target/hexagon/mmvec/macros.h
@@ -18,7 +18,6 @@
 #ifndef HEXAGON_MMVEC_MACROS_H
 #define HEXAGON_MMVEC_MACROS_H
 
-#include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "arch.h"
 #include "mmvec/system_ext_mmvec.h"
-- 
2.39.0

