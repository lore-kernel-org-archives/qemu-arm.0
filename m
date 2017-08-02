Received: by 10.25.44.15 with SMTP id s15csp6357461lfs;
        Wed, 2 Aug 2017 09:48:33 -0700 (PDT)
X-Received: by 10.55.217.157 with SMTP id q29mr32456631qkl.152.1501692512989;
        Wed, 02 Aug 2017 09:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692512; cv=none;
        d=google.com; s=arc-20160816;
        b=imtU2jgMEeHSBP/mMYrgroNL59sw56Y1y6KUE0rFtMjs1+JPjS1dtJaESq8e/HBTQ5
         SnRDEkawUe+NNxnYVKuPtKcaA8cRW2Jbq+9JzNe35dYAFmwGwvhyLzONy52ej5lzFQfK
         LxL0ZrB/d+UftTTyLX9jRBwFiGVAVLOLeo8zHRrEcsXjFVSkDWyFjjkNcEHXhnrSMOFo
         7f9urgZzk4CLOJT/0gujsNgOpuHNAXtjQe+pOeFn17UyRDzGfokRP+qkz3ZS0yxkT1GN
         DGFJyHnDZT4BUbmU6m3spgVr7zHiU4pbTKVtXFg8mLyNHA3x5To6jJG2MRdQIiqqsu39
         NelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=NtaxEGKpc5UeLOSiIMNjB+coLoYkXUj/Nys4qeMJJb4=;
        b=z82FqMNLEvKS4dBPJ61antJG55XQxaSzeU6UyO3RyOjwVFVOhIIAOrwy7i9BSggukX
         EY4WzQd9543mkPQEw6a8ykmvlcDnihw5ku1Z1txbNWPNd+s6y8MggRF9a3cavge5Y7/n
         UffN9T7I0dLUZKJMb5y5RPqqi3x923uxFFR2oJXXbM9Q3fTcepmYjvn/Q9BSM1G1/xeB
         +UfqnSFiWNTthIJTC4qMUOT8smVrlBpuD5JehLKteFLWT3Ef47rIgpGZoBR6iOP/vjii
         DpgbW1s7EmZL55IxaWCJPdQ4W31ZrYgLK3j97FG2QtrEYJz6b9LTv4Uv6V8usr4Ck5qu
         CVlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d187si28808319qkf.474.2017.08.02.09.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwow-0006nM-DB
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:48:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlA-0003al-Ut
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlA-0004nJ-7Z
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwlA-0003zA-0F; Wed, 02 Aug 2017 12:44:36 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkf-0003xR-14; Wed, 02 Aug 2017 17:44:05 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:51 +0100
Message-Id: <1501692241-23310-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 05/15] hw/intc/armv7m_nvic.c: Remove out of date
 comment
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /tawTdOfkzR/

Remove an out of date comment which says there's only one
item in the NVIC container region -- we put systick into its
own device object a while back and so now there are two
things in the container.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 323e2d4..2e8166a 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1036,10 +1036,6 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
      *  0xd00..0xd3c - SCS registers
      *  0xd40..0xeff - Reserved or Not implemented
      *  0xf00 - STIR
-     *
-     * At the moment there is only one thing in the container region,
-     * but we leave it in place to allow us to pull systick out into
-     * its own device object later.
      */
     memory_region_init(&s->container, OBJECT(s), "nvic", 0x1000);
     /* The system register region goes at the bottom of the priority
-- 
2.7.4

