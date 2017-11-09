Received: by 10.223.150.237 with SMTP id u100csp2411456wrb;
        Thu, 9 Nov 2017 03:58:38 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QLAsr8rrUrNg/f92OoCjcAl3/HvRIarT/Yt6FG1mxHbdF+UVj1CrgzwBOzh4I4yJQU2YOi
X-Received: by 10.129.52.194 with SMTP id b185mr119257ywa.265.1510228718817;
        Thu, 09 Nov 2017 03:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510228718; cv=none;
        d=google.com; s=arc-20160816;
        b=oPB3B4NGSIR5I4mUbdOR8O7ZAX5HgwUKXHQ4fo60iC/GDTd8ox0QfnZt0KrrETgLUR
         wT+MWtTcqwB0UqKPYeqKexvGNGxUWmUTDZcKEuNYcEPVoJ4I3xk7MKr0mXZiKW+CcBnR
         eL689jdZVlb5FpSxCzT+ZTlMP7BMlFe1dZAekqSvaBJEje+HJxuqjQezhSNCFJeVfmmv
         ee3mcko8cRqiBu8pModmA32sIKomGqhxpOnbkyCr/2jQ8XLarUTsDjx38oUew7pN+dTD
         nFkiD9jwM7HD61HxlBU2ijavFObgEIAtqnMsepMKtbu0k1ITdqZ53CHHSObS5xPoclNn
         CYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=5M44p4xP/Y4PMw6Z5+BBbwlXqeNEN7moxoekyJi24RA=;
        b=ezONof2Z2eA8w/kfh9OSOw3Jls+qz41DF0odUl+XMiOl5CzfpbWncMJDILGvDw9vmj
         BI5bTerlgZq8+dGCfsGXLi8NrY0R+aTSAHFF5ByfhpVrZPN+pe0d8dK8QFkD/JzuR4JM
         pr6PFXZ/urGtT83jE7Rqib8znCuSeUuRy/6YlUjzefX1+VASPU8P1xWEN4LOw+tWJa+r
         FGDSl1nGBUFNIYTHz7wrWRoLwUmGqnYytY55iMgGBUF/VH4qon01O12MRNpU2X6kCXrW
         JXpmvzYIfsfVFcAK6y/ENFEisA4MeWH9kBDZLCNRHp1b5YcJQSuvrr7VgLDZkid/21hF
         XR2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t75si253089ywg.169.2017.11.09.03.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Nov 2017 03:58:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eClTi-0004l9-Bw
	for alex.bennee@linaro.org; Thu, 09 Nov 2017 06:58:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eClTb-0004l1-UL
	for qemu-arm@nongnu.org; Thu, 09 Nov 2017 06:58:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eClTY-0003PK-UC
	for qemu-arm@nongnu.org; Thu, 09 Nov 2017 06:58:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1eClTY-0003OW-OA; Thu, 09 Nov 2017 06:58:28 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA28699D5E;
	Thu,  9 Nov 2017 11:58:26 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-72.bne.redhat.com [10.64.54.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 994FA60012;
	Thu,  9 Nov 2017 11:58:21 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Thu,  9 Nov 2017 17:28:14 +0530
Message-Id: <20171109115814.28232-1-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 09 Nov 2017 11:58:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] highbank: validate register offset before access
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
X-TUID: ZN7Ww/puvcEI

From: Prasad J Pandit <pjp@fedoraproject.org>

An 'offset' parameter sent to highbank register r/w functions
could be greater than number(NUM_REGS=0x200) of hb registers,
leading to an OOB access issue. Add check to avoid it.

Reported-by: Moguofang (Dennis mo) <moguofang@huawei.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/arm/highbank.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 354c6b25a8..94df151454 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -117,6 +117,9 @@ static void hb_regs_write(void *opaque, hwaddr offset,
         }
     }
 
+    if (offset / 4 >= NUM_REGS) {
+        return;
+    }
     regs[offset/4] = value;
 }
 
@@ -124,6 +127,10 @@ static uint64_t hb_regs_read(void *opaque, hwaddr offset,
                              unsigned size)
 {
     uint32_t *regs = opaque;
+
+    if (offset / 4 >= NUM_REGS) {
+        return 0;
+    }
     uint32_t value = regs[offset/4];
 
     if ((offset == 0x100) || (offset == 0x108) || (offset == 0x10C)) {
-- 
2.13.6

