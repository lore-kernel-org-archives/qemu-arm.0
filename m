Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp941337ejb;
        Mon, 30 Jan 2023 05:22:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/L4FKileGilmdt47Pu0AgoPYZJSWrftXZYinz+tPY2ktLD9yS+VR8YPivw/1pnHVtj8l8o
X-Received: by 2002:ad4:5342:0:b0:539:cee8:198d with SMTP id v2-20020ad45342000000b00539cee8198dmr10709252qvs.14.1675084977467;
        Mon, 30 Jan 2023 05:22:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675084977; cv=none;
        d=google.com; s=arc-20160816;
        b=oHwDrsOkqeFEDR9IuUChwJK/2e18OxpBB1b/sZh470Zc8SXj9k+0oVvaPukoPVbJI5
         hmvWxB3uBLG9r42/Q4t9fy9CXABFzxQ4ZweALyZ2Hxdl/Jp49EPeQ5HN4F0zxGV4SNjA
         FU+wFvMTyfF6uAnAwZU7FNDCjXfEJYFsob0o0WvFgjnFwIvcqMS4w+u8tsKONBtF1hav
         rKxFPnWb500FGvg5I18Cljci93seampipvNulirS6Rb6ayiE9aG+leKPdnDkHROSyM+U
         Tuix6146Gk31Y9T3baJPLdZjANvUGbkUhB5EyB50zRvGzOK/MYpfeh6HAPMFa6iNAW+m
         d+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kQTECgeSjibAtcqpg1Jqu3tTDHdutMd7+vlY7cuVCHY=;
        b=n3TNEGy9AUoVAMiDC1eqFyBZYcOmaWLl1Ky4KAzXdWF8sC9m1D1WTocvkTjeyeHY+t
         /p5o45+6LCrhOd16RGZLiqPee+b/g9BAPVudiLGw4vlfbmsHX3QWV/+GideLQSatSkWX
         2vJhlLsdPwruUQpbpVZmBD7FrUvH2cj5EIk6qMMzmR3Wn+7rWy1dK5VcubSv+41BRis/
         0qh/16z7Rm6vQJOQudRxNYQsbQdS08BBYcXsssBZGM0mXMlx/yfxtehjJV2rF4zEXMoG
         gZx7v8+fuGYdPsepLBuS/Zhmloq3MtaUcz1AxUxEsBU7CQ96yihA1ddgtbsbiMfkZevO
         T1Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="I4/B7wpn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020ad45748000000b00535375fa464si6949877qvx.302.2023.01.30.05.22.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:22:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="I4/B7wpn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMU73-0004wG-6S; Mon, 30 Jan 2023 08:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6q-0004G9-Vc
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:22:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6m-0005iu-HF
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQTECgeSjibAtcqpg1Jqu3tTDHdutMd7+vlY7cuVCHY=;
 b=I4/B7wpnZIv1yTQXIV4PnVBXRPdI0wK/Jh+x4jrNL2Tt1Ed2OJKCMmv0Qe8pYsQ/Y7+PIf
 7JEqpL7Z2AYMxl36m+Yy5Uk/dLhJdOD9vgrZU54HWUTIuWWu5DvJoFS4ygvNz80TcLLhNp
 Sien1pSetQpLfAqgfLuXW9P4TWkWv0I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-xajR0OanO5OASfhLtGYGBA-1; Mon, 30 Jan 2023 08:21:59 -0500
X-MC-Unique: xajR0OanO5OASfhLtGYGBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BFB7101A52E;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7485840C2064;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5908921E6900; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
Subject: [PATCH v5 09/20] hw/tricore: Clean up includes
Date: Mon, 30 Jan 2023 14:21:45 +0100
Message-Id: <20230130132156.1868019-10-armbru@redhat.com>
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
X-TUID: KOc7zQO+1OX8

Clean up includes so that qemu/osdep.h is included first in .c, and
not in .h, and headers which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/tricore/triboard.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
index 094c8bd563..4fdd2d7d97 100644
--- a/include/hw/tricore/triboard.h
+++ b/include/hw/tricore/triboard.h
@@ -18,7 +18,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
-- 
2.39.0

