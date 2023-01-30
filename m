Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp941349ejb;
        Mon, 30 Jan 2023 05:22:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8fJ0GHegKf5nAwJORRTx1lgcFiC3nRZcLnM4U9CotY5Lkx7+hubxvxnWR08GtnGxN2jt/h
X-Received: by 2002:a0c:9a41:0:b0:53e:63ad:6247 with SMTP id q1-20020a0c9a41000000b0053e63ad6247mr393252qvd.42.1675084978415;
        Mon, 30 Jan 2023 05:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675084978; cv=none;
        d=google.com; s=arc-20160816;
        b=tl8FczgeUcDRtURBtZsLeZZeLot5DvNVrW7SRLchifGMfuAx31fsBba38i0DahizZ3
         ILMREDb9juREiWHSCu3u5kAVghERg3kPoDgEoJO74UBKIzSUx5K5bgLk1o7uUbdem/bW
         Q6rsHfzZhaGTcDgUcZ5mTW7RymbYt21JFj5uS01LJOzSSAjMjWrwrnpT+kMkhRyYMvHX
         GY6VBh3QBvDU45Wqiip0XTDYfWm0WOg2UjSh+JV6cH3fNISEzDf0SAJxG1GOqP+2Ty/Y
         YhSxdBY4TgxzhUSJplLv6WLTaWuzP7rtB8pOmJ00KO0YW5f1Z6eLZ5p5AYrViVEXNl+a
         g5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UQUxkL7EuhNEBgL8q7w9wAIfDxyboEPhoa8v5slvyus=;
        b=PlxwCmLUFY/1x0jRwz0cHiiUHnSD0LgG6QpCnhCRzA6GTPXirX8TDI3f06kSD0zS/G
         Znuvromg+sdNkz0AWVIBJoqs+13Ygm5KXl3G4w0BskPnhOHEwvkunUpHi4NAVbVYIA75
         5614F1+qLyA0E3Zs8h7sJ5mlqlwXzSOiF7IJ52x/VLooYv0YRqRYoOKO53LVJ3gzdoiw
         xKctipkOpqC8s6KwRSjL4r1QvQQEnXHHwV5veNwB6HqdNGkiaX4m/SKp4jO/UaQSyX9Q
         AsLDlP0mmbc2+kUBRO09vVCzsweasmVWMuPvvIBLdv1RAQX5bto7HnkScAa7Ly2ae4QD
         l5Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VLKz6Lnb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020a0cff29000000b00498faf5a412si5926786qvt.35.2023.01.30.05.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 05:22:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VLKz6Lnb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMU6w-0004UR-G1; Mon, 30 Jan 2023 08:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6r-0004Gr-Lo
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:22:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6m-0005ic-Lg
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 08:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQUxkL7EuhNEBgL8q7w9wAIfDxyboEPhoa8v5slvyus=;
 b=VLKz6Lnb7res6uv5iKWHltL1Bj2UrezB03/Sl2jqcTNjcCLIGYSFfTwuKSr3NzRDlCPl1x
 JZ7aQ2uoH/nSfUyzG9vLy5p4Sbu9gGp8A/QPnzoiMvUL3Hn81HCejzxa9as1mB5YZ6ETr2
 P2fiaQ3tJFFZZpiM1060n8zbZ7YOHP4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-3ljnLZYbPuO1oQqLgo2xJQ-1; Mon, 30 Jan 2023 08:21:59 -0500
X-MC-Unique: 3ljnLZYbPuO1oQqLgo2xJQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93DC9802D19;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E21B492B05;
 Mon, 30 Jan 2023 13:21:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5619721E6A28; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
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
Subject: [PATCH v5 08/20] hw/input: Clean up includes
Date: Mon, 30 Jan 2023 14:21:44 +0100
Message-Id: <20230130132156.1868019-9-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
X-TUID: +A/o6O7IoZQu

Clean up includes so that qemu/osdep.h is included first in .c, and
not in .h, and headers which it implies are not included manually.

This commit was created with scripts/clean-includes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/input/pl050.h | 1 -
 hw/input/tsc210x.c       | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/hw/input/pl050.h b/include/hw/input/pl050.h
index 89ec4fafc9..4cb8985f31 100644
--- a/include/hw/input/pl050.h
+++ b/include/hw/input/pl050.h
@@ -10,7 +10,6 @@
 #ifndef HW_PL050_H
 #define HW_PL050_H
 
-#include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/input/ps2.h"
diff --git a/hw/input/tsc210x.c b/hw/input/tsc210x.c
index fdd5ff87d9..7eae5989f7 100644
--- a/hw/input/tsc210x.c
+++ b/hw/input/tsc210x.c
@@ -20,7 +20,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "hw/hw.h"
 #include "audio/audio.h"
 #include "qemu/timer.h"
-- 
2.39.0

