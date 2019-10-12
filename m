Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1940033wrm;
        Sat, 12 Oct 2019 02:49:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyNz5w3fXiZIiIjwGG63tRfynbei+u6VZn4mlODq96ZuvKVFBX+4Qyl3R9Pyur5A/B2YaCK
X-Received: by 2002:a0c:f812:: with SMTP id r18mr20744825qvn.242.1570873753289;
        Sat, 12 Oct 2019 02:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570873753; cv=none;
        d=google.com; s=arc-20160816;
        b=QiDY2W9uLiEktzcSYifcX2yaOoOYymAk5/Ne3MAn2hHZP5Ea3LqdswqsPSwwnMgVjN
         e+Z0B7v5sn3GwfxjQ26beGMBxidAmM9CWFMGBFnJCRoo9RlZLenDaZ4BxCwnza6KjePh
         c6srM6TkGmGOYJLiPWmoTe136Ss22mwc1URUq+5e+FPkVh7N06ic6XpvjjG2SG2cNxts
         ULA8PJF5y+UYVa/4ZRvbXCbIRodzqnnoixZwOEDAwHTCA2HOr/Tfm+hjvsoC9YBjvdHJ
         aw0L5P13Chu1SQokmFpqPrvLvrH1ar7UOs5qFjTvU7+YXs9sOYz37GTBnkU4WBm8BEf7
         uAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=/4kPHx9gH3CsP5muAKRV+DPfO/CuNEIHdCdIUaipsww=;
        b=HmnSxTqVntapfjgPEZUyhTSVQh93ERJ+FbGndCtXx0gijIjUi7SDuS4slRVfVskAl4
         6IWx4hkQU4c8Gil0GTL0XA1jT+T27PD+BmxWbFaTCb+YJwYZX5vSN3a+uodgux8iJwpD
         A+m2cYX7cVNSs6+9n78Eyr7/qHVwQZVPjbKlEJuaawKewFjTMuZlsWL0piDrTyIEp2CR
         HahHLMjdNxZ+4CsxnNr1ykOj5jOkGZpgDDqLnd1SNWoRMEn0EVFwNjs8CyoV/p0lw2l+
         /PZamCo3a9CsyJ7hJzw/v1FC/eiV9OkWJ+pWnPlbDz1cnnnuavyx+cv8OA7N8gGKOBlh
         +2sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si11837998qkl.170.2019.10.12.02.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2019 02:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iJE1Q-00017m-PT
	for alex.bennee@linaro.org; Sat, 12 Oct 2019 05:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33043)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iJDwY-0005VX-RM
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:44:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iJDwX-0003ZK-OH
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:44:10 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:3533)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1iJDwX-0003Xy-48; Sat, 12 Oct 2019 05:44:09 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee55da1a04ed9c-4edaa;
 Sat, 12 Oct 2019 17:43:42 +0800 (CST)
X-RM-TRANSID: 2ee55da1a04ed9c-4edaa
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75da1a0478f4-669b4;
 Sat, 12 Oct 2019 17:43:42 +0800 (CST)
X-RM-TRANSID: 2ee75da1a0478f4-669b4
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 1/2] arm/smmuv3: use helper to be more easier to understand
 when using abstract QOM parent functions.
Date: Sat, 12 Oct 2019 17:43:22 +0800
Message-Id: <20191012094323.234788-2-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
References: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.80
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eric.auger@redhat.com, f4bug@amsat.org,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MlQ3fr9AohbC

Philippe introduced a series of helpers to make the
device class_init() easier to understand when a
device class change the parent hooks, device smmuv3
missed helper, so convert it.

Cc: eric.auger@redhat.com
Cc: peter.maydell@linaro.org
Cc: f4bug@amsat.org
Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 hw/arm/smmuv3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e2fbb8357e..65b6b158e5 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1465,8 +1465,7 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
 
     dc->vmsd = &vmstate_smmuv3;
     device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
-    c->parent_realize = dc->realize;
-    dc->realize = smmu_realize;
+    device_class_set_parent_realize(dc, smmu_realize, &c->parent_realize);
 }
 
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
-- 
2.17.1



