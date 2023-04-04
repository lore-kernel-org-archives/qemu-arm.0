Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp697345ejb;
        Tue, 4 Apr 2023 07:11:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350aAhoyXFZJmJb+oWOhXKaa+u6SmF8ONEF5E7SO+4msRcoVNlai6O1aQhrDTcn3KwKivXq+y
X-Received: by 2002:ac8:5c47:0:b0:3e1:5060:5c92 with SMTP id j7-20020ac85c47000000b003e150605c92mr3780640qtj.16.1680617472503;
        Tue, 04 Apr 2023 07:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680617472; cv=none;
        d=google.com; s=arc-20160816;
        b=fXajJyw5753dfLUOcIU5Fm2b7rtMgcggQ+AMmkUpZva4fXA2+OUP/ep0UiQs56E8aU
         ZavTeUkNNzGzL3alr2+SneNYKhedt9JUKe5RaKDoSx+rYxY4WRt1vo0LaaHIxdVsYt/X
         GiAXgY1XTrl0K3N+j6ZlPcOfMbodIPlpNc6Qnf1SuYPQe7Jxgh0j54qEdWCV8kfHaXk4
         sTuAIQx6UScKMqs/3dzJrlFxuHppgs2LsEqHWQyUHU695L4Qec7eflqOJjwpUVeMBy5T
         dSfVBcWpbVJ/0wdG5xnZW/gxMVMoqdv060QKRS+RguOThuDVQwaeoV3AEluV42Dupv+e
         iW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=7MhZCdxOWqRg1FQSAjzfe243LSHzp2YLf1r4MY1akDk=;
        b=hWymTLhwgYj+RUEvMcRFR4NhxbbSlbsZmjUKYdGPJ7HXZ0LaPKQY2JoZilgstCTz8o
         NrP3fj6Qc+m51Mfan/oQDFccWHaFvnc2cwSqbSiKHVmlqSe8j+CwFeoJhVv3+5wqFC3m
         wNUix54R2HCFV5MRS6X7/nCB18CuXaAoxn4ASVMfddl0+lJoT3OLZcH06OgaJG0jM4jJ
         nEgkN77UqD9MO758mLtKtA/7ccM2bdVO8xeE9tvAO5Or4zD3SZQ5f9jP/zRwXjhi37jU
         LNALCsAgr5wsS8++L6VzFciYDrDKoI28ivoguJvH+SXj9580PRMnF8zg8t7/zBCDLXLi
         ygLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r189-20020a3744c6000000b007423b0b4b0fsi7504435qka.644.2023.04.04.07.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Apr 2023 07:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pjhNA-0002Mn-Em; Tue, 04 Apr 2023 10:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangfeng@kylinos.cn>)
 id 1pjbMN-0000r7-1J; Tue, 04 Apr 2023 03:45:44 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangfeng@kylinos.cn>)
 id 1pjbMI-0007VI-Jg; Tue, 04 Apr 2023 03:45:42 -0400
X-UUID: 7109e155d15f4e1d9b90988a8f9b9732-20230404
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:c230e7ff-7383-4e37-9e3d-befd4212d63f, IP:15,
 URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:35
X-CID-INFO: VERSION:1.1.22, REQID:c230e7ff-7383-4e37-9e3d-befd4212d63f, IP:15,
 UR
 L:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:35
X-CID-META: VersionHash:120426c, CLOUDID:fcfcc3f7-ddba-41c3-91d9-10eeade8eac7,
 B
 ulkID:2304041545233UXU9CEP,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|102,
 TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 7109e155d15f4e1d9b90988a8f9b9732-20230404
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <jiangfeng@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 631463944; Tue, 04 Apr 2023 15:45:21 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: i.mitsyanko@gmail.com,
	peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH] exynos: Fix out-of-bounds access in exynos4210_gcomp_find
Date: Tue,  4 Apr 2023 15:45:06 +0800
Message-Id: <20230404074506.112615-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=124.126.103.232;
 envelope-from=jiangfeng@kylinos.cn; helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 04 Apr 2023 10:10:55 -0400
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
X-TUID: D6PpF+IwNdey

When 'res' equals -1, the array 's->g_timer.reg.comp[]' is accessed
out of bounds.

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 hw/timer/exynos4210_mct.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index c17b247da3..446bbd2b96 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -480,11 +480,14 @@ static int32_t exynos4210_gcomp_find(Exynos4210MCTState *s)
         res = min_comp_i;
     }
 
-    DPRINTF("found comparator %d: comp 0x%llx distance 0x%llx, gfrc 0x%llx\n",
-            res,
-            s->g_timer.reg.comp[res],
-            distance_min,
-            gfrc);
+    if (res >= 0) {
+        DPRINTF("found comparator %d: "
+                "comp 0x%llx distance 0x%llx, gfrc 0x%llx\n",
+                res,
+                s->g_timer.reg.comp[res],
+                distance_min,
+                gfrc);
+    }
 
     return res;
 }
-- 
2.39.2

