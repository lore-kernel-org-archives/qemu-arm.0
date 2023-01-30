Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp942210ejb;
        Mon, 30 Jan 2023 05:24:18 -0800 (PST)
X-Google-Smtp-Source: AK7set99KtUwbbPjLhxMU0lOGIoeil0gqtKKlV3syvDfQIsXwtqfPfPYM7ELQdjNuOCciJhGYOQH
X-Received: by 2002:ac8:5e4f:0:b0:3b8:200e:59dd with SMTP id i15-20020ac85e4f000000b003b8200e59ddmr20656719qtx.60.1675085058489;
        Mon, 30 Jan 2023 05:24:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675085058; cv=none;
        d=google.com; s=arc-20160816;
        b=lr+wcYRoCbUTfz10tgXbUvr4K2doIZsOyUMfFUlGJbp/Zmp7tMp+XO8tEFCYDUscLh
         8+0StQ6HhIX1vaNqxqwMJ6iSUQNC6Ctxcxc3JUhA+qWxxU11x2jy2Z567oSauXYwOo1z
         ZfI9+7N9CLOaEvmjFKts7qvWYNGenavUi5YtdYVNQMZzh+bxOchA2J9Id3zUgeAYbW4W
         LbXlCey/3u3+0cS2Zv6mPiH7XbEti0nEYwNUMLpdhik9/TEYhUPUSi9XXvS67ztgU7SV
         SjbfBfuG1Gu+3Y6APJ6P2UekXu3yRDvCRikVwE/U5jqrfhLRukaVs9mYncE00pbDrIuU
         xGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nNmPJ0oqTDzNS5sCVwjAetMvtyEs9SkbM5+kGaE45Go=;
        b=oc/pZq68CVkPPyqayWUb7UP7b44R2yibpFeYJW9lVj1xWTsO3k92MzpATKG0BVAF/r
         p5PpIQI4+QDLzPy05A9+4zxC2aBadGg3CsyaWtaPyUqrPeyFzu9ERVo2oBupI2h+k7YH
         2poJIBklZ3VNUWH8pQZjfu35PNw34oPiR8SBo8pWievkMZnuITLK7Ifocncivc/uDrqe
         0Wzzaa5203ODGAubwAz+Pnd/mEHCheu3gugmDHXziuwI9RXH9/8Nv8RpO7pQi182JaDj
         4IS2YnLrLEWLOkBsvfGiLAXrwmTZvLR5R7yvRssXwYZpjxBEk0zY52wQhuhja8ait21e
         Gl8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RhNahfGP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020ac86102000000b003b84c99e0a6si2565462qtm.565.2023.01.30.05.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:24:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RhNahfGP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU7w-0006qA-61; Mon, 30 Jan 2023 08:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU74-00052T-P5
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6o-0005kK-TK
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNmPJ0oqTDzNS5sCVwjAetMvtyEs9SkbM5+kGaE45Go=;
 b=RhNahfGPQWKa/beP6FHGRo7DmnUngovBCiSHKG6d4rhdJH/KsjM0C3Nstvw9hkdKudXK6V
 zEQNWngKlZMwOxduR8ja3gQmz4wm5eC5/E+HfQhkbhDQyMbnTONX+cpS4EdKpx5YuGwSkw
 nF+DF5YKRY7rFmyaJQFUhM8NrsZheC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-PCtyP2RAOnysF9uDZtnTHQ-1; Mon, 30 Jan 2023 08:21:59 -0500
X-MC-Unique: PCtyP2RAOnysF9uDZtnTHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89FBC8828C6;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63747422F2;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5017421E6A25; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
Subject: [PATCH v5 06/20] crypto: Clean up includes
Date: Mon, 30 Jan 2023 14:21:42 +0100
Message-Id: <20230130132156.1868019-7-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-TUID: 8B7PVWulunHn

Clean up includes so that qemu/osdep.h is included first in .c, and
not in .h, and headers which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 crypto/block-luks-priv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/crypto/block-luks-priv.h b/crypto/block-luks-priv.h
index dc2dd14e52..8fc967afcb 100644
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

