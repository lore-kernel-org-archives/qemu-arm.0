Received: by 10.223.159.74 with SMTP id f10csp3372185wrg;
        Mon, 11 Dec 2017 20:16:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBougeyE2D55f8WrDTx4vrz9ngimxzdFSTSwxL+8eYTiGaj2Q1B1Y87hc8QHEZAnA02Y/WNQG
X-Received: by 10.37.142.6 with SMTP id p6mr1947601ybl.147.1513052161503;
        Mon, 11 Dec 2017 20:16:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513052161; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9uYFNwX/emnNi/u1T/HBYKk4K0fa4RmMvcsBIX8x6vczLfTPAuXA+vaAJg+KKGMpy
         Ab+ofI7Y6fPuoPz0MRNxwAW71MrrlF2avlZBW3/zbd/pr/JgCyQsgOVzTR32QEiOwT2f
         ct08MLbZFPYe4YStCXihAAUGVwgIpaleiADbhM71jcQNRMPICnQ0+owWK16Njtf3eTUH
         h+vXHmiBsGVRJV1nZm0fgRGvZ9Rx5wzKr8Q2jY8sF8nxlfVUUz/Es1WVgwVcnKXXaKtt
         jux8aJJeW9nmdELiFuX33BNHFWWXVCvNxSf4JvBGw4HS4Zhd1HRY0lcU9X9lsXpQLId7
         ZNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=A3QalbuDFzgR8gCP+1FOhzs13p+79W/Ja6VreWsCSzs=;
        b=JdOUDFMHqZbCWTleAKKufT8nn0NjzG0DuSUumZ0Hdjfst8sG6d4n1It1lk7twV6BDG
         1Q1/zBgXz3FAkvdv7ERkd8N6G6CUac/ltNTZRjEzuZpdOzheYtn87yU1hon8ttDXHDXu
         OhwsuFFZBMM5LHEWEeRg+v6BUBdhiCeWNmY4bMmNQdiqdZLdO3QLdVt+Hbo8IzWArm63
         fcZwpiwTN8FvevsSqt5st90MOIfGEm8N95Vy2oek5QcQf3mxZBIgBjcv0Q6yf850MwIB
         oUVmFkSjdYfUQmk2LcZ0RoS4JU+sZXEvf/Q+lxRrlHyQTeDs+eoBCARoUe9Q+q55c0jj
         x/fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t13si164332ybj.48.2017.12.11.20.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 20:16:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eObz6-0005W9-TK
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 23:16:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eObyx-0005Uc-Qu
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 23:15:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eObyt-0007zA-M8
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 23:15:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44750)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1eObyt-0007xt-7u; Mon, 11 Dec 2017 23:15:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25F997E42C;
	Tue, 12 Dec 2017 04:15:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-106.sin2.redhat.com
	[10.67.116.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2C2617B94;
	Tue, 12 Dec 2017 04:15:43 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Tue, 12 Dec 2017 09:45:39 +0530
Message-Id: <20171212041539.25700-1-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 12 Dec 2017 04:15:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v1] display: limit irq handler index to
 TC6393XB_GPIOS
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Moguofang <moguofang@huawei.com>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IlPB3DKSXgi5

From: Prasad J Pandit <pjp@fedoraproject.org>

The ctz32() routine could return value greater than
TC6393XB_GPIOS=16. This could lead to an OOB array access.
Mask 'level' to avoid it.

Reported-by: Moguofang <moguofang@huawei.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/display/tc6393xb.c | 1 +
 1 file changed, 1 insertion(+)

Update: mask 'level' value to TC6393XB_GPIOS=16
  -> https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg01685.html

diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 74d10af3d4..0ae63605f0 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -172,6 +172,7 @@ static void tc6393xb_gpio_handler_update(TC6393xbState *s)
     int bit;
 
     level = s->gpio_level & s->gpio_dir;
+    level &= MAKE_64BIT_MASK(0, TC6393XB_GPIOS);
 
     for (diff = s->prev_level ^ level; diff; diff ^= 1 << bit) {
         bit = ctz32(diff);
-- 
2.13.6

