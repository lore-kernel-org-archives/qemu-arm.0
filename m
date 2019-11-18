Received: by 2002:a05:6512:48d:0:0:0:0 with SMTP id v13csp2260149lfq;
        Sun, 17 Nov 2019 17:55:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwvulFWkAqxFjmWQROPc0n1AWvlT1pESFLPwC1Jf4iLRh4dGbIUPThNDvqRgXvGnvGq5YSR
X-Received: by 2002:a05:620a:159b:: with SMTP id d27mr22361864qkk.381.1574042104559;
        Sun, 17 Nov 2019 17:55:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574042104; cv=none;
        d=google.com; s=arc-20160816;
        b=CeOLelWE5ttr+nr7vEMQA0+AbGJ+SxXtmN7IENCFXX3Q7s9eMq7EGbPlVq2ozLkons
         qnRZ6rPA5NhDQ6zwVhIYCCDxubNBcbvk6cRP5VT1Ef6eJEZLCEWbuTXDP2Hz5uMs9meG
         Y1KcMs49ivzs5bIcgsHwQJqWctWUQaPdA0KNxdB6SESdytof0SpISSOy4/LElU0v7WUT
         aaENGz/+tLPKPkyxfkmZRQh+HdehQXtcZOcuRUPzbBp68Mj9E/utSp4Y2n1AoPQnottT
         EB7fWlw6jCSGEdOkXFNRZnP8/V39ix8vJ7+varIKsWp9xdjvjZ6nMglypGFirDJLW/IX
         RySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=yYhZsgiBGW26NGza1O20FGMJ9rUcUVwp6rHNKI0/XQ8=;
        b=Ixr2FXU83DvaI+D1/pyxuBhCUd5qN7mvpF/yBp1Ae1MDhn2L+esHvJP3yhIYdtLQT4
         bUCUsuSGPq/AJYSVABxuVCY8jBYIb3ciJ3DMrXFYJPSlLg/dJgGKa2asZXHdqR3c9Kri
         vsKwzwnDDYxu9K3RxK3negH/wvfHcFeBuVQTcR7qPXz6obwD5KW+XQEG9zD1SaLQXM3N
         8aW86qWPjCimevKxL3bkU/Ve5IYfUT0KO5YbGxVVb+D7E6V8nje94EXAx+odwhlxKxMU
         c/NTKtB/6AkqrvB+sqdfHBaZetREf9Q780hPwRbDQq82tsnddeUkScVu9v+nWJa9sryE
         sC2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si10269138qkk.267.2019.11.17.17.55.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Nov 2019 17:55:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWWFs-0004kG-1s
	for alex.bennee@linaro.org; Sun, 17 Nov 2019 20:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iWWBm-0003ZG-9s
 for qemu-arm@nongnu.org; Sun, 17 Nov 2019 20:50:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iWWBk-0006ur-Uu
 for qemu-arm@nongnu.org; Sun, 17 Nov 2019 20:50:50 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:44354 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iWWBk-0006uK-KU; Sun, 17 Nov 2019 20:50:48 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 094F0E37F54E9B4B59E8;
 Mon, 18 Nov 2019 09:50:44 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Mon, 18 Nov 2019 09:50:36 +0800
From: <pannengyuan@huawei.com>
To: <david@gibson.dropbear.id.au>
Subject: [Qemu-devel][PATCH] ppc/spapr_events: fix potential NULL pointer
 dereference in rtas_event_log_dequeue
Date: Mon, 18 Nov 2019 09:50:13 +0800
Message-ID: <1574041813-35408-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
X-Mailman-Approved-At: Sun, 17 Nov 2019 20:54:54 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: zhang.zhanghailiang@huawei.com, PanNengyuan <pannengyuan@huawei.com>,
 kenny.zhangjun@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kuhn.chenqun@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OwSmU4LeiF76

From: PanNengyuan <pannengyuan@huawei.com>

source is being dereferenced before it is null checked, hence there is a
potential null pointer dereference.

This fixes:
        360
    CID 68911917: (NULL_RETURNS)
        361. dereference: Dereferencing "source", which is known to be
        "NULL".
        361        if (source->mask & event_mask) {
        362            break;
        363        }

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
---
 hw/ppc/spapr_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 0e4c195..febd2ef 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -358,7 +358,7 @@ static SpaprEventLogEntry *rtas_event_log_dequeue(SpaprMachineState *spapr,
             rtas_event_log_to_source(spapr,
                                      spapr_event_log_entry_type(entry));
 
-        if (source->mask & event_mask) {
+        if (source && (source->mask & event_mask)) {
             break;
         }
     }
-- 
2.7.2.windows.1


