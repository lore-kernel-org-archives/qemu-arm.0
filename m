Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp944568ejb;
        Mon, 30 Jan 2023 05:28:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/d1cYQkpVTDyDYZJjVh2xv6eI7rY2hA/woIxD0fzlRmpI1ioGH8Pm89DpTbgbhWVqMgEiG
X-Received: by 2002:a0c:eb8b:0:b0:53d:a724:eba0 with SMTP id x11-20020a0ceb8b000000b0053da724eba0mr1015602qvo.6.1675085286497;
        Mon, 30 Jan 2023 05:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675085286; cv=none;
        d=google.com; s=arc-20160816;
        b=RG1wAbtXNvO6Zo6bCmtQPTAbA1+zW085fy1NP6n6el3pl92+D1PDT/1I0eHcE59U4x
         /WnlprCic6m93bLLWkm3jP5GvjJjDtMIchQfKJYsgBS6dZ4r6dtftc+JUS8Myj6eG3Y0
         VF//khZmEzGlCLMK7h2ZSsrbKKSGxKC4c1GcEL/WmRcIVut4RDt5zUwJrK/8NKMzHm7Y
         Ztdkmhld5E90dinlshfP1AORJepW5hOyog61qY9oQ8BHDyz1nzdvJdY+QPxZgf6W6SSt
         Ug/oZp/ikL7vCGWpn65LWkXXxxT3Ydv0fZbHZbJ3E73Mqa2xds6dpEK/ttCY0ymCnlK7
         bUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=njdrlkfxH32yQsnR9eaCCPDV60Cy31dsoohmWIZTBfU=;
        b=f7SfrLGWJUxYHPeL12rqv9xH5auWxhBmUyb9MmQ2YRCTBEBvyCbDjpit9JrnCdXGdC
         qDLT1u8Do/GjGMD6KM2Ooy1VHFrgP8rKeFQeAI8Snfb2QNwqRDe6LOFxbQOkNjvCNoU5
         skbyC2NvcVYrWQen/VaCsZ6vSNAnvQd26FuI2PFIE8TZjjBB2kHH30JSvhcJo/R/7b0x
         Jph9aPRV1IU7Sp/VfcY0OA3HzVn++rHPFfpuCiSkLUDGdE2z4gcO4krfWvcrJ/7Xa6bh
         qttNxsEEo45hbvp58rZVIQo/rkmB1fmikmlGv5oIA3wbtvvEI5S895VBdXFhGKxNo8vL
         LBrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FRCGsvQ0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv11-20020a05620a1b8b00b00722103385casi455729qkb.761.2023.01.30.05.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:28:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FRCGsvQ0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU7o-0006ON-Qj; Mon, 30 Jan 2023 08:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU72-0004uB-4A
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6o-0005kE-83
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njdrlkfxH32yQsnR9eaCCPDV60Cy31dsoohmWIZTBfU=;
 b=FRCGsvQ0IFO+x/sR1edfzn/N+q8NcTY6hUNfARF8ro5ylnG7XLyx56OEmyjmaOMKtoPkmP
 lFyjwqzeaK1HA6OoANS/rYcuE6gzOsat5+B2ry0rd9CWZ8Y+ohhJRHz7g32vUaE/xolxSg
 Wk6U6VWS7DnWDMZbXAuxVM1fvHEVu34=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-i4zfRAlfOz2kCM7dyMxnqg-1; Mon, 30 Jan 2023 08:22:00 -0500
X-MC-Unique: i4zfRAlfOz2kCM7dyMxnqg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F30929DD985;
 Mon, 30 Jan 2023 13:21:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77F1D40C2064;
 Mon, 30 Jan 2023 13:21:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6E11821E691A; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
Subject: [PATCH v5 16/20] accel: Clean up includes
Date: Mon, 30 Jan 2023 14:21:52 +0100
Message-Id: <20230130132156.1868019-17-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-TUID: b8ez1SkEDcjA

Clean up includes so that qemu/osdep.h is included first in .c, and
not in .h, and headers which it implies are not included manually.

This commit was created with scripts/clean-includes.

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

